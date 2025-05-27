"<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lovely Glaze Beauty Studio - Admin Dashboard</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
     <link rel="stylesheet" href="Style/AdminDash.css">
     
     
     
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header" >
    <img src="uploads/logo.jpeg" alt="Logo" style="height: 80px; width: 80px; border-radius: 60%;">
    <h3>Lovely Glaze Beauty Studio</h3>
</div>
        <ul class="sidebar-menu">
            <li class="active" onclick="showSection('dashboard')">
                <a href="javascript:void(0)">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li onclick="showSection('orders')">
                <a href="javascript:void(0)">
                    <i class="fas fa-shopping-cart"></i>
                    <span>Orders</span>
                </a>
            </li>
            <li onclick="showSection('inquery')">
                <a href="javascript:void(0)">
                    <i class="fas fa-envelope-open-text"></i>
                    <span>Inquery</span>
                </a>
            </li>
            <li onclick="showSection('banner')">
                <a href="javascript:void(0)">
                    <i class="fas fa-boxes"></i>
                    <span>Upload Banner</span>
                </a>
            </li>
            <li onclick="showSection('MakeupGalary')">
                <a href="javascript:void(0)">
                  <i class="fas fa-images"></i> <!-- Best for a photo gallery -->
                    <span>Makeup Galary</span>
                </a>
            </li>
            <li onclick="showSection('makeup')">
                <a href="javascript:void(0)">
                    <i class="fas fa-paint-brush"></i>
                    <span>Makeup Services</span>
                </a>
            </li>
            <li onclick="showSection('rentalgalary')">
                <a href="javascript:void(0)">
                   <i class="fas fa-images"></i>
                    <span>Rental Galary</span>
                </a>
            </li>
            <li onclick="showSection('review')">
                <a href="javascript:void(0)">
                   <i class="fas fa-pen-alt"></i>
                    <span>Review</span>
                </a>
            </li>
            <li onclick="window.location.href='logout'">
    <a href="javascript:void(0)">
        <i class="fas fa-sign-out-alt"></i>
        <span>Logout</span>
    </a>
</li>

        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h2 id="section-title">Dashboard</h2>
            <div class="user-info">
                <img src="uploads/ownerimage.jpg" alt="Admin">
                <span>mahisgallerydm@gmail.com</span>
            </div>
        </div>

        <!-- Dashboard Section -->
<div id="dashboard" class="section active">
  <div class="dashboard-container">
    <div class="dashboard-header">
      <h2><i class="fas fa-tachometer-alt"></i> Dashboard Overview</h2>
      <div class="dashboard-actions">
        <button class="refresh-btn" onclick="refreshDashboard()">
          <i class="fas fa-sync-alt"></i> Refresh
        </button>
      </div>
    </div>
    
    <!-- Summary Cards -->
    <div class="summary-cards">
      <!-- Bookings Summary -->
      <div class="summary-card bookings">
        <div class="card-icon">
          <i class="fas fa-calendar-check"></i>
        </div>
        <div class="card-content">
          <h3>Total Bookings</h3>
          <div class="card-value">${fn:length(rentalOrders) + fn:length(serviceOrders)}</div>
          <div class="card-breakdown">
            <span class="rental">${fn:length(rentalOrders)} Rental</span>
            <span class="service">${fn:length(serviceOrders)} Service</span>
          </div>
        </div>
      </div>
      
      <!-- Revenue Summary -->
      <div class="summary-card revenue">
        <div class="card-icon">
          <i class="fas fa-rupee-sign"></i>
        </div>
        <div class="card-content">
          <h3>Estimated Revenue</h3>
          <div class="card-value">₹${rentservice.getEstimatedRevenue()}</div>
          <div class="card-breakdown">
            <span class="confirmed">₹${rentservice.getConfirmedRevenue()}</span>
            <span class="pending">₹${rentservice.getPendingRevenue()}</span>
          </div>
        </div>
      </div>
      
      <!-- Inquiries Summary -->
      <div class="summary-card inquiries">
        <div class="card-icon">
          <i class="fas fa-question-circle"></i>
        </div>
        <div class="card-content">
          <h3>New Inquiries</h3>
          <div class="card-value">${fn:length(rentalInquiries) + fn:length(serviceInquiries)}</div>
          <div class="card-breakdown">
            <span class="rental">${fn:length(rentalInquiries)} Rental</span>
            <span class="service">${fn:length(serviceInquiries)} Service</span>
          </div>
        </div>
      </div>
      
      <!-- Inventory Summary -->
      <div class="summary-card inventory">
        <div class="card-icon">
          <i class="fas fa-boxes"></i>
        </div>
        <div class="card-content">
          <h3>Rental Items</h3>
          <div class="card-value">${fn:length(galleries)}</div>
          <div class="card-breakdown">
            <span>${fn:length(categoryList)} Categories</span>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Recent Activity Section -->
    <div class="dashboard-section">
      <div class="section-header">
        <h3><i class="fas fa-clock"></i> Recent Activity</h3>
        <a href="#" class="view-all">View All</a>
      </div>
      
      <div class="activity-timeline">
        <c:forEach items="${rentservice.getRecentActivities(10)}" var="activity">
          <div class="activity-item ${activity.type}">
            <div class="activity-icon">
              <c:choose>
                <c:when test="${activity.type == 'booking'}">
                  <i class="fas fa-calendar-plus"></i>
                </c:when>
                <c:when test="${activity.type == 'inquiry'}">
                  <i class="fas fa-question"></i>
                </c:when>
                <c:when test="${activity.type == 'confirmation'}">
                  <i class="fas fa-check-circle"></i>
                </c:when>
                <c:when test="${activity.type == 'cancellation'}">
                  <i class="fas fa-times-circle"></i>
                </c:when>
              </c:choose>
            </div>
            <div class="activity-content">
              <p class="activity-message">${activity.message}</p>
              <p class="activity-time">
                <i class="far fa-clock"></i> ${activity.timestamp}
              </p>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
    
    <!-- Quick Actions -->
    <div class="dashboard-section">
      <div class="section-header">
        <h3><i class="fas fa-bolt"></i> Quick Actions</h3>
      </div>
      
      <div class="quick-actions">
        <a href="#banner-section" class="action-card">
          <i class="fas fa-image"></i>
          <span>Upload Banner</span>
        </a>
        <a href="#service-section" class="action-card">
          <i class="fas fa-plus-circle"></i>
          <span>Add Service</span>
        </a>
        <a href="#gallery-section" class="action-card">
          <i class="fas fa-camera"></i>
          <span>Add Gallery Item</span>
        </a>
        <a href="#orders-section" class="action-card">
          <i class="fas fa-clipboard-list"></i>
          <span>View Orders</span>
        </a>
      </div>
    </div>
    
    <!-- Status Overview -->
    <div class="dashboard-section">
      <div class="section-header">
        <h3><i class="fas fa-chart-pie"></i> Status Overview</h3>
      </div>
      
      <div class="status-overview">
        <div class="status-chart">
          <canvas id="bookingsChart" width="400" height="200"></canvas>
        </div>
        <div class="status-legend">
          <div class="legend-item pending">
            <span class="legend-color"></span>
            <span class="legend-label">Pending (${rentservice.getPendingCount()})</span>
          </div>
          <div class="legend-item confirmed">
            <span class="legend-color"></span>
            <span class="legend-label">Confirmed (${rentservice.getConfirmedCount()})</span>
          </div>
          <div class="legend-item completed">
            <span class="legend-color"></span>
            <span class="legend-label">Completed (${rentservice.getCompletedCount()})</span>
          </div>
          <div class="legend-item cancelled">
            <span class="legend-color"></span>
            <span class="legend-label">Cancelled (${rentservice.getCancelledCount()})</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
     <!-- Orders Section -->
<div id="orders" class="section">
  <div class="order-container">
    <!-- Tabs -->
    <div class="tabs">
      <button id="rental-tab" class="tab-btn active" onclick="switchTab('rental')">Rental Orders</button>
      <button id="service-tab" class="tab-btn" onclick="switchTab('service')">Service Orders</button>
      
      <div class="order-filters">
        <select id="order-status-filter">
          <option value="all">All Statuses</option>
          <option value="PENDING">Pending</option>
          <option value="CONFIRMED">Confirmed</option>
          <option value="CANCELLED">Cancelled</option>
          <option value="COMPLETED">Completed</option>
        </select>
        <input type="text" id="order-search" placeholder="Search orders...">
      </div>
    </div>

    <!-- Rental Orders Content -->
    <div id="rental-content" class="order-content active">
      <div class="order-header">
        <h3>Rental Orders (<span id="rental-count">${fn:length(rentalOrders)}</span>)</h3>
        
      </div>
      <div class="order-grid">
        <c:forEach items="${rentalOrders}" var="order">
          <div class="order-card" data-status="${order.status}" data-search="${order.fullName} ${order.productid.imageName} ${order.mobile} ${order.email} ${order.address}">
            <div class="order-image">
              <img src="uploads/${order.productid.filename}" alt="${order.productid.imageName}" />
              <div class="order-badge">#${order.id}</div>
            </div>
            <div class="order-details">
              <h4>${order.fullName}</h4>
              <p><i class="fas fa-box"></i> ${order.productid.imageName}</p>
              <p><i class="fas fa-calendar-alt"></i> ${order.bookingDate}</p>
              <p><i class="fas fa-phone"></i> ${order.mobile}</p>
              <p><i class="fas fa-envelope"></i> ${order.email}</p>
              <p><i class="fas fa-map-marker-alt"></i> ${order.address}</p>
              <p><i class="fas fa-id-card"></i> ID Proof:
                <a href="downloadIdProof/${order.idProofPath}" download style="color:blue; text-decoration:underline;">Download</a>
              </p>
              <div class="order-meta">
                <div class="status-label ${order.status}">${order.status}</div>
              </div>
              <div class="order-actions">
                <c:if test="${order.status == 'PENDING'}">
                  <a href="confirmOrder/${order.id}" class="action-btn confirm">
                    <i class="fas fa-check"></i> Confirm
                  </a>
                </c:if>
                <c:if test="${order.status == 'CONFIRMED'}">
                  <a href="completeOrder/${order.id}" class="action-btn confirm">
                    <i class="fas fa-check"></i> Completed
                  </a>
                </c:if>
                <c:if test="${order.status == 'PENDING'}">
                <a href="cancelOrder/${order.id}" class="action-btn delete">
                  <i class="fas fa-times"></i> Cancel
                </a></c:if>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>

    <!-- Service Orders Content -->
    <div id="service-content" class="order-content">
      <div class="order-header">
        <h3>Service Orders (<span id="service-count">${fn:length(serviceOrders)}</span>)</h3>
        
      </div>
      <div class="order-grid">
        <c:forEach items="${serviceOrders}" var="order">
          <div class="order-card" data-status="${order.status}" data-search="${order.fullname} ${order.serviceId.title} ${order.serviceId.description} ${order.address}">
            <div class="order-details">
              <h4>${order.fullname}</h4>
              <p><i class="fas fa-paint-brush"></i> <strong>Service:</strong> ${order.serviceId.title}</p>
              <p><i class="fas fa-align-left"></i> <strong>Description:</strong> ${order.serviceId.description}</p>
              <p><i class="fas fa-phone"></i><strong>Mobile No:</strong> ${order.mobile}</p>
              <p><i class="fas fa-envelope"></i><strong>Email Id:</strong> ${order.email}</p>
              <p><i class="fas fa-map-marker-alt"></i> <strong>Address:</strong> ${order.address}</p>
              <p><i class="fas fa-calendar-day"></i> <strong>Date:</strong> ${order.bookingDate}</p>
              <div class="order-meta">
                <div class="status-label ${order.status}">${order.status}</div>
              </div>
              <div class="order-actions">
                <c:if test="${order.status == 'PENDING'}">
                  <a href="confirmService/${order.id}" class="action-btn confirm">
                    <i class="fas fa-check"></i> Confirm
                  </a>
                </c:if>
                <c:if test="${order.status == 'CONFIRMED'}">
                  <a href="completeService/${order.id}" class="action-btn confirm">
                    <i class="fas fa-check"></i> Completed
                  </a>
                </c:if>
                <c:if test="${order.status == 'PENDING'}">
                <a href="cancelService/${order.id}" class="action-btn delete">
                  <i class="fas fa-times"></i> Cancel
                </a></c:if>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
</div>
    
    
    
  <!-- Inquiry Section -->
<div id="inquery" class="section">
  <div class="inquiry-container">
    <!-- Tabs -->
    <div class="inquiry-tabs">
      <div class="inquiry-tab-buttons">
        <button class="inquiry-tab-btn active" data-tab="rental-inquiry" onclick="switchInquiryTab('rental')">
          <i class="fas fa-box-open"></i> Rental Inquiries
        </button>
        <button class="inquiry-tab-btn" data-tab="service-inquiry" onclick="switchInquiryTab('service')">
          <i class="fas fa-spa"></i> Service Inquiries
        </button>
      </div>
      
      <div class="inquiry-filters">
        <div class="filter-group">
          <i class="fas fa-filter"></i>
          <select  id="inquiry-status-filter" class="inquiry-select">
            <option value="all">All Statuses</option>
            <option value="PENDING">Pending</option>
            <option value="CONFIRMED">Confirmed</option>
            <option value="CANCELLED">Cancelled</option>
          </select>
        </div>
        <div class="search-group">
          <i class="fas fa-search"></i>
          <input type="text" id="inquiry-search" class="inquiry-search" placeholder="Search inquiries...">
        </div>
      </div>
    </div>

    <!-- Rental Inquiries Tab -->
    <div id="rental-inquiry-content" class="inquiry-content active">
      <div class="inquiry-header">
        <h3><i class="fas fa-box-open"></i> Rental Inquiries <span class="badge-count">${fn:length(rentalInquiries)}</span></h3>
        
      </div>
      
      <div class="inquiry-grid">
        <c:forEach items="${rentalInquiries}" var="inquiry">
          <div class="inquiry-card rental" data-status="${inquiry.status}" data-search="${inquiry.fullName} ${inquiry.productid.imageName} ${inquiry.mobile} ${inquiry.email} ${inquiry.address}">
            <div class="inquiry-image">
              <img src="uploads/${inquiry.productid.filename}" alt="${inquiry.productid.imageName}" />
              <div class="inquiry-badge">#${inquiry.id}</div>
            </div>
            <div class="inquiry-details">
              <div class="inquiry-client">
                <h4>${inquiry.fullName}</h4>
                <div class="inquiry-status ${inquiry.status.toLowerCase()}">
                  ${inquiry.status}
                </div>
              </div>
              
              <div class="inquiry-info">
                <p><i class="fas fa-box"></i> ${inquiry.productid.imageName}</p>
                <p><i class="fas fa-phone"></i> ${inquiry.mobile}</p>
                <p><i class="fas fa-envelope"></i> ${inquiry.email}</p>
                <p><i class="fas fa-map-marker-alt"></i> ${inquiry.address}</p>
                <div class="inquiry-message">
                  <i class="fas fa-comment-dots"></i>
                  <p>${inquiry.message}</p>
                </div>
              </div>
              
              <div class="inquiry-actions">
                <c:if test="${inquiry.status == 'PENDING'}">
                  <a href="confirmRentalInquiry/${inquiry.id}" class="action-btn confirm">
                    <i class="fas fa-check-circle"></i> Confirm
                  </a>
                </c:if>
                <c:if test="${inquiry.status == 'PENDING'}">
                <a href="cancelRentalInquiry/${inquiry.id}" class="action-btn cancel">
                  <i class="fas fa-times-circle"></i> Cancel
                </a>
                </c:if>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>

    <!-- Service Inquiries Tab -->
    <div id="service-inquiry-content" class="inquiry-content">
      <div class="inquiry-header">
        <h3><i class="fas fa-spa"></i> Service Inquiries <span class="badge-count">${fn:length(serviceInquiries)}</span></h3>
       
      </div>
      
      <div class="inquiry-grid">
        <c:forEach items="${serviceInquiries}" var="inquiry">
          <div class="inquiry-card service" data-status="${inquiry.status}" data-search="${inquiry.fullname} ${inquiry.serviceId.title} ${inquiry.phone} ${inquiry.email} ${inquiry.address}">
            <div class="inquiry-details">
              <div class="inquiry-client">
                <h4>${inquiry.fullname}</h4>
                <div class="inquiry-status ${inquiry.status.toLowerCase()}">
                  ${inquiry.status}
                </div>
              </div>
              
              <div class="inquiry-info">
                <p><i class="fas fa-paint-brush"></i> <strong>Service:</strong> ${inquiry.serviceId.title}</p>
                <p><i class="fas fa-phone"></i> ${inquiry.phone}</p>
                <p><i class="fas fa-envelope"></i> ${inquiry.email}</p>
                <p><i class="fas fa-map-marker-alt"></i> ${inquiry.address}</p>
                <div class="inquiry-message">
                  <i class="fas fa-comment-dots"></i>
                  <p>${inquiry.message}</p>
                </div>
              </div>
              
              <div class="inquiry-actions">
                <c:if test="${inquiry.status == 'PENDING'}">
                  <a href="confirmServiceInquiry//${inquiry.id}" class="action-btn confirm">
                    <i class="fas fa-check-circle"></i> Confirm
                  </a>
                </c:if>
                 <c:if test="${inquiry.status == 'PENDING'}">
                <a href="cancelServiceInquiry/${inquiry.id}" class="action-btn cancel">
                  <i class="fas fa-times-circle"></i> Cancel
                </a>
                </c:if>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
</div>
       

        <!-- Banner Section -->
        <div id="banner" class="section">
             <h3>Banner Section</h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Description</th>
                <th>Name</th>
                <th>File</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${banners}" var="banner">
                <tr>
                    <td>${banner.id}</td>
                    <td>${banner.description}</td>
                    <td>${banner.name}</td>
                    <td><img src="uploads/${banner.fileupload}" width="100"/>${banner.fileupload}</td>
                    
 <td>
  <a href="deletebanner?id=${banner.id}&file=${banner.fileupload}"
     onclick="return confirm('Are you sure you want to delete this banner?')">
    <i class="fa fa-trash" aria-hidden="true"></i> Delete
  </a>
</td>

                    
                </tr>
            </c:forEach>
        </table>

        <form action="uploadBanner" method="post" enctype="multipart/form-data">
            <label>Description:</label>
            <input type="text" name="description" required />

            <label>Name:</label>
            <input type="text" name="name" required />

            <label>Upload File: (*Banner Ratio Is 16520x4608)</label>
            <input type="file" name="multipartFile" required />


            <button type="submit">Upload</button>
        </form>
        </div>

        <!-- Customers Section -->
        <div id="MakeupGalary" class="section">
           <form action="uploadMakeupImage" method="post" enctype="multipart/form-data">
    <label>Image Name:</label>
    <input type="text" name="imageName" required />

    <label>Upload Makeup Image:</label>
    <input type="file" name="multipartFile" required />

    <button type="submit">Upload</button>
</form>

<h3>Makeup Gallery</h3>
<table border="1" cellpadding="10" cellspacing="0">
    <thead>
        <tr>
            <th>ID</th>
            <th>Image Name</th>
            <th>Preview</th>
            <th>File Name</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="img" items="${galleryList}">
            <tr>
                <td>${img.id}</td>
                <td>${img.imageName}</td>
                <td>
                    <img src="uploads/${img.fileName}" width="100" height="100" />
                </td>
                <td>${img.fileName}</td>
                <td>
                    <a href="deleteMakeupImage?id=${img.id}&file=${img.fileName}" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>


        </div>

        <!-- Makeup Services Section -->
        <div id="makeup" class="section service-container">
           <h3>Makeup Services</h3>

    <!-- Add Service Form -->
    <form action="addService" method="post" class="service-form" >
        <label>Title:</label>
        <input type="text" name="title" required>

        <label>Overview:</label>
        <input type="text" name="overview" required>

        <label>Description (each point on a new line):</label>
        <textarea name="description" rows="6" required></textarea>

        <button type="submit" class="btn">Add Service</button>
    </form>

    <!-- Existing Services Table -->
    <table class="service-table">
        <thead>
            <tr>
                <th>Title</th>
                <th>Overview</th>
                <th>Description</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="s" items="${serviceList}">
                <tr>
                    <td>${s.title}</td>
                    <td>${s.overview}</td>
                    <td>
                         <c:forEach var="line" items="${s.descList}">
            <li>${line}</li>
        </c:forEach>

 

                    </td>
                    <td>
                       <a href="delete/${s.id}"  onclick="return confirm('Are you sure you want to delete this banner?')" ><i class="fa fa-trash" aria-hidden="true"></i>Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
        </div>

        <!-- Settings Section -->
        <div id="rentalgalary" class="section">
           <h2>Rental Gallery Upload</h2>

<!-- Upload Form -->
<div class="form-section">
 <form method="POST" action="uploadRentalGallery" enctype="multipart/form-data">
    
    <label>Image Name:</label>
    <input type="text" name="imageName" required />

    <label>Description:</label>
    <textarea name="description" rows="4" required></textarea>

    <label>Select Category:</label>
    <select name="categoryId" required>
        <option value="0">-- Select --</option>
        <!-- Populate using JSTL or Java -->
        <!-- Example: -->
        <c:forEach var="cat" items="${categoryList}">
             <option value="${cat.id}">${cat.name}</option>
        </c:forEach> 
    </select>

    <label>Or Add New Category:</label>
    <input type="text" name="newCategory" placeholder="Type new category (optional)" />

    <label>Choose Image File:</label>
    <input type="file" name="multipartFile" required />

    <input type="submit" value="Upload" class="btn" />
</form>

</div>

<!-- Table Section -->
<div class="table-section">
    <h3>Uploaded Rental Gallery Items</h3>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Image Name</th>
                <th>Category</th>
                <th>Description</th>
                <th>Image Preview</th>
                <th>Filename</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${galleries}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.imageName}</td>
                    <td>${item.category.name}</td>
                    <td>${item.description}</td>
                    <td><img src="uploads/rental/${item.filename}" alt="Image" width="100" height="100" /></td>
                    <td>${item.filename}</td>
                    <td>
                        
                        <a href="deleteRentalGallery/${item.id}&${item.filename}" onclick="return confirm('Are you sure you want to delete this item?')">Delete</a>
                   </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
        </div>

        <!-- Logout Section -->
        <div id="review" class="section">
            <div class="container-fluid">
        <div class="row">
            <!-- Include your sidebar here if needed -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Customer Reviews</h1>
                </div>

                <div class="table-container1">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Rating</th>
                                    <th>Review</th>
                                    <th>Date</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="review" items="${reviewList}">
                                    <tr>
                                        <td>${review.id}</td>
                                        <td>${review.name}</td>
                                        <td>
                                            <div class="rating-stars">
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
                                                (${review.rating})
                                            </div>
                                        </td>
                                        <td>
                                            <div class="text-truncate" style="max-width: 300px;">
                                                ${review.review}
                                            </div>
                                        </td>
                                        <td>
                                            <fmt:formatDate value="${review.reviewDate}" pattern="MMM dd, yyyy"/>
                                        </td>
                                        <td class="action-btns">
                                         <a class="btn btn-sm btn-danger delete-review" href="reviewdelete/${review.id}">
                                                <i class="fas fa-trash-alt"></i> Delete
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
        </div>
    </div>
        </div>
    </div>

<!-- Consolidated JavaScript -->
    <script>
        // Global variables
        let activeTab = 'rental';
        let activeInquiryTab = 'rental';
        let currentSection = 'dashboard';

        // Initialize the dashboard
        document.addEventListener('DOMContentLoaded', function() {
            // Set up event listeners for sidebar navigation
            document.querySelectorAll('.sidebar-menu li').forEach(item => {
                item.addEventListener('click', function() {
                    const sectionId = this.getAttribute('onclick').match(/'([^']+)'/)[1];
                    showSection(sectionId);
                });
            });

            // Order tab switching
            const rentalTab = document.getElementById('rental-tab');
            const serviceTab = document.getElementById('service-tab');
            
            if (rentalTab && serviceTab) {
                rentalTab.addEventListener('click', () => switchTab('rental'));
                serviceTab.addEventListener('click', () => switchTab('service'));
            }

            // Inquiry tab switching
            document.querySelectorAll('.inquiry-tab-btn').forEach(btn => {
                btn.addEventListener('click', function() {
                    const tab = this.getAttribute('data-tab').split('-')[0];
                    switchInquiryTab(tab);
                });
            });

           
        });

        // Show the selected section
        function showSection(sectionId) {
            // Hide all sections
            document.querySelectorAll('.section').forEach(sec => {
                sec.classList.remove('active');
            });

            // Show selected section
            const selectedSection = document.getElementById(sectionId);
            if (selectedSection) {
                selectedSection.classList.add('active');
                currentSection = sectionId;

                // Update section title
                const titleElement = selectedSection.querySelector('h2, h3');
                if (titleElement) {
                    document.getElementById('section-title').textContent = titleElement.textContent;
                }
            }

            // Update active sidebar item
            document.querySelectorAll('.sidebar-menu li').forEach(item => {
                item.classList.remove('active');
            });
            
            const activeMenuItem = document.querySelector(`.sidebar-menu li[onclick*="${sectionId}"]`);
            if (activeMenuItem) {
                activeMenuItem.classList.add('active');
            }
        }

        // Switch between order tabs
        function switchTab(tab) {
            activeTab = tab;

            // Update tab button styling
            const rentalTabBtn = document.getElementById('rental-tab');
            const serviceTabBtn = document.getElementById('service-tab');
            
            if (rentalTabBtn && serviceTabBtn) {
                rentalTabBtn.classList.toggle('active', tab === 'rental');
                serviceTabBtn.classList.toggle('active', tab === 'service');
            }

            // Toggle tab content visibility
            const rentalContent = document.getElementById('rental-content');
            const serviceContent = document.getElementById('service-content');
            
            if (rentalContent && serviceContent) {
                rentalContent.classList.toggle('active', tab === 'rental');
                serviceContent.classList.toggle('active', tab === 'service');
            }

           
        }

        // Switch between inquiry tabs
        function switchInquiryTab(tab) {
            activeInquiryTab = tab;

            // Update tab button styling
            document.querySelectorAll('.inquiry-tab-btn').forEach(btn => {
                btn.classList.toggle('active', btn.getAttribute('data-tab') === `${tab}-inquiry`);
            });

            // Toggle content visibility
            const rentalInquiryContent = document.getElementById('rental-inquiry-content');
            const serviceInquiryContent = document.getElementById('service-inquiry-content');
            
            if (rentalInquiryContent && serviceInquiryContent) {
                rentalInquiryContent.classList.toggle('active', tab === 'rental');
                serviceInquiryContent.classList.toggle('active', tab === 'service');
            }

           
        }

       

        // Export orders data
        function exportOrders(type) {
            const params = new URLSearchParams({
                type,
                status: document.getElementById('order-status-filter')?.value || 'all',
                search: document.getElementById('order-search')?.value || ''
            });
            window.location.href = `exportOrders?${params.toString()}`;
        }

        // Export inquiries data
        function exportInquiries(type) {
            const params = new URLSearchParams({
                type,
                status: document.getElementById('inquiry-status-filter')?.value || 'all',
                search: document.getElementById('inquiry-search')?.value || ''
            });
            window.location.href = `exportInquiries?${params.toString()}`;
        }

        // Refresh the dashboard
        function refreshDashboard() {
            location.reload();
        }
        
        // Orders filter
        document.getElementById('order-status-filter').addEventListener('change', filterOrders);
        document.getElementById('order-search').addEventListener('input', filterOrders);

        function filterOrders() {
          const statusFilter = document.getElementById('order-status-filter').value.toUpperCase();
          const searchTerm = document.getElementById('order-search').value.toLowerCase();
          const orderCards = document.querySelectorAll('#orders .order-card');

          orderCards.forEach(card => {
            const status = card.getAttribute('data-status').toUpperCase();
            const searchData = card.getAttribute('data-search').toLowerCase();

            const matchesStatus = (statusFilter === 'ALL') || (status === statusFilter);
            const matchesSearch = searchData.includes(searchTerm);

            if (matchesStatus && matchesSearch) {
              card.style.display = 'block';
            } else {
              card.style.display = 'none';
            }
          });
        }

        // Inquiry filter
        document.getElementById('inquiry-status-filter').addEventListener('change', filterInquiries);
        document.getElementById('inquiry-search').addEventListener('input', filterInquiries);

        function filterInquiries() {
          const statusFilter = document.getElementById('inquiry-status-filter').value.toUpperCase();
          const searchTerm = document.getElementById('inquiry-search').value.toLowerCase();
          const inquiryCards = document.querySelectorAll('#inquery .inquiry-card');

          inquiryCards.forEach(card => {
            const status = card.getAttribute('data-status').toUpperCase();
            const searchData = card.getAttribute('data-search').toLowerCase();

            const matchesStatus = (statusFilter === 'ALL') || (status === statusFilter);
            const matchesSearch = searchData.includes(searchTerm);

            if (matchesStatus && matchesSearch) {
              card.style.display = 'block';
            } else {
              card.style.display = 'none';
            }
          });
        }
    </script>


</body>
</html>
