package kr.or.warehouse.controller.rest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.service.ContactService;

@RestController
@RequestMapping("contact")
public class ContactRestController {

	@Autowired
	private ContactService service;

	@RequestMapping("getTeamList")
	public ResponseEntity<Map<String, Object>> getTeamList(Criteria cri ,String dname) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataMap = service.getTeamContactList(cri, dname);
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping("getGroupList")
	public ResponseEntity<Map<String,Object>>getGroupList(Criteria cri, String cogroupcode)throws Exception{
		ResponseEntity<Map<String, Object>> resultGroup = null;

		try {
			Map<String, Object>groupInfoMap = service.getGroupInfoList(cri, cogroupcode);
			resultGroup = new  ResponseEntity<Map<String,Object>>(groupInfoMap,HttpStatus.OK);
		} catch (Exception e) {
			resultGroup = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return resultGroup;
	}

//------------------------------------------------ 초성 -------------------------------------------------------
	@RequestMapping("getGiList")
	public ResponseEntity<Map<String, Object>> getGiList(Criteria cri) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.getGiList(cri);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("getNiList")
	public ResponseEntity<Map<String, Object>> getNiList(Criteria cri) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.getNiList(cri);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("getDiList")
	public ResponseEntity<Map<String, Object>> getDiList(Criteria cri) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.getDiList(cri);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("getRiList")
	public ResponseEntity<Map<String, Object>> getRiList(Criteria cri) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.getRiList(cri);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("getMiList")
	public ResponseEntity<Map<String, Object>> getMiList(Criteria cri) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.getMiList(cri);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("getBiList")
	public ResponseEntity<Map<String, Object>> getBiList(Criteria cri) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.getBiList(cri);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("getXiList")
	public ResponseEntity<Map<String, Object>> getXiList(Criteria cri) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.getXiList(cri);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("getOiList")
	public ResponseEntity<Map<String, Object>> getOiList(Criteria cri) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.getOiList(cri);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("getJiList")
	public ResponseEntity<Map<String, Object>> getJiList(Criteria cri) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.getJiList(cri);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("getCiList")
	public ResponseEntity<Map<String, Object>> getCiList(Criteria cri) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.getCiList(cri);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("getCaiList")
	public ResponseEntity<Map<String, Object>> getCaiList(Criteria cri) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.getCaiList(cri);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("getTiList")
	public ResponseEntity<Map<String, Object>> getTiList(Criteria cri) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.getTiList(cri);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("getPiList")
	public ResponseEntity<Map<String, Object>> getPiList(Criteria cri) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.getPiList(cri);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("getHiList")
	public ResponseEntity<Map<String, Object>> getHiList(Criteria cri) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.getHiList(cri);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}

	
	// 부서 초성
	@RequestMapping("DgetGiList")
	public ResponseEntity<Map<String, Object>> DgetGiList(Criteria cri,int dno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.DgetGiList(cri,dno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	
	
	@RequestMapping("DgetNiList")
	public ResponseEntity<Map<String, Object>> DgetNiList(Criteria cri,int dno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.DgetNiList(cri,dno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("DgetDiList")
	public ResponseEntity<Map<String, Object>> getDiList(Criteria cri,int dno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.DgetDiList(cri,dno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("DgetRiList")
	public ResponseEntity<Map<String, Object>> DgetRiList(Criteria cri,int dno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.DgetRiList(cri,dno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("DgetMiList")
	public ResponseEntity<Map<String, Object>> DgetMiList(Criteria cri,int dno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.DgetMiList(cri,dno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("DgetBiList")
	public ResponseEntity<Map<String, Object>> DgetBiList(Criteria cri,int dno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.DgetBiList(cri,dno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("DgetXiList")
	public ResponseEntity<Map<String, Object>> DgetXiList(Criteria cri,int dno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.DgetXiList(cri,dno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("DgetOiList")
	public ResponseEntity<Map<String, Object>> DgetOiList(Criteria cri,int dno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.DgetOiList(cri,dno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("DgetJiList")
	public ResponseEntity<Map<String, Object>> DgetJiList(Criteria cri,int dno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.DgetJiList(cri,dno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("DgetCiList")
	public ResponseEntity<Map<String, Object>> DgetCiList(Criteria cri,int dno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.DgetCiList(cri,dno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("DgetCaiList")
	public ResponseEntity<Map<String, Object>> DgetCaiList(Criteria cri,int dno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.DgetCaiList(cri,dno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("DgetTiList")
	public ResponseEntity<Map<String, Object>> DgetTiList(Criteria cri,int dno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.DgetTiList(cri,dno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("DgetPiList")
	public ResponseEntity<Map<String, Object>> DgetPiList(Criteria cri,int dno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.DgetPiList(cri,dno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("DgetHiList")
	public ResponseEntity<Map<String, Object>> DgetHiList(Criteria cri,int dno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.DgetHiList(cri,dno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}

	
	//개인
	@RequestMapping("PgetGiList")
	public ResponseEntity<Map<String, Object>> PgetGiList(Criteria cri,int eno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.PgetGiList(cri,eno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	
	
	@RequestMapping("PgetNiList")
	public ResponseEntity<Map<String, Object>> PgetNiList(Criteria cri,int eno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.PgetNiList(cri,eno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("PgetDiList")
	public ResponseEntity<Map<String, Object>> PgetDiList(Criteria cri,int eno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.PgetDiList(cri,eno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("PgetRiList")
	public ResponseEntity<Map<String, Object>> PgetRiList(Criteria cri,int eno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.PgetRiList(cri,eno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("PgetMiList")
	public ResponseEntity<Map<String, Object>> PgetMiList(Criteria cri,int eno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.PgetMiList(cri,eno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("PgetBiList")
	public ResponseEntity<Map<String, Object>> PgetBiList(Criteria cri,int eno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.PgetBiList(cri,eno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("PgetXiList")
	public ResponseEntity<Map<String, Object>> PgetXiList(Criteria cri,int eno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.PgetXiList(cri,eno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("PgetOiList")
	public ResponseEntity<Map<String, Object>> PgetOiList(Criteria cri,int eno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.PgetOiList(cri,eno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("PgetJiList")
	public ResponseEntity<Map<String, Object>> PgetJiList(Criteria cri,int eno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.PgetJiList(cri,eno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("PgetCiList")
	public ResponseEntity<Map<String, Object>> PgetCiList(Criteria cri,int eno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.PgetCiList(cri,eno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("PgetCaiList")
	public ResponseEntity<Map<String, Object>> PgetCaiList(Criteria cri,int eno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.PgetCaiList(cri,eno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("PgetTiList")
	public ResponseEntity<Map<String, Object>> PgetTiList(Criteria cri,int eno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.PgetTiList(cri,eno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("PgetPiList")
	public ResponseEntity<Map<String, Object>> PgetPiList(Criteria cri,int eno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.PgetPiList(cri,eno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return result;
	}
	@RequestMapping("PgetHiList")
	public ResponseEntity<Map<String, Object>> PgetHiList(Criteria cri,int eno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		try {
			Map<String, Object> dataGiMap = service.PgetHiList(cri,eno);
			result = new ResponseEntity<Map<String,Object>>(dataGiMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}

}
