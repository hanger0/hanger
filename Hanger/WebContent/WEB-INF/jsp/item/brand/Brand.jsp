<%@ page contentType="text/html; charset=EUC-KR"%>

<body style="background-color: #EBEBEB">

	<!-- ������ ���� -->
	<div class="container" style="width: 100%; height: 100%">
		<!-- left menu -->
		<div class="thumbnail"
			style="width: 16%; height: 100%; float: left; margin-left: 3%;">
			<div class="leftmenu" style="width: 100%; height: 100%;">
				<div class="productname">
					<span style="margin-bottom: 5px;"><font size="1"><b>A
								~ Z > Olive Young</b></font></span>
					<hr style="border: solid 1px; margin-bottom: 5px;">
					<font size="3">��� �����ֱ�</font>
					<hr style="border: solid 1px; margin-top: 5px;">
				</div>

				<hr>

				<%
					for (int i = 0; i < 5; i++) {
				%>
				<div class="dc1" style="margin-top: -7%;">
					<font size="3" style="margin-left: 3%"><b>1�� </b></font>
					<p>
						<%
							for (int j = 0; j < 5; j++) {
						%>
						<!-- ���� �������� üũ�Ϸ��� ������ for �̸��� üũ�ڽ� id,name�� ���ƾ� ����� 
				<label for = "face<%=j%>" style = "width:100%">
		        </label>
		       	-->
						<label style="width: 100%;"> <input type="checkbox"
							id="face" name="face" value="���̽� ����ũ��" style="margin-left: 3%">
							&nbsp;<font size="2">2��</font><br>
						</label>
						<%
				}
%>
					
					<hr style="margin-top: -1%">
				</div>
				<%
					}
				%>
			</div>
		</div>
		<!-- left menu ��-->

		<!-- ���� �ۼ� ���� -->
		<div class="thumbnail"
			style="width: 75%; height: 100%; float: right; margin-right: 4%;">
			<br>
			<div class="select" style="margin-left: 3%; margin-top: 10px">
				<p>
					<span class="glyphicon glyphicon-home">&nbsp;HOME&nbsp;</span>>&nbsp;
					<select>
						<option value="�ֽż�">�ֽż�</option>
						<option value="�α��">�α��</option>
						<option value="�������ݼ�">�������ݼ�</option>
						<option value="�������ݼ�">�������ݼ�</option>
						<option value="�ȷ������̽�">�ȷ������̽�</option>
						<option value="������">������</option>
						<option value="���䰳��">���䰳��</option>
						<option value="������">������</option>
					</select>
			</div>
			<!-- ���� ��� ���̺� -->
			<div class="dc3"
				style="background-color: #EBEBEB; width: 93%; margin-left: 3%">
				<table
					style="width: 100%; height: 100px; display: table; margin-left: auto; margin-right: auto;">
					<tr>
						<td><a href="#">- ��ü����</a></td>
						<%
							for (int i = 0; i < 20; i++) {
						%>
						<td><a href="#">- Ŭ��¡ ��</a></td>
						<%
							if (i == 5) {
						%>
					</tr>
					<tr>
						<%
							} else if (i > 6 && i == 12) {
						%>
					</tr>
					<tr>
						<%
							}
							}
						%>
					</tr>
				</table>
			</div>
			<!-- ���� -->
			<hr>
			<!-- �α��ǰ -->
			<div class="row hotitem" style="margin-left: 1%">
				<%
					for (int i = 0; i < 8; i++) {
				%>
				<div class="col-sm-6 col-md-2"
					style="display: table; margin-left: 3px;">
					<div class="thumbnail" style="width: 205px">
						<img src="images/wonbin.PNG">
						<div class="caption">
							<font size="2"><b>�̴Ͻ�����</b></font>
							<p>
							<p>
								<font size="3"><font color="orange"><b>�̳׶�
											���̽�ó �Ŀ�̼� C2ȣ ��ũ ���߷� ������</b></font></font>
							</p>
							<p>�ڡڡڡڡ�
							<p>���� &nbsp;&nbsp;27,7000
							<hr style="margin-bottom: 3px">
							<div
								style="display: table; margin-left: auto; margin-right: auto;">
								<span class="glyphicon glyphicon-heart" aria-hidden="true"></span><span
									class="badge">87</span>&nbsp;&nbsp;&nbsp;&nbsp; <span
									class="glyphicon glyphicon-pencil" aria-hidden="true"></span><span
									class="badge">20</span>&nbsp;&nbsp;&nbsp;&nbsp; <span
									class="glyphicon glyphicon-bookmark" aria-hidden="true"></span><span
									class="badge">30</span>
							</div>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
			<!--  ���� �ۼ� �� -->
		</div>
	</div>
</body>
