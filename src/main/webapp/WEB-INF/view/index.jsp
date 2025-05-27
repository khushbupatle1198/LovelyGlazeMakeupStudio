<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Lovely Glaze Beauty Studio</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href=https://fonts.googleapis.com/css2?family=Great+Vibes&family=Montserrat:wght@400;500;700&family=Poppins:wght@300;400;500;600;700&display=swap rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="Style/index.css">
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 
</head>
<body>

<c:if test="${sessionScope.sesreview == 'success'}">
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Thank You!',
            text: 'Your review has been submitted successfully.',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'OK'
        });
    </script>
    <c:remove var="sesreview" scope="session"/>
</c:if>




    <!-- Preloader with Logo -->
    <div class="preloader" id="preloader">
        <div class="preloader-logo logo-animation">
            <img src="uploads/logo.jpeg" alt="Logo" style="height: 300px; width: 300px; border-radius: 60%;">
           
        </div>
    </div>
    
    <!-- Main Content (initially hidden) -->
    <div class="page-content">
        <!-- Enhanced Navbar -->
        <nav id="mainNav">
            <div class="logo">
                 <img src="uploads/logo.jpeg" alt="Logo" style="height: 50px; width: 50px; border-radius: 60%;">
                <span>Lovely Glaze Beauty Studio</span>
            </div>
            <div class="menu-toggle">
                <i class="fas fa-bars"></i>
            </div>
            <ul class="nav-links">
                <li class="active"><a href="home"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="about"><i class="fas fa-info-circle"></i> About</a></li>
                <li><a href="gallery"><i class="fas fa-images"></i> Gallery</a></li>
                <li><a href="services"><i class="fas fa-concierge-bell"></i> Services</a></li>
                <li><a href="contact"><i class="fas fa-phone-alt"></i> Contact</a></li>
            </ul>
        </nav>
    
        <!-- Banner Section -->
        <div class="banner-slider">
            <c:forEach var="banner" items="${banners}">
                <div class="slide" style="background-image: url('uploads/${banner.fileupload}');"></div>
            </c:forEach>
        </div>
        
        <!-- About Section -->
        <section class="about-section">
    <div class="about-text">
        <h2>About Us – Lovely Glaze Beauty Studio</h2>
        <p>Welcome to <strong>Lovely Glaze Beauty Studio</strong>, your one-stop destination for timeless beauty and elegance. We specialize in transforming your special moments into unforgettable memories through expert makeup services, rental dresses, and stunning jewelry collections.</p>
        
        <p>With our professional team of makeup artists, we enhance your natural beauty using premium products tailored to your unique style. Whether it’s a <em>bridal makeover</em>, <em>event glam</em>, or a <em>party-ready look</em>, we ensure perfection in every detail.</p>
        
        <p>Need the perfect outfit? Browse our exclusive rental collection—from classic traditional wear to modern statement pieces. Complete your look with our handpicked jewelry rentals that bring elegance without compromise.</p>
        
        <p>At Lovely Glaze, beauty meets convenience. We are committed to delivering style, confidence, and glamour—<em>all in one place</em>.</p>
        
        <h4>✨Look your best, feel your best—with Lovely Glaze.✨</h4>
        <br>
        <a class="btn btn-book" href="about"> 
            <i class="fas fa-book"></i> Learn More
        </a>
    </div>
    
    <div class="about-image">
        <img src="uploads/ownerimage.jpg" alt="Our Team">
    </div>
</section>

        
      
       <!-- Makeup Gallery Section -->
<section class="gallery-section">
    <h2 class="section-title">Makeup Gallery</h2>
    <div class="gallery-container makeup-gallery">
        <div class="gallery-category">
            <div class="gallery-items">
                <c:forEach var="img" items="${makeupGallery}">
                    <div class="gallery-item">
                        <img src="uploads/${img.fileName}" alt="${img.imageName}">
                        <div class="item-info">
                            
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- View All Button -->
        <div style="text-align: center; margin-top: 2rem;">
            <a href="fullgallery" class="btn btn-book">View All</a>
        </div>
    </div>
</section>

        
        
      <!-- Rental Gallery Section -->
<section class="gallery-section" style="background-color: white;">
    <h2 class="section-title">Rental Gallery</h2>
    <div class="gallery-container">
        <div class="gallery-category">
            <div class="gallery-items">
                <c:forEach var="item" items="${galleryList}" varStatus="loop">
                    <c:if test="${loop.index < 4}">
                        <div class="gallery-item">
                            <img src="uploads/rental/${item.filename}" alt="${item.imageName}">
                            <div class="item-info">
                                <h4>${item.imageName}</h4>
                                <p>${item.description}</p>
                                <div class="item-buttons">
                                    <button class="btn btn-book">
                                        <i class="fas fa-calendar-check"></i> Book Now
                                    </button>
                                    <button class="btn btn-inquiry">
                                        <i class="fas fa-question-circle"></i> Inquiry
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
                
            </div>
        </div>
         <!-- View All Button -->
        <div style="text-align: center; margin-top: 2rem;">
            <a href="fullgallery" class="btn btn-book">View All</a>
        </div>
    </div>
</section>


 <!-- Client Reviews Section -->
<section class="reviews-section">
    <div class="reviews-container">
        <h2 class="reviews-title">What Our Clients Say</h2>
        <div class="reviews-slider">
            <c:forEach var="review" items="${reviewList}" varStatus="loop">
                <div class="review-card ${loop.index == 0 ? 'active' : ''}">
                    <div class="review-header">
                        <div class="review-avatar" style="background-color: #ff9bb3; color: white; display: flex; align-items: center; justify-content: center; font-size: 1.5rem; font-weight: bold;">
                            ${fn:substring(review.name, 0, 1)}
                        </div>
                        <div class="review-user">
                            <h4>${review.name}</h4>
                            <div class="review-date">
                                <fmt:formatDate value="${review.reviewDate}" pattern="MMMM d, yyyy"/>
                            </div>
                        </div>
                    </div>
                    <div class="review-rating">
                        <c:forEach begin="1" end="5" var="i">
                            <c:choose>
                                <c:when test="${i <= review.rating}">
                                    <i class="fas fa-star"></i>
                                </c:when>
                                <c:when test="${i - 0.5 <= review.rating}">
                                    <i class="fas fa-star-half-alt"></i>
                                </c:when>
                                <c:otherwise>
                                    <i class="far fa-star"></i>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                    <div class="review-content">
                        ${review.review}
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="review-controls">
            <c:forEach var="review" items="${reviewList}" varStatus="loop">
                <div class="review-dot ${loop.index == 0 ? 'active' : ''}" data-index="${loop.index}"></div>
            </c:forEach>
        </div>
    </div>
</section>

        
        <!-- Review Section -->
        <section class="review-section">
            <div class="review-container">
                <div class="contact-info">
                    <h3>Contact Information</h3>
                    <div class="info-item">
                        <i class="fas fa-map-marker-alt"></i>
                        <div class="info-content">
                            <h4>Our Address</h4>
                            <p>Near Rajwada Palace, Gajiyapeth, Nagpur</p>
                        </div>
                    </div>
                    <div class="info-item">
                        <i class="fas fa-phone-alt"></i>
                        <div class="info-content">
                            <h4>Call Us</h4>
                            <p>+91 8149449539</p>
                        </div>
                    </div>
                     <div class="info-item">
                    <i class="fas fa-envelope"></i>
                    <div class="info-content">
                        <h4>Email Us</h4>
                        <p>mahisgallerydm@gmail.com<br>
                    </div>
                </div>
                
                <div class="info-item">
                    <i class="fas fa-clock"></i>
                    <div class="info-content">
                        <h4>Working Hours</h4>
                        <p>Monday - Sunday: 9:00 AM - 7:00 PM<br></p>
                    </div>
                </div>
                    <div class="social-links">
                        <a href="https://www.facebook.com/share/1Z5apoSXqG/?mibextid=wwXIfr"><i class="fab fa-facebook-f"></i></a>
                       
                        <a href="https://www.instagram.com/lovely_glaze_by_shanu_rana?igsh=bzBreWczMmdxMnlr"><i class="fab fa-instagram"></i></a>
                        
                        <a href="https://youtube.com/@shanuranamakeover?si=d7--4OAiWbF4uzoU"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                <div class="review-form">
                    <h3>Leave a Review</h3>
                <form action="submitReview" method="post">
                        <div class="form-group">
                            <label for="name">Your Name</label>
                            <input type="text" id="name" name="name" class="form-control" placeholder="Enter your name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Your Email</label>
                            <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
                        </div>
                        
                         <div class="form-group">
                        <label>Your Rating</label>
                        <div class="rating">
                            <input type="radio" id="star1" name="rating" value="5">
                            <label for="star1"><i class="fas fa-star"></i></label>
                            <input type="radio" id="star2" name="rating" value="4">
                            <label for="star2"><i class="fas fa-star"></i></label>
                            <input type="radio" id="star3" name="rating" value="3">
                            <label for="star3"><i class="fas fa-star"></i></label>
                            <input type="radio" id="star4" name="rating" value="2">
                            <label for="star4"><i class="fas fa-star"></i></label>
                            <input type="radio" id="star5" name="rating" value="1">
                            <label for="star5"><i class="fas fa-star"></i></label>
                        </div>
                    </div>
                        <div class="form-group">
                            <label for="review">Your Review</label>
                            <textarea id="review" name="review" class="form-control" placeholder="Share your experience with us..." required></textarea>
                        </div>
                        <button type="submit" class="btn-submit">
                            <i class="fas fa-paper-plane"></i> Submit Review
                        </button>
                    </form>
                </div>
            </div>
        </section>
        
        <!-- Map Section -->
        <section class="map-section">
    <div class="map-container">
       <iframe src="https://www.google.com/maps/embed?pb=!1m23!1m12!1m3!1d119074.7249694892!2d79.01681973803547!3d21.149009161326347!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m8!3e6!4m0!4m5!1s0x3bd4c185d4ddf59b%3A0x45a163e2ba6299e3!2sLovely%20Glaze%20Studio%2C%20Ganjipeth%20Ganesh%20Chowk%2C%20behind%20Rajwada%20Palace%2C%20Ganjipeth%2C%20Gandhibagh%2C%20Nagpur%2C%20Maharashtra%20440018!3m2!1d21.1490291!2d79.09922139999999!5e0!3m2!1sen!2sin!4v1748339003554!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>   </div>
</section>

        
        <!-- Footer -->
        <footer>
            <div class="footer-container">
                <div class="footer-col">
                    <h4>About Us</h4>
                    <p>We are a premier rental service provider offering high-quality products and services for all your needs. Our commitment to excellence ensures customer satisfaction.</p>
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
                        <li><a href="#"><i class="fas fa-chevron-right"></i> Makeup Services</a></li>
                        <li><a href="#"><i class="fas fa-chevron-right"></i> Equipment Rental</a></li>
                        <li><a href="adminlogin"><i class="fas fa-chevron-right"></i> Management</a></li>
                        <li><a href="#"><i class="fas fa-chevron-right"></i> Event Planning</a></li>
                        <li><a href="#"><i class="fas fa-chevron-right"></i> Photography Services</a></li>
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
                <p>&copy; 2023 Rental Services. All Rights Reserved. | Designed with <i class="fas fa-heart" style="color: #e74c3c;"></i> by Your Company</p>
            </div>
        </footer>
        
        <!-- Back to Top Button -->
        <div class="back-to-top">
            <i class="fas fa-arrow-up"></i>
        </div>
    </div>
    
    <script>
    // Wait for DOM to load
    document.addEventListener('DOMContentLoaded', function() {
        const preloader = document.getElementById('preloader');
        const preloaderLogo = document.querySelector('.preloader-logo');
        const pageContent = document.querySelector('.page-content');
        
        // Initial state - show preloader with logo
        preloader.style.display = 'flex';
        pageContent.style.display = 'none';
        
        // Add drop animation to logo
        preloaderLogo.classList.add('logo-animation');
        
        // After logo drops, blast it and show content
        setTimeout(() => {
            preloaderLogo.classList.remove('logo-animation');
            preloaderLogo.classList.add('logo-blast');
            
            // Show content after blast
            setTimeout(() => {
                preloader.style.opacity = '0';
                setTimeout(() => {
                    preloader.style.display = 'none';
                    pageContent.classList.add('content-reveal');
                    
                    // Initialize the rest of your animations
                    initAnimations();
                }, 500);
            }, 800);
        }, 1500);
    });
    
    function initAnimations() {
    	
    	 // Client Reviews Slider
        const reviewCards = document.querySelectorAll('.review-card');
        const reviewDots = document.querySelectorAll('.review-dot');
        let currentReview = 0;

        function showReview(index) {
            // Reset all cards
            reviewCards.forEach(card => {
                card.classList.remove('active', 'left', 'right', 'center');
            });
            
            // Reset all dots
            reviewDots.forEach(dot => dot.classList.remove('active'));
            
            // Set new active dot
            reviewDots[index].classList.add('active');
            
            // Calculate positions
            const prevIndex = (index - 1 + reviewCards.length) % reviewCards.length;
            const nextIndex = (index + 1) % reviewCards.length;
            
            // Position cards
            reviewCards[index].classList.add('active', 'center');
            reviewCards[prevIndex].classList.add('left');
            reviewCards[nextIndex].classList.add('right');
            
            currentReview = index;
        }

        // Auto-rotate reviews
        let reviewInterval = setInterval(() => {
            showReview((currentReview + 1) % reviewCards.length);
        }, 5000);

        // Dot navigation
        reviewDots.forEach((dot, index) => {
            dot.addEventListener('click', () => {
                clearInterval(reviewInterval);
                showReview(index);
                reviewInterval = setInterval(() => {
                    showReview((currentReview + 1) % reviewCards.length);
                }, 5000);
            });
        });

        // Initialize first review
        showReview(0);
    	
        // Navbar scroll effect
        window.addEventListener('scroll', function() {
            const nav = document.getElementById('mainNav');
            if (window.scrollY > 50) {
                nav.classList.add('scrolled');
            } else {
                nav.classList.remove('scrolled');
            }
        });
        
        // Mobile menu toggle
        const menuToggle = document.querySelector('.menu-toggle');
        const navLinks = document.querySelector('.nav-links');
        
        if (menuToggle && navLinks) {
            menuToggle.addEventListener('click', function() {
                navLinks.classList.toggle('active');
                const icon = this.querySelector('i');
                icon.classList.toggle('fa-bars');
                icon.classList.toggle('fa-times');
            });
            
            // Close menu when clicking a link
            document.querySelectorAll('.nav-links a').forEach(link => {
                link.addEventListener('click', () => {
                    navLinks.classList.remove('active');
                    menuToggle.querySelector('i').classList.add('fa-bars');
                    menuToggle.querySelector('i').classList.remove('fa-times');
                });
            });
        }
        
        // Banner Slider Functionality
        let currentSlide = 0;
        const slides = document.querySelectorAll('.slide');
        let slideInterval;
        
        function showSlide(n) {
            slides.forEach(slide => slide.classList.remove('active'));
            currentSlide = (n + slides.length) % slides.length;
            slides[currentSlide].classList.add('active');
        }
        
        function nextSlide() {
            showSlide(currentSlide + 1);
        }
        
        function startSlider() {
            slideInterval = setInterval(nextSlide, 4000);
        }
        
        // Pause on touch for mobile devices
        const slider = document.querySelector('.banner-slider');
        if (slider) {
            slider.addEventListener('touchstart', () => {
                clearInterval(slideInterval);
            });
            
            slider.addEventListener('touchend', () => {
                startSlider();
            });
        }
        
        // Initialize slider
        showSlide(0);
        startSlider();
        
        // Gallery item hover effect
        document.querySelectorAll('.gallery-item').forEach(item => {
            item.addEventListener('mouseenter', function() {
                this.querySelector('.item-info').style.bottom = '0';
                this.querySelector('img').style.transform = 'rotateY(180deg)';
            });
            
            item.addEventListener('mouseleave', function() {
                this.querySelector('.item-info').style.bottom = '-100%';
                this.querySelector('img').style.transform = 'rotateY(0deg)';
            });
        });
        
        // Makeup gallery item hover effect
        document.querySelectorAll('.makeup-gallery .gallery-item').forEach(item => {
            item.addEventListener('mouseenter', function() {
                this.querySelector('.item-info').style.opacity = '1';
            });
            
            item.addEventListener('mouseleave', function() {
                this.querySelector('.item-info').style.opacity = '0.8';
            });
        });
        
        // Back to Top Button
        const backToTopBtn = document.querySelector('.back-to-top');
        
        if (backToTopBtn) {
            window.addEventListener('scroll', () => {
                if (window.pageYOffset > 300) {
                    backToTopBtn.classList.add('active');
                } else {
                    backToTopBtn.classList.remove('active');
                }
            });
            
            backToTopBtn.addEventListener('click', () => {
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            });
        }
        
      
    }
    
    
    
    
    </script>
</body>
</html>