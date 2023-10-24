/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.umariana.mundo;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletContext;

/**
 *
 * @author Samuel Bolaños
 */
public class Lista {

    public Nodo inicio = null;
    public Nodo fin = null;

    //Verificamos si la lista esta vacia, y retorna "true" en caso de que si este vacia
    public boolean verificarContenido() {
        return inicio == null;
    }

    //Clase nodo con sus atritbutos
    public class Nodo {

        public Tarea tarea;
        public Nodo siguiente;

        //Constructor de un nodo
        public Nodo(Tarea tarea) {
            this.tarea = tarea;
            this.siguiente = null;
        }
    }

    /**
     * Metodo para agregar una nueva tarea al inicio de la lista
     *
     * @param tarea
     */
    public void agregarTareaAlInicio(Tarea tarea) {
        Nodo nuevoNodo = new Nodo(tarea);

        if (inicio == null) {
            // Si la lista está vacía, el nuevo nodo es el inicio y el final de la lista
            inicio = nuevoNodo;
            fin = nuevoNodo;
        } else {
            // Si no está vacía, el nuevo nodo se agrega al comienzo y se actualiza el inicio
            nuevoNodo.siguiente = inicio;
            inicio = nuevoNodo;
        }
    }

    /**
     * Metodo para agregar una tarea nueva al final de la lista
     *
     * @param tarea
     */
    public void agregarTareaAlFinal(Tarea tarea) {
        Nodo nuevoNodo = new Nodo(tarea);

        if (inicio == null) {
            //Si la lista está vacía, el nuevo nodo es tanto el inicio como el fin
            inicio = nuevoNodo;
            fin = nuevoNodo;
        } else {
            //Si no está vacía, el nuevo nodo se agrega al final y se actualiza el fin
            fin.siguiente = nuevoNodo;
            fin = nuevoNodo;
        }
    }

    /**
     * Adiciona una tarea a la lista de tareas antes de la tarea con el id
     * especificado.
     *
     * @param id El id de la tarea antes de la cual se va a insertar la nueva
     * tarea.
     * @param tarea La tarea que se va a agregar.
     */
    public void agregarTareaAntesDe(int id, Tarea tarea) {
        if (inicio == null) {
            return;
        } else if (id == inicio.tarea.getId()) {
            Nodo nuevoNodo = new Nodo(tarea);
            nuevoNodo.siguiente = inicio;
            inicio = nuevoNodo;
        } else {
            Nodo anterior = localizarAnteriorPorId(id);
            if (anterior == null) {
                return;
            }
            Nodo nuevoNodo = new Nodo(tarea);
            nuevoNodo.siguiente = anterior.siguiente;
            anterior.siguiente = nuevoNodo;
        }
    }

    /**
     * Adiciona una tarea a la lista de tareas después de la tarea con el id
     * especificado.
     *
     * @param id El id de la tarea después de la cual se va a insertar la nueva
     * tarea.
     * @param tarea La tarea que se va a agregar.
     */
    public void agregarTareaDespuesDe(int id, Tarea tarea) {
        Nodo anterior = localizarPorId(id);

        if (anterior == null) {
            return;
        } else {
            //El nuevo nodo se agrega a la lista y se actualiza la lista
            Nodo nuevoNodo = new Nodo(tarea);
            nuevoNodo.siguiente = anterior.siguiente;
            anterior.siguiente = nuevoNodo;
        }
    }

    /**
     * Busca la tarea con el id dado en la lista de tareas.
     *
     * @param id El id de la tarea que se va a buscar.
     * @return La tarea con el id especificado. Si la tarea no existe, se
     * retorna null.
     */
    public Nodo localizarPorId(int id) {
        Nodo actual = inicio;
        while (actual != null && actual.tarea.getId() != id) {
            actual = actual.siguiente;
        }
        return actual;
    }

    /**
     * Busca la tarea anterior a la tarea con el id especificado.
     *
     * @param id El id de la tarea de la cual se desea encontrar la tarea
     * anterior.
     * @return La tarea anterior a la tarea con el id dado. Se retorna null si
     * la tarea con el id dado no existe o si es la primera de la lista.
     */
    public Nodo localizarAnteriorPorId(int id) {
        Nodo anterior = null;
        Nodo actual = inicio;

        while (actual != null && actual.tarea.getId() != id) {
            anterior = actual;
            actual = actual.siguiente;
        }

        return (actual != null) ? anterior : null;
    }

    /**
     * Metodo para eliminar una tarea de la lista, solicitamos el id de la tarea
     * a eliminar
     *
     * @param id
     */
    public void eliminarTarea(int id) {
        if (inicio == null) {
            System.out.println("La lista de tareas está vacía, no se pudo eliminar la tarea con id: " + id);
            return;
        }

        if (id == inicio.tarea.getId()) {
            //La tarea es la primera de la lista
            inicio = inicio.siguiente;
        } else {
            //La tarea es un elemento intermedio de la lista
            Nodo anterior = localizarAnteriorPorId(id);
            if (anterior == null) {
                System.out.println("No se encontró una tarea con id: " + id + " para eliminar.");
                return;
            }
            anterior.siguiente = anterior.siguiente.siguiente; // Desconectar la tarea
        }

    }

    /**
     * Metodo para editar los datos de una tarea de la lista
     *
     * @param id
     * @param nuevoTitulo
     * @param nuevaDescripcion
     * @param nuevaFechadeV
     */
    public void editarTarea(int id, String nuevoTitulo, String nuevaDescripcion, String nuevaFechadeV) {
        Nodo tareaExistente = localizarPorId(id);

        if (tareaExistente != null) {
            //Edita la tarea con los nuevos parametros ingresados por el usuario
            tareaExistente.tarea.setTitulo(nuevoTitulo);
            tareaExistente.tarea.setDescripcion(nuevaDescripcion);

            // Convierte la cadena de fecha en un objeto Date
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date nuevaFecha = dateFormat.parse(nuevaFechadeV);
                tareaExistente.tarea.setFechaDeVencimiento(nuevaFecha);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Metodo para registrar o guardar en el archivo de texto las tareas
     * agregadas agregadas
     *
     * @param listaActualizada
     * @param context
     */
    public static void guardarLista(Lista listaActualizada, ServletContext context) {
        // Ruta relativa
        String rutaRelativa = "/data/tareas.txt";
        // Ruta absoluta
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File file = new File(rutaAbsoluta);
        //Escritura del archivo con sus excepciones
        try (PrintWriter writer = new PrintWriter(file)) {
            Nodo temp = listaActualizada.inicio;
            while (temp != null) {
                Tarea tarea = temp.tarea;
                // Guarda los atributos de la tarea en el archivo separados por un punto y coma
                writer.println(tarea.getId() + ";" + tarea.getTitulo() + ";" + tarea.getDescripcion() + ";" + tarea.getFechaDeVencimiento());
                temp = temp.siguiente;
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    /**
     * Metodo para leer el archivo de texto que contiene las tareas agregadas
     *
     * @param context
     * @return
     */
    public static Lista leerLista(ServletContext context) {
        //Ruta relativa
        String rutaRelativa = "/data/tareas.txt";

        //Ruta absoluta
        String rutaAbsoluta = context.getRealPath(rutaRelativa);

        File file = new File(rutaAbsoluta);
        Lista lista = new Lista();

        //Lectura del archivo con excepciones
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] atributos = line.split(";");
                if (atributos.length == 4) {
                    int id = Integer.parseInt(atributos[0]);
                    String titulo = atributos[1];
                    String descripcion = atributos[2];
                    String fechaVStr = atributos[3];

                    //Realizamos el parsing de la fecha desde la cadena
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    Date fechaV = dateFormat.parse(fechaVStr);
                    Tarea tarea = new Tarea(id, titulo, descripcion, fechaV);
                    lista.agregarTareaAlInicio(tarea);
                }
            }
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }
        return lista;
    }
}
