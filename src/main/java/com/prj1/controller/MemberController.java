package com.prj1.controller;

import com.prj1.domain.Member;
import com.prj1.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("member")
public class MemberController {
    private final MemberService service;

    @GetMapping("signup")
    public String signupForm() {
        return "member/signup";
    }

    @PostMapping("signup")
    public String signup(Member member) {
        service.signup(member);
        return "redirect:/member/list";
    }

    @GetMapping("list")
    public String list(Model model) {
        model.addAttribute("memberList", service.list());
        return "member/list";
    }

    @GetMapping("")
    public String info(Integer id, Model model) {
        model.addAttribute("member", service.get(id));
        return "member/info";
    }

    @PostMapping("remove")
    public String remove(Integer id) {
        service.remove(id);
        return "redirect:/member/list";
    }

    @GetMapping("modify")
    public String modifyForm(Integer id, Model model) {

        model.addAttribute("member", service.get(id));

        return "member/modify";
    }

    @PostMapping("modify")
    public String modify(Member member, RedirectAttributes rttr) {
        service.modify(member);

        rttr.addAttribute("id", member.getId());
        return "redirect:/member";
    }

    @GetMapping("email")
    // 응답한 데이터를 view로 해석하지 않음
    @ResponseBody
    public String emailCheck(String email) {
        String message = service.emailCheck(email);
        return message;
    }
}
