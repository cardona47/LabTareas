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
        <!-- Alertas de notificacion(tarea agregada y tarea eliminada -->          
        <div class="alert alert-success text-center" role="alert" style="display: none;" id="successAlert">
            <strong>Tarea agregada</strong>
        </div>
        <div class="alert alert-success text-center" role="alert" style="display: none;" id="successAlertEliminada">
            <strong>Tarea eliminada</strong>    
        </div>
        <div class="alert alert-success text-center" role="alert" style="display: none;" id="editAlert">
            <strong>Tarea editada</strong> 
        </div>
        <%-- formulario para agregar tareas --%>
        <h1 class="text-center mt-4 mb-4" style="color: white;">Tareas</h1>
        <div class="row">
            <div class="col-md-4 d-flex justify-content-center align-items-center"> <!-- Agrega las clases d-flex, justify-content-center y align-items-center -->
                <div class="card card-body text-center" style="background-color: #1A1A1A; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
                    <h4 class="text-center" style="color: tomato;">Agrega tareas</h4>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;" id="errorAlert">
                     Ya hay una tarea agregada en la lista con el mismo Id, por favor inténtalo de nuevo
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
                        <div class="tareas-container"style="display: none;">
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
                                <th scope="col">Id</th>
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
                                    Lista.Nodo nodoActual = listaTareas.inicio;
                                    while (nodoActual != null) {
                                        Tarea tarea = nodoActual.tarea;
                            %>
                            <tr>
                                <td><%= tarea.getId()%></td>
                                <td><%= tarea.getTitulo()%></td>
                                <td><%= tarea.getDescripcion()%></td>
                                <td><%= new SimpleDateFormat("yyyy-MM-dd").format(tarea.getFechaDeVencimiento())%></td>
                                <td>
                                    <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#tareaModal"
                                       onclick="showTareaDetails(<%= tarea.getId()%>, '<%= tarea.getTitulo()%>', '<%= tarea.getDescripcion()%>', '<%= new SimpleDateFormat("yyyy-MM-dd").format(tarea.getFechaDeVencimiento())%>')"
                                       title="Ver detalles" data-bs-toggle="tooltip" data-bs-placement="top">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="#" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#editarModal"
                                       data-id="<%= tarea.getId()%>"
                                       data-titulo="<%= tarea.getTitulo()%>"
                                       data-descripcion="<%= tarea.getDescripcion()%>"
                                       data-fecha="<%= new SimpleDateFormat("yyyy-MM-dd").format(tarea.getFechaDeVencimiento())%>"
                                       title="Editar tarea" data-bs-toggle="tooltip" data-bs-placement="top">
                                        <i class="fas fa-pencil-alt"></i>
                                    </a>
                                    <a onclick="eliminarTarea(<%= tarea.getId()%>)" class="btn btn-danger" title="Eliminar tarea" data-bs-toggle="tooltip" data-bs-placement="top">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </td>
                            </tr>
                            <%
                                        nodoActual = nodoActual.siguiente;
                                    }
                                } else {
                                    out.println("No hay tareas agregadas.");
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
<!-- Verificamos si la lista esta vacia -->
<%
    Lista lista = (Lista) session.getAttribute("listaTareas");
    boolean listaVacia = (lista == null) || lista.verificarContenido();
%>
<!-- JavaScript para verificar si la lista de tareas esta vacia o no,
inicialmente si no hay tareas agregadas en la lista, los radio buttons no seran visibles en la pagina, de lo contrario seran visibles -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var listaVacia = <%= listaVacia%>;
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
    // JavaScript para mostrar la alerta de error
    document.addEventListener("DOMContentLoaded", function () {
        const errorAlert = document.getElementById('errorAlert');
        errorAlert.style.display = 'none';

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

<!-- JavaScript para confirmar eliminacion de una tarea -->
<script>
    function eliminarTarea(id) {
        if (confirm("¿Esta seguro de eliminar la tarea?")) {
            location.href = "SvTarea?tipo=delete&id=" + id;
        }
    }
</script>

<!-- Ventana Modal para Editar Tarea -->
<div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="editarModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border" style="background-color: #1A1A1A; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
            <div class="modal-header" style="background-color: #1A1A1A;">
                <h5 class="modal-title" id="editarModalLabel" style="color: tomato;">Editar Tarea</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="SvEditarTarea" method="POST">
                    <!-- Campo oculto para almacenar el ID de la tarea -->
                    <input type="hidden" name="id" id="editar-tarea-id" value="">
                    <!-- Input para editar el título -->
                    <div class="mb-3">
                        <label for="titulo" class="form-label" style="color: white;">Título</label>
                        <input type="text" class="form-control" id="editar-tarea-titulo" name="titulo">
                    </div>
                    <!-- Input para editar la descripción -->
                    <div class="mb-3">
                        <label for="descripcion" class="form-label" style="color: white;">Descripción</label>
                        <textarea class="form-control" id="editar-tarea-descripcion" name="descripcion"></textarea>
                    </div>
                    <!-- Input para editar la fecha -->
                    <div class="mb-3">
                        <label for="fecha" class="form-label" style="color: white;">Fecha de vencimiento</label>
                        <input type="date" class="form-control" id="editar-tarea-fecha" name="fecha">
                    </div>
                    <!-- Botón para guardar cambios -->
                    <button type="submit" class="btn btn-primary" style="background-color: #ff6219; border-color: #ff6219;">Guardar Cambios</button>
                </form>
            </div>
            <div class="modal-footer" style="background-color: #1A1A1A;">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="color: white;">Cerrar</button>
            </div>
        </div>
    </div>
</div>


<!-- Script para prellenar los campos de edición -->
<script>
    $('#editarModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Botón que desencadenó el evento
        var id = button.data('id'); // Obtén el ID de la tarea
        var titulo = button.data('titulo'); // Obtén el título de la tarea
        var descripcion = button.data('descripcion'); // Obtén la descripción de la tarea
        var fecha = button.data('fecha'); // Obtén la fecha de la tarea

        // Rellena los campos del formulario de edición con los datos de la tarea
        $('#editar-tarea-id').val(id);
        $('#editar-tarea-titulo').val(titulo);
        $('#editar-tarea-descripcion').val(descripcion);
        $('#editar-tarea-fecha').val(fecha);
    });
</script>

<!-- Ventana Modal con la Informacion de la Tareas -->
<div class="modal fade" id="tareaModal" tabindex="-1" aria-labelledby="tareaModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content border" style="background-color: #1A1A1A; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
            <div class="modal-header" style="background-color: #1A1A1A;">
                <h5 class="modal-title" id="tareaModalLabel"style="color: tomato;">Detalles de la Tarea</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="tarea-details">
                    <p style="color: white;"><strong>ID:</strong> <span id="tarea-id"></span></p>
                    <p style="color: white;"><strong>Título:</strong> <span id="tarea-titulo"></span></p>
                    <p style="color: white;"><strong>Descripción:</strong> <span id="tarea-descripcion"></span></p>
                    <p style="color: white;"><strong>Fecha:</strong> <span id="tarea-fecha"></span></p>
                </div>
            </div>
            <div class="modal-footer" style="background-color: #1A1A1A;">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="color: white;">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<!-- Funcion para visualizar infromacion actual de la tareas -->
<script>
    function showTareaDetails(id, titulo, descripcion, fecha) {
        var modal = $('#tareaModal');
        modal.find('#tarea-id').text(id);
        modal.find('#tarea-titulo').text(titulo);
        modal.find('#tarea-descripcion').text(descripcion);
        modal.find('#tarea-fecha').text(fecha);
    }
</script>

<!-- Nombres de los botones de la tabla con tooltip -->
<script>
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
</script>

<!-- Funcion para activar la alerta de exito cuando se agrega una tarea -->
<script>
    // JavaScript para mostrar la alerta de éxito cuando sea necesario
    document.addEventListener("DOMContentLoaded", function () {
        // Obtén la alerta por su ID
        const successAlert = document.getElementById('successAlert');

        // Verifica si hay un parámetro de alerta en la URL (por ejemplo, '?alert=success')
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('alert') && urlParams.get('alert') === 'success') {
            // Muestra la alerta si el parámetro de alerta es 'success'
            successAlert.style.display = 'block';
            // Oculta la alerta después de 2.5 segundos (2500 milisegundos)
            setTimeout(function () {
                successAlert.style.display = 'none';
            }, 2500);
        }
    });
</script>

<!-- JavaScript para activar la alerta que indica que una tarea fue eliminada -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('eliminada') && urlParams.get('eliminada') === 'success') {
            const successAlertEliminada = document.getElementById('successAlertEliminada');
            successAlertEliminada.style.display = 'block';
            setTimeout(function () {
                successAlertEliminada.style.display = 'none';
            }, 2500); // Tiempo de visualización de la alerta en milisegundos (2.5 segundos en este caso)
        }
    });
</script>

<!-- JavaScript para activar la alerta que indica que una tarea fue editada -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const urlParams = new URLSearchParams(window.location.search);
        const alertType = urlParams.get('alert');

        if (alertType === 'edit') {
            const editAlert = document.getElementById('editAlert');
            editAlert.style.display = 'block';

            setTimeout(function () {
                editAlert.style.display = 'none';
            }, 2500); // 2500 milisegundos equivalen a 2.5 segundos
        }
    });
</script>
