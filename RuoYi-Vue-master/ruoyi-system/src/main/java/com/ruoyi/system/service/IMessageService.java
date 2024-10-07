package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Message;

/**
 * 留言板Service接口
 *
 * @author Tr
 * @date 2024-10-03
 */
public interface IMessageService
{
    /**
     * 查询留言板
     *
     * @param handle 留言板主键
     * @return 留言板
     */
    public Message selectMessageByHandle(String handle);

    /**
     * 查询留言板列表
     *
     * @param message 留言板
     * @return 留言板集合
     */
    public List<Message> selectMessageList(Message message);

    /**
     * 新增留言板
     *
     * @param message 留言板
     * @return 结果
     */
    public int insertMessage(Message message);

    /**
     * 修改留言板
     *
     * @param message 留言板
     * @return 结果
     */
    public int updateMessage(Message message);

    /**
     * 批量删除留言板
     *
     * @param handles 需要删除的留言板主键集合
     * @return 结果
     */
    public int deleteMessageByHandles(String[] handles);

    /**
     * 删除留言板信息
     *
     * @param handle 留言板主键
     * @return 结果
     */
    public int deleteMessageByHandle(String handle);

    void sendMessage(Message message);


    List<Message> findMessageBySendUserAndReceiveUser(String sendUserId, String receiveUserId);
}
