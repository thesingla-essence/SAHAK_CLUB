<div align="center">

# 🎓 SAHAK Clubs Management System

### *Department of Computer Science & Applications, Panjab University, Chandigarh*

[![Java](https://img.shields.io/badge/Java-21-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://www.oracle.com/java/)
[![Jakarta EE](https://img.shields.io/badge/Jakarta%20EE-10-orange?style=for-the-badge&logo=eclipse&logoColor=white)](https://jakarta.ee/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Apache Tomcat](https://img.shields.io/badge/Tomcat-10.1-F8DC75?style=for-the-badge&logo=apache-tomcat&logoColor=black)](https://tomcat.apache.org/)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-5.3-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white)](https://getbootstrap.com/)

<p align="center">
  <img src="https://img.shields.io/badge/Status-Active-success?style=flat-square" alt="Status">
  <img src="https://img.shields.io/badge/Maintained-Yes-green?style=flat-square" alt="Maintained">
</p>

**A comprehensive web application for managing and showcasing student clubs at DCSA, Panjab University, Chandigarh**

[📖 Documentation](#-table-of-contents) • [🛠️ Installation](#-installation) • [💻 Usage](#-usage)

---

</div>

## 📑 Table of Contents

- [✨ Overview](#-overview)
- [🎯 Features](#-features)
- [🏗️ Architecture](#️-architecture)
- [🛠️ Technology Stack](#️-technology-stack)
- [📁 Project Structure](#-project-structure)
- [⚙️ Installation](#-installation)
- [💻 Usage](#-usage)
- [🖼️ Screenshots](#️-screenshots)
- [🔐 Admin Panel](#-admin-panel)
- [🗄️ Database Schema](#️-database-schema)
- [🚀 Deployment](#-deployment)
- [🤝 Contributing](#-contributing)
- [👨‍💻 Author](#-author)

---

## ✨ Overview

**SAHAK Clubs Management System** is a full-stack Jakarta EE web application developed specifically for the **Department of Computer Science & Applications (DCSA), Panjab University, Chandigarh**. This platform serves as a centralized hub for managing and showcasing various student clubs and societies within the department.

### 🎯 Purpose

The application bridges the gap between club administrators and students by providing:
- **Public Portal**: Students can explore all active clubs, view details, and connect with coordinators
- **Admin Dashboard**: Faculty and student coordinators can efficiently manage club information
- **Engagement Tracking**: Monitor and display club engagement metrics
- **Image Management**: Upload and manage club logos/banners with automatic optimization

### 🌟 Highlights

- 🔒 **Secure Authentication** - Protected admin panel with session management
- 📱 **Responsive Design** - Works seamlessly on desktop, tablet, and mobile devices
- 🎨 **Modern UI/UX** - Bootstrap 5 with AOS animations for smooth user experience
- 🖼️ **Image Upload System** - Robust file handling with validation and storage
- 🔍 **SEO Optimized** - Proper meta tags and semantic HTML structure
- ⚡ **Performance Optimized** - Resource preloading and efficient database queries

---

## 🎯 Features

### 👥 Public Features

<table>
<tr>
<td width="50%">

#### 📋 Club Listing
- Browse all active clubs in the department
- Beautiful card-based layout with images
- Sort by creation date (newest first)
- Quick view of coordinators and engagement

</td>
<td width="50%">

#### 🔍 Club Details
- Comprehensive club information
- Faculty and student coordinator details
- Club description and objectives
- High-quality club images
- Engagement statistics

</td>
</tr>
<tr>
<td width="50%">

#### 🎨 User Experience
- Smooth AOS animations
- Responsive navigation
- Clean, modern design
- Fast page load times
- Accessibility compliant

</td>
<td width="50%">

#### 🔗 Easy Navigation
- Intuitive menu structure
- Direct admin portal access
- Smooth scrolling sections
- Mobile-friendly hamburger menu

</td>
</tr>
</table>

### 🔐 Admin Features

<table>
<tr>
<td width="50%">

#### 🛡️ Authentication
- Secure login system
- Session-based authentication
- Auto-redirect on unauthorized access
- Logout functionality
- Cache prevention for security

</td>
<td width="50%">

#### ➕ Club Management
- **Create** new clubs with complete details
- **Read** all club information
- **Update** existing club data
- **Delete** clubs with confirmation
- Real-time updates

</td>
</tr>
<tr>
<td width="50%">

#### 🖼️ Image Management
- Upload club logos/banners
- Multiple format support (JPG, PNG, GIF, WebP)
- Max file size: 8MB
- Automatic filename sanitization
- Unique timestamp-based naming
- Preview before upload

</td>
<td width="50%">

#### 📊 Dashboard
- View all clubs at a glance
- Quick edit/delete actions
- Search and filter options
- Responsive admin interface
- Success/error notifications

</td>
</tr>
</table>

---

## 🏗️ Architecture

### System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        Client Layer                          │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │   Browser    │  │    Mobile    │  │    Tablet    │      │
│  │  (Desktop)   │  │   Browser    │  │   Browser    │      │
│  └──────────────┘  └──────────────┘  └──────────────┘      │
└────────────────────────┬────────────────────────────────────┘
                         │ HTTP/HTTPS
┌────────────────────────▼────────────────────────────────────┐
│                   Presentation Layer                         │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  JSP Views (index.jsp, club.jsp, admin pages)       │   │
│  │  + Bootstrap 5 + Custom CSS + AOS Animations        │   │
│  └──────────────────────────────────────────────────────┘   │
└────────────────────────┬────────────────────────────────────┘
                         │
┌────────────────────────▼────────────────────────────────────┐
│                   Application Layer                          │
│  ┌──────────────────────────────────────────────────────┐   │
│  │              Apache Tomcat 10.1                      │   │
│  │          (Jakarta Servlet Container)                 │   │
│  └──────────────────────────────────────────────────────┘   │
│                                                              │
│  ┌──────────────────────────────────────────────────────┐   │
│  │                   Servlets Layer                     │   │
│  │  • ListClubsServlet    • AdminLoginServlet          │   │
│  │  • ClubDetailsServlet  • AddClubServlet             │   │
│  │  • ImageServlet        • EditClubServlet            │   │
│  │  • UpdateClubServlet   • DeleteClubServlet          │   │
│  │  • LogoutServlet       • AdminDashboardServlet      │   │
│  └──────────────────────────────────────────────────────┘   │
│                                                              │
│  ┌──────────────────────────────────────────────────────┐   │
│  │                  Filters Layer                       │   │
│  │  • NoCacheFilter (Security)                         │   │
│  └──────────────────────────────────────────────────────┘   │
└────────────────────────┬────────────────────────────────────┘
                         │
┌────────────────────────▼────────────────────────────────────┐
│                   Business Logic Layer                       │
│  ┌──────────────────────────────────────────────────────┐   │
│  │               DAO (Data Access Objects)              │   │
│  │  • ClubDAO.java (CRUD Operations)                   │   │
│  │    - listAll()    - findById()                      │   │
│  │    - addClub()    - updateClub()                    │   │
│  │    - deleteClub()                                   │   │
│  └──────────────────────────────────────────────────────┘   │
│                                                              │
│  ┌──────────────────────────────────────────────────────┐   │
│  │              Model (Domain Objects)                  │   │
│  │  • Club.java (JavaBean/POJO)                        │   │
│  └──────────────────────────────────────────────────────┘   │
│                                                              │
│  ┌──────────────────────────────────────────────────────┐   │
│  │                Utility Classes                       │   │
│  │  • DBUtil.java (Database Connection Manager)        │   │
│  └──────────────────────────────────────────────────────┘   │
└────────────────────────┬────────────────────────────────────┘
                         │ JDBC
┌────────────────────────▼────────────────────────────────────┐
│                   Data Layer                                 │
│  ┌──────────────────────────────────────────────────────┐   │
│  │               MySQL Database 8.0                     │   │
│  │  Database: sahak_club_db                            │   │
│  │  Tables:                                            │   │
│  │    • clubs (main table)                             │   │
│  │    • admins (authentication)                        │   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                         │
┌────────────────────────▼────────────────────────────────────┐
│                   File Storage Layer                         │
│  ┌──────────────────────────────────────────────────────┐   │
│  │      Local File System (D:/sahakclub_uploads/)       │   │
│  │        • images/ (Club logos and banners)            │   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

### Request Flow

```
User Request → Tomcat → Servlet Mapping → Servlet Processing → DAO Layer → Database
                ↓
         JSP Response ← Data Binding ← Model Objects ← ResultSet Mapping ← SQL Query
```

---

## 🛠️ Technology Stack

### Backend Technologies

| Technology | Version | Purpose |
|-----------|---------|---------|
| **Java** | 21 | Core programming language with latest features |
| **Jakarta EE** | 10 | Enterprise-grade web application framework |
| **Servlets API** | 5.0 | HTTP request/response handling |
| **JSP** | 3.0 | Server-side templating and dynamic content |
| **JDBC** | Latest | Database connectivity and operations |
| **Apache Tomcat** | 10.1 | Servlet container and web server |

### Frontend Technologies

| Technology | Version | Purpose |
|-----------|---------|---------|
| **HTML5** | Latest | Semantic markup structure |
| **CSS3** | Latest | Custom styling and animations |
| **JavaScript** | ES6+ | Client-side interactivity |
| **Bootstrap** | 5.3.2 | Responsive UI framework |
| **Bootstrap Icons** | 1.11.3 | Icon library |
| **AOS Library** | 2.3.1 | Scroll animations |

### Database

| Technology | Version | Purpose |
|-----------|---------|---------|
| **MySQL** | 8.0+ | Relational database management |
| **MySQL Connector/J** | Latest | JDBC driver for MySQL |

### Development Tools

- **Eclipse IDE** - WTP (Web Tools Platform) for Jakarta EE development
- **Git** - Version control system
- **Windows PowerShell** - Build automation and deployment

### Key Libraries & Frameworks

```xml
<!-- Jakarta Servlet API -->
jakarta.servlet-api (5.0)

<!-- JDBC Driver -->
mysql-connector-java (latest)

<!-- Frontend CDN Resources -->
Bootstrap 5.3.2
AOS Animations 2.3.1
Bootstrap Icons 1.11.3
```

---

## 📁 Project Structure

```
sahak_club/
│
├── 📁 src/main/
│   ├── 📁 java/com/sahakclub/
│   │   ├── 📁 dao/
│   │   │   └── 📄 ClubDAO.java              # Database access layer
│   │   ├── 📁 filters/
│   │   │   └── 📄 NoCacheFilter.java        # Security filter for admin pages
│   │   ├── 📁 model/
│   │   │   └── 📄 Club.java                 # Domain model (POJO)
│   │   ├── 📁 servlets/
│   │   │   ├── 📄 AddClubServlet.java       # Create new club
│   │   │   ├── 📄 AdminDashboardServlet.java # Admin home page
│   │   │   ├── 📄 AdminLoginServlet.java    # Authentication
│   │   │   ├── 📄 ClubDetailsServlet.java   # Single club view
│   │   │   ├── 📄 DeleteClubServlet.java    # Remove club
│   │   │   ├── 📄 EditClubServlet.java      # Load edit form
│   │   │   ├── 📄 ImageServlet.java         # Serve uploaded images
│   │   │   ├── 📄 ListClubsServlet.java     # Public club listing
│   │   │   ├── 📄 LogoutServlet.java        # Session termination
│   │   │   └── 📄 UpdateClubServlet.java    # Update club data
│   │   └── 📁 util/
│   │       └── 📄 DBUtil.java               # Database connection utility
│   │
│   └── 📁 webapp/
│       ├── 📁 admin/
│       │   └── 📄 add-club.jsp              # Admin add club form
│       ├── 📁 assets/
│       │   ├── 📁 css/
│       │   │   └── 📄 main.css              # Custom styles
│       │   └── 📁 js/
│       │       ├── 📄 club-form.js          # Form validation & preview
│       │       └── 📄 main.js               # General scripts
│       ├── 📁 images/                        # Static web images
│       ├── 📁 WEB-INF/
│       │   ├── 📁 lib/                       # JAR libraries
│       │   └── 📄 web.xml                   # Deployment descriptor
│       ├── 📁 META-INF/
│       │   └── 📄 MANIFEST.MF
│       ├── 📄 index.jsp                     # Public homepage
│       ├── 📄 club.jsp                      # Club detail page
│       ├── 📄 club_list.jsp                 # Alternative listing view
│       ├── 📄 admin-login.jsp               # Login page
│       ├── 📄 admin-dashboard.jsp           # Admin dashboard
│       ├── 📄 edit-club.jsp                 # Edit club form
│       └── 📄 add-club.jsp                  # Legacy add form
│
├── 📁 build/classes/                        # Compiled .class files
│
├── 📄 .classpath                            # Eclipse classpath config
├── 📄 .project                              # Eclipse project config
├── 📄 PROJECT_DOCUMENTATION.md              # Detailed documentation
├── 📄 FULL_PROJECT_WALKTHROUGH.md           # Code walkthrough
├── 📄 IMAGE_UPLOAD_FIX.md                   # Upload troubleshooting
├── 📄 REBUILD_INSTRUCTIONS.md               # Build guidelines
└── 📄 README.md                             # This file
```

### Directory Breakdown

#### `/src/main/java` - Java Source Files
- **dao/** - Data Access Objects for database operations
- **filters/** - Servlet filters for cross-cutting concerns
- **model/** - Domain models (POJOs/JavaBeans)
- **servlets/** - HTTP request handlers (Controllers)
- **util/** - Utility classes and helpers

#### `/src/main/webapp` - Web Resources
- **admin/** - Admin-specific JSP pages
- **assets/** - Static resources (CSS, JavaScript, images)
- **WEB-INF/** - Protected resources (config, libraries)
- **JSP files** - View templates

#### `/build` - Compiled Output
- Contains compiled `.class` files ready for deployment

---

## ⚙️ Installation

### Prerequisites

Before you begin, ensure you have the following installed:

- ✅ **Java Development Kit (JDK) 21** or higher
  ```bash
  java -version
  ```
  
- ✅ **Apache Tomcat 10.1** or higher
  - Download from: https://tomcat.apache.org/download-10.cgi
  
- ✅ **MySQL 8.0** or higher
  ```bash
  mysql --version
  ```
  
- ✅ **Eclipse IDE** for Enterprise Java and Web Developers
  - Or any Jakarta EE compatible IDE
  
- ✅ **Git** (for cloning the repository)
  ```bash
  git --version
  ```

### Step 1: Clone the Repository

```bash
git clone https://github.com/yourusername/sahak-club.git
cd sahak-club
```

### Step 2: Database Setup

#### Create Database

```sql
-- Login to MySQL
mysql -u root -p

-- Create database
CREATE DATABASE sahak_club_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE sahak_club_db;
```

#### Create Tables

```sql
-- Clubs table
CREATE TABLE clubs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    faculty_coordinator VARCHAR(255) NOT NULL,
    student_coordinator VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    image_url VARCHAR(500) DEFAULT 'placeholder.png',
    engagement VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Admins table (for authentication)
CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert default admin (username: admin, password: admin123)
INSERT INTO admins (username, password) VALUES ('admin', 'admin123');
```

#### Insert Sample Data (Optional)

```sql
INSERT INTO clubs (name, faculty_coordinator, student_coordinator, description, engagement) VALUES
('Coding Club', 'Dr. Rajesh Kumar', 'Amit Sharma', 'A community for coding enthusiasts to learn and compete in programming contests.', '150+ Members'),
('AI & ML Society', 'Dr. Priya Singh', 'Neha Verma', 'Exploring artificial intelligence and machine learning through workshops and projects.', '120+ Members'),
('Web Development Club', 'Prof. Sandeep Gupta', 'Rohit Mehra', 'Building modern web applications and learning latest web technologies.', '100+ Members'),
('Cybersecurity Club', 'Dr. Anjali Kapoor', 'Vikram Singh', 'Focus on ethical hacking, network security, and cybersecurity awareness.', '80+ Members');
```

### Step 3: Configure Database Connection

Edit `src/main/java/com/sahakclub/util/DBUtil.java`:

```java
private static final String URL = "jdbc:mysql://localhost:3306/sahak_club_db";
private static final String USER = "root";           // Your MySQL username
private static final String PASSWORD = "yourpassword"; // Your MySQL password
```

### Step 4: Create Upload Directory

```bash
# Windows
mkdir D:\sahakclub_uploads\images

# Linux/Mac
mkdir -p /var/sahakclub_uploads/images
```

**Note:** If you use a different path, update `ImageServlet.java` accordingly.

### Step 5: Import into Eclipse

1. Open **Eclipse IDE**
2. Go to **File → Import → Existing Projects into Workspace**
3. Select the cloned project directory
4. Click **Finish**

### Step 6: Configure Tomcat in Eclipse

1. Go to **Window → Preferences → Server → Runtime Environments**
2. Click **Add** → Select **Apache Tomcat v10.1**
3. Browse to your Tomcat installation directory
4. Click **Finish**

### Step 7: Add MySQL JDBC Driver

1. Download **MySQL Connector/J** from https://dev.mysql.com/downloads/connector/j/
2. Copy the `.jar` file to `src/main/webapp/WEB-INF/lib/`

### Step 8: Build and Deploy

1. Right-click on the project → **Run As → Run on Server**
2. Select your configured Tomcat server
3. Click **Finish**

The application should now be running at: **http://localhost:8080/sahak_club/**

---

## 💻 Usage

### Public Access

#### View All Clubs
1. Navigate to: `http://localhost:8080/sahak_club/`
2. Browse the list of all active clubs
3. Click on any club card to view detailed information

#### View Club Details
1. Click on a club card from the homepage
2. View comprehensive club information including:
   - Club name and description
   - Faculty coordinator
   - Student coordinator
   - Engagement statistics
   - Club logo/banner

### Admin Access

#### Login to Admin Panel

1. Click **"Admin Portal"** button in the navigation
2. Enter credentials:
   - **Username:** `admin`
   - **Password:** `admin123`
3. Click **"Login"**

#### Add New Club

1. From the admin dashboard, click **"Add New Club"**
2. Fill in the form:
   - **Club Name** (required)
   - **Faculty Coordinator** (required)
   - **Student Coordinator** (required)
   - **Description** (required)
   - **Engagement** (e.g., "150+ Members")
   - **Club Image** (JPG, PNG, GIF, or WebP - Max 8MB)
3. Click **"Add Club"**

#### Edit Existing Club

1. From the admin dashboard, find the club you want to edit
2. Click the **"Edit"** button
3. Modify the required fields
4. Optionally change the club image:
   - Click **"Change Image"** button
   - Select a new image file
   - Preview will be shown
5. Click **"Save Changes"**

#### Delete Club

1. From the admin dashboard, find the club you want to delete
2. Click the **"Delete"** button
3. Confirm the deletion in the popup dialog

#### Logout

Click the **"Logout"** button in the admin navigation to end your session.

---

## 🖼️ Screenshots

### Public Interface

<div align="center">

#### Homepage - Club Listing
```
╔════════════════════════════════════════════════════════════════╗
║                    SAHAK • DCSA Clubs                          ║
║  Home | About | Clubs | Connect | [Admin Portal]              ║
╠════════════════════════════════════════════════════════════════╣
║                                                                ║
║            Welcome to DCSA Student Clubs                      ║
║        Explore, Connect, and Engage with Our Clubs            ║
║                                                                ║
╠════════════════════════════════════════════════════════════════╣
║  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐          ║
║  │ [Club Img]  │  │ [Club Img]  │  │ [Club Img]  │          ║
║  │ Coding Club │  │ AI/ML Club  │  │ Web Dev Club│          ║
║  │ 150+ Members│  │ 120+ Members│  │ 100+ Members│          ║
║  │ [View More] │  │ [View More] │  │ [View More] │          ║
║  └─────────────┘  └─────────────┘  └─────────────┘          ║
╚════════════════════════════════════════════════════════════════╝
```

#### Club Detail Page
```
╔════════════════════════════════════════════════════════════════╗
║  ← Back to Clubs                                              ║
╠════════════════════════════════════════════════════════════════╣
║                                                                ║
║                    [Large Club Image]                         ║
║                                                                ║
║  Coding Club                                   150+ Members    ║
║  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━    ║
║                                                                ║
║  👨‍🏫 Faculty Coordinator: Dr. Rajesh Kumar                     ║
║  👨‍🎓 Student Coordinator: Amit Sharma                          ║
║                                                                ║
║  📝 About This Club                                           ║
║  A community for coding enthusiasts to learn and compete      ║
║  in programming contests...                                   ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
```

</div>

### Admin Interface

<div align="center">

#### Admin Login
```
╔════════════════════════════════════════════════════════════════╗
║                    Admin Login Portal                         ║
╠════════════════════════════════════════════════════════════════╣
║                                                                ║
║  👤 Username: [________________]                              ║
║  🔒 Password: [________________]                              ║
║                                                                ║
║              [        Login        ]                          ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
```

#### Admin Dashboard
```
╔════════════════════════════════════════════════════════════════╗
║  SAHAK Admin Panel                           [Logout]         ║
╠════════════════════════════════════════════════════════════════╣
║  Manage Clubs                    [+ Add New Club]             ║
║  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━    ║
║                                                                ║
║  Coding Club                                                  ║
║  Faculty: Dr. Rajesh Kumar | Student: Amit Sharma            ║
║  [Edit] [Delete]                                              ║
║  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━    ║
║                                                                ║
║  AI & ML Society                                              ║
║  Faculty: Dr. Priya Singh | Student: Neha Verma              ║
║  [Edit] [Delete]                                              ║
║  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━    ║
╚════════════════════════════════════════════════════════════════╝
```

#### Add/Edit Club Form
```
╔════════════════════════════════════════════════════════════════╗
║  Add New Club                                                 ║
╠════════════════════════════════════════════════════════════════╣
║                                                                ║
║  Club Name *                                                  ║
║  [_______________________________________________________]    ║
║                                                                ║
║  Faculty Coordinator *                                        ║
║  [_______________________________________________________]    ║
║                                                                ║
║  Student Coordinator *                                        ║
║  [_______________________________________________________]    ║
║                                                                ║
║  Description *                                                ║
║  [_______________________________________________________]    ║
║  [_______________________________________________________]    ║
║  [_______________________________________________________]    ║
║                                                                ║
║  Engagement (e.g., "150+ Members")                           ║
║  [_______________________________________________________]    ║
║                                                                ║
║  Club Image (JPG, PNG, GIF, WebP - Max 8MB)                  ║
║  [Choose File]  [📷 Preview]                                  ║
║                                                                ║
║  [Cancel]                                    [Add Club]       ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
```

</div>

---

## 🔐 Admin Panel

### Features

- **Secure Authentication**: Session-based login system
- **CRUD Operations**: Full control over club data
- **Image Upload**: Drag-and-drop or browse for images
- **Real-time Preview**: See image before uploading
- **Form Validation**: Client and server-side validation
- **Error Handling**: Comprehensive error messages
- **Cache Prevention**: Security filter prevents sensitive data caching

### Default Credentials

```
Username: admin
Password: admin123
```

**⚠️ IMPORTANT**: Change the default admin password in production!

### Session Management

- Sessions expire after **30 minutes** of inactivity
- Admin pages are protected by authentication filter
- Automatic redirect to login page for unauthorized access
- No-cache headers prevent sensitive data exposure

### Security Features

1. **Session-based Authentication** - No tokens stored in browser
2. **No-Cache Filter** - Prevents browser caching of admin pages
3. **Server-side Validation** - All inputs validated on server
4. **SQL Injection Prevention** - PreparedStatements used throughout
5. **File Type Validation** - Only allowed image formats accepted
6. **File Size Limits** - Maximum 8MB per upload

---

## 🗄️ Database Schema

### Tables Overview

```sql
sahak_club_db
├── clubs          (Main table for club information)
└── admins         (Admin authentication)
```

### Detailed Schema

#### `clubs` Table

| Column | Type | Constraints | Description |
|--------|------|------------|-------------|
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Unique club identifier |
| `name` | VARCHAR(255) | NOT NULL | Club name |
| `faculty_coordinator` | VARCHAR(255) | NOT NULL | Faculty in-charge name |
| `student_coordinator` | VARCHAR(255) | NOT NULL | Student coordinator name |
| `description` | TEXT | NOT NULL | Club description and objectives |
| `image_url` | VARCHAR(500) | DEFAULT 'placeholder.png' | Image filename |
| `engagement` | VARCHAR(100) | NULL | Engagement metrics (e.g., "150+ Members") |
| `created_at` | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Record creation time |
| `updated_at` | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP ON UPDATE | Last update time |

**Indexes:**
- PRIMARY KEY on `id`
- INDEX on `created_at` for faster sorting

#### `admins` Table

| Column | Type | Constraints | Description |
|--------|------|------------|-------------|
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Unique admin identifier |
| `username` | VARCHAR(100) | NOT NULL, UNIQUE | Admin username |
| `password` | VARCHAR(255) | NOT NULL | Admin password (plain text - use hashing in production) |
| `created_at` | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Account creation time |

**Indexes:**
- PRIMARY KEY on `id`
- UNIQUE INDEX on `username`

### Sample Data

```sql
-- Sample clubs
INSERT INTO clubs (name, faculty_coordinator, student_coordinator, description, engagement) VALUES
('Coding Club', 'Dr. Rajesh Kumar', 'Amit Sharma', 
 'A community for coding enthusiasts to learn and compete in programming contests.', 
 '150+ Members'),
 
('AI & ML Society', 'Dr. Priya Singh', 'Neha Verma', 
 'Exploring artificial intelligence and machine learning through workshops and projects.', 
 '120+ Members');
```

### ER Diagram

```
┌─────────────────────────┐
│        admins           │
├─────────────────────────┤
│ PK │ id               │
│    │ username (UNIQUE)│
│    │ password         │
│    │ created_at       │
└─────────────────────────┘

┌─────────────────────────────┐
│          clubs              │
├─────────────────────────────┤
│ PK │ id                   │
│    │ name                 │
│    │ faculty_coordinator  │
│    │ student_coordinator  │
│    │ description          │
│    │ image_url            │
│    │ engagement           │
│    │ created_at (INDEX)   │
│    │ updated_at           │
└─────────────────────────────┘
```

---

## 🚀 Deployment

### Production Deployment Checklist

#### Security

- [ ] Change default admin credentials
- [ ] Implement password hashing (BCrypt recommended)
- [ ] Use HTTPS for all connections
- [ ] Set secure session cookies
- [ ] Enable CORS protection
- [ ] Implement rate limiting
- [ ] Add CSRF protection
- [ ] Sanitize all user inputs
- [ ] Use environment variables for sensitive data

#### Database

- [ ] Create database user with limited privileges
- [ ] Use connection pooling (HikariCP recommended)
- [ ] Set up database backups
- [ ] Enable query logging for monitoring
- [ ] Optimize indexes for performance

#### Application

- [ ] Externalize configuration (database credentials, upload paths)
- [ ] Set up logging framework (SLF4J + Logback)
- [ ] Configure production error pages
- [ ] Minify CSS and JavaScript
- [ ] Enable GZIP compression
- [ ] Set up CDN for static assets
- [ ] Configure proper cache headers

#### Server

- [ ] Use production-grade server (Apache Tomcat, WildFly)
- [ ] Set appropriate JVM heap size
- [ ] Enable JMX monitoring
- [ ] Configure server logs rotation
- [ ] Set up SSL/TLS certificates
- [ ] Configure firewall rules

### Deployment to Cloud (AWS Example)

```bash
# 1. Package the application as WAR
# In Eclipse: Export → WAR file

# 2. Deploy to AWS Elastic Beanstalk
eb init -p tomcat-10 sahak-club --region us-east-1
eb create sahak-club-env
eb deploy

# 3. Configure RDS MySQL database
# Set environment variables in EB console:
#   DB_URL=jdbc:mysql://your-rds-endpoint:3306/sahak_club_db
#   DB_USER=your_username
#   DB_PASS=your_password

# 4. Set up S3 for image storage (optional)
# Update ImageServlet to use AWS S3 SDK
```

### Environment Variables

Create a `config.properties` file (DO NOT commit to Git):

```properties
# Database Configuration
db.url=jdbc:mysql://localhost:3306/sahak_club_db
db.username=your_username
db.password=your_secure_password
db.pool.size=10

# Upload Configuration
upload.directory=/var/sahakclub_uploads/images
upload.max.size=8388608

# Session Configuration
session.timeout=1800

# Admin Configuration
admin.default.username=admin
admin.default.password=change_this_password
```

### Docker Deployment

```dockerfile
FROM tomcat:10.1-jdk21

# Copy WAR file
COPY target/sahak_club.war /usr/local/tomcat/webapps/

# Create upload directory
RUN mkdir -p /var/sahakclub_uploads/images

# Expose port
EXPOSE 8080

CMD ["catalina.sh", "run"]
```

```bash
# Build and run
docker build -t sahak-club .
docker run -p 8080:8080 -v /path/to/uploads:/var/sahakclub_uploads sahak-club
```

---

## 🤝 Contributing

Contributions are welcome! This project is maintained by students and faculty of DCSA, Panjab University.

### How to Contribute

1. **Fork the Repository**
   ```bash
   git clone https://github.com/yourusername/sahak-club.git
   cd sahak-club
   git checkout -b feature/your-feature-name
   ```

2. **Make Your Changes**
   - Follow existing code style
   - Add comments for complex logic
   - Update documentation if needed

3. **Test Your Changes**
   - Ensure all features work correctly
   - Test on different browsers
   - Verify database operations

4. **Commit Your Changes**
   ```bash
   git add .
   git commit -m "Add: descriptive commit message"
   ```

5. **Push and Create Pull Request**
   ```bash
   git push origin feature/your-feature-name
   ```

### Coding Standards

- **Java**: Follow Oracle Java Code Conventions
- **SQL**: Use uppercase for keywords, lowercase for table/column names
- **JSP**: Proper indentation, clear variable names
- **JavaScript**: ES6+ syntax, use const/let instead of var
- **CSS**: BEM naming convention for custom classes

### Feature Requests & Bug Reports

- Use GitHub Issues for bug reports and feature requests
- Provide detailed descriptions and screenshots if applicable
- Check existing issues before creating new ones

---

## 👨‍💻 Author

<div align="center">

### Developed for DCSA, Panjab University Chandigarh

---

### Project Developer

**Mahak**

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/thesingla-essence)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:minkisingla29@gmail.com)

---

### About DCSA

The Department of Computer Science & Applications at Panjab University is a premier institution for computer science education and research in North India. This project was developed as part of our department's initiative to enhance student engagement and club management.

**Visit:** [DCSA Website](https://puchd.ac.in/)

---

### Acknowledgments

- **Faculty Advisors** - For guidance and support
- **Department Administration** - For providing resources
- **Student Community** - For feedback and testing
- **Open Source Community** - For amazing tools and libraries

---

</div>

---

<div align="center">

### ⭐ Star this repository if you find it helpful!

**Made with ❤️ for DCSA, Panjab University Chandigarh**

![Visitors](https://visitor-badge.laobi.icu/badge?page_id=thesingla-essence.sahak-club)

---

*Last Updated: December 2024*

</div>
