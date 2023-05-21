/* eslint-disable react/prop-types */
import React, { useContext, useState } from "react";
import CardStars from "./CardStars";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faLocationDot,
  faHeart,
  faXmark,
} from "@fortawesome/free-solid-svg-icons";

import Features from "../../details/ProductFeatures/Features";
import { GlobalContext } from "../../../utils/globalContext";
import { useNavigate } from "react-router";

const CardSuggested = ({ suggest, styles }) => {
  const { state, handleFav } = useContext(GlobalContext);
  const [openLogin, setOpenLogin] = useState(false);
  const navigate = useNavigate();
  const user = JSON.parse(localStorage.getItem("JWT"));
  const handleClickMap = () => {
    window.open(
      `https://www.google.com/maps/embed/v1/place?key=AIzaSyDO5woQG6Ni56if3gOVoVoP3coiwxg4huI
  &q=${suggest.address.street}+${suggest.address.number},${suggest.address.city}+${suggest.address.state}+${suggest.address.country}&zoom=19`,
      "register",
      'width=800,height=600, top=0, left=960"'
    );
    return false;
  };

  const handleReserv = () => {
    window.location.href = `/product/${suggest.id}`;
  };

  const handleRedirect = () => {
    setOpenLogin(!openLogin);

    handleFav(suggest);
    localStorage.setItem("goToFavs", JSON.stringify(true));
  };

  const handleFavorites = () => {
    user ? handleFav(suggest) : handleRedirect();
  };

  const closePopUp = () => {
    setOpenLogin(!openLogin);
    localStorage.removeItem("goToFavs");
  };

  return (
    <div className={styles.cardContainer}>
      <div
        className={
          openLogin ? `${styles.loginFavContainer}` : `${styles.hideLogin}`
        }
      >
        <div className={styles.loginFav}>
          <button className={styles.closePopup} onClick={closePopUp}>
            <FontAwesomeIcon icon={faXmark} size="2xl"></FontAwesomeIcon>
          </button>
          <img
            src="https://i.ibb.co/W5J7Jy6/logo-orange.png"
            alt="Logo from Digital Booking"
          />
          <h2>¡Te damos la bienvenida a Db!</h2>
          <h4>Inicia sesión para organizar tu viaje</h4>
          <div className={styles.loginRegisterButtons}>
            <a className={styles.loginButtonFav} href="/login">
              Iniciar sesión
            </a>
            <p>
              ¿Aún no tienes cuenta?{" "}
              <a href="/register" className={styles.registerButtonFav}>
                Registrate
              </a>
            </p>
          </div>
        </div>
      </div>
      <FontAwesomeIcon
        className={
          styles.favIcon +
          " " +
          styles[
            `full-${
              state.favs?.find((fav) => fav.id === suggest.id) && user
                ? true
                : false
            }`
          ]
        }
        icon={faHeart}
        onClick={handleFavorites}
      />
      <section>
        <img src={suggest.images[0]?.imageUrl} />
        <div className={styles.cardInformation}>
          <div className={styles.cardTitle}>
            <div className={styles.productCategoryNameAndStars}>
              <p className={styles.productCategory}>
                {suggest.category?.toUpperCase()}
              </p>
              <CardStars {...suggest} styles={styles} />
              <p id={styles.suggestName}>{suggest.title}</p>
            </div>
            <div className={styles.valorationInfo}>
              <p>{suggest.scoring}</p>
              <p className={styles.review}>{suggest.review}</p>
            </div>
          </div>
          <div className={styles.cardLocation} id={styles.cardLocation}>
            <div>
              <FontAwesomeIcon icon={faLocationDot} />
              <p>a 300m del centro</p>
            </div>
            <div className={styles.onClickMap} onClick={handleClickMap}>
              <p>MOSTRAR EN EL MAPA</p>
            </div>
          </div>
          <div className={styles.cardAddress} id={styles.cardAddress}>
            <div>
              <FontAwesomeIcon icon={faLocationDot} />
              <p>
                {suggest.address.street} {suggest.address.number},{" "}
                {suggest.address.city}, {suggest.address.state},{" "}
                {suggest.address.country}
              </p>
            </div>
          </div>
          <Features
            className={styles.serviceIcons}
            styles={styles}
            specs={suggest.features}
          />
          <div id={styles.cardDescription}>
            {suggest.description?.length > 30 ? (
              <p>
                {suggest.description.substring(0, 30)}
                <a className={styles.moreText} href="#">
                  {" "}
                  mas...
                </a>
              </p>
            ) : (
              <p>{suggest.description}</p>
            )}
          </div>
          <div className={styles.seeMore}>
            <button>
              <a onClick={handleReserv}>ver más</a>
            </button>
          </div>
        </div>
      </section>
    </div>
  );
};

export default CardSuggested;
