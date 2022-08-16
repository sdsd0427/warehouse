package kr.or.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.warehouse.dto.AttachVO;

@Repository
public class ManualAttachDAOImpl implements ManualAttachDAO{

	@Autowired
	SqlSession session;

	@Override
	public List<AttachVO> selectManualAttachesByManualNo(String refNo) throws SQLException {
		return session.selectList("ManualAttach-Mapper.selectManualAttachByManualNo",refNo);
	}

	@Override
	public AttachVO selectManualAttachByMaNo(String attachNo) throws SQLException {
		return session.selectOne("ManualAttach-Mapper.selectManualAttachByMaNo",attachNo);
	}

	@Override
	public void insertManualAttach(AttachVO attach) throws SQLException {
		session.update("ManualAttach-Mapper.insertManualAttach",attach);
	}

	@Override
	public void deleteManualAttach(String attachNo) throws SQLException {
		session.update("ManualAttach-Mapper.deleteManualAttach",attachNo);

	}

	@Override
	public void deleteAllManualAttach(String refNo) throws SQLException {
		session.update("ManualAttach-Mapper.deleteAllManualAttach",refNo);
	}

	@Override
	public String selectMaNo() throws SQLException {
		return session.selectOne("ManualAttach-Mapper.selectMaNo");
	}
}
