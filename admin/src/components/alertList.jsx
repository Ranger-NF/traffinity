import AlertCard from "./alertCard.jsx";

const alertData = [
  {
    location: "Pookieparamb",
    type: "emergency",
    id: 5,
    lastModified: "2025-07-26T02:16:53.393Z",
  },
  {
    type: "congestion",
    location: "chettiyaankinar",
    id: 8,
    lastModified: "2025-07-26T05:52:26.381Z",
  },
  {
    type: "potholes",
    location: "kachadi",
    id: 9,
    lastModified: "2025-07-26T05:54:01.646Z",
  },
];

export default function AlertList() {
  return (
    <div className="flex flex-col gap-4 items-center py-8">
      {alertData.map((item) => (
        <AlertCard key={item.id} type={item.type} location={item.location} />
      ))}
    </div>
  );
}
