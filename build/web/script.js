const allSideMenu = document.querySelectorAll("#sidebar .side-menu.top li a");
let activeIndex = parseInt(localStorage.getItem('activeIndex'));

allSideMenu.forEach((item, index) => {
  const li = item.parentElement;

  item.addEventListener("click", function () {
    allSideMenu.forEach((li) => {
      li.parentElement.classList.remove("active");
    });
    li.classList.add("active");

    // Guardar el índice del elemento activo en el localStorage
    localStorage.setItem('activeIndex', index.toString());

    // Cargar la página correspondiente
    showActiveContent();
  });

  // Establecer la clase "active" en el elemento correspondiente al cargar la página
  if (activeIndex !== null && index === activeIndex) {
    li.classList.add("active");
    allSideMenu.forEach((otherItem, otherIndex) => {
      if (otherIndex !== activeIndex && otherIndex !== -1) {
        otherItem.parentElement.classList.remove("active");
      }
    });

    // Cargar la página correspondiente al cargar la página
    showActiveContent();
  }
});

//SI SE HACE UNA MODIFICACION Y SE AGREGA OTRO MODULO EN EL SIDEBAR HAY QUE ACTUALIZAR ESTO!!!!!!!!!!!!!
function showActiveContent() {
  const activeIndex = parseInt(localStorage.getItem('activeIndex'));

  if (activeIndex === -1) {
    $("#main-content").load("perfil.jsp");
  } else {
    switch (activeIndex) {
      case 0:
        $("#main-content").load("dashboard.jsp");
        break;
         case 1:
        $("#main-content").load("consultarMisOrdenes.jsp");
        break;
      case 2:
        $("#main-content").load("consultarUsuario.jsp");
        break;
      case 3:
        $("#main-content").load("consultarProducto.jsp");
        break;
      case 4:
        $("#main-content").load("consultarCliente.jsp");
        break;
      case 5:
        $("#main-content").load("consultarOrden.jsp");
        break;
      case 6:
        $("#main-content").load("consultarCategoria.jsp");
        break;
      case 7:
        $("#main-content").load("consultarMateria.jsp");
        break;
      case 8:
        $("#main-content").load("consultarPedido.jsp");
        break;
      case 9:
        $("#main-content").load("consultarProveedor.jsp");
        break;
      case 10:
        $("#main-content").load("consultarRol.jsp");
        break;
      default:
        $("#main-content").load("dashboard.jsp");
        break;
    }
  }
}

$(document).ready(function() {
  // Obtener el enlace del perfil en el navbar por su clase
  const profileLink = $("#perfil");

  profileLink.on("click", function(e) {
    e.preventDefault();
    localStorage.setItem('activeIndex', '-1'); // Establece el índice del perfil en -1
    $("#main-content").load("perfil.jsp");
    $(".side-menu li").removeClass("active");
  });
});

document.addEventListener('DOMContentLoaded', function() {
  showActiveContent();
});





// TOGGLE SIDEBAR
const menuBar = document.querySelector("#content nav .bx.bx-menu");
const sidebar = document.getElementById("sidebar");
const storageKeySB = "sidebarHidden";

// Si el valor del almacenamiento local es "true", ocultar el menú lateral en la carga inicial de la página
if (localStorage.getItem(storageKeySB) === "true") {
  sidebar.classList.add("hide");
}

menuBar.addEventListener("click", function () {
  sidebar.classList.toggle("hide");
  localStorage.setItem(storageKeySB, sidebar.classList.contains("hide")); // Almacenar el estado del menú lateral en el almacenamiento local
});

const searchButton = document.querySelector(
  "#content nav form .form-input button"
);
const searchButtonIcon = document.querySelector(
  "#content nav form .form-input button .bx"
);
const searchForm = document.querySelector("#content nav form");

//DARK MODE
const switchMode = document.getElementById("switch-mode");
const storageKey = "darkModeEnabled";

// Si el valor del almacenamiento local es "true", activar el modo oscuro en la carga inicial de la página
if (localStorage.getItem(storageKey) === "true") {
  document.body.classList.add("dark");
  switchMode.checked = true;
}

switchMode.addEventListener("change", function () {
  if (this.checked) {
    document.body.classList.add("dark");
    localStorage.setItem(storageKey, "true"); // Almacenar el estado del interruptor de modo oscuro en el almacenamiento local
  } else {
    document.body.classList.remove("dark");
    localStorage.setItem(storageKey, "false"); // Almacenar el estado del interruptor de modo oscuro en el almacenamiento local
  }
});

//Buscador

document.addEventListener('keyup', e=>{
    if(e.target.matches('#buscador')){
         const busqueda = e.target.value.toLowerCase();

        document.querySelectorAll('.registro').forEach(registro =>{
            const dato = registro.querySelector('.dato').innerHTML;
   if (dato.toLowerCase().includes(busqueda)) {
        registro.classList.remove('filtro');
      } else {
        registro.classList.add('filtro');
      }

        })
        
    }
    
})

