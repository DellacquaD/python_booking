/* eslint-disable react/prop-types */
import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faCircleCheck } from "@fortawesome/free-regular-svg-icons";
import HourSelector from "./HourSelector.jsx";

const ArrivalInfo = ({ styles, hourSelect, setHourSelect }) => {
  return (
    <div className={styles.arrivalGridContainer}>
      <div className={styles.arrivalCheckinMessage}>
        <FontAwesomeIcon icon={faCircleCheck} />
        <p>
          Tu habitación va a estar lista para el check-in entre las 10:00 AM y
          las 11:00 PM
        </p>
      </div>
      <div className={styles.arrivalSelectHours}>
        <p>Indicá tu horario estimado de llegada</p>
        <HourSelector
          hourSelect={hourSelect}
          setHourSelect={setHourSelect}
          styles={styles}
        />
      </div>
    </div>
  );
};

export default ArrivalInfo;
