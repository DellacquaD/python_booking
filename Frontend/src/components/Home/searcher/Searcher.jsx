import React, { useContext, useState } from "react";
import styles from "./Searcher.module.css";
import SelectorTarget from "./SelectorTarget";
import DatePick from "./DatePick";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faCalendarDay } from "@fortawesome/free-solid-svg-icons";
import { GlobalContext } from "../../../utils/globalContext";

const Searcher = () => {
  const [selected, setSelected] = useState("");
  const { state, dispatch } = useContext(GlobalContext);
  const [citySelected, setCitySelected] = useState("")

  const handleSelectCity = () => {
    dispatch({ type: "city", payload: selected.split(",")[0] });
    dispatch({ type: "data", payload: "-1" });
  };


  return (
    <section className={styles.searcher}>
      <h1>Busca ofertas en hoteles, casas y mucho más</h1>
      <section className={styles.searcherInputGrid}>
        <div className={styles.locationContainer}>
          <SelectorTarget selected={selected} setSelected={setSelected} styles={styles}/>
        </div>
        <div className={styles.calendar} id={styles.calendar}>
          <FontAwesomeIcon icon={faCalendarDay} />
          <DatePick />
        </div>
        <button
          onClick={handleSelectCity}
          disabled={selected ? false : true}
          id={styles.btnSearch}
        >
          Buscar
        </button>
      </section>
    </section>
  );
};

export default Searcher;
