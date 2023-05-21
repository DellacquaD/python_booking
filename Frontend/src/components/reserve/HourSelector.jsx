/* eslint-disable react/prop-types */
import React, { useState } from "react";
import { faChevronDown } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import useComponentVisible from "../../hooks/useComponentVisible";

const checkInHours = [
  {
    type: "am",
    hours: ["10:00", "11:00", "12:00"],
  },
  {
    type: "pm",
    hours: [
      "13:00",
      "14:00",
      "15:00",
      "16:00",
      "17:00",
      "18:00",
      "19:00",
      "20:00",
      "21:00",
      "22:00",
      "23:00",
    ],
  },
];

const HourSelector = ({ styles, hourSelect, setHourSelect }) => {
  const { selectorRef, isActive, setIsActive } = useComponentVisible(false);

  return (
    <div>
      <form action="" className={styles.formClass}>
        <div
          ref={selectorRef}
          className={styles.selectbox}
          onClick={() => setIsActive((prev) => !prev)}
        >
          <div id={styles.select} className={styles.select}>
            <div className={styles.selectContent}>
              <div className={styles.messageToRender}>
                <p>
                  {`${hourSelect}`
                    ? `${hourSelect}`
                    : "Seleccionar tu hora de llegada"}
                </p>
              </div>
            </div>
            <FontAwesomeIcon icon={faChevronDown} />
          </div>
          <div
            id={styles.options}
            className={isActive ? `${styles.active}` : `${styles.inActive}`}
          >
            {checkInHours.map((amPm) => {
              return (
                <div key={amPm.type}>
                  {amPm.hours.map((hour) => {
                    return (
                      <div key={hour} className={styles.contentOption}>
                        <p
                          onClick={() => {
                            setHourSelect(`${hour}:00`);
                          }}
                        >
                          {`${hour} hs`}
                        </p>
                      </div>
                    );
                  })}
                </div>
              );
            })}
          </div>
        </div>
      </form>
    </div>
  );
};

export default HourSelector;
