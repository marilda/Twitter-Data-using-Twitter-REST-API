CREATE DATABASE  IF NOT EXISTS `ekomi_tweets` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ekomi_tweets`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: ekomi_tweets
-- ------------------------------------------------------
-- Server version	5.6.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweets` (
  `id` bigint(64) NOT NULL,
  `id_str` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `text` text,
  `source` text,
  `retweet_count` int(11) DEFAULT NULL,
  `favorite_count` int(11) DEFAULT NULL,
  `created_at` varchar(100) DEFAULT NULL,
  `posted_by_user` bigint(64) DEFAULT NULL,
  `in_reply_to_tweet_id` bigint(64) DEFAULT NULL,
  `retweeted_status_id` bigint(64) DEFAULT NULL,
  `retweeted_status_id_str` varchar(145) DEFAULT NULL,
  `retweeted_status_text` varchar(245) DEFAULT NULL,
  `retweeted_status_created_at` varchar(145) DEFAULT NULL,
  `retweeted_status_user_id` bigint(64) DEFAULT NULL,
  `retweeted_status_user_id_str` varchar(145) DEFAULT NULL,
  `lang` varchar(3) DEFAULT NULL,
  `date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `truncated` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tweets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweets`
--

LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
INSERT INTO `tweets` VALUES (472128474585780000,'472128474585780225','RT @onlinespyshop: So many lovely #reviews from our #happycustomers - We appreciate it, #thank you! http://t.co/O04802rhtv http://t.co/q59R…','<a href=\"http://twitter.com/download/android\" rel=\"nofollow\">Twitter for Android</a>',2,0,'1401399174',19068239,NULL,471682337772540000,'471682337772539904','So many lovely #reviews from our #happycustomers - We appreciate it, #thank you! http://t.co/O04802rhtv http://t.co/q59RsgbeAq','Wed May 28 16:00:07 +0000 2014',59080800,'59080800','en','2015-05-17 22:00:04',''),(472409236517840000,'472409236517842944','Think with Google: In recent studies, #campaigns with mobile Seller Ratings saw a 7.5% increase in clickthrough rates http://t.co/W3LKzgeirN','<a href=\"https://dev.twitter.com/docs/tfw\" rel=\"nofollow\">Twitter for Websites</a>',1,2,'1401466113',19068239,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'en','2015-05-17 22:00:04',''),(499913536123170000,'499913536123174913','RT @SBechara: Michael Ambros,@eKomi\'s CEO on future of web dev, and how tools like @zapier and @odesk are leading the revolution. http://t.…','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',3,0,'1408023649',19068239,NULL,448115355618400000,'448115355618402304','Michael Ambros,@eKomi\'s CEO on future of web dev, and how tools like @zapier and @odesk are leading the revolution. http://t.co/5NAlxYRHkb','Mon Mar 24 15:13:21 +0000 2014',18586961,'18586961','en','2015-05-17 22:00:04',''),(499919005101360000,'499919005101359104','We\'ll be at @dmexco 2014 with our partner @smartfocus-plan on visiting us @Kölnmesse Sept. 10-11 in Hall 6, #E-068! http://t.co/E2aJRs8zBh','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',1,2,'1408024953',19068239,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'en','2015-05-17 22:00:04',''),(504938359916340000,'504938359916339200','RT @risecreditUS: Curious about RISE? See feedback from more than 6,500 customer reviews here: http://t.co/u9XCH0TTBi','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',1,0,'1409221661',19068239,NULL,502898028446240000,'502898028446244864','Curious about RISE? See feedback from more than 6,500 customer reviews here: http://t.co/u9XCH0TTBi','Fri Aug 22 19:20:08 +0000 2014',1553989327,'1553989327','en','2015-05-17 22:00:04',''),(511501478150700000,'511501478150696960','RT @DanielJAustin: Approved review aggregators - BazaarVoice, Power Reviews, ShopperApproved, ViewPoints\nResellerRatings, Feefo, Yotpo, Eko…','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',2,0,'1410786430',19068239,NULL,511481024476230000,'511481024476233728','Approved review aggregators - BazaarVoice, Power Reviews, ShopperApproved, ViewPoints\nResellerRatings, Feefo, Yotpo, Ekomi, Reevoo #ppcchat','Mon Sep 15 11:45:53 +0000 2014',20426198,'20426198','en','2015-05-17 22:00:04',''),(512900081322690000,'512900081322692611','Come visit us @e_commerceparis, Sept. 23-25! Stop by @Paris Porte De Versailles,booth # JK074. Can\'t wait to see you! http://t.co/mtN4lwhYry','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',2,2,'1411119883',19068239,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'en','2015-05-17 22:00:04',''),(513974121601180000,'513974121601179649','RT @INKredibleBarry: Now over 18,000 Customer Reviews! @eKomi https://t.co/AdmtX4cL4T 99.48% Positive! http://t.co/7MJ5dSJCJv Your No.1 for…','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',2,0,'1411375954',19068239,NULL,513763709228150000,'513763709228154880','Now over 18,000 Customer Reviews! @eKomi https://t.co/AdmtX4cL4T 99.48% Positive! http://t.co/7MJ5dSJCJv Your No.1 for Ink Cartridges!','Sun Sep 21 18:56:28 +0000 2014',562014942,'562014942','en','2015-05-17 22:00:04',''),(515093150516260000,'515093150516264960','@e_commerceparis, Merci!','<a href=\"https://dev.twitter.com/docs/tfw\" rel=\"nofollow\">Twitter for Websites</a>',0,1,'1411642751',19068239,515090497686500000,NULL,NULL,NULL,NULL,NULL,NULL,'fr','2015-05-17 22:00:04',''),(515093256301190000,'515093256301187072','RT @e_commerceparis: @Ekomi, leader européen des avis clients et produits certifiés #ecp14 #ecommerce  http://t.co/nWySven4Mw','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',2,0,'1411642776',19068239,NULL,515090497686500000,'515090497686495232','@Ekomi, leader européen des avis clients et produits certifiés #ecp14 #ecommerce  http://t.co/nWySven4Mw','Thu Sep 25 10:48:39 +0000 2014',516403679,'516403679','fr','2015-05-17 22:00:04',''),(527389520099300000,'527389520099299328','RT @Vaszary: Fokus-Verlagerung von Keyword-Recherche zu Nutzer-Intentions Recherche ... Auszug aus #Seo Event @eKomi','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',3,0,'1414574434',19068239,NULL,527387022441590000,'527387022441594880','Fokus-Verlagerung von Keyword-Recherche zu Nutzer-Intentions Recherche ... Auszug aus #Seo Event @eKomi','Wed Oct 29 09:10:39 +0000 2014',146071906,'146071906','de','2015-05-17 22:00:04',''),(527389696943730000,'527389696943730688','RT @timoort: 7 Steps to Customer Loyalty in eCommerce https://t.co/gAd9nlbwta via @a_hotz @userlike @trustedshops @PracticalEcomm @eKomi  @…','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',5,0,'1414574476',19068239,NULL,522688623028620000,'522688623028621312','7 Steps to Customer Loyalty in eCommerce https://t.co/gAd9nlbwta via @a_hotz @userlike @trustedshops @PracticalEcomm @eKomi  @shopgate','Thu Oct 16 10:00:53 +0000 2014',185110080,'185110080','en','2015-05-17 22:00:04',''),(527524759442330000,'527524759442325504','RT @Vaszary: Was war das nur für ein tolles #SEO Event von @eKomi und @TextMasterDE heute. War super! Vielen Dank für die Einladung @BIG_Gm…','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',3,0,'1414606678',19068239,NULL,527505770460750000,'527505770460745730','Was war das nur für ein tolles #SEO Event von @eKomi und @TextMasterDE heute. War super! Vielen Dank für die Einladung @BIG_GmbH','Wed Oct 29 17:02:30 +0000 2014',146071906,'146071906','de','2015-05-17 22:00:04',''),(527524823606770000,'527524823606767616','@Vaszary @TextMasterDE @BIG_GmbH Vielen lieben Dank!','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',1,0,'1414606693',19068239,527505770460750000,NULL,NULL,NULL,NULL,NULL,NULL,'de','2015-05-17 22:00:04',''),(527827839828390000,'527827839828385794','RT @risecreditUS: RISE customers, don\'t forget to fill out your feedback email from eKomi. Your review will be added here: http://t.co/98ns…','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',1,0,'1414678938',19068239,NULL,526825766370420000,'526825766370422784','RISE customers, don\'t forget to fill out your feedback email from eKomi. Your review will be added here: http://t.co/98nszWfAYz','Mon Oct 27 20:00:25 +0000 2014',1553989327,'1553989327','en','2015-05-17 22:00:04',''),(544867816504330000,'544867816504328192','RT @vdisplays: Our #customerexperience and #customerservice is 5 * according to our #customers. Many new @eKomi #reviews http://t.co/i7XwVt…','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',3,0,'1418741585',19068239,NULL,544862211685240000,'544862211685236736','Our #customerexperience and #customerservice is 5 * according to our #customers. Many new @eKomi #reviews http://t.co/i7XwVtpfm0','Tue Dec 16 14:30:48 +0000 2014',231846311,'231846311','en','2015-05-17 22:00:04',''),(544869198405840000,'544869198405836800','RT @ERGODeutschland: Sterne für Produkte und Services: #ERGO bittet Kunden um ihre Meinung http://t.co/7tqFcmjh3F #Blog @eKomi http://t.co/…','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',2,0,'1418741914',19068239,NULL,544503238113120000,'544503238113116162','Sterne für Produkte und Services: #ERGO bittet Kunden um ihre Meinung http://t.co/7tqFcmjh3F #Blog @eKomi http://t.co/x30hmAS4dZ','Mon Dec 15 14:44:23 +0000 2014',2292805620,'2292805620','de','2015-05-17 22:00:04',''),(544869572562940000,'544869572562939904','RT @OnlynaturalsUK: We have just had our 500th review on @eKomi - 100% positive with 4.9 out of 5 average score. Thank you all so much http…','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',2,0,'1418742003',19068239,NULL,537327678224080000,'537327678224084993','We have just had our 500th review on @eKomi - 100% positive with 4.9 out of 5 average score. Thank you all so much http://t.co/PyCNJFSz6i','Tue Nov 25 19:31:16 +0000 2014',461401609,'461401609','en','2015-05-17 22:00:04',''),(562591380040480000,'562591380040478720','RT @na_presseportal: eKomi The Feedback: eKomi \"The Feedback Company\" und Barketing etablieren eine.. http://t.co/ZHTEvdBTNR http://t.co/YP…','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',2,0,'1422967212',19068239,NULL,562503011659160000,'562503011659157506','eKomi The Feedback: eKomi \"The Feedback Company\" und Barketing etablieren eine.. http://t.co/ZHTEvdBTNR http://t.co/YPvT40lCeE','Tue Feb 03 06:49:03 +0000 2015',44894572,'44894572','en','2015-05-17 22:00:04',''),(562591820740180000,'562591820740177920','RT @AllianzAvecVous: Les clients #Allianz donnent leur avis sur eKomi http://t.co/tiCE6ctPy6 http://t.co/pco1ZhIHY9','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',5,0,'1422967317',19068239,NULL,559659525523790000,'559659525523787776','Les clients #Allianz donnent leur avis sur eKomi http://t.co/tiCE6ctPy6 http://t.co/pco1ZhIHY9','Mon Jan 26 10:30:03 +0000 2015',2316895484,'2316895484','fr','2015-05-17 22:00:04',''),(577394314768200000,'577394314768199680','RT @AllianzAvecVous: Que pensent les clients #Allianz ? http://t.co/oTQM48FDlM Accrédité par eKomi http://t.co/umcMvZUz7E','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',2,0,'1426496506',19068239,NULL,575944371595440000,'575944371595440129','Que pensent les clients #Allianz ? http://t.co/oTQM48FDlM Accrédité par eKomi http://t.co/umcMvZUz7E','Thu Mar 12 09:00:13 +0000 2015',2316895484,'2316895484','fr','2015-05-17 22:00:04',''),(577394453977120000,'577394453977120768','RT @allianzfrance: Les clients #Allianz donnent leur avis sur eKomi http://t.co/jJJP61D5c0 avec .@AllianzAvecVous http://t.co/0GMtVbiISS','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',7,0,'1426496539',19068239,NULL,575217524339510000,'575217524339507200','Les clients #Allianz donnent leur avis sur eKomi http://t.co/jJJP61D5c0 avec .@AllianzAvecVous http://t.co/0GMtVbiISS','Tue Mar 10 08:51:59 +0000 2015',270453413,'270453413','fr','2015-05-17 22:00:04',''),(577757301181960000,'577757301181956097','20 Must-Have Tools for Clever Marketers http://t.co/lxDXmfaN0v via @marketingprofs','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',1,2,'1426583049',19068239,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'en','2015-05-17 22:00:03',''),(578142598797400000,'578142598797402113','Join eKomi @iwkongress in Munich, March 24th &amp; 25th in Hall A w/ our partner EHI! We look fwd to seeing you! #iwk http://t.co/slZOW3N4OF','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',1,3,'1426674911',19068239,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'en','2015-05-17 22:00:03',''),(581430774479650000,'581430774479646720','eKomi\'s glad to be a partner! \'\'@Google Expands Product Rating Stars In Google Shopping Ads To UK, France, Germany http://t.co/rqz0cm7vXi\'\'','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',1,1,'1427458873',19068239,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'en','2015-05-17 22:00:03',''),(581431103401100000,'581431103401103360','RT @sengineland: Product rating stars come to @Google shopping ads in the UK, France, &amp; Germany: http://t.co/FNNnSm0G79 http://t.co/0n4pTS3…','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',33,0,'1427458952',19068239,NULL,581192436497720000,'581192436497719296','Product rating stars come to @Google shopping ads in the UK, France, &amp; Germany: http://t.co/FNNnSm0G79 http://t.co/0n4pTS311r','Thu Mar 26 20:34:09 +0000 2015',1059801,'1059801','en','2015-05-17 22:00:03',''),(581435837243660000,'581435837243658240','RT @EcommercenewsEU: #Google adds product ratings to search ads in #Europe: http://t.co/K0UGnHiZOS http://t.co/jPl8ILhjpx','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',5,0,'1427460080',19068239,NULL,581087608547220000,'581087608547217408','#Google adds product ratings to search ads in #Europe: http://t.co/K0UGnHiZOS http://t.co/jPl8ILhjpx','Thu Mar 26 13:37:36 +0000 2015',1407572472,'1407572472','en','2015-05-17 22:00:03',''),(582846222328820000,'582846222328823808','RT @na_presseportal: eKomi The Feedback: Kooperation mit Google: eKomi führt Produktbewertungen bei.. http://t.co/abXSavl7zu http://t.co/br…','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',2,0,'1427796342',19068239,NULL,582778868848850000,'582778868848848896','eKomi The Feedback: Kooperation mit Google: eKomi führt Produktbewertungen bei.. http://t.co/abXSavl7zu http://t.co/brO0850jYo','Tue Mar 31 05:38:04 +0000 2015',44894572,'44894572','de','2015-05-17 22:00:03',''),(582856142809880000,'582856142809878528','RT @SXSW_TopNews: eKomi annonce un partenariat avec Google et introduit en France les évaluations des Product Listing Ads http://t.co/moGwM…','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',3,0,'1427798708',19068239,NULL,582849092738400000,'582849092738400256','eKomi annonce un partenariat avec Google et introduit en France les évaluations des Product Listing Ads http://t.co/moGwMRdsgH','Tue Mar 31 10:17:07 +0000 2015',263800084,'263800084','fr','2015-05-17 22:00:03',''),(582856191866480000,'582856191866482688','RT @robinsnewswire: \"eKomi Announces #Google Partnership Introducing Product Ratings on Product Listing Ads in the UK\" : http://t.co/Ldyq6Z…','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>',4,0,'1427798719',19068239,NULL,582847836502380000,'582847836502384640','\"eKomi Announces #Google Partnership Introducing Product Ratings on Product Listing Ads in the UK\" : http://t.co/Ldyq6Z7MoX','Tue Mar 31 10:12:07 +0000 2015',40173650,'40173650','en','2015-05-17 22:00:03','');
/*!40000 ALTER TABLE `tweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(64) NOT NULL,
  `id_str` varchar(145) DEFAULT NULL,
  `screen_name` varchar(145) DEFAULT NULL,
  `fullname` varchar(145) DEFAULT NULL,
  `description` varchar(245) DEFAULT NULL,
  `location` varchar(145) DEFAULT NULL,
  `statuses_count` int(11) DEFAULT NULL,
  `followers_count` int(11) DEFAULT NULL,
  `friends_count` int(11) DEFAULT NULL,
  `favourites_count` int(11) DEFAULT NULL,
  `url` varchar(145) DEFAULT NULL,
  `profile_image_url` varchar(145) DEFAULT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  `lang` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1059801,'1059801','sengineland','Search Engine Land','Search Engine News Daily. Producers of @marketingland & @smx. Expert Analysis How-Tos & Opinions on #SEO #PPC #SEM #Google #Bing #Yahoo #Microsoft','Everywhere search is.',44622,310631,508,28,'http://t.co/ESAtgdTfRq','http://pbs.twimg.com/profile_images/498817852900519937/Y5EkXXXl_normal.jpeg','Tue Mar 13 01:28:07 +0000 2007','en'),(18586961,'18586961','SBechara','Samer Bechara','Developing online platforms for high-growth startups that eliminate technology problems and give startup owners the technical confidence they need to grow.','',96,2374,756,1,'http://t.co/4USRg5gCzT','http://pbs.twimg.com/profile_images/2307427529/f24b1bo58wpy2lzl5gkn_normal.png','Sat Jan 03 21:03:00 +0000 2009','en'),(19068239,'19068239','eKomi','eKomi','We manage customer ratings & #reviews ★★★★★ to build trust, increase traffic and conversion rates. We have published millions of reviews for our customers.','Berlin, Germany',432,1951,1971,228,'http://t.co/3JPL5WXRtn','http://pbs.twimg.com/profile_images/645813336/ekomi-logo_normal.png','Fri Jan 16 14:25:48 +0000 2009','en'),(20426198,'20426198','DanielJAustin','Daniel Austin','Please allow me to introduce myself...I\'m a man of wealth & taste. A wrong decision is better than an indecision. Get me! Keeping it mad gully...','Manchester',10639,897,267,7,'http://t.co/UtB6slvUft','http://pbs.twimg.com/profile_images/344513261567920964/df51c1d564204bc860daf8aa8a71d390_normal.jpeg','Mon Feb 09 10:03:54 +0000 2009','en'),(40173650,'40173650','robinsnewswire','World News Report','Providing trusted world news reports and shopping discounts on the web 24/7. Retweeting for opinions, useful infomation, and the many voices of Twitter.','@ fb.me/specialnewsfeatures',814541,20348,19435,555,'http://t.co/DNyCun08Ab','http://pbs.twimg.com/profile_images/2240371734/robin_digital_stamp_colored_icon2_normal.png','Fri May 15 04:16:20 +0000 2009','en'),(44894572,'44894572','na_presseportal','presseportal.de','Ein Service der dpa-Tochter news aktuell. Unsere Branchenfeeds finden Sie unter http://t.co/FLuLO5cUNW\nFolgende Sie uns auf Facebook http://t.co/PwBBGPSdGj','Hamburg',345035,3875,306,3,'http://t.co/J2Lm3Keo9S','http://pbs.twimg.com/profile_images/544777466074501120/ys_LYBn8_normal.jpeg','Fri Jun 05 13:45:07 +0000 2009','de'),(59080800,'59080800','onlinespyshop','Online Spy Shop','Online Spy Shop have been providing customers with a first class customer service and cutting-edge spy products since 2005.','UK',4352,1536,672,599,'http://t.co/NMijSAxrmC','http://pbs.twimg.com/profile_images/590431271077154816/saOYECMP_normal.png','Wed Jul 22 09:14:15 +0000 2009','en'),(146071906,'146071906','Vaszary','Benjamin Biró','I like to tweet with my peeps about #SocialMedia #Monitoring #SocialCRM #Ratings #CXM','Berlin',1236,4627,3721,79,NULL,'http://pbs.twimg.com/profile_images/915779982/IMG_0703c_normal.jpg','Thu May 20 14:44:44 +0000 2010','en'),(185110080,'185110080','timoort','Timoor Taufig','Co-Founder @Userlike Live Chat Software. #CRM and #SaaS enthusiast.     Free for startups: http://t.co/p3bSha4jZO','Cologne',2057,1178,1832,615,'http://t.co/ggR0Y8vG7x','http://pbs.twimg.com/profile_images/473591585993523200/jvWgZPtY_normal.png','Tue Aug 31 07:21:28 +0000 2010','en-gb'),(231846311,'231846311','vdisplays','Valentino\'s Displays','Valentino\'s is a supplier of Shop Fittings & Point of Sale including Clothes Rails, Hangers & Mannequins. Shop Display Equipment with next day UK delivery!','Southampton, UK',2186,500,1998,160,'http://t.co/cZjztLxPO8','http://pbs.twimg.com/profile_images/519780093720137728/cUjoOQZh_normal.jpeg','Wed Dec 29 16:38:22 +0000 2010','en'),(263800084,'263800084','SXSW_TopNews','SXSW TOP NEWS','i´m a news bot.','Austin, TX',170477,1525,27,0,NULL,'http://pbs.twimg.com/profile_images/1815711281/png_normal.png','Thu Mar 10 19:25:20 +0000 2011','en'),(270453413,'270453413','allianzfrance','Allianz France','Actualité d’Allianz en France et dans le monde. Allianz est le premier assureur d’Europe.','Paris',4812,31778,315,82,'http://t.co/azNX5cRzrN','http://pbs.twimg.com/profile_images/458877007837671425/SF6zenjT_normal.jpeg','Tue Mar 22 17:05:19 +0000 2011','fr'),(461401609,'461401609','OnlynaturalsUK','onlynaturals.co.uk','Bringing you only the best in natural and organic skincare with FREE UK delivery on all orders','Reading, UK',311,839,569,33,'http://t.co/ov2OiSdCTP','http://pbs.twimg.com/profile_images/1778792600/Twitter-Avatar_normal.png','Wed Jan 11 19:24:43 +0000 2012','en'),(516403679,'516403679','e_commerceparis','E-Commerce Paris','L\'événement cross-canal - 21-23 Sept.2015 || The cross-channel event #ECP15 #ParisRetailWeek #Conf #Awards #Rookie','Paris Porte de Versailles Pav1',4714,3758,598,1047,'http://t.co/SfXMB64z1T','http://pbs.twimg.com/profile_images/420463216045486080/tcN8xccl_normal.jpeg','Tue Mar 06 10:21:22 +0000 2012','fr'),(562014942,'562014942','INKredibleBarry','INKredibleBarry','Make us your No.1 choice for Ink Cartridges in the UK! FREE Delivery and Expert Service guaranteed! March 10% Discount Code \'NEWSITE\'','Darlington',2856,2607,2383,6,'http://t.co/WtMG8dNeeB','http://pbs.twimg.com/profile_images/551737834705408000/4Cxgzlef_normal.jpeg','Tue Apr 24 11:11:40 +0000 2012','en'),(1407572472,'1407572472','EcommercenewsEU','Ecommercenews','All the ecommerce news about Europe you\'ll ever need!','Europe',847,843,120,33,'http://t.co/JlZgHOnxlp','http://pbs.twimg.com/profile_images/444046497143734272/2p3I9buO_normal.jpeg','Mon May 06 12:09:53 +0000 2013','nl'),(1553989327,'1553989327','risecreditUS','RISE Credit','RISE offers emergency loans with clear pricing and flexible repayment options. Follow us for product updates and finance tips. Official hours: M-F, 9a-5p CDT.','',566,156,174,13,'http://t.co/6m8cR4jpk4','http://pbs.twimg.com/profile_images/472113842143494144/PPwXzXsz_normal.jpeg','Fri Jun 28 20:32:58 +0000 2013','en'),(2292805620,'2292805620','ERGODeutschland','ERGO Deutschland','Versicherungsnews, Verbrauchertipps, Aktuelles: Hier twittert das Social-Media-Team der ERGO Versicherungsgruppe. Impressum: http://t.co/bNWUWzeaQN','',1600,3591,245,415,'https://t.co/db2oU7Bj2j','http://pbs.twimg.com/profile_images/476967464400461824/LBoH_wYp_normal.png','Wed Jan 15 14:43:56 +0000 2014','de'),(2316895484,'2316895484','AllianzAvecVous','Allianz Avec Vous','Les réponses à vos questions sur nos produits et services #assurance #finance \nlundi-vendredi 10h-18h. \nSuivez toute notre actualité sur @allianzfrance','France',773,531,704,53,'http://t.co/fM0Rx3Ct8U','http://pbs.twimg.com/profile_images/458876075766853632/_U5RZGrh_normal.jpeg','Wed Jan 29 10:20:18 +0000 2014','fr');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-18  0:32:31
