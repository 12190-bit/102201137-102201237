<template>
   <view class="box-container">
    <!-- Left side: User list -->
    <view class="left-side">
      <!-- Search input (moved outside) -->
      <view class="search-wrapper">
        <el-input v-model="searchUserName" placeholder="请输入搜索账户" class="search-input" ></el-input>
		<el-button type="primary" @click="searchUsers" class="send-button" >搜索</el-button>
	  </view>
    </view>
	<view>
		<el-scrollbar class="user-list-scroll">
		  <el-menu>
		   <el-menu-item v-for="user in filteredUsers" :key="user.userName" @click="chooseUser(user)" class="user-item">
		               <image v-if="user.avatar" :src="baseUrl+user.avatar" style="width: 50px;height: 50px;border-radius: 50px;"></image>
					   <image v-if="!user.avatar" :src="imagePath" style="width: 50px;height: 50px;border-radius: 50px;"></image>
		               <span style="margin-left: 20px;">{{ user.userName }}</span>
		               <!-- <span slot="title">{{ user.lastMessage }}</span> -->
		  </el-menu-item>
		  </el-menu>
		</el-scrollbar>
	</view>
    <!-- Right side: Chat box -->

  </view>
</template>


<script>
import config from '@/config'
import {searchUserByUserName} from '@/api/system/user'
import {findMessageBySendUserAndReceiveUser, sendMessage} from '@/api/system/message'
import { getUserInfo } from '@/utils/auth'
export default {
  data () {
    return {
		imagePath:'/static/jiaoliu.jpg',
	  baseUrl:config.baseUrl,
      intervalId: null, // 定时调用，实现实时获取聊天记录
      users: [],
      filteredUsers: [ ],
      currentUser: null, // 当前聊天人员用户信息
      loginUser: null, // 登录人员用户信息
      messages: [],
      newMessage: {
        handle: '',
        sendUser: '',
        receiveUser: '',
        content: '',
        is_read: '0',
        createTime: ''
      },
      loginUserId: '', // 登录人员userId
      searchUserName: '',
    }
  },
  methods: {

    sendMessage () {
      if (!this.newMessage.content.trim()) {
        this.$message.warning('请输入聊天内容')
        return
      }
      if (this.loginUserId== null) {
        this.$message.error('登录用户编号获取失败,请重新登录!')
        return
      }
      this.newMessage.sendUser = this.loginUserId
      this.newMessage.receiveUser = this.currentUser.userId
      console.log('需要发送信息', this.newMessage)
      sendMessage(this.newMessage).then(res => {
        console.log('发送信息:', res)
        if (res.header.code !== 0) {
          this.$message.error(res.header.message)
          return
        }
        // 发送完之后获取聊天记录更新
        this.chooseUser(this.currentUser)
      })
    },
    // 设置不同用户的头像
    checkAvatar (message) {
      if (message.sendUser === this.loginUserId) {
        console.log('发送人头像:', this.currentUser)
        return this.currentUser.avatar
      } else {
        console.log('登录人头像:', this.loginUser)
        return this.loginUser.avatar
      }
    },
    chooseUser (user) {
      this.currentUser = user
	  console.log(this.currentUser);
	  uni.navigateTo({
	  	url:'/pages/message/detail?userName='+user.userName+'&avatar='+user.avatar
	  })
    },
    searchUsers () {
      // if (!this.searchUserName) {
      //   this.$message.error('用户名不能为空!')
      //   return
      // }
      searchUserByUserName(this.searchUserName,this.loginUserId).then(res => {
       
        if (res.code !== 200) {
          this.$message.error(res.msg)
          return
        }
        this.filteredUsers = res.data
      })
    },
	getUser(){
		searchUserByUserName(this.searchUserName,this.loginUserId).then(res => {
		  
		  if (res.code !== 200) {
		    this.$message.error(res.msg)
		    return
		  }
		  this.filteredUsers = res.data
		})
	},
  },
  mounted () {
	  this.loginUser=getUserInfo()
	  this.loginUserId=this.loginUser.userName
	this.getUser()

  },
  destroyed () {
    // 在组件销毁前清除定时器，防止内存泄漏
    clearInterval(this.intervalId)
  },
}
</script>


<style lang="scss">

	page {
	  display: flex;
	  flex-direction: column;
	  box-sizing: border-box;
	  background-color: #fff;
	  min-height: 100%;
	  height: auto;
	}

	.box-container {
		border-top: 1px solid #d5d3d3;
		
		.left-side {
			
			width: 100%;
			height: 50px;
			display: flex;
			justify-content: center;
			align-items: center;
			
			.search-wrapper{
				
				
				width: 100%;
				height: 50px;
				display: flex;
				justify-content: center;
				align-items: center;
				
				.search-input {
					width: 300px;
					padding: 10px;
				  // position: absolute;
				 
				}
			}
			

		}

		.user-list-scroll {
			  top: 40px;
			  width: 99%;
			  height: 65vh;
			  overflow-y: auto;
			  
			  .user-item {
				// border: solid;
			    display: flex;
			    align-items: center;
			    padding: 10px;
				border-bottom: 1px solid #d5d3d3;
				border-right: 0;
			  }
		}
	}

	</style>
<style scoped>
.chat-container {
  display: flex;
  height: 100%;
  background: linear-gradient(to bottom right, #FFFFFF, #ECEFF1);
}









.chat-header {
  padding: 20px;
  border-bottom: 1px solid #eaeaea;
  font-size: 1.2em;
  color: #37474F;
}


.message-input {
  flex: 1;
  margin-right: 10px;
}

.send-button {
  flex-shrink: 0;
}



.user-item:hover {
  background-color: #E0E0E0;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.user-item .el-avatar {
  margin-right: 10px;
}

.user-item .el-list-item-content {
  flex: 1;
}
.editor {
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}
/* .search-input {
  position: relative;
  z-index: 999;
} */

.messageBox {
  display: flex;
  align-items: flex-start; /* 将头像和文本第一行对齐 */
  margin-bottom: 10px;
}

.messageBox img {
  width: 40px; /* 调整头像大小 */
  height: 40px;
  border-radius: 50%;
  margin-right: 10px;
  margin-left: 10px;
}

.messageContent {
  max-width: 70%; /* 调整发送信息宽度 */
  padding: 10px;
  border-radius: 8px;
  background-color: #f0f0f0;
  text-align: left; /* 文本左对齐 */
  word-wrap: break-word; /* 当文本过长时自动换行 */
}

.messageTime {
  font-size: 12px;
  color: #999;
  margin-left: 10px;
  margin-top: 5px; /* 将发送时间与文本分隔开 */
}

.ownMessage {
  flex-direction: row-reverse;
  align-items: flex-end; /* 将发送时间放置在最下方的贴右位置 */
}

.otherMessage {
  flex-direction: row;
  align-items: flex-end; /* 将发送时间放置在最下方的贴左位置 */
}
</style>

