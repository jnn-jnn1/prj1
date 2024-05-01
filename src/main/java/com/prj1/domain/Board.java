package com.prj1.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Board {
    private String title;
    private String content;
    private String writer;
    private Integer id;
    private LocalDateTime inserted;
}
