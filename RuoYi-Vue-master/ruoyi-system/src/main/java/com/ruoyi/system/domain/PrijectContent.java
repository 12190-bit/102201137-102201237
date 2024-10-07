package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 项目信息对象 priject_content
 * 
 * @author Tr
 * @date 2024-10-04
 */
public class PrijectContent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 图片 */
    @Excel(name = "图片")
    private String img;

    /** 添加时间 */
    private Date createDate;

    /** 专业 */
    private String createDept;

    /** 头像 */
    private String createAvatar;

    /** $column.columnComment */
    private String extend1;

    /** $column.columnComment */
    private String extend2;

    /** $column.columnComment */
    private String extend3;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setImg(String img) 
    {
        this.img = img;
    }

    public String getImg() 
    {
        return img;
    }
    public void setCreateDate(Date createDate) 
    {
        this.createDate = createDate;
    }

    public Date getCreateDate() 
    {
        return createDate;
    }
    public void setCreateDept(String createDept) 
    {
        this.createDept = createDept;
    }

    public String getCreateDept() 
    {
        return createDept;
    }
    public void setCreateAvatar(String createAvatar) 
    {
        this.createAvatar = createAvatar;
    }

    public String getCreateAvatar() 
    {
        return createAvatar;
    }
    public void setExtend1(String extend1) 
    {
        this.extend1 = extend1;
    }

    public String getExtend1() 
    {
        return extend1;
    }
    public void setExtend2(String extend2) 
    {
        this.extend2 = extend2;
    }

    public String getExtend2() 
    {
        return extend2;
    }
    public void setExtend3(String extend3) 
    {
        this.extend3 = extend3;
    }

    public String getExtend3() 
    {
        return extend3;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("title", getTitle())
            .append("content", getContent())
            .append("img", getImg())
            .append("createBy", getCreateBy())
            .append("createDate", getCreateDate())
            .append("createDept", getCreateDept())
            .append("createAvatar", getCreateAvatar())
            .append("extend1", getExtend1())
            .append("extend2", getExtend2())
            .append("extend3", getExtend3())
            .toString();
    }
}
