import { FunctionComponent, useCallback } from "react";

const LoginS1 = () => {
  const loginClick = useCallback(() => {
    // Please sync "Iniciar sesión" to the project
  }, []);

  const registerClick = useCallback(() => {
    // Please sync "Registro" to the project
  }, []);

  return (
    <div className="login-s1__container">
      <p className="login-s1__title">MEXANIZATE</p>
      <img className="login-s1__logo" alt="Logo Mexanizate" src="/logo-mxz@2x.png" />
      <div className="login-s1__button--login" onClick={loginClick} />
      <p className="login-s1__text--login">Iniciar sesión</p>
      <div className="login-s1__button--register" onClick={registerClick} />
      <p className="login-s1__text--register">Crear cuenta</p>
    </div>
  );
};

export { LoginS1 };
