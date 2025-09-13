FROM ubuntu:latest

# 패키지 업데이트 & net-tools 설치
RUN apt-get update && apt-get install -y net-tools iproute2 iputils-ping && rm -rf /var/lib/apt/lists/*

# 기본 쉘 실행
CMD ["/bin/bash"]
