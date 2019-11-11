package com.wangyao2221.simplelanguage.expression;

import com.wangyao2221.simplelanguage.Context;

public class Variable implements Expression {
    private String name;

    public Variable(String name) {
        this.name = name;
    }

    public boolean reducible() {
        return true;
    }

    public Object reduce(Context context) {
        return context.get(name);
    }

    @Override
    public String toString() {
        return name;
    }
}
