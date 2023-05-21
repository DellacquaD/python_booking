import React, { createContext, useEffect, useReducer } from "react";

export const GlobalContext = createContext();

const getLocalStorage = () => {
  const localData = localStorage.getItem("favs");
  return localData ? JSON.parse(localData) : [];
};

const initialState = {
  data: 0,
  bd: [],
  city: "",
  reservation: [],
  favs: getLocalStorage(),
};

const reducer = (state, action) => {
  switch (action.type) {
    case "data":
      return {
        ...state,
        data: action.payload.data,
        categorySelected: action.payload.categorySelected,
      };
    case "bd":
      return { ...state, bd: action.payload };
    case "city":
      return { ...state, city: action.payload };
    case "reservation":
      return { ...state, reservation: action.payload };
    case "add_fav":
      return { ...state, favs: action.payload };
    default:
      return state;
  }
};

export const ContextProvider = ({ children }) => {
  const [state, dispatch] = useReducer(reducer, initialState);

  const handleFav = (suggest) => {
    const favs = JSON.parse(localStorage.getItem("favs"));
    if (favs) {
      const findFav = favs.find((fav) => fav.id === suggest.id);
      if (!findFav) {
        const newFav = [...favs, suggest];

        dispatch({ type: "add_fav", payload: newFav });
      } else {
        const index = favs.indexOf(findFav);
        const removeFav = favs.splice(index, 1);

        console.log(removeFav);

        dispatch({ type: "add_fav", payload: favs });
      }
    } else {
      dispatch({ type: "add_fav", payload: [suggest] });
    }
  };

  useEffect(() => {
    localStorage.setItem("favs", JSON.stringify(state.favs));
  }, [state.favs]);

  return (
    <GlobalContext.Provider value={{ state, dispatch, handleFav }}>
      {children}
    </GlobalContext.Provider>
  );
};
