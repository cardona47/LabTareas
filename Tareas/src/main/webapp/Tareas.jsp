<%-- 
    Document   : Tareas
    Created on : 7/10/2023, 5:36:50 p. m.
    Author     : Acer
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.umariana.mundo.Tarea"%>
<%@page import="com.umariana.mundo.Lista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file = "templates/header.jsp" %>
<% String usuarioVerificado = (String) session.getAttribute("usuarioverificado");%>

<section class="vh-100" style="background: linear-gradient(to top right, #007f00, #000000);">
    <div class="container p-4"> <!-- clase contenedora -->
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #1A1A1A;">
            <div class="container-fluid">
                <a class="navbar-brand d-flex align-items-center" href="#" style="color: white;">
                    <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                    <span style="line-height: 1.2;">Organizando tu mundo</span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#" style="color: white;">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" style="color: white;">Tareas</a>
                        </li>
                    </ul>
                    <div class="navbar-text text-center" style="color: white;">
                        Bienvenido, <%= usuarioVerificado%>!
                    </div>
                    <a href="index.jsp" class="btn btn-warning" style="background-color: #ff6219; border-color: #ff6219; color: white;">Cerrar Sesión</a>
                </div>
            </div>
        </nav>

        <%-- formulario para agregar tareas --%>
        <h1 class="text-center mt-4 mb-4" style="color: white;">Tareas</h1>
        <div class="row">
            <div class="col-md-4 d-flex justify-content-center align-items-center"> <!-- Agrega las clases d-flex, justify-content-center y align-items-center -->
                <div class="card card-body text-center" style="background-color: #1A1A1A; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
                    <h4 class="text-center" style="color: tomato;">Agrega tareas</h4>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;" id="errorAlert">
                    El id de su tarea debe ser unico para mantener un orden en su lista de tareas
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <form action="SvTarea" method="POST">
    <div class="input-group mb-3">
        <span class="input-group-text" style="width: 100px;">Id</span>
        <input type="text" name="id" class="form-control">
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" style="width: 100px;">Titulo</span>
        <input type="text" name="titulo" class="form-control">
    </div>
    <div class="input-group mb-3">
        <span class="input-group-text" style="width: 100px;">Descripcion</span>
        <input type="text" name="descripcion" class="form-control">
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" style="width: 100px;">Fecha de vencimiento</span>
        <input type="date" name="fechaV" class="form-control">
    </div>
                        <!-- Radio buttons para seleccionar la posicion de la nueva tarea en la lista -->
                        <div class="tareas-container">
    <h6 class="text-center" style="color: white;">Seleccione la posición en la que quiere agregar la nueva tarea en la lista</h6>
    <div class="mb-3 form-check">
        <input class="form-check-input" type="radio" name="posicion" id="primeroRadio" value="primero">
        <label class="form-check-label" for="primeroRadio" style="color: white;">
            Primero en la lista
        </label>
    </div>

    <div class="mb-3 form-check">
        <input class="form-check-input" type="radio" name="posicion" id="ultimoRadio" value="ultimo">
        <label class="form-check-label" for="ultimoRadio" style="color: white;">
            Último en la lista
        </label>
    </div>

    <div class="mb-3 form-check">
        <input class="form-check-input" type="radio" name="posicion" id="antesDeRadio" value="antesDe">
        <label class="form-check-label" for="antesDeRadio" style="color: white;">
            Antes de Tarea con ID:
        </label>
        <input type="text" name="idAntesDe" id="idAntesDe" placeholder="ID" class="form-control">
    </div>

    <div class="mb-3 form-check">
        <input class="form-check-input" type="radio" name="posicion" id="despuesDeRadio" value="despuesDe">
        <label class="form-check-label" for="despuesDeRadio" style="color: white;">
            Después de Tarea con ID:
        </label>
        <input type="text" name="idDespuesDe" id="idDespuesDe" placeholder="ID" class="form-control">
    </div>
</div>

    <button type="submit" class="btn btn-primary mt-3" style="background-color: #ff6219; border-color: #ff6219;">Agregar tarea</button>
</form>


                </div>
            </div>

            <%-- tabla para visualizar las tareas agregadas --%>
            <div class="col-md-8">
                <div>
                    <table class="table table-bordered" style="background-color: #1a1a1a; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);color: white;">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Titulo</th>
                                <th scope="col">Descripción</th>
                                <th scope="col">Fecha de vencimiento</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
    <%
    Lista listaTareas = (Lista) session.getAttribute("listaTareas");

    if (listaTareas != null) {
        Lista.Nodo current = listaTareas.inicio;
        while (current != null) {
            Tarea tarea = current.tarea;
    %>
            <tr>
                <td><%= tarea.getId() %></td>
                <td><%= tarea.getTitulo() %></td>
                <td><%= tarea.getDescripcion() %></td>
                <td><%= new SimpleDateFormat("yyyy-MM-dd").format(tarea.getFechaDeVencimiento()) %></td>
                <td></td>
            </tr>
    <%
            current = current.siguiente;
        }
    } else {
        out.println("No hay tareas disponibles.");
    }
    %>
</tbody>
                    </table>
                </div>
            </div>


        </div>
    </div>
</section>
<%@include file = "templates/footer.jsp" %>
<%
    Lista lista = (Lista) session.getAttribute("listaTareas");
    boolean listaVacia = (lista == null) || lista.verificarContenido();
%>
<!-- JavaScript para verificar si la lista de tareas esta vacia o no para mantener visibles los radio buttons
en el formulario o en el caso de que no hayan tareas añadidas los botones dejan de estar disponibles y se reduce 
el tamaño del contenedor del formulario  -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var listaVacia = <%= listaVacia %>;
        var tareasContainer = document.querySelector(".tareas-container");

        if (listaVacia) {
            tareasContainer.style.display = "none";
        } else {
            tareasContainer.style.display = "block";
        }
    });
</script>
<!-- JavaScript para lanzar una alerta de error de id duplicada -->
<script>
    // JavaScript para mostrar la alerta cuando sea necesario
    document.addEventListener("DOMContentLoaded", function () {
        // Obtén la alerta por su ID
        const errorAlert = document.getElementById('errorAlert');

        // Verifica si hay un parámetro de alerta en la URL (por ejemplo, '?alert=error')
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('alert') && urlParams.get('alert') === 'error') {
            // Muestra la alerta si el parámetro de alerta es 'error'
            errorAlert.style.display = 'block';
        }
    });
</script>
<!-- JavaScript para mejorar la funcionalidad de los radio buttons si se selecciona o se desactiva -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var antesDeRadio = document.getElementById("antesDeRadio");
        var despuesDeRadio = document.getElementById("despuesDeRadio");
        var idAntesDeInput = document.getElementById("idAntesDe");
        var idDespuesDeInput = document.getElementById("idDespuesDe");
        var primeroRadio = document.getElementById("primeroRadio");
        var ultimoRadio = document.getElementById("ultimoRadio");

        idAntesDeInput.disabled = true;
        idDespuesDeInput.disabled = true;

        antesDeRadio.addEventListener("click", function () {
            idAntesDeInput.disabled = !antesDeRadio.checked;
            idDespuesDeInput.disabled = true;
        });

        despuesDeRadio.addEventListener("click", function () {
            idDespuesDeInput.disabled = !despuesDeRadio.checked;
            idAntesDeInput.disabled = true;
        });

        primeroRadio.addEventListener("click", function () {
            idAntesDeInput.disabled = true;
            idDespuesDeInput.disabled = true;
        });

        ultimoRadio.addEventListener("click", function () {
            idAntesDeInput.disabled = true;
            idDespuesDeInput.disabled = true;
        });
    });
</script>
