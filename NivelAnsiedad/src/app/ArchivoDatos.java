package app;

import java.awt.BorderLayout;
import java.io.*;
import java.util.*;
import java.time.*;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class ArchivoDatos {

    public static void leer() throws IOException {

        br = new BufferedReader(new FileReader("src/app/Datos.txt"));

        tabla.iniciarFilas();

        int i = 0;

        while(br.ready()) {

            StringTokenizer st = new StringTokenizer(br.readLine(), "-");

            while(st.hasMoreTokens()) {

                //System.out.print(st.nextToken() + " - ");

                tabla.getFila(i).add(st.nextToken());
            }

            //System.out.println();
            i++;
        }

        //tabla.probar();

        crearModelo();
    }

    public static void cerrarLector() throws IOException {

        br.close();
    }

    public static void escribir() throws IOException {

        //1. Pedir los datos

        LocalDate fecha = LocalDate.now();

        String dia = "" + fecha.getDayOfMonth();
        if(dia.length() == 1) {

            dia = "0" + dia;
        }

        String mes = "" + fecha.getMonthValue();
        if(mes.length() == 1) {

            mes = "0" + mes;
        }

        ArrayList<String> nuevo_registro = new  ArrayList<String>();

        for(int i=0; i<39; i++) {

            try {

                if(i == 0) {

                    nuevo_registro.add("" + JOptionPane.showInputDialog(null, "Fecha", dia + "/" + mes + "/" + fecha.getYear()));
                    continue;
                }

                nuevo_registro.add("" + Integer.parseInt(JOptionPane.showInputDialog(null, tabla.getFila(i).get(1))));

            } catch(NumberFormatException e ) {

                return;
            }
        }

        /*for(String e: nuevo_registro) {

            System.out.println(e);
        }*/

        //2: Leer todo el contenido y guardar cada linea

        ArrayList<String> lineas = new ArrayList<String>();

        br = new BufferedReader(new FileReader("src/app/Datos.txt"));
        
        while(br.ready()) {
        
            lineas.add(br.readLine());
        }

        //3. Escribir

        for(int i=0; i<39; i++) {

            String nueva_linea = lineas.get(i);
            nueva_linea += "-" + nuevo_registro.get(i);

            lineas.set(i, nueva_linea);
        }

        /*for(String e: lineas) {

            System.out.println(e);
        }*/

        BufferedWriter bw = new BufferedWriter(new FileWriter("src/app/Datos.txt"));

        bw.write("");

        for(String each: lineas) {

            bw.append(each);
            bw.newLine();
        }

        bw.close();

        leer();
    }

    public static void setModelo(DefaultTableModel m) {
        
        modelo = m;
    }

    public static void setTabla(Tabla t) {
        
        tabla = t;
    }

    public static void setLamina(Marco.Lamina l) {

        lamina = l;
    }
    
    private static void crearModelo() {

        modelo = new DefaultTableModel();

        for(int i=0; i<tabla.getFila(0).size(); i++) {

            modelo.addColumn(tabla.getFila(0).get(i));

            //System.out.println(tabla.getFila(0).get(i));
        }

        for(int i=1; i<39; i++) {

            String[] row = new String[tabla.getFila(i).size()];

            for(int j=0; j<tabla.getFila(i).size(); j++) {

                row[j] = tabla.getFila(i).get(j);
            }

            modelo.addRow(row);
        }

        ArrayList<Integer> totales = contarTotales();

        String[] fila_totales = new String[totales.size()+2];

        //System.out.println(fila_totales.length);

        for(int i=0; i<fila_totales.length; i++) {

            if(i == 0) {

                fila_totales[i] = "";
                continue;
            } else if(i == 1) {

                fila_totales[i] = "Totales";
                continue;
            }

            fila_totales[i] = "" + totales.get(i-2);
        }

        modelo.addRow(fila_totales);

        lamina.fijar();

        JTable t = new JTable(modelo);
        t.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);

        lamina.add(new JScrollPane(t, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED, JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED), BorderLayout.CENTER);

        lamina.updateUI();
    }

    private static ArrayList<Integer> contarTotales() {

        ArrayList<Integer> totales = new ArrayList<Integer>();

        for(int c=2; c<tabla.getFila(0).size(); c++) {

            int t = 0;

            for(int i=1; i<39; i++) {
    
                t += Integer.parseInt(tabla.getFila(i).get(c));
                //System.out.println(tabla.getFila(i).get(c));
            }
    
            //System.out.println(t);

            totales.add(t);
        }

        /*for(int i: totales) {

            System.out.println(i);
        }*/

        return totales;

    }

    private static BufferedReader br;

    private static DefaultTableModel modelo;

    private static Tabla tabla;

    private static Marco.Lamina lamina;
}