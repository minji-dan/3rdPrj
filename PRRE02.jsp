<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
<title>음식점관리</title>

<style>


.gridLabel:before {
	content: "▶ ";
}

#GridDiv2 {
	width: 65%;
	height: 25px;
	float: left;
}

#BodyDiv2{
	width: 65%;
	height: 25px;
	float: left;
}

#GridDiv3 {
	width: 30%;
	height: 25px;
	float: right;
}

#BodyDiv3 {
	width: 30%;
	height: 25px;
	float: right;
}

/* 2-2) 예약가능정보 */
#gbox_gridlist{
	width: 65%;
	border: none;
	position: 'absolute';
 	float: left; 
}

#gbox_gridlist2{
	width: 30%;
	border: none;
	position: 'absolute';
	float: right;'
	
}

/* [2] 버튼 조정 */
#delBtn, #addBtn, #downBtn, #delBtn2, #addBtn2 {
	margin-left: 10px;
	height: 25px;
	width: auto;
	border-radius: 0px;
	float: right !important;
}

#listBtn, #saveBtn, #reqBtn, #appBtn, #comBtn {
	margin-left: 10px;
	height: 25px;
	width: auto;
	border-radius: 0px;
	float: right !important;
}

            		

</style>
 
  <script type="text/javascript" class="init">

  
  $( function() {
	  $( "#start" ).datepicker();
	  } );
  $( function() {
	  $( "#end" ).datepicker();
	  } );
  
  
$(document).ready(function() {
	  
	/* ****************
	Grid 2-1: 예약가능정보
	***************** */
      jQuery("#gridlist").jqGrid({
    	  url : '/ed/restSearch2',
          datatype : 'json',
          mtype : 'POST',
          colNames : ["No.", '예약가능시간', '예약가능인원', '예약금발생여부', '예약금', '최대이용시간', '비고'],
          colModel : [
        	  		//No.
                      {name:'rnum', index:'rnum', width:20, editrules:{ edithidden:true },
                          editable : false,
                          search: false },
                    //예약가능시간
                      {name : 'bizrgNo', index : 'bizrgNo', width : 50, editrules : {required : true, edithidden : true},
                          editable : true,editoptions : {size : "150",maxlength : "50"}},
                       //예약가능인원
                        {name : 'loc',index : 'loc', width : 50,editrules : {required : true,edithidden : true},
                          	editable : true,editoptions : {size : "50",maxlength : "50"},
                          	search: false
                        },
                        //예약금발생여부
                          {name : 'bizTypeCd',index : 'bizTypeCd', align:"center",width : 50,editrules : {required : true,edithidden : true},
                          editable : true,editoptions : {size : "50",maxlength : "50"},
                          search: false,
                          align: 'center'},
                      	//예약금
                          {name : 'restNm',index : 'restNm', width : 50,editrules : {required : true,edithidden : true},
                          editable : true,editoptions : {size : "150",maxlength : "50"},
                          search: false},
                        //최대이용시간
                      	{name : 'ownerId',index : 'ownerId',width : 50, editrules : {required : true,edithidden : true},
                          editable : true,editoptions : {size : "150",maxlength : "50"},
                          search: false,
                          align: 'center'
                      },
                      	//비고
                      {name : 'rsvStrtDay',index : 'rsvStrtDay', align:"center",width : 80,editrules : {required : false,edithidden : true},
                          editable : false,editoptions : {size : "50",maxlength : "50"},
                          search: false,
                          }
                      ],
                      multiselect:true, //체크박스
          pager : jQuery('#gridpager'),
          pagination : true,
//        rowNum : 10,
//        rowList : [ 3, 6, 9 ],
          sortname : 'id',
          viewrecords : true,
          sortorder : "desc",
          caption : "예약 가능 정보",
          autowidth : true,
          height : '100%',
          jsonReader: {
              repeatitems: false
          },
          ondblClickRow : function(id) {
              alert("You double click row with id: "+ id);
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

      var $grid = $('#gridlist');

      	/* ****************
  		Grid 2-2: 휴무정보
  		***************** */
        jQuery("#gridlist2").jqGrid({
      	  url : '/ed/restSearch2',
            datatype : 'json',
            mtype : 'POST',
            colNames : ["No.", '휴무정보'],
            colModel : [            	
          	  		//No.
                        {name:'rnum', index:'rnum', width:20, editrules:{ edithidden:true },
                            editable : false,
                            search: false },
                      //예약가능시간
                        {name : 'bizrgNo', index : 'bizrgNo', width : 50, editrules : {required : true, edithidden : true},
                            editable : true,editoptions : {size : "150",maxlength : "50"}},
                        ],
                        multiselect:true, //체크박스
            pager : jQuery('#gridpager2'),
            pagination : true,
//          rowNum : 10,
//          rowList : [ 3, 6, 9 ],
            sortname : 'id',
            viewrecords : true,
            sortorder : "desc",
            caption : "휴무 정보",
            autowidth : true,
            height : '100%',
            jsonReader: {
                repeatitems: false
            },
            ondblClickRow : function(id) {
                alert("You double click row with id: "+ id);
            }
        	}
        );

        jQuery("#gridlist2").jqGrid({
            pager : '#gridpager2',
            recordtext : "View {0} - {1} of {2}",
            emptyrecords : "No records to view",
            loadtext : "Loading...",
            pgtext : "Page {0} of {1}"
        });

        var $grid2 = $('#gridlist2');
      // create the grid
      $grid2.jqGrid({
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
      


	/* ****************
		날짜선택 달력 
	***************** */
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
        <p class="sub-hero-text"><span class="core-color">음식점관리</span></p>
        <p class="sub-hero-text2"></p>
      </div>
    </div>
  </section>
  
			
			
<!--  [1] 음식점정보 -->
<section class="detail-form"><form><div class="detail-wrap"><div class="col-lg-12">                          
              <label class="gridLabel">음식점정보</label>
			<div id="frm">
			<table height="300" class="infoTable" style="margin-left: auto; margin-right: auto;">							  
							  <tbody>						
							  	<!--음식점ID, 결재상태 -->
							    <tr>
							      <th scope="row" class="commonList">음식점ID</th>
							      	<td><input type="text" class="form-control" id="searchValue" name="searchValue" value="" style="width:100px"></td>
							      <th scope="row" class="mustList">결재상태</th>
							      	<td><select class="form-control" id="updDate" name="coId" style="width:100px">
                    	</select>
                    	<input type="hidden" name='coName' id="coName"/></td>
							    </tr>
							    
							    <!--사업자등록번호, 음식점명 -->
							    <tr>
							    <th scope="row" class="commonList">사업자등록번호</th>
							      	<td><input type="text" class="form-control" id="searchValue" name="searchValue" value="" style="width:100px"></td>
							      <th scope="row" class="mustList">음식점명</th>
							      	<td><input type="text" class="form-control" id="searchValue" name="searchValue" value="" style="width:100px"></td>
							    </tr>
							    
							    <!--전화번호, 지역 -->
							    <tr>
							    <th scope="row" class="mustList">전화번호</th>
							      	<td><input type="text" class="form-control" id="searchValue" name="searchValue" value="" style="width:100px"></td>
							      <th scope="row" class="commonList">지역</th>
							      	<td><select class="form-control" id="updDate" name="coId" style="width:100px">
                    	</select>
                    	<input type="hidden" name='coName' id="coName"/></td>
							     </tr>
							     
							     <!--업종, 업주 -->
							     <tr>
							      <th scope="row" class="commonList">업종</th>
							      	<td><select class="form-control" id="updDate" name="coId" style="width:100px">
                    	</select>
                    	<input type="hidden" name='coName' id="coName"/></td>
							      <th scope="row" class="commonList">업주</th>
							      	<td><select class="form-control" id="updDate" name="coId" style="width:100px">
                    	</select>
                    	<input type="hidden" name='coName' id="coName"/></td>
							     </tr>
							     
							     <!--영업시간, 최대수용인원 -->
							     <tr>
							      <th scope="row" class="mustList">영업시간</th>
								      <td><input type="text" class="form-control" id="searchValue" name="searchValue" value="" style="width:100px"></td>
								      <th scope="row" class="mustList"">최대수용인원</th>
							      		<td><input type="text" class="form-control" id="searchValue" name="searchValue" value="" style="width:100px"></td>
							    </tr>
							    
								<!--예약가능기간 -->
							    <tr>							      
							      	<th scope="row" class="mustList">예약가능기간</th>
							      	<td>
							      	<input type="text" id="start" name="start" style="width:100px; height:30px"/>
                        			&nbsp ~ &nbsp
                        			<input type="text" id="end" name="end" style="width:100px; height:30px"/>
                        			</td>
							    </tr>
							    
							    <!--주소 -->
							    <tr>
							     	 <th scope="row" class="mustList">주소</th>
							   		<td><input type="text" class="form-control" id="searchValue" name="searchValue" value="" style="width:100px"></td>
					   		
							    </tr>							   
							    <tr>						      	
							      <th scope="row"></th>
							      	<td></td>
							    </tr>			
							  </tbody>
							</table>
						</div>    <!--firm div -->
						</div>  <!--col-lg-12 div -->
						</div>  <!-- detail-wrap -->
						</form>
						</section>
			
  <br>
  
  <!-- [2] 예약가능정보, 휴무정보 -->

<!-- <section class="detail-form"><form><div class="detail-wrap">  -->
  <div class="col-lg-12">                          

	<div id="GridDiv2"> <label class="gridLabel">예약가능정보</label></div>
	<div id="GridDiv3"> <label class="gridLabel">휴무정보</label></div>   
	
	<div id="frm">
	<table style="margin-left: auto; margin-right: auto;">
	<tbody>
	
<!-- 	[2-1] 예약가능정보  -->
	<div id="BodyDiv2">
			<div class="LblockMarkupCode">
				<!-- 버튼 -->
				<div class="GridListButton">
					<button type="button" id="downBtn" >엑셀다운로드</button>
           	 		<button type="button" id="delBtn" >- 행삭제</button>
            		<button type="button" id="addBtn" >+ 행추가</button>				        
				</div>
							
			</div>
	</div>	
	
<!-- 	[2-2] 휴무정보  -->
	<div id="BodyDiv3">
			<div class="LblockMarkupCode">
				<!-- 버튼 -->
				<div class="GridListButton">
           	 		<button type="button" id="delBtn2" >- 행삭제</button>
            		<button type="button" id="addBtn2" >+ 행추가</button>				        
				</div>			
			</div>
	</div>
	
	<!-- grid: 예약가능정보 -->
				<div class="container">
					<div class="data-table-wrap">
						<table id="gridlist"></table>
						<div id="gridpager"></div>
						
						<table id="gridlist2"></table>
						<div id="gridpager2"></div>
						
					</div>
			    </div>
			    
			 
			    
	</tbody></table></div>

							                
  </div>
<!--   </div></form></section> -->
  
  <!-- [3] 음식점설명 및 결재정보 -->
  <section class="detail-form"><form><div class="detail-wrap">
  <div class="col-lg-12">                          
	<label class="gridLabel">음식점설명 및 결재정보</label>
              <div id="frm"><table height="300" class="infoTable" style="margin-left: auto; margin-right: auto;"><tbody>						
              		<tr>
							      <th scope="row" class="commonList">음식점설명</th>
							      	<td><input type="text" class="form-control" id="searchValue" name="searchValue" value="" style="width:500px; height:80px"></td>							                         
					</tr>
					<tr>
							      <th scope="row" class="commonList">편의시설</th>
							      	<td><input type="text" class="form-control" id="searchValue" name="searchValue" value="" style="width:500px; height:80px"></td>							                         
					</tr>
					<tr>
							      <th scope="row" class="commonList">결재의견</th>
							      	<td><input type="text" class="form-control" id="searchValue" name="searchValue" value="" style="width:500px; height:80px"></td>							                         
					</tr>
					
					
				</tbody>
				
				</table>
				
				</div>
				<div class="LblockMarkupCode">
				<!-- 버튼 -->
				<div class="GridListButton">
					<button type="button" id="comBtn">반려</button>	
           	 		<button type="button" id="appBtn">승인</button>
            		<button type="button" id="reqBtn">결재요청</button>
            		<button type="button" id="saveBtn">저장</button>
            		<button type="button" id="listBtn">목록</button>				        
				</div>			
				</div>
							                
  </div>
  </div></form></section>
  

  <section class="section sub-contents">
    <div class="container">

    </div> <!-- /container -->
  </section>
</body>

</html>
