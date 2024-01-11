package com.kg.library.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/production")
public class ProductionController {	

	private static final Logger log = LoggerFactory.getLogger(ProductionController.class);
	
	private final ProductionPlanService productionPlanService;
	
	public ProductionController(ProductionPlanService productionPlanService) {
		this.productionPlanService = productionPlanService;
	}

@RequestMapping(value="/monthPlan", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> monthPlan() {
		List<Map<String, Object>> list = productionPlanService.getProductionAllPlanList();
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<String, Object>();		
		
		for(int i=0; i < list.size(); i++) {			
			hash.put("title", list.get(i).get("detailed_categorized_name")); //제목
			hash.put("start", list.get(i).get("expected_production_start_date")); //시작일자
			hash.put("end", list.get(i).get("expected_production_end_date")); //종료일자
			
			jsonObj = new JSONObject(hash); //중괄호 {key:value , key:value, key:value}
			jsonArr.add(jsonObj); // 대괄호 안에 넣어주기[{key:value , key:value, key:value},{key:value , key:value, key:value}]
		}
		
		log.info("jsonArrCheck: {}", jsonArr);
		
		return jsonArr;
	}

}