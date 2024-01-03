package app;

import java.io.*;

import javax.swing.*;

public class App {

    public static void main(String[] args) throws Exception {

        try {

            Tabla tabla = new Tabla();

            Marco m = new Marco(tabla);

            ArchivoDatos.setModelo(m.getModelo());

            ArchivoDatos.setTabla(tabla);

            ArchivoDatos.leer();

            m.setVisible(true);

        } catch(IOException e) {

            JOptionPane.showMessageDialog(null, "Archivo no encontrado", "Error", 0);

        } catch(Exception e) {

            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", 0);

        }
    }
}