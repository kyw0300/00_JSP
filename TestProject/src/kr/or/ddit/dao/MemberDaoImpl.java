package kr.or.ddit.dao;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisSqlSessionFactory;
import kr.or.ddit.vo.MemberVO;

public class MemberDaoImpl implements IMemberDao {
	private static IMemberDao instance;
	private MemberDaoImpl() {}
	
	// 싱글톤
	public static IMemberDao getInstance() {
		if(instance == null) instance = new MemberDaoImpl();
		return instance;
	}
	
	@Override
	public int insertMember(MemberVO memberVO) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("member.insertMember",memberVO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		SqlSession session = null;
		MemberVO memVO = null;
		
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			memVO = session.selectOne("member.selectMember",memberVO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return memVO;
	}

}
