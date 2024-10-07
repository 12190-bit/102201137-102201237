const TokenKey = 'App-Token'

const UserKey = 'App-User'
export function getToken() {
  return uni.getStorageSync(TokenKey)
}

export function setToken(token) {
  return uni.setStorageSync(TokenKey, token)
}

export function removeToken() {
  return uni.removeStorageSync(TokenKey)
}

export function getUserInfo() {
  return uni.getStorageSync(UserKey)
}

export function setUserInfo(user) {
  return uni.setStorageSync(UserKey, user)
}
