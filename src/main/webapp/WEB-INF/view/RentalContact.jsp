<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mahis Gallary - Contact</title>
   
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Montserrat:wght@400;500;600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Style/contact.css">
   
</head>
<body>
    <!-- Navbar -->
    <nav id="mainNav">
       <div class="logo">
    <div class="logo-img">
        <img src="uploads/mg.png" alt="Logo" style="height: 50px; width: 50px; border-radius: 60%;">
    </div>
    <div class="logo-text">
        <span>Mahi`s Rental Studio</span>
        <h6>Jewellery & Outfit Collection</h6>
    </div>
</div>
        <div class="menu-toggle">
            <i class="fas fa-bars"></i>
        </div>
        <ul class="nav-links">
            <li><a href="rentalhome"><i class="fas fa-home"></i> Home</a></li>
            
            <li><a href="rentalgallery"><i class="fas fa-images"></i> Gallery</a></li>
            
            <li class="active"><a href="rentalcontact"><i class="fas fa-phone-alt"></i> Contact</a></li>
        </ul>
    </nav>

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
                         <p>+91 8999289506</p>
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
                    <a href="https://www.facebook.com/share/1AfdriosfJ/"><i class="fab fa-facebook-f"></i></a>
                   
                    <a href="https://www.instagram.com/mahisgallery888/"><i class="fab fa-instagram"></i></a>
                   
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
    
    <!-- Footer -->
    <footer>
        <div class="footer-container">
            <div class="footer-col">
                <h4>About Us</h4>
                <p>We are a premier rental service provider offering high-quality products and services for all your needs. Our commitment to excellence ensures customer satisfaction.</p>
                <div class="social-links">
                    <a href="https://www.facebook.com/share/1AfdriosfJ/"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://youtube.com/@shanuranamakeover?si=d7--4OAiWbF4uzoU"><i class="fab fa-youtube"></i></a>
                    <a href="https://www.instagram.com/mahisgallery888/"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
            
            <div class="footer-col">
                <h4>Quick Links</h4>
                <ul class="footer-links">
                     <li><a href="rentalhome"><i class="fas fa-chevron-right"></i> Home</a></li>
                        <li><a href="rentalgallery"><i class="fas fa-chevron-right"></i> Gallery</a></li>
                        <li><a href="rentalcontact"><i class="fas fa-chevron-right"></i> Contact Us</a></li>
                </ul>
            </div>
            
            <div class="footer-col">
                <h4>Our Services</h4>
                <ul class="footer-links">
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Makeup Services</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Equipment Rental</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Costume Rental</a></li>
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

    <script>
        // Mobile menu toggle
        document.querySelector('.menu-toggle').addEventListener('click', function() {
            document.querySelector('.nav-links').classList.toggle('active');
        });

        // Navbar scroll effect
        window.addEventListener('scroll', function() {
            const nav = document.querySelector('nav');
            if (window.scrollY > 50) {
                nav.classList.add('scrolled');
            } else {
                nav.classList.remove('scrolled');
            }
        });

        // Close mobile menu when clicking a link
        document.querySelectorAll('.nav-links a').forEach(link => {
            link.addEventListener('click', () => {
                document.querySelector('.nav-links').classList.remove('active');
            });
        });
    </script>
</body>
</html>