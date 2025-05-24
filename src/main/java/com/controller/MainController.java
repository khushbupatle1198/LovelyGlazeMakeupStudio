package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.model.BannerModel;
import com.model.GalleryCategory;
import com.model.LoginModel;
import com.model.MakeupGalleryModel;
import com.model.RentalBookingModel;
import com.model.RentalGalleryModel;
import com.model.RentalInquiryModel;
import com.model.ReviewModel;
import com.model.ServiceBookingModel;
import com.model.ServiceInquiryModel;
import com.model.ServiceModel;
import com.service.EmailService;
import com.service.RentService;


@Controller
public class MainController {

	@Autowired  RentService rentservice;
	
	@Autowired EmailService emailservice;
	
	@RequestMapping("/")
	public String root() {
	    return "redirect:/indexview"; // default page when accessing "/"
	}
	
	@RequestMapping("/home")
    public String home() {
        return "redirect:/indexview"; // maps to home.jsp
    }
    
    @RequestMapping("/about")
    public String about() {
        return "about"; // maps to about.jsp
    }
    
    @RequestMapping("/gallery")
    public String gallery() {
        return "redirect:/fullgallery"; // maps to gallery.jsp
    }
    
    @RequestMapping("/contact")
    public String contact() {
        return "contact"; // maps to contact.jsp
    }
    
    @RequestMapping("/services")
    public String services() {
        return "redirect:/getservices"; // maps to services.jsp
    }
    
    @RequestMapping("/getservices")
    public String showServices(Model model) {
        List<ServiceModel> list = rentservice.getAllServices();
        
        for (ServiceModel s : list) {
            if (s.getDescription() != null) {
                String[] descLines = s.getDescription().split("\\n");
                s.setDescList(Arrays.asList(descLines)); // Create a new field for this
            }
        }
        
        model.addAttribute("list", list);
        return "services"; // resolves to services.jsp
    }
    
    @RequestMapping("/indexview")
    public String showHomePage(Model model) {
        List<BannerModel> banners = rentservice.getAllBanners();
        
        List<MakeupGalleryModel> makeupGallery = rentservice.getAllMakeupGallery();

        // Limit to 4 images
        if (makeupGallery.size() > 4) {
            makeupGallery = makeupGallery.subList(0, 4);
        }
        
        List<RentalGalleryModel> galleries = rentservice.getAllGalleries();
        List<ReviewModel> reviewList = rentservice.getAllReviews();
        
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("galleryList", galleries);
        
        model.addAttribute("banners", banners);
        model.addAttribute("makeupGallery", makeupGallery);
        return "index"; // Your JSP page name
    }
    
    @RequestMapping("/fullgallery")
    public String showFullGallery(Model model) {
        List<MakeupGalleryModel> gallery = rentservice.getAllMakeupGallery();
        List<GalleryCategory> categories = rentservice.getAllCategories();
        List<RentalGalleryModel> galleries = rentservice.getAllGalleries();

        model.addAttribute("categoryList", categories);
        model.addAttribute("galleryList", galleries);
        model.addAttribute("makeupGallery", gallery);
        return "gallery"; // Create this JSP for full gallery
    }
    
    @RequestMapping(value = "submitReview", method = RequestMethod.POST)
    public String submitReview(@ModelAttribute("rm") ReviewModel rm, HttpSession session) {
    	
    	
    	rentservice.saveReview(rm);
    	
    	session.setAttribute("sesreview", "success");
    	
    	return "redirect:/indexview";
    }

    
    
    //Admin Codes
    
    @RequestMapping("/adminlogin")
    public String showLoginForm() {
        return "AdminLogin";
    }
    
    @RequestMapping(value = "login", method =RequestMethod.POST )
    public String doLogin(@ModelAttribute("lm") LoginModel lm) {
    	
    	
    	
    	List<LoginModel> list = rentservice.getLogin(lm);
    	
    	if(list!=null) {
    	return "redirect:/view";
    	}else {
			return "AdminLogin";
		}
    }
    
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false); // Get session if exists
        if (session != null) {
            session.invalidate(); // Destroy session
        }
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setDateHeader("Expires", 0); // Proxies
        return "redirect:/adminlogin";
    }
    
   
    @RequestMapping("/view")
    public String showAlldata(Model model) {
        List<BannerModel> banners = rentservice.getAllBanners();
        List<ServiceModel> sm= rentservice.getAllServices();
        
        for (ServiceModel s : sm) {
            if (s.getDescription() != null) {
                String[] descLines = s.getDescription().split("\\n");
                s.setDescList(Arrays.asList(descLines)); // Create a new field for this
            }
        }
        List<MakeupGalleryModel> galleryList = rentservice.getAllMakeupGallery();
        List<GalleryCategory> categories = rentservice.getAllCategories();
        List<RentalGalleryModel> galleries = rentservice.getAllGalleries();
        List<RentalBookingModel> orders = rentservice.getAllBookings();
        List<ServiceBookingModel> services= rentservice.getAllServiceBookings();
        List<RentalInquiryModel> inquery= rentservice.getallRentalInquery();
        List<ServiceInquiryModel> sinquery= rentservice.getAllInquiries();
        List<ReviewModel> reviewList = rentservice.getAllReviews();
        
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("serviceInquiries", sinquery);
        model.addAttribute("rentalInquiries", inquery);
        model.addAttribute("serviceOrders", services);
        model.addAttribute("rentalOrders", orders);
        model.addAttribute("serviceList", sm);
        model.addAttribute("banners", banners);
        model.addAttribute("galleryList", galleryList);
        model.addAttribute("categoryList", categories);
        model.addAttribute("galleries", galleries);
        
        
       
     
        model.addAttribute("pendingCount", rentservice.getPendingCount());
        model.addAttribute("confirmedCount", rentservice.getConfirmedCount());
        model.addAttribute("completedCount", rentservice.getCompletedCount());
        model.addAttribute("cancelledCount", rentservice.getCancelledCount());
        model.addAttribute("recentActivities", rentservice.getRecentActivities(10));
        
        return "AdminDashboard"; // JSP page
    }
    
    @RequestMapping(value = "/uploadBanner", method = RequestMethod.POST)
    public String uploadBanner(@ModelAttribute BannerModel bannerModel) {

    	CommonsMultipartFile file = bannerModel.getMultipartFile();

    	
    	
        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String uploadDir = "C:/Users/JOHN/eclipse-workspace/LovelyGlazeBeautyStudio/src/main/webapp/uploads";

            try {
                file.transferTo(new File(uploadDir + "/" + fileName));
                bannerModel.setFileupload(fileName); // Store file name in DB
                
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        rentservice.saveBanner(bannerModel);
        return "redirect:/view";
    }

    @RequestMapping("/deletebanner")
    public String deleteBanner(@RequestParam("id") int id,
                               @RequestParam("file") String fileName) {
        
        // 1. Delete image file from server
        String uploadDir = "C:/Users/JOHN/eclipse-workspace/LovelyGlazeBeautyStudio/src/main/webapp/uploads";
        File file = new File(uploadDir + File.separator + fileName);

        if (file.exists()) {
            file.delete();
        }

     
           int status= rentservice.deleteBanner(id);
        

        return "redirect:/view";
    }

    
    
    @RequestMapping(value = "/addService", method = RequestMethod.POST)
    public String saveService(@ModelAttribute("serviceModel") ServiceModel serviceModel) {
    	
        rentservice.addService(serviceModel);
        return "redirect:/view";
    }

    @RequestMapping("/delete/{id}")
    public String deleteService(@PathVariable("id") int id) {
        rentservice.deleteService(id);
        return "redirect:/view";
    }
    
    @RequestMapping(value = "/uploadMakeupImage", method = RequestMethod.POST)
    public String uploadMakeupImage(@ModelAttribute MakeupGalleryModel makeupModel) {

        CommonsMultipartFile file = makeupModel.getMultipartFile();

        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String uploadDir = "C:/Users/JOHN/eclipse-workspace/LovelyGlazeBeautyStudio/src/main/webapp/uploads";

            try {
                file.transferTo(new File(uploadDir + "/" + fileName));
                makeupModel.setFileName(fileName); // store in DB
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        rentservice.saveMakeupGallery(makeupModel); // Save using service
        return "redirect:/view";
    }

    @RequestMapping("/deleteMakeupImage")
    public String deleteMakeupImage(@RequestParam("id") int id, @RequestParam("file") String fileName) {
    	
    	 String uploadDir = "C:/Users/JOHN/eclipse-workspace/LovelyGlazeBeautyStudio/src/main/webapp/uploads";
         File file = new File(uploadDir + File.separator + fileName);

         if (file.exists()) {
             file.delete();
         }
    	
        rentservice.deleteMakeupGallery(id);
        return "redirect:/view";
    }

    @RequestMapping(value = "/uploadRentalGallery", method = RequestMethod.POST)
    public String uploadRentalGallery(@ModelAttribute("rentalModel") RentalGalleryModel rentalModel) {

        CommonsMultipartFile file = rentalModel.getMultipartFile();

        // Handle Category: Either selected or new
        GalleryCategory category = null;

        // User entered a new category
        if (rentalModel.getNewCategory() != null && !rentalModel.getNewCategory().trim().isEmpty()) {
            category = new GalleryCategory();
            category.setName(rentalModel.getNewCategory().trim());
            rentservice.save(category); // Save to DB (check duplicate inside)
        } else {
            // Category selected from dropdown
            category = rentservice.getById(rentalModel.getCategoryId());
        }

        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String uploadDir = "C:/Users/JOHN/eclipse-workspace/LovelyGlazeBeautyStudio/src/main/webapp/uploads/rental";

            try {
                file.transferTo(new File(uploadDir + "/" + fileName));
                rentalModel.setFilename(fileName); // set filename in model
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // Set Category
        rentalModel.setCategory(category);

        // Save to DB
        rentservice.saveRentalGallery(rentalModel);

        return "redirect:/view";
    }

    
    @RequestMapping("/deleteRentalGallery/{id}&{filename}")
    public String deleteRentalGallery(@PathVariable("id") int id,
                                      @PathVariable("filename") String filename) {

        // Define the folder path
        String uploadDir = "C:/Users/JOHN/eclipse-workspace/LovelyGlazeBeautyStudio/src/main/webapp/uploads/rental";

        // Delete the physical file
        File file = new File(uploadDir + "/" + filename);
        if (file.exists()) {
            file.delete();
        }

        // Delete from database
        rentservice.deleteRentalGallery(id);

        return "redirect:/view";
    }
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // matches <input type="date">
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
    
    @RequestMapping("/bookProduct")
    public String bookProduct(@ModelAttribute("booking") RentalBookingModel booking, Model model, HttpSession session) {

         RentalGalleryModel productId = booking.getProductid();
        java.util.Date bookingDate = booking.getBookingDate();

        if (rentservice.isProductBooked(productId, bookingDate)) {
        	session.setAttribute("msg", "Exist");
            return "redirect:/fullgallery";
        }
        
        CommonsMultipartFile file= booking.getMultipartFile();
        
        // Save uploaded file
        String fileName = file.getOriginalFilename();
        String uploadDir =  "C:/Users/JOHN/eclipse-workspace/LovelyGlazeBeautyStudio/src/main/webapp/uploads/idproofs/";
        File uploadPath = new File(uploadDir);
        if (!uploadPath.exists()) {
            uploadPath.mkdirs();
        }

        try {
            file.transferTo(new File(uploadDir + fileName));
        } catch (IOException e) {
            e.printStackTrace();
            session.setAttribute("msg1", "File upload failed.");
            return "redirect:/fullgallery";
        }

        booking.setIdProofPath(fileName);
        int Status=rentservice.saveRentalBooking(booking);

        if(Status >0) {
        // Send confirmation email
        emailservice.sendBookingEmail(booking.getEmail(), booking.getFullName(), booking.getBookingDate());

        session.setAttribute("msg3", "success");
        return "redirect:/fullgallery";
        }
        else {
        	session.setAttribute("msg4", "fail");
        	 return "redirect:/fullgallery";
		}
    }
    
    @RequestMapping("/downloadIdProof/{filename:.+}")
    public void downloadIdProof(@PathVariable("filename") String filename, HttpServletResponse response) {
        final String uploadDir = "C:/Users/JOHN/eclipse-workspace/LovelyGlazeBeautyStudio/src/main/webapp/uploads/idproofs/";

        try {
            Path filePath = Paths.get(uploadDir + filename);
            Resource resource = new UrlResource(filePath.toUri());

            if (resource.exists() && resource.isReadable()) {
                // Set content type and attachment header
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment; filename=\"" + resource.getFilename() + "\"");

                // Stream the file's contents to the response output stream
                try (FileInputStream in = new FileInputStream(resource.getFile())) {
                    org.apache.commons.io.IOUtils.copy(in, response.getOutputStream());
                    response.flushBuffer();
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
            }
        } catch (MalformedURLException e) {
            try {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid file path");
            } catch (IOException ioException) {
                ioException.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/confirmOrder/{id}")
    public String confirmOrder(@PathVariable("id") int id, HttpSession session) {
        RentalBookingModel order = rentservice.getBookingById(id);

        if (order != null) {
            order.setStatus("CONFIRMED");
            rentservice.updateBooking(order);
            emailservice.sendConfirmationEmail(order.getEmail(), order.getFullName(), order.getBookingDate(),order.getProductid().getImageName());
            session.setAttribute("msg", "Order confirmed successfully.");
        } else {
            session.setAttribute("msg", "Order not found.");
        }

        return "redirect:/view";
    }
    
    @RequestMapping("/completeOrder/{id}")
    public String completeOrder(@PathVariable("id") int id, HttpSession session) {
        RentalBookingModel order = rentservice.getBookingById(id);

        if (order != null) {
            order.setStatus("COMPLETED");
            rentservice.updateBooking(order);
                        session.setAttribute("msg", "Order confirmed successfully.");
        } else {
            session.setAttribute("msg", "Order not found.");
        }

        return "redirect:/view";
    }

    
    @RequestMapping("/cancelOrder/{id}")
    public String cancelOrder(@PathVariable("id") int id, HttpSession session) {
        RentalBookingModel order = rentservice.getBookingById(id);

        if (order != null) {
            order.setStatus("CANCELLED");
            rentservice.updateBooking(order);
            emailservice.sendCancellationEmail(order.getEmail(), order.getFullName(), order.getBookingDate(),order.getProductid().getImageName());
            session.setAttribute("msg", "Order cancelled successfully.");
        } else {
            session.setAttribute("msg", "Order not found.");
        }

        return "redirect:/view";
    }
    
    @RequestMapping("/confirmService/{id}")
    public String confirmService(@PathVariable("id") int id, HttpSession session) {
        ServiceBookingModel order = rentservice.getServiceBookingById(id);

        if (order != null) {
            order.setStatus("CONFIRMED");
            rentservice.updateServiceBooking(order);
            emailservice.sendServiceConfirmationEmail(order.getEmail(), order.getFullname(), order.getBookingDate());
            session.setAttribute("msg", "Order confirmed successfully.");
        } else {
            session.setAttribute("msg", "Order not found.");
        }

        return "redirect:/view";
    }
    
    @RequestMapping("/completeService/{id}")
    public String completeService(@PathVariable("id") int id, HttpSession session) {
        ServiceBookingModel order = rentservice.getServiceBookingById(id);

        if (order != null) {
            order.setStatus("COMPLETED");
            rentservice.updateServiceBooking(order);
                        session.setAttribute("msg", "Order confirmed successfully.");
        } else {
            session.setAttribute("msg", "Order not found.");
        }

        return "redirect:/view";
    }

    
    @RequestMapping("/cancelService/{id}")
    public String cancelService(@PathVariable("id") int id, HttpSession session) {
        ServiceBookingModel order = rentservice.getServiceBookingById(id);

        if (order != null) {
            order.setStatus("CANCELLED");
            rentservice.updateServiceBooking(order);
            emailservice.sendServiceCancellationEmail(order.getEmail(), order.getFullname(), order.getBookingDate());
            session.setAttribute("msg", "Order cancelled successfully.");
        } else {
            session.setAttribute("msg", "Order not found.");
        }

        return "redirect:/view";
    }

    @RequestMapping(value = "submitServiceBooking", method =RequestMethod.POST )
    public String saveServiceBooking(@ModelAttribute("sbm") ServiceBookingModel sbm, HttpSession session) {
    	
    	CommonsMultipartFile file= sbm.getMultipartFile();
    	// Save uploaded file
        String fileName = file.getOriginalFilename();
        String uploadDir =  "C:/Users/JOHN/eclipse-workspace/LovelyGlazeBeautyStudio/src/main/webapp/uploads/idproofs/";
        File uploadPath = new File(uploadDir);
        if (!uploadPath.exists()) {
            uploadPath.mkdirs();
        }

        try {
            file.transferTo(new File(uploadDir + fileName));
        } catch (IOException e) {
            e.printStackTrace();
            session.setAttribute("msg1", "File upload failed.");
            return "redirect:/getservices";
        }
        
        sbm.setIdProofFile(fileName);
        int status= rentservice.saveServiceBooking(sbm);
    	
        if(status>0) { 
        	
        	emailservice.sendServiceBookingEmail(sbm.getEmail(), sbm.getFullname(), sbm.getBookingDate(), sbm.getServiceId().getTitle());

        session.setAttribute("msg3", "success");
        return "redirect:/getservices";
        }
        else {
        	session.setAttribute("msg4", "fail");
        	 return "redirect:/getservices";
		}
    }
    
    @RequestMapping(value = "submitServiceInquiry", method =RequestMethod.POST )
    public String saveInqueryBooking(@ModelAttribute("sim") ServiceInquiryModel sim, HttpSession session) {
    	
        int status= rentservice.saveInquiry(sim);
    	
        if(status>0) { 
        	
        	emailservice.sendInqueryEmail(sim.getEmail(), sim.getFullname());

        session.setAttribute("msg3", "success");
        return "redirect:/getservices";
        }
        else {
        	session.setAttribute("msg4", "fail");
        	 return "redirect:/getservices";
		}
    }
    
    
    @RequestMapping("/confirmServiceInquiry/{id}")
    public String confirmServiceInquery(@PathVariable("id") int id, HttpSession session) {
        ServiceInquiryModel order = rentservice.getServiceInqueryById(id);

        if (order != null) {
            order.setStatus("CONFIRMED");
            rentservice.updateServiceInquery(order);
            emailservice.sendServiceInqueryConfirmationEmail(order.getEmail(), order.getFullname());
            session.setAttribute("msg", "Order confirmed successfully.");
        } else {
            session.setAttribute("msg", "Order not found.");
        }

        return "redirect:/view";
    }
    
    
    @RequestMapping("/cancelServiceInquery/{id}")
    public String cancelServiceInquery(@PathVariable("id") int id, HttpSession session) {
    	 ServiceInquiryModel order = rentservice.getServiceInqueryById(id);

        if (order != null) {
            order.setStatus("CANCELLED");
            rentservice.updateServiceInquery(order);
            emailservice.sendServiceInqueryCancellationEmail(order.getEmail(), order.getFullname());
            session.setAttribute("msg", "Order cancelled successfully.");
        } else {
            session.setAttribute("msg", "Order not found.");
        }

        return "redirect:/view";
    }
    
    @RequestMapping(value = "submitInquiry", method =RequestMethod.POST )
    public String saveRentalInquery(@ModelAttribute("rim") RentalInquiryModel rim, HttpSession session) {
    	
        int status= rentservice.saveRentalInquiry(rim);
    	
        if(status>0) { 
        	
        	emailservice.sendRentalInqueryEmail(rim.getEmail(), rim.getFullName());

        session.setAttribute("msg3", "success");
        return "redirect:/fullgallery";
        }
        else {
        	session.setAttribute("msg4", "fail");
        	 return "redirect:/fullgallery";
		}
    }
    
    @RequestMapping("/confirmRentalInquiry/{id}")
    public String confirmRentalInquery(@PathVariable("id") int id, HttpSession session) {
        RentalInquiryModel order = rentservice.getRenralInqueryById(id);

        if (order != null) {
            order.setStatus("CONFIRMED");
            rentservice.updateRentalInquery(order);
            emailservice.sendRentalInqueryConfirmationEmail(order.getEmail(), order.getFullName());
            session.setAttribute("msg", "Order confirmed successfully.");
        } else {
            session.setAttribute("msg", "Order not found.");
        }

        return "redirect:/view";
    }
    
    
    @RequestMapping("/cancelRentalInquiry/{id}")
    public String cancelRentalInquery(@PathVariable("id") int id, HttpSession session) {
    	 RentalInquiryModel order = rentservice.getRenralInqueryById(id);

        if (order != null) {
            order.setStatus("CANCELLED");
            rentservice.updateRentalInquery(order);
            emailservice.sendRentalInqueryCancellationEmail(order.getEmail(), order.getFullName());
            session.setAttribute("msg", "Order cancelled successfully.");
        } else {
            session.setAttribute("msg", "Order not found.");
        }

        return "redirect:/view";
    }
    
   @RequestMapping("reviewdelete/{id}")
   public String deleteReview(@PathVariable("id") int id) {
	   
	 int rm=  rentservice.deleteReview(id);
	   
	   return "redirect:/view";
   }
}
