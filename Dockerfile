# Use a Debian-based image (not Alpine) to avoid canvas build issues
FROM node:20-bullseye-slim

# Install system dependencies for canvas and puppeteer
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    build-essential \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    chromium \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables for Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

WORKDIR /app

# Copy all files
COPY . .

# Install dependencies
RUN npm install

# Build frontend
RUN npm run build:frontend

# Expose port
EXPOSE 5000

# Start command
CMD ["npm", "start"]
