-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: springmvcbasicfree
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'admin','2021-10-05 11:40:26','admin','2021-10-05 11:41:33','phong-tro','Phòng trọ',1,'2038259.png'),(2,'admin','2021-10-05 11:40:44','admin','2021-10-05 11:40:44','khach-san','Khách sạn',1,'unnamed.png'),(3,'admin','2021-10-05 11:41:03','admin','2021-10-05 11:41:03','ki-tuc-xa','Kí túc xá',1,'istockphoto-1268716265-1024x1024.jpg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'tanthanh','2021-10-06 18:43:45','tanthanh','2021-10-06 18:43:45','alo',0,1,4);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `orderroom`
--

LOCK TABLES `orderroom` WRITE;
/*!40000 ALTER TABLE `orderroom` DISABLE KEYS */;
INSERT INTO `orderroom` VALUES (1,'anonymousUser','2021-10-05 22:42:39','anonymousUser','2021-10-05 22:42:39','Quận 12','dotanthanhvlog@gmail.com','Đỗ Tấn Thành Thành','Đỗ Tấn Thành Thành',1,'0'),(2,'anonymousUser','2021-10-05 22:45:59','anonymousUser','2021-10-05 22:45:59','123123, Thị xã Gia Nghĩa, Đắk Nông','dotanthanhvlog@gmail.com','Đỗ Tấn Thành Thành','Đỗ Tấn Thành Thành',2,'0'),(3,'anonymousUser','2021-10-05 23:01:36','tanthanh','2021-10-06 17:54:52','Quận gò vấp','hoangconhung@gmail.com','Hùng','0123',2,'1'),(4,'tanthanh','2021-10-05 23:25:43','tanthanh','2021-10-06 17:52:43','Quận tân bình','letantaif@gmail.com','Tài','0123456789',3,'1'),(5,'tanthanh','2021-10-06 17:57:31','tanthanh','2021-10-06 17:57:31','Quận 12','caothanhloi@gmail.com','Nigga lợi','1234567890',3,'0');
/*!40000 ALTER TABLE `orderroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'admin','2021-10-05 11:43:04','tanthanh','2021-10-06 18:43:45','hẻm 535, Đường Phan Văn Trị, Phường 7, Quận 5, Tp Hồ Chí Minh','Nhà cho thuê Quận Gò Vấp. Địa chỉ : 862/ Lê Đức Thọ,p15, Gò Vấp ( ngay chợ, trường học, ngay trung tâm, khu an ninh, nhà mới )',1,'4.jpg','Nhà mới hxh 4 × 23m, 3pn3wc p15 ,Gò Vấp',1,5),(2,'tanthanh','2021-10-05 12:02:41','tanthanh','2021-10-06 22:37:19','nbnmbmnbnm, Huyện Bảo Lạc, Cao Bằng','12',1,'6.jpg','Sản phẩm 1',3,12),(3,'tanthanh','2021-10-05 23:16:13','tanthanh','2021-10-06 22:37:14','sad, Huyện Nhơn Trạch, Đồng Nai','ád',1,'12.jpg','Sản phẩm 2',2,9),(5,'tanthanh','2021-10-06 21:38:41','tanthanh','2021-10-06 22:37:09','123123, Thị xã Gia Nghĩa, Đắk Nông, Huyện Trảng Bom, Đồng Nai','ád',1,'14.jpg','Sản phẩm 3',2,1),(6,'tanthanh','2021-10-06 21:39:12','tanthanh','2021-10-06 22:37:29','ád, Huyện Buôn Đôn, Đắk Lắk','ád',1,'5.jpg','Sản phẩm 4',3,2),(7,'tanthanh','2021-10-06 21:39:31','tanthanh','2021-10-06 22:37:27','ád, Huyện Buôn Đôn, Đắk Lắk','ád',1,'4cf316f52ce15b1db3dd97dfc3d63fc8-2728101013743503715.jpg','Sản phẩm 5',2,2),(8,'tanthanh','2021-10-06 22:31:21','tanthanh','2021-10-06 22:37:20',', Huyện Ngọc Hiển, Cà Mau','ád',1,'9f5290346ab19eefc7a0.jpg','Sản phẩm 6',2,2),(9,'tanthanh','2021-10-06 22:31:45','tanthanh','2021-10-06 22:37:22',', Huyện Dăk Song, Đắk Nông','ád',1,'7.jpg','Sản phẩm 7',1,2),(10,'tanthanh','2021-10-06 22:32:10','tanthanh','2021-10-06 22:35:51','123, Huyện Gia Bình, Bắc Ninh','ád',1,NULL,'Sản phẩm 8',1,0),(11,'tanthanh','2021-10-06 22:32:50','tanthanh','2021-10-06 22:36:16','ádád, Huyện Trảng Bom, Đồng Nai','ád',1,NULL,'Sản phẩm 9',3,0),(12,'tanthanh','2021-10-06 22:33:15','tanthanh','2021-10-06 22:37:17','asd, Huyện Dĩ An, Bình Dương','ád',1,'4.jpg','Sản phẩm 10',2,1),(13,'tanthanh','2021-10-06 22:33:42','tanthanh','2021-10-06 22:37:15','ád, Huyện Buôn Đôn, Đắk Lắk, Huyện Dĩ An, Bình Dương','ád',1,'3.jpg','Sản phẩm 11',2,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productdetail`
--

LOCK TABLES `productdetail` WRITE;
/*!40000 ALTER TABLE `productdetail` DISABLE KEYS */;
INSERT INTO `productdetail` VALUES (2,'admin','2021-10-05 11:43:04','admin','2021-10-05 11:43:04',50,'abc','Phòng 1 người',1000000,200000000,10,1),(3,'admin','2021-10-05 11:44:23','admin','2021-10-05 11:44:23',100,'abc','Phòng 2 người',500000,6000000,10,1),(4,'tanthanh','2021-10-05 12:02:41','tanthanh','2021-10-05 12:02:41',50,'mmnkhkjhkjhjkhjhjhjkhkj\r\nl,m,mlkjlkjlj','Phòng 2 người',12356500,12123100,10,2),(5,'tanthanh','2021-10-05 23:16:13','tanthanh','2021-10-05 23:16:17',3123,'ád','123123á',123,123,312,3),(6,'tanthanh','2021-10-06 21:38:41','tanthanh','2021-10-06 21:38:41',123,'ád','Hùng Hoàng',123,123,213,5),(7,'tanthanh','2021-10-06 21:39:11','tanthanh','2021-10-06 21:39:12',312,'ád','áda',123,123,12,6),(8,'tanthanh','2021-10-06 21:39:31','tanthanh','2021-10-06 21:39:31',123,'ád','ád',123,213,123,7),(9,'tanthanh','2021-10-06 22:31:21','tanthanh','2021-10-06 22:31:22',132,'ád','123123á',123,213,4212,8),(10,'tanthanh','2021-10-06 22:31:45','tanthanh','2021-10-06 22:31:45',213,'123','ád',123,123,12,9),(11,'tanthanh','2021-10-06 22:32:10','tanthanh','2021-10-06 22:32:10',612,'sad','d123',214,12421,455,10),(12,'tanthanh','2021-10-06 22:32:50','tanthanh','2021-10-06 22:32:50',24,'á','sadh1',214,42176,786,11),(13,'tanthanh','2021-10-06 22:33:15','tanthanh','2021-10-06 22:33:15',4214,'ád','do tan thanh',12421,12,213,12),(14,'tanthanh','2021-10-06 22:33:42','tanthanh','2021-10-06 22:33:42',544,'qưe','ád',124,213,123,13);
/*!40000 ALTER TABLE `productdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productimage`
--

LOCK TABLES `productimage` WRITE;
/*!40000 ALTER TABLE `productimage` DISABLE KEYS */;
INSERT INTO `productimage` VALUES (2,'admin','2021-10-05 11:43:04','admin','2021-10-05 11:43:04',NULL,'1.jpg',2),(3,'admin','2021-10-05 11:43:28','admin','2021-10-05 11:43:28','asd','2.jpg',2),(4,'admin','2021-10-05 11:44:23','admin','2021-10-05 11:44:23',NULL,'4.jpg',3),(5,'tanthanh','2021-10-05 12:02:41','tanthanh','2021-10-05 12:02:41',NULL,'06fb9451381afe86f30cc52afb5df48b-2717254260746651100.jpg',4),(7,'tanthanh','2021-10-05 12:03:27','tanthanh','2021-10-05 12:03:27','ád','6.jpg',4),(8,'tanthanh','2021-10-05 23:16:13','tanthanh','2021-10-05 23:16:13',NULL,'12.jpg',5),(9,'tanthanh','2021-10-06 21:38:41','tanthanh','2021-10-06 21:38:41',NULL,'14.jpg',6),(10,'tanthanh','2021-10-06 21:39:12','tanthanh','2021-10-06 21:39:12',NULL,'5.jpg',7),(11,'tanthanh','2021-10-06 21:39:31','tanthanh','2021-10-06 21:39:31',NULL,'4cf316f52ce15b1db3dd97dfc3d63fc8-2728101013743503715.jpg',8),(12,'tanthanh','2021-10-06 22:31:21','tanthanh','2021-10-06 22:31:21',NULL,'9f5290346ab19eefc7a0.jpg',9),(13,'tanthanh','2021-10-06 22:31:45','tanthanh','2021-10-06 22:31:45',NULL,'7.jpg',10),(14,'tanthanh','2021-10-06 22:32:10','tanthanh','2021-10-06 22:32:10',NULL,'9.jpg',11),(15,'tanthanh','2021-10-06 22:32:50','tanthanh','2021-10-06 22:32:50',NULL,'cropped-iPhone-icon.png',12),(16,'tanthanh','2021-10-06 22:33:15','tanthanh','2021-10-06 22:33:15',NULL,'4.jpg',13),(17,'tanthanh','2021-10-06 22:33:42','tanthanh','2021-10-06 22:33:42',NULL,'3.jpg',14);
/*!40000 ALTER TABLE `productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,NULL,NULL,NULL,NULL,'ADMIN','Quản trị'),(2,NULL,NULL,NULL,NULL,'USER','Người dùng');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `slide`
--

LOCK TABLES `slide` WRITE;
/*!40000 ALTER TABLE `slide` DISABLE KEYS */;
INSERT INTO `slide` VALUES (1,'admin','2021-10-05 11:44:48','admin','2021-10-05 11:44:48','ABc','Đỗ Tấn Thành Thành',NULL,'06d4bb62e5ccdcc9d4be6a3b5a891ebb-2709447559138740997.png',1);
/*!40000 ALTER TABLE `slide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,'trương tùng lâm','0','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG',NULL,1,NULL,'admin',NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,'nguyễn văn A','0','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG',NULL,1,NULL,'nguyenvana',NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,'nguyễn văn B','0','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG',NULL,1,NULL,'nguyenvanb',NULL),(4,'admin','2021-10-05 11:38:03','tanthanh','2021-10-05 19:16:24','2000-06-27 00:00:00','dotanthanh2000@gmail.com','Đỗ Tấn Thành','1','$2a$10$l7DyxvsWL5WUP6Bxte0WQORvbeopQl2Ias1XhXGGJkJBCe9Tn1Z4m','0762216048',1,'177952035_2941066216172039_4129793524339540823_n.jpg','tanthanh',''),(5,'admin','2021-10-05 11:39:34','bingo','2021-10-05 18:43:51','2001-05-28 00:00:00','bongrovn123@gmail.com','Bí Ngô','1','$2a$10$5O.egdmRvTeTYHDo7cGjdeRTEgbovTvD0E2lph0s.0cAy29EyOhV6','0788608552',1,'37602493_2153499001595435_4237214700426756096_n.jpg','bingo',NULL),(6,'anonymousUser','2021-10-06 17:58:48','anonymousUser','2021-10-06 17:58:48','2000-06-27 00:00:00','dotanthanhvlog123@gmail.com','Đỗ Tấn Thành Thành','0','$2a$10$ilywIqfYGtCO.TNVnybOsOveviqLpoGRkXqJ3tECnMDfxPoVWmq2e','4762216048',1,'defaultAvatar.jpg','bibungbinh',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(2,2),(3,2),(5,1),(4,2),(6,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-07 17:09:25
