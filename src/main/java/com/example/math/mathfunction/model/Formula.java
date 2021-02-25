package com.example.math.mathfunction.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Formula {
    @Id
    @GeneratedValue
    private int id;

    private String formula;

    public Formula(String formula) {
        this.formula = formula;
    }

    public Formula() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFormula() {
        return formula;
    }

    public void setFormula(String formula) {
        this.formula = formula;
    }
}
