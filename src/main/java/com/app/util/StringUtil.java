package com.app.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * 
 */
public class StringUtil {
	
	

	public static boolean isEmpty(String str){
		if("".equals(str)|| str==null){
			return true;
		}else{
			return false;
		}
	}
	
	public static boolean isNotEmpty(String str){
		if(!"".equals(str)&&str!=null){
			return true;
		}else{
			return false;
		}
	}
	
	public static boolean existStrArr(String str,String []strArr){
		for(int i=0;i<strArr.length;i++){
			if(strArr[i].equals(str)){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 首字母转小写
	 * 方法名：firstCharacterLowerCase
	 * 时间：2017年5月11日-下午6:59:53 
	 * @param str
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	public static String firstCharacterLowerCase(String str){
		String firstCharacter = String.valueOf(str.charAt(0)).toLowerCase();
		return firstCharacter + str.substring(1,str.length());
	}
	
	/**
	 * 扩展Object数组
	 * @param array
	 * @param objects
	 * @return
	 */
	public static Object[] extendArray(Object[] array,Object... objects){
		Object[] newArray = null;
		if(array.length < 1){
			return objects;
		}else{
			newArray = new Object[array.length + objects.length];
			for (int i = 0; i < array.length; i++) {
				newArray[i] = array[i];
			}
			for (int i = 0; i < objects.length; i++) {
				newArray[array.length + i] = objects[i];
			}
		}
		
		return newArray;
	}
	
	/**
	 * 获取UUID
	 * @return
	 */
	public static String getUUID(){
		return UUID.randomUUID().toString();
	}
	
	/**
	 * 将list转换成Object数组
	 * @param list
	 * @return
	 */
	public static Object[] listToObjectArray(List<Object> list){
		Object[] objArr = new Object[list.size()];
		for (int i = 0; i < objArr.length; i++) {
			objArr[i] = list.get(i);
		}
		return objArr;
	}
	
	/**
	 * object的非空处理
	 * @param list
	 * @return
	 */
	public static String nullToEmpty(Object o){
		return o != null?o.toString():"";
	}
	
	/**
	 * 将一个存放String的list转换成用逗号分隔的字符串
	 * @param list
	 * @return
	 */
	public static String join(List<String> list){
		String str = "";
		for (int i = 0; i < list.size(); i++) {
			str += list.get(i) + ",";
		}
		return str.substring(0,str.length() - 1);
	}
	
	/**
	 * 判断字符串是否为空
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(Object o) {
		String str = nullToEmpty(o);
		return null == str  || str.equals("")
				|| str.matches("\\s*");
	}
	
	/**
	 * 判断字符串是否非空
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(Object o) {
		return !isEmpty(o);
	}

	/**
	 * 给输入的字符串设置默认值
	 * @param content
	 * @param defaultValue
	 * @return
	 */
	public static String defaultValue(String content,String defaultValue){
		if(isEmpty(content)){
			return defaultValue;
		}
		return content;
	}
	
	/**
	 * 把数据库字段名改为驼峰方式
	 * @param column
	 * @return
	 */
	public static String columnToProperty(String column) {
		/**如果字段名为空，就返回空字符串* */
		if(isEmpty(column)) return "";
		/**获取字段的长度，一般来说字段长度不可能有几百个字节的，所以用Byte就行了* */
		Byte length = (byte) column.length();
		
	    StringBuilder sb = new StringBuilder(length);
	    int i = 0;
	    /**遍历字段的每一个字符* */
	    for (int j = 0; j < length; j++) {
	    	 /**匹配到第一个_* */
	        if (column.charAt(j) == '_') {
	            /**如果后面还有_,也就是连续的_,那么j就需要自增一个单位，直到后面不是_为止* */
	            while (column.charAt(j + 1) == '_') {
	            	j += 1;
	            }
	            sb.append(("" + column.charAt(++j)).toUpperCase());
	            
	        } else {
	        	 /**如果循环到的字符不是_,那么就保存下来* */
	                sb.append(column.charAt(j));
	            }
	        }
	 
        return sb.toString();
    }
	    
    /**
	 * 将一个字符串的首字母改成大写
	 * @param str
	 * @return
	 */
	public static String upperCaseFirstCharacter(String str){
		
		StringBuilder sb = new StringBuilder();
		char[] arr = str.toCharArray();
		for (int i = 0; i < arr.length; i++) {
			if(i==0) sb.append((arr[i] + "").toUpperCase());
			else sb.append((arr[i]+""));
		}
		return sb.toString();
	}
	
	/**
	 * 格式化日期，返回字符串
	 * @param date
	 * @param format
	 * @return
	 */
	public static String formatDate(Date date,String format){
		String result="";
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		if(date!=null){
			result=sdf.format(date);
		}
		return result;
	}
	
	/**
	 * 格式化日期，返回日期对象
	 * @param date
	 * @param format
	 * @return
	 */
	public static Date formatString(String str,String format) throws Exception{
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		return sdf.parse(str);
	}
	
	/**
	 * 获取Mysql当前日期，12小时制
	 * @return
	 */
	public static String getCurrentDateForMysql(){
		return formatDate(new Date(), "yyyy-MM-dd hh:mm:ss");
	}
	
	/**
	 * 获取Mysql当前日期，24小时制
	 * @return
	 */
	public static String getCurrentDateForMysql24(){
		return formatDate(new Date(), "yyyy-MM-dd HH:mm:ss");
	}
}
