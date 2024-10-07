package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 轮播图对象 rotation_map
 * 
 * @author Tr
 * @date 2024-10-04
 */
public class RotationMap extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 住建 */
    private Long id;

    /** 图片 */
    @Excel(name = "图片")
    private String imgUrl;

    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 添加时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "添加时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    /** $column.columnComment */
    private String extend1;

    /** $column.columnComment */
    private String extend2;

    /** $column.columnComment */
    private String extend3;

    /** $column.columnComment */
    private String extend4;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setImgUrl(String imgUrl) 
    {
        this.imgUrl = imgUrl;
    }

    public String getImgUrl() 
    {
        return imgUrl;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setCreateDate(Date createDate) 
    {
        this.createDate = createDate;
    }

    public Date getCreateDate() 
    {
        return createDate;
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
    public void setExtend4(String extend4) 
    {
        this.extend4 = extend4;
    }

    public String getExtend4() 
    {
        return extend4;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("imgUrl", getImgUrl())
            .append("title", getTitle())
            .append("createDate", getCreateDate())
            .append("extend1", getExtend1())
            .append("extend2", getExtend2())
            .append("extend3", getExtend3())
            .append("extend4", getExtend4())
            .toString();
    }
}
