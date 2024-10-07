package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.PrijectContent;

/**
 * 项目信息Service接口
 * 
 * @author Tr
 * @date 2024-10-04
 */
public interface IPrijectContentService 
{
    /**
     * 查询项目信息
     * 
     * @param id 项目信息主键
     * @return 项目信息
     */
    public PrijectContent selectPrijectContentById(Long id);

    /**
     * 查询项目信息列表
     * 
     * @param prijectContent 项目信息
     * @return 项目信息集合
     */
    public List<PrijectContent> selectPrijectContentList(PrijectContent prijectContent);

    /**
     * 新增项目信息
     * 
     * @param prijectContent 项目信息
     * @return 结果
     */
    public int insertPrijectContent(PrijectContent prijectContent);

    /**
     * 修改项目信息
     * 
     * @param prijectContent 项目信息
     * @return 结果
     */
    public int updatePrijectContent(PrijectContent prijectContent);

    /**
     * 批量删除项目信息
     * 
     * @param ids 需要删除的项目信息主键集合
     * @return 结果
     */
    public int deletePrijectContentByIds(Long[] ids);

    /**
     * 删除项目信息信息
     * 
     * @param id 项目信息主键
     * @return 结果
     */
    public int deletePrijectContentById(Long id);
}
