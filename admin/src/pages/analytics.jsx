import React, { useEffect, useState } from "react";
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  Tooltip,
  ResponsiveContainer,
  LineChart,
  Line,
  CartesianGrid,
} from "recharts";

const rawData = [
  {
    type: "congestion",
    location: "Chenguvetty",
    id: 2,
    lastModified: "2025-07-26T02:11:44.545Z",
  },
  {
    type: "congestion",
    location: "puthoor",
    id: 3,
    lastModified: "2025-07-26T08:16:00.824Z",
  },
  {
    type: "congestion",
    location: "chettiyaankinar",
    id: 4,
    lastModified: "2025-07-26T05:16:08.898Z",
  },
  {
    location: "Pookieparamb",
    type: "congestion",
    id: 5,
    lastModified: "2025-07-26T02:16:53.393Z",
  },
  {
    type: "accident",
    location: "kooff",
    id: 6,
    lastModified: "2025-07-26T04:35:30.019Z",
  },
];

function groupByLocation(data) {
  const counts = {};
  data.forEach((entry) => {
    if (entry.type === "congestion") {
      counts[entry.location] = (counts[entry.location] || 0) + 1;
    }
  });
  return Object.entries(counts).map(([location, count]) => ({
    location,
    count,
  }));
}

function groupByHour(data) {
  const counts = {};
  data.forEach((entry) => {
    if (entry.type === "congestion") {
      const hour = new Date(entry.lastModified).getHours();
      counts[hour] = (counts[hour] || 0) + 1;
    }
  });
  return Object.entries(counts)
    .map(([hour, count]) => ({ hour: `${hour}:00`, count }))
    .sort((a, b) => parseInt(a.hour) - parseInt(b.hour));
}

export default function CongestionAnalytics() {
  const [locationData, setLocationData] = useState([]);
  const [timeData, setTimeData] = useState([]);

  console.log(locationData);

  useEffect(() => {
    setLocationData(groupByLocation(rawData));
    setTimeData(groupByHour(rawData));
  }, []);

  return (
    <div className="w-full min-h-screen bg-white flex flex-col p-10 pt-28">
      <div className="flex flex-col-2 gap-8 w-full h-full">
        <div className="flex-1 rounded">
          <h2 className="text-xl text-center mb-2">Congestion By Location</h2>
          <ResponsiveContainer width="100%" height={300}>
            <BarChart data={locationData}>
              <XAxis dataKey="location" />
              <YAxis />
              <Tooltip />
              <Bar dataKey="count" fill="#ff7300" />
            </BarChart>
          </ResponsiveContainer>
        </div>

        <div className="flex-1">
          <h2 className="text-xl text-center mb-2">
            Congestion By Time (Hour of Day)
          </h2>
          <ResponsiveContainer width="100%" height={300}>
            <LineChart data={timeData}>
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="hour" />
              <YAxis />
              <Tooltip />
              <Line
                type="monotone"
                dataKey="count"
                stroke="#8884d8"
                strokeWidth={2}
              />
            </LineChart>
          </ResponsiveContainer>
        </div>
      </div>
    </div>
  );
}
