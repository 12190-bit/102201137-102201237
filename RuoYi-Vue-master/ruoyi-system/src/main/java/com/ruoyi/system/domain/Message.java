package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 留言板对象 message
 * 
 * @author Tr
 * @date 2024-10-03
 */
public class Message extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private String handle;

    /** 发送人 */
    @Excel(name = "发送人")
    private String sendUser;

    /** 接收人 */
    @Excel(name = "接收人")
    private String receiveUser;

    /** 留言内容 */
    @Excel(name = "留言内容")
    private String content;

    /** 是否已读 */
    @Excel(name = "是否已读")
    private Integer isRead;

    public void setHandle(String handle) 
    {
        this.handle = handle;
    }

    public String getHandle() 
    {
        return handle;
    }
    public void setSendUser(String sendUser) 
    {
        this.sendUser = sendUser;
    }

    public String getSendUser() 
    {
        return sendUser;
    }
    public void setReceiveUser(String receiveUser) 
    {
        this.receiveUser = receiveUser;
    }

    public String getReceiveUser() 
    {
        return receiveUser;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setIsRead(Integer isRead) 
    {
        this.isRead = isRead;
    }

    public Integer getIsRead() 
    {
        return isRead;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("handle", getHandle())
            .append("sendUser", getSendUser())
            .append("receiveUser", getReceiveUser())
            .append("content", getContent())
            .append("isRead", getIsRead())
            .append("createTime", getCreateTime())
            .toString();
    }
}
