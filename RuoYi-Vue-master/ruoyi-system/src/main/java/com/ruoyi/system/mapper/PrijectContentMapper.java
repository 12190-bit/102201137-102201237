package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.PrijectContent;

/**
 * 项目信息Mapper接口
 * 
 * @author Tr
 * @date 2024-10-04
 */
public interface PrijectContentMapper 
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
     * 删除项目信息
     * 
     * @param id 项目信息主键
     * @return 结果
     */
    public int deletePrijectContentById(Long id);

    /**
     * 批量删除项目信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePrijectContentByIds(Long[] ids);
}
