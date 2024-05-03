package com.prj1.controller;

import com.prj1.domain.Board;
import com.prj1.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
public class BoardController {

    private final BoardService service;

    @GetMapping("/add")
    public String add() {
        return "board/add";
    }

    @PostMapping("/add")
    public String addPost(Board board, Authentication authentication,
                          RedirectAttributes rttr) {
        service.add(board, authentication);

        rttr.addAttribute("id", board.getId());
        return "redirect:/board";
    }

    @GetMapping("/board")
    public String view(Model model, Integer id) {
        Board board = service.get(id);

        model.addAttribute("board", board);

        return "board/view";
    }

    @GetMapping("/")
    public String home(Model model, @RequestParam(value = "page", defaultValue = "1") Integer page) {
        // 게시물 목록 조회
        model.addAllAttributes(service.list(page));

        return "board/home";
    }

    @PostMapping("delete")
    public String delete(Integer id, Authentication authentication) {
        if (service.hasAccess(id, authentication)) {
            service.remove(id);
        }

        return "redirect:/";
    }

    @GetMapping("modify")
    public String modify(Integer id, Model model) {

        model.addAttribute("board", service.get(id));

        return "board/modify";
    }

    @PostMapping("modify")
    public String modifyPost(Board board, Authentication authentication,
                             RedirectAttributes rttr) {
        if (service.hasAccess(board.getId(), authentication)) {
            service.modify(board);
        }

        rttr.addAttribute("id", board.getId());
        return "redirect:/board";
    }
}
