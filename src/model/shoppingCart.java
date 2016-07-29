package model;

public class shoppingCart {


	private String title;
	private String company;
	private String imageLocation;
	private String preOwned;
	private double price;

	
	public void setshoppingCart(String title, String company,double price,
			String imageLocation, String preOwned) {
		this.title = title;
		this.company = company;
		this.imageLocation = imageLocation;
		this.preOwned = preOwned;
		this.price = price;
	}
	


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getImageLocation() {
		return imageLocation;
	}

	public void setImageLocation(String imageLocation) {
		this.imageLocation = imageLocation;
	}

	public String getPreOwned() {
		return preOwned;
	}

	public void setPreOwned(String preOwned) {
		this.preOwned = preOwned;
	}
	
	public double getPrice(){
		return price;
	}


	
}
