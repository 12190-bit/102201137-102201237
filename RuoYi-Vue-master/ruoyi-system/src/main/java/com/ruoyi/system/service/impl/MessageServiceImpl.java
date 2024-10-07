package com.ruoyi.system.service.impl;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.mapper.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MessageMapper;
import com.ruoyi.system.domain.Message;
import com.ruoyi.system.service.IMessageService;

/**
 * 留言板Service业务层处理
 *
 * @author Tr
 * @date 2024-10-03
 */
@Service
public class MessageServiceImpl implements IMessageService
{
    @Autowired
    private MessageMapper messageMapper;
    @Autowired
    private SysUserMapper userMapper;

    /**
     * 查询留言板
     *
     * @param handle 留言板主键
     * @return 留言板
     */
    @Override
    public Message selectMessageByHandle(String handle)
    {
        return messageMapper.selectMessageByHandle(handle);
    }

    /**
     * 查询留言板列表
     *
     * @param message 留言板
     * @return 留言板
     */
    @Override
    public List<Message> selectMessageList(Message message)
    {
        return messageMapper.selectMessageList(message);
    }

    /**
     * 新增留言板
     *
     * @param message 留言板
     * @return 结果
     */
    @Override
    public int insertMessage(Message message)
    {
        message.setCreateTime(DateUtils.getNowDate());
        return messageMapper.insertMessage(message);
    }

    /**
     * 修改留言板
     *
     * @param message 留言板
     * @return 结果
     */
    @Override
    public int updateMessage(Message message)
    {
        return messageMapper.updateMessage(message);
    }

    /**
     * 批量删除留言板
     *
     * @param handles 需要删除的留言板主键
     * @return 结果
     */
    @Override
    public int deleteMessageByHandles(String[] handles)
    {
        return messageMapper.deleteMessageByHandles(handles);
    }

    /**
     * 删除留言板信息
     *
     * @param handle 留言板主键
     * @return 结果
     */
    @Override
    public int deleteMessageByHandle(String handle)
    {
        return messageMapper.deleteMessageByHandle(handle);
    }

    @Override
    public void sendMessage(Message message) {

//            SysUser sendUser = userMapper.selectUserByUserName(message.getSendUser());
////            AssertUtils.isError(null == sendUser, "发送用户不存在,发送信息失败!");
////            AssertUtils.isError(sendUser.getStatus() != 1,
////                    "发送用户:" + message.getSendUser() + "状态已冻结,无法发送信息!");
//            SysUser receiveUser = userMapper.selectUserByUserName(message.getReceiveUser());
            message.setHandle(UUID.randomUUID().toString());
            message.setIsRead(0);
            message.setCreateTime(new Date());
            messageMapper.insertMessage(message);

    }

    @Override
    public List<Message> findMessageBySendUserAndReceiveUser(String sendUserId, String receiveUserId) {

        Map<String,Object> map =new HashMap<>();

            map.put("sendUser",sendUserId);
            map.put("receiveUser",receiveUserId);
            // 获取对方发送的信息,限制指定条数，防止聊天数量太多查询很慢
            List<Message> receiveMessageList = messageMapper.selectBySendUserAndReceiveUserLimitLength(map);
            // 获取发送给对方的信息
        map.put("sendUser",receiveUserId);
        map.put("receiveUser",sendUserId);
            List<Message> sendMessageList = messageMapper.selectBySendUserAndReceiveUserLimitLength(map);
            List<Message> allMessageList = new ArrayList<>();
            allMessageList.addAll(receiveMessageList);
            allMessageList.addAll(sendMessageList);
            // 将两个用户互相发送给对方的信息放到集合按照时间排序，即可实现聊天交互逻辑
            List<Message> sortedMessageList = allMessageList.stream()
                    .sorted(Comparator.comparing(Message::getCreateTime))
                    .collect(Collectors.toList());

            return sortedMessageList;

    }
}
