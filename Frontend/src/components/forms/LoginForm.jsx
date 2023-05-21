import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { useFormik } from "formik";
import * as yup from "yup";
import { BsEyeSlash, BsEye } from "react-icons/bs";
import "./form.css";
import { apiUserLogin } from "../../utils/apiEndpoints";
import axios from "axios";
import { faCircleExclamation } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

const LoginForm = () => {
  const navigate = useNavigate();
  const [showPassword, setShowPassword] = useState(false);
  const [connectionError, setConnectionError] = useState("");
  const userLoggedIn = JSON.parse(localStorage.getItem("JWT"));
  const productReservedInLocal = JSON.parse(
    localStorage.getItem("productReservedInLocal")
  );
  const redirectFav = JSON.parse(localStorage.getItem("goToFavs"));

  const onSubmit = async (values) => {
    try {
      const response = await axios.post(apiUserLogin, {
        username: values.username,

        password: values.password,
      });
      if (response.data.token) {
        if (redirectFav) {
          navigate("/favorites");
        } else if (!redirectFav && productReservedInLocal) {
          window.location.replace(productReservedInLocal);
        } else {
          navigate("/");
        }
        localStorage.removeItem("goToFavs");
        localStorage.removeItem("productReservedInLocal");
      }

      localStorage.setItem("JWT", JSON.stringify(response.data.token));
      localStorage.setItem("userInfo", JSON.stringify(response.data));
      {
        console.log(response.data);
      }
    } catch (error) {
      setConnectionError(
        "Lamentablemente no ha podido iniciar sesión. Por favor, intente más tarde"
      );
    }
  };

  const schema = yup.object({
    username: yup.string().required("Este campo es obligatorio"),
    password: yup.string().required("Este campo es obligatorio"),
  });

  const {
    values,
    errors,
    touched,
    handleSubmit,
    handleChange,
    handleBlur,
    isSubmitting,
  } = useFormik({
    initialValues: {
      username: "",
      password: "",
    },
    validationSchema: schema,
    onSubmit,
  });

  const handleShowPassword = () => {
    setShowPassword(!showPassword);
  };

  return (
    <div className="loginForm">
      {!productReservedInLocal && !userLoggedIn ? (
        ""
      ) : (
        <div className="alertContainer">
          <FontAwesomeIcon
            icon={faCircleExclamation}
            style={{ color: "#ba0d0d" }}
            size="2xl"
          />
          <p className="apiEndpointError">
            Para realizar una reserva necesitas estar logueado
          </p>
        </div>
      )}

      <h1>Iniciar sesión</h1>
      {connectionError === "" ? (
        ""
      ) : (
        <p className="apiEndpointError">{connectionError}</p>
      )}
      <form onSubmit={handleSubmit}>
        <label htmlFor="username">Username</label>
        <input
          type="username"
          id="username"
          name="username"
          value={values.username}
          onChange={handleChange}
          onBlur={handleBlur}
          className={errors.username && touched.username ? "input-error" : ""}
        />

        {errors.username && touched.username && (
          <p className="error">{errors.username}</p>
        )}
        <label htmlFor="password">Contraseña</label>
        <div id="showPass">
          <input
            type={showPassword ? "text" : "password"}
            placeholder=""
            id="password"
            name="password"
            value={values.password}
            onChange={handleChange}
            onBlur={handleBlur}
            className={errors.password && touched.password ? "input-error" : ""}
          />
          <span className="showPass" onClick={handleShowPassword}>
            {showPassword ? (
              <BsEye className="showIcon" />
            ) : (
              <BsEyeSlash className="showIcon" />
            )}
          </span>
        </div>
        {errors.password && touched.password && (
          <p className="error">{errors.password}</p>
        )}
        <div className="failed-validation"></div>
        <button disabled={isSubmitting} type="submit">
          Ingresar
        </button>

        <p className="register">
          ¿Aún no tienes cuenta? <Link to="/register">Registarte</Link>
        </p>
      </form>
    </div>
  );
};

export default LoginForm;
