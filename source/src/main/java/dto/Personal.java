package dto;

public class Personal {
    private int personaluserid;
    private int personalcoffeeid;
    private Integer new_valu;
    private String memo;

    public Personal(int personaluserid, int personalcoffeeid, Integer new_valu, String memo) {
        this.personaluserid = personaluserid;
        this.personalcoffeeid = personalcoffeeid;
        this.new_valu = new_valu;
        this.memo = memo;
    }

    // ゲッター
    public int getPersonaluserid() {
        return personaluserid;
    }

    public int getPersonalcoffeeid() {
        return personalcoffeeid;
    }

    public Integer getNewValu() {
        return new_valu;
    }

    public String getMemo() {
        return memo;
    }

    // セッター
    public void setNewValu(Integer new_valu) {
        this.new_valu = new_valu;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
}
