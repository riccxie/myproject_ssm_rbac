package com.qf.entity;

public class Permission {

    private Integer id;


    private String perName;


    private String perUrl;


    private String perCode;

    private Integer isParent;

    private String perPname;



    private Integer perPid;


    private Integer perType;


    public Integer getId() {
        return id;
    }


    public void setId(Integer id) {
        this.id = id;
    }


    public String getPerName() {
        return perName;
    }


    public void setPerName(String perName) {
        this.perName = perName == null ? null : perName.trim();
    }


    public String getPerUrl() {
        return perUrl;
    }


    public void setPerUrl(String perUrl) {
        this.perUrl = perUrl == null ? null : perUrl.trim();
    }


    public String getPerCode() {
        return perCode;
    }


    public void setPerCode(String perCode) {
        this.perCode = perCode == null ? null : perCode.trim();
    }


    public Integer getPerPid() {
        return perPid;
    }


    public void setPerPid(Integer perPid) {
        this.perPid = perPid;
    }


    public Integer getPerType() {
        return perType;
    }


    public void setPerType(Integer perType) {
        this.perType = perType;
    }

    public Integer getIsParent() {
        return isParent;
    }

    public void setIsParent(Integer isParent) {
        this.isParent = isParent;
    }

    public String getPerPname() {
        return perPname;
    }

    public void setPerPname(String perPname) {
        this.perPname = perPname;
    }
}