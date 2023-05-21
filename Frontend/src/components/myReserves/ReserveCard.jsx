import React from "react";

const ReserveCard = ({ styles, reserve }) => {
  return (
    <div className={styles.reserveCard}>
      <h1>{reserve.productName}</h1>
      <div>
        <p><span>Fecha de ingreso: </span>{reserve.checkIn}</p>
        <p><span>Fecha de salida: </span>{reserve.checkOut}</p>
        <p><span>Horario de ingres: </span>{reserve.startTime}</p>
      </div>
    </div>
  );
};

export default ReserveCard;
