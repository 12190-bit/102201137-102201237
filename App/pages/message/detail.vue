<template>

<view class="duihk-box">
	<view class="right-side">
	  <!-- Chat header -->
	  <view class="chat-header">
	    <span v-if="currentUser">{{ currentUser.userName }}</span>
	  </view>
	  <!-- Chat messages -->
	  <el-scrollbar class="chat-messages" ref="messageContainer">
	    <view class="messageBox" v-for="message in messages" :key="message.handle" :class="{ ownMessage: message.sendUser === loginUserId, otherMessage: message.sendUser !== loginUserId }">
	      <view>
			  <img :src="message.sendUser === loginUserId ? baseUrl+loginUser.avatar : baseUrl+currentUser.avatar" alt="">
			  <!-- <img :src="message.sendUser === loginUserId ? loginUser.avatar : currentUser.avatar" alt=""> -->
		  </view>
	      <view class="messageContent">{{ message.content }}</view>
	      <!-- 这里逻辑我是为了时间格式化，请按照自己项目实际修改 -->
	      <view class="messageTime">{{ message.createTime.replace('T', ' ') }}</view>
	    </view>
	  </el-scrollbar>
	  <view class="chat-input">
	    <el-input v-model="newMessage.content" placeholder="请输入聊天内容" autosize class="message-input"></el-input>
	    <el-button type="primary" @click.native="sendMessage" class="send-button">发送</el-button>
	  </view>
	</view>
</view>
</template>

<script>
import config from '@/config'
import {findMessageBySendUserAndReceiveUser, sendMessage} from '@/api/system/message'
import { getUserInfo } from '@/utils/auth'
export default {
  data () {
    return {
		baseUrl:config.baseUrl,
      intervalId: null, // 定时调用，实现实时获取聊天记录
      users: [],
      currentUser: {
		  userName:'',
		  avatar:''
	  }, // 当前聊天人员用户信息
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
  onLoad: function(options) {
      // options 中将包含 pageA 传递过来的参数
	  this.currentUser.userName=options.userName
	  this.currentUser.avatar=options.avatar
    },
	  watch: {
	    // 监听messages数组的变化
	    messages: {
	      deep: true,
	      handler() {
	        this.$nextTick(() => {
	          // 数据更新后，滚动到底部
	          const container = this.$refs.messageContainer;
	          container.scrollTop = container.scrollHeight;
	        });
	      }
	    }
	  },
  methods: {
    async fetchMessages (userId) {
    // 传当前聊天人员的userId
      if (!userId) {
        return
      }
      if (this.loginUserId== null) {
        this.$message.error('登录用户编号获取失败,请重新登录!')
        return
      }
      findMessageBySendUserAndReceiveUser(this.loginUserId,userId ).then(res => {
     
        if (res.code !== 200) {
          this.$message.error(res.msg)
          return
        }
        // 赋值最终的聊天信息，根据自己项目调整赋值
        this.messages = res.data
      })
    },
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
      this.newMessage.receiveUser = this.currentUser.userName
      
      sendMessage(this.newMessage).then(res => {
        
        if (res.code !== 200) {
          this.$message.error(res.message)
          return
        }
		this.newMessage.content=""
        // 发送完之后获取聊天记录更新
        this.fetchMessages(this.currentUser.userName)
		const container = this.$refs.messageContainer;
		container.scrollTop = container.scrollHeight;
      })
    },
  },
  mounted () {
	this.loginUser=getUserInfo()
	console.log("==========",this.loginUser);
	this.loginUserId=this.loginUser.userName
  // 定时自动
    this.intervalId = setInterval(() => {
      this.fetchMessages(this.currentUser.userName)
    }, 3000)
  },
  destroyed () {
    // 在组件销毁前清除定时器，防止内存泄漏
    clearInterval(this.intervalId)
  },
  created () {

  }
}
</script>


<style scoped>
	.ownMessage {
	  flex-direction: row-reverse;
	  align-items: flex-end; /* 将发送时间放置在最下方的贴右位置 */
	}
	
	.otherMessage {
	  flex-direction: row;
	  align-items: flex-end; /* 将发送时间放置在最下方的贴左位置 */
	}
</style>
<style lang="scss">
	page {
	  display: flex;
	  flex-direction: column;
	  box-sizing: border-box;
	  background-color: #fff;
	  min-height: 100%;
	  height: auto;
	}
	
	.duihk-box{
		
		width: 100%;
		height: 90vh;
		
		.right-side {
			width: 100%;
		 height: 100%;
	
		  display: flex;
		  flex-direction: column;
		  
		  .chat-header{
			  
			  border-bottom: 1px solid #eaeaea;
			  border-top: 1px solid #eaeaea;
			  height: 40px;
			  display:flex;
			  justify-content: center;
			  align-items: center;
			  font-size: 20px;
		  }
		  
		  .chat-messages{
			  
			  height: 70vh;
			  overflow-y: auto;
			  padding: 20px;
			  border-bottom: 1px solid #eaeaea;
			  
			  .messageBox {
			    display: flex;
			    align-items: flex-start; /* 将头像和文本第一行对齐 */
			    margin-bottom: 10px;
				
				img {
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
				  font-size: 10px;
				  color: #999;
				  margin-left: 10px;
				  margin-top: 20px; /* 将发送时间与文本分隔开 */
				}
			  }
			
			  
		  }
		  
		  .chat-input{
			  // border: solid red;
			  padding: 20px;
			  display: flex;
			  
			  
			  .send-button{
				  margin-left: 10px;
			  }
		  }
		  
		}
	}
	
</style>