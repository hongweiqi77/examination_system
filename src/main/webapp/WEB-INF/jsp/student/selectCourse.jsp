<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>已选课程</title>
<link rel="bookmark" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico"/>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico">
<link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!-- 引入JQuery  bootstrap.js-->
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>

</head>
<body>
	<!-- 顶栏 -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- 中间主体 -->
	<div class="container" id="content">
		<div class="row">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="col-md-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="row">
							<h1 class="col-md-5">已选课程</h1>


						</div>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>课程号</th>
								<th>课程名称</th>
								<th>授课老师</th>
								<th>上课时间</th>
								<th>上课地点</th>
								<th>周数</th>
								<th>课程类型</th>
								<th>学分</th>
								<th>考试时间地点</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${passedList}" var="item">
								<%--输出待审核退选的课程--%>
									<tr>
										<td>${item.couseCustom.courseid}</td>
										<td>${item.couseCustom.coursename}</td>
										<td>${item.couseCustom.teachername}</td>
										<td>${item.couseCustom.coursetime}</td>
										<td>${item.couseCustom.classroom}</td>
										<td>${item.couseCustom.courseweek}</td>
										<td>${item.couseCustom.coursetype}</td>
										<td>${item.couseCustom.score}</td>
										<td>${item.examinationplan}</td>
										<td><font color="orange" size="2">退选审核中</font></td>
									</tr>
							</c:forEach>
							<c:forEach items="${beingList}" var="item">
								<%--输出还没修完的课程--%>
									<tr>
										<td>${item.couseCustom.courseid}</td>
										<td>${item.couseCustom.coursename}</td>
										<td>${item.couseCustom.teachername}</td>
										<td>${item.couseCustom.coursetime}</td>
										<td>${item.couseCustom.classroom}</td>
										<td>${item.couseCustom.courseweek}</td>
										<td>${item.couseCustom.coursetype}</td>
										<td>${item.couseCustom.score}</td>
										<td>${item.examinationplan}</td>
										<td>
											<button class="btn btn-default btn-xs btn-info"
												onClick="location.href='${pageContext.request.contextPath}/student/outCourse?id=${item.id}'">退课</button>
											<!--弹出框-->
										</td>
									</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="panel-footer">
						<c:if test="${pagingVO != null}">
							<nav style="text-align: center">
								<ul class="pagination">
									<li><a
										href="${pageContext.request.contextPath}/student/showCourse?page=${pagingVO.upPageNo}">&laquo;上一页</a></li>
									<li class="active"><a href="">${pagingVO.curentPageNo}</a></li>
									<c:if test="${pagingVO.curentPageNo+1 <= pagingVO.totalCount}">
										<li><a
											href="${pageContext.request.contextPath}/student/showCourse?page=${pagingVO.curentPageNo+1}">${pagingVO.curentPageNo+1}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+2 <= pagingVO.totalCount}">
										<li><a
											href="${pageContext.request.contextPath}/student/showCourse?page=${pagingVO.curentPageNo+2}">${pagingVO.curentPageNo+2}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+3 <= pagingVO.totalCount}">
										<li><a
											href="${pageContext.request.contextPath}/student/showCourse?page=${pagingVO.curentPageNo+3}">${pagingVO.curentPageNo+3}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+4 <= pagingVO.totalCount}">
										<li><a
											href="${pageContext.request.contextPath}/student/showCourse?page=${pagingVO.curentPageNo+4}">${pagingVO.curentPageNo+4}</a></li>
									</c:if>
									<li><a
										href="${pageContext.request.contextPath}/student/showCourse?page=${pagingVO.totalCount}">最后一页&raquo;</a></li>
								</ul>
							</nav>
						</c:if>
					</div>
				</div>

			</div>
		</div>
	</div>
	<%@include file="Footer.jsp"%>
</body>
<script type="text/javascript">
		<%--设置菜单中--%>
		$("#nav li:nth-child(2)").addClass("active")
        <c:if test="${pagingVO != null}">
        if (${pagingVO.curentPageNo} == ${pagingVO.totalCount}) {
            $(".pagination li:last-child").addClass("disabled")
        };

        if (${pagingVO.curentPageNo} == ${1}) {
            $(".pagination li:nth-child(1)").addClass("disabled")
        };
        </c:if>

        function confirmd() {
            var msg = "您真的确定要删除吗？！";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
        }

        $("#sub").click(function () {
            $("#form1").submit();
        });
	</script>
</html>