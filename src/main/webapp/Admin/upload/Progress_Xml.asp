<%@EnableSessionState=False%> 

<!-- #include file="Upload.asp" -->

<%
	Response.CacheControl = "no-cache"
	Response.Expires = -1
	Response.ContentType  = "text/xml"	' 输出格式为xml

	Dim du, pi, progressID
	progressID = Request.QueryString("ProgressID")
	Set du = new DoteyUpload
	Set pi = du.GetProgressInfo(progressID)


	Dim xmlDoc
	Set xmlDoc = Server.CreateObject("Microsoft.XMLDOM")
	xmlDoc.loadXML "<ProgressInfo/>"
	Set root = xmlDoc.documentElement

	Dim eleTotalBytes, eleUploadedBytes, eleStartTime, eleLastActivity, eleReadyState, eleErrorMessage
	Dim eleTotalSize, eleElapsedTime, eleSizeCompleted, eleTransferRate, elePercentage, eleTimeLeft
	If Not IsEmpty(pi)  Then

		Set eleTotalBytes = xmlDoc.createElement("TotalBytes")
		root.appendChild(eleTotalBytes)
		eleTotalBytes.text = pi.TotalBytes

		Set eleUploadedBytes = xmlDoc.createElement("UploadedBytes")
		root.appendChild(eleUploadedBytes)
		eleUploadedBytes.text = pi.UploadedBytes

		Set eleStartTime = xmlDoc.createElement("StartTime")
		root.appendChild(eleStartTime)
		eleStartTime.text = pi.StartTime

		Set eleLastActivity = xmlDoc.createElement("LastActivity")
		root.appendChild(eleLastActivity)
		eleLastActivity.text = pi.LastActivity

		Set eleReadyState = xmlDoc.createElement("ReadyState")
		root.appendChild(eleReadyState)
		eleReadyState.text = pi.ReadyState


		Set eleTotalSize = xmlDoc.createElement("TotalSize")
		root.appendChild(eleTotalSize)
		eleTotalSize.text = pi.TotalSize

		Set eleSizeCompleted = xmlDoc.createElement("SizeCompleted")
		root.appendChild(eleSizeCompleted)
		eleSizeCompleted.text = pi.SizeCompleted

		Set eleElapsedTime = xmlDoc.createElement("ElapsedTime")
		root.appendChild(eleElapsedTime)
		eleElapsedTime.text = pi.ElapsedTime

		Set eleTransferRate = xmlDoc.createElement("TransferRate")
		root.appendChild(eleTransferRate)
		eleTransferRate.text = pi.TransferRate

		Set elePercentage = xmlDoc.createElement("Percentage")
		root.appendChild(elePercentage)
		elePercentage.text = pi.Percentage

		Set eleTimeLeft = xmlDoc.createElement("TimeLeft")
		root.appendChild(eleTimeLeft)
		eleTimeLeft.text = pi.TimeLeft

		If pi.ErrorMessage <> "" Then
			Set eleErrorMessage = xmlDoc.createElement("ErrorMessage")
			root.appendChild(eleErrorMessage)
			eleErrorMessage.text = pi.ErrorMessage
		End If
	Else
		Set eleErrorMessage = xmlDoc.createElement("ErrorMessage")
		root.appendChild(eleErrorMessage)
		eleErrorMessage.text = "读取失败"
	End If

response.write("<?xml version=""1.0"" encoding=""GB2312""?>"&xmlDoc.xml)

%>
