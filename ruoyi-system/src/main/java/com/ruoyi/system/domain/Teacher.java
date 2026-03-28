package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 教师信息对象 teacher
 * 
 * @author ruoyi
 * @date 2026-03-27
 */
public class Teacher extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 照片 */
    @Excel(name = "照片")
    private String picture;

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

    public void setPicture(String picture) 
    {
        this.picture = picture;
    }

    public String getPicture() 
    {
        return picture;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("picture", getPicture())
            .toString();
    }
}
