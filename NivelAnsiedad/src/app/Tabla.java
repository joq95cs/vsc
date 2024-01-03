package app;

import java.util.*;

public class Tabla {

    public Tabla() {

    }

    public void iniciarFilas() {

        filas = new ArrayList<ArrayList<String>>();

        for(int i=0; i<39; i++) {

            filas.add(new ArrayList<String>());
        }
    }

    public ArrayList<String> getFila(int index) {

        return filas.get(index);
    }

    public void probar() {

        for(ArrayList<String> fila: filas) {

            for(String celda: fila) {

                System.out.print(celda + " ");
            }

            System.out.println();
        }
    }

    private ArrayList<ArrayList<String>> filas;
}