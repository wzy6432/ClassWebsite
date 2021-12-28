package com.yangyang.utils;

public class StringUtil {
    public static boolean isNotBlank(String str){
        return str!=null&&!"".equals(str.trim());
    }
}
