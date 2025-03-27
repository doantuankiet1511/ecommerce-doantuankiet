# Giai đoạn 1: Build ứng dụng với Node.js và Yarn
FROM node:18-alpine as build

# Thiết lập thư mục làm việc
WORKDIR /app

# Sao chép các file package.json và yarn.lock (nếu có)
COPY package*.json ./
COPY yarn.lock ./  

# Cài đặt Yarn trong container và dùng Yarn để cài dependencies
RUN apk add --no-cache yarn
RUN yarn install --frozen-lockfile  # Đảm bảo dùng đúng phiên bản từ yarn.lock

# Sao chép toàn bộ mã nguồn
COPY . .

# Build ứng dụng với Yarn
RUN yarn build

# Giai đoạn 2: Serve ứng dụng với Nginx
FROM nginx:alpine

# Sao chép thư mục build từ giai đoạn trước vào Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Mở cổng 80
EXPOSE 80

# Khởi động Nginx
CMD ["nginx", "-g", "daemon off;"]