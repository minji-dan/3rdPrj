<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<title>jqGrid Sample</title>

<style>

.searchRow1, .searchRow2 {
	/*display: inline-flex;
	justify-content: space-between;*/
	display: flex;
	flex-flow: row nowrap;
	justify-content: center;
}


</style>
  
  <script type="text/javascript" class="init">
  
  $(document).ready(function() {
	  
      jQuery("#gridlist").jqGrid({
          url : '/admin/commonCode2List',
          datatype : 'json',
          mtype : 'POST',
          colNames : ["No.", '사업자등록번호', '지역', '업종', '음식점명', '업주', '예약가능기간', '결재상태'],
          colModel : [
        	  		//No.
                      {name:'rnum', index:'rnum', width:30, editrules:{ edithidden:true },
                          editable : false,
                          search: false,
                          align: 'right'},
                    //사업자등록번호 
                      {name : 'classCode', index : 'classCode', width : 100, editrules : {required : true, edithidden : true},
                          editable : true,editoptions : {size : "150",maxlength : "50"},
                          editoptions: {},
                          stype: "select",
                          searchoptions: {
                              dataUrl: '/common/code/classCodeSelect',
                              buildSelect: function (data) {
                                  if(typeof(data)=='string')
                                     data = $.parseJSON(data);
                                  var rtSlt = '<select name="classCode">';
                                  for ( var idx = 0 ; idx < data.length ; idx ++) {
                                      rtSlt +='<option value="'+data[idx].class_code+'">'+data[idx].class_code_name+'</option>';
                                  }
                                  rtSlt +='</select>';
                                  return rtSlt;
                              },
                              sopt: ["eq"]
                          }},
                       //지역
                        {name : 'region',index : 'region', width : 50,editrules : {required : true,edithidden : true},
                          	editable : true,editoptions : {size : "50",maxlength : "50"},
                          	search: false,
                        },
                          /*{name : 'classCode', index : 'classCode', width : 100, editrules : {required : true, edithidden : true},
                          editable : true,editoptions : {size : "50",maxlength : "50"},
                          search: false},
                      {name : 'classCodeName',index : 'classCodeName', align:"center",width : 200,editrules : {required : true,edithidden : true},
                          editable : true,editoptions : {size : "50",maxlength : "50"},
                          editoptions: {},
                          stype: "select",
                          searchoptions: {
                              dataUrl: '/common/code/classCodeSelect',
                              buildSelect: function (data) {
                                  if(typeof(data)=='string')
                                     data = $.parseJSON(data);
                                  var rtSlt = '<select name="classCode">';
                                  for ( var idx = 0 ; idx < data.length ; idx ++) {
                                      rtSlt +='<option value="'+data[idx].class_code+'">'+data[idx].class_code_name+'</option>';
                                  }
                                  rtSlt +='</select>';
                                  return rtSlt;
                              },
                              sopt: ["eq"]
                          }},*/
                      	
                        //업종
                          {name : 'commonCode',index : 'commonCode', align:"center",width : 50,editrules : {required : true,edithidden : true},
                          editable : true,editoptions : {size : "50",maxlength : "50"},
                          search: false,
                          align: 'center'},
                      	//음식점명
                          {name : 'commonCodeName',index : 'commonCodeName', width : 120,editrules : {required : true,edithidden : true},
                          editable : true,editoptions : {size : "150",maxlength : "50"},
                          search: false},
                        //업주
                      	{name : 'useYn',index : 'useYn',width : 80,edittype : "select",formatter : 'select',
                          editoptions : {value : "N:N;Y:Y",defaultValue : "Y"},
                          editrules : {required : true,edithidden : true},
                          editable : true,
                          search: false,
                          align: 'center'
                      },
                      	//예약가능기간
                      {name : 'updOprt',index : 'updOprt', align:"center",width : 120,editrules : {required : false,edithidden : true},
                          editable : false,editoptions : {size : "50",maxlength : "50"},
                          search: false,
                          },
                       //결재상태
                      {name : 'updDate',index : 'updDate', align:"center",width : 80,editrules : {required : false,edithidden : true},
                              editable : false,editoptions : {size : "50",maxlength : "50"}, formatter: "date",
                                 formatoptions: { newformat: " Y-m-d" },
                                 search: false}
                      ],
          pager : jQuery('#gridpager'),
          pagination : true,
//        rowNum : 10,
//        rowList : [ 3, 6, 9 ],
          sortname : 'id',
          viewrecords : true,
          sortorder : "desc",
          caption : "공통코드 관리",
          autowidth : true,
          height : '100%',
          jsonReader: {
              repeatitems: false
          },
          ondblClickRow : function(id) {
              alert("You double click row with id: "+ id);
          },
          onSelectRow : function(id) {},
          loadComplete : function(xhr) {},
          gridComplete : function() {},
          loadError : function(xhr, st, err) {alert(err);},
          editurl : "/admin/commonCode2Edit"
      }).navGrid('#gridpager', {
          edit : true,
          add : true,
          del : true,
          search : true
	      },
	      {
	          url : "/admin/commonCode2Edit",
	          beforeShowForm: function ($form) {
	              $('#classCode').attr('readonly','readonly');
	              $('#commonCode').attr('readonly','readonly');
	          },
	          recreateForm: true,
	          closeAfterEdit: true,
	          errorTextFormat: function (data) {
	              return 'Error: ' + data.resultMsg;
	          }
	      },
	      {
	          url : "/admin/commonCode2Edit",
	          beforeShowForm: function ($form) {
	              $('#classCode').removeAttr('readonly');
	              $('#commonCode').removeAttr('readonly');
	          },
	          closeAfterAdd: true
	      },
	      {
	          url : "/admin/commonCode2Edit",
	          delData : {
	              classCode: function(){
	                  const selId = $('#gridlist').jqGrid('getGridParam', 'selrow');
	                  const divId = $('#gridlist').jqGrid('getCell', selId, 'classCode');
	                  return divId.replace(/-9/,'');
	              },
	              commonCode : function(){
	                  const selId = $('#gridlist').jqGrid('getGridParam', 'selrow');
	                  const cdId = $('#gridlist').jqGrid('getCell', selId, 'commonCode');
	                  return cdId.replace(/-9/,'');
	              }
	          }
	      }
      );

      jQuery("#gridlist").jqGrid({
          pager : '#gridpager',
          recordtext : "View {0} - {1} of {2}",
          emptyrecords : "No records to view",
          loadtext : "Loading...",
          pgtext : "Page {0} of {1}"
      });

      $.extend($.jgrid.edit, {
          closeAfterAdd : true,
          recreateForm : true,
          reloadAfterSubmit : false,
          left : 100,
          top : 100,
          dataheight : '100%',
          width : 500,
          addCaption : "추가",
          editCaption : "편집",
          bSubmit : "저장-전송",
          bCancel : "취소",
          bClose : "닫기",
          saveData : "Data has been changed! Save changes?",
          bYes : "Yes",
          bNo : "No",
          bExit : "Cancel"
      });

      var $grid = $('#gridlist');

      // create the grid
      $grid.jqGrid({
          // jqGrid opetions
      });

      // set searching deafauls
      $.extend($.jgrid.search, {multipleSearch: true, multipleGroup: false, closeAfterSearch: true, overlay: 0});

      // during creating nevigator bar (optional) one don't need include searching button
      $grid.jqGrid('navGrid', '#pager', {add: false, edit: false, del: false, search: false});

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
      $gbox.css({clear:"left"});
      
      $( function() {
    	  $( "#start" ).datepicker();
    	  } );
      $( function() {
    	  $( "#end" ).datepicker();
    	  } );
  });
  

  
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
	
	<!-- title: 음식점 목록 -->
<!-- 	<section class="section"> -->
<!-- 		<div class="LblockPageHeader"> -->
<!-- 			<h1 id="headTitle">음식점 목록</h1> -->

<!-- 		</div> -->
<!-- 	</section> -->
	
	
	 <section class="section sub-contents">
    <div class="container">
        <section class="detail-form">
          <form>
            <div class="detail-wrap">
 
              <div class="col-lg-12">
              	<!-- 첫 번째 행 -->
              	<div class="searchRow1">
              		<!-- (1-1) 사업자등록번호 -->             		
                    <label for="searchValue">사업자등록번호</label>
                    <input type="text" class="form-control" id="searchValue" name="searchValue" value="" style="width:100px">
            	
              		<!-- (1-2) 지역 -->    
                    <label for="region">지역</label>       	
                    	<select class="form-control" id="updDate" name="coId" style="width:100px">
                    	</select>
                    	<input type="hidden" name='coName' id="coName"/>
                  	
              		<!-- (1-3) 업종 -->             		
                    <label for="commonCode">업종</label>       	
                    	<select class="form-control" id="updDate" name="coId" style="width:100px">
                    	</select>
                    	<input type="hidden" name='coName' id="coName"/>

              		<!-- (1-4) 음식점명 -->
                    <label for="searchValue">음식점명</label>
                    <input type="text" class="form-control" id="searchValue" name="searchValue" value="" style="width:100px">
                  
            	</div>
            	
            	<!-- 두 번째 행 -->
                <div class="searchRow2">
                	<!-- (2-1) 업주 -->
                	<input name="coId" id="coId" type="hidden">
                	<label class="col-md-2 col-lg-1" for="useYn">업주</label>
   		
					<!-- 검색 필드, 검색 아이콘 -->
                  <div class="col-md-4 col-lg-3">                 	
                    <input type="text" class="form-control with-btn" id="coName" name="coName">
                    <button type="button" class="icon-btn" data-toggle="modal" data-target="#companySearch"><i class="fas fa-search"></i></button> 
                  </div>
                
                	<!-- (2-2) 예약가능기간 -->					
                	
                	<div class="col-md-4">
                  <div class="form-group">
                 
                    <div class="input-daterange input-group datepicker" id="datepicker">
                    <label for="exampleInputPassword1">예약가능기간</label>
                        <input type="text" id="start" name="start" style="width:100px; height:30px"/>
                        &nbsp ~ &nbsp
                        <input type="text" id="end" name="end" style="width:100px; height:30px"/>
                    </div>
                  </div>
                </div>
                	
               		               
                	<!-- (2-3) 결재상태 -->
                    <label for="updDate">결재상태</label>       	
                    	<select class="form-control" id="updDate" name="coId" style="width:100px">
                    	</select>
                    	<input type="hidden" name='coName' id="coName"/>            
                <!-- 검색 버튼 -->
                <div class="search-btn-wrap">
              <div class="form-group">
                <button type="button" id="searchBtn" class="btn btn-search">검색</button>
              </div>
            </div>
						
                </div>
              </div>
            </div>
          </form>
        </section>
        
        
        
        </div>
        </section>
	
	
	
	<!-- 검색 -->
	<section class="section contents">
	</section>
	
<!-- 	<!-- button --> 
<!-- 	<section> -->
<!-- 		<div id="GridDiv1"> -->
<!-- 			<div class="LblockMarkupCode"> -->
<!-- 				<div class="GridListButton1"> -->
<!--             		<button type="button">전체엑셀다운로드</button> -->
<!--            	 		<button type="button">엑셀다운로드</button> -->
<!--             		<button type="button">등록</button> -->
<!--         		</div> -->
<!--         		<div id="defaultGrid1"></div> -->
<!-- 			</div>			 -->
<!-- 		</div> -->
<!-- 	</section> -->
		
	<!-- grid -->
  <section class="section sub-contents">
    <div class="container">
			<div class="data-table-wrap">
				<table id="gridlist"></table>
				<div id="gridpager"></div>
			</div>
    </div> <!-- /container -->
  </section>

</body>
</html>
