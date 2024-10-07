import request from '@/utils/request'




// 用户密码重置
export function updateUserPwd(oldPassword, newPassword) {
  const data = {
    oldPassword,
    newPassword
  }
  return request({
    url: '/system/user/profile/updatePwd',
    method: 'put',
    params: data
  })
}

// 查询用户个人信息
export function getUserProfile() {
  return request({
    url: '/system/user/profile',
    method: 'get'
  })
}

// 修改用户个人信息
export function updateUserProfile(data) {
  return request({
    url: '/system/user/profile',
    method: 'put',
    data: data
  })
}

// 用户头像上传
export function uploadAvatar(data) {
  return upload({
    url: '/system/user/profile/avatar',
    name: data.name,
    filePath: data.filePath
  })
}


// 发送信息
export function sendMessage (data) {
  return request({
    url: '/system/message/sendMessage',
    method: 'post',
    data: data
  })
}

// 根据发送用户和接收用户获取聊天记录
export function findMessageBySendUserAndReceiveUser (sendUserId, receiveUserId) {
  return request({
    url: '/system/message/findMessageBySendUserAndReceiveUser',
    method: 'get',
    params: {
      sendUserId,
      receiveUserId
    }
  })
}