/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.umariana.mundo;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 *
 * @author Acer
 */
public class RegistrarUsuarios {
    /**
     * Metodo para guardar o registrar los usuarios validados en un archivo".txt" en la carpeta data del proyecto
     * @param usuariosnuevos
     * @param context
     * @throws IOException 
     */
    public static void guardarUsuario(ArrayList<Usuario> usuariosnuevos, ServletContext context) throws IOException {
        String relativePath = "/data/usuarios.txt";
        String absPath = context.getRealPath(relativePath);
        
        //Escritura del archivo con try-catch para manejar los posibles errores de escritura del archivo
        try (BufferedWriter escritor = new BufferedWriter(new FileWriter(absPath))) {
            for (Usuario usuario : usuariosnuevos) {
                String linea = usuario.getCedula() + ","
                        + usuario.getNombreUsuario() + ","
                        + usuario.getContrasenia();
                escritor.write(linea);
                escritor.newLine();
            }
            System.out.println("Datos de usuarios guardados exitosamente en: usuarios.txt");
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Error al guardar los datos de usuarios: " + e.getMessage());
        }
    }
    /**
     * Metodo para leer  o cargar el archivo que contiene los usuarios registrados en el archivo ".txt"
     * Manejamos excepcion con try-catch para controlar los posibles errores en la lectura del archivo
     * @param context
     * @return Arraylist con la lista de usuarios 
     * @throws IOException 
     */
    public static ArrayList<Usuario> cargarUsuario(ServletContext context) throws IOException {
        //direccion o path del archivo ".TXT"
        ArrayList<Usuario> listaUsuarios = new ArrayList<>();
        String relativePath = "/data/usuarios.txt";
        String absPath = context.getRealPath(relativePath);
        
        //Lectura del archivo linea por linea 
        try (BufferedReader lector = new BufferedReader(new FileReader(absPath))) {
            String linea = lector.readLine();
            while (linea != null) {
                String[] datos = linea.split(",");
                String cedula = datos[0];
                String nombre = datos[1];
                String contrasenia = datos[2];
                
                //Asignamos los datos a un nuevo objeto "nuevoUsuario"
                Usuario nuevoUsuario = new Usuario();
                nuevoUsuario.setCedula(cedula);
                nuevoUsuario.setNombreUsuario(nombre);
                nuevoUsuario.setContrasenia(contrasenia);
                
                //Añadimos el objeto al ArrayList que va a contener la lista de usuarios registrados
                listaUsuarios.add(nuevoUsuario);
                linea = lector.readLine();
            }
            System.out.println("Datos de usuarios cargados exitosamente desde: usuarios.txt");
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Error al cargar los datos de usuarios: " + e.getMessage());
        }
        return listaUsuarios;
    }

}