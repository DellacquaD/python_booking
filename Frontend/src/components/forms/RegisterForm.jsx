import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { useFormik } from "formik";
import * as yup from "yup";
import { BsEyeSlash, BsEye } from "react-icons/bs";
import { apiUser } from "../../utils/apiEndpoints";
import axios from "axios";

const RegisterForm = () => {
  const navigate = useNavigate();
  const [showPassword, setShowPassword] = useState(false);
  const [conectionError, setConectionError] = useState("");

  const onSubmit = async (values, actions) => {
    await new Promise((resolve) => setTimeout(resolve, 1000));
    actions.resetForm();
    localStorage.setItem("user", JSON.stringify(values));
    postToApi(values);
  };

  const postToApi = async (values) => {
    // Crear una copia del objeto values excluyendo confirmPassword
    const { confirmPassword, ...valuesToSend } = values;
    
    try {
      const response = await axios.post(apiUser, valuesToSend);
      navigate("/login");
    } catch (error) {
      setConectionError(
        "Lamentablemente no ha podido registrarse. Por favor, intente más tarde"
      );
    }
  };

  const schema = yup.object({
    first_name: yup.string().required("Este campo es obligatorio"),
    last_name: yup.string().required("Este campo es obligatorio"),
    email: yup
      .string()
      .email("El correo electrónico ingresado no es válido")
      .required("Este campo es obligatorio"),
    username: yup.string().required("Este campo es obligatorio"),
    password: yup
      .string()
      .min(7, "La contraseña debe contener más de 6 caracteres")
      .required("Este campo es obligatorio"),
    confirmPassword: yup
      .string()
      .oneOf([yup.ref("password"), null], "Las contraseñas no coinciden")
      .required("Este campo es obligatorio"),
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
      first_name: "",
      last_name: "",
      email: "",
      username: "",
      password: "",
      confirmPassword: "",
    },
    validationSchema: schema,
    onSubmit,
  });

  const handleShowPassword = () => {
    setShowPassword(!showPassword);
  };

  return (
    <div className="registerForm">
      <h1>Crear cuenta</h1>
      {conectionError === "" ? (
        ""
      ) : (
        <p className="apiEndpointError">{conectionError}</p>
      )}
      <form onSubmit={handleSubmit}>
        <div className="userInfoFormRegister">
          <div className="nameInput">
            <label htmlFor="first_name">Nombre</label>
            <input
              type="text"
              id="first_name"
              name="first_name"
              value={values.first_name}
              onChange={handleChange}
              onBlur={handleBlur}
              className={
                errors.first_name && touched.first_name ? "input-error" : ""
              }
            />
            {errors.first_name && touched.first_name && (
              <p className="error">{errors.first_name}</p>
            )}
          </div>
          <div className="lastNameInput">
            <label htmlFor="last_name">Apellido</label>
            <input
              type="text"
              id="lastName"
              name="last_name"
              value={values.last_name}
              onChange={handleChange}
              onBlur={handleBlur}
              className={
                errors.last_name && touched.last_name ? "input-error" : ""
              }
            />
            {errors.last_name && touched.last_name && (
              <p className="error">{errors.last_name}</p>
            )}
          </div>
        </div>
        <label htmlFor="email">Correo electrónico</label>
        <input
          type="email"
          id="email"
          name="email"
          value={values.email}
          onChange={handleChange}
          onBlur={handleBlur}
          className={errors.email && touched.email ? "input-error" : ""}
        />
        {errors.email && touched.email && (
          <p className="error">{errors.email}</p>
        )}
        <label htmlFor="username">Username</label>
        <input
          type="text"
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
        <label htmlFor="confirmPassword">Confirmar contraseña</label>
        <input
          type="password"
          placeholder=""
          id="confirmPassword"
          name="confirmPassword"
          value={values.confirmPassword}
          onChange={handleChange}
          onBlur={handleBlur}
          className={
            errors.confirmPassword && touched.confirmPassword
              ? "input-error"
              : ""
          }
        />
        {errors.confirmPassword && touched.confirmPassword && (
          <p className="error">{errors.confirmPassword}</p>
        )}
        <button disabled={isSubmitting} type="submit">
          Crear cuenta
        </button>
        <p className="login">
          ¿Ya tienes una cuenta? <Link to="/login">Iniciar sesión</Link>
        </p>
      </form>
    </div>
  );
};

export default RegisterForm;
