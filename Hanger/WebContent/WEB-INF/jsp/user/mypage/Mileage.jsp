<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="com.hanger.mileage.vo.MileageVo" %>
<%
	ArrayList<MileageVo> mileageList = (ArrayList<MileageVo>)request.getAttribute("mileageList");
	int maxMileage = 0;
	int useMileage = 0;
	int mileage = 0;
	if(mileageList != null && mileageList.size() > 0){
		for(int i = 0; i < mileageList.size(); i++){
			MileageVo mileagevo = mileageList.get(i);
			int mileageAmount = Integer.parseInt(mileagevo.getMileageAmount());
			String reasonCode = mileagevo.getMileageReasonCode();
			if(reasonCode.equals("MR004")){
				mileage -= mileageAmount;
				useMileage += mileageAmount;
			} else if(reasonCode.equals("MR002")){
				mileage += mileageAmount;
				maxMileage += mileageAmount;
			}
		}
	}
%>

<style>
.row {
	width: 100%;
	background-color: white;
	display: table;
	margin-left: auto;
	margin-right: auto;
	margin-top: 3px;
}

.thumbnail {
	width: 100%;
}

.millige {
	width: 80%;
	height: 50px;
	display: table;
	margin-left: auto;
	margin-right: auto;
}
</style>

<body style="background-color: #EBEBEB">
	<div class="container" style="width: 97%">
		<font size="3"><b><p style="display: table;">���ϸ���</p></b></font>
		<!-- �� �ۼ� ���� -->
		<div class="thumbnail">
			<br>
			<div class="millige">
				<div class="thumbnail" align="center"
					style="background-color: #EBEBEB">
					<font size="4"><font color="red"><b>�� ���ϸ��� : </b></font></font><%= maxMileage %>&nbsp;&nbsp;
					<font size="4"><font color="red"><b>��� ���ϸ��� : </b></font></font><%= useMileage %>&nbsp;&nbsp;
					<font size="4"><font color="red"><b>���� ���ϸ��� : </b></font></font><%= mileage %>&nbsp;&nbsp;
				</div>
				<%
				if(mileageList != null && mileageList.size() > 0) {
					for (int i = 0; i < mileageList.size(); i++) {
						MileageVo mileageVo = mileageList.get(i);
						String regDate = mileageVo.getRegDate();
						int mileageAmount = Integer.parseInt(mileageVo.getMileageAmount());
						String reasonCode = mileageVo.getMileageReasonCode();
						String title = "";
						String color = "";
						int amount = 0;
						if(reasonCode.equals("MR004")){
							color = "red";
							title = mileageVo.getItemName() + "���� ���� �߽��ϴ�.";
							amount -= mileageAmount;
						} else if(reasonCode.equals("MR002")){
							color = "blue";
							title = mileageVo.getUserName() + "���� �� �ı⸦ ���� �����߽��ϴ�.";
							amount += mileageAmount;
						}
				%>
				<div class="thumbnail" style="width: 60%; display: table; margin-left: auto; margin-right: auto;">
					&nbsp;&nbsp;<%= regDate %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= title %><br>
					&nbsp;&nbsp;<font size="4" color="<%= color %>"><b><%= amount %>��</b></font>
				</div>
				<hr>
				<%
					}
				}
				%>
			</div>
			<!--  �� �ۼ� �� -->
		</div>
	</div>
</body>
