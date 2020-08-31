package product;

public class Stock2VO {
   private String goods_id;
   private String color;
   private int stock;
   private int price;
   private int sum;
   private int quan;
   private int totSum;
   public int getTotSum() {
      return totSum;
   }
   public void setTotSum(int totSum) {
      this.totSum = totSum;
   }
   public int getQuan() {
      return quan;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   public void setQuan(int quan) {
      this.quan = quan;
   }
   public int getSum() {
      return sum;
   }
   public void setSum(int price,int quan) {
      this.sum = price*quan;
   }
   public String getGoods_id() {
      return goods_id;
   }
   public void setGoods_id(String goods_id) {
      this.goods_id = goods_id;
   }
   public String getColor() {
      return color;
   }
   public void setColor(String color) {
      this.color = color;
   }
   public int getStock() {
      return stock;
   }
   public void setStock(int stock) {
      this.stock = stock;
   }
   @Override
   public String toString() {
      return "StockVO [goods_id=" + goods_id + ", color=" + color + ", stock=" + stock + "]";
   }
   
}