package com.ruoyi.system.mapper;

import java.util.List;
import java.util.Map;

import com.ruoyi.system.domain.Message;

/**
 * 留言板Mapper接口
 *
 * @author Tr
 * @date 2024-10-03
 */
public interface MessageMapper
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
     * 删除留言板
     *
     * @param handle 留言板主键
     * @return 结果
     */
    public int deleteMessageByHandle(String handle);

    /**
     * 批量删除留言板
     *
     * @param handles 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMessageByHandles(String[] handles);

    List<Message> selectBySendUserAndReceiveUserLimitLength(Map<String,Object> map);
}
