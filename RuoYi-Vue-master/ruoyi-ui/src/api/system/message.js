import request from '@/utils/request'

// 查询留言板列表
export function listMessage(query) {
  return request({
    url: '/system/message/list',
    method: 'get',
    params: query
  })
}

// 查询留言板详细
export function getMessage(handle) {
  return request({
    url: '/system/message/' + handle,
    method: 'get'
  })
}

// 新增留言板
export function addMessage(data) {
  return request({
    url: '/system/message',
    method: 'post',
    data: data
  })
}

// 修改留言板
export function updateMessage(data) {
  return request({
    url: '/system/message',
    method: 'put',
    data: data
  })
}

// 删除留言板
export function delMessage(handle) {
  return request({
    url: '/system/message/' + handle,
    method: 'delete'
  })
}
