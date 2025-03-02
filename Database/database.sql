CREATE TABLE `areas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `areas` WRITE;
INSERT INTO `areas` VALUES (1,'Hòa Vang','inactive'),(2,'Hòa Khánh','active'),(3,'Liên chiểu','active');
UNLOCK TABLES;


CREATE TABLE `field_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;


LOCK TABLES `field_types` WRITE;
INSERT INTO `field_types` VALUES (1,'Sân bóng đá 5 người - có nhân tạo','active'),(2,'Sân bóng đá 4 người','inactive');
UNLOCK TABLES;

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;


LOCK TABLES `news` WRITE;
INSERT INTO `news` VALUES (1,'tt','<div>ttt</div>','https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/1715017433557Video-Man-Hinh_First_Frame.png?alt=media&token=3be4a61c-ffa6-4feb-acc9-af1ebd0fdfe0','2024-05-06 17:43:58','2024-05-06 17:43:58');
UNLOCK TABLES;


CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `notifications` WRITE;
INSERT INTO `notifications` VALUES (1,'Thông báo 01','Thông báo','2024-03-26 10:13:43','2024-03-26 10:13:43'),(2,'hệ thống giảm giá','hệ thống giảm giá','2024-03-26 11:17:09','2024-03-26 11:17:09'),(3,'hệ thống giảm giá','hệ thống giảm giá','2024-03-26 11:17:58','2024-03-26 11:17:58');
UNLOCK TABLES;

CREATE TABLE `product_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;


LOCK TABLES `product_types` WRITE;
INSERT INTO `product_types` VALUES (1,'Nước ngọt 1','inactive'),(2,'têt','active'),(3,'têt','active');
UNLOCK TABLES;


CREATE TABLE `residence_rules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;


LOCK TABLES `residence_rules` WRITE;
INSERT INTO `residence_rules` VALUES (1,'Điều khoản sử dụng','Những điều khoản được áp dụng trên website Thế Giới Thể Thao\nĐiều khoản sử dụng\nChào mừng quý khách hàng đến với Thế Giới Thể Thao\n\nChúng tôi là Công ty Cổ phần Thương mại và xây dựng Thế giới thể thao có địa chỉ trụ sở tại Số 5 Nguyễn Khả Trạc - Mai Dịch - Cầu Giấy - Hà Nội. Chúng tôi quản lý và vận hành website: https://thegioithethao.vn\n\nKhi quý khách hàng truy cập vào trang website của chúng tôi có nghĩa là quý khách đồng ý với các điều khoản này. Trang web có quyền thay đổi, chỉnh sửa, thêm hoặc lược bỏ bất kỳ phần nào trong Điều khoản mua bán hàng hóa này, vào bất cứ lúc nào. Các thay đổi có hiệu lực ngay khi được đăng trên trang web mà không cần thông báo trước. Và khi quý khách tiếp tục sử dụng trang web, sau khi các thay đổi về Điều khoản này được đăng tải, có nghĩa là quý khách chấp nhận với những thay đổi đó.\nQuý khách hàng vui lòng kiểm tra thường xuyên để cập nhật những thay đổi của chúng tôi.\n\nHướng dẫn sử dụng website\nKhi vào web của chúng tôi, khách hàng phải đảm bảo đủ 18 tuổi, hoặc truy cập dưới sự giám sát của cha mẹ hay người giám hộ hợp pháp. Khách hàng đảm bảo có đầy đủ hành vi dân sự để thực hiện các giao dịch mua bán hàng hóa theo quy định hiện hành của pháp luật Việt Nam.\n\nChúng tôi sẽ cấp một tài khoản (Account) sử dụng để khách hàng có thể mua sắm trên website https://thegioithethao.vn trong khuôn khổ Điều khoản và Điều kiện sử dụng đã đề ra.\nQuý khách hàng sẽ phải đăng ký tài khoản với thông tin xác thực về bản thân và phải cập nhật nếu có bất kỳ thay đổi nào. Mỗi người truy cập phải có trách nhiệm với mật khẩu, tài khoản và hoạt động của mình trên web. Hơn nữa, quý khách hàng phải thông báo cho chúng tôi biết khi tài khoản bị truy cập trái phép. Chúng tôi không chịu bất kỳ trách nhiệm nào, dù trực tiếp hay gián tiếp, đối với những thiệt hại hoặc mất mát gây ra do quý khách không tuân thủ quy định.\nNghiêm cấm sử dụng bất kỳ phần nào của trang web này với mục đích thương mại hoặc nhân danh bất kỳ đối tác thứ ba nào nếu không được chúng tôi cho phép bằng văn bản. Nếu vi phạm bất cứ điều nào trong đây, chúng tôi sẽ hủy tài khoản của khách mà không cần báo trước.\nTrong suốt quá trình đăng ký, quý khách đồng ý nhận email quảng cáo từ website. Nếu không muốn tiếp tục nhận mail, quý khách có thể từ chối bằng cách nhấp vào đường link ở dưới cùng trong mọi email quảng cáo.\nÝ kiến của khách hàng\nTất cả nội dung trang web và ý kiến phê bình của quý khách đều là tài sản của chúng tôi. Nếu chúng tôi phát hiện bất kỳ thông tin giả mạo nào, chúng tôi sẽ khóa tài khoản của quý khách ngay lập tức hoặc áp dụng các biện pháp khác theo quy định của pháp luật Việt Nam.','2024-03-26 10:14:42','2024-03-26 10:14:42');
UNLOCK TABLES;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'noactive',
  `image` varchar(255) DEFAULT 'https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;


LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'red86794@gmail.com','0355462208','Admin','$2b$10$YXMaxfUoSZhXwfjhyku9befvkdgO/UlSvBJ/ypLdMxE3ewMKAN25C','isAdmin','actived','https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png','2024-03-19 06:44:52','2024-03-26 11:10:17'),(2,'seller@gmail.com','0938283923','seller','$2b$10$8QJCXxuc/WTcyicvKb5KXOFo.iHarOiyb6sQC48ZDUa.PrbvbP0wq','isSeller','actived','https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png','2024-03-19 07:40:14','2024-03-19 07:40:14');
UNLOCK TABLES;


CREATE TABLE `courts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_areas` int NOT NULL,
  `id_field_types` int NOT NULL,
  `id_users` int DEFAULT NULL,
  `approval_status` varchar(255) DEFAULT 'pending',
  `status` varchar(255) DEFAULT 'active',
  `price` decimal(10,2) DEFAULT '0.00',
  `image` varchar(500) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `id_areas` (`id_areas`),
  KEY `id_field_types` (`id_field_types`),
  KEY `id_users` (`id_users`),
  CONSTRAINT `courts_ibfk_1` FOREIGN KEY (`id_areas`) REFERENCES `areas` (`id`),
  CONSTRAINT `courts_ibfk_2` FOREIGN KEY (`id_field_types`) REFERENCES `field_types` (`id`),
  CONSTRAINT `courts_ibfk_3` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;


LOCK TABLES `courts` WRITE;
INSERT INTO `courts` VALUES (1,'tes2',1,1,2,'approved','active',232.00,'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/1715021472613z5327710311386_768133cd67f4d717ae62d7eac05fda61.jpg?alt=media&token=24c4d0fa-49c2-45fc-90a6-fca29c038a30','tét2'),(3,'tt',2,1,2,'pending','active',23.00,'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/1715021434342z5208034853655_d54121dae5801ade8620a6657cdf9a99.jpg?alt=media&token=c843ef0a-e952-47d0-b51d-b0a69b7a2d77','tt');
UNLOCK TABLES;

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'active',
  `employee_code` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;


LOCK TABLES `employees` WRITE;
INSERT INTO `employees` VALUES (1,'nhân viên 01','nhanvien@gmail.com','$2b$10$oeSW2OnSpbOlCm/fvWvfVugvaV2AnAD9qpFFAViyZtOiP3cNvdeei','isEmployee','actived','kt01',2,'2024-05-06 19:26:58','2024-05-06 19:29:27');
UNLOCK TABLES;


CREATE TABLE `password_reset_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `password_reset_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;


LOCK TABLES `password_reset_tokens` WRITE;
INSERT INTO `password_reset_tokens` VALUES (1,1,'3e261778bcaefe94c837eb4831cc4d804d218da0','2024-03-26 12:10:23','2024-03-26 11:10:23');
UNLOCK TABLES;

CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `status` varchar(255) DEFAULT 'active',
  `item_status` varchar(255) DEFAULT 'new',
  `id_product_type` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product_type` (`id_product_type`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_product_type`) REFERENCES `product_types` (`id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;


LOCK TABLES `products` WRITE;
INSERT INTO `products` VALUES (1,'sdfds1',324.00,24,'active','new',1,2,'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/1715004631989Video-Man-Hinh_First_Frame.png?alt=media&token=cb2e742d-6ffd-4b98-b5dc-77e19f06b057');
UNLOCK TABLES;

CREATE TABLE `tournaments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `info` text,
  `teams` int DEFAULT '0',
  `matches` int DEFAULT '0',
  `group_count` int DEFAULT '0',
  `prizes` int DEFAULT '0',
  `status` varchar(255) DEFAULT 'active',
  `approval_status` varchar(255) DEFAULT 'pending',
  `id_users` int DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_users` (`id_users`),
  CONSTRAINT `tournaments_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;


LOCK TABLES `tournaments` WRITE;
INSERT INTO `tournaments` VALUES (1,'rể1','êr',2,3,4,10000,'active','pending',2,'https://firebasestorage.googleapis.com/v0/b/zalo-app-66612.appspot.com/o/1715016085756Video-Man-Hinh_First_Frame.png?alt=media&token=e1e66558-c610-49ad-8fd8-1e9b7c52934b');
UNLOCK TABLES;

CREATE TABLE `tournament_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tournament_id` int NOT NULL,
  `result_info` text,
  `image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tournament_id` (`tournament_id`),
  CONSTRAINT `tournament_results_ibfk_1` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';



LOCK TABLES `tournament_results` WRITE;
UNLOCK TABLES;

CREATE TABLE `bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `court_id` int NOT NULL,
  `booking_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(255) DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `court_id` (`court_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`court_id`) REFERENCES `courts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `bookings` WRITE;
UNLOCK TABLES;

CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `orders` WRITE;
UNLOCK TABLES;