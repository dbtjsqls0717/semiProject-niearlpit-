package orders;

public class OrderVO {
   private String phone;
   private String goods_id;
   private String orderDate;
   private String color;
   private int price;
   private int quantity;
   
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   public String getGoods_id() {
      return goods_id;
   }
   public void setGoods_id(String goods_id) {
      this.goods_id = goods_id;
   }
   public String getOrderDate() {
      return orderDate;
   }
   public void setOrderDate(String orderDate) {
      this.orderDate = orderDate;
   }
   public String getColor() {
      return color;
   }
   public void setColor(String color) {
      this.color = color;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   public int getQuantity() {
      return quantity;
   }
   public void setQuantity(int quantity) {
      this.quantity = quantity;
   }
   
}