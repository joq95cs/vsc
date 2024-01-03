package app;

import java.awt.*;
import java.awt.event.*;
import java.io.*;
import javax.swing.*;
import javax.swing.table.*;

public class Marco extends JFrame {

    public Marco(Tabla tabla) {

        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setTitle("Níveles de ansiedad");

        int w = Toolkit.getDefaultToolkit().getScreenSize().width,
                h = Toolkit.getDefaultToolkit().getScreenSize().height;

        setSize(700, 400);
        setLocation(w / 2 - getWidth() / 2, h / 2 - getHeight() / 2);

        addWindowListener(new OyenteVentana());

        Lamina lamina = new Lamina();

        ArchivoDatos.setLamina(lamina);

        add(lamina);
    }

    public class Lamina extends JPanel {

        public Lamina() {

            fijar();
        }

        public void fijar() {

            removeAll();

            setLayout(new BorderLayout());

            JButton btn = new JButton("Nuevo registro");
            btn.addMouseListener(new OyenteBoton());

            JPanel ln = new JPanel();
            ln.setLayout(new FlowLayout(FlowLayout.RIGHT));
            ln.add(btn);
            add(ln, BorderLayout.NORTH);
        }
    }

    private class OyenteVentana extends WindowAdapter {

        @Override
        public void windowClosing(WindowEvent e) {

            try {

                ArchivoDatos.cerrarLector();
            } catch (IOException e1) {

                e1.printStackTrace();
            }
        }
    }

    private class OyenteBoton extends MouseAdapter {

        @Override
        public void mouseClicked(MouseEvent e) {

            try {

                ArchivoDatos.escribir();
            } catch (IOException e1) {

                e1.printStackTrace();
            }
        }
    }

    public DefaultTableModel getModelo() {

        return modelo;
    }

    private DefaultTableModel modelo;
}