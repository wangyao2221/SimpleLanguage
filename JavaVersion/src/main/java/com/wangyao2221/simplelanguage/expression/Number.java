package com.wangyao2221.simplelanguage.expression;

import com.wangyao2221.simplelanguage.Context;

public class Number implements Expression<Integer> {
    private Integer value;

    public Number(Integer value) {
        this.value = value;
    }

    public boolean reducible() {
        return false;
    }

    public Integer reduce(Context context) {
        return value;
    }

    @Override
    public String toString() {
        return String.valueOf(value);
    }
}
