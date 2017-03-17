package admin;

import java.util.List;

import util.SQLFilter;

import dao.Dao;
import entity.rankTab;

public class RankService {
	private Dao dao = new Dao();
	
	//  查询所有的职称
	public List queryAllRank(){
		String sql = "select * from rankTab;";
		List list = dao.executeQuery(sql, rankTab.class);
		if(list.size()>0){
			return list;
		}else{
			return null;
		}
	}

	public boolean updateRank(rankTab rank) {
		// TODO Auto-generated method stub
		String sql = "update rankTab set rankName='{rankName}',rankSalary={rankSalary} where rankID={rankID} ;";
		sql = SQLFilter.filter(sql, rank);
		int rs = dao.executeUpdate(sql);
		if(rs>0){
			return true;
		}else{
			return false;
		}
	}

	public boolean insertOneRank(rankTab rank) {
		String sql = "insert into rankTab values({rankID},'{rankName}',{rankSalary});";
		sql = SQLFilter.filter(sql, rank);
		int rs = dao.executeUpdate(sql);
		if(rs>0){
			return true;
		}else{
			return false;
		}
	}
}
