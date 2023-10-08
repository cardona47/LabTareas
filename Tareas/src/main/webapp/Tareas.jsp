<%-- 
    Document   : Tareas
    Created on : 7/10/2023, 5:36:50 p. m.
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file = "templates/header.jsp" %>
<section class="vh-100" style="background-color: #9A616D;">
    <div class="container p-4"> <!-- clase contenedora -->
        <h1 class="text-center">Tareas</h1>
        <div class="row">
            <div class="col-md-4 d-flex justify-content-center align-items-center"> <!-- Agrega las clases d-flex, justify-content-center y align-items-center -->
                    <div class="card card-body text-center"> <!-- Agrega la clase text-center -->
                        <h4 class="text-center">Agrega tareas</h4>
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
                        <label class="input-group-text" for="raza">Fecha de v</label>
                        <input type="date" name="raza" class="form-control">
                    </div>
                            <button type="submit" class="btn btn-primary">Agregar tarea</button>
                        </form>
                    </div>
            </div>
            <div <div class="col-md-8"> <!-- 8 columnas para la tabla -->
                <div>
                    <table class="table table-bordered">
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
