package com.dao;

import java.util.Date;
import java.util.List;


import javax.persistence.TypedQuery;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class RentDaoimpl implements RentDao {

	@Autowired
	SessionFactory sessionfactory;
	
	@Override
	public List<LoginModel> getLogin(LoginModel lm) {
	List<LoginModel> list=	sessionfactory.openSession().createQuery(" from LoginModel E where E.username='"+lm.getUsername()+"' and E.password='"+lm.getPassword()+"'").list();
	List<LoginModel> list1= list.size()>0?list:null;

	    System.out.println("Result size: " + list1.size());
	    return list1;
	}




	@Override
	public List<BannerModel> getAllBanners() {
		// TODO Auto-generated method stub
		return sessionfactory.getCurrentSession().createQuery("from BannerModel", BannerModel.class).list();
	}

	@Override
	public void saveBanner(BannerModel bannerModel) {
		// TODO Auto-generated method stub
		
		sessionfactory.getCurrentSession().save(bannerModel);
	}
	
	@Override
	public int deleteBanner(int id) {
	    BannerModel banner = sessionfactory.getCurrentSession().get(BannerModel.class, id);
	    if (banner != null) {
	        sessionfactory.getCurrentSession().delete(banner);
	        return 1; // success
	    }
	    return 0; // not found
	}


	@Override
	public void addService(ServiceModel service) {
		// TODO Auto-generated method stub
		
		sessionfactory.getCurrentSession().save(service);
		
	}

	@Override
	public List<ServiceModel> getAllServices() {
		// TODO Auto-generated method stub
		return sessionfactory.getCurrentSession().createQuery("from ServiceModel").list();
	}

	@Override
	public void deleteService(int id) {
		// TODO Auto-generated method stub
		ServiceModel s= sessionfactory.getCurrentSession().get(ServiceModel.class, id);
		sessionfactory.getCurrentSession().delete(s);
	}

	@Override
	public void saveMakeupGallery(MakeupGalleryModel makeupModel) {
		// TODO Auto-generated method stub
		sessionfactory.getCurrentSession().save(makeupModel);
	}

	@Override
	public void deleteMakeupGallery(int id) {
		// TODO Auto-generated method stub
		MakeupGalleryModel mgk= sessionfactory.getCurrentSession().get(MakeupGalleryModel.class, id);
		sessionfactory.getCurrentSession().delete(mgk);
	}

	@Override
	public List<MakeupGalleryModel> getAllMakeupGallery() {
		// TODO Auto-generated method stub
		return sessionfactory.getCurrentSession().createQuery("from MakeupGalleryModel", MakeupGalleryModel.class).list();
	}

	@Override
	public void save(GalleryCategory category) {
		// TODO Auto-generated method stub
		sessionfactory.getCurrentSession().save(category);
	}

	@Override
	public GalleryCategory getById(int categoryId) {
		// TODO Auto-generated method stub
		
		return sessionfactory.getCurrentSession().get(GalleryCategory.class, categoryId);
	}

	@Override
	public void saveRentalGallery(RentalGalleryModel rentalModel) {
		// TODO Auto-generated method stub
		sessionfactory.getCurrentSession().save(rentalModel);
	}

	@Override
	public List<RentalGalleryModel> getAllGalleries() {
		// TODO Auto-generated method stub
		return sessionfactory.getCurrentSession().createQuery("from RentalGalleryModel", RentalGalleryModel.class).getResultList();
	}

	@Override
	public List<GalleryCategory> getAllCategories() {
		// TODO Auto-generated method stub
		return sessionfactory.getCurrentSession().createQuery("from GalleryCategory", GalleryCategory.class).getResultList();
	}

	@Override
	public void deleteRentalGallery(int id) {
		// TODO Auto-generated method stub
		RentalGalleryModel rm= sessionfactory.getCurrentSession().get(RentalGalleryModel.class, id);
		sessionfactory.getCurrentSession().delete(rm);
		
	}

	@Override
	public boolean isProductBooked(RentalGalleryModel productId, Date bookingDate) {
		// TODO Auto-generated method stub
		String jpql = "SELECT b FROM RentalBookingModel b WHERE b.productid = :productId AND b.bookingDate = :bookingDate";
        TypedQuery<RentalBookingModel> query = sessionfactory.getCurrentSession().createQuery(jpql, RentalBookingModel.class);
        query.setParameter("productId", productId);
        query.setParameter("bookingDate", bookingDate);

        List<RentalBookingModel> results = query.getResultList();
        return !results.isEmpty();
	}

	@Override
	public int saveRentalBooking(RentalBookingModel booking) {
		// TODO Auto-generated method stub
		return (int) sessionfactory.getCurrentSession().save(booking);
	}

	@Override
	public List<RentalBookingModel> getAllBookings() {
		// TODO Auto-generated method stub
		return sessionfactory.getCurrentSession().createQuery("From RentalBookingModel", RentalBookingModel.class).list();
	}

	@Override
	public RentalBookingModel getBookingById(int id) {
		// TODO Auto-generated method stub
		return sessionfactory.getCurrentSession().get(RentalBookingModel.class, id);
	}

	@Override
	public void updateBooking(RentalBookingModel order) {
		// TODO Auto-generated method stub
		sessionfactory.getCurrentSession().update(order);
	}

	@Override
	public int saveInquiry(ServiceInquiryModel inquiry) {
		// TODO Auto-generated method stub
		
		return (int)	sessionfactory.getCurrentSession().save(inquiry);
	}

	@Override
	public List<ServiceInquiryModel> getAllInquiries() {
		// TODO Auto-generated method stub
		return sessionfactory.getCurrentSession().createQuery("From ServiceInquiryModel", ServiceInquiryModel.class).list();
	}

	@Override
	public int saveServiceBooking(ServiceBookingModel booking) {
		// TODO Auto-generated method stub
		return (int)sessionfactory.getCurrentSession().save(booking);
	}

	@Override
	public List<ServiceBookingModel> getAllServiceBookings() {
		// TODO Auto-generated method stub
		return sessionfactory.getCurrentSession().createQuery("From ServiceBookingModel", ServiceBookingModel.class).list();
	}

	@Override
	public ServiceBookingModel getServiceBookingById(int id) {
		// TODO Auto-generated method stub
		return sessionfactory.getCurrentSession().get(ServiceBookingModel.class, id);
	}

	@Override
	public void updateServiceBooking(ServiceBookingModel order) {
		// TODO Auto-generated method stub
		sessionfactory.getCurrentSession().update(order);
	}

	@Override
	public int saveRentalInquiry(RentalInquiryModel inquiry) {
		// TODO Auto-generated method stub
	  return (int)	sessionfactory.getCurrentSession().save(inquiry);
	}

	@Override
	public List<RentalInquiryModel> getallRentalInquery() {
		// TODO Auto-generated method stub
		return sessionfactory.getCurrentSession().createQuery("From RentalInquiryModel", RentalInquiryModel.class).list();
	}

	 

	    @Override
	    public int countByStatus(String status) {
	        String hql = "SELECT COUNT(b) FROM RentalBookingModel b WHERE b.status = :status";
	        Long count = (Long) sessionfactory.getCurrentSession()
	                          .createQuery(hql)
	                          .setParameter("status", status)
	                          .uniqueResult();
	        return count != null ? count.intValue() : 0;
	    }

	    @Override
	    public List<RentalBookingModel> findRecentBookings() {
	        String hql = "FROM RentalBookingModel b ORDER BY b.bookingDate DESC";
	        return sessionfactory.getCurrentSession()
	                .createQuery(hql, RentalBookingModel.class)
	                .setMaxResults(10)
	                .list();
	    }

	    @Override
	    public List<ServiceBookingModel> findRecentServiceBookings() {
	        String hql = "FROM ServiceBookingModel b ORDER BY b.bookingDate DESC";
	        return sessionfactory.getCurrentSession()
	                .createQuery(hql, ServiceBookingModel.class)
	                .setMaxResults(10)
	                .list();
	    }

	    @Override
	    public List<RentalInquiryModel> findRecentRentalInquiries() {
	        String hql = "FROM RentalInquiryModel i ORDER BY i.inquiryDate DESC";
	        return sessionfactory.getCurrentSession()
	                .createQuery(hql, RentalInquiryModel.class)
	                .setMaxResults(10)
	                .list();
	    }

	    @Override
	    public List<ServiceInquiryModel> findRecentServiceInquiries() {
	        String hql = "FROM ServiceInquiryModel i ORDER BY i.inquiryDate DESC";
	        return sessionfactory.getCurrentSession()
	                .createQuery(hql, ServiceInquiryModel.class)
	                .setMaxResults(10)
	                .list();
	    }

		@Override
		public ServiceInquiryModel getServiceInqueryById(int id) {
			// TODO Auto-generated method stub
			return sessionfactory.getCurrentSession().get(ServiceInquiryModel.class, id);
		}

		@Override
		public void updateServiceInquery(ServiceInquiryModel order) {
			// TODO Auto-generated method stub
			sessionfactory.getCurrentSession().update(order);
		}

		@Override
		public RentalInquiryModel getRenralInqueryById(int id) {
			// TODO Auto-generated method stub
			return sessionfactory.getCurrentSession().get(RentalInquiryModel.class, id);
		}

		@Override
		public void updateRentalInquery(RentalInquiryModel order) {
			// TODO Auto-generated method stub
			sessionfactory.getCurrentSession().update(order);
		}

		@Override
		public void saveReview(ReviewModel rm) {
			// TODO Auto-generated method stub
			sessionfactory.getCurrentSession().save(rm);
		}

		@Override
		public List<ReviewModel> getAllReview() {
			// TODO Auto-generated method stub
			return sessionfactory.getCurrentSession().createQuery("From ReviewModel", ReviewModel.class).list();
		}

		@Override
		public int deleteReview(int id) {
			// TODO Auto-generated method stub
			ReviewModel rm= sessionfactory.getCurrentSession().get(ReviewModel.class, id);
			 if (rm != null) {
			        sessionfactory.getCurrentSession().delete(rm);
			        return 1; 
			    } else {
			        return 0; 
			    }
		}
	

	

}
