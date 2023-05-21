import React, { useState, useEffect } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faLocationDot } from "@fortawesome/free-solid-svg-icons";
import axios from "axios";
import useComponentVisible from "../../../hooks/useComponentVisible";
import { apiCountry } from "../../../utils/apiEndpoints";

const SelectorTarget = ({ styles, setSelected , setProductCity }) => {
  const { selectorRef, isActive, setIsActive } = useComponentVisible(false);
  const [search, setSearch] = useState("");
  const [data, setData] = useState([]);

  const inputToSearch = (e) => {
    setSearch(e.target.value);
  };

  useEffect(() => {
    axios
      .get(apiCountry)
      .then((res) => setData(res.data))
      .catch((error) => console.log(error));
  }, []);

  const places = [
    ...new Map(data.map((place) => [place.name, place])).values(),
  ];

  return (
    <form action="" className={styles.formClass}>
      <div
        ref={selectorRef}
        className={styles.selectbox}
        onClick={() => setIsActive((prev) => !prev)}
      >
        <div id={styles.select} className={styles.select}>
          <FontAwesomeIcon icon={faLocationDot} />
          <input
            className={styles.selectContent}
            value={search}
            onClick={() => setSearch("")}
            onChange={inputToSearch}
            placeholder="A donde vamos"
            required
          ></input>
        </div>
        <div id={styles.options} className={isActive ? styles.active : styles.inactive}>
          {places.map((countrys) => {
            return (
              <div key={countrys.id}>
                {countrys.states.map((state) => {
                  return (
                    <div key={state.id} className={styles.states}>
                      {state.cities
                        .filter((city) => {
                          if (!search) {
                            return city;
                          } else {
                            city = city.name
                              .toLowerCase()
                              .includes(search.toLowerCase());
                            return city;
                          }
                        })
                        .map((city) => {
                          return (
                            <a
                              href="#"
                              key={city.id}
                              onClick={() => {
                                setSearch(`${city.name}, ${countrys.name}`)
                                setSelected(`${city.name}, ${countrys.name}`)
                                setProductCity(city.id)
                                ;
                              }}
                            >
                              <div className={styles.contentOption}>
                                <FontAwesomeIcon icon={faLocationDot} />
                                <div className={styles.texts}>
                                  <p>{city.name} </p>
                                  <p>{countrys.name}</p>
                                </div>
                              </div>
                            </a>
                          );
                        })}
                    </div>
                  );
                })}
              </div>
            );
          })}
        </div>
      </div>
    </form>
  );
};

export default SelectorTarget;
