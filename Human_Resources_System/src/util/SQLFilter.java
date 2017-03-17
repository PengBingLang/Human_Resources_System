package util;

import java.lang.reflect.Field;

public class SQLFilter {

	/**
	 * 根据实体对象中的属性，修改sql语句中的字段值
	 * 
	 * @param sql
	 * @param obj
	 * @return *彭秉浪*
	 */
	public static String filter(String sql, Object obj) {
		Class clazz = obj.getClass();// 拿到对象的类模板

		Field fields[] = clazz.getDeclaredFields();// 拿到参数

		for (Field field : fields) {// 遍历参数来替换sql语句中的占位符
			try {
				/* 设置参数的权限 */
				field.setAccessible(true);
				/* 通过正则替换相应的属性以及该属性的值 */
				sql = sql.replaceAll("\\{" + field.getName() + "\\}",
						field.get(obj) + "");
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return sql;
	}
}
