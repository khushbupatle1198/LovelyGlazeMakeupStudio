<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Lovely Glaze Makeup Studio - Gallery</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Montserrat:wght@400;500;600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="Style/gallary.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
</head>

<body>

<c:if test="${not empty sessionScope.msg}">
    <script>
        Swal.fire({
            icon: 'warning',
            title: 'Already Booked',
            text: 'The product is already booked for this date.',
            confirmButtonText: 'OK'
        });
    </script>
    <c:remove var="msg" scope="session" />
</c:if>

<c:if test="${not empty sessionScope.msg1}">
    <script>
        Swal.fire({
            icon: 'error',
            title: 'Upload Failed',
            text: 'File upload failed. Please try again.',
            confirmButtonText: 'OK'
        });
    </script>
    <c:remove var="msg1" scope="session" />
</c:if>

<c:if test="${not empty sessionScope.msg3}">
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Booking Confirmed',
            text: 'Your booking was successful. Confirmation email sent!',
            confirmButtonText: 'OK'
        });
    </script>
    <c:remove var="msg3" scope="session" />
</c:if>

<c:if test="${not empty sessionScope.msg4}">
    <script>
        Swal.fire({
            icon: 'error',
            title: 'Booking Failed',
            text: 'Something went wrong. Please try again later.',
            confirmButtonText: 'OK'
        });
    </script>
    <c:remove var="msg4" scope="session" />
</c:if>

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
            <li><a href="about"><i class="fas fa-info-circle"></i> About</a></li>
             <li><a href="rentalhome" target="_blank"><i class="fas fa-info-circle"></i> Mahi`s Rental Studio</a></li>
            <li class="active"><a href="gallery"><i class="fas fa-images"></i> Gallery</a></li>
            <li><a href="services"><i class="fas fa-concierge-bell"></i> Services</a></li>
            <li><a href="contact"><i class="fas fa-phone-alt"></i> Contact</a></li>
        </ul>
    </nav>
    
    <!-- Makeup Gallery Section -->
    <section class="gallery-section">
        <h2 class="section-title">Makeup Gallery</h2>
        <div class="gallery-container makeup-gallery">
            <div class="gallery-items">
                <c:forEach var="img" items="${makeupGallery}">
                    <div class="gallery-item">
                        <div class="image-container">
                            <img src="uploads/${img.fileName}" alt="${img.imageName}">
                        </div>
                        <div class="item-info">
                            <h4>${img.imageName}</h4>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

   
    
    <!-- Footer -->
    <footer>
        <div class="footer-container">
            <div class="footer-col">
                <h4>About Us</h4>
                <p>We are a premier Makeup studio offering high-quality makeup and rental services. Our commitment to excellence ensures customer satisfaction.</p>
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
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Bridal Makeup</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Party Makeup</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Costume Rental</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Photography</a></li>
                    <li><a href="#"><i class="fas fa-chevron-right"></i> Hair Styling</a></li>
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
            <p>&copy; 2023 Lovely Glaze Makeup Studio. All Rights Reserved.</p>
        </div>
    </footer>



    <script>
    // Mobile menu toggle functionality
    document.addEventListener('DOMContentLoaded', function() {
        const menuToggle = document.querySelector('.menu-toggle');
        const navLinks = document.querySelector('.nav-links');
        
        if (menuToggle && navLinks) {
            menuToggle.addEventListener('click', function() {
                navLinks.classList.toggle('active');
                const icon = this.querySelector('i');
                icon.classList.toggle('fa-bars');
                icon.classList.toggle('fa-times');
            });
        }
        
        // Navbar scroll effect
        window.addEventListener('scroll', function() {
            const nav = document.getElementById('mainNav');
            if (window.scrollY > 50) {
                nav.classList.add('scrolled');
            } else {
                nav.classList.remove('scrolled');
            }
        });
    });
    
   
    
   
    
   
    
   
    </script>
</body>
</html>