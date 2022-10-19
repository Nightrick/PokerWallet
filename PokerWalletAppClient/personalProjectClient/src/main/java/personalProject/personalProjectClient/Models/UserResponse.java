package personalProject.personalProjectClient.Models;

public class UserResponse {
	
	private String id;
	private String username;
	private String password;
	private double bankroll;
	private double netProfit;
	
	public UserResponse() {
		super();
	}
	
	public UserResponse(String username, String password, double bankroll, double netProfit) {
		super();
		this.username = username;
		this.password = password;
		this.bankroll = bankroll;
		this.netProfit = netProfit;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public double getBankroll() {
		return bankroll;
	}

	public void setBankroll(double bankroll) {
		this.bankroll = bankroll;
	}

	public double getNetProfit() {
		return netProfit;
	}

	public void setNetProfit(double netProfit) {
		this.netProfit = netProfit;
	}
}
