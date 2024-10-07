import request from '@/utils/request'

// 查询轮播图列表
export function listRotationmap(query) {
  return request({
    url: '/system/Rotationmap/list',
    method: 'get',
    params: query
  })
}

// 查询轮播图详细
export function getRotationmap(id) {
  return request({
    url: '/system/Rotationmap/' + id,
    method: 'get'
  })
}

// 新增轮播图
export function addRotationmap(data) {
  return request({
    url: '/system/Rotationmap',
    method: 'post',
    data: data
  })
}

// 修改轮播图
export function updateRotationmap(data) {
  return request({
    url: '/system/Rotationmap',
    method: 'put',
    data: data
  })
}

// 删除轮播图
export function delRotationmap(id) {
  return request({
    url: '/system/Rotationmap/' + id,
    method: 'delete'
  })
}
