package kr.co.biztechpartners.serveSocket.ed.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.biztechpartners.serveSocket.admin.service.AdminService;
import kr.co.biztechpartners.serveSocket.admin.vo.CommonCodeExt;
import kr.co.biztechpartners.serveSocket.common.util.QueryUtil;
import kr.co.biztechpartners.serveSocket.ed.service.EdService;
import kr.co.biztechpartners.serveSocket.ed.vo.RestMstDtoExt;
import kr.co.biztechpartners.serveSocket.user.vo.UserVOExt;

@Controller
public class EdController {
	private static final Logger log = LoggerFactory.getLogger(EdController.class);
	
	@Autowired
	EdService edService;
	
	@GetMapping("/ed/csrList")
	public ModelAndView csrList(HttpSession session){
		ModelAndView view = new ModelAndView();
		
		view.setViewName("ed/csrList");
		return view;
	}
	
	@GetMapping("/ed/ed1List")
	public ModelAndView ed1List(HttpSession session){
		ModelAndView view = new ModelAndView();
		
		view.setViewName("ed/ed1List");
		return view;
	}
	
	@GetMapping("/ed/ed2List")
	public ModelAndView ed2List(HttpSession session){
		ModelAndView view = new ModelAndView();
		
		view.setViewName("ed/ed2List");
		return view;
	}
	
	@GetMapping("/ed/ed3List")
	public ModelAndView ed3List(HttpSession session){
		ModelAndView view = new ModelAndView();
		
		view.setViewName("ed/ed3List");
		return view;
	}
	
	//20220808 김민지 
	@GetMapping("/ed/ed5List")
	public ModelAndView ed5List(HttpSession session){
		ModelAndView view = new ModelAndView();
		
		view.setViewName("ed/ed5List");
		return view;
	}
	
//	@GetMapping("/ed/PRRE001List")
//	public ModelAndView PRRE001List(HttpSession session){
//		ModelAndView view = new ModelAndView();
//		
//		view.setViewName("ed/PRRE001List");
//		return view;
//	}
//	
//	@GetMapping("/ed/PRRE002List")
//	public ModelAndView PRRE002List(HttpSession session){
//		ModelAndView view = new ModelAndView();
//		
//		view.setViewName("ed/PRRE002List");
//		return view;
//	}
//	
//	@GetMapping("/ed/PRRE003List")
//	public ModelAndView PRRE003List(HttpSession session){
//		ModelAndView view = new ModelAndView();
//		
//		view.setViewName("ed/PRRE003List");
//		return view;
//	}
//	
//	@GetMapping("/ed/PRRE004List")
//	public ModelAndView PRRE00List4(HttpSession session){
//		ModelAndView view = new ModelAndView();
//		
//		view.setViewName("ed/PRRE004List");
//		return view;
//	}
//	
//	@GetMapping("/ed/PRRE005List")
//	public ModelAndView PRRE005List(HttpSession session){
//		ModelAndView view = new ModelAndView();
//		
//		view.setViewName("ed/PRRE005List");
//		return view;
//	}
	
	//공통코드 관리
	@GetMapping("/ed/PRRE001")
	public ModelAndView PRRE001(HttpSession session){
		ModelAndView view = new ModelAndView();
		
		view.setViewName("ed/PRRE001");
		return view;
	}
	
	@RequestMapping(value="/ed/restlist", method = RequestMethod.POST)
    public @ResponseBody Object restList(HttpServletRequest request,
            HttpServletResponse response,
            @RequestParam boolean _search,
            @RequestParam long nd, 
            @RequestParam int rows,
            @RequestParam int page, 
            @RequestParam String sidx,
            @RequestParam String sord,
            @RequestParam(required = false)  String filters
            ) throws JsonGenerationException,JsonMappingException, IOException{
    	HashMap<String, Object> params = new HashMap<String, Object>();
    	
    	System.out.println(page);
    	System.out.println(rows);
//    	int start = ((page - 1) * rows) + 1;
//        int limit = (start + rows) - 1;
    	int start = ((page)-1) * rows + 1;
    	int limit = page * rows;
        if(filters != null && !filters.equals("")) {
            //System.out.println(filters);
              params.put("filters", QueryUtil.getQueryCondition(filters));
        }
        


        params.put("start", start);
        params.put("limit", limit);

        List<RestMstDtoExt> searchRest = edService.getAllRest(params);
        
        //System.out.println(searchRest.get(0));
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
        int totcnt = 0;
        if( !searchRest.isEmpty() ) {
        	totcnt = searchRest.get(0).getTotcnt();
        }
        
        
        int records = edService.selectAlltotalRecords();
        double total = (double) records / rows;
//        for(int i=0; i<searchRest.size(); i++) {
//     	   System.out.println(searchRest.get(i).getRsvStrtDay());
//     	}
        
        
        modelMap.put("total", (int) Math.ceil(total));
        modelMap.put("records", records);
        modelMap.put("rows", searchRest);
        modelMap.put("page", page);
        
        String value = mapper.writeValueAsString(modelMap);
    	
    	return value;
    }
	
	
	
	//grid search 0806 gw
	@RequestMapping(value="/ed/restSearch", method = RequestMethod.POST)
    public @ResponseBody Object restSearch(HttpServletRequest request,HttpServletResponse response,
            @RequestParam int rows,
            @RequestParam int page) throws JsonGenerationException,JsonMappingException, IOException{
		
		HashMap<String, Object> params = new HashMap<String, Object>();
    	
    	int start = ((page - 1) * rows) + 1;
        int limit = (start + rows) - 1;
        

        String bizrgNo = request.getParameter("bizrgNo");
        String loc = request.getParameter("loc");
        String bizTypeCd = request.getParameter("bizTypeCd");
        String restNm = request.getParameter("restNm");
        String coName = request.getParameter("coName");
        String rsvStrtDay = request.getParameter("rsvStrtDay");
        String rsvEndDay = request.getParameter("rsvEndDay");
        String apprStatCd = request.getParameter("apprStatCd");
       
        if(loc.equals("L0000")) {
        	//System.out.println(loc);
        	loc = null;
        	//System.out.println(loc);
        }
        
        if(bizTypeCd.equals("B0000")) {
        	bizTypeCd = null;
        }
        
        if(apprStatCd.equals("X")) {
        	apprStatCd = null;
        }
        rsvStrtDay = rsvStrtDay.replaceAll("[^\\uAC00-\\uD7A30-9a-zA-Z]", "");
        rsvEndDay = rsvEndDay.replaceAll("[^\\uAC00-\\uD7A30-9a-zA-Z]", "");
        System.out.println(bizrgNo);
//        params.put("start", start);
//        params.put("limit", limit);
        params.put("bizrgNo", bizrgNo);
        params.put("loc", loc);
        params.put("bizTypeCd", bizTypeCd);
        params.put("restNm", restNm);
        params.put("coName", coName);
        params.put("rsvStrtDay", rsvStrtDay);
        params.put("rsvEndDay", rsvEndDay);
        params.put("apprStatCd", apprStatCd);
        
        List<RestMstDtoExt> searchRest = edService.searchRest(params);
        
        //System.out.println(searchRest.get(0));
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
        int totcnt = 0;
        if( !searchRest.isEmpty() ) {
        	totcnt = searchRest.get(0).getTotcnt();
        }
        
        double total = (double) totcnt / rows;

        modelMap.put("total", (int) Math.ceil(total));
        modelMap.put("records", totcnt);
        modelMap.put("rows", searchRest);
        modelMap.put("page", page);
		
        String value = mapper.writeValueAsString(modelMap);
		return value;
	}
	
	//excel down 0805 gw 
		@RequestMapping(value = "/ed/down_excel", method=RequestMethod.POST)
		public ModelAndView down_excel(HttpSession session){
			ModelAndView view = new ModelAndView();
			
			view.setViewName("ed/down_excel");
			return view;
		}
	
	@GetMapping("/ed/PRRE002")
	public ModelAndView PRRE002(HttpSession session){
		ModelAndView view = new ModelAndView();
		
		view.setViewName("ed/PRRE002");
		return view;
	}
	
	@GetMapping("/ed/PRRE003")
	public ModelAndView PRRE003(HttpSession session){
		ModelAndView view = new ModelAndView();
		
		view.setViewName("ed/PRRE003");
		return view;
	}
//	
//	@RequestMapping(value="/ed/PRRE003List", method = RequestMethod.POST)
//	public @ResponseBody Object PRRE003List(HttpServletRequest request,
//            HttpServletResponse response, 
//            @RequestParam boolean _search,
//            @RequestParam long nd, 
//            @RequestParam int rows,
//            @RequestParam int page, 
//            @RequestParam String sidx,
//            @RequestParam String sord,
//            @RequestParam(required = false)  String filters
//	) throws JsonGenerationException,
//            JsonMappingException, IOException {
//
//        HashMap<String, Object> params = new HashMap<String, Object>();
//        int start = ((page - 1) * rows) + 1;
//        int limit = (start + rows) - 1;
//        
//        
//        System.out.println(filters);
//        if(filters != null && !filters.equals("")) {
//        //System.out.println(filters);
//          params.put("filters", QueryUtil.getQueryCondition(filters));
//        }
//        params.put("start", start);
//        params.put("limit", limit);
//        
//        // 이 부분 수정
//        List<CommonCodeExt> commonCodeExtList = adminService.selectCommonCode2(params);
//
//        ObjectMapper mapper = new ObjectMapper();
//
//        Map<String, Object> modelMap = new HashMap<String, Object>();
//        // total = Total Page
//        // record = Total Records
//        // rows = list data
//        // page = current page
//
//        int totcnt = 0;
//        if( !commonCodeExtList.isEmpty() ) {
//        	totcnt = commonCodeExtList.get(0).getTotcnt();
//        }
//        
//        double total = (double) totcnt / rows;
//
//        modelMap.put("total", (int) Math.ceil(total));
//        modelMap.put("records", totcnt);
//        modelMap.put("rows", commonCodeExtList);
//        modelMap.put("page", page);
//        
//        String value = mapper.writeValueAsString(modelMap);
//
//        return value;
//    }
	@RequestMapping(value="/ed/avaInfoSearch", method = RequestMethod.POST)
    public @ResponseBody Object avaInfoSearch(HttpServletRequest request,HttpServletResponse response,
            @RequestParam int rows,
            @RequestParam int page) throws JsonGenerationException,JsonMappingException, IOException{
		
		HashMap<String, Object> params = new HashMap<String, Object>();
    	
    	int start = ((page - 1) * rows) + 1;
        int limit = (start + rows) - 1;

        String loc = request.getParameter("loc");
        String bizTypeCd = request.getParameter("bizTypeCd");
        String restNm = request.getParameter("restNm");
        String rezDt = request.getParameter("rezDt");
        String rezTimeCD = request.getParameter("rezTimeCD");
        String rezPosCNT = request.getParameter("rezPosCNT");
        String rezPay = request.getParameter("rezPay");
        rezDt = rezDt.replaceAll("[^\\uAC00-\\uD7A30-9a-zA-Z]", "");
        if(loc.equals("L0000")) {
        	//System.out.println(loc);
        	loc = null;
        	//System.out.println(loc);
        }
        
        if(bizTypeCd.equals("B0000")) {
        	bizTypeCd = null;
        }
        
        if(rezTimeCD.equals("R0000")) {
        	rezTimeCD = null;
        }
        
        if(rezPay.equals("F")) {
        	rezPay = null;
        }
		
		 
		 
  
//        params.put("start", start);
//        params.put("limit", limit);
        params.put("loc", loc);
        params.put("bizTypeCd", bizTypeCd);
        params.put("restNm", restNm);
        params.put("rezDt", rezDt);
        params.put("rezTimeCD", rezTimeCD);
        params.put("rezPosCNT", rezPosCNT);
        params.put("rezPay", rezPay);
        
        List<RestMstDtoExt> searchAvaInfo = edService.searchAvaInfo(params);
//        for(int i=0; i<searchAvaInfo.size(); i++) {
//   		 System.out.println(searchAvaInfo.get(i).getatt); 
//   		 }
        //System.out.println(searchRest.get(0));
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> modelMap = new HashMap<String, Object>();
        int totcnt = 0;
        if( !searchAvaInfo.isEmpty() ) {
        	totcnt = searchAvaInfo.get(0).getTotcnt();
        }
        
        double total = (double) totcnt / rows;

        modelMap.put("total", (int) Math.ceil(total));
        modelMap.put("records", totcnt);
        modelMap.put("rows", searchAvaInfo);
        modelMap.put("page", page);
		
        String value = mapper.writeValueAsString(modelMap);
		return value;
	}
	
	@GetMapping("/ed/PRRE004")
	public ModelAndView PRRE004(HttpSession session){
		ModelAndView view = new ModelAndView();
		
		view.setViewName("ed/PRRE004");
		return view;
	}
	
	@GetMapping("/ed/PRRE005")
	public ModelAndView PRRE005(HttpSession session){
		ModelAndView view = new ModelAndView();
		
		view.setViewName("ed/PRRE005");
		return view;
	}
}
