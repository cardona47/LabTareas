<%-- 
    Document   : Tareas
    Created on : 7/10/2023, 5:36:50 p. m.
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file = "templates/header.jsp" %>
<section class="vh-100" style="background: linear-gradient(to top right, #007f00, #000000);">
    <div class="container p-4"> <!-- clase contenedora -->
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #1A1A1A;">
            <div class="container-fluid">
                <a class="navbar-brand"href="#" style="color: white;">Tu Organizador de Tareas</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#"">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Tareas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" id="cerrarSesion">Cerrar Sesión</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
        
        
        <h1 class="text-center mt-4 mb-4" style="color: white;">Tareas</h1>
        <div class="row">
            <div class="col-md-4 d-flex justify-content-center align-items-center"> <!-- Agrega las clases d-flex, justify-content-center y align-items-center -->
                    <div class="card card-body text-center" style="background-color: #1A1A1A; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
                        <h4 class="text-center" style="color: white;">Agrega tareas</h4>
                        <form>
                            <div class="input-group mb-3">
                        <label class="input-group-text" for="nombre">Id</label>
                        <input type="text" name ="nombre" class="form-control">
                    </div>                                            
                    
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="raza">Titulo</label>
                        <input type="text" name="raza" class="form-control">
                    </div>
                            <div class="input-group mb-3">
                        <label class="input-group-text" for="nombre">Descripcion</label>
                        <input type="text" name ="nombre" class="form-control">
                    </div>                                            
                    
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="raza">Fecha de vencimiento</label>
                        <input type="date" name="raza" class="form-control">
                    </div>
                            <button type="submit" class="btn btn-primary" style="background-color: #2E86C1; border-color: #2E86C1;">Agregar tarea</button>
                        </form>
                    </div>
            </div>
            <div <div class="col-md-8"> <!-- 8 columnas para la tabla -->
                <div>
                    <table class="table table-bordered" style="background-color: #1A1A1A; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Titulo</th>
                                <th scope="col">Descripcion</th>
                                <th scope="col">Fecha de vencimiento</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row"></th>
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
