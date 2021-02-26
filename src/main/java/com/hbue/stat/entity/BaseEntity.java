package com.hbue.stat.entity;

public class BaseEntity {
    private String name;
    private double value;

    public BaseEntity() {
    }

    public BaseEntity(String name, double value) {
        this.name = name;
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }
}
