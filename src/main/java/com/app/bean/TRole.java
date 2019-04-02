package com.app.bean;

public class TRole {
    private Integer roleid;

    private String rolename;

    private String authids;

    private String roledescription;

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename == null ? null : rolename.trim();
    }

    public String getAuthids() {
        return authids;
    }

    public void setAuthids(String authids) {
        this.authids = authids == null ? null : authids.trim();
    }

    public String getRoledescription() {
        return roledescription;
    }

    public void setRoledescription(String roledescription) {
        this.roledescription = roledescription == null ? null : roledescription.trim();
    }
}