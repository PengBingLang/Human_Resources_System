package entity;

public class attendanceCountView {
	private int employeeNumber;
	private String employeeName;
	private String departmentName;
	private String countBegin;
	private String countEnd;
	private int countLate;
	private int countLackTime;
	private int countAttendance;
	private int countLeave;
	private int countPaidLeave;
	private int totalAttendance;

	public int getEmployeeNumber() {
		return employeeNumber;
	}

	public void setEmployeeNumber(int employeeNumber) {
		this.employeeNumber = employeeNumber;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getCountBegin() {
		return countBegin;
	}

	public void setCountBegin(String countBegin) {
		this.countBegin = countBegin;
	}

	public String getCountEnd() {
		return countEnd;
	}

	public void setCountEnd(String countEnd) {
		this.countEnd = countEnd;
	}

	public int getCountLate() {
		return countLate;
	}

	public void setCountLate(int countLate) {
		this.countLate = countLate;
	}

	public int getCountLackTime() {
		return countLackTime;
	}

	public void setCountLackTime(int countLackTime) {
		this.countLackTime = countLackTime;
	}

	public int getCountAttendance() {
		return countAttendance;
	}

	public void setCountAttendance(int countAttendance) {
		this.countAttendance = countAttendance;
	}

	public int getCountLeave() {
		return countLeave;
	}

	public void setCountLeave(int countLeave) {
		this.countLeave = countLeave;
	}

	public int getCountPaidLeave() {
		return countPaidLeave;
	}

	public void setCountPaidLeave(int countPaidLeave) {
		this.countPaidLeave = countPaidLeave;
	}

	public int getTotalAttendance() {
		return totalAttendance;
	}

	public void setTotalAttendance(int totalAttendance) {
		this.totalAttendance = totalAttendance;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + countAttendance;
		result = prime * result
				+ ((countBegin == null) ? 0 : countBegin.hashCode());
		result = prime * result
				+ ((countEnd == null) ? 0 : countEnd.hashCode());
		result = prime * result + countLackTime;
		result = prime * result + countLate;
		result = prime * result + countLeave;
		result = prime * result + countPaidLeave;
		result = prime * result
				+ ((departmentName == null) ? 0 : departmentName.hashCode());
		result = prime * result
				+ ((employeeName == null) ? 0 : employeeName.hashCode());
		result = prime * result + employeeNumber;
		result = prime * result + totalAttendance;
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
		attendanceCountView other = (attendanceCountView) obj;
		if (countAttendance != other.countAttendance)
			return false;
		if (countBegin == null) {
			if (other.countBegin != null)
				return false;
		} else if (!countBegin.equals(other.countBegin))
			return false;
		if (countEnd == null) {
			if (other.countEnd != null)
				return false;
		} else if (!countEnd.equals(other.countEnd))
			return false;
		if (countLackTime != other.countLackTime)
			return false;
		if (countLate != other.countLate)
			return false;
		if (countLeave != other.countLeave)
			return false;
		if (countPaidLeave != other.countPaidLeave)
			return false;
		if (departmentName == null) {
			if (other.departmentName != null)
				return false;
		} else if (!departmentName.equals(other.departmentName))
			return false;
		if (employeeName == null) {
			if (other.employeeName != null)
				return false;
		} else if (!employeeName.equals(other.employeeName))
			return false;
		if (employeeNumber != other.employeeNumber)
			return false;
		if (totalAttendance != other.totalAttendance)
			return false;
		return true;
	}

}
