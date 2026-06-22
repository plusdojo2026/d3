package dto;

public class Food {
    private int foodnumber;
    private int foodlevel;
    private String foodname;
    private String foodmemo;
    
    // ✅ コンストラクタ（全引数）
    public Food(int foodnumber, int foodlevel, String foodname, String foodmemo) {
        this.foodnumber = foodnumber;
        this.foodlevel = foodlevel;
        this.foodname = foodname;
        this.foodmemo = foodmemo;
    }
    
    // ✅ コンストラクタ（引数なし）
    public Food() {
    }
    
    // ✅ Getter/Setter
    public int getFoodnumber() {
        return foodnumber;
    }
    
    public void setFoodnumber(int foodnumber) {
        this.foodnumber = foodnumber;
    }
    
    public int getFoodlevel() {
        return foodlevel;
    }
    
    public void setFoodlevel(int foodlevel) {
        this.foodlevel = foodlevel;
    }
    
    public String getFoodname() {
        return foodname;
    }
    
    public void setFoodname(String foodname) {
        this.foodname = foodname;
    }
    
    public String getFoodmemo() {
        return foodmemo;
    }
    
    public void setFoodmemo(String foodmemo) {
        this.foodmemo = foodmemo;
    }
    
    @Override
    public String toString() {
        return "Food [foodnumber=" + foodnumber + ", foodlevel=" + foodlevel + ", foodname=" + foodname
                + ", foodmemo=" + foodmemo + "]";
    }
}