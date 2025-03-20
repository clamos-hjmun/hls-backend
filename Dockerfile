# Backend Dockerfile
FROM node:18

WORKDIR /app

# package.json과 package-lock.json만 먼저 복사
COPY package.json package-lock.json ./

# 종속성 설치 (캐시 유지)
RUN npm install

# 이후 소스 코드 복사
COPY . .

# HLS 및 output 디렉토리 생성
RUN mkdir -p /root/hls /app/output

EXPOSE 4000
CMD ["npm", "start"]
