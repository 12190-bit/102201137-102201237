package com.ruoyi.system.controller;

import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.file.MimeTypeUtils;
import com.ruoyi.system.domain.PrijectContent;
import com.ruoyi.system.service.IPrijectContentService;
import com.ruoyi.system.service.ISysDeptService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import static com.ruoyi.common.core.domain.AjaxResult.error;
import static com.ruoyi.common.core.domain.AjaxResult.success;

@RestController
@RequestMapping("app")
public class AppController {

    @Autowired
    ISysDeptService deptService;
    @Autowired
    ISysUserService userService;

    @Autowired
    private IPrijectContentService prijectContentService;
    @RequestMapping("deptselect")
    public AjaxResult deptselect(){
        return success(deptService.selectDeptSelect());
    }



    @RequestMapping(value = "/feddback", consumes = "multipart/form-data")
    public AjaxResult feddback(PrijectContent prijectContent, @RequestParam("file") MultipartFile file) throws Exception
    {
        if (!file.isEmpty())
        {
            String filePath = FileUploadUtils.upload(RuoYiConfig.getAvatarPath(), file, MimeTypeUtils.IMAGE_EXTENSION);
//            SysFeedback sysFeedback =new SysFeedback();
//            sysFeedback.setContent(content);
            prijectContent.setImg(filePath);
            int i = prijectContentService.insertPrijectContent(prijectContent);
            return success(i);
        }
        return error("上传图片异常，请联系管理员");
    }



}
