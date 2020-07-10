package ex20200506;

public class CVO {
	
	private String lcode;
	private String lname;
	private String pname;
	private String room;
	private double avg;
	private int count;
	
	public String getLcode() {
		return lcode;
	}
	public void setLcode(String lcode) {
		this.lcode = lcode;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "CVO [lcode=" + lcode + ", lname=" + lname + ", pname=" + pname + ", room=" + room + ", avg=" + avg
				+ ", count=" + count + "]";
	}
	
	
	
	
}
