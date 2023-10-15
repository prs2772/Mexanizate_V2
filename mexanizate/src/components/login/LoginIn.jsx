import React from "react";

function LoginIn() {
  return (
    <>
      <div className="login-in__container--main">
        <div className="login-menu__container--content">
          <div className="login-menu__container--logo">
            <p className="login-menu__title">MEXANIZATE</p>
            <picture>
              <source
                media="(min-width: 900px)"
                srcSet="https://cdn.discordapp.com/attachments/1093647045350412298/1149208315889455114/Logo_MXZ_v.png"
              />
              <source
                media="(min-width: 660px)"
                srcSet="https://cdn.discordapp.com/attachments/1093647045350412298/1149208315579088956/Logo_MXZ_g.png"
              />
              <source
              media="(min-width: 480px)"
              srcSet="https://cdn.discordapp.com/attachments/1093647045350412298/1149208315251929088/Logo_MXZ.png"
              />
              <img className="login--menu__logo"
                src="https://cdn.discordapp.com/attachments/1093647045350412298/1149208315889455114/Logo_MXZ_v.png"
                alt="Mexanizate Login"
              />
            </picture>
          </div>
          <p className="login-in__title-h2--inicio-de-sesion">Inicio de sesión</p>
          <div className="login-in__container--inicio-sesion">
            <span>Inicia sesión con tu cuenta </span>
            <b>Mexanizate</b>
            <span> </span>
          </div>
          <div className="login-in__label--correo-electronico">Correo electronico</div>
          <div className="login-in__container--iniciar-sesion-child"></div>
          <div className="login-in__input--correo-electronico">Ingresa tu correo electronico</div>
          <div className="login-in__label--contrasenia">Contraseña</div>
          <div className="login-in__link--olvidaste-contrasenia" id="olvidasteTuContrasea">
            ¿Olvidaste tu contraseña?
          </div>
          <div className="iniciar-sesin-item"></div>
          <div className="ingresa-tu-contrasea">Ingresa tu contraseña</div>
          <div className="boton"></div>
          <b className="iniciar-sesin1">Iniciar sesión </b>
          <div className="iniciar-sesin-inner"></div>
          <div className="o-inicia-sesin">O inicia sesión con</div>
          <div className="line-div"></div>
          <img className="icono-fb" alt="" src="./public/icono-fb@2x.png" />

          <img className="icono-gg" alt="" src="./public/icono-gg@2x.png" />

          <img className="icono-ig" alt="" src="./public/icono-ig@2x.png" />

          <div className="no-tienes-cuenta-container" id="noTienesCuenta">
            <span>¿No tienes cuenta? </span>
            <span className="registrate">Registrate</span>
          </div>
        </div>
      </div>
    </>
  );
}

export {LoginIn};
