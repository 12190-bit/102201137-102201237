package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Message;
import com.ruoyi.system.service.IMessageService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import static com.ruoyi.common.core.domain.AjaxResult.success;

/**
 * 留言板Controller
 *
 * @author Tr
 * @date 2024-10-03
 */
@RestController
@RequestMapping("/system/message")
public class MessageController extends BaseController
{
    @Autowired
    private IMessageService messageService;
    @Autowired
    ISysUserService userService;
    /**
     * 查询留言板列表
     */

    @GetMapping("/list")
    public TableDataInfo list(Message message)
    {
        startPage();
        List<Message> list = messageService.selectMessageList(message);
        return getDataTable(list);
    }

    /**
     * 导出留言板列表
     */

    @Log(title = "留言板", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Message message)
    {
        List<Message> list = messageService.selectMessageList(message);
        ExcelUtil<Message> util = new ExcelUtil<Message>(Message.class);
        util.exportExcel(response, list, "留言板数据");
    }

    /**
     * 获取留言板详细信息
     */

    @GetMapping(value = "/{handle}")
    public AjaxResult getInfo(@PathVariable("handle") String handle)
    {
        return success(messageService.selectMessageByHandle(handle));
    }

    /**
     * 新增留言板
     */

    @Log(title = "留言板", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Message message)
    {
        return toAjax(messageService.insertMessage(message));
    }

    /**
     * 修改留言板
     */

    @Log(title = "留言板", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Message message)
    {
        return toAjax(messageService.updateMessage(message));
    }

    /**
     * 删除留言板
     */

    @Log(title = "留言板", businessType = BusinessType.DELETE)
	@DeleteMapping("/{handles}")
    public AjaxResult remove(@PathVariable String[] handles)
    {
        return toAjax(messageService.deleteMessageByHandles(handles));
    }

    @RequestMapping("/sendMessage")
    public AjaxResult sendMessage(@RequestBody Message message) {
            messageService.sendMessage(message);
            return success("发送成功!");

    }

    @GetMapping("/findMessageBySendUserAndReceiveUser")
    public AjaxResult findMessageBySendUserAndReceiveUser(
            @RequestParam("sendUserId") String sendUserId,
            @RequestParam("receiveUserId") String receiveUserId) {
            List<Message> list =messageService.findMessageBySendUserAndReceiveUser(sendUserId, receiveUserId);
            return success(list);
    }

    @RequestMapping("/searchUserByUserName")
    public AjaxResult searchUserByUserId(String userName,String loginUserId) {
        List<SysUser> user = userService.selectUserByUserNameNotUser(userName,loginUserId);
        if (user!=null){
            return  success(user);
        }
        return error("查询用户不存在！");

    }
}
