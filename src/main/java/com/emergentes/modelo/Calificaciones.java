package com.emergentes.modelo;

public class Calificaciones {

    private int ID;
    private String Nombre;
    private int P1;
    private int P2;
    private int EF;

    public Calificaciones() {
        this.ID = 0;
        this.Nombre = "";
        this.P1 = 0;
        this.P2 = 0;
        this.EF = 0;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public int getP1() {
        return P1;
    }

    public void setP1(int P1) {
        this.P1 = P1;
    }

    public int getP2() {
        return P2;
    }

    public void setP2(int P2) {
        this.P2 = P2;
    }

    public int getEF() {
        return EF;
    }

    public void setEF(int EF) {
        this.EF = EF;
    }
}
