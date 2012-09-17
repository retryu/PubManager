	var chart1;
	var  chart2;
$(function() {
		var dates = $("#from")
				.datepicker(
						{
							onSelect : function(selectedDate) {
								var option = this.id == "from" ? "minDate"
										: "maxDate", instance = $(this).data(
										"datepicker"), date = $.datepicker
										.parseDate(
												instance.settings.dateFormat
														|| $.datepicker._defaults.dateFormat,
												selectedDate, instance.settings);
								dates.not(this).datepicker("option", option,
										date);
							}

						});
		$("#from").datepicker($.datepicker.regional['ch']);
		$("#from").datepicker({
			showOtherMonths : true
		});
		$("#from").datepicker("option", "dateFormat", "yy-mm-dd");
	});

	$(function() {
		var dtes = $("#endto")
				.datepicker(
						{
							onSelect : function(selectedDate) {
								var option = this.id == "endto" ? "minDate"
										: "maxDate", instance = $(this).data(
										"datepicker"), date = $.datepicker
										.parseDate(
												instance.settings.dateFormat
														|| $.datepicker._defaults.dateFormat,
												selectedDate, instance.settings);
								dates.not(this).datepicker("option", option,
										date);
							}

						});
		$("#endto").datepicker($.datepicker.regional['ch']);
		$("#endto").datepicker({
			showOtherMonths : true
		});
		$("#endto").datepicker("option", "dateFormat", "yy-mm-dd");
	});


	$(function() {
	 
		$(document).ready(
				function() {
					chart1 = new Highcharts.Chart({
						chart : {
							renderTo : 'container',
							type : 'spline'
						},
						 
						xAxis : {
							categories : [ '一月', '二月', '三月', '四月', '五月', '六月',
									'七月', '八月', '九月', '十月', '十一月', '十二月' ]
						},
						yAxis : {
							title : {
								text : '数值'
							},
							labels : {
								formatter : function() {
									return this.value
								}
							}
						},
						 title: {
           					 text: ''  
        					},
					  legend: {
				            layout: 'vertical',
				            backgroundColor: '#FFFFFF',
				            floating: true,
				            align: 'left',
				            verticalAlign: 'top',
				            x: 50,
				            y: -10,
				            labelFormatter: function() {
				                return this.name;
				            }
				        },
						tooltip : {
							crosshairs : false,
							shared : true

						},
						plotOptions : {
							spline : {
								marker : {
									radius : 4,
									lineColor : '#666666',
									lineWidth : 1
								}
							}
						},
						series : [
								{
									name : '用户',
									marker : {
										symbol : 'circle'
									},
									data : [ 7.0, 6.9, 9.5, 14.5, 18.2, 21.5,
											25.2, 
										 26.5,
											 23.3, 18.3, 13.9, 9.6 ]

								},
								{
									name : '流量',
									marker : {
										symbol : 'circle'
									},
									data : [ 
										3.9,
									4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6,
											14.2, 10.3, 6.6, 4.8 ]
								} ]
					});
				});

	});

	$(function() {
		$(document).ready(
				function() {
					chart2 = new Highcharts.Chart({
						chart : {
							renderTo : 'container2',
							plotBackgroundColor : null,
							plotBorderWidth : null,
							plotShadow : false
						},
						title : {
							text : '渠道分析图, 2012/3月'
						},
						tooltip : {
							formatter : function() {
								return '<b>' + this.point.name + '</b>: '
										+ this.percentage + ' %';
							}
						},
						plotOptions : {
							pie : {
								allowPointSelect : true,
								cursor : 'pointer',
								dataLabels : {
									enabled : true,
									color : '#000000',
									connectorColor : '#000000',
									formatter : function() {
										return '<b>' + this.point.name
												+ '</b>: ' + this.percentage
												+ ' %';
									}
								}
							}
						},
						series : [ {
							type : 'pie',
							name : 'Browser share',
							data : [ [ 'android market', 8.0 ],
							[ '同步推', 8.0 ],
							[ '应用汇', 8.0 ],
							[ '安桌星空',8.0 ],
							[ '爱APPS', 8.0 ],
								[ '爱APPS', 6.0 ],
									[ '91市场', 6.0 ],
							[ 'N多', 8.0 ],
									[ '机锋', 8 ], {
										name : 'appstore',
										y : 12.8,
										sliced : true,
										selected : true
									}, [ '安桌市场', 8 ], [ '91市场', 8 ],
									[ '应用汇', 8 ] ],
						} ]
					});
				});
	});
	
	
	function  refreshcompare(action,s1,s2){
	chart1.series[1].remove();
 	chart1.series[0].remove();
		var  url='http://retryu.oicp.net:8080/PubManager/refershServlet?action='+action+"&s1="+s1+"&s2="+s2;
		if(s1=="visitor")s1="访客";
		if(s1=="newvisitor")s1="新访客";
		if(s2=="income")s2="收入";
		if(s2=="order")s2="订单数";
		$.ajax({
			url:url,
			success:function(data,textStatus){
				var  obj=jQuery.parseJSON(data);
//			alert("sucee  ajax"+data+"."+chart1);
//			chart1.series[1].setData(obj[1],true);
			  chart1.addSeries({
                data: obj[0],
				name:s1,    
				marker : {	symbol : 'circle'},
            },true);
			  chart1.addSeries({
                data: obj[1],
				name:s2,    
				marker : {	symbol : 'circle'},
            },true); 
		//	 chart1.setTitle({text:s1});
			// alert(chart1.xAxis.categories);
		//	chart1.series[0].remove();
//				for(var  i=0;i<obj[0].length;i++)
//				alert("data"+obj[0][i]);
			
			}
		});
	}
	
	function  referPeriod(period){
			chart1.series[1].remove();
 		chart1.series[0].remove();
		var   selectRefFrom=document.getElementById("refrom");
		var  selectRefTo=document.getElementById("refto");
		var   s1=selectRefFrom.options[selectRefFrom.selectedIndex].id;
		var  s2=selectRefTo.options[selectRefTo.selectedIndex].id;
		var  url='http://retryu.oicp.net:8080/PubManager/refershServlet?action='+"refershPeriod"+"&period="+period+"&s1="+s1+"&s2="+s2;
		if(s1=="visitor")s1="访客";
		if(s1=="newvisitor")s1="新访客";
		if(s2=="income")s2="收入";
		if(s2=="order")s2="订单数";
		$.ajax({
			url:url,
			success:function(data,textStatus){
			var  obj=jQuery.parseJSON(data);
			  chart1.addSeries({
                data: obj[0],
				name:s1, 
				marker : {	symbol : 'circle'},
            },true);
			  chart1.addSeries({
                data:obj[1],
				marker : {	symbol : 'circle'},
				name:s2, 
            },true); 
			 
			if (period == "week") {
				chart1.xAxis[0].setCategories(["周一", "周二", "周三", "周四", "周五", "周六", "周日"]);
			}
			if(period=="month"){
						chart1.xAxis[0].setCategories([ '一月', '二月', '三月', '四月', '五月', '六月','七月', '八月', '九月', '十月', '十一月', '十二月' ]);

			}
			if(period=="day"){
				chart1.xAxis[0].setCategories(["0:00", "4:00", "8:00", "12:00", "16:00", "20:00", "24:00"]);
			}
 
			
			}
		});
	}
	
	
	
	function selectRef(){
		var   selectRefFrom=document.getElementById("refrom");
		var  selectRefTo=document.getElementById("refto");
		selectRefFrom.onchange=function(){
		var   s1=selectRefFrom.options[selectRefFrom.selectedIndex].id;
		var  s2=selectRefTo.options[selectRefTo.selectedIndex].id;
			refreshcompare("refershcompare",s1,s2);
		}
		selectRefTo.onchange=function(){
		var   s1=selectRefFrom.options[selectRefFrom.selectedIndex].id;
		var  s2=selectRefTo.options[selectRefTo.selectedIndex].id;
			refreshcompare("refershcompare",s1,s2);
		}
		var  dateli=document.getElementById("dateul").getElementsByTagName("div");
		for(var  i=0;i<dateli.length;i++){
			var  id=dateli[i].id;
			dateli[i].onclick=function(){
				referPeriod(this.id);
			}
		}
		
		
		
	}
	addLoadEvent(selectRef);
	//addLoadEvent(refresh);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	