package com.tp.yogioteur.service;

import java.io.PrintWriter;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tp.yogioteur.domain.ReservationDTO;
import com.tp.yogioteur.mapper.ReservationMapper;
import com.tp.yogioteur.util.ReservationUtils;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationMapper reservationMapper;
	
	@Override
	public void payments(HttpServletRequest request, HttpServletResponse response) {
		
		String no = ReservationUtils.reservataionCode(8).trim();
		Long memberNo = Long.parseLong(request.getParameter("memberNo"));
		Long roomNo = Long.parseLong(request.getParameter("roomNo"));
		Long nonNo = 1L;
		Optional<String> optNo = Optional.ofNullable(request.getParameter("food"));
		Integer food = Integer.parseInt(optNo.orElse("0"));
		Integer people = Integer.parseInt(request.getParameter("people"));
		Optional<String> opt = Optional.ofNullable(request.getParameter("req"));
		String req = opt.orElse("요청 사항 없음");
		
		String reserNo = "RN_" + no;
		
		ReservationDTO reservation = ReservationDTO.builder()
				.reserNo(reserNo)
				.memberNo(memberNo)
				.roomNo(roomNo)
				.nonNo(nonNo)
				.reserFood(food)
				.reserPeople(people)
				.reserRequest(req)
				.build();
		
		int res = reservationMapper.reservationInsert(reservation);
		// hit 형식
		
		// 응답
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			if(res == 1) {
				out.println("<script>");
				out.println("alert('결제 완료 되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/reservation/reservationConfirm?reserNo=" + reserNo + "'");
				out.println("</script>");
				out.close();
			} else {
				out.println("<script>");
				out.println("alert('결제가 실패했습니다.')");
				out.println("history.back()");
				out.println("</script>");
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void confirms(HttpServletRequest request, Model model) {
		String no = request.getParameter("reserNo");
		
		model.addAttribute("reservation", reservationMapper.reservationSelectConfirm(no));
	}
}
