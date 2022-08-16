package kr.or.warehouse.controller.rest;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.MakeFileName;
import kr.or.warehouse.dto.CommuBoardVO;
import kr.or.warehouse.dto.CommunityVO;
import kr.or.warehouse.dto.CommupostVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.JoinCommuVO;
import kr.or.warehouse.dto.SubCommuVO;
import kr.or.warehouse.service.CommunityService;
import kr.or.warehouse.service.WorkService;

@RestController
@RequestMapping("/community")
public class CommunityRestController {
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private WorkService workService;
	
	@Resource(name = "picturePath")
	private String picturePath;
	
	@RequestMapping("/communityList")
	public ResponseEntity<Map<String, Object>> manualList(Criteria cri){
		ResponseEntity<Map<String, Object>> result = null;

		Map<String, Object> dataMap = null;
		try {
			dataMap = communityService.getCommunityList(cri);
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;

	}
	
	@RequestMapping("/joinCommuList")
	public ResponseEntity<List<CommunityVO>> joinCommuList(int eno){
		ResponseEntity<List<CommunityVO>> result = null;
		
		List<CommunityVO> joinCommuList = null;
		try {
			joinCommuList = communityService.getJoinCommuList(eno);
			result = new ResponseEntity<List<CommunityVO>>(joinCommuList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<CommunityVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping("/subCommuList")
	public ResponseEntity<List<CommunityVO>> subCommuList(int eno){
		ResponseEntity<List<CommunityVO>> result = null;
		
		List<CommunityVO> subCommuList = null;
		try {
			subCommuList = communityService.getSubCommuList(eno);
			System.out.println(subCommuList);
			result = new ResponseEntity<List<CommunityVO>>(subCommuList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<CommunityVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping("/inviteCommu")
	public ResponseEntity<List<CommunityVO>> inviteCommu(int eno){
		ResponseEntity<List<CommunityVO>> result = null;
		
		List<CommunityVO> inviteCommu = null;
		try {
			inviteCommu = communityService.getInviteCommu(eno);
			result = new ResponseEntity<List<CommunityVO>>(inviteCommu, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<CommunityVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping(value="/acceptCommu",produces="text/plain;charset=utf-8")
	public ResponseEntity<String> acceptCommu(CommunityVO community){
		ResponseEntity<String> result = null;
		
		try {
			communityService.acceptCommu(community);
			result = new ResponseEntity<String>("커뮤니티의 가입 되셨습니다.", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("커뮤니티 가입 실패하였습니다.",HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping(value="/removeInviteCommu",produces="text/plain;charset=utf-8")
	public ResponseEntity<String> removeInviteCommu(CommunityVO community){
		ResponseEntity<String> result = null;
		
		try {
			communityService.removeInviteCommu(community);
			result = new ResponseEntity<String>("커뮤니티의 초대 거절하셨습니다.", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("커뮤니티 초대 거절 실패하였습니다.",HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping("/approveCommuList")
	public ResponseEntity<List<CommunityVO>> approveCommuList(int eno){
		ResponseEntity<List<CommunityVO>> result = null;
		
		List<CommunityVO> myApproveCommuList = null;
		try {
			myApproveCommuList = communityService.getMyApproveCommuList(eno);
			result = new ResponseEntity<List<CommunityVO>>(myApproveCommuList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<CommunityVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping("/bestCommuList")
	public ResponseEntity<List<CommunityVO>> bestCommuList(int eno){
		ResponseEntity<List<CommunityVO>> result = null;
		
		List<CommunityVO> bestCommuList = null;
		try {
			bestCommuList = communityService.getBestCommuList(eno);
			System.out.println("bestCommunity : " + bestCommuList);
			result = new ResponseEntity<List<CommunityVO>>(bestCommuList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<CommunityVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping(value="/removeSubCommu",produces="text/plain;charset=utf-8")
	public ResponseEntity<String> removeJoinCommu(CommunityVO community){
		ResponseEntity<String> result = null;
		
		try {
			communityService.removeSubCommu(community);
			result = new ResponseEntity<String>("가입취소 되었습니다.", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("가입취소 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping(value="/removeApproveCommu", produces="text/plain;charset=utf-8")
	public ResponseEntity<String> removeApproveCommu(String cmno){
		ResponseEntity<String> result = null;
		
		try {
			communityService.removeCommu(cmno);
			result = new ResponseEntity<String>("개설취소 되었습니다.", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("개설취소 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping(value="/insertSubCommu", produces="text/plain;charset=utf-8")
	public ResponseEntity<String> insertSubCommu(CommunityVO community){
		ResponseEntity<String> result = null;
		String check = null;
		try {
			check = communityService.insertSubCommu(community);
			result = new ResponseEntity<String>(check, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(check, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	
	@RequestMapping(value="/approveCommunity", produces="text/plain;charset=utf-8")
	public ResponseEntity<String> approveCommunity(CommunityVO community){
		ResponseEntity<String> result = null;
		
		CommuBoardVO commuBoard = new CommuBoardVO();
		commuBoard.setCbIntro("자유게시판");
		commuBoard.setCmno(community.getCmno());
		commuBoard.setCbName("자유게시판");
		commuBoard.setReplyOpen(0);
		commuBoard.setWriteOpen(0);
		try {
			communityService.approveCommunity(community.getCmno());
			communityService.insertJoinCommu(community);
			communityService.insertCommuBoard(commuBoard);
			result = new ResponseEntity<String>("개설 승인 완료 했습니다.", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("개설 승인 실패 했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping(value="/approveDeleteCommunity", produces="text/plain;charset=utf-8")
	public ResponseEntity<String> approveDeleteCommunity(String cmno){
		ResponseEntity<String> result = null;
		try {
			communityService.approveDeleteCommunity(cmno);
			result = new ResponseEntity<String>("개설 취소 완료 했습니다.", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("개설 취소 실패 했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping("/empOpenCommuList")
	public ResponseEntity<List<CommunityVO>> empOpenCommuList(int eno){
		ResponseEntity<List<CommunityVO>> result = null;
		
		List<CommunityVO> empOpenCommuList = null;
		try {
			empOpenCommuList = communityService.getEmpOpenCommuList(eno);
			result = new ResponseEntity<List<CommunityVO>>(empOpenCommuList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<CommunityVO>>(empOpenCommuList, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping("/commuBoardList")
	public ResponseEntity<List<CommuBoardVO>> commuBoardList(String cmno){
		ResponseEntity<List<CommuBoardVO>> result = null;
		
		List<CommuBoardVO> commuBoardList = null;
		try {
			commuBoardList = communityService.getCommuBoardList(cmno);
			result = new ResponseEntity<List<CommuBoardVO>>(commuBoardList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<CommuBoardVO>>(commuBoardList, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping("/joinCommuEmpList")
	public ResponseEntity<List<JoinCommuVO>> joinCommuEmpList(String cmno){
		ResponseEntity<List<JoinCommuVO>> result = null;
		
		List<JoinCommuVO> joinCommuEmpList = null;
		try {
			joinCommuEmpList = communityService.getJoinCommuEmpList(cmno);
			result = new ResponseEntity<List<JoinCommuVO>>(joinCommuEmpList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<JoinCommuVO>>(joinCommuEmpList, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping("/RecentCommuPostList")
	public ResponseEntity<List<CommupostVO>> RecentCommuPostList(String cmno){
		ResponseEntity<List<CommupostVO>> result = null;
		
		List<CommupostVO> RecentCommuPostList = null;
		try {
			RecentCommuPostList = communityService.getRecentCommuPostList(cmno);
			result = new ResponseEntity<List<CommupostVO>>(RecentCommuPostList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<CommupostVO>>(RecentCommuPostList, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping("/getEmpByNodeId.do")
	public ResponseEntity<Map<String, Object>> getEmpByNodeId(int eno, String cmno) throws Exception{
		ResponseEntity<Map<String, Object>> result = null;
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		try {
			EmployeeVO employee = workService.getEmpByNodeId(eno);
			List<JoinCommuVO> joinCommuEmpList = communityService.getJoinCommuEmpList(cmno);
			
			dataMap.put("employee", employee);
			dataMap.put("joinCommuEmpList", joinCommuEmpList);
			
			result = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;
	}
	
	@RequestMapping("/commuPostList")
	public ResponseEntity<Map<String, Object>> commuPostList(Criteria cri, String cboardNo){
		ResponseEntity<Map<String, Object>> result = null;
		
		Map<String, Object> dataMap = null;
		try {
			dataMap = communityService.getCommuPostList(cri, cboardNo);
			System.out.println(dataMap);
			result = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return result;

	}
	
	@RequestMapping("/communityInfo")
	public ResponseEntity<CommunityVO> communityInfo(String cmno){
		ResponseEntity<CommunityVO> result = null;
		
		CommunityVO community = null;
		try {
			community = communityService.getCommunity(cmno);
			String image = community.getImage().split("\\$\\$")[1];
			community.setImage(image);
			result = new ResponseEntity<CommunityVO>(community, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<CommunityVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping(value="/commuModify", produces="text/plain;charset=utf-8")
	public ResponseEntity<String> commuModify(CommunityVO community){
		
		System.out.println("CMU : " + community);
		
		
		ResponseEntity<String> result = null;
		try {
			String savePath=this.picturePath;
			savePath = savePath.replaceAll("\"", File.separator);
			MultipartFile multi = community.getImageFile();
			String fileName = null;
			if(multi.getOriginalFilename() == "") {
				CommunityVO c = communityService.getCommunity(community.getCmno());
				fileName = c.getImage();
				System.out.println("fileName :  " +  fileName);
			}else {
				fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
				File target = new File(savePath, fileName);
				target.mkdirs();
				multi.transferTo(target);
				String image = communityService.getCommunity(community.getCmno()).getImage();
				File imageFile = new File(savePath, image);
				if(imageFile.exists()) {
					imageFile.delete();
					
				}
			}
			
			
			
			
			community.setImage(fileName);
			
			communityService.updateCommunity(community);
			result = new ResponseEntity<String>("정보를 저장하였습니다.", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("정보 저장을 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping("/setCommuBoard")
	public ResponseEntity<List<CommuBoardVO>> setCommuBoard(String cmno){
		ResponseEntity<List<CommuBoardVO>> result = null;
		List<CommuBoardVO> commuBoardList = null;
		try {
			commuBoardList = communityService.getCommuBoardList(cmno);
			result = new ResponseEntity<List<CommuBoardVO>>(commuBoardList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<CommuBoardVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping(value="/boardModifyGo",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	public ResponseEntity<String> boardModifyGo(CommuBoardVO commuBoard){
		ResponseEntity<String> result = null;
		System.out.println("commuBoard :  " + commuBoard);
		try {
			communityService.updateCommuBoard(commuBoard);
			result = new ResponseEntity<String>("저장 성공", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("저장 실패",HttpStatus.INTERNAL_SERVER_ERROR);
		}
//		
		return result;
		
	}
	
	@RequestMapping(value="/boardRemoveGo",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	public ResponseEntity<String> boardRemoveGo(String cboardNo){
		ResponseEntity<String> result = null;
		try {
			communityService.deleteCommuBoard(cboardNo);
			result = new ResponseEntity<String>("삭제 성공", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("삭제 실패",HttpStatus.INTERNAL_SERVER_ERROR);
		}
//		
		return result;
		
	}
	
	@RequestMapping(value="/boardRegistGo",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	public ResponseEntity<String> boardRegistGo(CommuBoardVO commuBoard){
		ResponseEntity<String> result = null;
		try {
			communityService.insertCommuBoard(commuBoard);
			result = new ResponseEntity<String>("생성 성공", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("생성 실패",HttpStatus.INTERNAL_SERVER_ERROR);
		}
//		
		return result;
		
	}
	
	@RequestMapping("/joinCommuListInfo")
	public ResponseEntity<List<JoinCommuVO>> joinCommuListInfo(String cmno){
		ResponseEntity<List<JoinCommuVO>> result = null;
		
		List<JoinCommuVO> joinCommuEmpList = null;
		try {
			joinCommuEmpList =  communityService.getJoinCommuEmpList(cmno);
			System.out.println("joinCommuEmpList : " + joinCommuEmpList);
			result = new ResponseEntity<List<JoinCommuVO>>(joinCommuEmpList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<JoinCommuVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
//		
		return result;
		
	}
	
	@RequestMapping(value="/removeJoinCommuEmp",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	public ResponseEntity<String> removeJoinCommuEmp(@RequestParam(value="eno",required=true) List<Integer> eno, String cmno){
		ResponseEntity<String> result = null;
		try {
			for(int e : eno) {
				CommunityVO community = new CommunityVO();
				community.setEno(e);
				community.setCmno(cmno);
				communityService.removeJoinCommu(community);
			}
			
			result = new ResponseEntity<String>("탈퇴 성공", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("탈퇴 실패",HttpStatus.INTERNAL_SERVER_ERROR);
		}
//		
		return result;
		
	}
	
	@RequestMapping(value="/insertJoinCommu",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	public ResponseEntity<String> insertJoinCommu(CommunityVO community){
		ResponseEntity<String> result = null;
		
		try {
			communityService.updateJoinCommu(community);
			result = new ResponseEntity<String>("변경 성공", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("변경 실패",HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping("/getSubCommu")
	public ResponseEntity<List<SubCommuVO>> getSubCommu(String cmno){
		ResponseEntity<List<SubCommuVO>> result = null;
		
		List<SubCommuVO> subCommu = null;
		try {
			subCommu =  communityService.getSubCommu(cmno);
			result = new ResponseEntity<List<SubCommuVO>>(subCommu, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<SubCommuVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
//		
		return result;
		
	}
	
	@RequestMapping(value="/subApproval",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	public ResponseEntity<String> subApproval(CommunityVO community){
		ResponseEntity<String> result = null;
			
			community.setAuthority(0);
		try {
			communityService.removeSubCommu(community);
			communityService.insertJoinCommu(community);
			result = new ResponseEntity<String>("승인 성공", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("승인 실패",HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping(value="/subCancle",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	public ResponseEntity<String> subCancle(CommunityVO community){
		ResponseEntity<String> result = null;
		
		community.setAuthority(0);
		try {
			communityService.removeSubCommu(community);
			result = new ResponseEntity<String>("취소 성공", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>("취소 실패",HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	
	@RequestMapping("/closingCommu")
	public ResponseEntity<List<JoinCommuVO>> closingCommu(String cmno){
		ResponseEntity<List<JoinCommuVO>> result = null;
		
		List<JoinCommuVO> joinCommu = null;
		try {
			joinCommu =  communityService.getJoinCommuEmpList(cmno);
			result = new ResponseEntity<List<JoinCommuVO>>(joinCommu, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<List<JoinCommuVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
//		
		return result;
		
	}
	
	@RequestMapping(value="/getPicture",produces="text/plain;charset=utf-8")
	   public ResponseEntity<byte[]>getPicture(String cmno)throws Exception{
	      String image = communityService.getCommunity(cmno).getImage();
	      
	      InputStream in=null;
	      ResponseEntity<byte[]>entity=null;
	      String imgPath=this.picturePath;
	      
	      try {
	         in=new FileInputStream(new File(imgPath,image));
	         
	         entity=new ResponseEntity<byte[]>(IOUtils.toByteArray(in),HttpStatus.CREATED);
	      } finally  {
	         in.close();
	      }
	      return entity;
	   }
	
}
