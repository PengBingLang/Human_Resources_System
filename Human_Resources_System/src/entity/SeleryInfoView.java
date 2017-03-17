package entity;

public class SeleryInfoView {

	private int employeeNumber;
	private String countBegin;
	private String countEnd;
	private int countLate;
	private int countLackTime;
	private int countLeave;
	private int countPaidLeave;
	private int countAttendance;
	private int totalAttendance;
	private double basicSalary;
	private double rankSalary;
	private double houseFund;
	private double pension;
	private double health;
	private double unemployment;
	private double reimbursement;
	private double bonus;
	private double totalSalary;

	public int getEmployeeNumber() {
		return employeeNumber;
	}

	public void setEmployeeNumber(int employeeNumber) {
		this.employeeNumber = employeeNumber;
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

	public int getCountAttendance() {
		return countAttendance;
	}

	public void setCountAttendance(int countAttendance) {
		this.countAttendance = countAttendance;
	}

	public int getTotalAttendance() {
		return totalAttendance;
	}

	public void setTotalAttendance(int totalAttendance) {
		this.totalAttendance = totalAttendance;
	}

	public double getBasicSalary() {
		return basicSalary;
	}

	public void setBasicSalary(double basicSalary) {
		this.basicSalary = basicSalary;
	}

	public double getRankSalary() {
		return rankSalary;
	}

	public void setRankSalary(double rankSalary) {
		this.rankSalary = rankSalary;
	}

	public double getHouseFund() {
		return houseFund;
	}

	public void setHouseFund(double houseFund) {
		this.houseFund = houseFund;
	}

	public double getPension() {
		return pension;
	}

	public void setPension(double pension) {
		this.pension = pension;
	}

	public double getHealth() {
		return health;
	}

	public void setHealth(double health) {
		this.health = health;
	}

	public double getUnemployment() {
		return unemployment;
	}

	public void setUnemployment(double unemployment) {
		this.unemployment = unemployment;
	}

	public double getReimbursement() {
		return reimbursement;
	}

	public void setReimbursement(double reimbursement) {
		this.reimbursement = reimbursement;
	}

	public double getBonus() {
		return bonus;
	}

	public void setBonus(double bonus) {
		this.bonus = bonus;
	}

	public double getTotalSalary() {
		return totalSalary;
	}

	public void setTotalSalary(double totalSalary) {
		this.totalSalary = totalSalary;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(basicSalary);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(bonus);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + countAttendance;
		result = prime * result
				+ ((countBegin == null) ? 0 : countBegin.hashCode());
		result = prime * result
				+ ((countEnd == null) ? 0 : countEnd.hashCode());
		result = prime * result + countLackTime;
		result = prime * result + countLate;
		result = prime * result + countLeave;
		result = prime * result + countPaidLeave;
		result = prime * result + employeeNumber;
		temp = Double.doubleToLongBits(health);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(houseFund);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(pension);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(rankSalary);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(reimbursement);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + totalAttendance;
		temp = Double.doubleToLongBits(totalSalary);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(unemployment);
		result = prime * result + (int) (temp ^ (temp >>> 32));
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
		SeleryInfoView other = (SeleryInfoView) obj;
		if (Double.doubleToLongBits(basicSalary) != Double
				.doubleToLongBits(other.basicSalary))
			return false;
		if (Double.doubleToLongBits(bonus) != Double
				.doubleToLongBits(other.bonus))
			return false;
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
		if (employeeNumber != other.employeeNumber)
			return false;
		if (Double.doubleToLongBits(health) != Double
				.doubleToLongBits(other.health))
			return false;
		if (Double.doubleToLongBits(houseFund) != Double
				.doubleToLongBits(other.houseFund))
			return false;
		if (Double.doubleToLongBits(pension) != Double
				.doubleToLongBits(other.pension))
			return false;
		if (Double.doubleToLongBits(rankSalary) != Double
				.doubleToLongBits(other.rankSalary))
			return false;
		if (Double.doubleToLongBits(reimbursement) != Double
				.doubleToLongBits(other.reimbursement))
			return false;
		if (totalAttendance != other.totalAttendance)
			return false;
		if (Double.doubleToLongBits(totalSalary) != Double
				.doubleToLongBits(other.totalSalary))
			return false;
		if (Double.doubleToLongBits(unemployment) != Double
				.doubleToLongBits(other.unemployment))
			return false;
		return true;
	}

}
