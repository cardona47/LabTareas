<%-- 
    Document   : index
    Created on : 4/10/2023, 4:51:24 p. m.
    Author     : Josue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file = "templates/header.jsp" %>
<section class="vh-100" style="background: linear-gradient(to top right, #000000, #007f00);">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem; background-color: #1A1A1A;">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block">
                            <img src="https://s2.best-wallpaper.net/wallpaper/iphone/1811/Orange-light-circle-black-background_iphone_1080x1920.jpg"
                                 alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
                        </div>
                        <div class="col-md-6 col-lg-7 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-white">

                                <%-- formulario para el login --%>

                                <form  action="SvLogin" method="POST">
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;" id="errorAlert">
                                        Datos incorrectos o usuario no existente. Vuelva a intentarlo.
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>

                                    <div class="alert alert-success alert-dismissible fade show" role="alert" style="display: none;" id="registroSuccessAlert">
                                        ¡Registro exitoso! El usuario se añadio al sistema.
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>


                                    <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display: none;" id="registroErrorAlert">
                                        La cedula ingresada ya esta registrada a un usuario. Vuelva a intentarlo con otro numero de cedula.
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>


                                    <div class="d-flex align-items-center mb-3 pb-1">
                                        <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                                        <span class="h1 fw-bold mb-0">Gestión de Tareas</span>
                                    </div>

                                    <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Iniciar sesion</h5>

                                    <div class="form-outline mb-4">
                                        <input type="text" id="form2Example17" class="form-control form-control-lg"name="Cedula" />
                                        <label class="form-label" for="form2Example17" style="color: white;">Cedula Usuario</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="password" id="form2Example27" class="form-control form-control-lg"name="contrasenia" />
                                        <label class="form-label" for="form2Example27" style="color: white;">Contraseña</label>
                                    </div>

                                    <div class="pt-1 mb-4">
                                        <button class="btn btn-dark btn-lg btn-block" type="submit" style="background-color: #006600; ">Login</button>
                                    </div>

                                    <p class="mb-5 pb-lg-2" style="color: #ffffff;">No está registrado? <a href="#!" style="color: #ff6219;" data-bs-toggle="modal" data-bs-target="#exampleModal">Regístrate aquí</a></p>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ventana Modal para formulario de registro de nuevos usuarios-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="background-color: #1A1A1A;">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel" style="color: white;">Registrarse</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="background-color: #FFFFFF;"></button>
            </div>
            <div class="modal-body">
                <form action="SvUsuario" method="POST">

                    <div id="usuario-details">
                        <div class="form-group">
                            <label for="Cedula" style="color: white;">Cedula</label>
                            <input type="text" id="Cedulan" class="form-control form-control-lg" name="Cedulan" required>
                            <div class="invalid-feedback" style="color: white;">Por favor, ingresa tu cédula.</div>
                        </div>

                        <div class="form-group">
                            <label for="NombreUsuario" style="color: white;">Nombre de usuario</label>
                            <input type="text" id="NombreUsuarion" class="form-control form-control-lg" name="NombreUsuarion" required>
                            <div class="invalid-feedback" style="color: white;">Por favor, ingresa tu nombre de usuario.</div>
                        </div>

                        <div class="form-group">
                            <label for="Contrasenia" style="color: white;">Contraseña</label>
                            <input type="password" id="Contrasenian" class="form-control form-control-lg" name="Contrasenian" required>
                            <div class="invalid-feedback" style="color: white;">Por favor, ingresa tu contraseña.</div>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-dark btn-lg btn-block" id="btnRegistrar" style="background-color: #006600;">Registrarse</button>
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="color: white; background-color: #ff6219;">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        // Agrega un controlador de clic al enlace "Regístrate aquí"
        $("a[href='#exampleModal']").on('click', function () {
            // Muestra el modal cuando se hace clic en el enlace
            $('#exampleModal').modal('show');
        });
    });
</script>

<!-- JavaScript para mostrar la alerta cuando falle el proceso de login -->
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

<!-- JavaScript para mostrar la alerta de registro cuando exista una cedula previamente registrada -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Obtén la alerta por su ID
        const registroErrorAlert = document.getElementById('registroErrorAlert');

        // Verifica si hay un parámetro de alerta en la URL (por ejemplo, '?alert=registro-error')
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('alert') && urlParams.get('alert') === 'registro-error') {
            // Muestra la alerta de registro si el parámetro de alerta es 'registro-error'
            registroErrorAlert.style.display = 'block';
        }
    });
</script>

<!-- JavaScript para mostrar la alerta de registro exitoso cuando sea necesario -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Obtén la alerta por su ID
        const registroSuccessAlert = document.getElementById('registroSuccessAlert');

        // Verifica si hay un parámetro de alerta en la URL (por ejemplo, '?alert=registro-success')
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('alert') && urlParams.get('alert') === 'registro-success') {
            // Muestra la alerta de registro exitoso si el parámetro de alerta es 'registro-success'
            registroSuccessAlert.style.display = 'block';
        }
    });
</script>

<%@include file = "templates/footer.jsp" %>


