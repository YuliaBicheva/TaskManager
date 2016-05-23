package edu.bycheva.models;

import java.io.Serializable;

abstract class Base implements Serializable {

    int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
