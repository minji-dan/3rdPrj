<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<title>음식점목록조회</title>


<!-- Feat: 음식점목록조회 layout, 김민지 20220804 -->

<style>
	.form-control {
		width: 140px;
		height: calc(1.5em + 0.75rem + 1px);
		padding: 0.375rem 0.75rem;
		font-size: 14px;
		font-weight: 400;
		line-height: 1.5;
		color: #495057;
		background-color: #fff;
		background-clip: padding-box;
		border: 1px solid #cccccc;
		-webkit-box-shadow: inset 0 2px 1px rgba(0, 0, 0, .045);
		box-shadow: inset 0 2px 1px rgba(0, 0, 0, .045);
		border-radius: 0;
		transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
	
	.detail-form label {
		min-width: 100px;
	}
	
	.row {
		display: -ms-flexbox;
		display: flex;
		flex-wrap: nowrap;
		/*     margin-right: -15px; */
		/*     margin-left: -15px; */
	}
	
	.col-lg-3 {
		-ms-flex: 0 0 25%;
		flex: 0 0 20%;
		max-width: 15%;
		display: inline-block;
		min-width
	}
	
	#blank {
		visibility: hidden;
	}
	
	
	/* 공통항목 이외*/
	
	.restSearchBtnDiv {
		width: 300px;
	}
	
	#restSearchBtn {
		float: right;
		margin-right: 10px;
	}
	
	.detail-form input.form-control ~ .icon-btn, .detail-form input.form-control
		~ .tip {
		position: absolute;
		top: 9px;
		right: 50px;
		padding: 0 6px;
	}
	
	.RsvDay {
		min-width: 525px;
	}
	
	#restSearchRsvStrtDay {
		float: left;
	}
	
	#restSearchRsvEndDay {
		float: right;
		margin-right: 110px;
	}
	
	.Tilde {
		font-size: 20px;
		font-weight: 500;
		vertical-align: -35%;
	}
	
	.gridBtn {
		text-align: right;
      	display:block; 
      	margin-bottom: 10px;
	}
</style>


<!-- excel down script -->
<script type="text/javascript">

$(function(){
//엑셀다운로드 버튼 클릭시 
$("#excelDown").click(function(){
		exportExcel($("#gridlist"), "음식점목록");   // exportExcel('jqgird이름','파일명') 
	});
});

//jqGrid의 List에 보여지는 부분을 table로 만들어 줌
function exportExcel(pGridObj, pFileName) {
	var mya = pGridObj.getDataIDs();
	var data = pGridObj.getRowData(mya[0]);
	var colNames = new Array();
	var ii = 0;
	for ( var d in data) {
		colNames[ii++] = d;
	}

	//컬럼 헤더 가져오기 
	var columnHeader = pGridObj.jqGrid('getGridParam', 'colNames') + '';
	var arrHeader = columnHeader.split(',');
	var html = "<table border=1><tr>";
	for (var y = 0; y < arrHeader.length; y++) {
		html = html + "<td><b>" + encodeURIComponent(arrHeader[y])
				+ "</b></td>";
	}

	html = html + "</tr>";

	//값 불러오기
	for (var i = 0; i < mya.length; i++) {

		/**
		 *      
		 *  이부분에서 데이터 수정처리 가능
		 * 
		 */

		var datac = pGridObj.getRowData(mya[i]);
		html = html + "<tr>";
		for (var j = 0; j < colNames.length; j++)
			html = html + '<td>' + encodeURIComponent(datac[colNames[j]])
					+ "</td>";
		html = html + "</tr>";
	}

	html = html + "</table>"; // end of line at the end
	document.EXCEL_.csvBuffer.value = html;
	document.EXCEL_.fileName.value = encodeURIComponent(pFileName);
	document.EXCEL_.target = '_new';
	document.EXCEL_.submit();
}
</script>

<script type="text/javascript" class="init">
  
  $(document).ready(function() {
	  
      jQuery("#gridlist").jqGrid({
          url : '/ed/restlist',
          datatype : 'json',
          mtype : 'POST',
          colNames : ["No.", '사업자등록번호', '지역', '업종', '음식점명', '업주', '예약가능기간', '결재상태'],
          colModel : [
        	  		//No.
                      {name:'rnum', index:'rnum', width:50, editrules:{ edithidden:true },
                          editable : false,
                          search: false },
                    //사업자등록번호 
                      {name : 'bizrgNo', index : 'bizrgNo', width : 100, editrules : {required : true, edithidden : true},
                          editable : true,editoptions : {size : "150",maxlength : "50"}},
                       //지역
                        {name : 'loc',index : 'loc', width : 50,editrules : {required : true,edithidden : true},
                          	editable : true,editoptions : {size : "50",maxlength : "50"},
                          	search: false
                        },
                        //업종
                          {name : 'bizTypeCd',index : 'bizTypeCd', align:"center",width : 50,editrules : {required : true,edithidden : true},
                          editable : true,editoptions : {size : "50",maxlength : "50"},
                          search: false,
                          align: 'center'},
                      	//음식점명
                          {name : 'restNm',index : 'restNm', width : 120,editrules : {required : true,edithidden : true},
                          editable : true,editoptions : {size : "150",maxlength : "50"},
                          search: false},
                        //업주
                      	{name : 'attr1',index : 'attr1',width : 80, editrules : {required : true,edithidden : true},
                          editable : true,editoptions : {size : "150",maxlength : "50"},
                          search: false,
                          align: 'center'
                      },
                      	//예약가능기간
                      {name : 'rsvStrtDay',index : 'rsvStrtDay', align:"center",width : 120,editrules : {required : false,edithidden : true},
                          editable : false,editoptions : {size : "50",maxlength : "50"}, formatter : function (cellValue, options, rowdata, action) {
                			    var fixedValue = cellValue.substr(0, 4) + "-" +cellValue.substr(4,2) + "-" + cellValue.substr(6,9)+ "-" +cellValue.substr(15,2)+ "-"+cellValue.substr(17);
            			    	return fixedValue;}
                          },
                       //결재상태
                      {name : 'apprStatCd',index : 'apprStatCd', align:"center",width : 80,editrules : {required : false,edithidden : true},
                              editable : false,editoptions : {size : "50",maxlength : "50"}, 
						  search: false}
                      ],
          pager : '#gridpager',
          pagination : true,
	      rowNum : 10,
          rowList : [ 10, 20, 30 ], //페이지에서 보여줄 레코드 갯수
          //sortname : 'id',
          rownumber : true,
          viewrecords : true,
          sortorder : "desc",
          autowidth : true,
          height : '100%',
          pgbuttons: true,
          pginput: true,
          shrinkToFit: true,
          loadonce : false,
          emptyrecords : "데이터가 없습니다",
          showpage : true, //페이징 true
          jsonReader: {
              repeatitems: false,
              total: "total",
              records: "records",
              page: "page"
          },
          ondblClickRow : function(id) {
              alert("You double click row with id: "+ id);
          }
      	}
      );

     /*  jQuery("#gridlist").jqGrid({
          pager : '#gridpager',
          recordtext : "View {0} - {1} of {2}",
          emptyrecords : "No records to view",
          loadtext : "Loading...",
          pgtext : "Page {0} of {1}"
      });

      var $grid = $('#gridlist');

      // create the grid
      $grid.jqGrid({
          // jqGrid opetions
      });

      // set searching deafauls
      $.extend($.jgrid.search, {multipleSearch: true, multipleGroup: false, closeAfterSearch: true, overlay: 0});

      // during creating nevigator bar (optional) one don't need include searching button
      $grid.jqGrid('navGrid', '#gridpager', {add: false, edit: false, del: false, search: false});

      // create the searching dialog
      //$grid.jqGrid('searchGrid');

      var gridSelector = $.jgrid.jqID($grid[0].id), // 'list'
          $searchDialog = $("#searchmodfbox_" + gridSelector),
          $gbox = $("#gbox_" + gridSelector);

      // hide 'close' button of the searchring dialog
      $searchDialog.find("a.ui-jqdialog-titlebar-close").hide();

      // place the searching dialog above the grid
      $searchDialog.insertBefore($gbox);
      $searchDialog.css({position: "relative", zIndex: "auto", float: "left"})
      $gbox.css({clear:"left"}); */
      
      
  });
  
  // 예약가능시작일자 (초기값, 기한 설정)
  $( function() {
	    $("#restSearchRsvStrtDay").datepicker({dateFormat: 'yy-mm-dd'});
	    $("#restSearchRsvStrtDay").datepicker("setDate", "-6M");

	  } );
  
  $( function() {
	    $("#restSearchRsvEndDay").datepicker({dateFormat: 'yy-mm-dd'});
	    $("#restSearchRsvEndDay").datepicker("setDate", "+6M");
	  } );

//검색 0806 gw try
  function Search() {
            $("#gridlist").jqGrid("setGridParam", {
                datatype: "json",
                url: "/ed/restSearch",
                postData: {
                    "bizrgNo": $("#restSearchBizRegNo").val(),
                    "loc": $("#restSearchLoc").val(),
                    "bizTypeCd": $("#restSearchBizTypeCD").val(),
                    "restNm": $("#restSearchRestNM").val(),
                    "coName": $("#coName").val(),
                    "rsvStrtDay": $("#restSearchRsvStrtDay").val(),
                    "rsvEndDay": $("#restSearchRsvEndDay").val(),
                    "apprStatCd": $("#restSearchApprStat").val()
                },
                autoencode: true,
                page: 1
            }).trigger("reloadGrid");
        }
  </script>
</head>
<body>
	<!-- jqGrid Sample -->
	<section class="section">
		<div class="section-sub">
			<img src="../images/common/oval-1.svg" alt="" class="oval-one">
			<img src="../images/common/shape-1.svg" alt="" class="shape-three">
			<img src="../images/common/shape-55.svg" alt="" class="shape-four">
			<img src="../images/common/shape-56.svg" alt="" class="shape-five">
			<img src="../images/common/shape-57.svg" alt="" class="shape-six">
			<img src="../images/common/shape-58.svg" alt="" class="shape-seven">
			<img src="../images/common/shape-59.svg" alt="" class="shape-eight">
			<img src="../images/common/shape-60.svg" alt="" class="shape-nine">
			<img src="../images/common/shape-61.svg" alt="" class="shape-ten">
			<img src="../images/common/shape-62.svg" alt="" class="shape-eleven">

			<div class="sub-hero-wrap">
				<p class="sub-hero-text">
					<span class="core-color">음식점 목록</span>
				</p>
			</div>
		</div>
	</section>


	<section class="section sub-contents">
		<div class="container">
			<section class="detail-form">
				<form>
					<div class="detail-wrap">
					
					
						<!--  검색 부분  -->
						<div class="col-lg-12">
						
							<div class="row">

								<!-- 1-1. 사업자등록번호  -->
								<label class="col-md-2 col-lg-1" for="restSearchBizRegNo"><span>사업자등록번호</span></label>

								<div class="col-md-4 col-lg-3">
									<input type="text" class="form-control" id="restSearchBizRegNo" name="restSearchBizRegNo">
								</div>


								<!-- 1-2. 지역  -->
								<label class="col-md-2 col-lg-1" for="restSearchLoc"><span>지역</span></label>

								<div class="col-md-4 col-lg-3">
									<form>
										<select class="form-control" id="restSearchLoc" name="restSearchLoc">
											<option value="L0000"></option>
											<option value="L1000">상암</option>
											<option value="L1010">강남</option>
											<option value="L1020">여의도</option>
											<option value="L1030">마곡</option>
										</select>
									</form>
								</div>


								<!--  1-3. 업종  -->
								<label class="col-md-2 col-lg-1" for="restSearchBizTypeCD"><span>업종</span></label>

								<div class="col-md-4 col-lg-3">
									<select class="form-control" id="restSearchBizTypeCD" name="restSearchBizTypeCD">
										<option value="B0000"></option>
										<option value="B1000">한식</option>
										<option value="B1001">중식</option>
										<option value="B1002">일식</option>
										<option value="B1003">양식</option>
										<option value="B1004">분식</option>
									</select>
								</div>


								<!--  1-4. 음식점명  -->
								<label class="col-md-2 col-lg-1" for="restSearchRestNM"><span>음식점명</span></label>

								<div class="col-md-4 col-lg-3">
									<input type="text" class="form-control" id="restSearchRestNM" name="restSearchRestNM">
								</div>


								<!--  1-5. 균등 분할을 위한 여백 부분  -->
								<div class="restSearchBtnDiv">
									<button type="button" class="btn btn-search" id="blank"></button>
								</div>

							</div>


							<div class="row">

								<!--  2-1. 업주  -->
								<label class="col-md-2 col-lg-1" for="coName">업주</label>

								<div class="col-md-4 col-lg-3">
									<input type="text" class="form-control with-btn" id="coName" name="coName">
									<button type="button" class="icon-btn" data-toggle="modal" data-target="#companySearch">
										<i class="fas fa-search"></i>
									</button>
								</div>


								<!--  2-2. 예약가능기간  -->
								<label class="col-md-2 col-lg-1" for="restSearchRsvStrtDay"><span class="required">예약가능기간</span></label>

								<div class="col-md-4 col-lg-3 RsvDay">
									<input type="text" class="form-control" id="restSearchRsvStrtDay" name="restSearchRsvStrtDay">
									<span class="Tilde">&emsp;&emsp; ~ &emsp;&emsp; </span>
									<input type="text" class="form-control" id="restSearchRsvEndDay" name="restSearchRsvEndDay">
								</div>


								<!--  2-3. 결재상태  -->
								<label class="col-md-2 col-lg-1" for="restSearchApprStat"><span>결재상태</span></label>

								<div class="col-md-4 col-lg-3">
									<form>
										<select class="form-control" id="restSearchApprStat" name="restSearchApprStat" >
											<option value="X"></option>
											<option value="T">임시저장</option>
											<option value="R">결재요청</option>
											<option value="A">승인진행중</option>
											<option value="C">승인완료</option>
											<option value="F">처리완료</option>
											<option value="D">반려</option>
											<option value="N">취소</option>
										</select>
									</form>
								</div>

								<!--  2-4. 균등 분할을 위한 여백 부분  -->
								<div class="restSearchBtnDiv">
									<button type="button" class="btn btn-search" id="restSearchBtn" onclick="Search()">검색</button>
								</div>
							</div>

						</div>
					</div>
				</form>
			</section>
		</div>
		<!-- /container -->

		<div class="container">
			<div class="data-table-wrap">
				<div class="gridBtn">
					<a href="#n" class="btn dl-btn btn-search" id="excelDown">엑셀다운로드</a>
					<button type="button" class="btn reg-btn btn-search" id="restSearchReg">등록</button>
				</div>
				<table id="gridlist"></table>
				<div id="gridpager"></div>
				
			</div>
		</div>
	</section>


	<!-- grid -->
	<section class="section sub-contents">

		<!-- /container -->
	</section>

	<form id="EXCEL_" name="EXCEL_" action="/ed/down_excel" method="post">
		<input type="hidden" name="csvBuffer" id="csvBuffer" value="">
		<input type="hidden" name="fileName" id="fileName" value="">
	</form>



</body>
</html>
