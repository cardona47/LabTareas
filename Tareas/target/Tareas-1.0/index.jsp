<%-- 
    Document   : index
    Created on : 4/10/2023, 4:51:24 p. m.
    Author     : Josue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file = "templates/header.jsp" %>
 <section class="vh-100" style="background-color: #9A616D;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img1.webp"
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">

                <form>

                  <div class="d-flex align-items-center mb-3 pb-1">
                    <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                    <span class="h1 fw-bold mb-0">Logo</span>
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>

                  <div class="form-outline mb-4">
                    <input type="email" id="form2Example17" class="form-control form-control-lg" />
                    <label class="form-label" for="form2Example17">cedula</label>
                  </div>

                  <div class="form-outline mb-4">
                    <input type="password" id="form2Example27" class="form-control form-control-lg" />
                    <label class="form-label" for="form2Example27">Nombre de usuario</label>
                  </div>
                  
                  <div class="form-outline mb-4">
                    <input type="password" id="form2Example27" class="form-control form-control-lg" />
                    <label class="form-label" for="form2Example27">Contraseña</label>
                  </div>

                  <div class="pt-1 mb-4">
                    <button class="btn btn-dark btn-lg btn-block" type="button">Login</button>
                  </div>

                  <a class="small text-muted" href="#!">Forgot password?</a>
                  <p class="mb-5 pb-lg-2" style="color: #393f81;">No está registrado? <a href="#!" style="color: #393f81;" data-bs-toggle="modal" data-bs-target="#exampleModal">Regístrate aquí</a></p>
                  <a href="#!" class="small text-muted">Terms of use.</a>
                  <a href="#!" class="small text-muted">Privacy policy</a>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
    <!-- ventana Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Registrarse</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="SvUsuario" method="POST"
                <div id="usuario-details">
            <div class="form-group">
                <label for="Cedula">Cedula</label>
                <input type="text" id="Cedula" class="form-control form-control-lg" name="Cedula" required>
                <div class="invalid-feedback">Por favor, ingresa tu cédula.</div>
            </div>

            <div class="form-group">
                <label for="NombreUsuario">Nombre de usuario</label>
                <input type="text" id="NombreUsuario" class="form-control form-control-lg" name="NombreUsuario" required>
                <div class="invalid-feedback">Por favor, ingresa tu nombre de usuario.</div>
            </div>

            <div class="form-group">
                <label for="Contrasenia">Contraseña</label>
                <input type="password" id="Contrasenia" class="form-control form-control-lg" name="Contrasenia" required>
                <div class="invalid-feedback">Por favor, ingresa tu contraseña.</div>
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-dark btn-lg btn-block" id="btnRegistrar">Registrarse</button>
            </div>
        </div>
                </form>
            </div>
            
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
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

<%@include file = "templates/footer.jsp" %>


