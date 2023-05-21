import React, { useContext, useEffect, useState } from "react";
import { Link, useNavigate, useLocation } from "react-router-dom";
import Social from "../socials/Social";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faBars, faXmark } from "@fortawesome/free-solid-svg-icons";
import { faHeart } from "@fortawesome/free-regular-svg-icons";
import styles from "./Header.module.css";
import { GlobalContext } from "../../utils/globalContext";
import Favorites from "../favorites/Favorites";
import Spinner from "../favorites/Spinner";

const Header = () => {
  const loggedUser = JSON.parse(localStorage.getItem("JWT"));
  const location = useLocation();
  const [showFavsMenu, setShowFavsMenu] = useState(false);
  const [openMenu, setOpenMenu] = useState(false);
  const [loading, setLoading] = useState(false);
  const { state } = useContext(GlobalContext);
  const navigate = useNavigate();

  const handleMouseEnter = () => {
    loadFavs();
    setShowFavsMenu(true);
  };

  const handleMouseLeave = () => {
    setShowFavsMenu(false);
    setLoading(false);
  };

  const userInfo = JSON.parse(localStorage.getItem("userInfo"));

  const toggleMenu = () => {
    setOpenMenu(!openMenu);
  };

  const handleRegister = () => {
    navigate("/register");
    if (window.screen.width <= 600) {
      toggleMenu();
    }
  };

  const handleLogin = () => {
    navigate("/login");

    if (window.screen.width <= 600) {
      toggleMenu();
    }
  };

  const handleLogout = () => {
    const confirmLogout = confirm(
      "¿Estás seguro de que quieres cerrar la sesión?"
    );
    if (confirmLogout) {
      localStorage.removeItem("JWT");
      navigate("/");
    }
  };

  const handleMenu = () => {
    toggleMenu();
  };

  const handleFavs = () => {
    navigate("/favorites");
    if (window.screen.width <= 600) {
      toggleMenu();
    }
  };

  const handleReserve = () => {
    navigate("/myreserves");
    if (window.screen.width <= 600) {
      toggleMenu();
    }
  };

  const loadFavs = () => {
    if (!showFavsMenu)
      setTimeout(() => {
        setLoading(true);
      }, 1000);
  };

  return (
    <nav className="header">
      <Link to={"/"}>
        <div className={styles.logo}>
          <img
            src="https://i.ibb.co/W5J7Jy6/logo-orange.png"
            alt="Logo from Digital Booking"
          />
          <p className={styles.slogan}>Sentite como en tu hogar</p>
        </div>
      </Link>
      <button onClick={handleMenu} className={styles.hamburgerMenu}>
        <FontAwesomeIcon icon={faBars} size="2xl"></FontAwesomeIcon>
      </button>
      <div
        className={`${
          window.screen.width > 600 && !openMenu ? styles.navMenu : null
        } ${
          window.screen.width <= 600 && openMenu
            ? `${styles.navMenuMobile} ${styles.slideIn}`
            : styles.hideMenu
        }`}
      >
        <div className={styles.menuHeader}>
          <button onClick={handleMenu} className={styles.closeMenu}>
            <FontAwesomeIcon icon={faXmark}></FontAwesomeIcon>
          </button>
          <h3 className={`${loggedUser ? styles.hide : styles.menuHeading}`}>
            MENÚ
          </h3>
          {loggedUser ? (
            <div className={styles.profileInfo}>
              <div className={styles.logout}>
                <FontAwesomeIcon
                  onClick={handleLogout}
                  icon={faXmark}
                ></FontAwesomeIcon>
              </div>
              <div className={styles.profileInfoWeb}>
                <p className={styles.profileAvatar}>
                  {userInfo
                    ? userInfo.firstname.toUpperCase().slice(0, 1)
                    : null}
                  {userInfo
                    ? userInfo.lastname.toUpperCase().slice(0, 1)
                    : null}
                </p>
                <p className={styles.profileName}>
                  Hola, <br></br>
                  <span>
                    {userInfo ? userInfo.firstname : null}
                    {userInfo ? userInfo.lastname : null}
                  </span>
                </p>
              </div>
              <p className={styles.logoutMobile}>
                ¿Deseas <span onClick={handleLogout}>cerrar sesión</span>?
              </p>
              <hr />
            </div>
          ) : null}
        </div>
        {loggedUser ? (
          <>
            <div className={styles.buttonContainer}>
              {userInfo.role === "HOST" ? (
                <div
                  className={styles.administration}
                  onClick={() => navigate("/administration")}
                >
                  Administración
                </div>
              ) : (
                ""
              )}
              <div className={styles.reserveButton} onClick={handleReserve}>
                Reservas
              </div>
              <div
                onMouseEnter={handleMouseEnter}
                onMouseLeave={handleMouseLeave}
                className={
                  location.pathname === "/favorites"
                    ? styles.hide
                    : styles.favContainer
                }
              >
                <div className={styles.favIcon}>
                  <FontAwesomeIcon
                    onClick={handleFavs}
                    className={styles.fav}
                    icon={faHeart}
                    size="xl"
                  />
                  <p onClick={handleFavs} className={styles.favLink}>
                    Favoritos
                  </p>
                </div>
                <div
                  className={showFavsMenu ? styles.favsMenu : styles.noFavsMenu}
                >
                  <h4>Favoritos</h4>
                  {showFavsMenu && loading ? (
                    <div className={styles.showFavorite}>
                      <Favorites />
                      <div
                        className={
                          state.favngth === 0
                            ? styles.hideButton
                            : styles.favButtonDiv
                        }
                      >
                        <a href="/favorites">Ver todos</a>
                      </div>
                    </div>
                  ) : (
                    <Spinner />
                  )}
                </div>
              </div>
            </div>
          </>
        ) : (
          <div className={styles.formButtons}>
            <button
              className={
                location.pathname !== "/register"
                  ? `${styles.btn}`
                  : `${styles.hidden}`
              }
              onClick={handleRegister}
            >
              <p>Crear cuenta</p>
            </button>
            <hr
              className={
                location.pathname !== "/" || window.screen.width > 600
                  ? `${styles.hide}`
                  : `${styles.hr}`
              }
            />
            <button
              className={
                location.pathname === "/login"
                  ? `${styles.hidden}`
                  : `${styles.btn}`
              }
              onClick={handleLogin}
            >
              <p>Iniciar Sesión</p>
            </button>
          </div>
        )}
        <Social styles={styles} />
      </div>
    </nav>
  );
};

export default Header;
