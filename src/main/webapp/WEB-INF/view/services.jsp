<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lovely Glaze Beauty Studio - Services</title>
    
    <!-- Font Preload for better performance -->
    <link rel="preload" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" as="style">
    <link rel="preload" href="https://fonts.googleapis.com/css2?family=Great+Vibes&display=swap" as="style">
    
    <!-- Font Awesome with preconnect -->
    <link rel="preconnect" href="https://cdnjs.cloudflare.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Style/service.css">
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    
</head>
<body>

<!-- Navbar -->
<nav id="mainNav">
    <div class="logo">
    <img src="uploads/logo.jpeg" alt="Logo" style="height: 50px; width: 50px; border-radius: 60%;">
        <span>Lovely Glaze Beauty Studio</span>
    </div>
    <div class="menu-toggle">
        <i class="fas fa-bars"></i>
    </div>
    <ul class="nav-links">
        <li><a href="home"><i class="fas fa-home"></i> Home</a></li>
        <li><a href="about"><i class="fas fa-info-circle"></i> About</a></li>
        <li><a href="gallery"><i class="fas fa-images"></i> Gallery</a></li>
        <li class="active"><a href="services"><i class="fas fa-concierge-bell"></i> Services</a></li>
        <li><a href="contact"><i class="fas fa-phone-alt"></i> Contact</a></li>
    </ul>
</nav>

<!-- Services Section -->
<section class="services-section">
    <h2>Our Premium Services</h2>
    <div class="service-card-container">
        <c:forEach var="s" items="${list}" varStatus="loop">
            <div class="service-card">
                <h3><i class="fas ${loop.index % 3 == 0 ? 'fa-paint-brush' : loop.index % 3 == 1 ? 'fa-camera' : 'fa-spa'}"></i> ${s.title}</h3>
                <div class="overview">${s.overview}</div>
                <div class="description">
                    <ul>
                        <c:forEach var="line" items="${s.descList}">
                            <li>${line}</li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="service-actions">
                    <button class="btn-service btn-book" onclick="openBookingModal('${s.title}','${s.id }')">
                        <i class="fas fa-calendar-check"></i> Book Now
                    </button>
                    <button class="btn-service btn-inquiry" onclick="openInquiryModal('${s.title}','${s.id }')">
                        <i class="fas fa-question-circle"></i> Inquiry
                    </button>
                </div>
            </div>
        </c:forEach>
    </div>
</section>

<!-- Booking Modal -->
<div class="modal-overlay" id="bookingModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3>Book Service</h3>
            <button class="close-modal" onclick="closeBookingModal()">&times;</button>
        </div>
        <div class="modal-body">
            <div class="service-name-display">
                <h4 id="bookingServiceName">Service Name</h4>
                <p id="bookingServiceDesc">Service description will appear here</p>
            </div>
            
            <form action="submitServiceBooking" method="post" enctype="multipart/form-data">
                <input type="hidden" name="serviceId.id" id="bookingServiceId">
                
                <div class="form-group">
                    <label class="required-field">Full Name</label>
                    <input type="text" name="fullname" required placeholder="Enter your full name">
                </div>
                
                <div class="form-group">
                    <label class="required-field">Email Address</label>
                    <input type="email" name="email" required placeholder="Enter your email">
                </div>
                
                <div class="form-group">
                    <label class="required-field">Mobile Number</label>
                    <input type="tel" name="mobile" required placeholder="Enter your mobile number">
                </div>
                
                <div class="form-group">
                    <label class="required-field">Address</label>
                    <textarea name="address" required placeholder="Enter your full address"></textarea>
                </div>
                
                <div class="form-group">
                    <label class="required-field">Booking Date</label>
                    <input type="date" name="bookingDate" required>
                </div>
                
                <div class="form-group">
                    <label class="required-field">Upload ID Proof (Aadhaar, PAN, or Driving License)</label>
                    <input type="file" name="multipartFile" accept=".pdf,.jpg,.jpeg,.png" required>
                </div>
                
                <div class="form-actions">
                    <button type="button" class="btn-cancel" onclick="closeBookingModal()">Cancel</button>
                    <button type="submit" class="btn-submit">Submit Booking</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Inquiry Modal -->
<div class="modal-overlay" id="inquiryModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3>Service Inquiry</h3>
            <button class="close-modal" onclick="closeInquiryModal()">&times;</button>
        </div>
        <div class="modal-body">
            <div class="service-name-display">
                <h4 id="inquiryServiceName">Service Name</h4>
                <p id="inquiryServiceDesc">Service description will appear here</p>
            </div>
            
            <form action="submitServiceInquiry" method="post" enctype="multipart/form-data">
                <input type="hidden" name="serviceId.id" id="inquiryServiceId">
                
                <div class="form-group">
                    <label class="required-field">Full Name</label>
                    <input type="text" name="fullname" required placeholder="Enter your full name">
                </div>
                
                <div class="form-group">
                    <label class="required-field">Email Address</label>
                    <input type="email" name="email" required placeholder="Enter your email">
                </div>
                
                <div class="form-group">
                    <label class="required-field">Phone Number</label>
                    <input type="tel" name="phone" required placeholder="Enter your phone number">
                </div>
                
                <div class="form-group">
                    <label>Address</label>
                    <textarea name="address" placeholder="Enter your address (optional)"></textarea>
                </div>
                
                <div class="form-group">
                    <label class="required-field">Your Message</label>
                    <textarea name="message" required placeholder="Enter your inquiry details"></textarea>
                </div>
                
                <div class="form-actions">
                    <button type="button" class="btn-cancel" onclick="closeInquiryModal()">Cancel</button>
                    <button type="submit" class="btn-submit">Submit Inquiry</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <div class="footer-container">
        <div class="footer-col">
            <h4>About Us</h4>
            <p>Lovely Glaze Beauty Studio offers premium beauty services with a personal touch. Our professional team ensures you look and feel your best.</p>
            <div class="social-links">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
        
        <div class="footer-col">
            <h4>Quick Links</h4>
            <ul class="footer-links">
                <li><a href="home"><i class="fas fa-chevron-right"></i> Home</a></li>
                <li><a href="about"><i class="fas fa-chevron-right"></i> About Us</a></li>
                <li><a href="services"><i class="fas fa-chevron-right"></i> Services</a></li>
                <li><a href="gallery"><i class="fas fa-chevron-right"></i> Gallery</a></li>
                <li><a href="contact"><i class="fas fa-chevron-right"></i> Contact Us</a></li>
            </ul>
        </div>
        
        <div class="footer-col">
            <h4>Our Services</h4>
            <ul class="footer-links">
                <li><a href="#"><i class="fas fa-chevron-right"></i> Bridal Makeup</a></li>
                <li><a href="#"><i class="fas fa-chevron-right"></i> Hair Styling</a></li>
                <li><a href="#"><i class="fas fa-chevron-right"></i> Skin Treatments</a></li>
                <li><a href="#"><i class="fas fa-chevron-right"></i> Nail Art</a></li>
                <li><a href="#"><i class="fas fa-chevron-right"></i> Spa Services</a></li>
            </ul>
        </div>
        
        <div class="footer-col">
            <h4>Newsletter</h4>
            <p>Subscribe to our newsletter to receive updates on new services and special offers.</p>
            <div class="footer-newsletter">
                <input type="email" placeholder="Your email address">
                <button type="submit">Subscribe</button>
            </div>
        </div>
    </div>
    
    <div class="footer-bottom">
        <p>&copy; 2023 Lovely Glaze Beauty Studio. All Rights Reserved.</p>
    </div>
</footer>

<script>
    // Modal Functions
    function openBookingModal(serviceName, serviceId) {
        const modal = document.getElementById('bookingModal');
        const serviceNameElement = document.getElementById('bookingServiceName');
        const serviceDescElement = document.getElementById('bookingServiceDesc');
        const hiddenInput = document.getElementById('bookingServiceId');

        serviceNameElement.textContent = serviceName;
        serviceDescElement.textContent = "You're booking our " + serviceName + " service. Please fill in your details below.";
        hiddenInput.value = serviceId;

        modal.classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    function closeBookingModal() {
        document.getElementById('bookingModal').classList.remove('active');
        document.body.style.overflow = 'auto';
    }

    function openInquiryModal(serviceName, serviceId) {
        const modal = document.getElementById('inquiryModal');
        const serviceNameElement = document.getElementById('inquiryServiceName');
        const serviceDescElement = document.getElementById('inquiryServiceDesc');
        const hiddenInput = document.getElementById('inquiryServiceId');

        serviceNameElement.textContent = serviceName;
        serviceDescElement.textContent = "You're inquiring about our " + serviceName + " service. Please fill in your details below.";
        hiddenInput.value = serviceId;

        modal.classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    function closeInquiryModal() {
        document.getElementById('inquiryModal').classList.remove('active');
        document.body.style.overflow = 'auto';
    }

    // Close modals when clicking outside content
    document.querySelectorAll('.modal-overlay').forEach(modal => {
        modal.addEventListener('click', function(e) {
            if (e.target === this) {
                if (this.id === 'bookingModal') {
                    closeBookingModal();
                } else {
                    closeInquiryModal();
                }
            }
        });
    });

    // Mobile menu toggle
    document.querySelector('.menu-toggle').addEventListener('click', function() {
        document.querySelector('.nav-links').classList.toggle('active');
    });

    // Navbar scroll effect
    window.addEventListener('scroll', function() {
        const nav = document.getElementById('mainNav');
        if (window.scrollY > 50) {
            nav.classList.add('scrolled');
        } else {
            nav.classList.remove('scrolled');
        }
    });

    // Close mobile menu when clicking a link
    document.querySelectorAll('.nav-links a').forEach(link => {
        link.addEventListener('click', function() {
            document.querySelector('.nav-links').classList.remove('active');
        });
    });

    // SweetAlert notifications
    $(document).ready(function () {
        <c:if test="${not empty sessionScope.msg1}">
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: '${sessionScope.msg1}'
            });
            <c:remove var="msg1" scope="session"/>
        </c:if>

        <c:if test="${not empty sessionScope.msg3}">
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: 'Your action was successful.'
            });
            <c:remove var="msg3" scope="session"/>
        </c:if>

        <c:if test="${not empty sessionScope.msg4}">
            Swal.fire({
                icon: 'error',
                title: 'Failed!',
                text: 'Something went wrong. Please try again.'
            });
            <c:remove var="msg4" scope="session"/>
        </c:if>
    });

    // Animate cards when they come into view
    document.addEventListener('DOMContentLoaded', function() {
        const cards = document.querySelectorAll('.service-card');
        
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                }
            });
        }, { threshold: 0.1 });

        cards.forEach(card => {
            observer.observe(card);
        });
    });
</script>

</body>
</html>