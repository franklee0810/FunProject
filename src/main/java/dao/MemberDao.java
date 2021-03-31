package dao;

import bean.Member;
import bean.MyStudy;
import bean.StudyFile;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component("mdao")
public class MemberDao {
    private final String namespace = "NsMember.";

    @Autowired
    SqlSessionTemplate abcd;

    public Member selectMember(String mid, String password) {
        System.out.println(getClass() + " selectMember");
        Map<String, String> map = new HashMap<String, String>() ;
        map.put("mid", mid) ;
        map.put("password", password) ;
        return this.abcd.selectOne(namespace + "selectMember", map);
    }

    public Member selectMemberNickname(String nickname){
        System.out.println(getClass() + " selectMemberNickname");
        return this.abcd.selectOne(namespace + "selectMemberNickname", nickname);
    }

    public Member selectMemberMid(String mid) {
        System.out.println(getClass() + " selectMemberNickname");
        return this.abcd.selectOne(namespace + "selectMemberMid", mid);
    }

    public List<Member> SelectStudyMemberList(int seq_study) {
        System.out.println(getClass() + " SelectStudyMemberList");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("seq_study", seq_study);
        return this.abcd.selectList(namespace+"SelectStudyMemberList",map);
    }

    public Member SelectHostOne(int seq_study) {
        System.out.println(getClass() + " SelectHostList");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("seq_study", seq_study);
        return this.abcd.selectOne(namespace+"SelectHostList",map);
    }

    public List<Member> SelectSubscription(int seq_study) {
        System.out.println(getClass() + " SelectSubscription");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("seq_study", seq_study);
        return this.abcd.selectList(namespace+"SelectSubscription",map);
    }

    public Member selectHostMember(int seq_study) {
        System.out.println(getClass() + " selectHostMember");
        return this.abcd.selectOne(namespace + "selectHostMember", seq_study);
    }

    public void insertStudyHost(Member member, int seq_study) {
        System.out.println(getClass() + " insertStudyHost");
        Map<String, String> map = new HashMap<>();
        map.put("mid", member.getMid());
        map.put("seq_study", String.valueOf(seq_study));
        map.put("nickname", member.getNickname());

        this.abcd.insert(namespace+"insertStudyHost", map);
    }

    public void insertMemberOne(Member member){
        System.out.println(getClass() + " insertMemberOne");
        this.abcd.insert(namespace+"insertMemberOne", member);
    }

    public void updateMemberOne(Member member) {
        System.out.println(getClass() + " updateMemberOne");
        this.abcd.update(namespace+"updateMemberOne", member);
    }

    public void deleteMemberOne(String mid) {
        System.out.println(getClass() + " deleteMemberOne");
        this.abcd.delete(namespace+"deleteMemberOne", mid);
    }

    public Member selectWriterMember(String mid) {
        System.out.println(getClass() + " selectWriterMember");
        return this.abcd.selectOne(namespace+"selectWriterMember", mid);
    }
}
