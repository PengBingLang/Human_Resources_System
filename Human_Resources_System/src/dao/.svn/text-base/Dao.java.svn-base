package dao;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.employeeInfoTab;

public class Dao extends DBManager {

	/**
	 * 根据sql语句和对象的类模板，查询数据得到List结果集
	 * 
	 * @param sql
	 * @param clazz
	 *            -对象的类模板
	 * @return *彭秉浪*
	 */
	public List executeQuery(String sql, Class clazz) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List list = new ArrayList();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();// 元数据
			int colunmsCount = rsmd.getColumnCount();// 结果集列数
			// for(int i=1;i<=counmsCount;i++){
			// System.out.println(rsmd.getColumnName(i));
			// }// 输出每列列名
			Field fields[] = clazz.getDeclaredFields();
			while (rs.next()) {
				Object obj = clazz.newInstance();
				for (int i = 0; i < fields.length; i++) {
					String fieldName = fields[i].getName();// 得到实体对象的属性名
					for (int j = 1; j <= colunmsCount; j++) {
						String columnName = rsmd.getColumnName(j);// 得到结果集的列名
						if (fieldName.toLowerCase().equals(
								columnName.toLowerCase())) {// 比较，若名称相同就赋值
							fields[i].setAccessible(true);
							fields[i].set(obj, rs.getObject(columnName));
						}
					}
				}
				list.add(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			super.closeAll(rs, ps, conn);
		}
		return list;
	}

	/**
	 * 查询数据的行数
	 * 
	 * @param sql
	 * @return *彭秉浪*
	 */
	public int getCountLine(String sql) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			super.closeAll(rs, ps, conn);
		}
		return count;
	}

	/**
	 * 根据sql语句，执行增、删、改操作
	 * 
	 * @param sql
	 * @return *彭秉浪*
	 */
	public int executeUpdate(String sql) {
		Connection conn = null;
		PreparedStatement ps = null;
		int result = 0;

		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(null, ps, conn);
		}
		return result;
	}

}
