<%@ page contentType="text/html;charset=euc-kr" %>

    <body class="ourBody" style = "background-color:#EBEBEB">
        <div class="container">
       	<BR><BR><BR>
       	<div class="thumbnail">
    		<div class="header" style = "width:980px;height:500px;margin-left:80px">
        		<div class="product-info" style = "background-color:white;width:980px;height:500px;border:1px gray">
					<div class = "product" 
					style = "width:460px;height:460px;background-image:url(/assets/images/hanger.png);float:left;margin-left:20px;margin-top:20px">
					</div>
					<div class = "product-subject" style = "width:447px;height:460px;float:right">
						<div class = "subTitle"><p><h5>2015 S/S �ƹ氡���� �������� ���� ũ�� ��Ʈ</h5></p>
						</div>
					<div class = "titleFW"><p><h3>[�糪] �ƹ氡���� �Ŀ���Ʈ</h3></p>
					</div>
					
					<ul class="nav nav-pills">
				  <a> <li role="presentation" class="btn btn-default" >������</li></a>
				  <a> <li role="presentation" class="btn btn-default" >��ü���</li></a>
				</ul>
					
					<HR style="border: 1px solid gray">
					<TABLE>
						<TR>
							<TD style = "width:108px;height:30px">����</TD>
							<TD><STRIKE>28,000��</STRIKE><font color = "red">&nbsp;&nbsp;&nbsp;29%</font></TD>
						</TR>
						<TR>
							<TD style = "width:108px;height:30px">���� �ǸŰ�</TD>
							<TD>19,800��</TD>
						</TR>
						<TR>
							<TD style = "width:108px;height:30px">��ۺ�</TD>
							<TD><B>������</B></TD>
						</TR>
						<TR>
							<TD style = "width:108px;height:30px">��������</TD>
	                		<TD><a href = "#">4���� ����</a></TD>
						</TR>
						<TR>
							<TD style = "width:108px;height:30px">�ɼ� ����</TD>
							<TD>
								�ɼ� ���� ���� �ؾ� ��						
							</TD>
						</TR>
					</TABLE>
				<HR style="border: 1px solid gray">
				<div class = "productPrice" style = "width:200px;height:50px;align:right">�� ��ǰ �ݾ� :<font size = "5" ><font color = "red">19,800</font></font> ��</div>
				<div class = "buy" align = "center">
				
				<ul class="nav nav-pills">
				  <li role="presentation" class="butn btn-default" style = "width:228px;height:40px;align:center;margin-left:120px"><a href="/cart.hang"><B>�����ϱ� / ���</B></a></li>
				</ul>
				</div>
			</div>
         </div>
    </div>
    </div>
	<BR>
	<BR>

	<script>
	$('#myTab a').click(function (e) {
		  e.preventDefault()
		  $(this).tab('show')
		})
	</script>

	<!-- ��ǰ ���� ����ȭ ���� -->
	<div class="thumbnail" style = "width:100%;height:300px;">
	<div class = "product-munsu" style = "width:100%;height:300px;"><BR>
		<div class = "title" style = "margin-left:22px;"><font size = "4"><B>��ǰ ����</B></font></div>
		
		<div role="tabpanel">

		  <!-- Nav tabs -->
		  <ul class="nav nav-tabs" role="tablist" style = "margin-left:-5px">
		    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
		    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
		    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Messages</a></li>
		    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li>
		  </ul>
		
		  <!-- Tab panes -->
		  <div class="tab-content">
		    <div role="tabpanel" class="tab-pane active" id="home">�̰��� ȭ��ǰ�� ������ ���� �� �Դϴ�.</div>
		    <div role="tabpanel" class="tab-pane" id="profile">��ǰ�� : ���ٵ� �Ͽ콺 ���� ��ä ���ζ� ������ �μ�</div>
		    <div role="tabpanel" class="tab-pane" id="messages">���̺��� �Ἥ ǥ �������� �ۼ��ص� �˴ϴ�..</div>
		    <div role="tabpanel" class="tab-pane" id="settings">�ٿ��� �˴ϴ�.</div>
		  </div>
		
	</div>
	</div>
	</div>
	<!-- ��ǰ ���� ����ȭ �� -->
	
	<BR>
	<BR>
	
	<!-- �ȷο� ���� �ۼ� ���� -->
	<div class="thumbnail" style = "background-color:white;width:100%;"><BR>
    	<div class = "title" style = "margin-left:22px;"><font size = "4"><B>��ǰ �̹���(��)</B></font></div>
    		<div class="field description-wrap">
    			<div class = "etc" align = "center">
	        	<img src = "/assets/images/1.jpg" />
	        	</div>
            </div>
       	</div>
       
    <!-- �ȷο� ���� �ۼ� �� -->
    
    <BR>
    <BR>
    
    <!-- ���� �ۼ� ���� -->
        <div class="thumbnail" style = "background-color:white;width:100%;"><BR>
        	<div class = "title" style = "margin-left:22px;"><font size = "4"><B>�ȷο� ����</B></font>
        	</div><BR>
 <%
    	for(int i = 0 ; i < 2 ; i++) {
 %>		
 		<div class = "review" style = "background-color:white;width:100%;height:100px;">
			<div class = "profile" style = "width:100px;height:100px;float:left;margin-left:2%">
				<img src = "/assets/images/song.jpg" style = "width:100px;height:100px;"/></div>
			<div class = "name" style = "width:400px;height:30px;float:left;margin-left:20px;">���� : �� ��ǰ �ʹ� ���ƿ�
			(<b>dofwk2@***** / 2015-05-29</b>)</div>
			<br>
			<BR>
			<div class = "name" style = "width:700px;height:60px;float:left;margin-left:20px;">���� : </div>
		</div>
		<hr style = "width:100%;">
<%
    	}
%>
    </div>
    <!--  ���� �ۼ� �� -->
    
    <BR>
    
    <!--  ���� �ۼ� ���� -->
    <div class="thumbnail" style = "background-color:white;width:100%;height:100%;"><BR>
        <div class = "title" style = "margin-left:22px;"><font size = "4"><B>����</B></font></div><BR>
<%
    	for(int i = 0 ; i < 5 ; i++) {
 %>		
 		<div class = "review" style = "width:100%;">
			<div class = "name" style = "width:400px;height:30px;float:left;margin-left:20px;">���� : �� ��ǰ �ʹ� ���ƿ�
			(<b>dofwk2@***** / 2015-05-29</b>)</div>
			<br>
			<BR>
			<div class = "name" style = "width:650px;height:60px;float:left;margin-left:20px;">���� : </div>
		</div>
		<hr style = "width:100%;">
<%
    	}
%>
    </div>
</div>
    </body>
