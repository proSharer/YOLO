package com.yolo.trip.web;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.yolo.common.web.DownloadUtil;
import com.yolo.common.web.ListPageExplorer;
import com.yolo.common.web.PageExplorer;
import com.yolo.common.web.checker.ExtFilter;
import com.yolo.common.web.checker.ExtensionFilter;
import com.yolo.common.web.checker.ExtensionFilterFactory;
import com.yolo.daily.vo.DailyVO;
import com.yolo.region.vo.RegionVO;
import com.yolo.trip.service.TripService;
import com.yolo.trip.vo.TripListVO;
import com.yolo.trip.vo.TripSearchVO;
import com.yolo.trip.vo.TripVO;
import com.yolo.trippart.vo.TripPartVO;
import com.yolo.tripreply.vo.TripReplyVO;
import com.yolo.user.vo.UserVO;

@Controller
public class TripController {
	// private Logger logger = LoggerFactory.getLogger(TripController.class);
	private TripService tripService;

	public void setTripService(TripService tripService) {
		this.tripService = tripService;
	}

	@RequestMapping("/trip/list/init")
	public String viewInitListPage(HttpSession session) {

		session.removeAttribute("_SEARCH_");
		return "redirect:/trip/list";

	}

	@RequestMapping("/trip/list")
	public ModelAndView viewListPage(TripSearchVO tripSearchVO, HttpSession session) {

		// 페이지 정보가 없이 들어왔다면
		if (tripSearchVO.getPageNo() == null || tripSearchVO.getPageNo().length() == 0) {
			TripSearchVO tripSearchVOInSession = (TripSearchVO) session.getAttribute("_SEARCH_");

			if (tripSearchVOInSession != null) {
				tripSearchVO = tripSearchVOInSession;
			}
		}

		Map<String, Object> map = tripService.selectAllTrips(tripSearchVO);
		TripListVO tripList = (TripListVO) map.get("tripList");
		List<RegionVO> regionList = (List<RegionVO>) map.get("regionList");

		session.setAttribute("_SEARCH_", tripSearchVO);
		UserVO user = (UserVO) session.getAttribute("_USER_");
		ModelAndView view = new ModelAndView();

		PageExplorer pageExplorer = new ListPageExplorer(tripList.getPager());
		String pager = pageExplorer.getPagingList("pageNo", " @ ", "이전", "다음", "searchForm");

		view.setViewName("trip/list");
		view.addObject("tripList", tripList);
		view.addObject("regionList", regionList);
		view.addObject("pager", pager);
		view.addObject("user", user);

		return view;

	}

	@RequestMapping(value = "/trip/write", method = RequestMethod.GET)
	public String viewWritePage() {

		return "trip/write";

	}

	@RequestMapping(value = "/trip/write", method = RequestMethod.POST)
	public String insertNewTripPart(HttpServletRequest request, TripVO tripVO) {

		System.out.println(tripVO.getTripPartVO().get(0).getX());
		System.out.println(tripVO.getTripPartVO().get(0).getY());
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("_USER_");

		String userId = userVO.getUserId();
		tripVO.setUserId(userId);

		for (int i = 0; i < tripVO.getTripPartVO().size(); i++) {

			System.out.println(tripVO.getTripPartVO().get(i).getPlace());
			MultipartFile file = tripVO.getTripPartVO().get(i).getFile();

			if (!file.isEmpty() && file.getSize() > 0) {
				String fileName = file.getOriginalFilename();

				String filePath = "D:\\yoloImg\\" + fileName;
				File newFile = new File(filePath);

				try {
					file.transferTo(newFile);
					ExtensionFilter filter = ExtensionFilterFactory.getFilter(ExtFilter.APACHE_TIKA);
					boolean isImage = filter.doFilter(newFile.getAbsolutePath(), "image/gif", "image/jpeg", "image/png",
							"image/bmp");

					if (!isImage) {
						newFile.delete();
						tripVO.getTripPartVO().get(i).setFileName("");
					} else {
						tripVO.getTripPartVO().get(i).setFileName(fileName);

					}
				} catch (IllegalStateException e) {
					throw new RuntimeException(e.getMessage(), e);
				} catch (IOException e) {
					throw new RuntimeException(e.getMessage(), e);
				}

			}
		}

		boolean isSuccess = tripService.addNewOneTrip(tripVO);

		if (isSuccess) {
			return "redirect:/trip/list";
		} else {
			return "redirect:/trip/write";
		}

	}

	@RequestMapping("/trip/detail/{tripId}")
	public ModelAndView viewDetailPage(@PathVariable String tripId, HttpSession session) {

		UserVO userVO = (UserVO) session.getAttribute("_USER_");

		ModelAndView view = new ModelAndView();

		TripVO tripVO = tripService.selectOneTrip(tripId);

		Map<String, Object> map = tripService.selectTripPartByTripId(tripId, userVO);

		boolean like = (boolean) map.get("like");
		List<TripReplyVO> tripReply = (List<TripReplyVO>) map.get("tripReplyVO");

		view.setViewName("/trip/detail");
		view.addObject("like", like);
		view.addObject("tripVO", tripVO);
		view.addObject("tripReply", tripReply);
		view.addObject("tripPartSize", tripVO.getTripPartVO().size());

		return view;

	}

	@RequestMapping("/trip/delete/{tripId}")
	public String doDeletePage(@PathVariable String tripId) {

		boolean isSuccess = tripService.removeTrip(tripId);

		if (isSuccess) {
			return "redirect:/trip/list";
		} else {
			return "redirect:/trip/detail" + tripId;
		}

	}

	@RequestMapping(value = "/trip/update/{tripId}", method = RequestMethod.GET)
	public ModelAndView viewUpdatePage(@PathVariable String tripId) {
		ModelAndView view = new ModelAndView();

		TripVO tripVO = tripService.selectOneTrip(tripId);

		view.setViewName("/trip/update");
		view.addObject("tripVO", tripVO);

		return view;

	}

	@RequestMapping(value = "/trip/update/{tripId}", method = RequestMethod.POST)
	public String doUpdatePage(TripVO tripVO, @PathVariable String tripId, HttpSession session) {
		System.out.println("dafasdfasdff");
		UserVO user = (UserVO) session.getAttribute("_USER_");

		tripVO.setUserId(user.getUserId());
		tripVO.setTripId(tripId);

		List<TripPartVO> tripPartList = tripVO.getTripPartVO();
		System.out.println("size==="+tripPartList.size());
		// 파일 수정 부분 파일 setting..
		for (TripPartVO tripPartVO : tripPartList) {
			if (!tripPartVO.getFile().isEmpty() || tripPartVO.getFile().getSize() > 0) {

				String fileName = tripPartVO.getFile().getOriginalFilename();

				String filePath = "D:\\yoloImg\\" + fileName;
				File newFile = new File(filePath);

				try {
					tripPartVO.getFile().transferTo(newFile);
					ExtensionFilter filter = ExtensionFilterFactory.getFilter(ExtFilter.APACHE_TIKA);
					boolean isImage = filter.doFilter(newFile.getAbsolutePath(), "image/gif", "image/jpeg", "image/png",
							"image/bmp");

					if (!isImage) {
						newFile.delete();
						tripPartVO.setFileName("");
					} else {
						tripPartVO.setFileName(fileName);

					}
				} catch (IllegalStateException e) {
					throw new RuntimeException(e.getMessage(), e);
				} catch (IOException e) {
					throw new RuntimeException(e.getMessage(), e);
				}
			}
		}

		boolean isSuccess = tripService.modifyOneTrip(tripVO);

		if (isSuccess) {
			return "redirect:/trip/detail/" + tripVO.getTripId();
		} else {
			return "redirect:/trip/update/" + tripVO.getTripId();
		}

	}

	@RequestMapping(value = "/trip/likeCountPlus", method = RequestMethod.POST)
	@ResponseBody
	public String dolikeCountPlus(HttpServletRequest request) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("_USER_");

		String userId = userVO.getUserId();

		String tripId = request.getParameter("tripId");
		boolean isSuccess = tripService.tripLikeCountPlus(tripId, userId);

		Map<String, Object> map = new HashMap<String, Object>();
		int likeCount = tripService.selectOneTrip(tripId).getLikeCount();
		if (isSuccess) {
			map.put("status", "success");
			map.put("likeCount", likeCount);
		} else {
			map.put("status", "fail");
		}
		Gson gson = new Gson();
		String json = gson.toJson(map);

		return json;
	}

	@RequestMapping(value = "/trip/likeCountMinus", method = RequestMethod.POST)
	@ResponseBody
	public String dolikeCountMinus(HttpServletRequest request) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("_USER_");

		String userId = userVO.getUserId();

		String tripId = request.getParameter("tripId");
		boolean isSuccess = tripService.tripLikeCountMinus(tripId, userId);

		Map<String, Object> map = new HashMap<String, Object>();
		int likeCount = tripService.selectOneTrip(tripId).getLikeCount();
		if (isSuccess) {
			map.put("status", "success");
			map.put("likeCount", likeCount);
		} else {
			map.put("status", "fail");
		}
		Gson gson = new Gson();
		String json = gson.toJson(map);

		return json;
	}

	@RequestMapping(value = "/trip/reply/write", method = RequestMethod.POST)
	@ResponseBody
	public String doAddNewOneReply(HttpServletRequest request) {

		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("_USER_");

		String userId = userVO.getUserId();

		String content = request.getParameter("content");
		String tripId = request.getParameter("tripId");
		String parentReplyId = request.getParameter("parentReplyId");

		TripReplyVO tripReplyVO = new TripReplyVO();
		tripReplyVO.setContent(content);
		tripReplyVO.setUserId(userId);
		tripReplyVO.setTripId(tripId);

		if (parentReplyId == "") {
			tripReplyVO.setParentReplyId("");
		} else {
			tripReplyVO.setParentReplyId(parentReplyId);
		}

		Map<String, Object> map = new HashMap<String, Object>();

		boolean isSuccess = tripService.tripAddNewReply(tripReplyVO);
		System.out.println(isSuccess);
		if (isSuccess) {
			map.put("status", "success");
		} else {
			map.put("status", "fail");
		}
		Gson gson = new Gson();
		String json = gson.toJson(map);

		return json;
	}

	@RequestMapping(value = "/trip/download/{id}")
	public void downloadListImg(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) {

		String filePath = "D:\\yoloImg\\";
		TripPartVO tripPart = (TripPartVO) tripService.selectOneTrip(id).getTripPartVO().get(0);
		String realFileName = tripPart.getFileName();

		DownloadUtil downloadUtil = DownloadUtil.getInstance(filePath);

		try {
			downloadUtil.download(request, response, realFileName, realFileName);

		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e.getMessage(), e);
		}

	}

	@RequestMapping(value = "/trip/detail/download/{id}")

	public void downloadDetailImg(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) {

		String filePath = "D:\\yoloImg\\";
		TripPartVO tripPart = (TripPartVO) tripService.selectOneTripPart(id);
		String realFileName = tripPart.getFileName();

		DownloadUtil downloadUtil = DownloadUtil.getInstance(filePath);

		try {
			downloadUtil.download(request, response, realFileName, realFileName);

		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e.getMessage(), e);
		}

	}

}
