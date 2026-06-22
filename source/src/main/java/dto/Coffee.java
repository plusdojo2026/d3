package dto;

import java.io.Serializable;

public class Coffee implements Serializable {
	private int coffeenumber; /* 番号 */
	private String name; /* コーヒー名 */
	private int valu; /* 価格 */
	
	private int size; /* サイズ */
	private String bland; /* ブランド */
	private String area; /* 地域 */
	private String shop; /* 店舗 */
	private String shopname; /* 店舗名 */
	private int level; /* レベル */
	
	private String picture; /* 画像 */
	
	private String keyword; /* 検索用 */
    
	/*絞り込み用*/
	private int sizeMin;  
	private int sizeMax;

	private int priceMin;
	private int priceMax;
    

    // ✅ このコンストラクタが必須
    public Coffee(int coffeenumber, String name, int valu, int size, 
                  String bland, String area, String shop, String shopname, 
                  int level, String picture) {
        this.coffeenumber = coffeenumber;
        this.name = name;
        this.valu = valu;
        this.size = size;
        this.bland = bland;
        this.area = area;
        this.shop = shop;
        this.shopname = shopname;
        this.level = level;
        this.picture = picture;
    }

    public Coffee() {
		super();
		this.coffeenumber = 0;
		this.name = "";
		this.valu = 0;
		
		this.size = 0;
		this.bland = "";
		this.area = "";
		this.shop = "";
		this.shopname = "";
		this.level = 0;
		
		this.picture = "";
		
	}
    
	public int getNumber() {
		return coffeenumber;
	}

	public void setNumber(int number) {
		this.coffeenumber = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getValu() {
		return valu;
	}

	public void setValu(int valu) {
		this.valu = valu;
	}


	

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public String getBland() {
		return bland;
	}

	public void setBland(String bland) {
		this.bland = bland;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getShop() {
		return shop;
	}

	public void setShop(String shop) {
		this.shop = shop;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}



	

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	

	public int getSizeMin() {
		return sizeMin;
	}

	public void setSizeMin(int sizeMin) {
		this.sizeMin = sizeMin;
	}

	public int getSizeMax() {
		return sizeMax;
	}

	public void setSizeMax(int sizeMax) {
		this.sizeMax = sizeMax;
	}

	public int getPriceMin() {
		return priceMin;
	}

	public void setPriceMin(int priceMin) {
		this.priceMin = priceMin;
	}

	public int getPriceMax() {
		return priceMax;
	}

	public void setPriceMax(int priceMax) {
		this.priceMax = priceMax;
	}

}
