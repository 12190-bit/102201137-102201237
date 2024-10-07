<template>
  <view class="normal-login-container">
    <view class="logo-content align-center justify-center flex">
      <image style="width: 100rpx;height: 100rpx;border-radius: 50px;" src="../static/jiaoliu.jpg" mode="widthFix">
      </image>
      <text class="title">注册</text>
    </view>
    <view class="login-form-content">
		<view class="input-item flex align-center">
		  <view class="iconfont icon-service icon"></view>
		  <input v-model="registerForm.phonenumber" class="input" type="text" placeholder="请输入手机号" maxlength="30" />
		</view>
      <view class="input-item flex align-center">
        <view class="iconfont icon-user icon"></view>
        <input v-model="registerForm.username" class="input" type="text" placeholder="请输入账号/学号/职工号" maxlength="30" />
      </view>
	  <view class="input-item flex align-center">
	  <el-select v-model="registerForm.deptId" placeholder="请选择专业" style="width: 100%;">
		  <el-option
			v-for="item in options"
			:key="item.deptId"
			:label="item.deptName"
			:value="item.deptId">
		  </el-option>
		</el-select>
	  <!-- <uni-data-select
	   style="height: 45px;margin-bottom: 20px ;
	   background-color: #f5f6f7;"
		placeholder="请选择专业"
	   v-model="registerForm.deptId"
	   :localdata="range"
	   @change="change">
	   </uni-data-select> -->
	  </view>
	  <view style="display: flex;height: 45px;align-items: center;justify-content: start;">
		  <view class="input-item flex align-center" >
		    <input v-model="registerForm.yanzm" class="input" type="text" placeholder="输入验证码" maxlength="30" />
		  </view>
		  <button @click="getyanzm()" class="block bg-blue" style="border-radius: 20px;font-size: 16px">获取验证码</button>
	  </view>

      <view class="action-btn">
        <button @click="handleRegister()" class="register-btn cu-btn block bg-blue lg round">注册</button>
      </view>
    </view>
    <view class="xieyi text-center">
      <text @click="handleUserLogin" class="text-blue">使用已有账号登录</text>
    </view>
  </view>
</template>

<script>
  import { getDeptSelect, register } from '@/api/login'

  export default {
    data() {
      return {
		  customTitle: '新的标题',
		options: [],
        codeUrl: "",
        captchaEnabled: true,
        globalConfig: getApp().globalData.config,
        registerForm: {
          username: "",
          password: "",
          confirmPassword: "",
          code: "",
		  yanzm:"",
		  phonenumber:"",
          uuid: ''
        }
      }
    },
    mounted() {
      this.getDept()
    },
    methods: {
      // 用户登录
      handleUserLogin() {
        this.$tab.navigateTo(`/pages/login`)
      },
     
      getDept() {
        getDeptSelect().then(res => {
			console.log("=======================",res);
			this.options=res.data;
         
        })
      },
      // 注册方法
      async handleRegister() {
        if (this.registerForm.username === "") {
          this.$modal.msgError("请输入您的账号")
        }else if (this.registerForm.phonenumber === "") {
          this.$modal.msgError("请输入手机号")
        }else if (this.registerForm.yanzm === "") {
          this.$modal.msgError("请输入验证码")
        }  else {
          this.$modal.loading("注册中，请耐心等待...")
          this.register()
        }
      },
	  getyanzm(){
		  var that =this
		  
		  if (that.registerForm.phonenumber === "") {
		    that.$modal.msgError("请输入手机号")
		  }else{
			  var uuid =that.generateRandom6DigitNumber();
			  uni.showModal({
			  	title: "验证码",
			  	content: "本次验证码：" +uuid ,
				success: function (res) {
					if (res.confirm) {
					that.registerForm.yanzm=uuid
					}
					
				}
			  })
		  }
	  },
	  generateRandom6DigitNumber() {
	    return Math.floor(100000 + Math.random() * 900000);
	  },
      // 用户注册
      async register() {
		  this.registerForm.password="123456"
        register(this.registerForm).then(res => {
          this.$modal.closeLoading()
          uni.showModal({
          	title: "系统提示",
          	content: "恭喜你，您的账号 " + this.registerForm.username + " 注册成功！",
          	success: function (res) {
          		if (res.confirm) {
                uni.redirectTo({ url: `/pages/login` });
          		}
          	}
          })
        }).catch(() => {
          if (this.captchaEnabled) {
            this.getCode()
          }
        })
      },
      // 注册成功后，处理函数
      registerSuccess(result) {
        // 设置用户信息
        this.$store.dispatch('GetInfo').then(res => {
          this.$tab.reLaunch('/pages/index')
        })
      }
    }
  }
</script>

<style lang="scss">
  page {
    background-color: #ffffff;
  }

  .normal-login-container {
    width: 100%;

    .logo-content {
      width: 100%;
      font-size: 21px;
      text-align: center;
      padding-top: 15%;

      image {
        border-radius: 4px;
      }

      .title {
        margin-left: 10px;
      }
    }

    .login-form-content {
      text-align: center;
      margin: 20px auto;
      margin-top: 15%;
      width: 80%;

      .input-item {
        margin: 20px auto;
        background-color: #f5f6f7;
        height: 45px;
        border-radius: 20px;

        .icon {
          font-size: 38rpx;
          margin-left: 10px;
          color: #999;
        }

        .input {
          width: 100%;
          font-size: 14px;
          line-height: 20px;
          text-align: left;
          padding-left: 15px;
        }

      }

      .register-btn {
        margin-top: 40px;
        height: 45px;
      }

      .xieyi {
        color: #333;
        margin-top: 20px;
      }
      
      .login-code {
        height: 38px;
        float: right;
      
        .login-code-img {
          height: 38px;
          position: absolute;
          margin-left: 10px;
          width: 200rpx;
        }
      }
    }
  }

</style>
