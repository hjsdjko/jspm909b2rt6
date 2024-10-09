<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="jsp/static/head.jsp"%>
</head>
<style>
	#home-container {
				padding: 30px;
				background: url(http://codegen.caihongy.cn/20230330/2fc70680a5454e95907c7c0d811bb812.jpg) fixed no-repeat center top /100% 100%;
				min-height: 100vh;
				height: 100%;
			}
	
	#home-container div.home-container-title {
				margin: 20px auto;
				color: #334854;
				font-weight: bold;
				font-size: 32px;
				text-align: center;
			}
	
	#home-container .cards {
				margin: 50px 0;
				display: flex;
				justify-content: center;
				align-items: center;
			}
	
	#home-container .cards .item {
				border: 1px solid #ddd;
				border-radius: 0px;
				box-shadow: 0 0px 0px rgba(0,0,0,.3);
				margin: 0 10px;
				background: rgba(255,255,255,.9);
				display: flex;
			}
	
	#home-container .cards .item .link {
				background: url(http://codegen.caihongy.cn/20230224/7b9ac76e6ed4427d925b003bcf9bf4c5.png) no-repeat center center / 60% auto;
				width: 100px;
				border-color: #ddd;
				border-width: 0 1px 0 0;
				border-style: solid;
				height: 100px;
			}
	
	#home-container .cards .item .item-body {
				flex-direction: column;
				display: flex;
				width: 160px;
				justify-content: center;
				align-items: center;
			}
	
	#home-container .cards .item .item-body .num {
				margin: 5px 0;
				color: #333;
				font-weight: bold;
				font-size: 20px;
				line-height: 24px;
				height: 24px;
			}
	
	#home-container .cards .item .item-body .name {
				margin: 5px 0;
				color: #666;
				font-size: 16px;
				line-height: 24px;
				height: 24px;
			}
	
    .homeCharts{
        display: flex;
        width: 100%;
        align-items: center;
        height: auto;
        box-shadow: 0 4px 10px rgba(0,0,0,.3);
        border-radius: 10px;
        margin-bottom: 20px;
    }
</style> 
<body>
	<div id="main-container">
		<!-- Top Navigation -->
		<%@ include file="jsp/static/topNav.jsp"%>
		
		<!-- Menu -->
		<div id="menu-container" class="navbar">
			<ul class="navbar-nav navbar-vertical" id="navUl">
				
			</ul>
		</div>
		<!-- /Menu -->
			
		<!-- Breadcrumb -->
		<div id="breadcrumb-container">
			<h3 class="breadcrumb-title">主页</h3>
			<ol class="breadcrumb-list">
				<li class="breadcrumb-item-home">
					<a href="#">
						<span class="ti-home"></span>
					</a>
				</li>
			</ol>
		</div>
		<!-- /Breadcrumb -->
			
		<!-- Main Content -->
		<div id="home-container">
			<div class="home-container-title">欢迎使用&nbsp;基于servlet.jsp的潮服购物商城系统的设计与实现</div>
			
			<div class="cards" :style='{"margin":"50px 0","alignItems":"center","justifyContent":"center","display":"flex"}'>
				<div class="item" :style='{"border":"1px solid #ddd","boxShadow":"0 0px 0px rgba(0,0,0,.3)","margin":"0 10px","borderRadius":"0px","background":"rgba(255,255,255,.9)","display":"flex"}' v-if="crossBtnControl2('fuzhuangxinxi','首页总数')">
					<div class="link" :style='{"width":"100px","borderColor":"#ddd","borderStyle":"solid","background":"url(http://codegen.caihongy.cn/20230224/7b9ac76e6ed4427d925b003bcf9bf4c5.png) no-repeat center center / 60% auto","borderWidth":"0 1px 0 0","height":"100px"}'></div>
					<div class="item-body" :style='{"width":"160px","alignItems":"center","flexDirection":"column","justifyContent":"center","display":"flex"}'>
						<div class="num" :style='{"margin":"5px 0","lineHeight":"24px","fontSize":"20px","color":"#333","fontWeight":"bold","height":"24px"}'>{{fuzhuangxinxiCount}}</div>
						<div class="name" :style='{"margin":"5px 0","lineHeight":"24px","fontSize":"16px","color":"#666","height":"24px"}'>服装信息总数</div>
					</div>
				</div>
			</div>
			
			<div class="homeCharts">
				<div id="fuzhuangxinxiMain1" v-if="crossBtnControl2('fuzhuangxinxi','首页统计')" class="graph" style="width: 100%;height:300px;"></div>
				<div id="fuzhuangxinxiMain2" v-if="crossBtnControl2('fuzhuangxinxi','首页统计')" class="graph" style="width: 100%;height:300px;"></div>
				<div id="fuzhuangxinxiMain3" v-if="crossBtnControl2('fuzhuangxinxi','首页统计')" class="graph" style="width: 100%;height:300px;"></div>
				<div id="fuzhuangxinxiMain4" v-if="crossBtnControl2('fuzhuangxinxi','首页统计')" class="graph" style="width: 100%;height:300px;"></div>
			</div>
		</div>
		<!-- /Main Content -->
	</div>
	
	<!-- Back to Top -->
	<a id="back-to-top" href="#" class="back-to-top">Top</a>
	<!-- /Back to Top -->
	
	<%@ include file="jsp/static/foot.jsp"%>
    <script src="${pageContext.request.contextPath}/resources/js/echarts.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>

	<script>
		<%@ include file="jsp/utils/menu.jsp"%>
		<%@ include file="jsp/static/setMenu.js"%>
		<%@ include file="jsp/utils/baseUrl.jsp"%>
        <%@ include file="jsp/static/crossBtnControl.js"%>
		// 用户登出
        <%@ include file="jsp/static/logout.jsp"%>
        var vm = new Vue({
            el: '#home-container',
            data: {
            fuzhuangxinxiCount: 0,
            }
        });
        function getfuzhuangxinxiCount() {
                $.ajax({
                    type: "GET",
                    url: baseUrl+`fuzhuangxinxi/count`,
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
                    },
                    success: function(data){
                        if(data.code == 0){
                            vm.fuzhuangxinxiCount = data.data;
                        }else if(data.code == 401){
                            <%@ include file="jsp/static/toLogin.jsp"%>
                        }else{
                            alert(data.msg);
                        }
                    },
                });
        }

                function fuzhuangxinxichartDialog1(){

                    $.ajax({
                        type: "GET",
                        url: baseUrl+`fuzhuangxinxi/value/fuzhuangmingcheng/alllimittimes`,
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
                        },
                        success: function(data){
                            if(data.code == 0){
                                if(data.data != null){
                                    let res = data.data;
                                    let xAxis = [];
                                    let yAxis = [];
                                    let pArray = []
                                    for(let i=0;i<res.length;i++){
                                        xAxis.push(res[i].fuzhuangmingcheng);
                                        yAxis.push(parseFloat((res[i].total)));
                                        pArray.push({
                                            value: parseFloat((res[i].total)),
                                            name: res[i].fuzhuangmingcheng
                                        })
                                    }

                                    var myChart = echarts.init(document.getElementById('fuzhuangxinxiMain1'),'macarons');
                                    var option = {};
                                    option = {
                                        title: {
                                            text: '服装库存',
                                            left: 'center'
                                        },
                                        tooltip: {
                                          trigger: 'item',
                                          formatter: '{b} : {c}'
                                        },
                                        xAxis: {
                                            type: 'category',
                                            data: xAxis
                                        },
                                        yAxis: {
                                            type: 'value'
                                        },
                                        series: [{
                                            data: yAxis,
                                            type: 'bar'
                                        }]
                                    };

                                    // 使用刚指定的配置项和数据显示图表。
                                    myChart.setOption(option);
                                }
                            }else if(data.code == 401){
                                <%@ include file="jsp/static/toLogin.jsp"%>
                            }else{
                                alert(data.msg);
                            }
                        },
                    });
                }

                function fuzhuangxinxichartDialog2(){

                    $.ajax({
                        type: "GET",
                        url: baseUrl+"fuzhuangxinxi/group/fenlei",
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
                        },
                        success: function(data){
                            if(data.code == 0){
                                if(data.data != null){
                                    let res = data.data;
                                    let xAxis = [];
                                    let yAxis = [];
                                    let pArray = []
                                    for(let i=0;i<res.length;i++){
                                        xAxis.push(res[i].fenlei);
                                        yAxis.push(parseFloat((res[i].total)));
                                        pArray.push({
                                            value: parseFloat((res[i].total)),
                                            name: res[i].fenlei
                                        })
                                    }

                                    var myChart = echarts.init(document.getElementById('fuzhuangxinxiMain2'),'macarons');
                                    var option = {};
                                    option = {
                                            title: {
                                                text: '服装分类占比',
                                                left: 'center'
                                            },
                                            legend: {
                                              orient: 'vertical',
                                              left: 'left'
                                            },
                                            tooltip: {
                                              trigger: 'item',
                                              formatter: '{b} : {c} ({d}%)'
                                            },
                                            series: [
                                                {
                                                    type: 'pie',
                                                    radius: ['25%', '55%'],
                                                    center: ['50%', '60%'],
                                                    data: pArray,
                                                    emphasis: {
                                                        itemStyle: {
                                                            shadowBlur: 10,
                                                            shadowOffsetX: 0,
                                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                        }
                                                    }
                                                }
                                            ]
                                    };

                                    // 使用刚指定的配置项和数据显示图表。
                                    myChart.setOption(option);
                                }
                            }else if(data.code == 401){
                                <%@ include file="jsp/static/toLogin.jsp"%>
                            }else{
                                alert(data.msg);
                            }
                        },
                    });
                }

                function fuzhuangxinxichartDialog3(){

                    $.ajax({
                        type: "GET",
                        url: baseUrl+"fuzhuangxinxi/group/pinpai",
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
                        },
                        success: function(data){
                            if(data.code == 0){
                                if(data.data != null){
                                    let res = data.data;
                                    let xAxis = [];
                                    let yAxis = [];
                                    let pArray = []
                                    for(let i=0;i<res.length;i++){
                                        xAxis.push(res[i].pinpai);
                                        yAxis.push(parseFloat((res[i].total)));
                                        pArray.push({
                                            value: parseFloat((res[i].total)),
                                            name: res[i].pinpai
                                        })
                                    }

                                    var myChart = echarts.init(document.getElementById('fuzhuangxinxiMain3'),'macarons');
                                    var option = {};
                                    option = {
                                        title: {
                                            text: '品牌商品量',
                                            left: 'center'
                                        },
                                        tooltip: {
                                          trigger: 'item',
                                          formatter: '{b} : {c}'
                                        },
                                        xAxis: {
                                            type: 'category',
                                            data: xAxis
                                        },
                                        yAxis: {
                                            type: 'value'
                                        },
                                        series: [{
                                            data: yAxis,
                                            type: 'bar'
                                        }]
                                    };

                                    // 使用刚指定的配置项和数据显示图表。
                                    myChart.setOption(option);
                                }
                            }else if(data.code == 401){
                                <%@ include file="jsp/static/toLogin.jsp"%>
                            }else{
                                alert(data.msg);
                            }
                        },
                    });
                }

                function fuzhuangxinxichartDialog4(){

                    $.ajax({
                        type: "GET",
                        url: baseUrl+"fuzhuangxinxi/group/caizhi",
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
                        },
                        success: function(data){
                            if(data.code == 0){
                                if(data.data != null){
                                    let res = data.data;
                                    let xAxis = [];
                                    let yAxis = [];
                                    let pArray = []
                                    for(let i=0;i<res.length;i++){
                                        xAxis.push(res[i].caizhi);
                                        yAxis.push(parseFloat((res[i].total)));
                                        pArray.push({
                                            value: parseFloat((res[i].total)),
                                            name: res[i].caizhi
                                        })
                                    }

                                    var myChart = echarts.init(document.getElementById('fuzhuangxinxiMain4'),'macarons');
                                    var option = {};
                                    option = {
                                            title: {
                                                text: '服装材质产比',
                                                left: 'center'
                                            },
                                            legend: {
                                              orient: 'vertical',
                                              left: 'left'
                                            },
                                            tooltip: {
                                              trigger: 'item',
                                              formatter: '{b} : {c} ({d}%)'
                                            },
                                            series: [
                                                {
                                                    type: 'pie',
                                                    radius: '55%',
                                                    center: ['50%', '60%'],
                                                    data: pArray,
                                                    emphasis: {
                                                        itemStyle: {
                                                            shadowBlur: 10,
                                                            shadowOffsetX: 0,
                                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                        }
                                                    }
                                                }
                                            ]
                                    };

                                    // 使用刚指定的配置项和数据显示图表。
                                    myChart.setOption(option);
                                }
                            }else if(data.code == 401){
                                <%@ include file="jsp/static/toLogin.jsp"%>
                            }else{
                                alert(data.msg);
                            }
                        },
                    });
                }




		$(document).ready(function() {
		//我的后台,session信息转移
		if(window.localStorage.getItem("Token") != null && window.localStorage.getItem("Token") != 'null'){
			  if(window.sessionStorage.getItem("token") == null || window.sessionStorage.getItem("token") == 'null'){
				  window.sessionStorage.setItem("token",window.localStorage.getItem("Token"));
				  window.sessionStorage.setItem("role",window.localStorage.getItem("role"));
				  window.sessionStorage.setItem("accountTableName",window.localStorage.getItem("sessionTable"));
				  window.sessionStorage.setItem("username",window.localStorage.getItem("adminName"));
			  }
		  }			
          $('.dropdown-menu h5').html(window.sessionStorage.getItem('username')+'('+window.sessionStorage.getItem('role')+')')
		  $('.sidebar-header h3 a').html(projectName)
		  var token = window.sessionStorage.getItem("token");
		  if(token == "null" || token == null){
		  	alert("请登录后再操作");
		  	window.location.href = ("jsp/login.jsp");
		  }
			setMenu();
			<%@ include file="jsp/static/myInfo.js"%>
            getfuzhuangxinxiCount();
            fuzhuangxinxichartDialog1()
            fuzhuangxinxichartDialog2()
            fuzhuangxinxichartDialog3()
            fuzhuangxinxichartDialog4()
		});
	</script>
</body>

</html>
