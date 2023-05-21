/* eslint-disable react/prop-types */
import React from 'react'

const UserInfo = ({ styles }) => {

  const userInfo = JSON.parse(localStorage.getItem("userInfo"));

  return (
    <div className={styles.reserveGridContainer}>
        <div className={`${styles.reserveGridItem}` + ' ' + `${styles.name}` + ' ' + `${styles.fielDisable}`}>
            <div>Nombre</div>
            <input defaultValue={userInfo.firstname}></input>
        </div>
        <div className={`${styles.reserveGridItem}` + ' ' + `${styles.surname}` + ' ' + `${styles.fielDisable}`}>
            <div>Apellido</div>
            <input defaultValue={userInfo.lastname}></input>
        </div>
        <div className={`${styles.reserveGridItem}` + ' ' + `${styles.email}` + ' ' + `${styles.fielDisable}`}>
            <div>Correo Electronico</div>
            <input defaultValue={userInfo.email}></input>
        </div>
        <div className={`${styles.reserveGridItem}` + ' ' + `${styles.city}`}>
            <div>Ciudad</div>
            <input placeholder='ciudad'></input>
        </div>
    </div>
  )
}

export default UserInfo
