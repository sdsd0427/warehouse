package kr.or.warehouse.controller.rest;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.warehouse.command.MakeFileName;
import kr.or.warehouse.dto.AttachVO;

public class GetAttachesByMultipartFileAdatpter {
	public static List<AttachVO> save(List<MultipartFile>multiFiles, String savaPath)throws Exception{
		List<AttachVO> attachList = new ArrayList<AttachVO>();

		//저장 -> attachVO -> list.do
		if(multiFiles!=null) {
			for(MultipartFile multi : multiFiles) {
				String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
				File target = new File(savaPath, fileName);
				target.mkdirs();
				multi.transferTo(target);

				AttachVO attach = new AttachVO();
				attach.setUploadPath(savaPath);
				attach.setFileName(fileName);
				attach.setFileType(fileName.substring(fileName.lastIndexOf('.')+1).toUpperCase());
				attachList.add(attach);
			}
		}
		return attachList;
	}
}
