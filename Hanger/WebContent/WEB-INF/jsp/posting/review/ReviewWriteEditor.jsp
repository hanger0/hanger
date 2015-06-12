<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>

<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<SCRIPT src="/js/common/common.js"></SCRIPT>
<script src="/js/posting/review/review.js" type="text/javascript"></script>

<!-- include libries(jQuery, bootstrap, fontawesome) -->
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.1/js/bootstrap.min.js"></script>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"
	rel="stylesheet">

<!-- include summernote css/js-->
<link href="/css/posting/summernote.css" rel="s tylesheet">
<script src="/js/posting/summernote.js"></script>

<head>
<title>Review Write Editor</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>

<script type="text/javascript">
	$(function() {
		$('.summernote').summernote({
		});
	});
</script>
<body>
	<form id="reviewForm" name="reviewForm" action="/reviewWriteResult.hang" method="post" enctype="multipart/form-data">
		<INPUT type="hidden" id="content" name="content" value=""/>
		제목 : <INPUT class="text" type="text" name="title" maxlength="30">
		<textarea class="summernote" ></textarea>
		<INPUT type="button" class="btn btn-default" value="작성"
			style="cursor: pointer" onclick="WriteReview()"/>	
	</form>
</body>
</html>