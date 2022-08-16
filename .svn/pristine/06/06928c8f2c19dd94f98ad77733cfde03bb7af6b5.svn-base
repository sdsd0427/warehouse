package kr.or.warehouse.controller.rest;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.josephoconnell.html.HTMLInputFilter;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.PageMaker;
import kr.or.warehouse.dto.ReplyVO;
import kr.or.warehouse.service.CommunityReplyService;
import kr.or.warehouse.service.ManualReplyService;

@RestController
@RequestMapping("/commuReplies")
public class CommunityReplyRestController {

	   @Autowired
	   private CommunityReplyService service;

	   @RequestMapping(value="/{refNo}/{page}",method=RequestMethod.GET)
	   public ResponseEntity<Map<String,Object>>replyList(@PathVariable("refNo")String refNo,@PathVariable("page")int page)throws Exception{


	      ResponseEntity<Map<String,Object>>entity=null;


	      Criteria cri=new Criteria();
	      cri.setPage(page);

	      Map<String,Object>dataMap=service.getReplyList(refNo, cri);
	      System.out.println(dataMap);
	      entity=new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);

	      return entity;
	   }

	   @RequestMapping(value="",method=RequestMethod.POST)
	   public ResponseEntity<String>register(@RequestBody ReplyVO reply)throws Exception{

	      ResponseEntity<String>entity=null;

	      reply.setReplyText(HTMLInputFilter.htmlSpecialChars(reply.getReplyText()));

	      service.registReply(reply);

	      Criteria cri=new Criteria();

	      Map<String,Object>dataMap=service.getReplyList(reply.getRefNo(),cri);
	      PageMaker pageMaker=(PageMaker)dataMap.get("pageMaker");
	      int realEndPage=pageMaker.getRealEndPage();

	      entity=new ResponseEntity<String>(realEndPage+"",HttpStatus.OK);

	      return entity;

	   }
	   @RequestMapping(value="/{rno}",method= {RequestMethod.PUT,RequestMethod.PATCH})
	   public ResponseEntity<String>modify(@PathVariable("rno")String rno,@RequestBody ReplyVO reply)throws Exception{
	      ResponseEntity<String>entity=null;

	      reply.setRno(rno);

	      service.modifyReply(reply);
	      entity=new ResponseEntity<String>(HttpStatus.OK);

	      return entity;


	   }

	   @RequestMapping(value="/{refNo}/{rno}/{page}",method=RequestMethod.DELETE)
	   public ResponseEntity<String>remove(@PathVariable("rno")String rno,@PathVariable("refNo")String refNo,@PathVariable("page")int page)throws Exception{
	      ResponseEntity<String>entity=null;

	      service.removeReply(rno);

	      Criteria cri=new Criteria();

	      Map<String,Object>dataMap=service.getReplyList(refNo, cri);
	      PageMaker pageMaker=(PageMaker)dataMap.get("pageMaker");

	      int realEndPage=pageMaker.getRealEndPage();
	      if(page>realEndPage) {
	         page=realEndPage;
	      }

	      entity=new ResponseEntity<String>(""+page,HttpStatus.OK);

	      return entity;

	   }
}
