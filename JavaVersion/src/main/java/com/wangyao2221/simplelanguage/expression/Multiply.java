package com.wangyao2221.simplelanguage.expression;

import com.wangyao2221.simplelanguage.Context;

public class Multiply implements Expression<Expression> {
    private Expression left;
    private Expression right;

    public Multiply(Expression left, Expression right) {
        this.left = left;
        this.right = right;
    }

    public boolean reducible() {
        return true;
    }

    public Expression reduce(Context context) {
        if (left.reducible()) {
            return new Multiply((Expression) left.reduce(context), right);
        } else if (right.reducible()) {
            return new Multiply(left, (Expression) right.reduce(context));
        } else {
            Number leftNumber = (Number) left;
            Number rightNumber = (Number) right;
            return new Number(leftNumber.reduce(context) * rightNumber.reduce(context));
        }
    }

    @Override
    public String toString() {
        return String.format("%s * %s", left.toString(), right.toString());
    }
}
