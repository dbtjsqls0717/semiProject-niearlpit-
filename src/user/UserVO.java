package user;

public class UserVO {
	   private String user_id;
	   private String user_name;
	   private String password;
	   private String birthday;
	   private String position;
	   private String address;
	   private String address2;
	   private int point;
	   private String phone;
	   private String image;
	   
	   
	   public String getUser_id() {
	      return user_id;
	   }
	   public void setUser_id(String user_id) {
	      this.user_id = user_id;
	   }
	   public String getUser_name() {
	      return user_name;
	   }
	   public void setUser_name(String user_name) {
	      this.user_name = user_name;
	   }
	   public String getPassword() {
	      return password;
	   }
	   public void setPassword(String password) {
	      this.password = password;
	   }
	   public String getBirthday() {
	      return birthday;
	   }
	   public void setBirthday(String birthday) {
	      this.birthday = birthday;
	   }
	   public String getPosition() {
	      return position;
	   }
	   public void setPosition(String position) {
	      this.position = position;
	   }
	   public String getAddress() {
	      return address;
	   }
	   public void setAddress(String address) {
	      this.address = address;
	   }
	   public String getAddress2() {
	      return address2;
	   }
	   public void setAddress2(String address2) {
	      this.address2 = address2;
	   }

	   public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getPhone() {
	      return phone;
	   }
	   public void setPhone(String phone) {
	      this.phone = phone;
	   }
	   public String getImage() {
	      return image;
	   }
	   public void setImage(String image) {
	      this.image = image;
	   }
	   @Override
	   public String toString() {
	      return "UserVO [user_id=" + user_id + ", user_name=" + user_name + ", password=" + password + ", birthday="
	            + birthday + ", position=" + position + ", address=" + address + ", address2=" + address2 + ", point="
	            + point + ", phone=" + phone + ", image=" + image + ", getUser_id()=" + getUser_id()
	            + ", getUser_name()=" + getUser_name() + ", getPassword()=" + getPassword() + ", getBirthday()="
	            + getBirthday() + ", getPosition()=" + getPosition() + ", getAddress()=" + getAddress()
	            + ", getAddress2()=" + getAddress2() + ", getPoint()=" + getPoint() + ", getPhone()=" + getPhone()
	            + ", getImage()=" + getImage() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
	            + ", toString()=" + super.toString() + "]";
	   }

}
