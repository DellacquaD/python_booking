import React from 'react';
import styles from './NotFound.module.css';
import { useNavigate } from 'react-router';

const ErrorPage = () => {
    const navigate = useNavigate()
  const handleClick = () => {
    navigate("/")
  };

  return (
    <div className={styles.errorWrapper}>
      <h3 className={styles.errorMessage}>Oops! La pagina no se encuentra disponible.</h3>
      <button className={styles.goBackButton} onClick={handleClick}>
        Regresar al inicio
      </button>
    </div>
  );
};

export default ErrorPage;