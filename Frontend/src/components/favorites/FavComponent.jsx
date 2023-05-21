import React from "react";
import Favorites from "./Favorites";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import "./FavComponent.css";
import { useNavigate } from "react-router";

const FavComponent = () => {
  const navigate = useNavigate();

  const goBack = () => {
    navigate("/");
  };

  return (
    <div>
      <div className="favWrapper">
        <div className="favHeader">
          <h1>Favoritos</h1>
          <FontAwesomeIcon
            onClick={goBack}
            inverse
            icon={faChevronLeft}
            size="2xl"
          />
        </div>
        <h2>Mi próximo viaje</h2>

        <Favorites />
      </div>
    </div>
  );
};

export default FavComponent;
