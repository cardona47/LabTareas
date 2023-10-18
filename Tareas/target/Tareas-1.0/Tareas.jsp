<%-- 
    Document   : Tareas
    Created on : 7/10/2023, 5:36:50 p. m.
    Author     : Acer
--%>

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
                    <h4 class="text-center" style="color: white;">Agrega tareas</h4>
                    <form action="SvTarea" method="POST">
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="nombre">Id</label>
                            <input type="text" name ="id" class="form-control">
                        </div>                                            

                        <div class="input-group mb-3">
                            <label class="input-group-text" for="raza">Titulo</label>
                            <input type="text" name="titulo" class="form-control">
                        </div>
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="nombre">Descripcion</label>
                            <input type="text" name ="descripcion" class="form-control">
                        </div>                                            

                        <div class="input-group mb-3">
                            <label class="input-group-text" for="raza">Fecha de vencimiento</label>
                            <input type="date" name="fechav" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-primary" style="background-color: #ff6219; border-color: #ff6219;">Agregar tarea</button>
                    </form>
                    <div class="mt-4">
    <h4 class="text-center" style="color: white;">Agregar tarea</h4>
    <div class="form-check">
        <input class="form-check-input" type="radio" name="estadoTarea" id="pendiente" value="pendiente" checked>
        <label class="form-check-label" for="pendiente" style="color: white;">Antes de</label>
    </div>
    <div class="form-check">
        <input class="form-check-input" type="radio" name="estadoTarea" id="enProgreso" value="enProgreso">
        <label class="form-check-label" for="enProgreso" style="color: white;">Despues de</label>
    </div>
</div>

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
                        <tbody style="background-color: #1a1a1a;">
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>
    </div>
</section>
<%@include file = "templates/footer.jsp" %>
