import request from '@/utils/request'

// 查询项目信息列表
export function listContent(query) {
  return request({
    url: '/system/content/list',
    method: 'get',
    params: query
  })
}

// 查询项目信息详细
export function getContent(id) {
  return request({
    url: '/system/content/' + id,
    method: 'get'
  })
}

// 新增项目信息
export function addContent(data) {
  return request({
    url: '/system/content',
    method: 'post',
    data: data
  })
}

// 修改项目信息
export function updateContent(data) {
  return request({
    url: '/system/content',
    method: 'put',
    data: data
  })
}

// 删除项目信息
export function delContent(id) {
  return request({
    url: '/system/content/' + id,
    method: 'delete'
  })
}
