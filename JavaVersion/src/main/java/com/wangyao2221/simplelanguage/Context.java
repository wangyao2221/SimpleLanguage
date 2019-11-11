package com.wangyao2221.simplelanguage;

import java.util.HashMap;
import java.util.Map;

public class Context {
    Map<String, Object> map = new HashMap<String, Object>();

    public void merge(String name, Object value) throws Exception {
        if (!map.containsKey(name)) {
            map.put(name, value);
        } else {
            Object obj = map.get(name);
            if (obj.getClass() == value.getClass()) {
                map.put(name, value);
            } else {
                throw new Exception("type conflict");
            }
        }
    }

    public Object get(String name) {
        return map.get(name);
    }
}
