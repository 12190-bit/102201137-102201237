package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.RotationMap;

/**
 * 轮播图Service接口
 * 
 * @author Tr
 * @date 2024-10-04
 */
public interface IRotationMapService 
{
    /**
     * 查询轮播图
     * 
     * @param id 轮播图主键
     * @return 轮播图
     */
    public RotationMap selectRotationMapById(Long id);

    /**
     * 查询轮播图列表
     * 
     * @param rotationMap 轮播图
     * @return 轮播图集合
     */
    public List<RotationMap> selectRotationMapList(RotationMap rotationMap);

    /**
     * 新增轮播图
     * 
     * @param rotationMap 轮播图
     * @return 结果
     */
    public int insertRotationMap(RotationMap rotationMap);

    /**
     * 修改轮播图
     * 
     * @param rotationMap 轮播图
     * @return 结果
     */
    public int updateRotationMap(RotationMap rotationMap);

    /**
     * 批量删除轮播图
     * 
     * @param ids 需要删除的轮播图主键集合
     * @return 结果
     */
    public int deleteRotationMapByIds(Long[] ids);

    /**
     * 删除轮播图信息
     * 
     * @param id 轮播图主键
     * @return 结果
     */
    public int deleteRotationMapById(Long id);
}
