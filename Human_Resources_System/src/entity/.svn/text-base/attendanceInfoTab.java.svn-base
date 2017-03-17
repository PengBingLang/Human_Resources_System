package entity;

public class attendanceInfoTab {

	private int attendanceInfoID;
	private int employeeNumber;
	private String attendanceDate;
	private String attendanceType;

	public int getAttendanceInfoID() {
		return attendanceInfoID;
	}

	public void setAttendanceInfoID(int attendanceInfoID) {
		this.attendanceInfoID = attendanceInfoID;
	}

	public int getEmployeeNumber() {
		return employeeNumber;
	}

	public void setEmployeeNumber(int employeeNumber) {
		this.employeeNumber = employeeNumber;
	}

	public String getAttendanceDate() {
		return attendanceDate;
	}

	public void setAttendanceDate(String attendanceDate) {
		this.attendanceDate = attendanceDate;
	}

	public String getAttendanceType() {
		return attendanceType;
	}

	public void setAttendanceType(String attendanceType) {
		this.attendanceType = attendanceType;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((attendanceDate == null) ? 0 : attendanceDate.hashCode());
		result = prime * result + attendanceInfoID;
		result = prime * result
				+ ((attendanceType == null) ? 0 : attendanceType.hashCode());
		result = prime * result + employeeNumber;
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
		attendanceInfoTab other = (attendanceInfoTab) obj;
		if (attendanceDate == null) {
			if (other.attendanceDate != null)
				return false;
		} else if (!attendanceDate.equals(other.attendanceDate))
			return false;
		if (attendanceInfoID != other.attendanceInfoID)
			return false;
		if (attendanceType == null) {
			if (other.attendanceType != null)
				return false;
		} else if (!attendanceType.equals(other.attendanceType))
			return false;
		if (employeeNumber != other.employeeNumber)
			return false;
		return true;
	}

}
