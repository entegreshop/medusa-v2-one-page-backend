FROM node:20-alpine

# Install build dependencies
RUN apk add --no-cache python3 make g++ 

WORKDIR /app

# Copy package.json and workspace configuration
COPY package.json package-lock.json turbo.json ./
COPY apps/backend/package.json ./apps/backend/

# Install dependencies
RUN npm install

# Copy all files
COPY . .

# Build the project using turbo
RUN npm run build

WORKDIR /app/apps/backend

# Expose port
EXPOSE 9000

# Start command
CMD ["npm", "run", "start"]
