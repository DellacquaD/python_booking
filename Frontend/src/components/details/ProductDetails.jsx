import React, { useContext, useEffect, useState } from "react";
import styles from "../details/ProductDetails.module.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faShareNodes,
  faHeart,
  faLocationDot,
} from "@fortawesome/free-solid-svg-icons";
import Gallery from "./Gallery/Gallery";
import ProductHeader from "./ProductHeader/ProductHeader";
import Description from "./ProductDescription/Description";
import Features from "./ProductFeatures/Features";
import Policies from "./ProductPolicies/Policies";
import Calendar from "./Calendar/Calendar";
import Map from "./Map/Map";
import CardStars from "../Home/CardSuggested/CardStars";
import { useNavigate, useParams } from "react-router";
import { apiProductById } from "../../utils/apiEndpoints";
import axios from "axios";
import { GlobalContext } from "../../utils/globalContext";
import Share from "./socialMediaShare/Share";

const ProductDetails = () => {
  const loggedUser = JSON.parse(localStorage.getItem("JWT"));
  const [product, setProduct] = useState(null);
  const { id } = useParams();
  const { state, handleFav } = useContext(GlobalContext);
  const [showSocialIcons, setShowSocialIcons] = useState(false);

  const reservation = JSON.parse(localStorage.getItem("reservation"));
  const navigate = useNavigate();
  useEffect(() => {
    axios
      .get(`${apiProductById}${id}`)
      .then((res) => setProduct(res.data))
      .catch((error) => {
        console.log(error);
        axios
          .get("/productID.json")
          .then((res) => setProduct(res.data))
          .catch((error) => console.log(error));
      });
  }, [id]);

  const ifNonUserReserv = () => {
    localStorage.setItem("ifNonUserReserv", JSON.stringify(true));
    localStorage.setItem(
      "productReservedInLocal",
      JSON.stringify(window.location.href)
    );
    navigate("/login");
  };

  const onProductSelect = () => {
    const productSelected = JSON.stringify(product);

    localStorage.setItem("productSelected", productSelected);

    if (state.reservation.length === 2 || reservation.length === 2) {
      if (state.reservation.length === 2) {
        localStorage.setItem("reservation", JSON.stringify(state.reservation));
      }
      {
        loggedUser
          ? navigate(`/product/${product.id}/reserve`)
          : ifNonUserReserv();
      }
    }
  };

  const handleSocialMedia = () => {
    setShowSocialIcons(!showSocialIcons);
  };

  return (
    <>
      {product ? (
        <div className={styles.detailsContainer}>
          <div className={styles.detailsHeader}>
            <ProductHeader generalInfo={product} />
          </div>
          <div className={styles.detailsBody}>
            <div className={styles.detailsLocationScoringInfo}>
              <div className={styles.detailsLocation}>
                <div className={styles.detailsLocationIcon}>
                  <FontAwesomeIcon icon={faLocationDot}></FontAwesomeIcon>
                </div>
                <div className={styles.detailsLocationInfo}>
                  <p>
                    {product.address?.street}, {""}
                    {product.address?.city}, {product.address?.country}
                  </p>
                  <p className={styles.detailsDistance}>A 940 m del centro</p>
                </div>
              </div>
              <div className={styles.detailsScoring}>
                <div className={styles.detailsReview}>
                  <p>{product.review}</p>
                  <CardStars {...product} styles={styles} />
                </div>
                <div className={styles.detailsScore}>
                  <p>{product.scoring}</p>
                </div>
              </div>
            </div>
            <div>
              <div className={styles.detailsShare}>
                <FontAwesomeIcon
                  className={styles.shareIcon}
                  icon={faShareNodes}
                  size="lg"
                  onClick={handleSocialMedia}
                ></FontAwesomeIcon>
                <div
                  className={
                    showSocialIcons
                      ? `${styles.socialIconsWrapper}`
                      : `${styles.hideSocialIconsWrapper}`
                  }
                >
                  <Share styles={styles} />
                </div>

                <FontAwesomeIcon
                  className={
                    styles.favIcon +
                    " " +
                    styles[
                      `full-${
                        state.favs?.find((fav) => fav.id === product.id)
                          ? true
                          : false
                      }`
                    ]
                  }
                  icon={faHeart}
                  onClick={
                    loggedUser
                      ? () => handleFav(product)
                      : () => navigate("/login")
                  }
                />
              </div>
              <div className={styles.detailsGalery}>
                <Gallery pictures={product.images} />
              </div>
            </div>
            <div className={styles.detailsDescription}>
              <h2>Alójate en el corazón de {product.address?.city}</h2>
              <Description data={product} />
            </div>
            <h2>¿Qué ofrece este lugar?</h2>
            <hr className={styles.detailsLine} />
            <div className={styles.detailsChar}>
              <Features styles={styles} specs={product.features} />
            </div>
            <div className={styles.detailsAvailableDates}>
              <h2>Fechas disponibles</h2>
              <Calendar
                product={product}
                styles={styles}
                reservations={product.reserve}
              />
              <div className={styles.reservationDetails}>
                <p>Agregá tus fechas de viaje para obtener precios exactos</p>
                <button
                  disabled={
                    (state.reservation.length <= 1 &&
                      reservation?.length === 0) ||
                    !reservation
                      ? true
                      : false
                  }
                  className={styles.reservationButton}
                >
                  <a
                    // href={`/product/${product.id}/reserve`}
                    onClick={onProductSelect}
                  >
                    Iniciar reserva
                  </a>
                </button>
              </div>
            </div>
            <div className={styles.detailsMap}>
              <h2>¿Dónde vas a estar?</h2>

              <hr className={styles.detailsLine} />
              <p>
                {product.address?.city}, {product.address?.country}
              </p>
              <Map address={product.address} />
            </div>
            <div className={styles.detailsPolicies}>
              <h2> ¿Qué tenés que saber?</h2>
              <hr className={styles.detailsLine} />
              <Policies policies={product.policy} styles={styles} />
            </div>
          </div>
        </div>
      ) : (
        ""
      )}
    </>
  );
};

export default ProductDetails;
