package admin;

import java.util.List;

import util.SQLFilter;
import dao.Dao;
import entity.departmentTab;

public class DepartmentService {
private Dao dao = new Dao();
	
	//  查询所有的部门
	public List queryAllDepartment(){
		String sql = "select * from departmentTab;";
		List list = dao.executeQuery(sql, departmentTab.class);
		if(list.size()>0){
			return list;
		}else{
			return null;
		}
	}

	public boolean updateDepartment(departmentTab dep) {
		// TODO Auto-generated method stub
		String sql = "update departmentTab set departmentName='{departmentName}'where departmentID={departmentID} ;";
		sql = SQLFilter.filter(sql, dep);
		int rs = dao.executeUpdate(sql);
		if(rs>0){
			return true;
		}else{
			return false;
		}
	}

	public boolean insertOneDepartment(departmentTab dep) {
		String sql = "insert into departmentTab values({departmentID},'{departmentName}');";
		sql = SQLFilter.filter(sql, dep);
		int rs = dao.executeUpdate(sql);
		if(rs>0){
			return true;
		}else{
			return false;
		}
	}
}
