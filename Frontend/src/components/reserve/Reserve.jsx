import React, { useState, useContext } from "react";
import UserInfo from "./UserInfo";
import styles from "./Reserve.module.css";
import ProductHeader from "../details/ProductHeader/ProductHeader";
import Calendar from "../details/Calendar/Calendar.jsx";
import ArrivalInfo from "./ArrivalInfo";
import Policies from "../details/ProductPolicies/Policies";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faLocationDot } from "@fortawesome/free-solid-svg-icons";
import CardStars from "../Home/CardSuggested/CardStars";
import axios from "axios";
import { apiReserve } from "../../utils/apiEndpoints";
import Swal from "sweetalert2";
import { GlobalContext } from "../../utils/globalContext";
import { useNavigate } from "react-router";

const reserve = () => {
  const [hourSelect, setHourSelect] = useState("");
  const product = JSON.parse(localStorage.getItem("productSelected"));
  const { state } = useContext(GlobalContext);
  const reservations = JSON.parse(localStorage.getItem("reservation"));
  const token = JSON.parse(localStorage.getItem("JWT"));
  const newReservation = [];
  const navigate = useNavigate("/myreserves");

  state.reservation.length === 2
    ? state.reservation.map((reservation) => {
        newReservation.push(reservation.replaceAll("/", "-"));
      })
    : reservations.map((reservation) => {
        newReservation.push(reservation.replaceAll("/", "-"));
      });

  const categoryTitle = `${product.category}`.toUpperCase();
  const onReserveConfirm = () => {
    axios
      .post(
        apiReserve,
        {
          startTime: hourSelect,
          checkIn: newReservation[0],
          checkOut: newReservation[1],
          productId: product.id,
        },
        {
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${token}`,
          },
        }
      )
      .then((response) => {
        console.log(response);

        const Toast = Swal.mixin({
          toast: true,
          position: "center",
          showConfirmButton: false,
          timer: 2500,
          width: "50%",
          didOpen: (toast) => {
            toast.addEventListener("mouseenter", Swal.stopTimer);
            toast.addEventListener("mouseleave", Swal.resumeTimer);
          },
        });

        Toast.fire({
          icon: "success",
          title: "¡Muchas gracias!",
          text: "Su reserva se ha realizado con exito",
        }).then(() => {
          navigate("/myreserves");
        });
      })
      .catch((error) => {
        console.log(error);
      });
  };

  return (
    <div className={styles.reserveGlobalContainer}>
      <ProductHeader generalInfo={product} />
      <p className={styles.dataFormTitle}>Completá tus datos</p>
      <div className={styles.reservePage}>
        <UserInfo styles={styles} />
        <div className={styles.reserveProduct}>
          <p>Detalles de la reserva</p>
          <div className={styles.cardContainer}>
            <img src={product.images[0]?.imageUrl} alt="imagen del producto" />
            <div>
              <div className={styles.productinformation}>
                <p className={styles.productCategory}>{categoryTitle}</p>
                <p className={styles.productTitle}>{product.title}</p>
                <CardStars {...product} styles={styles} />
                <div className={styles.productLocation}>
                  <FontAwesomeIcon icon={faLocationDot} />
                  <p>
                    {product.address?.street} {product.address?.number},{" "}
                    {product.address?.city}, {product.address?.state},{" "}
                    {product.address?.country}
                  </p>
                </div>
              </div>
              <div className={styles.reserveDates}>
                <hr />
                <div className={styles.reserveCheckIn}>
                  <p>Check in</p>
                  <p>
                    {" "}
                    {reservations && reservations.length === 2
                      ? reservations[0]
                      : state.reservation[0]}
                  </p>
                </div>
                <hr />
                <div className={styles.reserveCheckOut}>
                  <p>Check out</p>
                  <p>
                    {" "}
                    {reservations && reservations.length === 2
                      ? reservations[1]
                      : state.reservation[1]}
                  </p>
                </div>
                <hr />
              </div>
              <button
                className={styles.confirmReserveButton}
                onClick={onReserveConfirm}
              >
                Confirmar reserva
              </button>
            </div>
          </div>
        </div>
        <div className={styles.reserveCalendar}>
          <p>Seleccioná tu fecha de reserva</p>
          <Calendar styles={styles} reservations={product.availability} />
        </div>
        <div className={styles.arrivalTime}>
          <p>Tu Horario de llegada</p>
          <ArrivalInfo
            hourSelect={hourSelect}
            setHourSelect={setHourSelect}
            styles={styles}
          />
        </div>
      </div>
      <div className={styles.haveToKnow}>
        <p>Qué tenés que saber</p>
        <hr />
        <Policies policies={product.policy} styles={styles} />
      </div>
    </div>
  );
};

export default reserve;
