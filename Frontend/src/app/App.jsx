import React from "react";
import { Routes, Route } from "react-router-dom";
import Layout from "../routes/Layout";
import Home from "../routes/Home/Home";
import Login from "../routes/Login";
import Register from "../routes/Register";
import NotFound from '../routes/NotFound'
import ProductDetails from "../components/details/ProductDetails";
import Reserve from "../components/reserve/Reserve";
import "../index.css";
import FavComponent from "../components/favorites/FavComponent";
import AdminPage from "../components/administration/AdminPage";
import MyReserves from "../components/myReserves/MyReserves";
import AboutUs from "../components/aboutUs/AboutUs";

function App() {
  return (
    <Routes>
      <Route element={<Layout />}>
        <Route path="/" element={<Home />} />
        <Route path="/home" element={<Home />} />
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
        <Route path="/product/:id" element={<ProductDetails />} />
        <Route
          path="/product/:id/reserve"
          className="reserve"
          element={<Reserve />}
        />
        <Route path="/favorites" element={<FavComponent />} />
        <Route path="/administration" element={<AdminPage />} />
        <Route path="/myreserves" element={<MyReserves />} />
        <Route path="/aboutUs" element={<AboutUs />} />
        <Route path="/*" element={<NotFound />} />
      </Route>
    </Routes>
  );
}

export default App;
