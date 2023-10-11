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
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static jdk.jpackage.internal.Arguments.CLIOptions.context;

/**
 *
 * @author Josue
 */

@WebServlet(name = "SvUsuario", urlPatterns = {"/SvUsuario"})
public class SvUsuario extends HttpServlet {
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
        
        //solicitamos los datos del formulario del registro y los guardamos en variables
        String cedulan = request.getParameter("Cedulan");
        String nombre = request.getParameter("NombreUsuarion");
        String contran = request.getParameter("Contrasenian");
        
        //llamamos al metodo para registrar usuarios que contiene la lista de usuarios registrados y lo guardamos en una variable 
        ArrayList<Usuario> listaUsuarios = RegistrarUsuarios.cargarUsuario(getServletContext());
        
        //Nos aseguramos que la cedula que ingresa el usuario en el registro sea unica 
        boolean cedulaUnica = true;
    for (Usuario usuarioslist : listaUsuarios) {
        if (usuarioslist.getCedula().equals(cedulan)) {
            cedulaUnica = false;
            break;
        }
    }

    if (cedulaUnica) {
        // La cédula es única, se puede registrar al usuario
        //creamos un objeto "usuarionuevo" para un usuario nuevo con el constructor 
        Usuario usuarionuevo = new Usuario(cedulan, nombre, contran);
        //añadimos el usuario nuevo a la lista de usuarios registrados
        listaUsuarios.add(usuarionuevo);

        // Guardar la lista actualizada en el contexto
        RegistrarUsuarios.guardarUsuario(listaUsuarios, getServletContext());

        // Redireccionar a la página de inicio
        request.getRequestDispatcher("index.jsp").forward(request, response);
    } else {
        // La cédula ya existe en la lista de usuarios registrados
        response.sendRedirect("index.jsp");
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
