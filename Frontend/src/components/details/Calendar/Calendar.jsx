/* eslint-disable no-unused-vars */
/* eslint-disable no-unmodified-loop-condition */
/* eslint-disable array-callback-return */
/* eslint-disable no-unused-expressions */
/* eslint-disable react/prop-types */
import React, { useState, useEffect, useContext } from "react";
import { startOfMonth } from "date-fns/fp";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faChevronLeft,
  faChevronRight,
  faCircleXmark,
} from "@fortawesome/free-solid-svg-icons";
import { format } from "date-fns";
import { GlobalContext } from "../../../utils/globalContext";

const months = [
  "Enero",
  "Febrero",
  "Marzo",
  "Abril",
  "Mayo",
  "Junio",
  "Julio",
  "Agosto",
  "Septiembre",
  "Octubre",
  "Noviembre",
  "Diciembre",
];

const days = ["D", "L", "M", "M", "J", "V", "S"];

function Calendar({ styles, reservations, setToggleCalendar }) {
  const [currentDate, setCurrentDate] = useState(new Date());
  const [selectDate, setSelectDate] = useState([]);
  const [currentMonth, setCurrentMonth] = useState(new Date().getMonth() + 1);
  const [nextMonth, setNextMonth] = useState(new Date().getMonth() + 2);
  const [currentYear, setCurrentYear] = useState(new Date().getYear() + 1900);
  const [changeMonth, setChangeMonth] = useState(false);
  const { state, dispatch } = useContext(GlobalContext);

  useEffect(() => {
    dispatch({
      type: "reservation",
      payload: selectDate,
    });
  }, [selectDate]);

  reservations?.map(
    (res) => (
      (res.checkIn = res.checkIn.replaceAll("-", "/")),
      (res.checkOut = res.checkOut.replaceAll("-", "/"))
    )
  );

  const getDatesRange = (start, finish) => {
    const date = new Date(start);
    const finishDate = new Date(finish);
    const dates = [];

    while (date <= finishDate) {
      dates.push(new Date(date));
      date.setDate(date.getDate() + 1);
    }

    return dates;
  };

  let newReservation = [];
  if (selectDate.length === 2) {
    newReservation = getDatesRange(
      new Date(selectDate[0]),
      new Date(selectDate[1])
    );
  }

  const unavailableDatesRange = reservations?.map((date) =>
    getDatesRange(new Date(date.checkIn), new Date(date.checkOut))
  );

  const alreadyReserved = unavailableDatesRange?.flat(1);

  const formateDate = (arr) => {
    const newArr = [];
    arr.map((i) => {
      newArr.push(format(new Date(i), "yyyy/MM/dd"));
    });
    return newArr;
  };

  const reservation = JSON.parse(localStorage.getItem("reservation"));
  const resArray = reservation
    ? formateDate(
        getDatesRange(new Date(reservation[0]), new Date(reservation[1]))
      )
    : [];

  const unavailable = alreadyReserved ? formateDate(alreadyReserved) : "";
  const formatedNewReservation = formateDate(newReservation.slice(1, -1));

  const unavailableDates = (i, month, year) => {
    const selected = format(
      new Date(`${year}-${month}-${i + 1}`),
      "yyyy/MM/dd"
    );
    const today = format(new Date(currentDate), "yyyy/MM/dd");

    if (unavailable.includes(selected) || selected < today) {
      return `${styles.unavailable}`;
    } else if (
      (!unavailable.includes(selected) &&
        formatedNewReservation.includes(selected)) ||
      resArray.slice(1, -1).includes(selected)
    ) {
      return `${styles.selected}`;
    } else if (selected === today && !selectDate.includes(selected)) {
      return `${styles.today}`;
    } else if (selectDate.includes(selected) || resArray.includes(selected)) {
      return `${styles.rangeLimits}`;
    }

    return `${styles.available}`;
  };

  const handleSelectDates = (i, year, month) => {
    const displayDate = format(
      new Date(`${year}-${month}-${i + 1}`),
      "yyyy/MM/dd"
    );

    const range = formateDate(
      getDatesRange(new Date(selectDate[0]), new Date(displayDate))
    );

    if (
      !selectDate.includes(displayDate) &&
      !unavailable.includes(displayDate) &&
      selectDate.length <= 2
    ) {
      setSelectDate([...selectDate, displayDate]);
      localStorage.setItem("reservation", JSON.stringify([]));
    }

    if (selectDate.length === 1) {
      if (range.some((i) => unavailable.includes(i))) {
        setSelectDate([displayDate]);
      } else if (selectDate[0] > displayDate) {
        setSelectDate([displayDate]);
      } else if (selectDate[0] === displayDate) {
        setSelectDate([]);
      }
    }

    if (selectDate.length === 2) {
      setSelectDate([displayDate]);
    }
  };

  const getDaysInAMonth = (year, month) => {
    return new Date(year, month, 0).getDate();
  };

  const getStartOfMonth = (year, month) => {
    const date = new Date(`${year}/${month}/1`);
    const startDate = startOfMonth(date);
    return startDate.getDay();
  };

  const followingMonth = () => {
    if (currentMonth < 12 && nextMonth < 12) {
      setCurrentMonth((prev) => prev + 1);
      setNextMonth((prev) => prev + 1);
    } else {
      setCurrentMonth(1);
      setNextMonth(2);
      setCurrentYear((prev) => prev + 1);
    }
    toggleAnimation();
  };

  const prevMonth = () => {
    if (currentMonth > 1 && nextMonth > 1) {
      setCurrentMonth((prev) => prev - 1);
      setNextMonth((prev) => prev - 1);
    } else {
      setCurrentMonth(11);
      setNextMonth(12);
      setCurrentYear((prev) => prev - 1);
    }
    toggleAnimation();
  };

  const completeCalendar = (month, year) => {
    return 42 - getStartOfMonth(year, month) - getDaysInAMonth(year, month);
  };

  const toggleAnimation = () => {
    setChangeMonth(!changeMonth);
  };

  const handleClearDate = () => {
    setSelectDate([]);
    localStorage.setItem("reservation", JSON.stringify([]));
    setToggleCalendar(false);
  };

  return (
    <div className={styles.calendarLayout}>
      <button
        className={
          selectDate?.length >= 1 || reservation?.length === 2
            ? styles.clearDate
            : styles.hideClearDate
        }
        onClick={handleClearDate}
      >
        <FontAwesomeIcon icon={faCircleXmark} size="lg" />
      </button>
      <div className={styles.calendarDetails}>
        <button
          onClick={prevMonth}
          className={styles.changeMonthButton + " " + styles.left}
        >
          <FontAwesomeIcon icon={faChevronLeft}></FontAwesomeIcon>
        </button>

        <div className={styles.gridFirstMonth}>
          <div className={styles.month}>
            <h4>
              {months[currentMonth - 1]} {currentYear}
            </h4>
          </div>

          {}
          {days.map((day, i) => (
            <p key={i} className={styles.weekDays}>
              {day}
            </p>
          ))}
          {Array.from({
            length: getStartOfMonth(currentYear, currentMonth),
          }).map((_, i) => (
            <p key={i}></p>
          ))}
          {Array.from({
            length: getDaysInAMonth(currentYear, currentMonth),
          }).map((_, i) => (
            <p
              className={`${unavailableDates(i, currentMonth, currentYear)} ${
                styles.dayOfMonth
              } ${changeMonth ? `${styles.fadeIn}` : `${styles.fadeOut}`}  `}
              onClick={() => handleSelectDates(i, currentYear, currentMonth)}
              key={i}
            >
              {i + 1}
            </p>
          ))}
          {Array.from({
            length: completeCalendar(currentMonth, currentYear),
          }).map((_, i) => (
            <p key={i} className={styles.dayOfOtherMonth}>
              {i + 1}
            </p>
          ))}
        </div>
        <div className={styles.gridSecondMonth}>
          <div className={styles.month}>
            <h4>
              {months[nextMonth - 1]} {currentYear}
            </h4>
          </div>

          {}
          {days.map((day, i) => (
            <p key={i} className={styles.weekDays}>
              {day}
            </p>
          ))}
          {Array.from({
            length: getStartOfMonth(currentYear, nextMonth),
          }).map((_, i) => (
            <p key={i}></p>
          ))}
          {Array.from({
            length: getDaysInAMonth(currentYear, nextMonth),
          }).map((_, i) => (
            <p
              className={`${unavailableDates(i, nextMonth, currentYear)} ${
                styles.dayOfMonth
              }  ${changeMonth ? `${styles.fadeIn}` : `${styles.fadeOut}`} `}
              onClick={() => handleSelectDates(i, currentYear, nextMonth)}
              key={i}
            >
              {i + 1}
            </p>
          ))}
          {Array.from({
            length: completeCalendar(nextMonth, currentYear),
          }).map((_, i) => (
            <p key={i} className={styles.dayOfOtherMonth}>
              {i + 1}
            </p>
          ))}
        </div>
        <button
          className={styles.changeMonthButton + " " + styles.right}
          onClick={followingMonth}
        >
          <FontAwesomeIcon icon={faChevronRight}></FontAwesomeIcon>
        </button>
      </div>
    </div>
  );
}

export default Calendar;
