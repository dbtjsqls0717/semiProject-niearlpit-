package product;

import stock.StockVO;

public class ProductVO extends StockVO{
   private String goods_id;
   private String goods_name;
   private String type;
   private int price;
   private String content;
   private String status;
   private String image;
   public String getGoods_id() {
      return goods_id;
   }
   public void setGoods_id(String goods_id) {
      this.goods_id = goods_id;
   }
   public String getGoods_name() {
      return goods_name;
   }
   public void setGoods_name(String goods_name) {
      this.goods_name = goods_name;
   }
   public String getType() {
      return type;
   }
   public void setType(String type) {
      this.type = type;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getStatus() {
      return status;
   }
   public void setStatus(String status) {
      this.status = status;
   }
   public String getImage() {
      return image;
   }
   public void setImage(String image) {
      this.image = image;
   }
   @Override
   public String toString() {
      return "ProductVO [goods_id=" + goods_id + ", goods_name=" + goods_name + ", type=" + type + ", price=" + price
            + ", content=" + content + ", status=" + status + ", image=" + image + ", getColor()=" + getColor()
            + ", getStock()=" + getStock() + "]";
   }
   
}