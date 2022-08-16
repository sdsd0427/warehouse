package kr.or.warehouse.controller.view;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.dto.PdsNode;
import kr.or.warehouse.dto.PdsVO;
import kr.or.warehouse.service.PdsService;

@Controller
@RequestMapping("/pds")
public class PdsController {
	
	@Autowired
	private PdsService pdsService;
	
	@RequestMapping("/main")
	public ModelAndView main(ModelAndView mnv, HttpSession session) throws Exception {
		String url = "pds/main";
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
		List<PdsVO> pdsListForTree = pdsService.getPdsListForTree(loginUser.getEno());
		List<PdsNode> pdsExplorer = pdsService.pdsExplorer(pdsListForTree);
		
		mnv.addObject("pdsListForTree", pdsListForTree);
		mnv.addObject("pdsExplorer", pdsExplorer);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping("/allEmpPds")
	public ModelAndView allEmpPds(ModelAndView mnv, HttpSession session) throws Exception {
		String url = "pds/allEmpPds";
		
		
		List<PdsVO> pdsListForTree = pdsService.getAllEmpPdsListForTree();
//		System.out.println("pdsListForTree : "+pdsListForTree);
		List<PdsNode> pdsExplorer = pdsService.pdsExplorer(pdsListForTree);
//		System.out.println("pdsExplorer : "+pdsExplorer);
		
		mnv.addObject("pdsListForTree", pdsListForTree);
		mnv.addObject("pdsExplorer", pdsExplorer);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/trash")
	public ModelAndView trash(ModelAndView mnv, HttpSession session) throws Exception {
		String url = "pds/trash";
		
		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
		
		List<PdsVO> pdsListForTree = pdsService.getTrashPdsListForTree(loginUser.getEno());
		List<PdsNode> pdsExplorer = pdsService.pdsExplorer(pdsListForTree);
		
		mnv.addObject("pdsListForTree", pdsListForTree);
		mnv.addObject("pdsExplorer", pdsExplorer);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value ="/downloadByPno")
	public String downloadByPno(String pno, HttpServletRequest request, Model model)throws Exception{
		String url="downloadFile";

		PdsVO pds = pdsService.getPdsByPno(pno);

	    model.addAttribute("savedPath",pds.getUploadPath());
	    model.addAttribute("fileName",pds.getFileName());

	    return url;
	}
	
	@RequestMapping(value = "/downloadZipFile.do")
	public void downloadZipFile(@RequestParam("bbsId") String bbsId, @RequestParam("atchmnflId") String atchmnflId, HttpServletResponse response) {
//
//	    response.setStatus(HttpServletResponse.SC_OK);
//	    response.setContentType("application/zip");
//	    response.addHeader("Content-Disposition", "attachment; filename=\"allToOne.zip\"");
//
//	    FileOutputStream fos = null;
//	    ZipOutputStream zipOut = null;
//	    FileInputStream fis = null;
//
//	    try {
//	        zipOut = new ZipOutputStream(response.getOutputStream());
//
//		// DB에 저장되어 있는 파일 목록을 읽어온다.
//	        List<CmmnNttAtflDtlVO> atchmnFileInfoList = bbsService.atchmnFlList(atchmnflId);
//
//		// 실제 Server에 파일들이 저장된 directory 경로를 구해온다.
//	        String filePath = BbsInfoFinder.mapFileLoadPath(bbsId);
//
//		// File 객체를 생성하여 List에 담는다.
//	        List<File> fileList = atchmnFileInfoList.stream().map(fileInfo -> {
//	            return new File(filePath + "/" + fileInfo.getStreFileNm());
//	        }).collect(Collectors.toList());
//
//		// 루프를 돌며 ZipOutputStream에 파일들을 계속 주입해준다.
//	        for(File file : fileList) {
//	            zipOut.putNextEntry(new ZipEntry(file.getName()));
//	            fis = new FileInputStream(file);
//
//	            StreamUtils.copy(fis, zipOut);
//
//	            fis.close();
//	            zipOut.closeEntry();
//	        }
//
//	        zipOut.close();
//
//	    } catch (IOException e) {
//	        System.out.println(e.getMessage());
//	        try { if(fis != null)fis.close(); } catch (IOException e1) {System.out.println(e1.getMessage());/*ignore*/}
//	        try { if(zipOut != null)zipOut.closeEntry();} catch (IOException e2) {System.out.println(e2.getMessage());/*ignore*/}
//	        try { if(zipOut != null)zipOut.close();} catch (IOException e3) {System.out.println(e3.getMessage());/*ignore*/}
//	        try { if(fos != null)fos.close(); } catch (IOException e4) {System.out.println(e4.getMessage());/*ignore*/}
//	    }
	}
	
}
