<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<frameset cols="20%,80%" title="Documentation frame"
	onload="top.loadFrames()">

	<frameset rows="30%,70%" title="Left frames" onload="top.loadFrames()">

		<frame src="overview-frame.html" name="packageListFrame"
			title="All Packages">

		<frame src="allclasses-frame.html" name="packageFrame"
			title="All classes and interfaces (except non-static nested types)">

	</frameset>

	<frame src="overview-summary.html" name="classFrame"
		title="Package, class and interface descriptions" scrolling="yes">

	<noframes>

		<noscript>

			<div>JavaScript is disabled on your browser.</div>

		</noscript>

		<h2>Frame Alert</h2>

		<p>
			This document is designed to be viewed using the frames feature. If
			you see this message, you are using a non-frame-capable web client.
			Link to <a href="overview-summary.html">Non-frame version</a>.
		</p>

	</noframes>

</frameset>
</body>
</html>