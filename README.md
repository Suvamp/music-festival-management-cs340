# Music Festival Management System

A full-stack web application for managing music festival operations, built as part of CS 340 (Introduction to Databases) at Oregon State University.

**Group 42**  
Team Members: Suvam Patel, Kenneth Sieu

---

## Overview

The Music Festival Management System is a database-driven application designed to handle the complex logistics of organizing large-scale music festivals. The system manages festival events, coordinating artists, stages, performances, vendors, sponsors, and staff assignments.

This application provides a centralized platform for festival organizers to track all aspects of event management, from artist bookings and stage assignments to vendor registrations and sponsorship deals.

---

## Features

- **Festival Management**: Create, view, update, and delete festival events with details including dates, location, expected attendance, budget, and ticket pricing
- **Artist Booking**: Manage artist information including genre, booking fees, contact details, and country of origin
- **Stage Coordination**: Track stages within each festival including capacity, type, location, and cover status
- **Performance Scheduling**: Coordinate artist performances on stages with time slots, setup notes, and soundcheck times
- **Vendor Registration**: Handle food, beverage, and merchandise vendor assignments with booth allocations
- **Sponsorship Tracking**: Record corporate sponsorship deals with tiered benefit packages
- **Staff Scheduling**: Manage staff assignments across festivals with role-based organization and hour tracking
- **Database Reset**: One-click reset functionality to restore sample data
- **Full CRUD Operations**: Complete Create, Read, Update, and Delete functionality for all entities

---

## Technology Stack

### Frontend
| Technology | Purpose |
|------------|---------|
| React 19 | UI Framework |
| Vite 7 | Build Tool & Dev Server |
| React Router DOM | Client-side Routing |
| Tailwind CSS | Styling |
| Iconify | Icons |
| date-fns | Date Formatting |

### Backend
| Technology | Purpose |
|------------|---------|
| Node.js | Runtime Environment |
| Express 5 | Web Framework |
| MySQL2 | Database Driver |
| CORS | Cross-Origin Resource Sharing |

### Database
| Technology | Purpose |
|------------|---------|
| MySQL / MariaDB | Relational Database |
| Stored Procedures | Business Logic |

### DevOps
| Technology | Purpose |
|------------|---------|
| Forever | Process Manager (Production) |
| Nodemon | Development Auto-reload |

---

## Database Schema

### Entity Tables

| Table | Description | Primary Key |
|-------|-------------|-------------|
| `festivals` | Festival event information (name, dates, location, budget) | festivalID |
| `artists` | Performing artists (name, genre, booking fee, contact info) | artistID |
| `stages` | Performance stages linked to festivals | stageID |
| `vendors` | Food, beverage, and merchandise vendors | vendorID |
| `sponsors` | Corporate sponsors providing financial support | sponsorID |
| `staff` | Festival staff and crew members | staffID |

### Intersection Tables (M:N Relationships)

| Table | Relationship | Additional Attributes |
|-------|--------------|----------------------|
| `performances` | Artists ↔ Stages | date, time, setup notes, soundcheck |
| `vendorAssignments` | Vendors ↔ Festivals | booth number, registration fee |
| `sponsorships` | Sponsors ↔ Festivals | amount, tier, benefits |
| `staffAssignments` | Staff ↔ Festivals | assigned date, hours worked, shift notes |

### Entity-Relationship Diagram

```
┌──────────────┐         ┌──────────────┐
│   Festivals  │─────────│    Stages    │
│              │ 1     M │              │
└──────────────┘         └──────────────┘
       │                        │
       │ M                      │ M
       │                        │
┌──────┴──────┐         ┌───────┴──────┐
│             │         │              │
│   Vendors   │         │   Artists    │
│  (via VA)   │         │  (via Perf)  │
│             │         │              │
└─────────────┘         └──────────────┘

┌──────────────┐         ┌──────────────┐
│   Sponsors   │─────────│   Festivals  │
│   (via Sp)   │ M     M │              │
└──────────────┘         └──────────────┘

┌──────────────┐         ┌──────────────┐
│    Staff     │─────────│   Festivals  │
│   (via SA)   │ M     M │              │
└──────────────┘         └──────────────┘

Legend:
- VA = vendorAssignments
- Perf = performances  
- Sp = sponsorships
- SA = staffAssignments
```

---

## Project Structure

```
cs340_db_project/
├── README.md
├── package.json
│
├── backend/
│   ├── app.js                    # Express server with API routes
│   ├── package.json              # Backend dependencies
│   └── database/
│       └── db-connector.js       # MySQL connection pool
│
├── frontend/
│   ├── package.json              # Frontend dependencies
│   ├── vite.config.js            # Vite configuration
│   ├── tailwind.config.js        # Tailwind CSS configuration
│   ├── postcss.config.js         # PostCSS configuration
│   ├── eslint.config.js          # ESLint configuration
│   ├── index.html                # HTML entry point
│   ├── reactServer.cjs           # Production server for React
│   │
│   ├── public/
│   │   └── vite.svg
│   │
│   └── src/
│       ├── main.jsx              # React entry point
│       ├── App.jsx               # Main App with routing
│       ├── index.css             # Global styles
│       │
│       ├── layouts/
│       │   └── MainLayout.jsx    # Main layout wrapper
│       │
│       ├── components/
│       │   ├── Navbar.jsx        # Navigation sidebar
│       │   ├── CrudPage.jsx      # Reusable CRUD page component
│       │   ├── Table.jsx         # Data table component
│       │   ├── Form.jsx          # Dynamic form component
│       │   ├── Button.jsx        # Button component
│       │   ├── AddEditModal.jsx  # Add/Edit modal
│       │   ├── PopupModal.jsx    # Generic popup modal
│       │   └── ConfirmationModal.jsx  # Delete confirmation
│       │
│       ├── pages/
│       │   ├── HomePage.jsx
│       │   ├── FestivalsPage.jsx
│       │   ├── ArtistsPage.jsx
│       │   ├── StagesPage.jsx
│       │   ├── VendorsPage.jsx
│       │   ├── SponsorsPage.jsx
│       │   ├── StaffPage.jsx
│       │   ├── PerformancesPage.jsx
│       │   ├── VendorAssignmentsPage.jsx
│       │   ├── SponsorshipsPage.jsx
│       │   └── StaffAssignmentsPage.jsx
│       │
│       ├── config/
│       │   ├── festivals.js      # Festival form/table config
│       │   ├── artists.js        # Artist form/table config
│       │   ├── stages.js         # Stage form/table config
│       │   ├── vendors.js        # Vendor form/table config
│       │   ├── sponsors.js       # Sponsor form/table config
│       │   ├── staff.js          # Staff form/table config
│       │   ├── performances.js   # Performance form/table config
│       │   ├── vendorAssignments.js
│       │   ├── sponsorships.js
│       │   └── staffAssignments.js
│       │
│       ├── helper/
│       │   └── helper.js         # Utility functions
│       │
│       └── assets/
│           └── react.svg
│
├── sql/
│   ├── DDL.sql                   # Database schema & sample data
│   ├── DML.sql                   # Data manipulation queries
│   └── PL.sql                    # Stored procedures
│
├── docs/                         # Documentation files
└── public/                       # Static assets
```

---

## Installation

### Prerequisites

- Node.js (v18 or higher recommended)
- MySQL or MariaDB database
- Access to OSU ENGR server (for deployment)

### Local Development Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/kkennethsieu/cs340_db_project.git](https://github.com/Suvamp/music-festival-management-cs340.git
   cd cs340_db_project
   ```

2. **Configure database connection**
   
   Edit `backend/database/db-connector.js` with your credentials:
   ```javascript
   const pool = mysql.createPool({
       host: 'classmysql.engr.oregonstate.edu',
       user: 'cs340_yourONID',
       password: 'your_password',
       database: 'cs340_yourONID',
       multipleStatements: true,
   }).promise();
   ```

3. **Import the database**
   ```bash
   # Import schema and sample data
   mysql -h classmysql.engr.oregonstate.edu -u cs340_yourONID -p cs340_yourONID < sql/DDL.sql
   
   # Import stored procedures
   mysql -h classmysql.engr.oregonstate.edu -u cs340_yourONID -p cs340_yourONID < sql/PL.sql
   ```

4. **Install backend dependencies**
   ```bash
   cd backend
   npm install
   ```

5. **Install frontend dependencies**
   ```bash
   cd ../frontend
   npm install
   ```

6. **Start the development servers**

   Terminal 1 - Backend:
   ```bash
   cd backend
   npm run dev
   ```
   
   Terminal 2 - Frontend:
   ```bash
   cd frontend
   npm run dev
   ```

7. **Access the application**
   - Frontend: `http://localhost:5173`
   - Backend API: `http://localhost:9080`

---

## Deployment (OSU ENGR Server)

### Backend Deployment

1. **SSH into the ENGR server**
   ```bash
   ssh your_onid@access.engr.oregonstate.edu
   ```

2. **Navigate to backend directory**
   ```bash
   cd ~/cs340_db_project/backend
   ```

3. **Install dependencies**
   ```bash
   npm install
   ```

4. **Start production server**
   ```bash
   npm run production
   ```

5. **Backend URL**: `http://classwork.engr.oregonstate.edu:9080`

### Frontend Deployment

1. **Build the frontend**
   ```bash
   cd ~/cs340_db_project/frontend
   npm run build
   ```

2. **Start production server**
   ```bash
   npm run production
   ```

3. **Frontend URL**: `http://classwork.engr.oregonstate.edu:YOUR_FRONTEND_PORT`

### Stop Production Servers

```bash
# Stop backend
cd backend
npm run stop_production

# Stop frontend
cd frontend
npm run stop_production
```

---

## NPM Scripts

### Backend (`/backend`)
| Script | Command | Description |
|--------|---------|-------------|
| `npm run dev` | `nodemon app.js` | Start with auto-reload |
| `npm run production` | `npx forever start app.js` | Start production server |
| `npm run stop_production` | `npx forever stop app.js` | Stop production server |

### Frontend (`/frontend`)
| Script | Command | Description |
|--------|---------|-------------|
| `npm run dev` | `vite` | Start Vite dev server |
| `npm run build` | `vite build` | Build for production |
| `npm run production` | `npx forever start reactServer.cjs` | Start production server |
| `npm run stop_production` | `npx forever stop reactServer.cjs` | Stop production server |
| `npm run lint` | `eslint .` | Run ESLint |
| `npm run preview` | `vite preview` | Preview production build |

---

## API Endpoints

### Base URL
- Development: `http://localhost:9080`
- Production: `http://classwork.engr.oregonstate.edu:9080`

### Page Routes (Return JSON data)

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/festivals` | Get all festivals |
| GET | `/artists` | Get all artists |
| GET | `/stages` | Get stages with festival names |
| GET | `/vendors` | Get all vendors |
| GET | `/sponsors` | Get all sponsors |
| GET | `/staff` | Get all staff |
| GET | `/performances` | Get performances with artist/stage/festival info |
| GET | `/vendor-assignments` | Get vendor assignments with related data |
| GET | `/sponsorships` | Get sponsorships with related data |
| GET | `/staff-assignments` | Get staff assignments with related data |

### CRUD API Endpoints

#### Festivals
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/festivals` | Create festival |
| PUT | `/api/festivals/:id` | Update festival |
| DELETE | `/api/festivals/:id` | Delete festival |

#### Artists
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/artists` | Create artist |
| PUT | `/api/artists/:id` | Update artist |
| DELETE | `/api/artists/:id` | Delete artist |

#### Stages
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/stages` | Create stage |
| PUT | `/api/stages/:id` | Update stage |
| DELETE | `/api/stages/:id` | Delete stage |

#### Vendors
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/vendors` | Create vendor |
| PUT | `/api/vendors/:id` | Update vendor |
| DELETE | `/api/vendors/:id` | Delete vendor |

#### Sponsors
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/sponsors` | Create sponsor |
| PUT | `/api/sponsors/:id` | Update sponsor |
| DELETE | `/api/sponsors/:id` | Delete sponsor |

#### Staff
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/staff` | Create staff member |
| PUT | `/api/staff/:id` | Update staff member |
| DELETE | `/api/staff/:id` | Delete staff member |

#### Performances
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/performances` | Create performance |
| PUT | `/api/performances/:id` | Update performance |
| DELETE | `/api/performances/:id` | Delete performance |

#### Vendor Assignments
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/vendor-assignments` | Create vendor assignment |
| PUT | `/api/vendor-assignments/:id` | Update vendor assignment |
| DELETE | `/api/vendor-assignments/:id` | Delete vendor assignment |

#### Sponsorships
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/sponsorships` | Create sponsorship |
| PUT | `/api/sponsorships/:id` | Update sponsorship |
| DELETE | `/api/sponsorships/:id` | Delete sponsorship |

#### Staff Assignments
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/staff-assignments` | Create staff assignment |
| PUT | `/api/staff-assignments/:id` | Update staff assignment |
| DELETE | `/api/staff-assignments/:id` | Delete staff assignment |

### Utility Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/reset` | Reset database to initial state |

---

## Database Design Decisions

### Stored Procedures
All CRUD operations utilize stored procedures (`PL.sql`) for:
- Centralized business logic
- Data validation
- Error handling with proper SQL signals
- Consistent data manipulation patterns

### Cascade Deletes
Foreign key relationships use `ON DELETE CASCADE` to maintain referential integrity. When a parent record is deleted (e.g., a Festival), all related child records (stages, assignments) are automatically removed.

### Intersection Tables
Many-to-many relationships are implemented through intersection tables with additional attributes:
- `performances`: Includes performance-specific data (date, time, setup notes, soundcheck)
- `vendorAssignments`: Includes booth number and registration fee
- `sponsorships`: Includes amount, tier, and benefit details
- `staffAssignments`: Includes hours worked and shift notes

### Normalization
The database follows Third Normal Form (3NF) to eliminate redundancy and ensure data integrity.

---

## Frontend Architecture

### Component-Based Design
The frontend uses a modular component architecture:
- **CrudPage**: Reusable component handling table display and CRUD modals
- **Form**: Dynamic form generation based on configuration
- **Table**: Generic data table with edit/delete actions
- **Config files**: Define table columns and form fields per entity

### Routing
React Router DOM provides client-side routing with a consistent layout via `MainLayout`.

### State Management
Uses React's built-in `useState` and `useEffect` hooks for local state management.

---

## Sample Data

The database includes realistic sample data:
- 4 Festivals across different US locations
- 5 Artists spanning Rock, Electronic, Folk, EDM, and Indie Pop genres
- 8 Stages with varying capacities and types
- 5 Vendors (food, beverage, merchandise)
- 4 Sponsors from different industries
- 5 Staff members with different roles
- Multiple intersection table records demonstrating relationships

---

## Code Attribution

This project uses the CS 340 Node.js starter code structure as a foundation:
- Database connection pattern adapted from CS 340 course materials
- Express.js setup based on CS 340 examples

All database schema, stored procedures, React frontend, and application-specific logic are original work by Group 42 (Suvam Patel, Kenneth Sieu).

---

## Repository

GitHub: [https://github.com/Suvamp/music-festival-management-cs340](https://github.com/Suvamp/music-festival-management-cs340)

---

## License

This project was created for educational purposes as part of CS 340 at Oregon State University.
