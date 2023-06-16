<%@include file="SesionesLogin.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Login de la Repostería y pastelería ubicada en Bogotá">
<meta name="keywords" content="Repostería Pastelería Bogotá">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.3/dist/sweetalert2.min.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.js"></script>
  <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="style.css">
  <link rel="icon" href="img/logo.png">
  <link rel="apple-touch-icon" href="img/logo.png">

  <title>Ingresar - Bocaditos</title>
</head>

<body>
    <section class="modal modal_recuperar_contrasena">
        <div class="modal_container">
            <h3 class="modal_title" style="font-family: var(--poppins);">Recuperar contraseña</h3>
            <form method="post" action="EnvioCorreo" style="width: 80%;">
                <div class="inputs">
                    <div>
                        <label class="modal_paragraph" style="font-family: var(--poppins);">Correo electrónico:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="email" placeholder="Correo electrónico" name="destino" required >            
                    </div>
                </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_recuperar_contrasena swal2-styled swal2-cancel">Cerrar</a>
                    <button class="swal2-styled swal2-confirm" type="submit">Recuperar</button>

                </div>
            </form>
        </div>

    </section>
     <% String mensajeExito = request.getParameter("mensajeExito");
if (request.getParameter("mensajeExito") != null) {
    request.setAttribute("mensajeExito", mensajeExito.replace("+", " "));
} %>
<% String mensajeError = request.getParameter("mensajeError");
if (request.getParameter("mensajeError") != null) {
    request.setAttribute("mensajeError", mensajeError.replace("+", " "));
} %>
<% if (request.getAttribute("mensajeError") != null) { %>
     <script> 
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer)
                toast.addEventListener('mouseleave', Swal.resumeTimer)
            }
        })

        Toast.fire({
            icon: 'error',
            title: '<%= request.getAttribute("mensajeError") %>'
        })
     </script>
<% } else if(request.getAttribute("mensajeExito") != null) { %>
     <script> 
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer)
                toast.addEventListener('mouseleave', Swal.resumeTimer)
            }
        })

        Toast.fire({
            icon: 'success',
            title: '<%= request.getAttribute("mensajeExito") %>'
        })
     </script>
<% } %>
   <section id="header">
    <a href="login.jsp"><img src="img/logo.png" class="logo" alt="Logo de Bocaditos"></a>
    <div>
        
      <ul id="navbar">

        <li><a class="active" href="login.jsp">Login</a></li>
      </ul>
    </div>
  </section>

  <div class="container">
    <div class="signin-signup">
      <form method="post" action="Usuario" class="sign-in-form">
        <h2 class="title">Inicio de sesión</h2>
        <div class="input-field">
          <i class="bi bi-envelope-at"></i>
          <input type="text" placeholder="Correo electronico" name="usuCorreo" required>
        </div>
        <div class="input-field">
          <i class="bi bi-key"></i>
          <input type="password" placeholder="Contraseña" name="usuContrasena" required>
        </div>
        <input type="submit" class="btn" value="Iniciar sesión">
        <br>
        <a href="#" class="recuperar_contrasena account-text2" >¿Olvidaste tu Contraseña?</a>
        <a href="#" id="sign-up-btn2" class="account-text">¿No tienes una cuenta?</a>
 <input type="hidden" name="opcion" value="4">
      </form>

        
      <form method="post" action="Usuario" class="sign-up-form">
        <h2 class="title">Registro</h2>

        <div class="input-field">
          <i class="bi bi-envelope-at"></i>
          <input type="email" placeholder="Correo electronico" name="usuCorreo" id="usuCorreo"  required>
        </div>
        
        <div class="input-field">
    <i class="bi bi-envelope-at"></i>
    <input type="email" placeholder="Confirmar correo electronico" name="confirmarCorreo" oninput="validarCorreo()" required>
  </div>

        <div class="input-field">
          <i class="bi bi-person"></i>
          <input type="text" placeholder="Nombre" name="usuNombre" pattern="[A-Za-zÁÉÍÓÚÑáéíóúñ ]+" title="Ingrese solo letras" required>
        </div>

        <div class="input-field">
          <i class="bi bi-person"></i>
          <input type="text" placeholder="Apellido" name="usuApellido" pattern="[A-Za-zÁÉÍÓÚÑáéíóúñ ]+" title="Ingrese solo letras" required>
        </div>

        <div class="input-field">
            
          <i class="bi bi-person-vcard"></i>
          <select name="usuTipoDocumento" id="select" required><option value="CC">CC</option>
          <option value="CE">CE</option></select>
          <input type="text" placeholder="Numero de Documento" name="usuDocumento" pattern="[0-9]{10}" title="Ingrese solo números (10 caracteres)" onkeypress="return event.charCode >= 48 && event.charCode <= 57"  required>
        </div>
        <div class="input-field">
          <i class="bi bi-telephone"></i>
          <input type="text" placeholder="Numero de Telefono" name="usuTelefono" pattern="[0-9]{10}" title="Ingrese solo números (10 caracteres)" onkeypress="return event.charCode >= 48 && event.charCode <= 57" required>
        </div>
        <div class="input-field">
          <i class="bi bi-geo-alt"></i>
          <input type="text" placeholder="Dirección" name="usuDireccion" required>
        </div>
        <div class="input-field">
    <i class="bi bi-key"></i>
    <input type="password" placeholder="Contraseña" name="usuContrasena" id="usuContrasena" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" title="La contraseña debe contener al menos 8 caracteres, incluyendo al menos una letra mayúscula, una letra minúscula, un número y un carácter especial (@$!%*?&)." required>
  </div>

  <div class="input-field">
    <i class="bi bi-key"></i>
    <input type="password" placeholder="Confirmar Contraseña" name="confirmarContrasena" oninput="validarContrasena()" required>
  </div>

        <input type="submit" class="btn" value="Registrarse"><br>
        <a href="#" id="sign-in-btn2" class="account-text">¿Ya tienes una cuenta?</a>
         <input type="hidden" name="opcion" value="1">
        </form>

    </div>
    <div class="panel-container">
      <div class="panel left-panel">
        <div class="content ">
          <h3>¿Ya estas registrado?</h3>
          <p>Te extrañamos, sigue compartiendo con nosotros tus mejores momentos.</p>
          <button class="btn" id="sign-in-btn">Ingresa</button>
        </div>
        <img src="img/Mobile login-amico.png" alt="inicio de sesión" class="imagen-panel">
      </div>

      <div class="panel right-panel">
        <div class="content ">
          <h3>¿Aún no te registras?</h3>
          <p>Bienvenid@, Permitenos conocernos un poco más.</p>
          <button class="btn" id="sign-up-btn">Registrate</button>
        </div>
        <img src="img/Welcome-amico.png" alt="inicio de sesión" class="imagen-panel">
      </div>
    </div>

  </div>

  
  <script src="js/script.js"></script>
  <script src="js/login.js"></script>
  <script>
            
// Código a ejecutar solo la primera vez
//MODALES
//registrar rol
            const openModal_recuperar_contrasena = document.querySelector('.recuperar_contrasena');
            const modal_recuperar_contrasena = document.querySelector('.modal_recuperar_contrasena');
            const closeModal_recuperar_contrasena = document.querySelector('.modal_close_recuperar_contrasena');

                    openModal_recuperar_contrasena.addEventListener('click', (e)=>{
                    e.preventDefault();
                    modal_recuperar_contrasena.classList.add('modal--show');
                    });
            closeModal_recuperar_contrasena.addEventListener('click', (e)=> {
            e.preventDefault();
            modal_recuperar_contrasena.classList.remove('modal--show');
            });
            function validarCorreo() {
  var correo = document.getElementById("usuCorreo").value;
  var confirmarCorreo = document.getElementsByName("confirmarCorreo")[0];

  if (correo !== confirmarCorreo.value) {
    confirmarCorreo.setCustomValidity("El correo no coincide");
    document.getElementById("mensajeError").textContent = "El correo no coincide";
  } else {
    confirmarCorreo.setCustomValidity("");
    document.getElementById("mensajeError").textContent = "";
  }
}

            function validarContrasena() {
  var contrasena = document.getElementById("usuContrasena").value;
  var confirmarContrasena = document.getElementsByName("confirmarContrasena")[0];

  if (contrasena !== confirmarContrasena.value) {
    confirmarContrasena.setCustomValidity("Las contraseñas no coinciden");
    document.getElementById("mensajeError").textContent = "Las contraseñas no coinciden";
  } else {
    confirmarContrasena.setCustomValidity("");
    document.getElementById("mensajeError").textContent = "";
  }
}
  

         
        </script>
</body>

</html>