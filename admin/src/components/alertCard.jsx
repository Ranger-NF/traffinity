import {
  IconActivity,
  IconCarCrash,
  IconTrafficCone,
  IconAlertTriangle,
  IconClockHour8,
  IconChevronRight,
} from "@tabler/icons-react";

const iconMap = {
  emergency: <IconActivity size={24} stroke={2} />,
  accident: <IconCarCrash size={24} stroke={2} />,
  congestion: <IconClockHour8 size={24} stroke={2} />,
  potholes: <IconTrafficCone size={24} stroke={2} />,
};

const bgMap = {
  emergency: "bg-red-400",
  accident: "bg-red-400",
  congestion: "bg-orange-300",
  potholes: "bg-yellow-200",
};

const borderMap = {
  emergency: "border-black",
  accident: "border-blue-600",
  congestion: "border-black",
  potholes: "border-gray-700",
};

export default function AlertCard({ type, location }) {
  const icon = iconMap[type] || <IconAlertTriangle size={24} />;
  const bg = bgMap[type] || "bg-gray-200";
  const border = borderMap[type] || "border-black";

  return (
    <div
      className={`flex items-center justify-between p-4 ${bg} ${border} border-4 rounded-lg w-full max-w-xl`}
    >
      <div className="flex items-center gap-3 text-lg font-bold">
        {icon}
        <span className="font-anton">
          {type.charAt(0).toUpperCase() + type.slice(1)} •{" "}
          <u>{location.charAt(0).toUpperCase() + location.slice(1)}</u>
        </span>
      </div>
      <IconChevronRight size={28} stroke={2.5} />
    </div>
  );
}
