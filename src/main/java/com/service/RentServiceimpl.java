package com.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.RentDao;
import com.model.Activity;
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

@Service
public class RentServiceimpl implements RentService {

	@Autowired RentDao dao;
	
	
	@Override
	public List<LoginModel> getLogin(LoginModel lm) {
		// TODO Auto-generated method stub
		return dao.getLogin(lm);
	}

	@Transactional
	@Override
	public List<BannerModel> getAllBanners() {
		// TODO Auto-generated method stub
		return dao.getAllBanners();
	}

	@Transactional
	@Override
	public void saveBanner(BannerModel bannerModel) {
		// TODO Auto-generated method stub
		dao.saveBanner(bannerModel);
	}
	
	@Transactional
	@Override
	public int deleteBanner(int id) {
		// TODO Auto-generated method stub
		return dao.deleteBanner( id);
	}

	@Transactional
	@Override
	public void addService(ServiceModel service) {
		// TODO Auto-generated method stub
		dao.addService(service);
	}

	@Transactional
	@Override
	public List<ServiceModel> getAllServices() {
		// TODO Auto-generated method stub
		return dao.getAllServices();
	}

	@Transactional
	@Override
	public void deleteService(int id) {
		// TODO Auto-generated method stub
		dao.deleteService(id);
	}

	@Transactional
	@Override
	public void saveMakeupGallery(MakeupGalleryModel makeupModel) {
		// TODO Auto-generated method stub
		dao.saveMakeupGallery( makeupModel);
	}

	@Transactional
	@Override
	public List<MakeupGalleryModel> getAllMakeupGallery() {
		// TODO Auto-generated method stub
		return dao.getAllMakeupGallery();
	}

	@Transactional
	@Override
	public void deleteMakeupGallery(int id) {
		// TODO Auto-generated method stub
		dao.deleteMakeupGallery(id);
	}

	@Transactional
	@Override
	public void save(GalleryCategory category) {
		// TODO Auto-generated method stub
		dao.save(category);
	}

	@Transactional
	@Override
	public GalleryCategory getById(int categoryId) {
		// TODO Auto-generated method stub
		return dao.getById( categoryId);
	}

	@Transactional
	@Override
	public void saveRentalGallery(RentalGalleryModel rentalModel) {
		// TODO Auto-generated method stub
		dao.saveRentalGallery( rentalModel);
	}

	@Transactional
	@Override
	public List<GalleryCategory> getAllCategories() {
		// TODO Auto-generated method stub
		return  dao.getAllCategories();
	}

	@Transactional
	@Override
	public List<RentalGalleryModel> getAllGalleries() {
		// TODO Auto-generated method stub
		return dao.getAllGalleries();
	}

	@Transactional
	@Override
	public void deleteRentalGallery(int id) {
		// TODO Auto-generated method stub
		dao.deleteRentalGallery( id);
	}

	@Transactional
	@Override
	public boolean isProductBooked(RentalGalleryModel productId, Date bookingDate) {
		// TODO Auto-generated method stub
		return dao.isProductBooked(productId,bookingDate);
	}

	@Transactional
	@Override
	public int saveRentalBooking(RentalBookingModel booking) {
		// TODO Auto-generated method stub
		return dao.saveRentalBooking(booking);
		
	}
	
	@Transactional
	@Override
	public List<RentalBookingModel> getAllBookings() {
		// TODO Auto-generated method stub
		return dao.getAllBookings();
	}

	@Transactional
	@Override
	public RentalBookingModel getBookingById(int id) {
		// TODO Auto-generated method stub
		return dao.getBookingById(id);
	}

	@Transactional
	@Override
	public void updateBooking(RentalBookingModel order) {
		// TODO Auto-generated method stub
		dao.updateBooking( order);
	}

	@Transactional
	@Override
	public int saveInquiry(ServiceInquiryModel inquiry) {
		// TODO Auto-generated method stub
		return dao.saveInquiry(inquiry);
	}

	@Transactional
	@Override
	public List<ServiceInquiryModel> getAllInquiries() {
		// TODO Auto-generated method stub
		return dao.getAllInquiries();
	}

	@Transactional
	@Override
	public int saveServiceBooking(ServiceBookingModel booking) {
		// TODO Auto-generated method stub
		return dao.saveServiceBooking(booking);
		
	}

	@Transactional
	@Override
	public List<ServiceBookingModel> getAllServiceBookings() {
		// TODO Auto-generated method stub
		return dao.getAllServiceBookings();
	}

	@Transactional
	@Override
	public ServiceBookingModel getServiceBookingById(int id) {
		// TODO Auto-generated method stub
		return dao.getServiceBookingById(id);
	}

	@Transactional
	@Override
	public void updateServiceBooking(ServiceBookingModel order) {
		// TODO Auto-generated method stub
		dao.updateServiceBooking(order);
	}

	@Transactional
	@Override
	public int saveRentalInquiry(RentalInquiryModel inquiry) {
		// TODO Auto-generated method stub
	 return	dao.saveRentalInquiry(inquiry);
	}

	@Transactional
	@Override
	public List<RentalInquiryModel> getallRentalInquery() {
		// TODO Auto-generated method stub
		return dao.getallRentalInquery();
	}

	

	@Transactional
    @Override
    public int getPendingCount() {
        return dao.countByStatus("PENDING");
    }

	@Transactional
    @Override
    public int getConfirmedCount() {
        return dao.countByStatus("CONFIRMED");
    }

	@Transactional
    @Override
    public int getCompletedCount() {
        return dao.countByStatus("COMPLETED");
    }

	@Transactional
    @Override
    public int getCancelledCount() {
        return dao.countByStatus("CANCELLED");
    }

	@Transactional
    @Override
    public List<Activity> getRecentActivities(int count) {
        List<Activity> activities = new ArrayList<>();
        
        // Add rental bookings
        List<RentalBookingModel> rentalBookings = dao.findRecentBookings();
        rentalBookings.forEach(b -> activities.add(new Activity(
            "booking", 
            "New rental booking for " + b.getProductid().getImageName(),
            b.getBookingDate()
        )));
        
        // Add service bookings
        List<ServiceBookingModel> serviceBookings = dao.findRecentServiceBookings();
        serviceBookings.forEach(b -> activities.add(new Activity(
            "booking", 
            "New service booking for " + b.getServiceId().getTitle(),
            b.getBookingDate()
        )));
        
        // Add rental inquiries
        List<RentalInquiryModel> rentalInquiries = dao.findRecentRentalInquiries();
        rentalInquiries.forEach(i -> activities.add(new Activity(
            "inquiry", 
            "New rental inquiry from " + i.getFullName(),
            i.getInquiryDate()
        )));
        
        // Add service inquiries
        List<ServiceInquiryModel> serviceInquiries = dao.findRecentServiceInquiries();
        serviceInquiries.forEach(i -> activities.add(new Activity(
            "inquiry", 
            "New service inquiry from " + i.getFullname(),
            i.getInquiryDate()
        )));
        
        // Sort by date descending
        activities.sort((a1, a2) -> a2.getTimestamp().compareTo(a1.getTimestamp()));
        
        // Limit to requested count
        return activities.stream().limit(count).collect(Collectors.toList());
    }

	@Transactional
	@Override
	public ServiceInquiryModel getServiceInqueryById(int id) {
		// TODO Auto-generated method stub
		return dao.getServiceInqueryById(id);
	}

	@Transactional
	@Override
	public void updateServiceInquery(ServiceInquiryModel order) {
		// TODO Auto-generated method stub
		dao.updateServiceInquery(order);
	}

	@Transactional
	@Override
	public RentalInquiryModel getRenralInqueryById(int id) {
		// TODO Auto-generated method stub
		return dao.getRenralInqueryById(id);
	}

	@Transactional
	@Override
	public void updateRentalInquery(RentalInquiryModel order) {
		// TODO Auto-generated method stub
		dao.updateRentalInquery(order);
	}

	@Transactional
	@Override
	public void saveReview(ReviewModel rm) {
		// TODO Auto-generated method stub
		dao.saveReview(rm);
	}

	@Transactional
	@Override
	public List<ReviewModel> getAllReviews() {
		// TODO Auto-generated method stub
		return dao.getAllReview();
	}

	@Transactional
	@Override
	public int deleteReview(int id) {
		// TODO Auto-generated method stub
		return dao.deleteReview(id);
	}
	

}
