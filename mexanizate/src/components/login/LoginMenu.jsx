import { FunctionComponent, useCallback } from "react";

const LoginMenu = () => {
  const loginClick = useCallback(() => {
    // Please sync "Iniciar sesión" to the project
  }, []);

  const registerClick = useCallback(() => {
    // Please sync "Registro" to the project
  }, []);

  return (
    <div className="login-menu__container--main">
      <div className="login-menu__container--content">
        <div className="login-menu__container--logo">
          <p className="login-menu__title">MEXANIZATE</p>
          <picture>
            <source
              media="(min-width: 900px)"
              srcset="https://cdn.discordapp.com/attachments/1093647045350412298/1149208315889455114/Logo_MXZ_v.png"
            />
            <source
              media="(min-width: 660px)"
              srcset="https://cdn.discordapp.com/attachments/1093647045350412298/1149208315579088956/Logo_MXZ_g.png"
            />
            <source
            media="(min-width: 480px)"
            srcset="https://cdn.discordapp.com/attachments/1093647045350412298/1149208315251929088/Logo_MXZ.png"
            />
            <img className="login-menu__logo"
              src="https://cdn.discordapp.com/attachments/1093647045350412298/1149208315889455114/Logo_MXZ_v.png"
              alt="Mexanizate Login"
            />
          </picture>
        </div>
        <div className="login-menu__container--login-buttons">
          <div className="login-menu__button--login" onClick={loginClick}>
            <p className="login-menu__text--login">Iniciar sesión</p>
          </div>
          <div className="login-menu__button--register" onClick={registerClick}>
            <p className="login-menu__text--register">Crear cuenta</p>
          </div>
        </div>
      </div>
    </div>
  );
};

export { LoginMenu };
