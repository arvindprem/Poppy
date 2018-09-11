package com.ipsos.poppy.calendar;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class CalendarController {
	private static final TimeZone timeZone = TimeZone.getTimeZone("UTC");
	private static final SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm'Z'");
	private static List<CalendarDto> list = new ArrayList<>();
	static {
		loadValues();
	}

	@PostMapping("/GetEvents")
	public String getEvents() throws Exception {
		System.out.println(new ObjectMapper().writeValueAsString(list));
		return new ObjectMapper().writeValueAsString(list);

	}

	@PostMapping("/EventCreator")
	public String eventCreator(@ModelAttribute CalendarDto calendar) throws ParseException {
		System.out.println(calendar);
		fmt.setTimeZone(timeZone);
		calendar.setStart(fmt.format(new Date()));
		calendar.setEnd(fmt.format(new Date()));
		calendar.setId((int) new Random().nextInt(20));
		calendar.setColor("#FFF");
		list.add(calendar);
		System.out.println(list);
		return "Success";
	}

	@PostMapping("/DeleteEvent")
	public String deleteEvent(HttpServletRequest request) {
		String isDeleted = "failed";
		for (int i = 0; i < list.size(); i++) {
			CalendarDto dto = list.get(i);
			System.out.println(request.getParameter("id"));
			;
			if (Integer.parseInt(request.getParameter("id")) == dto.getId()) {
				list.remove(i);
				isDeleted = "success";
			}
		}
		return isDeleted;
	}

	@GetMapping("/FullCalendar")
	public ModelAndView fullCallendar() {
		return new ModelAndView("FullCalender");
	}

	public static void loadValues() {
		for (int i = 0; i < 3; i++) {
			// To Recognize the Date Time in FullCalendar plugin has to use ISO Or UTC
			// Format
			fmt.setTimeZone(timeZone);
			// To ADD ONE WITH CURRENT DATE
			Date dt = new Date();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dt);
			calendar.add(Calendar.DATE, 1);
			dt = calendar.getTime();
			CalendarDto c = new CalendarDto();
			c.setId(i);
			c.setEnd(fmt.format(dt));
			c.setStart(fmt.format(dt));
			c.setTitle("Scary Night " + i);
			c.setColor("#008080");
			c.setDescription("Just Make a " + i + " View");
			list.add(c);
		}
	}
}
