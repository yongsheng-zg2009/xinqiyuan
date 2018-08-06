<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<td width="205" rowspan="2" vAlign=top>
	<table border=0 cellSpacing=0 cellPadding=0 width="205">
		<TBODY>
			<tr>
				<td height=30 width=18><IMG alt="" src="/image/index_hs_zh_13.jpg" width=18 height=30></td>
				<td background=/image/index_hs_zh_14.jpg width=157></td>
				<td width=18><IMG alt="" src="/image/index_hs_zh_16.jpg" width=18 height=30></td>
			</tr>
			<tr>
				<td vAlign=top background=/image/index_hs_zh_29_bg.jpg><IMG alt="" src="/image/index_hs_zh_29.jpg" width=18 height=313></td>
				<td bgColor=#f5f5f5 vAlign=top><table cellSpacing=2  cellPadding=0 width='100%' align=center style='background-color: #efefef'>
						<!--用友大中型ERP系列 -- start   -->
						<tr>
							<td height=22><a href='/products/A00020001.html'><font style='FONT-SIZE: 12px; font-weight: bold; color: #ff0000'>${yybigMiddleSeriesCata.title }</font></a></td>
						</tr>
						<td height=2 background=/image/index_hs_zh_32.jpg></td>
						<tr>
							<td>
								<table cellSpacing=2 cellPadding=0 width='100%'align=center style='background-color: #f5f5f5'>
									<c:forEach items="${yybigMiddleNews}" var="data">
										    <tr>
												<td width=10 align=center valign=middle><IMG src=/image/index_hs_zh_35.jpg align=absMiddle></td>
												<td><a href='/${data.id }.html'><font style='FONT-FAMILY: 宋体'>${data.title }</font></a>
											</tr>
											<tr>
												<td height=1 colspan=2 background=/image/index_hs_zh_56.jpg style='padding-left: 20px'></td>
											</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
						<!--用友大中型ERP系列 -- end   -->
						
						<!--用友中小型ERP系列 -->
						<tr>
							<td height=22><a href=/products/A00020002.html><font
									style='FONT-SIZE: 12px; font-weight: bold; color: #ff0000'>用友中小型ERP系列</font></a></td>
						</tr>
						<td height=2 background=/image/index_hs_zh_32.jpg></td>
						
						<tr>
							<td><table cellSpacing=2 cellPadding=0 width='100%'
									align=center style='background-color: #f5f5f5'>
									<c:forEach items="${yyMiddleSmalleNews}" var="data">
									<tr>
										<td width=10 align=center valign=middle><IMG src=/image/index_hs_zh_35.jpg align=absMiddle></td>
										<td><a href='/${data.id }.html'><font style='FONT-FAMILY: 宋体'>${data.title }</font></a>
									</tr>
									<tr>
										<td height=1 colspan=2 background=/image/index_hs_zh_56.jpg style='padding-left: 20px'></td>
									</tr>
									</c:forEach>
								</table></td>
						</tr>
						<!-- 用友中小型ERP系列  结束-->
						
						<tr>
							<td height=22><a href=/products/A00020003.html><font
									style='FONT-SIZE: 12px; font-weight: bold; color: #ff0000'>用友其他系列</font></a></td>
						</tr>
						<td height=2 background=/image/index_hs_zh_32.jpg></td>
						<tr>
							<td>
							   <table cellSpacing=2 cellPadding=0 width='100%' align=center style='background-color: #f5f5f5'>
									<c:forEach items="${yyOtherSeriesNews}" var="data">
										<tr>
											<td width=10 align=center valign=middle><img src=/image/index_hs_zh_35.jpg align=absMiddle></td>
											<td><a href='/${data.id }.html'><font style='FONT-FAMILY: 宋体'>${data.title }</font></a>
										</tr>
										<tr>
											<td height=1 colspan=2 background=/image/index_hs_zh_56.jpg style='padding-left: 20px'></td>
										</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
						<tr>
							<td height=22><a href=/products/A00020004.html> <font style='FONT-SIZE: 12px; font-weight: bold; color: #ff0000'>行政事业版</font></a></td>
						</tr>
						<td height=2 background=/image/index_hs_zh_32.jpg></td>
						<tr>
							<td><table cellSpacing=2 cellPadding=0 width='100%'
									align=center style='background-color: #f5f5f5'>
									<c:forEach items="${affairSeriesNews}" var="data">
										<tr>
											<td width=10 align=center valign=middle><IMG src=/image/index_hs_zh_35.jpg align=absMiddle></td>
											<td><a href='/${data.id }.html'><font style='FONT-FAMILY: 宋体'>${data.title }</font></a>
										</tr>
										<tr>
											<td height=1 colspan=2 background=/image/index_hs_zh_56.jpg style='padding-left: 20px'></td>
										</tr>
									</c:forEach>
								</table></td>
						</tr>
						<tr>
							<td height=22><a href=/products/A00020005.html><font
									style='FONT-SIZE: 12px; font-weight: bold; color: #ff0000'>用友配套产品</font></a></td>
						</tr>
						<td height=2 background=/image/index_hs_zh_32.jpg></td>
						<tr>
							<td><table cellSpacing=2 cellPadding=0 width='100%'
									align=center style='background-color: #f5f5f5'>
									<c:forEach items="${yyRelationSeriesNews}" var="data">
										<tr>
											<td width=10 align=center valign=middle><IMG src=/image/index_hs_zh_35.jpg align=absMiddle></td>
											<td><a href='/${data.id }.html'><font style='FONT-FAMILY: 宋体'>${data.title }</font></a>
										</tr>
										<tr>
											<td height=1 colspan=2 background=/image/index_hs_zh_56.jpg
												style='padding-left: 20px'></td>
										</tr>
									</c:forEach>
								</table></td>
						</tr>
					</table></td>
				<td vAlign=top background=/image/index_hs_zh_31_bg.jpg><IMG
					alt="" src="/image/index_hs_zh_31.jpg" width=18 height=313></td>
			</tr>
			<tr>
				<td height=16><IMG alt="" src="/image/index_hs_zh_77.jpg"
					width=18 height=16></td>
				<td background=/image/index_hs_zh_78.jpg></td>
				<td><IMG alt="" src="/image/index_hs_zh_79.jpg" width=18
					height=16></td>
			</tr>
		</TBODY>
	</table>
</td>
