# Docker
1. What is Docker?
 - https://github.com/docker/
 - Create container for applications
 - Move container.
 - Share container. 
 - Docker can. 
   + Build, ship and deploy any application, anywhere.
      . Build: đóng gói ưng dụng trong 1 container.
      . Ship: vận chuyển container.
      . Deploy: triển khai, chạy container.
      . Tất cả mọi nơi  
      . Đóng gói phần mềm ez
      . Deploy nhanh.
      . Không cần cấu hình và cài đặt env.
   + Workflow   
      . image: component để triển khai ứng dụng include: code, lib, FW, file ..
      . Trừu tượng hóa giải pháp và đóng gói vào 1 image kèo dependencies.
      => Tránh conflict env triể n khai.
- Một số thuật ngữ: 
   + image.
      . Khuôn mẫu, lớp chứa các file cần thiết để tạo nên 1 container.
      . Chữa các tài nguyên có sẵn.
      . Không được tiếp cận vào CPU, memory, storage ..
   + Container.
      . Tồn tại trên host với 1 IP.
      . Được deploy, chạy, và xóa bỏ thông qua remote client.
   + Docker engine.
      . Create vaf run container.
      . Run command in mode daemon
      . Linux become Docker server. 
      . Contaiber can deoloy, run and remove by remote client.
   + Docker daemon: Tiến trình chạy ngầm quản lí các container.
   + Docker client
      . Kiểm soát hầu hết các máy chủ Workflow của docker.
      . Giao tiếp với các máy chủ DOcker thông qua daemon.
   + Docker Hub.   
- Điểm mạnh của Docker. 
   + Deploy nhanh hơn.
      . Hệ thống augumented file system.
      . Thêm các layer bên trên root kernel.
      . Dễ dàng tổng hợp các layer thành một. 
   + Độc lập
      . Lỗi xảy ra với 1 container không ảnh hưởng đến các container khác.
   + Cơ động.
      . Tránh conflict env.
      . TRao đổi giữa các máy.
      . NHất quán khi chạy trên các máy khác nhau.
   + CHụp ảnh hệ thống 
      . Lưu snapshot thành container hoặc image.
      . Tag
      . Tạo container y hệt từ snapshot.
   + Kiểm soát việc sử dụng tài nguyên (CPU, Ram, storage ..)
   + Đơn giản hóa sự phụ thuộc lẫn nhau giữa các ứng dụng (dependency)
      . Xác định dependency ở Dockerfile.
   + Thuận tiệc cho việc share.
      . DOjcker hub
      . Dockerfile

# Kernel
   + Phản hồi thông điệp từ phần cứng.
   + Khởi tạo và đặt lịch cho các chương trình.
   + Quản lý và hệ thống các tác vụ.
   + Truyền tin giữa các chương trình.
   + Phần chia tài nguyên phần cứng.
   + Tạo container bằng cách điều chỉnh thiết lập kernel.

# Docker
   + Việt trên ngôn ngữ GO
   + Quản lý các đặc tính của kernel
   . "cgroup": nhóm các tiến trình.
   . "namespace": chia tách các tầng network.
   . "copy-on-write": định nghĩa image.
   + Docker đơn giản hóa việc viết script cho hệ thống phân tán.

# Socket điều khiển của Docker
   + DOcker bao gồm 2 phần: client và server\
   + Server nhận lệnh qua Socket( qua mạng hoặc qua file)

                                                  . container
"Docker Client" <-> "Socket" <-> "Docker Server" {. Container
                                                  . Container