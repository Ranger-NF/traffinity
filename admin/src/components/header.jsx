export default function Header({ activeTab, onTabChange }) {
  return (
    <div className="bg-cyan-300 w-full p-4 flex justify-center">
      <div className="flex bg-white border-4 border-black rounded-full overflow-hidden">
        <button
          onClick={() => onTabChange("alerts")}
          className={`px-6 py-2 font-bold transition-all duration-200 ${
            activeTab === "alerts"
              ? "bg-black text-white"
              : "bg-white text-black"
          }`}
        >
          Alerts
        </button>
        <button
          onClick={() => onTabChange("analyze")}
          className={`px-6 py-2 font-bold transition-all duration-200 ${
            activeTab === "analyze"
              ? "bg-black text-white"
              : "bg-white text-black"
          }`}
        >
          Analyze
        </button>
      </div>
    </div>
  );
}
