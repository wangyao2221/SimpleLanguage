package com.wangyao2221.simplelanguage;

import com.wangyao2221.simplelanguage.expression.Add;
import com.wangyao2221.simplelanguage.expression.Expression;
import com.wangyao2221.simplelanguage.expression.Number;

public class Main {
    public static void main(String[] args) {
        Context context = new Context();
        Expression expression = new Add(
                new Number(1),
                new Number(2)
        );

        System.out.println(expression.toString());
        System.out.println(expression.reduce(context).toString());
    }
}
