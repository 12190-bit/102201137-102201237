package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.PrijectContentMapper;
import com.ruoyi.system.domain.PrijectContent;
import com.ruoyi.system.service.IPrijectContentService;

/**
 * 项目信息Service业务层处理
 *
 * @author Tr
 * @date 2024-10-04
 */
@Service
public class PrijectContentServiceImpl implements IPrijectContentService
{
    @Autowired
    private PrijectContentMapper prijectContentMapper;

    /**
     * 查询项目信息
     *
     * @param id 项目信息主键
     * @return 项目信息
     */
    @Override
    public PrijectContent selectPrijectContentById(Long id)
    {
        return prijectContentMapper.selectPrijectContentById(id);
    }

    /**
     * 查询项目信息列表
     *
     * @param prijectContent 项目信息
     * @return 项目信息
     */
    @Override
    public List<PrijectContent> selectPrijectContentList(PrijectContent prijectContent)
    {
        return prijectContentMapper.selectPrijectContentList(prijectContent);
    }

    /**
     * 新增项目信息
     *
     * @param prijectContent 项目信息
     * @return 结果
     */
    @Override
    public int insertPrijectContent(PrijectContent prijectContent)
    {
        
        return prijectContentMapper.insertPrijectContent(prijectContent);
    }

    /**
     * 修改项目信息
     *
     * @param prijectContent 项目信息
     * @return 结果
     */
    @Override
    public int updatePrijectContent(PrijectContent prijectContent)
    {
        return prijectContentMapper.updatePrijectContent(prijectContent);
    }

    /**
     * 批量删除项目信息
     *
     * @param ids 需要删除的项目信息主键
     * @return 结果
     */
    @Override
    public int deletePrijectContentByIds(Long[] ids)
    {
        return prijectContentMapper.deletePrijectContentByIds(ids);
    }

    /**
     * 删除项目信息信息
     *
     * @param id 项目信息主键
     * @return 结果
     */
    @Override
    public int deletePrijectContentById(Long id)
    {
        return prijectContentMapper.deletePrijectContentById(id);
    }
}
