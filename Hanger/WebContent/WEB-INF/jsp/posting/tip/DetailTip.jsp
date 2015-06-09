<%@ page contentType="text/html; charset=EUC-KR"%>

<STYLE>
.container {
	width: 100%;
}

.row {
	margin-top: 5px;
	margin-bottom: 5px;
}

.reviewhead2 {
	margin-top: 3px;
}

.reviewmain {
	margin-top: 5px;
}

.userimg {
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: -10px;
	margin-right: 10px;
	width: 80px;
	height: 80px;
}

.infos {
	margin: 3px 5px 3px;
}

.menus {
	width: 100px;
}

.main {
	margin-left: 5px;
	margin-right: 5px;
}

.mainimg {
	width: 70%;
	height: 250px;
}

.reimgs {
	margin-right: 10px;
	width: 70px;
	height: 70px;
}

.replymain {
	height: 80px;
	padding: 3px;
}

.replylist {
	width: 100%;
	height: 90px;
}

.replywrite {
	margin-top: 3px;
	width: 100%;
	height: 90px;
}

.replybutton {
	width: 100%;
	height: 70px;
}

.rewriteimg {
	width: 70px;
	height: 70px;
	margin-top: 10px;
}

.replybutton {
	margin-top: 10px;
}

.recomment {
	margin-left: 20px;
	margin-right: 10px;
}

.reheadname {
	margin-left: 20px;
	margin-right: 10px;
}
</STYLE>

<body>
	<div class="container">

		<div class="row">
			<div class="reviewhead1 col-sm-6">
				<div class="col-sm-4 infos" style="width: 20%;">
					<img src="images/yebin.jpg" alt="����¥��" class="img-circle userimg">

				</div>
				<div class="col-sm-4 infos" style="width: 30%;">
					<BR> ������<BR> 2015.6.3<BR> �Ǽ��Ǻ�
				</div>
				<div class="col-sm-4 infos" style="width: 40%;">
					<div style="width: 100%;">
						<BR> ����ó ���ۺ�<BR> <B>��¼�� ��� ���� ���� ��� Tip!</B><BR>
					</div>
				</div>
			</div>
			<div class="reviewhead2 col-sm-6" role="group"">
				<CENTER>
					<button type="button" class="btn btn-info menus">
						<span class="glyphicon glyphicon-star" aria-hidden="true">�ȷο��ϱ�</span>
					</button>
					<button type="button" class="btn btn-info menus">
						<span class="glyphicon glyphicon-star" aria-hidden="true">�����ϱ�</span>
					</button>
					<button type="button" class="btn btn-info menus">
						<span class="glyphicon glyphicon-star" aria-hidden="true">���ƿ�(10)</span>
					</button>
					<button type="button" class="btn btn-info menus">
						<span class="glyphicon glyphicon-star" aria-hidden="true">��ũ��</span>
					</button>
				</CENTER>
			</div>
		</div>

		<div class="row">
			<div class="main">
				<h2>����ó ���ۺ� ���� Tip~</h2>
				<h5>���� ��������</h5>
				<HR>
				<CENTER>
					<img src="images/yebin.jpg" alt="����¥��" class="img-rounded mainimg">
				</CENTER>
				<HR>
				<h5>
					�ȳ��ϼ���^^ ó�� �Ŀ����並 ����...! �쿬�� ����ó���ۺ��� ��ȴٰ� 3-step ������ �ֱ淡 ���� �غþ��~ <BR>
					�����丮 ���ѵ� �ִµ� �װ� �ıⰡ ���� �ö���ֱ淡 �� ��ǰ ���� ����� ���Ҵ�ϴ� ���� ����Ŀ��� �ڰ� ��������
					������ �� ������ ����尡 ���� �Ű� �����µ�<BR> �� �������󱸿� XDXD ����尡 �� �� ������
					¡�׷����� �о�...�� �׸��� ����ϰ� ���� ȭ�嵵 �� �Ծ �ʹ� ���Ҵ� :
				</h5>
			</div>
		</div>
		<div class="row">
			<div class="replyhead">
				<div class="reheadcon" style="margin: auto; padding: 1px;">
					<BR> <span class="glyphicon glyphicon-comment"
						aria-hidden="true" style="font-size: 20px;"><B><font
							size="5">���(4)</font></B></span>
					<HR>
				</div>
			</div>
			<%
				for (int i = 0; i < 4; i++) {
			%>
			<div class="replylist">
				<div class="replyimg col-sm-1">

					<img src="images/yebin.jpg" alt="����¥��" class="img-circle reimgs">

				</div>
				<div class="replymain col-sm-10">
					<div class="reheadname">
						<B>�ڻ��</B> <font size="1">2015�� 6�� 3��</font>
					</div>
					<div class="recomment">���� �� ��ǰ ���� ���Ƽ� ��ôµ� �� �� ���� �� �� �������� �״�
						ū ȿ���� ���� ���߾��.. �籸���� �� �� �����̿���! �������븶�÷����� �� ��ǰ ���� ���Ƽ� ��ôµ� �� �� ����
						�� �� �������� �״� ū ȿ���� ���� ���߾��.. �籸���� �� �� �����̿���!
						������ä�������dsfdsfdsafdsfadsdfsakkkkkkkkkkkkkkkkkkasddddddddddddddd</div>
				</div>
				<div class="col-sm-1"></div>
			</div>

			<%
				}
			%>
		</div>

		<div class="row">
			<div class="replywrite">
				<div class="replyimg col-sm-1">
					<CENTER>
						<img src="images/wonbin.PNG" alt="����¥��"
							class="img-circle rewriteimg">
					</CENTER>
				</div>
				<div class="replyinsert col-sm-10">
					<textarea class="insert" rows="2"
						style="resize: none;"></textarea>
				</div>
				<div class="replybtn col-sm-1">
					<button type="button" class="btn btn-default replybutton">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
					</button>
				</div>
			</div>
		</div>
		<!-- container ���� ����-->
	</div>
</body>
