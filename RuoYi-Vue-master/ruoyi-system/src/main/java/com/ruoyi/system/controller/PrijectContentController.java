package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.PrijectContent;
import com.ruoyi.system.service.IPrijectContentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 项目信息Controller
 *
 * @author Tr
 * @date 2024-10-04
 */
@RestController
@RequestMapping("/system/content")
public class PrijectContentController extends BaseController
{
    @Autowired
    private IPrijectContentService prijectContentService;

    /**
     * 查询项目信息列表
     */

    @GetMapping("/list")
    public TableDataInfo list(PrijectContent prijectContent)
    {
        startPage();
        List<PrijectContent> list = prijectContentService.selectPrijectContentList(prijectContent);
        return getDataTable(list);
    }



    /**
     * 获取项目信息详细信息
     */

    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(prijectContentService.selectPrijectContentById(id));
    }

    /**
     * 新增项目信息
     */

    @Log(title = "项目信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PrijectContent prijectContent)
    {
        LoginUser securityUser = SecurityUtils.getLoginUser();
        prijectContent.setExtend1(securityUser.getUser().getUserName());
        prijectContent.setCreateAvatar(securityUser.getUser().getAvatar());
        prijectContent.setCreateDept(securityUser.getUser().getDept().getDeptName());
        return toAjax(prijectContentService.insertPrijectContent(prijectContent));
    }

    /**
     * 修改项目信息
     */

    @Log(title = "项目信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PrijectContent prijectContent)
    {
        LoginUser securityUser = SecurityUtils.getLoginUser();
        prijectContent.setExtend1(securityUser.getUser().getUserName());
        prijectContent.setCreateAvatar(securityUser.getUser().getAvatar());
        prijectContent.setCreateDept(securityUser.getUser().getDept().getDeptName());
        return toAjax(prijectContentService.updatePrijectContent(prijectContent));
    }

    /**
     * 删除项目信息
     */

    @Log(title = "项目信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(prijectContentService.deletePrijectContentByIds(ids));
    }
}
