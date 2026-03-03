# Environment Variables Guide

This document outlines the environment variables required for the Frontend and Backend of the POS application.

## Backend Variables

Create a `.env` file in the `backend` directory with the following variables:

| Variable | Description | Default / Example | Required |
|----------|-------------|-------------------|----------|
| `PORT` | The port the backend server runs on. | `5000` | No |
| `DATABASE_URL` | PostgreSQL connection string. | `postgres://user:pass@localhost:5432/db_name` | **Yes** |
| `JWT_SECRET` | Secret key used for signing JSON Web Tokens. | `your-super-secret-key` | **Yes** |
| `ADMIN_USERNAME` | Username for the initial admin account. | `admin` | **Yes** |
| `ADMIN_PASSWORD` | Password for the initial admin account. | `admin123` | **Yes** |
| `THERMAL_PRINTER_NAME` | Name of the thermal printer (for local printing). | `XP-80C` | No |
| `NODE_ID` | Unique UUID for this node (used for sync). | `uuid-v4-string` | No (Yes for Sync) |
| `CENTRAL_API_URL` | Full URL of the central backend for sync. | `http://central-server:5000` | No (Yes for Sync) |

### Docker-Specific Backend Variables
When running in Docker (e.g., Railway), you may need these additional variables:

| Variable | Description | Example |
|----------|-------------|---------|
| `PUPPETEER_EXECUTABLE_PATH` | Path to the Chromium executable. | `/usr/bin/chromium` |
| `PUPPETEER_SKIP_CHROMIUM_DOWNLOAD`| Skip downloading Chromium in Puppeteer. | `true` |

---

## Frontend Variables

Create a `.env` file in the `frontend` directory. Note that Vite requires variables to start with `VITE_`.

| Variable | Description | Default / Example | Required |
|----------|-------------|-------------------|----------|
| `VITE_API_URL` | The base URL of the backend API. | `http://localhost:5000/api` | No (Defaults to `/api`) |

### Example Frontend `.env`

```env
VITE_API_URL=http://localhost:5000/api
```

## Setup Instructions

1.  **Backend**: Copy `backend/.env.example` to `backend/.env` and fill in the values.
2.  **Frontend**: Create `frontend/.env` and add the variables if your backend is not hosted on the same origin or if you are in development mode pointing to a different backend.
