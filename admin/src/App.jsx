import "./App.css";
import {
  createBrowserRouter,
  createRoutesFromElements,
  Route,
  RouterProvider,
} from "react-router-dom";
import { lazy } from "react";

import Layout from "./components/layout";

const AnalyticsPage = lazy(() => import("./pages/analytics.jsx"));
const AlertsPage = lazy(() => import("./pages/alerts.jsx"));

const router = createBrowserRouter(
  createRoutesFromElements(
    <Route element={<Layout />}>
      <Route path="/" element={<AnalyticsPage />} />
      <Route path="/analyze" element={<AnalyticsPage />} />
      <Route path="/alerts" element={<AlertsPage />} />
    </Route>,
  ),
);

function App() {
  return (
    <>
      <RouterProvider router={router} />
    </>
  );
}

export default App;
