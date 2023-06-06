import React, { useContext } from "react";
import styles from "./CardCategory.module.css";
import { GlobalContext } from "../../../utils/globalContext";

const CardCategory = ( { id, title, quantity, imageUrl } ) => {
  const { dispatch } = useContext(GlobalContext);

  return (
    <div
      className={styles.sliderItem}
      onDoubleClick={() =>
        dispatch({
          type: "data",
          payload: { data: id, categorySelected: title },
        })
      }
    >
      <img src={imageUrl} alt="" />
      <div className={styles.categoryInfo}>
        <p className={styles.categoryTitle}>{title}</p>
        <p>{quantity} disponibles</p>
      </div>
    </div>
  );
};

export default CardCategory;
