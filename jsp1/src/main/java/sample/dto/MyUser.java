package sample.dto;

public class MyUser {
	private String uname;
	private int age;
	private String address;
	
	
	public String getName() {
		return uname;
	}
	public void setName(String name) {
		this.uname = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
