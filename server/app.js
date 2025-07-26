const express = require("express");
const fs = require("fs");
const http = require("http");
const { Server } = require("socket.io");

const app = express();

const server = http.createServer(app);
const io = new Server(server, {
  cors: {
    origin: "*",
  },
});
const PORT = 3000;

app.use(express.json());

// Google's route matrix API replacement (As the API requires billing address)
const loadRoutes = () => {
  const data = fs.readFileSync("./routes.json");
  const routes = JSON.parse(data);

  return routes.map((route) => {
    const totalDuration = route.duration_min + route.traffic_delay_min;
    let level = "Clear";
    if (route.traffic_delay_min > 5) level = "High";
    else if (route.traffic_delay_min > 2) level = "Moderate";
    return {
      ...route,
      duration_with_traffic: totalDuration,
      congestion_level: level,
    };
  });
};

const alertTypes = ["potholes", "accident", "congestion"];

let reports = [];
let reportId = 0;

const REPORTS_FILE = "./reports.json";

const saveReports = () => {
  fs.writeFileSync(REPORTS_FILE, JSON.stringify(reports, null, 2));
};

const loadReports = () => {
  if (fs.existsSync(REPORTS_FILE)) {
    const data = fs.readFileSync(REPORTS_FILE);
    reports = JSON.parse(data);
    if (reports.length > 0) {
      reportId = Math.max(...reports.map((r) => r.id)) + 1;
    }
  }
};

setInterval(saveReports, 10_000); // Saving every 10 seconds

app.get("/route", (req, res) => {
  const matrix = loadRoutes();
  res.json(matrix);
});

app.get("/reports", (req, res) => {
  res.json(reports);
});

app.post("/report", (req, res) => {
  const { type, location } = req.body;

  if (!alertTypes.includes(type)) {
    return res.status(400).json({ error: "Invalid report type" });
  }

  const report = {
    type,
    location,
    id: reportId++,
  };

  reports.push(report);
  io.emit("new_report", report);
  res.status(201).json(report);
});

app.put("/report", (req, res) => {
  const updated = req.body;

  if (!alertTypes.includes(updated.type)) {
    return res.status(400).json({ error: "Invalid report type" });
  }

  let found = false;
  reports = reports.map((r) => {
    if (r.id === updated.id) {
      found = true;
      return updated;
    }
    return r;
  });

  if (!found) {
    return res.status(404).json({ error: "Report not found" });
  }

  io.emit("update_report", updated);
  res.json({ success: true });
});

app.post("/resolve", (req, res) => {
  const { id } = req.body;
  const reportIndex = reports.findIndex(
    (r) => r.id === id && r.type !== "emergency",
  );

  if (reportIndex === -1) {
    return res.status(404).json({ error: "Report not found" });
  }

  const [removed] = reports.splice(reportIndex, 1); // 🧹 Remove it
  io.emit("resolve_report", id);
  res.json({ success: true, removed });
});

app.post("/emergency", (req, res) => {
  const emergency = {
    ...req.body,
    type: "emergency",
    id: reportId++,
  };

  reports.push(emergency);
  io.emit("emergency_report", emergency);
  res.status(201).json(emergency);
});

app.post("/resolve/emergency", (req, res) => {
  const { id } = req.body;

  const reportIndex = reports.findIndex(
    (r) => r.id === id && r.type === "emergency",
  );

  if (reportIndex === -1) {
    return res.status(404).json({ error: "Emergency report not found" });
  }

  const [removed] = reports.splice(reportIndex, 1);
  io.emit("resolve_emergency", id);
  res.json({ success: true, removed });
});

loadReports();

server.listen(PORT, () => {
  console.log(`✅ Server running at http://localhost:${PORT}`);
});
