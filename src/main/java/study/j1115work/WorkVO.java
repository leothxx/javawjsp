package study.j1115work;

public class WorkVO {
	private String productName;
	private String productPrice;
	private String productSu;
	private String priceTot;
	private String productTot;
	private String buyerName;
	private String category;
	private String sw;
	
	
	
	public WorkVO(String productName, String productPrice, String productSu, String priceTot, String productTot,
			String buyerName, String category, String sw) {
		this.productName = productName;
		this.productPrice = productPrice;
		this.productSu = productSu;
		this.priceTot = priceTot;
		this.productTot = productTot;
		this.buyerName = buyerName;
		this.category = category;
		this.sw = sw;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductSu() {
		return productSu;
	}
	public void setProductSu(String productSu) {
		this.productSu = productSu;
	}
	public String getPriceTot() {
		return priceTot;
	}
	public void setPriceTot(String priceTot) {
		this.priceTot = priceTot;
	}
	public String getProductTot() {
		return productTot;
	}
	public void setProductTot(String productTot) {
		this.productTot = productTot;
	}
	
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSw() {
		return sw;
	}
	public void setSw(String sw) {
		this.sw = sw;
	}
	@Override
	public String toString() {
		return "WorkVO [productName=" + productName + ", productPrice=" + productPrice + ", productSu=" + productSu
				+ ", priceTot=" + priceTot + ", productTot=" + productTot + ", buyerName=" + buyerName + ", category="
				+ category + ", sw=" + sw + "]";
	}
	
	

}
