package com.kg.library.member;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberService {
	@Autowired private IMemberMapper mapper;
	@Autowired private HttpSession session;
	@Value("${coolsms.apikey}")
    private String apiKey;

    @Value("${coolsms.apisecret}")
    private String apiSecret;

    @Value("${coolsms.fromnumber}")
    private String fromNumber;
	
	public String agreeProc(MemberDTO member) {
		if(member.getId() == null || member.getId().trim().isEmpty()) {
			return "아이디를 입력하세요.";
		}
		if(member.getPw() == null || member.getPw().trim().isEmpty()) {
			return "비밀번호를 입력하세요.";
		}
		if(member.getPw().equals(member.getConfirm()) == false) {
			return "두 비밀번호를 일치하여 입력하세요.";
		}
		if(member.getName() == null || member.getName().trim().isEmpty()) {
			return "이름을 입력하세요.";
		}
		
		MemberDTO check = mapper.login(member.getId());
		if(check != null) {
			return "이미 사용중인 아이디 입니다.";
		}
		
		/* 암호화 과정 */
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String secretPass = encoder.encode(member.getPw());
		member.setPw(secretPass);
		
		int result = mapper.agreeProc(member);
		if(result == 1)
			return "회원 등록 완료";
		
		return "회원 등록을 다시 시도하세요.";
	}
	
	
	public String loginProc(String id, String pw) {
		if(id == null || id.trim().isEmpty()) {
			return "아이디를 입력하세요.";
		}
		if(pw == null || pw.trim().isEmpty()) {
			return "비밀번호를 입력하세요.";
		}
		
		MemberDTO check = mapper.login(id);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(check != null && encoder.matches(pw, check.getPw()) == true) {
			session.setAttribute("id", check.getId());
			session.setAttribute("name", check.getName());
			session.setAttribute("address", check.getAddress());
			session.setAttribute("tel", check.getTel());
			return "로그인 성공";
		}
		
		return "아이디 또는 비밀번호를 확인 후 다시 입력하세요.";
	}
	
	public void certifiedPhoneNumber(String mobile, String numStr) {
        Message coolsms = new Message(apiKey, apiSecret);
 
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", mobile);    
        params.put("from", fromNumber);   
        params.put("type", "SMS");
        params.put("text", "["+numStr+"]");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
	}
}
