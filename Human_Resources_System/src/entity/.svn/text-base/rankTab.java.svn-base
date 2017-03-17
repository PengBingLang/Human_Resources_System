package entity;

public class rankTab {

	private int rankID;
	private String rankName;
	private double rankSalary;

	public int getRankID() {
		return rankID;
	}

	public void setRankID(int rankID) {
		this.rankID = rankID;
	}

	public String getRankName() {
		return rankName;
	}

	public void setRankName(String rankName) {
		this.rankName = rankName;
	}

	public double getRankSalary() {
		return rankSalary;
	}

	public void setRankSalary(double rankSalary) {
		this.rankSalary = rankSalary;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + rankID;
		result = prime * result
				+ ((rankName == null) ? 0 : rankName.hashCode());
		long temp;
		temp = Double.doubleToLongBits(rankSalary);
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
		rankTab other = (rankTab) obj;
		if (rankID != other.rankID)
			return false;
		if (rankName == null) {
			if (other.rankName != null)
				return false;
		} else if (!rankName.equals(other.rankName))
			return false;
		if (Double.doubleToLongBits(rankSalary) != Double
				.doubleToLongBits(other.rankSalary))
			return false;
		return true;
	}

}
