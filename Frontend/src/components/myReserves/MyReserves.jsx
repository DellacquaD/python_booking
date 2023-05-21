import React, { useEffect, useState } from "react";
import styles from "./MyReserves.module.css";
import ReserveCard from "./ReserveCard";
import { apiMyReserves } from "../../utils/apiEndpoints";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { useNavigate } from "react-router";
import axios from 'axios'

const MyReserves = () => {
  const [reserves, setReserves] = useState([]);
  const token = JSON.parse(localStorage.getItem("JWT"));

  const navigate = useNavigate();

  const goBack = () => {
    navigate("/");
  };

    useEffect(() => {
      axios
        .get(apiMyReserves, {
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${token}`,
          },
        })
        .then((response) => {
          console.log(response);
          setReserves(response.data);
        })
        .catch((error) => {
          console.log(error);
        });
    }, []);
    

  return (
    <div className={styles.reserveWrapper}>
      <div className={styles.reserveHeader}>
        <h3>Mis reservas</h3>
        <FontAwesomeIcon
          onClick={goBack}
          inverse
          icon={faChevronLeft}
          size="2xl"
        />
      </div>
      <div className={styles.reserveCardContainer}>
        {reserves.map((reserve, i) => {
          return (
            <div key={i}>
              <ReserveCard reserve={reserve} styles={styles} />
            </div>
          )
        })}
      </div>
    </div>
  );
};

export default MyReserves;
