import { Outlet } from "react-router-dom";
import Header from "./header";
import { useState } from "react";
import { useEffect } from "react";
import { useNavigate } from "react-router-dom";

function Layout() {
  const [activeTab, setActiveTab] = useState("analyze");

  const navigate = useNavigate();

  useEffect(() => {
    navigate("/" + activeTab);
  }, [activeTab]);

  return (
    <div className="grid w-full">
      <Header activeTab={activeTab} onTabChange={setActiveTab} />
      <Outlet />
    </div>
  );
}

export default Layout;
