package purchase;

public class PurchaseVO {
   private String phone;
   private String user_name;
   private String address;
   private String email;
   private String orderDate;
   
   
   
   public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getOrderDate() {
   return orderDate;
}
public void setOrderDate(String orderDate) {
   this.orderDate = orderDate;
}
public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   public String getUser_name() {
      return user_name;
   }
   public void setUser_name(String user_name) {
      this.user_name = user_name;
   }
   public String getAddress() {
      return address;
   }
   public void setAddress(String address) {
      this.address = address;
   }

   @Override
   public String toString() {
      return "PurchaseVO [phone=" + phone + ", user_name=" + user_name + ", address=" + address
            + "]";
   }
   
   
}