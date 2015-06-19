<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="com.hanger.manager.managerPage.vo.ManagerPeriodSalesVo" %>

<%
	ArrayList<ManagerPeriodSalesVo> monthSalesListTemp = (ArrayList<ManagerPeriodSalesVo>)request.getAttribute("monthSalesList");
	ManagerPeriodSalesVo initSales = new ManagerPeriodSalesVo();
	initSales.setPeriod("0");
	initSales.setTotalSellPrice("0");
	initSales.setTotalPurchasePrice("0");
	initSales.setTotalUsedMileage("0");
	ArrayList<ManagerPeriodSalesVo> monthSalesList = new ArrayList<ManagerPeriodSalesVo>();
	int j = 0;
	for(int i = 0; i < 12; i ++){
		String month = "";
		if(i < 10){
			month = "0" + (i + 1);
		} else {
			month = "" + (i + 1);
		}
		
		String listMonth = ((String)(monthSalesListTemp.get(j).getPeriod())).substring(5);
		if(listMonth.equals(month)){
			//해당 월에 대한 데이터가 있으면
			monthSalesList.add((ManagerPeriodSalesVo)monthSalesListTemp.get(j));
			j++;
			if(j == monthSalesListTemp.size()){
				break;
			}
		} else {
			monthSalesList.add(initSales);
		}
	}
	
	for(int i = j; i < 12; i ++){
		monthSalesList.add(initSales);
	}
%>

<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>

<!-- 날짜 입력 관련 START -->
<script>
	$(function() {
		$("#datepicker1, #datepicker2").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년'
				});
	});
	
	
	//그래프
	$(function () {
	    var charts = [];
	    // color from d3.scale.category10() - https://github.com/mbostock/d3/wiki/Ordinal-Scales
	    var colors = ["#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "#8c564b", "#e377c2", "#7f7f7f", "#bcbd22", "#17becf"];
	    Highcharts.setOptions({
	        colors: colors,
	        global : {
	          useUTC : false
	        }
	    });

	    function makeChart(divId, titleName, subTitle, data) {
	      var chart = new Highcharts.Chart({
	          chart: {
	              renderTo: divId,
	              type: 'line'
//	              defaultSeriesType: 'datetime',
//	              zoomType: 'x'
	          },
	          title: {
	              text: titleName
	          },
	          subtitle: {
	              text: subTitle
	          },
	          xAxis: {
	              categories: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
	          },
	          yAxis: {
	              title: {
	                  text: titleName
	              }
	          },
	          plotOptions: {
	              series: {
	                  marker: {
	                      enabled: false
	                  },
	                  states: {
	                    hover: {
	                        //enabled: true,
	                        lineWidth: 5
	                    }
	                  },
	                  shadow: false,
	                  events: {
	                      mouseOver: function(event) {
	                          this.chart.series[this.index].graph.attr({ 
	                              style: 'opacity:1;z-index:99;'
	                          });
	                      },
	                      mouseOut: function(event) {
	                          this.chart.series[this.index].graph.attr({ 
	                              style: ''
	                          });
	                      },
	                      legendItemClick: function(event) {
	                          var seriesIndex = this.index;
	                          var series = this.chart.series;

	                          if (series.length <= 1) {
	                              return true;
	                          }

	                          var showAll = false;
	                          var checkIndex = 0;
	                          if (checkIndex == seriesIndex) {
	                                checkIndex = 1;
	                          }
	                          
	                          if (this.visible) {
	                             if (!series[checkIndex].visible) {
	                                 showAll = true;
	                             }
	                          }

	                          for (var i = 0; i < series.length; i++)
	                          {
	                              if (!showAll && series[i].index != seriesIndex)
	                              {
	                                  series[i].hide();
	                              } 
	                              else
	                              {
	                                  series[i].show();
	                              }
	                          }
	                          series = null;
	                          return false;
	                      }
	                  }
	              }
	          },
	          legend: {
	          },
	          tooltip: {
	              formatter: function() {
	                      return this.x +'월<br/>' +'<span style="color:'+ this.series.color + ';font-weight:bold;">' + this.series.name +'</span>' + '[<b>'+ Highcharts.numberFormat(this.y, 0) + '</b>]';
	              },
	              crosshairs: true
	          },
	          
	          series: data
	      }, function(chartObj) {
	        $.each(chartObj.legend.allItems, function(i, item) {
	          $.each(item.legendItem, function(j, element) {
	            if (!element) return;
	            $(element.element).hover(function(){
	              item.graph.attr({ 
	                style: 'opacity:1;z-index:99;'
	              });
	            }, function() {
	              item.graph.attr({ 
	                style: ''
	              });

	            });
	          });

	        });
	      });
	      return chart;
	    }
	    
	    var data=[{name:"판매가", data:[<%=Integer.parseInt(monthSalesList.get(0).getTotalSellPrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(1).getTotalSellPrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(2).getTotalSellPrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(3).getTotalSellPrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(4).getTotalSellPrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(5).getTotalSellPrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(6).getTotalSellPrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(7).getTotalSellPrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(8).getTotalSellPrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(9).getTotalSellPrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(10).getTotalSellPrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(11).getTotalSellPrice())%>]},
                  {name:"판매가-매입가", data:[<%=Integer.parseInt(monthSalesList.get(0).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(0).getTotalPurchasePrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(1).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(1).getTotalPurchasePrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(2).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(2).getTotalPurchasePrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(3).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(3).getTotalPurchasePrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(4).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(4).getTotalPurchasePrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(5).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(5).getTotalPurchasePrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(6).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(6).getTotalPurchasePrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(7).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(7).getTotalPurchasePrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(8).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(8).getTotalPurchasePrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(9).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(9).getTotalPurchasePrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(10).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(10).getTotalPurchasePrice())%>,
	                                 <%=Integer.parseInt(monthSalesList.get(11).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(11).getTotalPurchasePrice())%>]},
               	  {name:"판매가-매입가-사용마일리지", data:[<%=Integer.parseInt(monthSalesList.get(0).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(0).getTotalPurchasePrice())-Integer.parseInt(monthSalesList.get(0).getTotalUsedMileage())%>,
 	                                 <%=Integer.parseInt(monthSalesList.get(1).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(1).getTotalPurchasePrice())-Integer.parseInt(monthSalesList.get(1).getTotalUsedMileage())%>,
 	                                 <%=Integer.parseInt(monthSalesList.get(2).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(2).getTotalPurchasePrice())-Integer.parseInt(monthSalesList.get(2).getTotalUsedMileage())%>,
 	                                 <%=Integer.parseInt(monthSalesList.get(3).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(3).getTotalPurchasePrice())-Integer.parseInt(monthSalesList.get(3).getTotalUsedMileage())%>,
 	                                 <%=Integer.parseInt(monthSalesList.get(4).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(4).getTotalPurchasePrice())-Integer.parseInt(monthSalesList.get(4).getTotalUsedMileage())%>,
 	                                 <%=Integer.parseInt(monthSalesList.get(5).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(5).getTotalPurchasePrice())-Integer.parseInt(monthSalesList.get(5).getTotalUsedMileage())%>,
 	                                 <%=Integer.parseInt(monthSalesList.get(6).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(6).getTotalPurchasePrice())-Integer.parseInt(monthSalesList.get(6).getTotalUsedMileage())%>,
 	                                 <%=Integer.parseInt(monthSalesList.get(7).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(7).getTotalPurchasePrice())-Integer.parseInt(monthSalesList.get(7).getTotalUsedMileage())%>,
 	                                 <%=Integer.parseInt(monthSalesList.get(8).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(8).getTotalPurchasePrice())-Integer.parseInt(monthSalesList.get(8).getTotalUsedMileage())%>,
 	                                 <%=Integer.parseInt(monthSalesList.get(9).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(9).getTotalPurchasePrice())-Integer.parseInt(monthSalesList.get(9).getTotalUsedMileage())%>,
 	                                 <%=Integer.parseInt(monthSalesList.get(10).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(10).getTotalPurchasePrice())-Integer.parseInt(monthSalesList.get(10).getTotalUsedMileage())%>,
 	                                 <%=Integer.parseInt(monthSalesList.get(11).getTotalSellPrice())-Integer.parseInt(monthSalesList.get(11).getTotalPurchasePrice())-Integer.parseInt(monthSalesList.get(11).getTotalUsedMileage())%>]}];
	    makeChart("graphContainer", "매출그래프","2015년 월별 매출", data);

	});
</script>

<style>
	g.highcharts-series path {
	  opacity: 0.3;
	}
	
	.lineBig {
	  opacity:1;
	}
</style>

<body>
	<div id="graphContainer" style="min-width: 350px; height: 400px; margin: 0 auto"></div>
	<div class="container">
		이부분은 표를 남길지 말지 생각좀 해봐야겠음.
		<BR>
		<div class="thumbnail" style="width: 1090px;margin-left:1%">
			<div class="panel panel-default"
				 style="width: 900px; height: auto;border:0;display:table;margin-left:auto;margin-right:auto" align = "center" >
				<BR> <BR>
				<p>
					조회기간: <input type="text" id="datepicker1"> ~ <input type="text" id="datepicker2">
					<input type="button" value="확인" />
				<P>
				<P>
					<BR>
				<table style="width: 900px; table-layout: fixed">
				<tr>
						<td style="background-color: #747474"></td>
						<td colspan="8" style="background-color: #747474"><font
							color="white"> <b>일계:2015-05-05 총 판매금액 : 201,504,402원</b>
						</font></td>
					</tr>

					<tr align="center"
						style="background-color: #EAEAEA; border-top: 2px solid gray;">
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray; width: 100px"><B>날짜</B></td>
						<td colspan="4" align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>상품명</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>입고금액</B></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><b>상품금액</b></td>
						<td align="center"
							style="border-right: 1px solid gray; border-bottom: 2px solid gray"><B>수량</B></td>
						<td align="center" style="border-bottom: 2px solid gray"><B>합계</B></td>
					</tr>
					<%
						for (int i = 1; i < 20; i++) {
					%>
					<tr align="center" style = "height:30px">
						<td style="border-bottom: 1px solid gray; border-right: 1px solid gray; width: 10px" rowspan="2">
							<font size = "2">2015-05-05</font>
						</td>
						<td rowspan = "2" colspan = "4" style="border-right: 1px solid gray;border-bottom: 1px solid gray;">
							<font size="2"><b>올리브</b></font>
						</td>
						<td style="border-bottom: 1px solid gray; border-right: 1px solid gray;" rowspan="2"><font size="2">10,000원</font></td>
						<td style="border-bottom: 1px solid gray; border-right: 1px solid gray;" rowspan="2"><font size="2">22,000원</font></td>
						<td style="border-bottom: 1px solid gray; border-right: 1px solid gray;" rowspan="2"><font size="2">20</font></td>
						<td style="border-bottom: 1px solid gray;" rowspan="2"><font size="2">380,000 원</font></td>
					</tr>
					<tr>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
	</div>
</body>
