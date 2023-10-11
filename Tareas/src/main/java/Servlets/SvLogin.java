/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import com.umariana.mundo.RegistrarUsuarios;
import com.umariana.mundo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Acer
 */
@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //pedimos los datos del formulario del login y los guardamos en variables
        String cedula = request.getParameter("Cedula");
        String contrasenia = request.getParameter("contrasenia");

        //llamamos al metodo de registrar usuarios de la clase "registrarUsuarios.java" y lo guardamos en un ArrayList
        ArrayList<Usuario> UsuariosR = RegistrarUsuarios.cargarUsuario(getServletContext());

        //Aqui tenemos todo el proceso de validacion del usuario con su cedula y contraseña con una variable booleana        
        boolean autenticado = false;
        String usuarioverificado = null;
        for (Usuario usuario : UsuariosR) {
            if (usuario.getCedula().equals(cedula) && usuario.getContrasenia().equals(contrasenia)) {
                autenticado = true;
                usuarioverificado = usuario.getNombreUsuario();
                break; // Si encontramos una coincidencia, no necesitamos seguir buscando
            }
        }

        if (autenticado) {
            //Validacion exitosa, redirige al usuario a la página de tareas
            request.getSession().setAttribute("usuarioverificado", usuarioverificado);
            response.sendRedirect("Tareas.jsp");
        } else {
            //Validacion fallida, redirige al usuario a la página index
            response.sendRedirect("index.jsp?alert=error");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
