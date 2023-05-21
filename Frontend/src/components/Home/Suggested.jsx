import React, { useEffect, useContext, useState } from "react";
import CardSuggested from './CardSuggested/CardSuggested';
import { GlobalContext } from "../../utils/globalContext";
import styles from "../Home/Suggested.module.css";
import axios from "axios";
import {
  apiProductByCategory,
  apiProductRandom,
  apiProductByCityAndDates,
} from "../../utils/apiEndpoints";

const Suggested = () => {
  const { state, dispatch } = useContext(GlobalContext);
  const [ suggestMessage, setSuggestMessage ] = useState(null)

  const reservations = JSON.parse(localStorage.getItem("reservation"));
  const newReservation = [];
  reservations?.map((reservation) => {
    newReservation.push(reservation.replaceAll("/", "-"));
  });

  useEffect(() => {
    const fetchData = async () => {
      if (state.data === 0 && !state.city) {
        try {
          const res = await axios.get(apiProductRandom);
          dispatch({ type: "bd", payload: res.data });
          setSuggestMessage('Recomendaciones')
        } catch (error) {
          console.log(
            "Error al obtener datos de la API. Usando datos estáticos..."
          );
          const fallbackData = await axios.get("/apiProducts.json");
          dispatch({ type: "bd", payload: fallbackData.data });
          setSuggestMessage('Recomendaciones')
        }
      } else if (state.data > 0) {
        try {
          const res = await axios.get(`${apiProductByCategory}${state.data}`);
          dispatch({ type: "bd", payload: res.data });
          setSuggestMessage(`Estas son nuestras recomendaciones de ${state.categorySelected}`)
        } catch (error) {
          console.log(
            "Error al obtener datos de la API. Usando datos estáticos..."
          );
          const fallbackData = await axios.get("/apiProducts.json");
          dispatch({ type: "bd", payload: fallbackData.data });
          setSuggestMessage(`Estas son nuestras recomendaciones de ${state.categorySelected}`)
        }
      } else {
        try {
          const res = await axios.get(
            `${apiProductByCityAndDates}${state.city}/${newReservation[0]}/${newReservation[1]}`
          );
          dispatch({ type: "bd", payload: res.data });
          setSuggestMessage(`Estas son nuestras recomendaciones para ${state.city} con disponiblidad entre ${newReservation[0]} y ${newReservation[1]}`)
        } catch (error) {
          if (error.response.status === 500) {
            setSuggestMessage(`No encontramos resultados para ${state.city} en las fechas seleccionadas, pero te dejamos estas recomendaciones que pueden ser de tu interes: `)
            try {
              const res = await axios.get(apiProductRandom);
              dispatch({ type: "bd", payload: res.data });
            } catch (error) {
              console.log('Tomando datos de json estatico');
              const fallbackData = await axios.get("/apiProducts.json");
              dispatch({ type: "bd", payload: fallbackData.data });
            }
          } 
          }
      }
    };
    fetchData();
  }, [state.data, state.city]);

  return (
    <section className={styles.suggestedMainContainer}>
      <p className={styles.recomendationContainer}>{suggestMessage}</p>
      <section className={styles.suggestedRenderContainer}>
        {state.bd?.map((suggest) => (
          <CardSuggested key={suggest.id} suggest={suggest} styles={styles} />
        ))}
      </section>
    </section>
  );
};

export default Suggested;
