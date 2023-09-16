import { FunctionComponent, useCallback } from "react";

const LoginS1 = () => {
  const loginClick = useCallback(() => {
    // Please sync "Iniciar sesión" to the project
  }, []);

  const registerClick = useCallback(() => {
    // Please sync "Registro" to the project
  }, []);

  return (
    <div className="login-s1__container--main">
      <div className="login-s1__container--content">
        <div className="login-s1__container--logo">
          <p className="login-s1__title">MEXANIZATE</p>
          <picture>
            <source
              media="(min-width: 1px)"
              srcset="https://cdn.discordapp.com/attachments/1093647045350412298/1149208315889455114/Logo_MXZ_v.png"
            />
            <img className="login-s1__logo"
              src="/logo-mxz@2x.png"
              alt="Mexanizate Login"
            />
          </picture>
        </div>
        <div className="login-s1__container--login-buttons">
          <div className="login-s1__button--login" onClick={loginClick}>
            <p className="login-s1__text--login">Iniciar sesión</p>
          </div>
          <div className="login-s1__button--register" onClick={registerClick}>
            <p className="login-s1__text--register">Crear cuenta</p>
          </div>
        </div>
      </div>
    </div>
  );
};

export { LoginS1 };
