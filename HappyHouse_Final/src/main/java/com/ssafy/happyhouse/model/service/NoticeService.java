package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.Board;
import com.ssafy.happyhouse.model.Notice;

public interface NoticeService {
	public List<Board> retrieveBoard();
	public Board detailBoard(int no);
	public boolean writeBoard(Board board);
	public boolean updateBoard(Board board);
	public boolean deleteBoard(int no);
}
