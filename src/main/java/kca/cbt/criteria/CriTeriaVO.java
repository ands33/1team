package kca.cbt.criteria;

import java.io.Serializable;
import java.util.Objects;

public class CriteriaVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private int id;
    private String name;
    private String category1;
    private String category2;
    private String category3;
    private int grade;

    // 기본 생성자
    public CriteriaVO() {
    }

    // 생성자 (필요시)
    public CriteriaVO(int id, String name, String category1, String category2, String category3, int grade) {
        this.id = id;
        this.name = name;
        this.category1 = category1;
        this.category2 = category2;
        this.category3 = category3;
        this.grade = grade;
    }

    // Getter and Setter methods for all fields

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory1() {
        return category1;
    }

    public void setCategory1(String category1) {
        this.category1 = category1;
    }

    public String getCategory2() {
        return category2;
    }

    public void setCategory2(String category2) {
        this.category2 = category2;
    }

    public String getCategory3() {
        return category3;
    }

    public void setCategory3(String category3) {
        this.category3 = category3;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CriteriaVO that = (CriteriaVO) o;
        return id == that.id &&
                grade == that.grade &&
                Objects.equals(name, that.name) &&
                Objects.equals(category1, that.category1) &&
                Objects.equals(category2, that.category2) &&
                Objects.equals(category3, that.category3);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, category1, category2, category3, grade);
    }

    @Override
    public String toString() {
        return "CriteriaVO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", category1='" + category1 + '\'' +
                ", category2='" + category2 + '\'' +
                ", category3='" + category3 + '\'' +
                ", grade=" + grade +
                '}';
    }
}
