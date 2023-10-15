/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.umariana.mundo;

/**
 *
 * @author Samuel Bolaños
 */
public class Lista {
    private Nodo inicio;
    private Nodo fin;

    public Lista() {
    }

    public Lista(Nodo inicio, Nodo fin) {
        this.inicio = inicio;
        this.fin = fin;
    }
    /**
     * Metodo para verificar si la lista ya tiene tareas o no
     * @return 
     */
    public boolean verificarContenido(){
        if(inicio==null){
            return true;
        }else{
            return false;
        }
    }
    /**
     * Metodo para agregar una tarea a un nodo de la tarea
     * @param tarea 
     */
    public void agregarTarea(Tarea tarea){
        Nodo actual;
        //Si la Lista no tiene tareas, se agrega la tarea al inicio de la lista
        if(verificarContenido()){
            actual = new Nodo(tarea, null);
            //referencias de apoyo para hacer el recorrido de la lista
            inicio = actual;
            fin = actual;
        }else{
            //Si ya tiene tareas agregadas, se agrega la tarea despues de la ultima agregada
            actual = new Nodo(tarea, inicio);
            fin.setSiguiente(actual);
            fin = actual;                    
        }
    }
}
