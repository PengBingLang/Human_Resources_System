package entity;

public class EmployeeLogin {

	private int employeeNumber;
	private String employeePwd;
	private int rankID;

	public int getEmployeeNumber() {
		return employeeNumber;
	}

	public void setEmployeeNumber(int employeeNumber) {
		this.employeeNumber = employeeNumber;
	}

	public String getEmployeePwd() {
		return employeePwd;
	}

	public void setEmployeePwd(String employeePwd) {
		this.employeePwd = employeePwd;
	}

	public int getRankID() {
		return rankID;
	}

	public void setRankID(int rankID) {
		this.rankID = rankID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + employeeNumber;
		result = prime * result
				+ ((employeePwd == null) ? 0 : employeePwd.hashCode());
		result = prime * result + rankID;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		EmployeeLogin other = (EmployeeLogin) obj;
		if (employeeNumber != other.employeeNumber)
			return false;
		if (employeePwd == null) {
			if (other.employeePwd != null)
				return false;
		} else if (!employeePwd.equals(other.employeePwd))
			return false;
		if (rankID != other.rankID)
			return false;
		return true;
	}

}
