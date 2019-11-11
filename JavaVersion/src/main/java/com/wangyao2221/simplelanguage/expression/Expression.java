package com.wangyao2221.simplelanguage.expression;

import com.wangyao2221.simplelanguage.Context;

public interface Expression<T> {
    boolean reducible();
    T reduce(Context context);
}
