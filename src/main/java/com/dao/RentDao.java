package com.dao;

import java.util.Date;
import java.util.List;

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

public interface RentDao {

	public List<LoginModel> getLogin(LoginModel lm);
	public List<BannerModel> getAllBanners();
	public void saveBanner(BannerModel bannerModel);
	public void addService(ServiceModel service);
	public List<ServiceModel> getAllServices();
	public void deleteService(int id);
	public int deleteBanner(int id);
	public void saveMakeupGallery(MakeupGalleryModel makeupModel);
	public void deleteMakeupGallery(int id);
	public List<MakeupGalleryModel> getAllMakeupGallery();
	public void save(GalleryCategory category);
	public GalleryCategory getById(int categoryId);
	public void saveRentalGallery(RentalGalleryModel rentalModel);
	public List<RentalGalleryModel> getAllGalleries();
	public List<GalleryCategory> getAllCategories();
	public void deleteRentalGallery(int id);
	public boolean isProductBooked(RentalGalleryModel productId, Date bookingDate);
	public int saveRentalBooking(RentalBookingModel booking);
	public List<RentalBookingModel> getAllBookings();
	public RentalBookingModel getBookingById(int id);
	public void updateBooking(RentalBookingModel order);
	public int saveInquiry(ServiceInquiryModel inquiry);
	public List<ServiceInquiryModel> getAllInquiries();
	public int saveServiceBooking(ServiceBookingModel booking);
	public List<ServiceBookingModel> getAllServiceBookings();
	public ServiceBookingModel getServiceBookingById(int id);
	public void updateServiceBooking(ServiceBookingModel order);
	public int saveRentalInquiry(RentalInquiryModel inquiry);
	public List<RentalInquiryModel> getallRentalInquery();


    int countByStatus(String status);
    List<RentalBookingModel> findRecentBookings();
    List<ServiceBookingModel> findRecentServiceBookings();
    List<RentalInquiryModel> findRecentRentalInquiries();
    List<ServiceInquiryModel> findRecentServiceInquiries();
	public ServiceInquiryModel getServiceInqueryById(int id);
	public void updateServiceInquery(ServiceInquiryModel order);
	public RentalInquiryModel getRenralInqueryById(int id);
	public void updateRentalInquery(RentalInquiryModel order);
	public void saveReview(ReviewModel rm);
	public List<ReviewModel> getAllReview();
	public int deleteReview(int id);
}
