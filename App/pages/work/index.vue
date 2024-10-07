<template>
  <view class="work-container" >
	  <view class="header">
		  <view class="title">广场</view>
		  <view class="right" @click="addProject"><image src="../../static/images/add.png" ></image></view>
	  </view>
    <!-- 轮播图 -->
    <uni-swiper-dot class="uni-swiper-dot-box" :info="data" :current="current" field="content">
      <swiper class="swiper-box" :current="swiperDotIndex" @change="changeSwiper">
        <swiper-item v-for="(item, index) in data.slice(0,4)" :key="index">
          <view class="swiper-item" @click="clickBannerItem(item)">
            <image :src="baseUrl+item.imgUrl" mode="aspectFill" :draggable="false" />
          </view>
        </swiper-item>
      </swiper>
    </uni-swiper-dot>

    <view>
    	<el-scrollbar class="box-item">
    	   <view v-for="user in projectList" :key="user.userName" @click="chooseUser(user)" class="user-item">
						<view class="user">
							<view class="img">
														<image v-if="user.createAvatar" :src="baseUrl+user.createAvatar" ></image>
														<image v-if="!user.createAvatar" :src="imagePath" ></image>
													</view>
							<view class="contents">
													   <view class="name">{{ user.extend1 }}</view>
													   <view class="dept">{{ user.createDept }}</view>
							</view>
						</view>
						<view class="project">
							<view class="img">
														<image  :src="baseUrl+user.img" ></image>

													</view>
							<view class="contents">
													   <view class="name">{{ user.title }}</view>
													   <view class="dept">{{ user.content }}</view>
													   <view class="time">{{ user.createDate }}</view>
							</view>

						</view>

    	  </view>

    	</el-scrollbar>
    </view>
    <!-- 添加或修改项目信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="300px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入标题" />
        </el-form-item>
        <el-form-item label="内容">
          <el-input type="textarea" v-model="form.content" :min-height="192"/>
        </el-form-item>
        <el-form-item label="图片" prop="img">
         
          						  <uni-file-picker
          						  	v-model="imageValue"
          						  	fileMediatype="image"
          						  	mode="grid"
									@select="onFileSelected"
          						  	@fail="fail"
          							:limit="1"
          						  />
          
        </el-form-item>
      </el-form>
      <view slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </view>
    </el-dialog>
  </view>
</template>

<script>
	import config from '@/config'
	 import {listRotationmap} from '@/api/system/Rotationmap'
	 import {listContent} from '@/api/system/content'
	 import { getUserInfo } from '@/utils/auth'
  export default {

    data() {
      return {
		        // 弹出层标题
	title: "",
		        // 是否显示弹出层
	open: false,
	      // 表单参数
	      form: {
			 img:'',
			 content:'', 
			 title:''
		  },
	      // 表单校验
	      rules: {
	      },
		imageValue:[],
	  tempFilePaths:'',
	  baseUrl:config.baseUrl,
	  imagePath:'/static/jiaoliu.jpg',
	  projectList: [],
        current: 0,
        swiperDotIndex: 0,
        data: []
      }
    },
	mounted() {
		this.getRotationMap();
		this.getProjectList();
	},
    methods: {
		onFileSelected(e){
			console.log(e.tempFilePaths[0]);
			this.tempFilePaths=e.tempFilePaths[0]
		},
		addProject(){
			      this.reset();
			      this.open = true;
			      this.title = "添加项目";
		},
		cancel() {
		  this.open = false;
		  this.reset();
		},
		submitForm(){
			var that =this;
			var url =that.baseUrl;
			var user =getUserInfo()
			
			if(that.tempFilePaths!=null  && that.tempFilePaths !='' && that.tempFilePaths!=undefined){
				uni.uploadFile({
				      url: url+'/app/feddback', // 服务器上传接口
				      filePath: that.tempFilePaths, // 要上传文件资源的路径
				      name: 'file', // 必填，文件对应的 key
				      formData: {
						 'title':that.form.title ,
						 'content':that.form.content,
						 'createDept':user.dept.deptName,
						 'createAvatar':user.avatar,
						 'extend1':user.userName
					  },
				      success: function (res) {
						  // console.log(res);
						  var result =JSON.parse(res.data)
						  console.log(result);
				        if(result.code==200){
							uni.showToast({
								title:"提交成功！",
								icon:'success'
							});
							that.open = false;
							that.reset();
							that.getProjectList();
							that.tempFilePaths=''
						}
				      },
				      fail: function (uploadFileErr) {
				        console.log('uploadFile fail:', uploadFileErr);
				      }
				    });
			}else{
				that.$message.error("图片没有选择")
			}
			
		},
			    reset() {
			      this.form = {
			        id: null,
			        title: null,
			        content: null,
			        img: null,
			        createBy: null,
			        createDate: null,
			        createDept: null,
			        createAvatar: null,
			        extend1: null,
			        extend2: null,
			        extend3: null
			      };
			    
			    },
		getProjectList(){
			listContent().then(res => {
			  console.log('project:', res)
			  if (res.code !== 200) {
			    this.$message.error(res.msg)
			    return
			  }
			  this.projectList = res.rows
			})
		},
		getRotationMap(){
			listRotationmap().then(res => {
			  if (res.code !== 200) {
			    this.$message.error(res.msg)
			    return
			  }
			  this.data = res.rows
			})
		},
      clickBannerItem(item) {
        console.info(item)
      },
      changeSwiper(e) {
        this.current = e.detail.current
      },
      changeGrid(e) {
        this.$modal.showToast('模块建设中~')
      }
    }
  }
</script>

<style lang="scss">
  /* #ifndef APP-NVUE */
  page {
    display: flex;
    flex-direction: column;
    box-sizing: border-box;
    background-color: #fff;
    min-height: 100%;
    height: auto;
  }

  view {
    font-size: 14px;
    line-height: inherit;
  }

  /* #endif */

  .text {
    text-align: center;
    font-size: 26rpx;
    margin-top: 10rpx;
  }

  .grid-item-box {
    flex: 1;
    /* #ifndef APP-NVUE */
    display: flex;
    /* #endif */
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 15px 0;
  }

  .uni-margin-wrap {
    width: 690rpx;
    width: 100%;
    ;
  }

  .swiper {
    height: 300rpx;
  }

  .swiper-box {
    height: 150px;
  }

  .swiper-item {
    /* #ifndef APP-NVUE */
    display: flex;
    /* #endif */
    flex-direction: column;
    justify-content: center;
    align-items: center;
    color: #fff;
    height: 300rpx;
    line-height: 300rpx;
  }

  @media screen and (min-width: 500px) {
    .uni-swiper-dot-box {
      width: 400px;
      /* #ifndef APP-NVUE */
      margin: 0 auto;
      /* #endif */
      margin-top: 8px;
    }

    .image {
      width: 100%;
    }
  }

  .header{
	  
	  height: 40px;
	  display: flex;
	  align-items: center;
	  border-bottom: 2px solid #d5d3d3;
	  
	  .title{
		  display: flex;
		  justify-content: center;
		  font-size: 20px;
		 margin-left: 30px;
		 
		  width: 95%;
	  }
	  .right{
		  display: flex;
		   margin-right: 10px;
		  // justify-content: center;
		  width: 5%;	
		  
		  image{
			  width: 100%;
			  height: 20px;
		  }
	  }
  }

  .box-item {

  	  top: 5px;
	  padding: 10px;
  	  // width: 99%;
  	  height: 55vh;
  	  overflow-y: auto;


  	  .user-item {
  	    display: flex;
		flex-direction: column;
		height: 150px;

		.user{
			display: flex;
			align-items: center;
			flex: 1;

			.img{
				flex: 1;
				width: 100%;
				height: 100%;
				display: flex;
				justify-content: center;
				align-items: center;

				image{
					width: 40px;
					height: 40px;
					border-radius: 50px;
				}
			}
			.contents{

				flex: 5;
				height: 100%;
				margin-left: 20px;
				display: flex;
				width: 200px;
				justify-content: center;
				flex-direction: column;

				.name{
					display:flex;
					align-items: center;
					flex: 1;
				}
				.dept{
					display:flex;
					align-items: center;
					flex: 1;
				}

			}
		}
		.project{
				flex: 3;
				 border: 1px solid #d5d3d3;
				  // height: 10vh;
				  display: flex;
				  align-items: center;
				  margin-top: 5px;
				  margin-bottom: 5px;

				  .img{
					// border:  solid red;
				  	flex: 1;
				  	width: 100%;
				  	height: 100%;
				  	display: flex;
					padding: 5px;
				  	justify-content: center;
				  	align-items: center;

				  	image{
				  		width: 100%;
				  		height: 80%;
				  	}
				  }

				  .contents{

				  	flex: 5;
				  	height: 100%;
				  	margin-left: 20px;
				  	display: flex;
				  	width: 200px;
				  	justify-content: center;
				  	flex-direction: column;

				  	.name{

				  		display:flex;
				  		align-items: center;
				  		height: 30px;
						
						width: 100%;
						white-space: nowrap;

				  	}
				  	.dept{
				  		display:flex;
				  		align-items: center;
				  		height: 30px;
				  		
						width: 100%;
						white-space: nowrap;
				  	}
					.time{
						font-size: 12px;
						color: #504f4f;
						display:flex;
						align-items: center;
						height: 30px;
						width: 100%;
						white-space: nowrap;
					}

				  }
		}

  	  }


  }
</style>
