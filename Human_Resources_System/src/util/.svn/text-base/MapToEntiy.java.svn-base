package util;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.util.Map;

public class MapToEntiy {

	/**
	 * 将提交的Map集合转换为实体
	 * 
	 * @param map
	 * @param clazz
	 * @return *彭秉浪*
	 */
	public static Object convert(Map map, Class clazz) {
		Field[] fields = clazz.getDeclaredFields();// 从对象模型获取提交的信息
		Object obj = null;
		try {
			obj = clazz.newInstance();// 取得实例的值
			for (Field field : fields) {
				field.setAccessible(true);
				// 获取参数类型的名称：
				String fieldType = field.getType().getName();
				// 根据对象模型中属性名，获取对应Map中的值：
				String value[] = (String[]) map.get(field.getName());

				if (value != null) {
					/* 如果参数的类型是int，则需要将请求中的数据转换成int */
					if ("int".equals(fieldType)) {
						field.set(obj, Integer.parseInt(value[0]));
					} else if ("java.lang.String".equals(fieldType)) {
						try {
							/* 将请求中的数据以utf-8格式重新组成字符串 */
							String param = new String(
									value[0].getBytes("iso-8859-1"), "UTF-8");
							field.set(obj, param);
						} catch (UnsupportedEncodingException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return obj;
	}
}
