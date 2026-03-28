package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 学生信息对象 student
 * 
 * @author ruoyi
 * @date 2026-03-26
 */
public class Student extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date date;

    /** 图片1 */
    @Excel(name = "图片1")
    private String picture1;

    /** 文件2 */
    @Excel(name = "文件2")
    private String picture2;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    public void setDate(Date date) 
    {
        this.date = date;
    }

    public Date getDate() 
    {
        return date;
    }

    public void setPicture1(String picture1) 
    {
        this.picture1 = picture1;
    }

    public String getPicture1() 
    {
        return picture1;
    }

    public void setPicture2(String picture2) 
    {
        this.picture2 = picture2;
    }

    public String getPicture2() 
    {
        return picture2;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("date", getDate())
            .append("picture1", getPicture1())
            .append("picture2", getPicture2())
            .toString();
    }
}
