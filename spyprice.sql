-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2018 at 10:10 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spyprice`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `status`, `created`, `updated`) VALUES
(1, 'Technology', 0, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(2, 'Home Electrical', 0, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(3, 'Baby & Toddler', 0, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(4, 'Sports & Leisure', 0, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(5, 'Digital Cameras', 1, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(6, 'Camcorders', 1, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(7, 'Televisions', 1, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(8, 'Set Top Boxes', 1, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(9, 'GPS Sat Navs', 1, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(10, 'SoundBars', 1, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(11, 'Tablets', 1, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(12, 'Fridges', 2, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(13, 'Freezers', 2, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(14, 'Dishwashers', 2, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(15, 'Washing Machines', 2, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(16, 'Washer Dryers', 2, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(17, 'Tumble Dryers', 2, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(18, 'Cookers & Hobs', 2, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(19, 'Fridge Freezer', 2, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(20, 'Prams & Pushchairs', 3, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(21, 'Car Seats', 3, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(22, 'Nursery Furniture', 3, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(23, 'Musical Instruments', 4, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(24, 'Luggage', 4, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(25, 'Bikes', 4, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(26, 'Tents', 4, 1, '2018-03-31 16:07:04', '2018-03-31 16:07:04'),
(27, ' Clothing & Jewellery', 0, 1, '2018-03-31 16:14:10', '2018-03-31 16:14:10'),
(28, ' Garden', 0, 1, '2018-03-31 16:14:10', '2018-03-31 16:14:10'),
(29, 'Womens', 27, 1, '2018-03-31 16:18:29', '2018-03-31 16:18:29'),
(30, 'Boys', 27, 1, '2018-03-31 16:18:29', '2018-03-31 16:18:29'),
(31, 'Girls', 27, 1, '2018-03-31 16:18:29', '2018-03-31 16:18:29'),
(32, 'Jewellery', 27, 1, '2018-03-31 16:18:29', '2018-03-31 16:18:29'),
(33, 'Watches', 27, 1, '2018-03-31 16:18:29', '2018-03-31 16:18:29'),
(34, 'Garden Furniture', 28, 1, '2018-03-31 16:21:00', '2018-03-31 16:21:00'),
(35, 'Garden Power Tools', 28, 1, '2018-03-31 16:21:00', '2018-03-31 16:21:00'),
(36, 'BBQ & Patio Heaters', 28, 1, '2018-03-31 16:21:00', '2018-03-31 16:21:00'),
(37, 'Sheds', 28, 1, '2018-03-31 16:21:00', '2018-03-31 16:21:00');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` int(11) DEFAULT '1',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `status`, `created`, `updated`) VALUES
(1, '360Fly', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(2, '3M', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(3, 'A Data', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(4, 'Acer', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(5, 'Activeon', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(6, 'Adata', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(7, 'AKG Harman', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(8, 'Akai', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(9, 'Alesis', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(10, 'Alienware', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(11, 'Alphason Designs', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(12, 'Amazon', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(13, 'AMD', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(14, 'Ancient Mariner Furniture', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(15, 'Annaghmore', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(16, 'AOC', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(17, 'Aorus', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(18, 'APC', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(19, 'Apple', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41'),
(20, 'Astell and Kern', 1, '2018-03-31 17:50:41', '2018-03-31 17:50:41');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` int(11) DEFAULT '1',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `name`, `status`, `created`, `updated`) VALUES
(1, '1080', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(2, '16gb', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(3, '32gb', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(4, '3d', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(5, '16gb', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(6, 'air', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(7, 'bluetooth', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(8, 'compact', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(9, 'dlna', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(10, 'dslr', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(11, 'europe', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(12, 'freeview+', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(13, 'gps', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(14, 'motorbikes', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(15, 'hd', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(16, 'mini', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(17, 'subwoofer', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(18, 'smart', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(19, 'touch', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(20, 'traffic', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(21, 'widescreen', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(22, 'waterproof', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13'),
(23, 'wifi', 1, '2018-03-31 16:11:13', '2018-03-31 16:11:13');

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

CREATE TABLE `merchants` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `status` int(11) DEFAULT '1',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merchants`
--

INSERT INTO `merchants` (`id`, `name`, `status`, `created`, `updated`) VALUES
(1, 'Amazon', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(2, 'Amazon MarketPlace', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(3, 'Amazon MarketPlace Used', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(4, 'AO', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(5, 'Argos', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(6, 'Beyond Television\r\n', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(7, 'Boots', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(8, 'BT Shop', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(9, 'BTshop', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(10, 'CFS Online', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(11, 'Choice Furniture Superstore', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(12, 'Co op Electrical Shop', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(13, 'Currys', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(14, 'Dabs', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(15, 'DirectTVs', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(16, 'Ebuyer', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(17, 'eGlobal Central', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(18, 'Electrical Discount', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(19, 'Electrical Experience', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54'),
(20, 'Electricshop', 1, '2018-03-31 16:11:54', '2018-03-31 16:11:54');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `merchant_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `price` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `company_id`, `merchant_id`, `name`, `description`, `price`, `image`, `status`, `created`, `updated`) VALUES
(1, 5, 4, 1, 'Canon EOS 700D', 'An immediate all- the Canon EOS 700D refreshes precisely what created the 650D fantastic with ingenious style variations and improved features, round vintage. It comes filled with a robust 18-megapixel sensor to recapture photos in legitimate-to- with precise lifestyle quality shading. A robust cpu additionally makes swift that is clean and fast autofocus -flame firing possible. The EOS 700D actually helps Complete HD movie record with autofocus assistance for pin benefits that are sharp shooting pictures or whether building a residence film. This camera comes with a 18-55mm photograph stabilising...', '315', 'Canon-EOS-700D-175x175.jpg', 1, '2018-03-31 18:15:50', '2018-03-31 18:15:50'),
(2, 5, 4, 1, 'Canon SX60', 'The 21 mm lens offers a watch that is wide also, in order to get beautiful photographs of other as well as areas, structure things that are significant. Easy concentrating The PowerShot SX60 delivers one and autofocus -hint Zoom Framework Guide that invite you to rapidly zoom out-of a to maintain themes inside your views and retain points well-defined. Again to wherever youll need it to become once the key is launched, the camera can zoom back. The camera also offers if the matter starts leaving the shape so you may maintain it in a predetermined measurement for more reliable outcomes, a sophisticated... ', '349', 'Canon-SX60-175x175.jpg', 1, '2018-03-31 18:36:45', '2018-03-31 18:36:45'),
(3, 5, 1, 5, 'Nikon Coolpix B500', 'Explore the power of its Nikkor 40x optical zoom, extendable to 80x Dynamic Fine Zoom, putting you at the heart of the action, with the side zoom control adding to superb stability. Take a unique viewpoint with the high-definition tilting LCD monitor, easily recapture subjects with the Snap-back zoom button and keep your camera connected to your smart device with SnapBridge. Intuitive operation makes shooting simple and frequently used functions can be accessed via the mode dial, while the classic design feels comfortable in your hands.', '184', 'Nikon-Coolpix-B500-175x175.jpg', 1, '2018-03-31 18:39:20', '2018-03-31 18:39:20'),
(4, 5, 1, 5, 'Canon 750D', 'Maintain as much as £40 Cashback when purchased with 18 with chosen lenses.The Canon EOS 750D -135mm lens is geared toward small camera consumers seeking to produce that move to much more control over their photography and the EOS earth for greater image-quality and fanatics. Stuffed and light with the newest engineering, the 750D comes with a sizable 24-megapixel APSC CMOS sensor, DIGIC 6 cpu and Arena Smart auto-mode to provide HD shows and spectacular images in virtually any scenario, with simplicity. The camera \" vari- fresh Cross CMOS AF III technique and direction touchscreen ensure it is...', '400', 'Canon-750D-175x175.jpg', 1, '2018-03-31 18:39:36', '2018-03-31 18:39:36'),
(5, 6, 2, 3, 'Nikon Coolpix A900 Digital Camera Silver', 'The 20.3-megapixel Coolpix A900 delivers outstanding performance in a compact body. Enjoy exceptional quality Nikkor optics in a pocket-sized body to fit any lifestyle: shoot stunning travel scenes in fine detail with the high-power 35x optical zoom lens, extendable to 70x Dynamic Fine Zoom, or capture memorable moments in crisp 4K UHD movies. Get creative with the tilting screen and manual exposure modes (P/S/A/M), and keep your camera connected to your smart device with SnapBridge. Be ready to shoot at a moments notice with High-speed AF, easily recapture a subject with the Snap-back zoom button...', '271', 'Nikon-Coolpix-A900-Digital-Camera-Silver-175x175.jpg', 1, '2018-03-31 18:40:50', '2018-03-31 18:40:50'),
(6, 6, 2, 1, 'Canon EOS1300D', 'The EOS 1300D from Canon is an entry-level DSLR that replaces the 1200D in Canons EOS model line-up. Aimed at beginners and photography enthusiasts who wish to take their hobby to the next level, the 1300D is an 18-megapixel camera with Wi-Fi connectivity, a 9-point AF system, Full HD video recording and up to 3fps continuous shooting. Containing all of the technology essential to DSLR photography but in a lightweight body, the EOS 1300D is the ideal choice for those who wish to shoot straight from the box using a simple yet feature packed DSLR that yields extraordinary results', '315', 'Canon-EOS-1300D-Digital-SLR-Camera-Body-175x175.jpg', 1, '2018-03-31 18:41:40', '2018-03-31 18:41:40'),
(7, 6, 3, 2, 'Panasonic DMC FT30', 'Record the motion marine, while in the snowfall all with all the sturdy Panasonic Lumix DMC or in the seaside -FT30EB-A Digital Camera that is Tough. Pointed, images that are continuous Capture all of the activity using the Lumix DMC-FT30 is for producing big poster-size images 16.1 megapixel CCD sensor, which conveys a lot of depth. Without diminishing with a 4 x zoom on excellent find nearer to the activity. Do not let hand-move damage the DMC, a properly great photo - FT30EB attributes for blurring due to actually the tiniest quantity of hand, a SUPER Optical Image Stabiliser which pays -move... ', '105', 'Panasonic-DMC-FT30-175x175.jpg', 1, '2018-03-31 18:41:40', '2018-03-31 18:41:40'),
(8, 6, 3, 2, 'Panasonic LX100EBK', 'Appreciate high-quality photography minus the equipment that is large. Key colors are carefully produced to get a more normal watch that produces firing at a satisfaction. If you are surrounding your photo, an easy call on its section may be used. Filming designs assorted without reducing your perspective. Amazing graphic solution This camera gives beautifully apparent images with sound that is small, in all circumstances that are firing. A Venus image-processing motor enables the Panasonic Lumix DMC-GM5KEB-K to increase its Digital Live MOS sensors performance and high-rank Micro-Four Thirds... ', '394', 'Panasonic-HCW580-175x175.jpg', 1, '2018-03-31 18:41:41', '2018-03-31 18:41:41'),
(9, 7, 1, 1, 'LG 32LH604V', '32\" Smart Full HD Led TV with Freeview HD   TRIPLE XD ENGINE Triple XD Engine delivers color, contrast and clarity of the highest caliber to provide the best possible image quality and performance.   **** PMI (PICTURE MASTERING INDEX) Picture Mastering index creates vivid and lifelike images using LG advanced imaging technology for improved sharpness, color brightness and contrast. ****   WEBOS 3.0 LG Smart TV, webOS 3.0 is designed to be simple and intuitive, so that it is easy to learn and fun to use. All you need to do is to relax and let WebOS 3.0 make the television experience better... ', '249', 'LG-32LH604V-175x175.jpg', 1, '2018-03-31 19:00:59', '2018-03-31 19:00:59'),
(10, 7, 2, 2, 'LG 49LH604V', 'The 49LH604V produces Full HD visuals, delivering clear and vibrant colours no matter what you are watching. The detail is further enhanced to reach higher levels of picture quality thanks to the Triple XD Engine. As a result, you can immerse yourself in dynamic visuals. You can also enjoy less glare and greater contrast thanks to True Black, an innovative anti-glare film which allows you to see deeper blacks on the screen. Smart TV Enhance your home entertainment with access to smart TV services.... ', '399', 'LG-49LH604V-175x175.jpg', 1, '2018-03-31 19:00:59', '2018-03-31 19:00:59'),
(11, 7, 3, 4, 'LG-58UH635V-175x175.jpg', '58\" Smart 4K Ultra Led TV with Quad Core Processor   SUPER HDR&nbsp;AND DOLBY VISION Technology High Dynamic Range (HDR Super) SUPER UHD TV LG provides maximum support Dolby Vision technology. Clearer and sharper images expressed in true colors and maximum detail devour every viewer. Just look at the screen and you feel that you yourself are part of the action. * Dolby Vision will be available through a software update, which requires an Internet connection.   ULTRA LUMINANCE ULTRA Luminance sends remaining power in darker areas to brighter areas to obtain a better contrast. Because LG SUPER UHD TV...', '689', 'LG-58UH635V-175x175.jpg', 1, '2018-03-31 19:01:00', '2018-03-31 19:01:00'),
(12, 7, 4, 5, 'LG 65UH770V', '65inch 4K UHD LED SMART TV WiFi Freeview HD HDR Plus\r\n', '1229', 'LG-65UH770V-175x175.jpg', 1, '2018-03-31 19:01:00', '2018-03-31 19:01:00'),
(13, 8, 1, 3, 'Panasonic DMRPWT550EB', 'This Freeview Play compatible HDD Recorder lets you enjoy wide variety of content. With TV Anywhere, you can watch and record programmes both at home and while youre away. Includes image-enhancing functions such as 4K Upscaling and 4K Networking. With the newly supported Freeview Play function you will be able to watch TV programmes from the last seven days. You can watch drama, news, sports and other programmes that you missed while you were away from home, without even having to record them. They are ready for you to watch when youre ready to watch. A Freeview Play button has been added to...', '230', 'Panasonic-DMRPWT550EB-175x175.jpg', 1, '2018-03-31 19:12:11', '2018-03-31 19:12:11'),
(14, 8, 2, 3, 'Samsung UBDK8500', 'Offering compatibility on a wide range of discs, the Samsung UBD-K8500/XU Smart 4k Ultra HD 3D Blu-ray Player is the perfect way to make the most of striking 4k content. 4k Blu-ray Playback Designed to showcase films the way the director intended, the UBD-K8500 reproduces brightness and colour the way its mastered in film studios. Enjoy a range of UHD movies and TV shows on Blu-ray for unrivalled image quality, letting you enjoy your favourite content without worrying about buffering from streaming. Enjoy near 4k quality on any media format, with upscaling on all DVD and Blu-ray discs, so that...', '178', 'Samsung-UBDK8500-175x175.jpg', 1, '2018-03-31 19:12:11', '2018-03-31 19:12:11'),
(15, 8, 3, 2, 'Panasonic DMPUB900', 'The DMPUB900EB will allow you to make the most out of your 4k television, and enjoy the very latest generation of ultra-high definition Blu-rays with the Panasonic DMPUB900EB 4K player. It comes with a high dynamic range reproduction, and to add even more detail to all those extra pixels, and stunning audio options, the UB900 will offer a great leap forward in the quality of your home cinema experience. Not only is it just discs that will benefit from the UB900S power, it also comes with an internet and network connectivity, an SD card slot and a USB connection. You can also upscale your older...', '450', 'Panasonic-DMPUB900-175x175.jpg', 1, '2018-03-31 19:12:11', '2018-03-31 19:12:11'),
(16, 8, 1, 1, 'Panasonic DMRBWT850EB', 'This Freeview Player Compatible BD Recorder will let you enjoy a wide range of content. With TV anywhere, you will be able to watch and record programmes at home or whilst your away. In addition a host of image enhancing functions will include 4k Upscaling and 4k Networking. This Blu-ray/DVD Recorder will allow you to scroll back through the TV guide for a whole 7 day catch up. It also has an easy setting feature for all your favourite series.', '315', 'Panasonic-DMRBWT850EB-175x175.jpg', 1, '2018-03-31 19:12:11', '2018-03-31 19:12:11'),
(17, 19, 2, 1, 'Bosch KUR15A50GB', 'This fridge can be ranked A+ for energy performance! Which means you might never come house to seek out pools of water in the fridges root, or snow construct-up in destinations that are cool! Storage functions contain two-door racks and also a large in-door jar patio, three racks - two which are height-adjustable - along with a total-breadth veggie cabinet in the bottom. The doorway joint is not nonreversible for setting freedom that is entire, and door seals that are magnetic that are detachable ensure that your fridge door shuts securely. This fridge additionally attributes plinth-found ventilation...', '362', 'Bosch-KUR15A50GB-175x175.jpg', 1, '2018-03-31 19:22:41', '2018-03-31 19:22:41'),
(18, 19, 2, 1, 'Hotpoint RLA36G', 'Shop your ingredients with quality and model in the easily graphite Hotpoint RLA36G Undercounter Fridge that is awesome. You will find a container sheet for all you food arranging and keeping, a salad cleaner and three security glass cabinets. This fridge that is streamlined can be designed with anti- safety that is microbial, retaining absent viruses and microorganisms for better meals. The inexpensive RLA- power is used by 36G successfully to maintain along your charges. Its actually been categorized with the A+ power score. Generating life simpler Due To an automobile-defrost functionality...', '210', 'Hotpoint-RLA36G-175x175.jpg', 1, '2018-03-31 19:22:42', '2018-03-31 19:22:42'),
(19, 19, 2, 1, 'Hotpoint RLFM171', 'For very stylish food-storage select the Hotpoint RLFM171P Tall Fridge that is roomy, using its contemporary white end. Four flexible, sufficient storage is provided by security glass racks for all you fresh-food, despite the store that is regular. Two crispers help retain vegetables and all of your latest fruit new and tasty, and bottles and eggs will soon be appropriate in the home in their particular cabinets. The in-constructed combined illumination presents light that was comprehensive at back and the front of the fridge, enabling you to locate what-youre trying to find in virtually no time...', '13', 'Hotpoint-RLFM171-175x175.jpg', 1, '2018-03-31 19:22:42', '2018-03-31 19:22:42'),
(20, 19, 2, 1, 'Hotpoint RLFM171', 'Firdges', '279', 'Hotpoint-RLFM171P-175m-High-Freestanding-Fridge-in-White-175x175.jpeg', 1, '2018-03-31 19:22:42', '2018-03-31 19:22:42'),
(22, 13, 1, 1, 'Hotpoint FZA36G', 'Allow the A+ financially successful Hotpoint FZA36G Undercounter Freezer look after holding your produce that is icy in a frost- atmosphere that is free. Benefit with tasty meals and enhanced nutritional importance from the usage of intelligent managed environments. Room capability The undercounter FZA 36G does not merely execute effectively, but helps your basics are organised by you. 3 huge freezer drawer compartments permitting upto 13 kg of ability are housed by the freezer. The Hotpoint FZA36G Undercounter Freezer that is aesthetically impressive provides a 4-star status and it is ranked...', '315', 'Hotpoint-FZA36G-175x175.jpg', 1, '2018-03-31 19:30:06', '2018-03-31 19:30:06'),
(23, 13, 2, 2, 'Hotpoint RZA36P', 'Lots of space for the food reduce purchasing excursions together with the 90 litres of storage-space being offered in this Hotpoint freezer and Store more frosty goods. Form and four compartments are supplied in different styles to allow for every one of the ingredients that are various you purchase. Retailer snow in the center compartments in the very best compartment, bones of beef in the large base drawer and additional greens, bakery, sweets along with other gifts. A Superfreeze function that is perfect for after a significant purchasing journey or legendary cooking treatment is also featured...', '194', 'Hotpoint-RZA36P-175x175.jpg', 1, '2018-03-31 19:30:06', '2018-03-31 19:30:06'),
(24, 20, 1, 1, 'ABC Design Mamba Plus Pushchair Graphite', 'The ABC Design Mamba Plus is designed & engineered in Germany. Offering a range of seating positions from 6 months, but for birth capabilities, it can also be used with the Mamba Plus Carrycot, Risus 0+ infant car seat or a range of other car seats including Maxi Cosi with the use of adaptors, which are all available separately. The 3 position seat unit can also fully lie back, with a carefully designed backrest to provide the perfect angle to support your childs back and spine. The leg rest is also both height & length adjustable. To add to this a memory foam seat liner, shoulder pads &...', '315', 'ABC-Design-Mamba-Plus-Pushchair-Graphite-175x175.jpg', 1, '2018-03-31 19:37:55', '2018-03-31 19:37:55'),
(25, 20, 2, 1, 'Chicco Liteway Stroller Red', 'This contemporary and stylish stroller is suitable from birth to 15kg (approximately three years). Light and compact when folded and features a comfortable padded seat and five position single handed reclining back rest. The Liteway stroller comes with a matching fleece footmuff that features pockets. The footmuff can be zipped apart to be used as a leg cover. Comfort is further enhanced with an adjustable leg rest, detachable folding hood and rain cover. Also features handles with soft non-slip hand grips and lockable front swivel wheels which make manoeuvring easy. Winner of Practical Parenting...', '103', 'Chicco-Liteway-Stroller-Red-175x175.jpg', 1, '2018-03-31 19:37:55', '2018-03-31 19:37:55'),
(26, 20, 5, 4, 'Cosatto Yo 2 Stroller Go Brightly', 'Thought the ever-ready Yo! Pushchair couldnt get more ready? Meet Yo2. The reinvention. Your A-list stroller and any-weather hero just got even tougher and rocks a stack of new features. Pumped up and even more protective thanks to adjustable calf-support, taller handles, extendable hood, bigger smooth ride wheels with reflectors. Plus the usual Yo talents, UPF 50+ hood, raincover, multi-reclining seat with newborn recline, tons of squidgy extras, cup holder, bumper bar and compact build. Suitable from birth lightweight aluminium chassis carry handle compact umbrella fold with auto... ', '315', 'Cosatto-Yo-2-Stroller-Go-Brightly-175x175.jpg', 1, '2018-03-31 19:37:55', '2018-03-31 19:37:55'),
(27, 20, 4, 3, 'Disney Monsters Inc Twin Stroller with Footmuffs', 'Our fantastic Monsters Inc twin stroller is ideal for those with two little monsters. This bright and lovable twin is packed with style. Containing a variety of practical features designed to keep children safe and cosy, while also providing parents on the go with a range of creative and convenient solutions, the stroller is perfect for outdoor adventures! Independently adjustable, from birth, seat units. Independently extendable & detachable hoods. Winner of no. Pushchair specifications: Size W77, D82cm. Weight 12kg. Max child weight 15kg. Age suitability: from birth to 4 years. Folding specifications:...', '315', 'Disney-Monsters-Inc-Twin-Stroller-with-Footmuffs-175x175.jpg', 1, '2018-03-31 19:37:55', '2018-03-31 19:37:55'),
(28, 21, 4, 2, 'Recaro Young Sport', 'RECARO Young Sport Hero provides easy handling and highly advanced safety features. The Young Sport Hero offers the highest levels of safety and ergonomics from around 9 months to 12 years of age. This car seat features the Hero Safety System, with shoulder paddings, belts and headrest forming one unit. No slipping or twisting of belts makes buckling in easy. Extra padding on the shoulder straps prevents further injuries in case of a frontal crash. Advanced side protection in hip, shoulder and head areas. Energy absorbers reduce forces in case of a side impact Installation with the cars 3-point... ', '109', 'Recaro-Young-Sport-175x175.jpeg', 1, '2018-03-31 19:45:58', '2018-03-31 19:45:58'),
(29, 21, 5, 3, 'Maxi Cosi Airprotect Group 2 3 Car Seat Modern Black', 'The Maxi-Cosi Rodi AirProtect works for youngsters from 15 to 36 kg (approximately 3.5 to 12 years) and capabilities innovative side-impact defense because of it is AirProtect method in-built inside the seat. It decreases the pressure throughout a side-collision by delivering oxygen in impacts correct minute, defending physique and your youngsteris mind. It is not unpatented AirProtect method meets the absolute most strict of side-impact security assessments and offers outstanding help to get a childs mind and may decrease the threat of head-injury by up to 20 %. It lowers the push throughout...', '99', 'Maxi-Cosi-Airprotect-Group-2-3-Car-Seat-Modern-Black-175x175.jpeg', 1, '2018-03-31 19:45:59', '2018-03-31 19:45:59'),
(30, 21, 1, 2, 'Maxi Cosi Airprotect Group 2 3 Car Seat River Blue', 'The Maxi-Cosi Rodi AirProtect works for youngsters from 15 to 36 kg (around 3.5 to 12 years) and functions innovative side-impact security as a result of it is AirProtect method in-built inside the seat. It decreases the push throughout a side-collision by delivering atmosphere in impacts exact instant, defending physique and your youngsteris scalp. It really is complex AirProtect process provides outstanding assistance to get a childs brain and meets the absolute most tough of side-impact protection assessments and will decrease the threat of head-injury by up to 20 %. It lowers the drive within... ', '92', 'Maxi-Cosi-Airprotect-Group-2-3-Car-Seat-River-Blue-175x175.jpeg', 1, '2018-03-31 19:45:59', '2018-03-31 19:45:59'),
(31, 21, 1, 1, '\r\nMaxiCosi Axiss Group 1 Car Seat Concrete Grey', 'The Maxi-Cosi Axiss is suitable from 9-18kg and is installed using the three-point car seat belt. It rotates 90 degrees in the direction of the door opening and allows front-on access to easily lift your child in or out of the car seat and secure them within seconds. Once your little one is buckled up, you can rotate it forward facing. It features eight different reclining positions, ranging from an upright to sleep mode and each position is easily selected using the lever on the front of the seat. The seat has extra padding for your childs head, back and bottom, the headrest and harness...', '179', 'MaxiCosi-Axiss-Group-1-Car-Seat-Concrete-Grey-175x175.jpg', 1, '2018-03-31 19:45:59', '2018-03-31 19:45:59');

-- --------------------------------------------------------

--
-- Table structure for table `product_features`
--

CREATE TABLE `product_features` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `feature_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_features`
--

INSERT INTO `product_features` (`id`, `product_id`, `feature_id`, `status`, `created`, `updated`) VALUES
(1, 1, 1, 1, '2018-04-01 00:11:49', '2018-04-01 00:11:49'),
(2, 1, 2, 1, '2018-04-01 00:12:35', '2018-04-01 00:12:35'),
(3, 1, 3, 1, '2018-04-01 00:12:36', '2018-04-01 00:12:36'),
(4, 1, 4, 1, '2018-04-01 00:12:36', '2018-04-01 00:12:36'),
(5, 2, 5, 1, '2018-04-01 00:13:16', '2018-04-01 00:13:16'),
(6, 2, 3, 1, '2018-04-01 00:13:16', '2018-04-01 00:13:16'),
(7, 2, 1, 1, '2018-04-01 00:13:16', '2018-04-01 00:13:16'),
(8, 3, 4, 1, '2018-04-01 00:16:59', '2018-04-01 00:16:59'),
(9, 3, 5, 1, '2018-04-01 00:16:59', '2018-04-01 00:16:59'),
(10, 3, 2, 1, '2018-04-01 00:16:59', '2018-04-01 00:16:59'),
(11, 4, 3, 1, '2018-04-01 00:16:59', '2018-04-01 00:16:59'),
(12, 4, 2, 1, '2018-04-01 00:16:59', '2018-04-01 00:16:59'),
(13, 4, 1, 1, '2018-04-01 00:17:00', '2018-04-01 00:17:00'),
(14, 5, 2, 1, '2018-04-01 00:17:00', '2018-04-01 00:17:00'),
(15, 5, 3, 1, '2018-04-01 00:17:00', '2018-04-01 00:17:00'),
(16, 5, 4, 1, '2018-04-01 00:17:00', '2018-04-01 00:17:00'),
(17, 6, 4, 1, '2018-04-01 00:17:00', '2018-04-01 00:17:00'),
(18, 6, 2, 1, '2018-04-01 00:17:00', '2018-04-01 00:17:00'),
(19, 6, 1, 1, '2018-04-01 00:17:00', '2018-04-01 00:17:00'),
(20, 7, 3, 1, '2018-04-01 00:17:00', '2018-04-01 00:17:00'),
(21, 7, 2, 1, '2018-04-01 00:17:01', '2018-04-01 00:17:01'),
(22, 7, 1, 1, '2018-04-01 00:17:01', '2018-04-01 00:17:01'),
(23, 8, 5, 1, '2018-04-01 00:17:01', '2018-04-01 00:17:01'),
(24, 8, 1, 1, '2018-04-01 00:17:01', '2018-04-01 00:17:01'),
(25, 8, 2, 1, '2018-04-01 00:17:01', '2018-04-01 00:17:01'),
(26, 10, 4, 1, '2018-04-01 00:17:01', '2018-04-01 00:17:01'),
(27, 10, 3, 1, '2018-04-01 00:17:01', '2018-04-01 00:17:01'),
(28, 10, 1, 1, '2018-04-01 00:17:01', '2018-04-01 00:17:01'),
(29, 11, 5, 1, '2018-04-01 00:21:15', '2018-04-01 00:21:15'),
(30, 11, 3, 1, '2018-04-01 00:21:16', '2018-04-01 00:21:16'),
(31, 11, 2, 1, '2018-04-01 00:21:16', '2018-04-01 00:21:16'),
(32, 13, 4, 1, '2018-04-01 00:21:16', '2018-04-01 00:21:16'),
(33, 12, 2, 1, '2018-04-01 00:21:16', '2018-04-01 00:21:16'),
(34, 12, 1, 1, '2018-04-01 00:21:16', '2018-04-01 00:21:16'),
(35, 13, 5, 1, '2018-04-01 00:21:16', '2018-04-01 00:21:16'),
(36, 13, 4, 1, '2018-04-01 00:21:17', '2018-04-01 00:21:17'),
(37, 13, 1, 1, '2018-04-01 00:21:17', '2018-04-01 00:21:17'),
(38, 14, 1, 1, '2018-04-01 00:21:17', '2018-04-01 00:21:17'),
(39, 14, 3, 1, '2018-04-01 00:21:17', '2018-04-01 00:21:17'),
(40, 14, 5, 1, '2018-04-01 00:21:17', '2018-04-01 00:21:17'),
(41, 15, 5, 1, '2018-04-01 00:21:17', '2018-04-01 00:21:17'),
(42, 15, 3, 1, '2018-04-01 00:21:17', '2018-04-01 00:21:17'),
(43, 15, 1, 1, '2018-04-01 00:21:18', '2018-04-01 00:21:18'),
(44, 16, 3, 1, '2018-04-01 00:21:18', '2018-04-01 00:21:18'),
(45, 15, 1, 1, '2018-04-01 00:21:18', '2018-04-01 00:21:18'),
(46, 15, 4, 1, '2018-04-01 00:21:18', '2018-04-01 00:21:18'),
(47, 16, 4, 1, '2018-04-01 00:21:18', '2018-04-01 00:21:18'),
(49, 16, 1, 1, '2018-04-01 00:21:18', '2018-04-01 00:21:18'),
(50, 17, 2, 1, '2018-04-01 00:21:19', '2018-04-01 00:21:19'),
(51, 17, 3, 1, '2018-04-01 00:21:19', '2018-04-01 00:21:19'),
(52, 17, 1, 1, '2018-04-01 00:21:19', '2018-04-01 00:21:19'),
(53, 18, 4, 1, '2018-04-01 00:21:19', '2018-04-01 00:21:19'),
(54, 18, 2, 1, '2018-04-01 00:21:19', '2018-04-01 00:21:19'),
(55, 19, 1, 1, '2018-04-01 00:21:19', '2018-04-01 00:21:19'),
(56, 19, 4, 1, '2018-04-01 00:21:20', '2018-04-01 00:21:20'),
(57, 19, 5, 1, '2018-04-01 00:21:20', '2018-04-01 00:21:20'),
(58, 19, 1, 1, '2018-04-01 00:21:21', '2018-04-01 00:21:21'),
(62, 20, 5, 1, '2018-04-01 00:27:26', '2018-04-01 00:27:26'),
(63, 20, 1, 1, '2018-04-01 00:27:26', '2018-04-01 00:27:26'),
(64, 20, 2, 1, '2018-04-01 00:27:26', '2018-04-01 00:27:26'),
(65, 21, 1, 1, '2018-04-01 00:27:26', '2018-04-01 00:27:26'),
(66, 21, 3, 1, '2018-04-01 00:27:26', '2018-04-01 00:27:26'),
(67, 21, 4, 1, '2018-04-01 00:27:26', '2018-04-01 00:27:26'),
(68, 22, 1, 1, '2018-04-01 00:27:27', '2018-04-01 00:27:27'),
(69, 22, 2, 1, '2018-04-01 00:27:27', '2018-04-01 00:27:27'),
(70, 22, 3, 1, '2018-04-01 00:27:27', '2018-04-01 00:27:27'),
(71, 23, 3, 1, '2018-04-01 00:27:27', '2018-04-01 00:27:27'),
(72, 23, 5, 1, '2018-04-01 00:27:27', '2018-04-01 00:27:27'),
(73, 23, 1, 1, '2018-04-01 00:27:28', '2018-04-01 00:27:28'),
(74, 24, 4, 1, '2018-04-01 00:27:28', '2018-04-01 00:27:28'),
(75, 24, 2, 1, '2018-04-01 00:27:28', '2018-04-01 00:27:28'),
(76, 24, 3, 1, '2018-04-01 00:27:28', '2018-04-01 00:27:28'),
(77, 25, 1, 1, '2018-04-01 00:27:29', '2018-04-01 00:27:29'),
(78, 25, 2, 1, '2018-04-01 00:27:29', '2018-04-01 00:27:29'),
(79, 25, 3, 1, '2018-04-01 00:27:30', '2018-04-01 00:27:30'),
(80, 26, 1, 1, '2018-04-01 00:27:30', '2018-04-01 00:27:30'),
(81, 26, 4, 1, '2018-04-01 00:27:30', '2018-04-01 00:27:30'),
(82, 26, 5, 1, '2018-04-01 00:27:30', '2018-04-01 00:27:30'),
(83, 27, 5, 1, '2018-04-01 00:27:31', '2018-04-01 00:27:31'),
(84, 27, 2, 1, '2018-04-01 00:27:31', '2018-04-01 00:27:31'),
(85, 27, 3, 1, '2018-04-01 00:27:31', '2018-04-01 00:27:31'),
(86, 28, 1, 1, '2018-04-01 00:27:32', '2018-04-01 00:27:32'),
(87, 28, 2, 1, '2018-04-01 00:27:32', '2018-04-01 00:27:32'),
(88, 28, 4, 1, '2018-04-01 00:27:32', '2018-04-01 00:27:32'),
(89, 29, 1, 1, '2018-04-01 00:27:32', '2018-04-01 00:27:32'),
(90, 29, 2, 1, '2018-04-01 00:27:32', '2018-04-01 00:27:32'),
(91, 29, 3, 1, '2018-04-01 00:27:32', '2018-04-01 00:27:32'),
(92, 30, 1, 1, '2018-04-01 00:27:33', '2018-04-01 00:27:33'),
(93, 30, 2, 1, '2018-04-01 00:27:33', '2018-04-01 00:27:33'),
(94, 30, 3, 1, '2018-04-01 00:27:33', '2018-04-01 00:27:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `product_id`, `rate`, `status`, `created`, `updated`) VALUES
(1, 1, 3, 1, '2018-04-01 01:38:21', '2018-04-01 01:38:21'),
(2, 1, 4, 1, '2018-04-01 01:38:21', '2018-04-01 01:38:21'),
(3, 1, 1, 1, '2018-04-01 01:38:21', '2018-04-01 01:38:21'),
(4, 2, 2, 1, '2018-04-01 01:38:21', '2018-04-01 01:38:21'),
(5, 2, 4, 1, '2018-04-01 01:38:22', '2018-04-01 01:38:22'),
(6, 2, 4, 1, '2018-04-01 01:38:22', '2018-04-01 01:38:22'),
(7, 3, 4, 1, '2018-04-01 01:38:22', '2018-04-01 01:38:22'),
(8, 3, 2, 1, '2018-04-01 01:38:22', '2018-04-01 01:38:22'),
(9, 3, 4, 1, '2018-04-01 01:38:22', '2018-04-01 01:38:22'),
(10, 4, 4, 1, '2018-04-01 01:38:22', '2018-04-01 01:38:22'),
(11, 4, 4, 1, '2018-04-01 01:38:22', '2018-04-01 01:38:22'),
(12, 4, 3, 1, '2018-04-01 01:38:22', '2018-04-01 01:38:22'),
(13, 5, 3, 1, '2018-04-01 01:38:22', '2018-04-01 01:38:22'),
(14, 5, 2, 1, '2018-04-01 01:38:22', '2018-04-01 01:38:22'),
(15, 5, 4, 1, '2018-04-01 01:38:22', '2018-04-01 01:38:22'),
(16, 6, 3, 1, '2018-04-01 01:38:22', '2018-04-01 01:38:22'),
(17, 6, 2, 1, '2018-04-01 01:38:22', '2018-04-01 01:38:22'),
(18, 6, 4, 1, '2018-04-01 01:38:22', '2018-04-01 01:38:22'),
(19, 7, 3, 1, '2018-04-01 01:38:22', '2018-04-01 01:38:22'),
(20, 7, 2, 1, '2018-04-01 01:38:23', '2018-04-01 01:38:23'),
(21, 7, 2, 1, '2018-04-01 01:38:23', '2018-04-01 01:38:23'),
(22, 8, 2, 1, '2018-04-01 01:38:23', '2018-04-01 01:38:23'),
(23, 8, 4, 1, '2018-04-01 01:38:23', '2018-04-01 01:38:23'),
(24, 8, 5, 1, '2018-04-01 01:38:23', '2018-04-01 01:38:23'),
(25, 9, 3, 1, '2018-04-01 01:38:23', '2018-04-01 01:38:23'),
(26, 9, 3, 1, '2018-04-01 01:38:23', '2018-04-01 01:38:23'),
(27, 9, 3, 1, '2018-04-01 01:38:23', '2018-04-01 01:38:23'),
(28, 10, 3, 1, '2018-04-01 01:38:23', '2018-04-01 01:38:23'),
(29, 10, 5, 1, '2018-04-01 01:38:23', '2018-04-01 01:38:23'),
(30, 10, 4, 1, '2018-04-01 01:38:23', '2018-04-01 01:38:23'),
(31, 11, 5, 1, '2018-04-01 01:38:23', '2018-04-01 01:38:23'),
(32, 11, 5, 1, '2018-04-01 01:38:24', '2018-04-01 01:38:24'),
(33, 11, 4, 1, '2018-04-01 01:38:24', '2018-04-01 01:38:24'),
(34, 12, 1, 1, '2018-04-01 01:38:24', '2018-04-01 01:38:24'),
(35, 12, 1, 1, '2018-04-01 01:38:24', '2018-04-01 01:38:24'),
(36, 12, 5, 1, '2018-04-01 01:38:24', '2018-04-01 01:38:24'),
(37, 13, 2, 1, '2018-04-01 01:38:24', '2018-04-01 01:38:24'),
(38, 13, 4, 1, '2018-04-01 01:38:24', '2018-04-01 01:38:24'),
(39, 13, 2, 1, '2018-04-01 01:38:24', '2018-04-01 01:38:24'),
(40, 14, 2, 1, '2018-04-01 01:38:24', '2018-04-01 01:38:24'),
(41, 14, 2, 1, '2018-04-01 01:38:24', '2018-04-01 01:38:24'),
(42, 14, 4, 1, '2018-04-01 01:38:24', '2018-04-01 01:38:24'),
(43, 15, 1, 1, '2018-04-01 01:38:24', '2018-04-01 01:38:24'),
(44, 15, 3, 1, '2018-04-01 01:38:24', '2018-04-01 01:38:24'),
(45, 15, 3, 1, '2018-04-01 01:38:24', '2018-04-01 01:38:24'),
(46, 16, 3, 1, '2018-04-01 01:38:24', '2018-04-01 01:38:24'),
(47, 16, 2, 1, '2018-04-01 01:38:24', '2018-04-01 01:38:24'),
(48, 16, 5, 1, '2018-04-01 01:38:25', '2018-04-01 01:38:25'),
(49, 17, 2, 1, '2018-04-01 01:38:25', '2018-04-01 01:38:25'),
(50, 17, 3, 1, '2018-04-01 01:38:25', '2018-04-01 01:38:25'),
(51, 17, 4, 1, '2018-04-01 01:38:25', '2018-04-01 01:38:25'),
(52, 18, 5, 1, '2018-04-01 01:38:25', '2018-04-01 01:38:25'),
(53, 18, 3, 1, '2018-04-01 01:38:25', '2018-04-01 01:38:25'),
(54, 18, 3, 1, '2018-04-01 01:38:25', '2018-04-01 01:38:25'),
(55, 19, 5, 1, '2018-04-01 01:38:25', '2018-04-01 01:38:25'),
(56, 19, 5, 1, '2018-04-01 01:38:25', '2018-04-01 01:38:25'),
(57, 19, 4, 1, '2018-04-01 01:38:25', '2018-04-01 01:38:25'),
(58, 20, 4, 1, '2018-04-01 01:38:25', '2018-04-01 01:38:25'),
(59, 20, 3, 1, '2018-04-01 01:38:25', '2018-04-01 01:38:25'),
(60, 20, 5, 1, '2018-04-01 01:38:25', '2018-04-01 01:38:25'),
(61, 21, 3, 1, '2018-04-01 01:38:25', '2018-04-01 01:38:25'),
(62, 21, 1, 1, '2018-04-01 01:38:25', '2018-04-01 01:38:25'),
(63, 21, 5, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(64, 22, 5, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(65, 22, 3, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(66, 22, 2, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(67, 23, 5, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(68, 23, 1, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(69, 23, 5, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(70, 24, 2, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(71, 24, 4, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(72, 24, 4, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(73, 25, 3, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(74, 25, 3, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(75, 25, 4, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(76, 26, 2, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(77, 26, 3, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(78, 26, 2, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(79, 27, 1, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(80, 27, 1, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(81, 27, 1, 1, '2018-04-01 01:38:26', '2018-04-01 01:38:26'),
(82, 28, 5, 1, '2018-04-01 01:38:27', '2018-04-01 01:38:27'),
(83, 28, 4, 1, '2018-04-01 01:38:27', '2018-04-01 01:38:27'),
(84, 28, 1, 1, '2018-04-01 01:38:27', '2018-04-01 01:38:27'),
(85, 29, 3, 1, '2018-04-01 01:38:27', '2018-04-01 01:38:27'),
(86, 29, 3, 1, '2018-04-01 01:38:27', '2018-04-01 01:38:27'),
(87, 29, 1, 1, '2018-04-01 01:38:27', '2018-04-01 01:38:27'),
(88, 30, 4, 1, '2018-04-01 01:38:27', '2018-04-01 01:38:27'),
(89, 30, 5, 1, '2018-04-01 01:38:27', '2018-04-01 01:38:27'),
(90, 30, 1, 1, '2018-04-01 01:38:27', '2018-04-01 01:38:27'),
(91, 1, 5, 1, '2018-04-01 03:36:12', '2018-04-01 03:36:12'),
(92, 1, 5, 1, '2018-04-01 03:37:31', '2018-04-01 03:37:31'),
(93, 1, 5, 1, '2018-04-01 03:37:31', '2018-04-01 03:37:31'),
(94, 1, 5, 1, '2018-04-01 03:37:31', '2018-04-01 03:37:31'),
(95, 1, 5, 1, '2018-04-01 03:37:31', '2018-04-01 03:37:31'),
(96, 1, 5, 1, '2018-04-01 03:37:31', '2018-04-01 03:37:31'),
(97, 1, 5, 1, '2018-04-01 03:37:31', '2018-04-01 03:37:31'),
(98, 8, 5, 1, '2018-04-01 03:37:31', '2018-04-01 03:37:31'),
(99, 8, 5, 1, '2018-04-01 03:37:32', '2018-04-01 03:37:32'),
(100, 8, 5, 1, '2018-04-01 03:37:32', '2018-04-01 03:37:32'),
(101, 12, 5, 1, '2018-04-01 03:37:32', '2018-04-01 03:37:32'),
(102, 12, 5, 1, '2018-04-01 03:37:32', '2018-04-01 03:37:32'),
(103, 12, 5, 1, '2018-04-01 03:37:32', '2018-04-01 03:37:32'),
(104, 12, 5, 1, '2018-04-01 03:37:32', '2018-04-01 03:37:32'),
(105, 14, 5, 1, '2018-04-01 03:37:32', '2018-04-01 03:37:32'),
(106, 14, 5, 1, '2018-04-01 03:37:33', '2018-04-01 03:37:33'),
(107, 14, 5, 1, '2018-04-01 03:37:33', '2018-04-01 03:37:33'),
(108, 1, 5, 1, '2018-04-01 03:38:35', '2018-04-01 03:38:35'),
(109, 1, 5, 1, '2018-04-01 03:38:35', '2018-04-01 03:38:35'),
(110, 1, 5, 1, '2018-04-01 03:38:35', '2018-04-01 03:38:35'),
(111, 1, 5, 1, '2018-04-01 03:38:35', '2018-04-01 03:38:35'),
(112, 1, 5, 1, '2018-04-01 03:38:36', '2018-04-01 03:38:36'),
(113, 1, 5, 1, '2018-04-01 03:38:36', '2018-04-01 03:38:36'),
(114, 1, 5, 1, '2018-04-01 03:38:36', '2018-04-01 03:38:36'),
(115, 1, 5, 1, '2018-04-01 03:38:36', '2018-04-01 03:38:36'),
(116, 1, 5, 1, '2018-04-01 03:38:36', '2018-04-01 03:38:36'),
(117, 1, 5, 1, '2018-04-01 03:38:36', '2018-04-01 03:38:36'),
(118, 1, 5, 1, '2018-04-01 03:38:36', '2018-04-01 03:38:36'),
(119, 1, 5, 1, '2018-04-01 03:38:36', '2018-04-01 03:38:36'),
(120, 1, 5, 1, '2018-04-01 03:38:36', '2018-04-01 03:38:36'),
(121, 1, 5, 1, '2018-04-01 03:38:36', '2018-04-01 03:38:36'),
(122, 1, 5, 1, '2018-04-01 03:38:37', '2018-04-01 03:38:37'),
(123, 1, 5, 1, '2018-04-01 03:38:37', '2018-04-01 03:38:37'),
(124, 1, 5, 1, '2018-04-01 03:38:37', '2018-04-01 03:38:37'),
(125, 1, 5, 1, '2018-04-01 03:38:37', '2018-04-01 03:38:37'),
(126, 1, 5, 1, '2018-04-01 03:38:37', '2018-04-01 03:38:37'),
(127, 1, 5, 1, '2018-04-01 03:38:37', '2018-04-01 03:38:37'),
(128, 1, 5, 1, '2018-04-01 03:38:37', '2018-04-01 03:38:37'),
(129, 1, 5, 1, '2018-04-01 03:38:37', '2018-04-01 03:38:37'),
(130, 1, 5, 1, '2018-04-01 03:38:37', '2018-04-01 03:38:37'),
(131, 1, 5, 1, '2018-04-01 03:38:37', '2018-04-01 03:38:37'),
(132, 1, 5, 1, '2018-04-01 03:38:37', '2018-04-01 03:38:37'),
(133, 1, 5, 1, '2018-04-01 03:38:38', '2018-04-01 03:38:38'),
(134, 1, 5, 1, '2018-04-01 03:38:38', '2018-04-01 03:38:38'),
(135, 1, 5, 1, '2018-04-01 03:38:38', '2018-04-01 03:38:38'),
(136, 1, 5, 1, '2018-04-01 03:38:38', '2018-04-01 03:38:38'),
(137, 1, 5, 1, '2018-04-01 03:38:38', '2018-04-01 03:38:38'),
(138, 1, 5, 1, '2018-04-01 03:38:38', '2018-04-01 03:38:38'),
(139, 1, 5, 1, '2018-04-01 03:38:38', '2018-04-01 03:38:38'),
(140, 1, 5, 1, '2018-04-01 03:38:38', '2018-04-01 03:38:38'),
(141, 1, 5, 1, '2018-04-01 03:38:38', '2018-04-01 03:38:38'),
(142, 12, 5, 1, '2018-04-01 03:39:08', '2018-04-01 03:39:08'),
(143, 12, 5, 1, '2018-04-01 03:39:08', '2018-04-01 03:39:08'),
(144, 12, 5, 1, '2018-04-01 03:39:08', '2018-04-01 03:39:08'),
(145, 12, 5, 1, '2018-04-01 03:39:08', '2018-04-01 03:39:08'),
(146, 12, 5, 1, '2018-04-01 03:39:08', '2018-04-01 03:39:08'),
(147, 12, 5, 1, '2018-04-01 03:39:08', '2018-04-01 03:39:08'),
(148, 12, 5, 1, '2018-04-01 03:39:08', '2018-04-01 03:39:08'),
(149, 12, 5, 1, '2018-04-01 03:39:08', '2018-04-01 03:39:08'),
(150, 12, 5, 1, '2018-04-01 03:39:08', '2018-04-01 03:39:08'),
(151, 12, 5, 1, '2018-04-01 03:39:08', '2018-04-01 03:39:08'),
(152, 12, 5, 1, '2018-04-01 03:39:08', '2018-04-01 03:39:08'),
(153, 12, 5, 1, '2018-04-01 03:39:08', '2018-04-01 03:39:08'),
(154, 12, 5, 1, '2018-04-01 03:39:09', '2018-04-01 03:39:09'),
(155, 12, 5, 1, '2018-04-01 03:39:09', '2018-04-01 03:39:09'),
(156, 12, 5, 1, '2018-04-01 03:39:09', '2018-04-01 03:39:09'),
(157, 12, 5, 1, '2018-04-01 03:39:09', '2018-04-01 03:39:09'),
(158, 12, 5, 1, '2018-04-01 03:39:09', '2018-04-01 03:39:09'),
(159, 12, 5, 1, '2018-04-01 03:39:09', '2018-04-01 03:39:09'),
(160, 12, 5, 1, '2018-04-01 03:39:09', '2018-04-01 03:39:09'),
(161, 12, 5, 1, '2018-04-01 03:39:09', '2018-04-01 03:39:09'),
(162, 12, 5, 1, '2018-04-01 03:39:09', '2018-04-01 03:39:09'),
(163, 12, 5, 1, '2018-04-01 03:39:10', '2018-04-01 03:39:10'),
(164, 12, 5, 1, '2018-04-01 03:39:10', '2018-04-01 03:39:10'),
(165, 12, 5, 1, '2018-04-01 03:39:10', '2018-04-01 03:39:10'),
(166, 12, 5, 1, '2018-04-01 03:39:10', '2018-04-01 03:39:10'),
(167, 12, 5, 1, '2018-04-01 03:39:10', '2018-04-01 03:39:10'),
(168, 12, 5, 1, '2018-04-01 03:39:10', '2018-04-01 03:39:10'),
(169, 12, 5, 1, '2018-04-01 03:39:10', '2018-04-01 03:39:10'),
(170, 12, 5, 1, '2018-04-01 03:39:10', '2018-04-01 03:39:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_features`
--
ALTER TABLE `product_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `merchants`
--
ALTER TABLE `merchants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `product_features`
--
ALTER TABLE `product_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
