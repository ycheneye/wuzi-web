package com.app.bean;

import java.util.ArrayList;
import java.util.List;

public class TRoleExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TRoleExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andRoleidIsNull() {
            addCriterion("roleId is null");
            return (Criteria) this;
        }

        public Criteria andRoleidIsNotNull() {
            addCriterion("roleId is not null");
            return (Criteria) this;
        }

        public Criteria andRoleidEqualTo(Integer value) {
            addCriterion("roleId =", value, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidNotEqualTo(Integer value) {
            addCriterion("roleId <>", value, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidGreaterThan(Integer value) {
            addCriterion("roleId >", value, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidGreaterThanOrEqualTo(Integer value) {
            addCriterion("roleId >=", value, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidLessThan(Integer value) {
            addCriterion("roleId <", value, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidLessThanOrEqualTo(Integer value) {
            addCriterion("roleId <=", value, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidIn(List<Integer> values) {
            addCriterion("roleId in", values, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidNotIn(List<Integer> values) {
            addCriterion("roleId not in", values, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidBetween(Integer value1, Integer value2) {
            addCriterion("roleId between", value1, value2, "roleid");
            return (Criteria) this;
        }

        public Criteria andRoleidNotBetween(Integer value1, Integer value2) {
            addCriterion("roleId not between", value1, value2, "roleid");
            return (Criteria) this;
        }

        public Criteria andRolenameIsNull() {
            addCriterion("roleName is null");
            return (Criteria) this;
        }

        public Criteria andRolenameIsNotNull() {
            addCriterion("roleName is not null");
            return (Criteria) this;
        }

        public Criteria andRolenameEqualTo(String value) {
            addCriterion("roleName =", value, "rolename");
            return (Criteria) this;
        }

        public Criteria andRolenameNotEqualTo(String value) {
            addCriterion("roleName <>", value, "rolename");
            return (Criteria) this;
        }

        public Criteria andRolenameGreaterThan(String value) {
            addCriterion("roleName >", value, "rolename");
            return (Criteria) this;
        }

        public Criteria andRolenameGreaterThanOrEqualTo(String value) {
            addCriterion("roleName >=", value, "rolename");
            return (Criteria) this;
        }

        public Criteria andRolenameLessThan(String value) {
            addCriterion("roleName <", value, "rolename");
            return (Criteria) this;
        }

        public Criteria andRolenameLessThanOrEqualTo(String value) {
            addCriterion("roleName <=", value, "rolename");
            return (Criteria) this;
        }

        public Criteria andRolenameLike(String value) {
            addCriterion("roleName like", value, "rolename");
            return (Criteria) this;
        }

        public Criteria andRolenameNotLike(String value) {
            addCriterion("roleName not like", value, "rolename");
            return (Criteria) this;
        }

        public Criteria andRolenameIn(List<String> values) {
            addCriterion("roleName in", values, "rolename");
            return (Criteria) this;
        }

        public Criteria andRolenameNotIn(List<String> values) {
            addCriterion("roleName not in", values, "rolename");
            return (Criteria) this;
        }

        public Criteria andRolenameBetween(String value1, String value2) {
            addCriterion("roleName between", value1, value2, "rolename");
            return (Criteria) this;
        }

        public Criteria andRolenameNotBetween(String value1, String value2) {
            addCriterion("roleName not between", value1, value2, "rolename");
            return (Criteria) this;
        }

        public Criteria andAuthidsIsNull() {
            addCriterion("authIds is null");
            return (Criteria) this;
        }

        public Criteria andAuthidsIsNotNull() {
            addCriterion("authIds is not null");
            return (Criteria) this;
        }

        public Criteria andAuthidsEqualTo(String value) {
            addCriterion("authIds =", value, "authids");
            return (Criteria) this;
        }

        public Criteria andAuthidsNotEqualTo(String value) {
            addCriterion("authIds <>", value, "authids");
            return (Criteria) this;
        }

        public Criteria andAuthidsGreaterThan(String value) {
            addCriterion("authIds >", value, "authids");
            return (Criteria) this;
        }

        public Criteria andAuthidsGreaterThanOrEqualTo(String value) {
            addCriterion("authIds >=", value, "authids");
            return (Criteria) this;
        }

        public Criteria andAuthidsLessThan(String value) {
            addCriterion("authIds <", value, "authids");
            return (Criteria) this;
        }

        public Criteria andAuthidsLessThanOrEqualTo(String value) {
            addCriterion("authIds <=", value, "authids");
            return (Criteria) this;
        }

        public Criteria andAuthidsLike(String value) {
            addCriterion("authIds like", value, "authids");
            return (Criteria) this;
        }

        public Criteria andAuthidsNotLike(String value) {
            addCriterion("authIds not like", value, "authids");
            return (Criteria) this;
        }

        public Criteria andAuthidsIn(List<String> values) {
            addCriterion("authIds in", values, "authids");
            return (Criteria) this;
        }

        public Criteria andAuthidsNotIn(List<String> values) {
            addCriterion("authIds not in", values, "authids");
            return (Criteria) this;
        }

        public Criteria andAuthidsBetween(String value1, String value2) {
            addCriterion("authIds between", value1, value2, "authids");
            return (Criteria) this;
        }

        public Criteria andAuthidsNotBetween(String value1, String value2) {
            addCriterion("authIds not between", value1, value2, "authids");
            return (Criteria) this;
        }

        public Criteria andRoledescriptionIsNull() {
            addCriterion("roleDescription is null");
            return (Criteria) this;
        }

        public Criteria andRoledescriptionIsNotNull() {
            addCriterion("roleDescription is not null");
            return (Criteria) this;
        }

        public Criteria andRoledescriptionEqualTo(String value) {
            addCriterion("roleDescription =", value, "roledescription");
            return (Criteria) this;
        }

        public Criteria andRoledescriptionNotEqualTo(String value) {
            addCriterion("roleDescription <>", value, "roledescription");
            return (Criteria) this;
        }

        public Criteria andRoledescriptionGreaterThan(String value) {
            addCriterion("roleDescription >", value, "roledescription");
            return (Criteria) this;
        }

        public Criteria andRoledescriptionGreaterThanOrEqualTo(String value) {
            addCriterion("roleDescription >=", value, "roledescription");
            return (Criteria) this;
        }

        public Criteria andRoledescriptionLessThan(String value) {
            addCriterion("roleDescription <", value, "roledescription");
            return (Criteria) this;
        }

        public Criteria andRoledescriptionLessThanOrEqualTo(String value) {
            addCriterion("roleDescription <=", value, "roledescription");
            return (Criteria) this;
        }

        public Criteria andRoledescriptionLike(String value) {
            addCriterion("roleDescription like", value, "roledescription");
            return (Criteria) this;
        }

        public Criteria andRoledescriptionNotLike(String value) {
            addCriterion("roleDescription not like", value, "roledescription");
            return (Criteria) this;
        }

        public Criteria andRoledescriptionIn(List<String> values) {
            addCriterion("roleDescription in", values, "roledescription");
            return (Criteria) this;
        }

        public Criteria andRoledescriptionNotIn(List<String> values) {
            addCriterion("roleDescription not in", values, "roledescription");
            return (Criteria) this;
        }

        public Criteria andRoledescriptionBetween(String value1, String value2) {
            addCriterion("roleDescription between", value1, value2, "roledescription");
            return (Criteria) this;
        }

        public Criteria andRoledescriptionNotBetween(String value1, String value2) {
            addCriterion("roleDescription not between", value1, value2, "roledescription");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}