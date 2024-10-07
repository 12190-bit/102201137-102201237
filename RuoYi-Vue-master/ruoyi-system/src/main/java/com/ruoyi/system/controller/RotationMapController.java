package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.system.domain.RotationMap;
import com.ruoyi.system.service.IRotationMapService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 轮播图Controller
 *
 * @author Tr
 * @date 2024-10-04
 */
@RestController
@RequestMapping("/system/Rotationmap")
public class RotationMapController extends BaseController
{
    @Autowired
    private IRotationMapService rotationMapService;

    /**
     * 查询轮播图列表
     */

    @GetMapping("/list")
    public TableDataInfo list(RotationMap rotationMap)
    {
        startPage();
        List<RotationMap> list = rotationMapService.selectRotationMapList(rotationMap);
        return getDataTable(list);
    }

    /**
     * 导出轮播图列表
     */

    @Log(title = "轮播图", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RotationMap rotationMap)
    {
        List<RotationMap> list = rotationMapService.selectRotationMapList(rotationMap);
        ExcelUtil<RotationMap> util = new ExcelUtil<RotationMap>(RotationMap.class);
        util.exportExcel(response, list, "轮播图数据");
    }

    /**
     * 获取轮播图详细信息
     */

    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(rotationMapService.selectRotationMapById(id));
    }

    /**
     * 新增轮播图
     */

    @Log(title = "轮播图", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RotationMap rotationMap)
    {
        return toAjax(rotationMapService.insertRotationMap(rotationMap));
    }

    /**
     * 修改轮播图
     */

    @Log(title = "轮播图", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RotationMap rotationMap)
    {
        return toAjax(rotationMapService.updateRotationMap(rotationMap));
    }

    /**
     * 删除轮播图
     */

    @Log(title = "轮播图", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(rotationMapService.deleteRotationMapByIds(ids));
    }
}
