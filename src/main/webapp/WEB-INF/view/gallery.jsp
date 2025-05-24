<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Lovely Glaze Beauty Studio - Gallery</title>
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
            
            <span>Lovely Glaze Beauty Studio</span>
        </div>
        <div class="menu-toggle">
            <i class="fas fa-bars"></i>
        </div>
        <ul class="nav-links">
            <li><a href="home"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="about"><i class="fas fa-info-circle"></i> About</a></li>
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

    <!-- Rental Gallery Section -->
    <section class="gallery-section" style="background-color: white;">
        <h2 class="section-title">Rental Gallery</h2>

        <!-- Filter Buttons -->
        <div class="category-filters">
            <button class="filter-btn active" onclick="filterGallery('all')">All</button>
            <c:forEach var="cat" items="${categoryList}">
                <button class="filter-btn" onclick="filterGallery('category${cat.id}')">${cat.name}</button>
            </c:forEach>
        </div>

        <!-- Gallery Items -->
        <div class="gallery-container">
            <div class="gallery-items">
                <c:forEach var="item" items="${galleryList}">
                    <div class="gallery-item category${item.category.id}">
                        <div class="image-container">
                            <img src="uploads/rental/${item.filename}" alt="${item.imageName}">
                        </div>
                        <div class="item-info">
                            <h4>${item.imageName}</h4>
                            <p class="item-description">${item.description}</p>
                            <div class="item-buttons">
                                <button class="btn btn-book" onclick="showBookingModal(${item.id}, '${item.imageName}')">
                                    <i class="fas fa-calendar-check"></i> Book Now
                                </button>
                                <button class="btn btn-inquiry" onclick="showInquiryForm(${item.id},'${item.imageName}')">
                                    <i class="fas fa-question-circle"></i> Inquiry
                                </button>
                            </div>
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
                <p>We are a premier beauty studio offering high-quality makeup and rental services. Our commitment to excellence ensures customer satisfaction.</p>
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
            <p>&copy; 2023 Lovely Glaze Beauty Studio. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Booking Modal -->
    <div class="modal fade" id="bookingModal" tabindex="-1" aria-labelledby="bookingModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="bookingModalLabel">Book: <span id="bookingItemName"></span></h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form id="bookingForm" action="bookProduct" method="post" enctype="multipart/form-data">
             
              <div class="modal-body">
              <input type="hidden" id="productId" name="productid.id">
              
                <div class="mb-3">
                  <label for="fullName" class="form-label">Full Name</label>
                  <input type="text" class="form-control" id="fullName" name="fullName" required>
                </div>
                <div class="mb-3">
                  <label for="email" class="form-label">Email</label>
                  <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                  <label for="mobile" class="form-label">Mobile Number</label>
                  <input type="tel" class="form-control" id="mobile" name="mobile" required>
                </div>
                <div class="mb-3">
                  <label for="address" class="form-label">Address</label>
                  <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
                </div>
                <div class="mb-3">
                  <label for="bookingDate" class="form-label">Booking Date</label>
                 <input type="date" class="form-control" id="bookingDate" name="bookingDate" required>
                </div>
                <div class="mb-3">
                  <label for="idProof" class="form-label">ID Proof (Aadhar/PAN/Driving License)</label>
                  <input type="file" class="form-control" id="idProof" name="multipartFile" accept=".pdf,.jpg,.jpeg,.png" required>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Submit Booking</button>
              </div>
          </form>
        </div>
      </div>
    </div>

   <!-- Inquiry Modal -->
<div class="modal fade" id="inquiryModal" tabindex="-1" aria-labelledby="inquiryModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="inquiryModalLabel">Inquiry for: <span id="inquiryItemName"></span></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form id="inquiryForm" action="submitInquiry" method="post">
  <input type="hidden" id="inquiryProductId" name="productid.id" >
        <div class="modal-body">
          <div class="mb-3">
            <label for="inquiryFullName" class="form-label">Full Name</label>
            <input type="text" class="form-control" id="inquiryFullName" name="fullName" required>
          </div>
          <div class="mb-3">
            <label for="inquiryEmail" class="form-label">Email</label>
            <input type="email" class="form-control" id="inquiryEmail" name="email" required>
          </div>
          <div class="mb-3">
            <label for="inquiryMobile" class="form-label">Mobile Number</label>
            <input type="tel" class="form-control" id="inquiryMobile" name="mobile" required>
          </div>
          <div class="mb-3">
            <label for="inquiryAddress" class="form-label">Address</label>
            <textarea class="form-control" id="inquiryAddress" name="address" rows="3" required></textarea>
          </div>
          <div class="mb-3">
            <label for="inquiryMessage" class="form-label">Message</label>
            <textarea class="form-control" id="inquiryMessage" name="message" rows="3"></textarea>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Submit Inquiry</button>
        </div>
      </form>
    </div>
  </div>
</div>


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
    
    function filterGallery(categoryClass) {
        const filterButtons = document.querySelectorAll('.filter-btn');
        filterButtons.forEach(btn => {
            if (btn.textContent.toLowerCase() === categoryClass.replace('category', '').toLowerCase() || 
                (categoryClass === 'all' && btn.textContent === 'All')) {
                btn.classList.add('active');
            } else {
                btn.classList.remove('active');
            }
        });
        
        const allItems = document.querySelectorAll('.gallery-item');
        allItems.forEach(item => {
            if (categoryClass === 'all' || item.classList.contains(categoryClass)) {
                item.style.display = 'flex'; // Changed to flex to maintain consistency
            } else {
                item.style.display = 'none';
            }
        });
    }
    
    // Show booking modal
    function showBookingModal( productId,itemName) {
        document.getElementById('bookingItemName').textContent = itemName;
        document.getElementById('productId').value = productId;
        
        // Set min date to today
        const today = new Date();
        const dd = String(today.getDate()).padStart(2, '0');
        const mm = String(today.getMonth() + 1).padStart(2, '0');
        const yyyy = today.getFullYear();
        const minDate = yyyy + '-' + mm + '-' + dd;
        document.getElementById('bookingDate').setAttribute('min', minDate);
        
        // Show modal
        var bookingModal = new bootstrap.Modal(document.getElementById('bookingModal'));
        bookingModal.show();
    }
    
    // Show inquiry modal
   function showInquiryForm(productId, itemName) {
    document.getElementById('inquiryItemName').textContent = itemName;
    document.getElementById('inquiryProductId').value = productId; // Set the product ID
    
    var inquiryModal = new bootstrap.Modal(document.getElementById('inquiryModal'));
    inquiryModal.show();
}
    
    // Form validation and submission
    document.getElementById('bookingForm').addEventListener('submit', function(e) {
        // You can add additional validation here if needed
        // For example, check if date is available
        
        // This is just a demo - in a real app you would make an AJAX call
        console.log('Booking submitted for product ID:', document.getElementById('productId').value);
    });
    
    document.getElementById('inquiryForm').addEventListener('submit', function(e) {
        // This is just a demo - in a real app you would make an AJAX call
        console.log('Inquiry submitted for:', document.getElementById('inquiryItemName').textContent);
    });
    </script>
</body>
</html>