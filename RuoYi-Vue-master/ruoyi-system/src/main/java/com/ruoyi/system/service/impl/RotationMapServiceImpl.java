package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.RotationMapMapper;
import com.ruoyi.system.domain.RotationMap;
import com.ruoyi.system.service.IRotationMapService;

/**
 * 轮播图Service业务层处理
 * 
 * @author Tr
 * @date 2024-10-04
 */
@Service
public class RotationMapServiceImpl implements IRotationMapService 
{
    @Autowired
    private RotationMapMapper rotationMapMapper;

    /**
     * 查询轮播图
     * 
     * @param id 轮播图主键
     * @return 轮播图
     */
    @Override
    public RotationMap selectRotationMapById(Long id)
    {
        return rotationMapMapper.selectRotationMapById(id);
    }

    /**
     * 查询轮播图列表
     * 
     * @param rotationMap 轮播图
     * @return 轮播图
     */
    @Override
    public List<RotationMap> selectRotationMapList(RotationMap rotationMap)
    {
        return rotationMapMapper.selectRotationMapList(rotationMap);
    }

    /**
     * 新增轮播图
     * 
     * @param rotationMap 轮播图
     * @return 结果
     */
    @Override
    public int insertRotationMap(RotationMap rotationMap)
    {
        return rotationMapMapper.insertRotationMap(rotationMap);
    }

    /**
     * 修改轮播图
     * 
     * @param rotationMap 轮播图
     * @return 结果
     */
    @Override
    public int updateRotationMap(RotationMap rotationMap)
    {
        return rotationMapMapper.updateRotationMap(rotationMap);
    }

    /**
     * 批量删除轮播图
     * 
     * @param ids 需要删除的轮播图主键
     * @return 结果
     */
    @Override
    public int deleteRotationMapByIds(Long[] ids)
    {
        return rotationMapMapper.deleteRotationMapByIds(ids);
    }

    /**
     * 删除轮播图信息
     * 
     * @param id 轮播图主键
     * @return 结果
     */
    @Override
    public int deleteRotationMapById(Long id)
    {
        return rotationMapMapper.deleteRotationMapById(id);
    }
}
