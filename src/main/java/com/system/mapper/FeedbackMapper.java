package com.system.mapper;

import com.system.po.Feedback;
import java.util.List;

public interface FeedbackMapper {
	int update(Feedback feedback);
	int insert(Feedback record);
	Feedback selectByID(Integer id);
	List<Feedback> selectByTeacherID(Integer teacherid);
	List<Feedback> selectByStudentID(Integer studentid);
	List<Feedback> selectByCourseID(Integer courseid);
	int deleteByID(Integer id);
}