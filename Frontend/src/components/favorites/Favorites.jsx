import React, { useContext, useEffect, useState } from "react";
import styles from "../favorites/Favorites.module.css";
import CardSuggested from "../Home/CardSuggested/CardSuggested";
import { GlobalContext } from "../../utils/globalContext";
import { useLocation, useNavigate } from "react-router";
const Favorites = () => {
  const { state } = useContext(GlobalContext);
  const location = useLocation();
  const navigate = useNavigate();

  return (
    <div
    >
      <div
        className={
          location.pathname === "/favorites"
            ? styles.favContainer
            : styles.favContainerHome
        }
      >
        {state.favs.length > 0 ? (
          state.favs.map((fav) => (
            <div key={fav.id}>
              <CardSuggested suggest={fav} styles={styles} />
            </div>
          ))
        ) : (
          <p className={styles.noFav}>No se encontraron resultados...</p>
        )}
      </div>
    </div>
  );
};

export default Favorites;
