import React, { useContext } from "react";
import styles from "./CardCategory.module.css";
import { GlobalContext } from "../../../utils/globalContext";

const Carousel = (category) => {
  const { dispatch } = useContext(GlobalContext);

  return (
    <div
      className={styles.sliderItem}
      onDoubleClick={() =>
        dispatch({
          type: "data",
          payload: { data: category.id, categorySelected: category.title },
        })
      }
    >
      <img src={category.imageUrl} alt="" />
      <div className={styles.categoryInfo}>
        <p className={styles.categoryTitle}>{category.title}</p>
        <p>{category.quantity} disponibles</p>
      </div>
    </div>
  );
};

export default Carousel;
