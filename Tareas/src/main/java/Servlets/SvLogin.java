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
        
        String cedula = request.getParameter("Cedula");
        String contrasenia = request.getParameter("contrasenia");
        
        ArrayList<Usuario> UsuariosR = RegistrarUsuarios.cargarUsuario(getServletContext());
        
        boolean autenticado = false;
    //validacion de los datos que ingresa el usuario con los datos del ArrayList
    for (Usuario usuario : UsuariosR) {
        if (usuario.getCedula().equals(cedula) && usuario.getContrasenia().equals(contrasenia)) {
            autenticado = true;
            break; // Si el usuario es validado sera redirigido
        }
    }
    
    if (autenticado) {
        // Autenticación exitosa, redirige al usuario a Tareas.jsp
        response.sendRedirect("Tareas.jsp");
    } else {
        // Autenticación fallida, redirige al usuario a index.jsp
        response.sendRedirect("index.jsp");
    }

        processRequest(request, response);
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
