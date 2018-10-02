package com.yikai.crud.bean;

public class Clas {
    private String clas;

    public String getClas() {
        return clas;
    }

    public void setClas(String clas) {
        this.clas = clas == null ? null : clas.trim();
    }
}