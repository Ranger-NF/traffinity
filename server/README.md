# 📡 Traffic Alert API + WebSocket Documentation

> 🚀 Base URL: `http://localhost:3000`

---

## 📦 REST API Endpoints

---

### 🔁 `GET /route`

**Description:** Returns a list of route data with traffic info.

**Response Example:**

```json
[
  {
    "from": "Point A",
    "to": "Point B",
    "duration_min": 10,
    "traffic_delay_min": 3,
    "duration_with_traffic": 13,
    "congestion_level": "Moderate"
  }
]
```

---

### 📄 `GET /reports`

**Description:** Returns the current list of all active reports (traffic & emergency).

**Response Example:**

```json
[
  {
    "type": "potholes",
    "location": "Main Street",
    "id": 0,
    lastModified: ISO Date & Time format
  }
]
```

---

### 🚨 `POST /report`

**Description:** Submit a new traffic report.

**Body:**

```json
{
  "type": "potholes", // or "accident", "congestion"
  "location": "Highway 1 near exit 5",
}
```

**Response:**

```json
{
  "type": "potholes",
  "location": "Highway 1 near exit 5",
  "id": 1,
  lastModified: ISO Date & Time format
}
```

---

### 🛠️ `PUT /report`

**Description:** Update an existing traffic report.

**Body:**

```json
{
  "id": 1,
  "type": "accident",
  "location": "Updated location",
  lastModified: ISO Date & Time format
}
```

**Note:** Only allowed types: `"potholes"`, `"accident"`, `"congestion"`

---

### ✅ `POST /resolve`

**Description:** Resolve a normal (non-emergency) report.

**Body:**

```json
{
  "id": 1
}
```

---

### 🚑 `POST /emergency`

**Description:** Submit an emergency report.

**Body:**

```json
{
  "location": "NH Bypass near bridge"
}
```

> `type` is automatically set to `"emergency"`.

**Response:**

```json
{
  "location": "NH Bypass near bridge",
  "type": "emergency",
  "id": 4,
  lastModified: ISO Date & Time format
}
```

---

### 🆘 `POST /resolve/emergency`

**Description:** Resolve an emergency report.

**Body:**

```json
{
  "id": 4
}
```

---

## 📢 WebSocket Events

> Connect using:

```js
const socket = io("http://localhost:3000");
```

| Event Name          | Payload Example                       | Description                           |
| ------------------- | ------------------------------------- | ------------------------------------- |
| `new_report`        | `{ id, type, location }`              | Broadcast when new report added       |
| `update_report`     | `{ id, type, location }`              | Sent when a report is updated         |
| `resolve_report`    | `id` (number)                         | Sent when a normal report is resolved |
| `emergency_report`  | `{ id, type: "emergency", location }` | Broadcast when emergency reported     |
| `resolve_emergency` | `id` (number)                         | Sent when emergency report resolved   |

---

## ✅ Alert Types (for `/report` only)

* `"potholes"`
* `"accident"`
* `"congestion"`

---

## 🧠 Tip for Frontend Devs

Use the WebSocket to **live-update your UI**:

```js
socket.on("new_report", (data) => {
  // Add to map or UI list
});

socket.on("resolve_report", (id) => {
  // Remove from UI
});
```
