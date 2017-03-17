package entity;

public class leaveTab {
	private int leaveID;
	private int employeeNumber;
	private String dateBging;
	private String dateEnd;
	private String leaveReason;
	private String leaveType;

	public int getLeaveID() {
		return leaveID;
	}

	public void setLeaveID(int leaveID) {
		this.leaveID = leaveID;
	}

	public int getEmployeeNumber() {
		return employeeNumber;
	}

	public void setEmployeeNumber(int employeeNumber) {
		this.employeeNumber = employeeNumber;
	}

	public String getDateBging() {
		return dateBging;
	}

	public void setDateBging(String dateBging) {
		this.dateBging = dateBging;
	}

	public String getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}

	public String getLeaveReason() {
		return leaveReason;
	}

	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}

	public String getLeaveType() {
		return leaveType;
	}

	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((dateBging == null) ? 0 : dateBging.hashCode());
		result = prime * result + ((dateEnd == null) ? 0 : dateEnd.hashCode());
		result = prime * result + employeeNumber;
		result = prime * result + leaveID;
		result = prime * result
				+ ((leaveReason == null) ? 0 : leaveReason.hashCode());
		result = prime * result
				+ ((leaveType == null) ? 0 : leaveType.hashCode());
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
		leaveTab other = (leaveTab) obj;
		if (dateBging == null) {
			if (other.dateBging != null)
				return false;
		} else if (!dateBging.equals(other.dateBging))
			return false;
		if (dateEnd == null) {
			if (other.dateEnd != null)
				return false;
		} else if (!dateEnd.equals(other.dateEnd))
			return false;
		if (employeeNumber != other.employeeNumber)
			return false;
		if (leaveID != other.leaveID)
			return false;
		if (leaveReason == null) {
			if (other.leaveReason != null)
				return false;
		} else if (!leaveReason.equals(other.leaveReason))
			return false;
		if (leaveType == null) {
			if (other.leaveType != null)
				return false;
		} else if (!leaveType.equals(other.leaveType))
			return false;
		return true;
	}

}
