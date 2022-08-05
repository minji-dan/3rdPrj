<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
<title>음식점관리</title>

<style>


.gridLabel:before {
	content: "▶ ";
}

#GridDiv2 {
	width: 65%;
	float: left;
}

#GridDiv3 {
	width: 30%;
	float: right;
}

</style>
 
  <script type="text/javascript" class="init">

  
  $( function() {
	  $( "#start" ).datepicker();
	  } );
  $( function() {
	  $( "#end" ).datepicker();
	  } );
  
  
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
  
  <!-- 예약가능정보 -->

  
  <!-- 음식점설명 및 결재정보 -->
  <section class="detail-form"><form><div class="detail-wrap"><div class="col-lg-12">                          
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
				</tbody></table></div>
							                
  </div></div></form></section>
  
  

  <section class="section sub-contents">
    <div class="container">

    </div> <!-- /container -->
  </section>
</body>

</html>
