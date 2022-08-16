package kr.or.warehouse.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.command.PageMaker;
import kr.or.warehouse.dao.MailAttachDAO;
import kr.or.warehouse.dao.MailDAO;
import kr.or.warehouse.dto.AttachVO;
import kr.or.warehouse.dto.MailVO;
import kr.or.warehouse.dto.MtoVO;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private MailDAO mailDAO;

	@Autowired
	private MailAttachDAO mailAttachDAO;

	@Override
	public Map<String, Object> getMailList(Criteria cri, int eno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);

		// List에 name을 하나씩 넣어
		List<MailVO> mailList = mailDAO.selectMailList(paramMap, rowBounds);
		for (MailVO mail : mailList) {
			String name = mailDAO.selectName(mail.getMailNo());
			mail.setName(name);
			mail.setMtoList(mailDAO.selectMtoList(mail.getMailNo()));
		}

		if (mailList != null)
			for (MailVO mail : mailList)
				addMailAttachList(mail);

		// 안읽은메일 개수
		int totalCount = mailDAO.selectMailListCount(paramMap);
		int noReadCount = mailDAO.selectNoReadMailCriteriaTotalCount(paramMap);

		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("mailList", mailList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("noReadCount", noReadCount);

		return dataMap;
	}

	@Override
	public Map<String, Object> getSendMailList(Criteria cri, int eno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);

		// List에 name을 하나씩 넣어
		List<MailVO> sendMailList = mailDAO.selectSendMailList(paramMap, rowBounds);
		for (MailVO mail : sendMailList) {
			String name = mailDAO.selectName(mail.getMailNo());
			List<MtoVO> mtoList = mailDAO.selectReceiver(mail.getMailNo());
			mail.setName(name);
			mail.setMtoList(mtoList);
//			System.out.println(mtoList);
		}

		if (sendMailList != null)
			for (MailVO mail : sendMailList)
				addMailAttachList(mail);

		// 안읽은메일 개수
		int totalCount = mailDAO.selectSendMailCriteriaTotalCount(paramMap);

		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("sendMailList", sendMailList);
		dataMap.put("pageMaker", pageMaker);

//		System.out.println(dataMap.get("sendMailList"));
		return dataMap;
	}

	@Override
	public Map<String, Object> getImporMailList(Criteria cri, int eno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);

		// List에 name을 하나씩 넣어
		List<MailVO> imporMailList = mailDAO.selectImporMailList(paramMap, rowBounds);
		for (MailVO mail : imporMailList) {
			String name = mailDAO.selectName(mail.getMailNo());
			mail.setName(name);
			mail.setMtoList(mailDAO.selectMtoList(mail.getMailNo()));
		}
		System.out.println("imporMailList : " + imporMailList);

		if (imporMailList != null)
			for (MailVO mail : imporMailList)
				addMailAttachList(mail);

		// 안읽은메일 개수
		int totalCount = mailDAO.selectImporMailCriteriaTotalCount(paramMap);
		int noReadCount = mailDAO.selectNoReadImporMailCriteriaTotalCount(paramMap);

		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("imporMailList", imporMailList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("noReadCount", noReadCount);

		return dataMap;
	}

	@Override
	public Map<String, Object> getTrashMailList(Criteria cri, int eno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);

		// List에 name을 하나씩 넣어
		List<MailVO> trashMailList = mailDAO.selectTrashMailList(paramMap, rowBounds);
		for (MailVO mail : trashMailList) {
			String name = mailDAO.selectName(mail.getMailNo());
			mail.setName(name);
//			mail.setMtoList(mailDAO.selectMtoList(mail.getMailNo()));

			// mtolist에 mto를 담아서
			List<MtoVO> mtoList = new ArrayList<MtoVO>();

			// mailNo로 mto가져오기
			mtoList = mailDAO.selectMtoList(mail.getMailNo());

			if (mtoList != null)
				for (MtoVO temp : mtoList) {
					String receiver = mailDAO.selectNameByEno(temp.getEno());
					temp.setName(receiver);
				}
			mail.setMtoList(mtoList);
		}

		if (trashMailList != null)
			for (MailVO mail : trashMailList)
				addMailAttachList(mail);

		int totalCount = mailDAO.selectTrashMailCriteriaTotalCount(paramMap);

		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("trashMailList", trashMailList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getToMeMailList(Criteria cri, int eno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);

		// List에 name을 하나씩 넣어
		List<MailVO> toMeMailList = mailDAO.selectToMeMailList(paramMap, rowBounds);
		for (MailVO mail : toMeMailList) {
			String name = mailDAO.selectName(mail.getMailNo());
			mail.setName(name);
			mail.setMtoList(mailDAO.selectMtoList(mail.getMailNo()));
		}

		if (toMeMailList != null)
			for (MailVO mail : toMeMailList)
				addMailAttachList(mail);

		// 안읽은메일 개수
		int totalCount = mailDAO.selectToMeMailCriteriaTotalCount(paramMap);
		int noReadCount = mailDAO.selectNoReadToMeMailCriteriaTotalCount(paramMap);

		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("toMeMailList", toMeMailList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("noReadCount", noReadCount);

		return dataMap;
	}

	@Override
	public Map<String, Object> getTempMailList(Criteria cri, int eno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchType", cri.getSearchType());
		paramMap.put("keyword", cri.getKeyword());
		paramMap.put("eno", eno);

		// List에 name을 하나씩 넣어
		List<MailVO> tempMailList = mailDAO.selectTempMailList(paramMap, rowBounds);
		for (MailVO mail : tempMailList) {
			String name = mailDAO.selectName(mail.getMailNo());
			List<MtoVO> mtoList = mailDAO.selectReceiver(mail.getMailNo());
			mail.setName(name);
			mail.setMtoList(mtoList);
		}

		if (tempMailList != null)
			for (MailVO mail : tempMailList)
				addMailAttachList(mail);

		// 안읽은메일 개수
		int totalCount = mailDAO.selectTempMailCriteriaTotalCount(paramMap);

		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("tempMailList", tempMailList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void regist(MailVO mail, List<Integer> receiver) throws SQLException {
		String mailNo = mailDAO.selectMailNo();
		// mailVO에 set
		mail.setMailNo(mailNo);

		// DB에 mail insert
		mailDAO.insertMail(mail);

		// mto에 eno set
		MtoVO mto = null;

		// 수신자 여러 명일 때 반복시작
		if (receiver != null)
			for (int rec : receiver) {
				mto = new MtoVO();
				mto.setEno(rec);
				mto.setMailNo(mailNo);
				mailDAO.insertMto(mto);
			}
		// 반복 종료

		if (mail.getAttachList() != null)
			for (AttachVO attach : mail.getAttachList()) {
				String attachNo = mailAttachDAO.selectMaNo();
				attach.setAttachNo(attachNo);
				attach.setRefNo(mailNo);
				mailAttachDAO.insertMailAttach(attach);
			}
	}

	@Override
	public void registTemp(MailVO mail, List<Integer> receiver) throws SQLException {
		String mailNo = mailDAO.selectMailNo();
		// mailVO에 set
		mail.setMailNo(mailNo);

		// DB에 mail insert
		mailDAO.insertTempMail(mail);

		// mto에 eno set
		MtoVO mto = null;

		// 수신자 여러 명일 때 반복시작
		if (receiver != null)
			for (int rec : receiver) {
				mto = new MtoVO();
				mto.setEno(rec);
				mto.setMailNo(mailNo);
				mailDAO.insertMto(mto);
			}
		// 반복 종료

		if (mail.getAttachList() != null)
			for (AttachVO attach : mail.getAttachList()) {
				String attachNo = mailAttachDAO.selectMaNo();
				attach.setAttachNo(attachNo);
				attach.setRefNo(mailNo);
				mailAttachDAO.insertMailAttach(attach);
			}
	}

	@Override
	public AttachVO getMailAttachByMaNo(String AttachNo) throws SQLException {
		return mailAttachDAO.selectMailAttachByMaNo(AttachNo);
	}

	@Override
	public void removeMailAttachByMaNo(String maNo) throws SQLException {
		mailAttachDAO.deleteMailAttach(maNo);
	}

	@Override
	public void addMailAttachList(MailVO mail) throws SQLException {
		if (mail == null)
			return;

		String mailNo = mail.getMailNo();
		List<AttachVO> attachList = mailAttachDAO.selectMailAttachesByMailNo(mailNo);

		mail.setAttachList(attachList);
	}

	@Override
	public MailVO getMail(String mailNo) throws SQLException {
		MailVO mail = mailDAO.selectMailByMailNo(mailNo);
		String name = mailDAO.selectName(mail.getMailNo());
		mail.setName(name);

		// mtolist에 mto를 담아서
		List<MtoVO> mtoList = new ArrayList<MtoVO>();

		// mailNo로 mto가져오기
		mtoList = mailDAO.selectMtoList(mailNo);

		if (mtoList != null)
			for (MtoVO temp : mtoList) {
				String receiver = mailDAO.selectNameByEno(temp.getEno());
				temp.setName(receiver);
			}
		mail.setMtoList(mtoList);

		// 첨부파일
		addMailAttachList(mail);

		return mail;
	}

	@Override
	public void imporUpdate(MailVO mail) throws SQLException {
		mailDAO.updateMailImportant(mail);
	}

	@Override
	public void imporCancelUpdate(MailVO mail) throws SQLException {
		mailDAO.updateMailImportantCancel(mail);
	}

	@Override
	public void imporMtoUpdate(MtoVO mto) throws SQLException {
		mailDAO.updateMtoImportant(mto);
	}

	@Override
	public void imporMtoCancelUpdate(MtoVO mto) throws SQLException {
		mailDAO.updateMtoImportantCancel(mto);
	}

	@Override
	public void trashUpdate(MailVO mail) throws SQLException {
		mailDAO.updateMailTrash(mail);
	}

	@Override
	public void trashRevertUpdate(MailVO mail) throws SQLException {
		mailDAO.updateMailTrashRevert(mail);
	}

	@Override
	public void trashMtoDelUpdate(MtoVO mto) throws SQLException {
		mailDAO.updateMailTrashMtoDel(mto);
	}

	@Override
	public void trashMFromDelUpdate(MailVO mail) throws SQLException {
		mailDAO.updateMailTrashMFromDel(mail);
	}

	@Override
	public void mailMtoCheck(MailVO mail) throws SQLException {
		mailDAO.updateMailMtoCheck(mail);
	}

	@Override
	public void updateMailMtoCheckByChecked(MtoVO mto) throws SQLException {
		mailDAO.updateMailMtoCheckByChecked(mto);
	}

	@Override
	public int selectNoReadMailListCount(int eno) throws SQLException {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("eno", eno);

		int noReadCount = mailDAO.selectNoReadMailCriteriaTotalCount(paramMap);

		return noReadCount;
	}

}
