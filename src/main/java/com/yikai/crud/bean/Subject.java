package com.yikai.crud.bean;

public class Subject {
    private Integer sId;

    private Integer physics;

    private Integer math;

    private Integer english;

    private Integer chemistry;

    private Integer biology;

    private Integer history;

    
    
    public Subject() {
		super();
	}

	@Override
	public String toString() {
		return "Subject [sId=" + sId + ", physics=" + physics + ", math=" + math + ", english=" + english
				+ ", chemistry=" + chemistry + ", biology=" + biology + ", history=" + history + "]";
	}

	public Subject(Integer sId, Integer physics, Integer math, Integer english, Integer chemistry, Integer biology,
			Integer history) {
		super();
		this.sId = sId;
		this.physics = physics;
		this.math = math;
		this.english = english;
		this.chemistry = chemistry;
		this.biology = biology;
		this.history = history;
	}

	public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public Integer getPhysics() {
        return physics;
    }

    public void setPhysics(Integer physics) {
        this.physics = physics;
    }

    public Integer getMath() {
        return math;
    }

    public void setMath(Integer math) {
        this.math = math;
    }

    public Integer getEnglish() {
        return english;
    }

    public void setEnglish(Integer english) {
        this.english = english;
    }

    public Integer getChemistry() {
        return chemistry;
    }

    public void setChemistry(Integer chemistry) {
        this.chemistry = chemistry;
    }

    public Integer getBiology() {
        return biology;
    }

    public void setBiology(Integer biology) {
        this.biology = biology;
    }

    public Integer getHistory() {
        return history;
    }

    public void setHistory(Integer history) {
        this.history = history;
    }
}