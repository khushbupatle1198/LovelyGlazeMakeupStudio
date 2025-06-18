<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lovely Glaze Makeup Studio - About</title>

     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Montserrat:wght@400;500;600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Style/about.css">
</head>
<body>
    <!-- Navbar -->
    <nav id="mainNav">
        <div class="logo">
           <img src="uploads/logo.jpeg" alt="Logo" style="height: 50px; width: 50px; border-radius: 60%;">
            <span>Lovely Glaze Makeup Studio</span>
        </div>
        <div class="menu-toggle">
            <i class="fas fa-bars"></i>
        </div>
        <ul class="nav-links">
            <li><a href="home"><i class="fas fa-home"></i> Home</a></li>
            <li class="active"><a href="about"><i class="fas fa-info-circle"></i> About</a></li>
             <li><a href="rentalhome" target="_blank"><i class="fas fa-info-circle"></i> Mahi`s Rental Studio</a></li>
            <li><a href="gallery"><i class="fas fa-images"></i> Gallery</a></li>
            <li><a href="services"><i class="fas fa-concierge-bell"></i> Services</a></li>
            <li><a href="contact"><i class="fas fa-phone-alt"></i> Contact</a></li>
        </ul>
    </nav>

    <!-- About Section -->
        <section class="about-section">
    <div class="about-text">
        <h2>About Us – Lovely Glaze Makeup Studio</h2>
        <p>Welcome to <strong>Lovely Glaze Makeup Studio</strong>, your one-stop destination for timeless beauty and elegance. We specialize in transforming your special moments into unforgettable memories through expert makeup services, rental dresses, and stunning jewelry collections.</p>
        
        <p>With our professional team of makeup artists, we enhance your natural beauty using premium products tailored to your unique style. Whether it’s a <em>bridal makeover</em>, <em>event glam</em>, or a <em>party-ready look</em>, we ensure perfection in every detail.</p>
        
        <p>Need the perfect outfit? Browse our exclusive rental collection—from classic traditional wear to modern statement pieces. Complete your look with our handpicked jewelry rentals that bring elegance without compromise.</p>
        
        <p>At Lovely Glaze, beauty meets convenience. We are committed to delivering style, confidence, and glamour—<em>all in one place</em>.</p>
           
           <strong>Owner | Bridal Fashion & Beauty Expert- Shanu Rana</strong> 
        <h4>✨Look your best, feel your best—with Lovely Glaze.✨</h4>
     
        
      
    </div>
    
    <div class="about-image">
        <img src="uploads/ownerimage.jpg" alt="Our Team">
    </div>
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
                    <li><a href="rentalhome" target="_blank"><i class="fas fa-chevron-right"></i> Mahi`s Rental Studio</a></li>
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