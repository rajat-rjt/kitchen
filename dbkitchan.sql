-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2019 at 03:59 AM
-- Server version: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbkitchan`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delcat` (IN `ccod` INT)  NO SQL
DELETE FROM tbcat WHERE catcod=ccod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delord` (IN `ocod` INT)  NO SQL
DELETE FROM tbord where ordcod=ocod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delorddet` (IN `odetcod` INT)  NO SQL
DELETE FROM tborddet WHERE orddetcod=odetcod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delprd` (IN `pcod` INT)  NO SQL
DELETE FROM tbprd WHERE prdcod=pcod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delusr` (IN `ucod` INT)  NO SQL
DELETE FROM tbusr where usrcod=ucod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspcat` ()  NO SQL
SELECT * FROM tbcat$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspord` ()  NO SQL
SELECT * FROM tbord$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dsporddet` ()  NO SQL
SELECT * FROM tborddet$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspprd` (IN `ccod` INT)  NO SQL
SELECT * FROM tbprd where prdcatcod=ccod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspusr` ()  NO SQL
SELECT * FROM tbusr$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `fndcat` (IN `ccod` INT)  NO SQL
SELECT * from tbcat where catcod=ccod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `fndord` (IN `ocod` INT)  NO SQL
SELECT * FROM tbord WHERE ordcod=ocod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `fndorddet` (IN `odetcod` INT)  NO SQL
SELECT * FROM tborddet WHERE orddetcod=odetcod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `fndprd` (IN `pcod` INT)  NO SQL
SELECT * FROM tbprd WHERE prdcod=pcod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `fndusr` (IN `ucod` INT)  NO SQL
SELECT * FROM tbusr WHERE usrcod=ucod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inscat` (IN `cnam` VARCHAR(100))  NO SQL
INSERT tbcat VALUES(null,cnam)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insord` (IN `odat` DATETIME, IN `ousrcod` INT, IN `odeladd` VARCHAR(500), IN `odelphn` VARCHAR(100), OUT `cod` INT)  NO SQL
begin
INSERT tbord VALUES(null,odat,ousrcod,odeladd,odelphn);
select last_insert_id() into cod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insorddet` (IN `odetordcod` INT, IN `odetprdcod` INT, IN `odetprdqty` INT)  NO SQL
INSERT tborddet VALUES(null,odetordcod,odetprdcod,odetprdqty)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insprd` (IN `pnam` VARCHAR(200), IN `pdsc` VARCHAR(2000), IN `ppic` VARCHAR(50), IN `pprc` FLOAT, IN `poff` VARCHAR(500), IN `pcatcod` INT, IN `pisavl` CHAR(1))  NO SQL
INSERT tbprd VALUES(null,pnam,pdsc,ppic,pprc,poff,pcatcod,pisavl)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insusr` (IN `ueml` VARCHAR(100), IN `upwd` VARCHAR(100), IN `uregdat` DATETIME, IN `urol` CHAR(1))  NO SQL
INSERT tbusr VALUES(null,ueml,upwd,uregdat,urol)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insusr1` (IN `eml` VARCHAR(100), IN `pwd` VARCHAR(100), IN `dat` DATETIME, IN `rol` CHAR(1), OUT `cod` INT)  NO SQL
BEGIN
INSERT tbusr VALUES(null,eml,pwd,dat,rol);
SELECT last_insert_id() INTO cod;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `logincheck` (IN `eml` VARCHAR(100), IN `pwd` VARCHAR(100), OUT `cod` INT, OUT `rol` CHAR(1))  NO SQL
BEGIN
declare actpwd varchar(50);
select usrpwd from tbusr where usreml=eml into @actpwd;
if @actpwd is null THEN
   set cod=-1;
   set rol='N';
else
if pwd=@actpwd then
select usrrol from tbusr where usreml=eml into rol;
select usrcod from tbusr where usreml=eml into cod;
else
	set cod=-2;
    set rol='N';
end if;
end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updcat` (IN `ccod` INT, IN `cnam` VARCHAR(100))  NO SQL
UPDATE tbcat set catnam=cnam where catcod=ccod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updord` (IN `ocod` INT, IN `odat` DATETIME, IN `ousrcod` INT, IN `odeladd` VARCHAR(500), IN `odelphn` VARCHAR(100))  NO SQL
UPDATE tbord SET orddat=odat,ordusrcod=ousrcod,orddeladd=odeladd,orddelphn=odelphn where ordcod=ocod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updorddet` (IN `odetcod` INT, IN `odetordcod` INT, IN `odetprdcod` INT, IN `odetprdqty` INT)  NO SQL
UPDATE tborddet SET orddetordcod=odetordcod,orddetprdcod=odetprdcod,orddetprdqty=odetprdqty WHERE orddetcod=odetcod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updprd` (IN `pcod` INT, IN `pnam` VARCHAR(200), IN `pdsc` VARCHAR(2000), IN `ppic` VARCHAR(50), IN `pprc` FLOAT, IN `poff` VARCHAR(500), IN `pcatcod` INT, IN `pisavl` CHAR(1))  NO SQL
UPDATE tbprd set prdnam=pnam,prddsc=pdsc,prdpic=ppic,prdprc=pprc,prdoff=poff,prdcatcod=pcatcod,prdisavl=pisavl where prdcod=pcod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updusr` (IN `ucod` INT, IN `ueml` VARCHAR(100), IN `upwd` VARCHAR(100), IN `uregdat` DATETIME, IN `urol` CHAR(1))  NO SQL
UPDATE tbusr SET usreml=ueml,usrpwd=upwd,usrregdat=uregdat,usrrol=urol WHERE usrcod=ucod$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbcat`
--

CREATE TABLE `tbcat` (
  `catcod` int(11) NOT NULL,
  `catnam` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbcat`
--

INSERT INTO `tbcat` (`catcod`, `catnam`) VALUES
(5, 'Cookers'),
(6, 'Pan'),
(8, 'Tawa'),
(9, 'Bottles'),
(12, 'Induction'),
(13, 'Microwaves & Toaster'),
(14, 'Home utilities'),
(15, 'Mixer Grinder'),
(17, 'Gas stove'),
(18, 'Chimney'),
(19, 'electric kettle & Press'),
(20, 'Lunchbox & Hotcase'),
(21, 'Emergency lamps'),
(22, 'kitchen utilities');

-- --------------------------------------------------------

--
-- Table structure for table `tbord`
--

CREATE TABLE `tbord` (
  `ordcod` int(11) NOT NULL,
  `orddat` datetime NOT NULL,
  `ordusrcod` int(11) NOT NULL,
  `orddeladd` varchar(500) NOT NULL,
  `orddelphn` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbord`
--

INSERT INTO `tbord` (`ordcod`, `orddat`, `ordusrcod`, `orddeladd`, `orddelphn`) VALUES
(5, '2019-02-09 00:00:00', 1, 'safsadf', '2344');

-- --------------------------------------------------------

--
-- Table structure for table `tborddet`
--

CREATE TABLE `tborddet` (
  `orddetcod` int(11) NOT NULL,
  `orddetordcod` int(11) NOT NULL,
  `orddetprdcod` int(11) NOT NULL,
  `orddetprdqty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tborddet`
--

INSERT INTO `tborddet` (`orddetcod`, `orddetordcod`, `orddetprdcod`, `orddetprdqty`) VALUES
(1, 5, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbprd`
--

CREATE TABLE `tbprd` (
  `prdcod` int(11) NOT NULL,
  `prdnam` varchar(200) NOT NULL,
  `prddsc` varchar(2000) NOT NULL,
  `prdpic` varchar(50) NOT NULL,
  `prdprc` float NOT NULL,
  `prdoff` varchar(500) NOT NULL,
  `prdcatcod` int(11) NOT NULL,
  `prdisavl` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbprd`
--

INSERT INTO `tbprd` (`prdcod`, `prdnam`, `prddsc`, `prdpic`, `prdprc`, `prdoff`, `prdcatcod`, `prdisavl`) VALUES
(5, 'Chroma Pressure Cooker', 'High grade virgin aluminium for higher durability,metallic safety plug, induction base,ergonomic handle for better grip lid made up of high grade stainless steel.', '12364-yl-pigeon-original-imaey4u747uhyws4.jpeg', 1445, '', 5, 'T'),
(6, 'Amelia pressure cooker', 'High grade virgin aluminium for higher durability,metallic safety plug, induction base,ergonomic handle for better grip lid made up of high grade stainless steel.', '12373.jpg', 2195, '', 5, 'T'),
(7, 'Aluminium  Pressure Cooker', 'High grade virgin aluminium for higher durability,metallic safety plug, induction base,ergonomic handle for better grip lid made up of high grade stainless steel + 5 years warranty.', 'th1U42XUHO.jpg', 975, '', 5, 'T'),
(8, 'Aluminium  Pressure Cooker', ' 7.5 litre cooker,High grade virgin aluminium for higher durability,metallic safety plug, induction base,ergonomic handle for better grip lid made up of high grade stainless steel.', '106-pigeon-original-imaey4u8twczgdwt.jpeg', 2245, '', 5, 'T'),
(9, 'pigeon classic cooker', 'Aluminium pressure cooker 3 litre with flat tawa.', '2-IN-1-JUNIOR-PACK_0.jpg', 1895, '', 5, ''),
(10, 'Titanium hard anodized cookware', '5 litre cooker ,non food reactive with hard anodised + 5 years warranty. ', '71W7B2zTXvL._SX425_.jpg', 1645, '', 5, 'T'),
(11, 'Titanium hard anodized cookware', '3.5 litre cooker, extra wide space,non reactive,non corrosive + 5 years warranty.', 'PI508.jpg', 2295, '', 5, 'T'),
(12, 'Pigeon inox pressure cooker', '2.5 litre cooker,strong and sturdy body,engonomic handle for better grip, lead freee safety valve.', '71ZYCfhu8HL._SX466_.jpg', 1595, '', 5, 'T'),
(13, 'Pigeon cookware', 'Metal spoon friendly tadka pan with extra thick base to avoid wrapping,spiral bottom for even heating', '51MFjyvA1FL._AC_SS350_.jpg', 295, '', 6, 'T'),
(14, 'Milk pot', '', '61or38wxCrL._SX466_.jpg', 795, '', 6, 'T'),
(15, 'Fry pan', 'Induction base fry pan.', '164-pigeon-original-imaekgn6usrf7jb2.jpeg', 895, '', 6, 'T'),
(16, 'Sauce pan', 'Sauce pan of 3 litre with glass lid ,induction base.', '71tCSVnF7FL._SX425_.jpg', 1355, '', 6, 'T'),
(18, 'Ruby gift set', 'Flat tawa 280 special.\r\nkadai 200 special.\r\nfry pan 175\r\n', '61eRoIk4A1L._SX425_.jpg', 2495, '', 6, 'T'),
(19, 'Sphere Handi', '5 litre sphere handi with glass lid.', '710BPa7NL5L._SX466_.jpg', 1995, '', 6, 'T'),
(20, 'Navratna gift set', 'Navratna gift set with kadai 200 special with stainless steel lid.\r\nfry pan 240 special,.\r\ncasserole,tadka pan.\r\nFlat tawa.\r\nDeluxe Fry pan.', 'SDL736659808_3-de305.jpg', 5995, '', 6, 'T'),
(21, 'Pigeon Flat Tawa', ' Gorgeous Red colour flat Tawa with glass lid.', '4vvjhizlnfkqFLAT-TAWA-IB-280.jpg', 795, '', 8, 'T'),
(22, 'Deluxe fry pan', 'Black colour deluxe fry pan with stainless lid.', '1455605599611.jpg', 1125, '', 8, 'T'),
(23, 'Flat Tawa', 'Gorgeous flat tawa in black colour with glass lid.', '1455606077864.jpg', 999, '', 8, 'T'),
(24, 'Flat Tawa', '', '1455607166240.jpg', 989, '', 8, 'T'),
(25, 'Pathri Tawa', 'Black colour flat pathri tawa.', '510JIpfbXcL._SX466_.jpg', 1675, '', 8, 'T'),
(26, 'Mio 8 piece gift set', 'Kadai 240 with Glass lid.\r\nFry pan 240.\r\nFlat tawa 280.\r\n4 Piece kitchen tool set.', '1456120369915.jpg', 2695, '', 8, 'T'),
(27, 'Pearl-3 piece gift set', 'Flat tawa 280 special.\r\nFry pan 175.\r\nTadka pan.', 'sdl194402355_1_-729b7.jpg', 1895, '', 8, 'T'),
(28, 'Ruby-4 piece gift set', 'Flat tawa 280 special.\r\nKadai 200 special.\r\nFry pan 175.', '1455614992746.jpg', 2495, '', 8, 'T'),
(29, 'Favourite-duo pack', 'Flat tawa 250.\r\nFry pan 240.', 'duo-pack-pigeon-original-imaf929czz7gns5g.jpeg', 1899, '', 6, 'T'),
(30, 'Cello bottle', 'cello sleek force bottle.', 'force.jpg', 700, '', 9, 'T'),
(31, 'Cello cup style bottle', 'Carry hot or cold during winter,mansoon or summer,cello cup style stainless steel flask is an apt choice for all season.\r\nThis is a cool silver color and fabricated inside and outside in 18/8 quality stainless steel.\r\nkeeps drink hot and cold for long hours.', 'cup.jpg', 999, '', 9, 'T'),
(32, 'cello  holly bottle', 'This is a cool woody color and fabricated inside and outside in 18/8 quality stainless steel.\r\nkeeps drink hot and cold ffor 24 hours.\r\nThis is made up of thermo seal', 'holly.jpg', 500, '', 9, 'T'),
(33, 'Cello bottle', 'Extra protection.\r\nEasy flow flip open lid.\r\nRemovable clip on mouth for easy cleaning.\r\nKeeps drink hot or cold for 24 hours.\r\nThis is made up of thermo seal.\r\n100% insulated vacu steel and inside copper coating for better heat retention .', 'steel.jpg', 1000, '', 9, 'T'),
(34, 'cello swift', 'This is a cool silver color and fabricated inside and high quality stainless steel.\r\nkeeps drink hot and cold for long hours.\r\nMade up of thermo seal.', 'swift.jpg', 1800, '', 9, 'T'),
(35, 'Sobo bottle', 'This is a black color cello sobo and fabricated inside and high quality stainless steel.\r\nkeeps drink hot and cold for long hours.', 'sobo.jpg', 600, '', 9, 'T'),
(36, 'cello vigo bottle', 'This is a cool silver color and fabricated inside and outside in 18/8 quality stainless steel.\r\nkeeps drink hot and cold for long hours.', 'vigo.jpg', 750, '', 9, 'T'),
(37, 'cello joy-sip', 'Carry hot or cold during winter,mansoon or summer,cello cup style stainless steel flask is an apt choice for all season.\r\nThis is a cool  brown color and fabricated inside and outside in 18/8 quality stainless steel.\r\nkeeps drink hot and cold for long hours.', 'joy1.jpg', 500, '', 9, 'T'),
(38, 'cello Joy -sip', 'Carry hot or cold during winter,mansoon or summer,cello cup style stainless steel flask is an apt choice for all season.\r\nThis is a black color and fabricated inside and outside in 18/8 quality stainless steel.\r\nkeeps drink hot and cold for long hours.', 'joy2.jpg', 500, '', 9, 'T'),
(39, 'cello joy-sip', 'Carry hot or cold during winter,mansoon or summer,cello cup style stainless steel flask is an apt choice for all season.\r\nThis is a red color and fabricated inside and outside in 18/8 quality stainless steel.\r\nkeeps drink hot and cold for long hours.\r\nMade up of thermo seal.', 'joy3.jpg', 500, '', 9, 'T'),
(40, 'Induction cooktops', 'Feather touch.\r\n8 Preset menus.\r\nChild lock.\r\nPreset start timer.\r\nOne year warranty.\r\n2100 watts power.\r\n', '71Phb3YkseL._SX355_.jpg', 4202, '', 12, 'T'),
(41, 'Sleek induction cooktops', 'Feather touch.\r\n8 Preset menus.\r\nChild lock.\r\nPreset start timer.\r\nOne year warranty.\r\n2100 watts power.', 'pigeon-sleek-sleek-original-imaevzzhgyqs4tgj.jpeg', 4019, '', 12, 'T'),
(42, 'Pigeon verve induction', 'Soft push button.\r\n7 Preset menus.\r\nPause function.\r\nChild lock.\r\nPreset start timer.\r\nOne year warranty.\r\n2100 watts power.', 'pigeon-verve-verve-original-imaf9uzepandwgut.jpeg', 3745, '', 12, 'T'),
(43, 'Pigeon rapido jumbo induction', 'Feather touch.\r\n8 Preset menus.\r\nChild lock.\r\nPreset start timer.\r\nOne year warranty.\r\n2100 watts power.\r\nExtra large bottom for bigger utensils.', 'SDL663067758_1_-fbb04.jpg', 4476, '', 12, 'T'),
(44, 'Oven toaster ', 'Oven toaster with rotisserie 20 litre.\r\nElegant design and high quality knobs.\r\n4 Stages of heating.\r\nGlass door for comfortable viewing.\r\n4 pcs upper and lower stainless steel heating elements.\r\nAdjustable thermostat.\r\n60 minute timer with auto turn off and alarm bell.', '12383-pigeon-20-original-imaey5kb6rdkuvmg(1).jpeg', 4995, '', 13, 'T'),
(45, 'Oven toaster ', 'Oven toaster with rotisserie 20 litre.\r\nElegant design and high quality knobs.\r\n4 Stages of heating.\r\nGlass door for comfortable viewing.\r\nAdjustable thermostat.\r\n60 minute timer with auto turn off and alarm bell.', '1543058687593.jpg', 6795, '', 13, 'T'),
(46, 'Sandwich maker', 'Sandwich maker with grill plate.\r\nPower on/off indicators.\r\nOne year warranty.\r\nNon sliding rubber fit.\r\n750 watts power.', 'PIGEON_GRILL_TOASTER-e01a7.jpg', 1449, '', 13, 'T'),
(47, 'Roti maker', 'Roti maker with durable stainless steel body.\r\nCord wrap for storage.\r\nPower and ready light indicator.\r\n8"non stick coating plates for easy cleaning.', 'prm-1-0-prestige-original-imaegftd2g3yscfp.jpeg', 2699, '', 13, 'T'),
(48, 'Sandwich griller', 'Sandwich griller with stainless steel covering.\r\nPower on/off indicators.\r\nAnti lock clip.\r\nNon stick plates.\r\nOne year warranty.\r\n750 watts power.', '61lHohuO0hL._SX425_.jpg', 2399, '', 13, 'T'),
(49, 'Mixer grinder', 'Blue and white super storm advanced with 750 watt power.\r\n100% Copper.\r\n5 years warranty.\r\n3 dry and wet jars.\r\n100% copper motor.\r\nUnbreakable poly-carbonate lids.\r\nHigh grade stainless steel.\r\nAutomatic overload cutoff.\r\nForced air circulation termonology.', '31-Qh6pSnoL._SY355_.jpg', 4659, '', 15, 'T'),
(50, 'Violalx mixer grinder', 'Blue colour mixer grinder  with 550 watt power.\r\n5 years warranty on motor.\r\n3 grinding and mixingjars.\r\nUnbreakable poly-carbonate lids.\r\nHigh grade stainless steel and polished blade.\r\nAutomatic overload cutoff.\r\nForced air circulation termonology.', 'PI791.jpg', 3105, '', 15, 'T'),
(51, 'Violet mixer grinder', 'Blue and white super storm advanced with 750 watt power.\r\n100% Copper.\r\n5 years warranty.\r\n3 dry and wet jars.\r\n100% copper motor.\r\nUnbreakable poly-carbonate lids.\r\nHigh grade stainless steel.\r\nAutomatic overload cutoff.', '51McI-41D+L._SX425_.jpg', 3105, '', 15, 'T'),
(52, 'Especial mixer grinder', 'white  colour mixer with 750 watt power.\r\n5 years warranty on motors.\r\nGrinding and mixing  jars.\r\n100% copper motor.\r\nUnbreakable poly-carbonate lids.\r\nHigh grade stainless steel.\r\nAutomatic overload cutoff.\r\nStable and sturdy operation.', '538234-13-1.jpg', 4659, '', 15, 'T'),
(53, 'Egnite mixer grinder', 'Black and orange colour mixer grinder with 750 watt power.\r\n100% Copper.\r\n5 years warranty.\r\ngrinding and mixer jars.\r\n100% copper motor.\r\nErgonomic handle for better gap.\r\nUnbreakable poly-carbonate lids.\r\nHigh grade stainless steel.\r\nAutomatic overload cut-off.', 'Pigeon Egnite 750 W Mixer Grinder.jpeg', 4019, '', 15, 'T'),
(54, 'Ornate hob 3 burner', 'Tripple ring burner.\r\n8mm Thick toughened glass.\r\nSmoothly operating knobs.\r\nAnti- corrosion stainless steel dip tray.\r\n1 year warranty.', '41wvWmPNphL._AC_SS350_.jpg', 15990, '', 17, 'T'),
(55, 'Stainless steel gas stove', 'Brass burner for even blue flame distribution.\r\nUnique pan support for better balance.\r\nUnbreakable ABS knob.\r\n2 years warranty.\r\nStrong tubular rubber legs for firm grip.\r\nSturdy stainless steel body.', '51deAhSOuSL._AC_SS350_.jpg', 1795, '', 17, 'T'),
(56, 'Infinity glass cooktops', 'DOUBLE ring burner.\r\nEasy to use knobs.\r\nRemovable spill tray.\r\nSkid proof stand.\r\n8mm Thick toughened glass to sustain high temprature.\r\nSmoothly operating knobs.\r\nBrass burner for even blue flame distribution.\r\n7 year warranty.', '51VjVjQnzuL._SX425_.jpg', 5595, '', 17, 'T'),
(57, 'Induction 4 burner', 'Four ring burner.\r\nEasy to use knobs.\r\nRemovable spill tray.\r\nSkid proof stand.\r\n8mm Thick toughened glass to sustain high temprature.\r\nSmoothly operating knobs.\r\nBrass burner for even blue flame distribution.\r\n7 year warranty.', '71NuvBVI0AL._SX355_.jpg', 8795, '', 17, 'T'),
(58, 'Infinity 3 burner', 'Triple ring burner.\r\nEasy to use knobs.\r\nRemovable spill tray.\r\nSkid proof stand.\r\n8mm Thick toughened glass to sustain high temprature.\r\nSmoothly operating knobs.\r\nBrass burner for even blue flame distribution.\r\n7 year warranty.', '517tNeDAJRL._SX355_.jpg', 6895, '', 17, 'T'),
(59, 'Pigeon duo 2 burner', 'Double ring burner.\r\nEasy to use knobs.\r\nSmoothly operating knobs.\r\nBrass burner for even blue flame distribution.\r\n2 year warranty.\r\nUnique pan support for better balance.\r\nStrong tubular rubber legs for firm grip.', '71b1wiH6BsL._SX355_.jpg', 2795, '', 17, 'T'),
(60, 'Smart 3 burner', 'Triple ring burner.\r\nRemovable spill tray.\r\nSkid proof stand.\r\nToughened glass to sustain high temprature.\r\nBrass burner for even blue flame distribution.\r\n5 year warranty on glass ,burner,valve.\r\nSafety certified.a', '815WmMfIPGL._AC_SS350_.jpg', 6295, '', 17, 'T'),
(61, 'Tango 2 burner', 'Double ring burner.\r\nRemovable spill tray.\r\nSkid proof stand.\r\nToughened glass to sustain high temprature.\r\nBrass burner for even blue flame distribution.\r\n5 year warranty on glass ,burner,valve.\r\nSafety certified.a', '145649410049-500x500.jpg', 5695, '', 17, 'T'),
(62, 'Tetra 4 burner', 'Four ring burner.\r\nRemovable spill tray.\r\nSkid proof stand.\r\nToughened glass to sustain high temprature.\r\nBrass burner for even blue flame distribution.\r\n5 year warranty on glass ,burner,valve.\r\nSafety certified.a', '1456494335496-500x500.jpg', 8495, '', 17, 'T'),
(63, 'Solo burner', 'Solo ring burner.\r\nRemovable spill tray.\r\nToughened glass to sustain high temprature.\r\nBrass burner for even blue flame distribution.\r\n2 year warranty on glass ,burner,valve.\r\n', 'stovekraft-solo-regular-gas-stoves-500x500.jpg', 1695, '', 17, 'T'),
(64, 'Ornate hob 4 burner', 'Four ring burner\r\n8mm Thick Toughened glass to sustain high temprature.\r\nBrass burner for even blue flame distribution.\r\nAnti corrosion stainless steel dip tray.\r\n1 year warranty on glass ,burner,valve.\r\nSmoothly operating knobs.', 'o_3_8.jpg', 18150, '', 17, 'T'),
(65, 'Smart plus 2 burner', 'Double ring burner.\r\nEasy to maintain and clean.\r\nJumbo burners for fast cooking.\r\nToughened glass to sustain high temprature.\r\nBrass burner for even blue flame distribution.\r\n2 year warranty on glass ,burner,valve.\r\nSafety certified.a', '617+9PMElWL._SX425_.jpg', 5995, '', 17, 'T'),
(66, 'Smart burner', 'Double ring burner.\r\nEasy to maintain and clean.\r\nJumbo burners for fast cooking.\r\nToughened glass to sustain high temprature.\r\nBrass burner for even blue flame distribution.\r\n2 year warranty on glass ,burner,valve.\r\nSafety certified.a', 'stovekraft-smart-plus-2-burner-zeus-500x500.jpg', 5998, '', 17, 'T'),
(67, 'White sandwich maker', '750 Watts power.\r\nPower on/off indicators.\r\nOne year warranty.\r\nShock proof & heat resistant body.\r\nNon sliding rubber feet with grill plates.', '41xz+IzxejL._SX466_.jpg', 1449, '', 13, 'T'),
(68, 'Black sandwich maker', '750 Watts power.\r\nPower on/off indicators.\r\nOne year warranty.\r\nShock proof & heat resistant body.\r\nNon sliding rubber feet with grill plates.', '71BFYpj9CeL._SX425_.jpg', 1449, '', 13, 'T'),
(69, 'Pop up toaster', '750 watts.\r\nAutomatic pop up.\r\nOne year warranty.\r\nShock proof & heat resistant body.', '81Pf-3XPcrL._SX425_.jpg', 1749, '10% off', 13, 'T'),
(70, 'Ebony 60 chimneys', 'Low noise level(56db).\r\nLifetime warranty.\r\nPress button.\r\nMax airflow(1100m3h).\r\nPowder coating with glass.\r\nAuto clean with detachable oil collector.\r\nBaffle filter ensures easy cleaning.', '51rxSEihO2L._SX466_.jpg', 18490, '', 18, 'T'),
(71, 'Ebony 90 chimneys', 'Low noise level(56db).\r\nLifetime warranty.\r\nPress button.\r\nMax airflow(1100m3h).\r\nPowder coating with glass.\r\nAuto clean with detachable oil collector.\r\nBaffle filter ensures easy cleaning.', '1455344788638.jpg', 19490, '', 18, 'T'),
(72, 'Black pearl 60', 'Low noise level(56db).\r\nLifetime warranty.\r\nFeather touch control.\r\nMax airflow(1100m3h).\r\nPowder coating with glass.\r\nAuto clean with detachable oil collector.\r\nBaffle filter ensures easy cleaning.', '1455344833781.jpg', 18990, '', 18, 'T'),
(73, 'Sterling DLX plus 60', 'Low noise level(56db).\r\nLifetime warranty.\r\nPress button.\r\nMax airflow(1100m3h).\r\nPowder coating with glass.\r\nStainless steel.\r\nBaffle filter ensures easy cleaning.', 'SDL605651192_1_-7fa51.jpg', 11990, '', 18, 'T'),
(74, 'Infinity 60', 'Low noise level(56db).\r\nEnergy efficient LED.\r\nMax airflow(1100m3h).\r\n', '625439313643_11-42789.jpg', 7990, '', 18, 'T'),
(75, 'Meadow chimney', 'Low noise level(56db).\r\nLifetime warranty.\r\nPress button.\r\nMax airflow(1100m3h).\r\nPowder coating with glass.\r\nHot auto clean', 'Pigeon-Chimney-infinity-60-2.jpg', 26000, '', 18, 'T'),
(76, 'Kessel 1.2 litre', 'Cool touch handle\r\n360 degree rotational base.\r\nTransparent glass lid with stainless steel rim.\r\nEasy to clean wide mouth.\r\nVariable temprature  control.\r\nIndication when switch on.', '925872654s.jpeg', 1595, '', 19, 'T'),
(77, 'Vigor iron', 'Dry & steam options.\r\nBurst of steam.\r\nWater spray.\r\n360 degree swivel cord.\r\nNon stick coated sole plate.\r\nAdjustable thermostatic control.', '714AGz3hc0L._SL1500_.jpg', 1345, '', 19, 'T'),
(78, 'Gale heavy weight iron', 'Heavy weight dry iron with indicator.\r\nNon-stick golden coated thick & heavy aluminium sole plate.\r\nThermostat for variable temprature level.', '51sSJqhyltL._AC_SS350_.jpg', 1395, '', 19, 'T'),
(79, 'Ivory iron', 'Cool touch handle.\r\nVariable Temprature control.\r\nSwivel cord.\r\nPilot lamp.\r\nMirror finish body.\r\nShock proof body.\r\nNon stick sole plate.', 'pigeon-ivory-ivory-original-imaewqhwtzeegz3b.jpeg', 825, '', 19, 'T'),
(80, 'Glide iron', 'Cool touch handle.\r\nVariable Temprature control.\r\nSwivel cord.\r\nPilot lamp.\r\nMirror finish body.\r\nShock proof body.\r\nNon stick sole plate.', 'glide-iron-500x500.jpg', 755, '', 19, 'T'),
(81, 'Comfy iron', 'Fbric selector knob.\r\nComfortable hand grip.\r\nNon-stick sole plate.', '41i0TJOvYWL._SX425_.jpg', 795, '', 19, 'T'),
(82, 'Dhruv emergency lamp', 'Automatic light up.\r\n360 degree bright light.\r\nAdjustable light intensity.\r\nEasy portable hanging hook.\r\n', '51v8Khqh8vL._SY741_.jpg', 810, '', 21, 'T'),
(83, 'Lumino emergency lamp', 'Automatic light up.\r\n360 degree bright light.\r\nAdjustable light intensity.\r\nEasy portable hanging hook.\r\nSuper bright SMD LED.', '71Nnla8-5ML._SL1500_.jpg', 795, '', 21, 'T'),
(84, 'Illume emergency lamp', 'Automatic light up.\r\n360 degree bright light.\r\nAdjustable light intensity.\r\nEasy portable hanging hook.\r\nSuper bright SMD LED.', '71Yhbao9o+L._SY500_.jpg', 1945, '', 21, 'T'),
(85, 'Helios emergency lamp', 'Automatic light up.\r\nSolar plate for charging.\r\nAdjustable light intensity.\r\nLight dimmer.\r\nPortable.\r\nDC 12 V input.\r\nSuper bright SMD LED.', 'hel-200x267.jpg', 1180, '', 21, 'T'),
(86, 'Theia emergency lamp', 'Light dimmer.\r\nAdjustable switch.\r\nTouch Panel.\r\n0.5 W LED.\r\nFull charge indicator.', 'theia-pigeon-original-imaeqhbxhh6rhpmw.jpeg', 1895, '', 21, 'T'),
(87, 'Equino emergency lamp', 'Overcharge and deep charge protection.\r\nAdjustable light intensity.\r\nCharging indicator.\r\nEasy portability.', 'pigeon-egnite-original-imaepzfdxmkgqhmd.jpeg', 1195, '', 21, 'T'),
(88, 'Gleam emergency light', 'Overcharge and deep charge protection.\r\nAdjustable light intensity.\r\nCharging indicator.\r\nEasy portability.', '148369376063.jpg', 1195, '', 21, 'T'),
(89, 'Egnite lamp', 'Overcharge and deep charge protection.\r\nAdjustable light intensity.\r\nCharging indicator.\r\nEasy portability.', '1483695765197.jpg', 1195, '', 21, 'T'),
(91, 'Step ladder', '4 Step ladder with edge protector.\r\nAnti-skid PVE shoe.\r\nErgonomic design.\r\n5 years warranty.', '9004.main_1024x1024.png', 4995, '', 14, 'T'),
(92, '5 step ladder', ' Alumunium 5 step ladder with edge protector.\r\n5 years warranty.\r\nEasy storage.', '10051860LadderAluminum5Step_x.jpg', 5795, '', 14, 'T'),
(93, 'Dustbin 20 litre', 'Matte spotless dustbins with non-slip,non marking base,smooth,positive action.\r\nFoot operated,hands free operation.\r\nConvenient carry handle.\r\nDurable heavy duty opening mechanism.\r\nHygienic inner bin with handle.', '12570-pigeon-original-imaextg6q7jpm8nz.jpeg', 2195, '', 14, 'T'),
(94, 'Dustbin 3 litre', 'Matte spotless dustbins with non-slip,non marking base,smooth,positive action.\r\nFoot operated,hands free operation.\r\nConvenient carry handle.\r\nDurable heavy duty opening mechanism.\r\nHygienic inner bin with handle.', '12570-pigeon-original-imaextg6q7jpm8nz.jpeg', 695, '', 14, 'T'),
(95, 'Dustbin 5 litre', 'Matte spotless dustbins with non-slip,non marking base,smooth,positive action.\r\nFoot operated,hands free operation.\r\nConvenient carry handle.\r\nDurable heavy duty opening mechanism.\r\nHygienic inner bin with handle.', '12570-pigeon-original-imaextg6q7jpm8nz.jpeg', 895, '', 14, 'T'),
(96, 'Dustbin 12 litre', 'Matte spotless dustbins with non-slip,non marking base,smooth,positive action.\r\nFoot operated,hands free operation.\r\nConvenient carry handle.\r\nDurable heavy duty opening mechanism.\r\nHygienic inner bin with handle.', '12570-pigeon-original-imaextg6q7jpm8nz.jpeg', 1495, '', 14, 'T'),
(97, 'Joy mop', 'Saves time & energy.\r\nUser friendly & versatile.\r\nSpotless floors without getting your  hands dirty.', '12386-pigeon-original-imaems4qfgezepyy.jpeg', 1195, '', 14, 'T'),
(98, 'Joy mop', 'Saves time & energy.\r\nUser friendly & versatile.\r\nSpotless floors without getting your  hands dirty.', '41NVSffagqL._SY355_.jpg', 1195, '', 14, 'T'),
(99, 'Spray mop', 'Red colour spray mops.\r\nHold 7 times dirt & grimes.\r\nZero hassle.\r\n100% Efficieny.\r\nSuitable for all types of flooring.\r\nEnviroment friendly,saves water.\r\nCleans twice as fast as regular mops.\r\nDetachable and washable pad.', 'mob.jpg', 995, '', 14, 'T'),
(100, 'Handy chopper 3-  green', 'Put 1/4 capacity vegetables.\r\nTakeout the blade and vegetables.\r\nSturdy stainless steel blade.\r\nConvenient & easy handling.', '61SJhtoXrYL._SX466_.jpg', 545, '', 22, 'T'),
(101, 'Press chopper', 'Put 1/4 capacity vegetables.\r\nSturdy stainless steel blade.\r\nConvenient & easy handling.', '71XilRNVgEL._SY741_.jpg', 495, '', 22, 'T'),
(102, '3 Piece knives set', 'Stainless steel with hollow ground edges.\r\nSoft grip contoured handle.', '7-500x500.jpg', 545, '', 22, 'T'),
(103, 'joy 2.2 litre cooker', '2 years warranty.\r\nOn/off switch.\r\nIndicator for warm clock operations.\r\nStrong and sturdy body.', '41MH8GQFO6L._SX425_.jpg', 3199, '', 5, 'T'),
(104, 'joy 2.8 litre cooker', '2 years warranty.\r\nOn/off switch.\r\nIndicator for warm clock operations.\r\nStrong and sturdy body.', '41MH8GQFO6L._SX425_.jpg', 3595, '', 5, 'T'),
(105, 'joy 1.8 litre cooker', '2 years warranty.\r\nOn/off switch.\r\nIndicator for warm clock operations.\r\nStrong and sturdy body.', '41MH8GQFO6L._SX425_.jpg', 2799, '', 5, 'T'),
(106, 'joy 1. litre cooker', '2 years warranty.\r\nOn/off switch.\r\nIndicator for warm clock operations.\r\nStrong and sturdy body.', '41MH8GQFO6L._SX425_.jpg', 2195, '', 5, 'T'),
(107, 'Rishab aroma lunchbox', 'Rishab aroma steel lunchbox.\r\n', 'aroma-snack-pack-500x500(1).jpg', 449, '', 20, 'T'),
(108, 'Croma rishab lunchbox', 'Croma rishab steel lunchbox.\r\nPortable.\r\nEasy to carry.', 'croma-snack-pack-500x500.jpg', 449, '', 20, 'T'),
(109, 'Hot premier lunchbox', 'Hot premier steel lunchbox.\r\nPortable.', 'electron-milton-4-original-imafykjjfenyhty2.jpeg', 999, '', 20, 'T'),
(110, 'Cello bottle', 'Extra protection.\r\nEasy floe flip open lid.\r\nRemovable clip on mouth for easy cleaning.\r\nKeeps drink hot/cold for long hours.', '71UEIMUn7JL._SX466_.jpg', 1000, '', 9, 'T'),
(117, 'Sizlzler hot pot', 'Copper sizzler hotpot.\r\nstylish party set.\r\nWoody in colour.\r\n', '338-copper-rishabh-original-imae98wwzkmwuzgh.jpeg', 3500, '', 20, 'T'),
(118, 'Cello lunchbox', 'Cello hot meal.\r\nGrey in colour.', 'cello-134824-original-imaenz2yyutunzwy.jpeg', 795, '', 20, 'T'),
(119, 'Solitaire hot pot', 'Solitaire hot pot white and red hot pot.\r\n', 'VER301469440014.jpg', 2000, '', 20, 'T'),
(120, 'Casserole', 'Silk rishab silk casserole in creamish colour.', 'rishabh-casserole-solar-2000-ml.jpg', 1000, '', 20, 'T'),
(121, 'Hot chef', 'Rishab Hot chef.\r\nFull set  hot chef.\r\nAvailable in various designs.', 'product-500x500.jpeg', 1700, '', 20, 'T'),
(122, 'Galaxy containers', 'Rishab Galaxy container. ', 'meal-o-meal-hot-case-tiffin-box-500x500.jpg', 500, '', 20, 'T'),
(123, 'Hot kettle', 'Hot kettle 1.5 litre.\r\n1 year warranty.\r\nCool touch handle.\r\n1000 Watts power.', 'pigeon-shiny-original-imaf2mrrbgbyfrfr.jpeg', 1099, '', 19, 'T'),
(124, 'Lavender magic plates', 'Gorgeous lavender magic dinnerware.\r\nLavenders are a great way to celebrate the deep enthusiasm & fiery passion.', 'lavender-magic-dinnerware-1526288430-3862146.jpeg', 2500, '', 22, 'T'),
(126, 'Spring bloom dinnerware', 'Gorgeous spring bloom dinnerware.', 'spring-bloom-cello-original-imaf3kbz4fh4aerw.jpeg', 2400, '', 22, 'T'),
(127, 'Pristine aqua dinnerware', 'Extra strong.\r\nEasy to clean.\r\nLight weight.\r\nSuper white.\r\nScratch resistance.\r\nSmooth surface.\r\nStackable.\r\nBreak & chip resistance.', 'download (1).jpg', 2400, '', 22, 'T'),
(128, 'Amber gold dinnerware', 'Light weight.\r\nSuper white.\r\nScratch resistance.\r\nSmooth surface.\r\nStackable.\r\nBreak & chip resistance.', 'download.jpg', 2700, '', 22, 'T'),
(129, 'Green Orchard', 'Light weight.\r\nSuper white.\r\nScratch resistance.\r\nSmooth surface.\r\nStackable.\r\nBreak & chip resistance.', 'download (2).jpg', 2100, '', 22, 'T'),
(130, 'Red poppy plates', 'Light weight.\r\nSuper white.\r\nScratch resistance.\r\nSmooth surface.\r\nStackable.\r\nBreak & chip resistance.\r\nMicrowave safe.\r\nThermal resistance.', 'red-poppy-dinnerware-1526288699-3862248.jpeg', 2000, '', 22, 'T'),
(131, ' Neelkamal dinnerware', 'Light weight.\r\nSuper white.\r\nScratch resistance.\r\nSmooth surface.\r\nStackable.\r\nBreak & chip resistance.', '81ZqjJHectL._SX466_.jpg', 2100, '', 22, 'T'),
(132, 'Orange lilly plates', 'Light weight.\r\nSuper white.\r\nScratch resistance.\r\nSmooth surface.\r\nStackable.\r\nBreak & chip resistance.', 'download (3).jpg', 2100, '', 22, 'T'),
(133, 'Mint foliage', 'Light weight.\r\nSuper white.\r\nScratch resistance.\r\nSmooth surface.\r\nStackable.\r\nBreak & chip resistance.', '41gLdRny69L._SX300_QL70_.jpg', 2400, '', 22, 'T'),
(134, 'Rose fantasy plates', 'Light weight.\r\nSuper white.\r\nScratch resistance.\r\nSmooth surface.\r\nStackable.\r\nBreak & chip resistance.', '11.jpg', 2100, '', 22, 'T'),
(136, 'Polka drops dinnerset', 'Light weight.\r\nSuper white.\r\nScratch resistance.\r\nSmooth surface.\r\nStackable.\r\nBreak & chip resistance.', '61hPIzEgZfL._SX466_.jpg', 2300, '', 22, 'T'),
(137, 'Titanium handi cooker', 'Hard anodised pressure 5 litre cooker.\r\nStainless steel lid.\r\nServing lid.\r\nCooks faster and save energy.\r\nThermal efficient.\r\n5 year warranty.\r\nMetal spoon friendly.', 'download (5).jpg', 2645, '', 5, 'T'),
(138, 'Titanium  cookware', 'Hard anodised pressure cooker.\r\nStainless steel lid.\r\nServing lid.\r\nCooks faster and save energy.\r\nThermal efficient.\r\n5 year warranty.\r\nMetal spoon friendly.', 'download (5).jpg', 1845, '', 5, 'T'),
(151, '2 In 1 Inner lid kit', 'Aluminium pressure cooker 5 litre.\r\nFlat taa 250.', 'download (13).jpg', 1895, '', 6, 'T'),
(152, 'Appachetty 200', 'Extra thick space to avoid wrapping.\r\nStrong ,stay-cool handle.\r\nMetal spoon friendly.\r\n1 Year warranty.', 'download (16).jpg', 1095, '', 8, 'T'),
(153, 'Pan wok 320', 'Extra thick space to avoid wrapping.\r\nStrong ,stay-cool handle.\r\nMetal spoon friendly.\r\n1 Year warranty.', 'download (15).jpg', 1545, '', 8, 'T'),
(154, 'Paniyarakkal 7 rounds', 'Extra thick space to avoid wrapping.\r\nStrong ,stay-cool handle.\r\nMetal spoon friendly.\r\n1 Year warranty.', 'download (18).jpg', 995, '', 8, 'T'),
(155, 'Paniyarakkal 11 rounds', 'Extra thick space to avoid wrapping.\r\nStrong ,stay-cool handle.\r\nMetal spoon friendly.\r\n1 Year warranty.', 'download (17).jpg', 1195, '', 8, 'T'),
(156, 'Paniyarakkal 12 rounds', 'Extra thick space to avoid wrapping.\r\nStrong ,stay-cool handle.\r\nMetal spoon friendly.\r\n1 Year warranty.', 'download (19).jpg', 495, '', 8, 'T'),
(157, 'Coral-3piece giftset', 'Flat tawa 250 special.\r\nKadai 150 special.\r\nFry pan 200 special.', 'download (20).jpg', 2295, '', 8, 'T'),
(158, 'Amber induction', 'Soft push button.\r\n7 preset menus.\r\n2 year warranty.\r\n1500 watts power.', 'download (21).jpg', 2795, '', 12, 'T'),
(159, 'Estella advanced mixer', '750 Powerfu motor.\r\n5 Years warranty on motor.\r\n4 Grinding and mixin jars.\r\nHigh grade virgin ABS body for more Durability.\r\nUnbreakable poly-carbonate lids.\r\nErgonomic handle for better grip.', 'download (22).jpg', 5025, '', 15, 'T'),
(160, 'Classic pro grinder', '550 Powerfu motor.\r\n5 Years warranty on motor.\r\nAutomatic overload cutoff.\r\n3 Grinding and mixin jars.\r\nHigh grade virgin ABS body for more Durability.\r\nUnbreakable poly-carbonate lids.\r\nErgonomic handle for better grip.\r\nStainless steel & polished blade.\r\nHigh grade stainless steel.\r\nStable & sturdy operation.', 'download (23).jpg', 2967, '', 15, 'T'),
(161, 'Sapphire blender', '250 Powerfu motor.\r\n2 Years warranty on motor.\r\nTough grinding stainless steel blades.\r\n3 accessories\r\n2 speed control.\r\nSuperior speed & torque.\r\nHigh grade virgin ABS body for more Durability.\r\nUnbreakable poly-carbonate lids.\r\nErgonomic handle for better grip.\r\nStainless steel & polished blade.', 'download (24).jpg', 2999, '', 15, 'T'),
(162, 'Sapphire grand blender', '400 Powerfu motor.\r\n2 Years warranty on motor.\r\nTough grinding stainless steel blades.\r\n4 Accessories\r\n2 speed control.\r\nSuperior speed & torque.\r\n', 'download (25).jpg', 4999, '', 15, 'T'),
(163, 'Maxi Grind', '150 Powerful motor.\r\n5 Years warranty on motor.\r\nTough grinding stainless steel blades.\r\n2 accessories\r\n2 litre capacity.\r\nSuperior speed & torque.\r\nShock & rust proof body.\r\npoly-carbonate lid.\r\nNon absorbing/non-contarminating.', 'images (1).jpg', 5295, '', 15, 'T'),
(164, 'Kitchen scissors', 'Nut cracker.\r\nVegetable cutter/scaler.\r\nBottle Opener.\r\nErgonomic non-slip grip for enhanced safety.', 'download (26).jpg', 335, '', 22, 'T'),
(165, 'Knives', '3 Piece knives set.\r\nStainless steel with hollow ground edges.\r\nSoft grip contoured handle.', 'download (27).jpg', 454, '', 22, 'T'),
(170, 'Swig bottles 500 ML', 'Color: Silver.\r\nSteel.\r\nType: Sipper.\r\nCapacity: 500 ml.', '600-swig-600-pigeon-original-imaf3zy4znsw3sdy.jpeg', 299, '', 9, 'T'),
(171, 'Swig bottles 750 ML', 'Color: Silver.\r\nSteel.\r\nType: Sipper.\r\nCapacity: 750 ml.', '600-swig-600-pigeon-original-imaf3zy4znsw3sdy.jpeg', 369, '', 9, 'T'),
(172, 'Legend cello bottle', 'Trendy sports bottle\r\nPerfect to carry outdoors\r\nStainless steel bottle.\r\nSlim design which makes it easy to carry.\r\nKeeps drink hot and cold for long hours.\r\nUnbreakable lid cover.\r\nThermo seal technology.', '71TVw40uFSL._SY355_.jpg', 750, '', 9, 'T'),
(173, 'Cello bottles', 'Double walled stainless steel bottle\r\nIt keeps drink hot/cold for up to 12 hours\r\nSpill proof, sleek, stylish and Fabricated with stainless steel material\r\nColor: silver, Material: Stainless Steel, Shape: Round\r\nPackage Contents: 1-Piece Sports Bottle (700ml)', '31m5NiIF30L.jpg', 795, '', 9, 'T'),
(174, 'Cello bottles', 'Double walled stainless steel bottle\r\nIt keeps drink hot/cold for up to 12 hours\r\nSpill proof, sleek, stylish and Fabricated with stainless steel material\r\nColor: pink, Material: Stainless Steel, Shape: Round\r\nPackage Contents: 1-Piece Sports Bottle (700ml)', '5b5f522f195b0f455ed95bd2cba94c01.jpg', 795, '', 9, 'T'),
(176, 'Stainless flask 500ml', 'Color: Grey\r\nType: Flask\r\nCapacity: 1000 ml.\r\nDouble Insulated Wall.\r\nServices=\r\nCash on Delivery available.', 'download (28).jpg', 745, '', 9, 'T'),
(177, 'Stainless flask 750ml', 'Color: Grey\r\nType: Flask\r\nCapacity: 750 ml.\r\nDouble Insulated Wall.\r\nServices=\r\nCash on Delivery available.', 'download (28).jpg', 965, '', 9, 'T'),
(178, 'Stainless flask 100ml', 'Color: Grey\r\nType: Flask\r\nCapacity: 1000 ml.\r\nDouble Insulated Wall.\r\nServices=\r\nCash on Delivery available.', 'download (28).jpg', 1045, '', 9, 'T'),
(179, 'Refresh cello bottle', 'Cello Refresh Stainless Steel Bottle.\r\nCapacity:900ml.\r\nColor:silver.\r\nKeeps drink hot/cold for long hour.', '61-U8ClZSpL._SX425_.jpg', 900, '', 9, 'T'),
(180, 'Refresh Bottle', 'Cello Refresh Stainless Steel Bottle.\r\nCapacity:900ml.\r\nColor:Purple.\r\nKeeps drink hot/cold for long hour.', 'cello-refresh-stainless-steel-bottle-500x500.jpg', 900, '', 9, 'T'),
(181, 'Cello bottle (BLUE)', 'Cello Refresh Stainless Steel Bottle.\r\nCapacity: 900ml.\r\nColor : Blue.\r\nKeeps drink hot/cold for long hour.', 'download (1).jpg', 900, '', 9, 'T'),
(182, 'Cello bottle (pink)', 'Cello Refresh Stainless Steel Bottle.\r\nCapacity:900ml.\r\nColor :Pink.\r\nKeeps drink hot/cold for long hour.\r\nMade up of thermo seal.', 'download.jpg', 900, '', 9, 'T'),
(183, 'striker cello bottle', 'Cello Striker Stainless Steel Bottle.\r\nCapacity : 500ml.\r\nColor : Silver', 'download (2).jpg', 750, '', 9, 'T'),
(184, 'Club cello bottle(red)', 'Cello Club Stainless Steel Bottle.\r\nCapacity : 500ml.\r\nColor : red.\r\nKeeps drink hot or cold for long hour.', '41VA2iQBt+L._SX466_.jpg', 750, '', 9, 'T'),
(185, 'Club cello bottle(black)', 'Cello Club Stainless Steel Bottle.\r\nCapacity : 500ml.\r\nColor : Black.\r\nKeeps drink hot or cold for long hour.', 'download (3).jpg', 750, '', 9, 'T'),
(186, 'Aveo cello bottle(orange)', 'Cello Aveo Stainless Steel Sports Bottle.\r\nCapcity : 600ml. \r\nColor : White & Orange.\r\nKeeps water hot/cold (24 hrs).\r\n', '71b6+Y6gzcL._SX466_.jpg', 800, '', 9, 'T'),
(187, 'Aveo cello bottle(green)', 'Cello Aveo Stainless Steel Sports Bottle.\r\nCapcity : 600ml. \r\nColor : White & Green.\r\nKeeps water hot/cold (24 hrs).\r\n', '61ztIwXuxUL._AC_SS350_.jpg', 800, '', 9, 'T'),
(188, 'Aveo cello bottle(black)', 'Cello Aveo Stainless Steel Sports Bottle.\r\nCapcity : 600ml. \r\nColor : Black & Blue.\r\nKeeps water hot/cold (24 hrs).\r\n', '81j5voU71zL._SX466_.jpg', 800, '', 9, 'T'),
(189, 'Turbo cello(red)', 'Cello Turbo Stainless Steel Bottle.\r\nCapacity : 550ml.\r\nColor : red.\r\nKeeps drink hot/cold(24 hrs).\r\n18/8 high quality steel.\r\nMade up of thermo seal.', '31Y9HyjaKsL.jpg', 648, '', 9, 'T'),
(190, 'Turbo cello(orange)', 'Cello Turbo Stainless Steel Bottle.\r\nCapacity : 550ml.\r\nColor : orange.\r\nKeeps drink hot/cold(24 hrs).\r\n18/8 high quality steel.\r\nMade up of thermo seal.', '61FPtgBxxnL._SX466_.jpg', 648, '', 9, 'T'),
(191, 'Turbo cello(blue)', 'Cello Turbo Stainless Steel Bottle.\r\nCapacity : 550ml.\r\nColor : blue.\r\nKeeps drink hot/cold(24 hrs).\r\n18/8 high quality steel.\r\nMade up of thermo seal.', 'download (4).jpg', 649, '', 9, 'T'),
(192, 'Force cello bottle(blue)', 'Double walled stainless steel sports bottle\r\nIt keeps drink hot/cold for up to 12 hours\r\nSpill proof, sleek, stylish and Fabricated with stainless steel material.\r\nColor : blue.\r\nMaterial: Stainless Steel.\r\nShape: Round.\r\npackage Contents: 1-Piece Sports Bottle (700ml)', 'download (6).jpg', 748, '', 9, 'T'),
(193, 'Force cello bottle(pink)', 'Double walled stainless steel sports bottle\r\nIt keeps drink hot/cold for up to 12 hours\r\nSpill proof, sleek, stylish and Fabricated with stainless steel material.\r\nColor : pink.\r\nMaterial: Stainless Steel.\r\nShape: Round.\r\npackage Contents: 1-Piece Sports Bottle (700ml)', '719PubfwnQL._SY879_.jpg', 748, '', 9, 'T'),
(194, 'My cup cello bottle(350ml)', 'Cello My Cup Stainless Steel Travel Cup(350 ML).\r\nCapacity : 500ml.\r\nColor :  Silver.\r\nKeeps water hot for long hour.', 'download (7).jpg', 550, '', 9, 'T'),
(195, 'My cup cello bottle(500ml)', 'Cello My Cup Stainless Steel Travel Cup(500 ML)\r\nCapacity : 500ml.\r\nColor :  Silver.\r\nKeeps water hot for long hour.', 'download (7).jpg', 699, '', 9, 'T'),
(197, 'Monty cello(black)', 'Tough and trendy\r\nBpa free\r\nLocks in the cold and the heat for long\r\nCompact, light weight.\r\n18/8 stainless steel.\r\nPortable.\r\nColor:Black, Material: Stainless Steel\r\nPackage Contents: 1-Piece Flask (300ml)', '71FSq7gfXcL._SX425_.jpg', 530, '', 9, 'T'),
(198, 'Monty cello(red)', 'Tough and trendy\r\nBpa free\r\nLocks in the cold and the heat for long\r\nCompact, light weight.\r\n18/8 stainless steel.\r\nPortable.\r\nColor:red, Material: Stainless Steel.\r\nPackage Contents: 1-Piece Flask (300ml).', 'download (9).jpg', 530, '', 9, 'T'),
(199, 'Monty cello(grey)', 'Tough and trendy\r\nBpa free\r\nLocks in the cold and the heat for long\r\nCompact, light weight.\r\n18/8 stainless steel.\r\nPortable.\r\nColor:Gold/Grey, Material: Stainless Steel.\r\nPackage Contents: 1-Piece Flask (300ml).', 'download (8).jpg', 530, '', 9, 'T'),
(200, 'Monty cello(skyblue)', 'Tough and trendy\r\nBpa free\r\nLocks in the cold and the heat for long\r\nCompact, light weight.\r\n18/8 stainless steel.\r\nPortable.\r\nColor:Skyblue, Material: Stainless Steel.\r\nPackage Contents: 1-Piece Flask (300ml).', '81mi--MOWiL._SX466_.jpg', 530, '', 9, 'T'),
(201, 'GYM Star cello(green)', 'Package Contents: 1-Piece Flask (650ml)\r\nâ€¢ Double wall insulation\r\nâ€¢ Compact size bottle, tough and durable\r\nâ€¢ Stylish steel bottle\r\nâ€¢ Perfect to carry outdoors\r\nâ€¢ Elegant look', 'download (10).jpg', 900, '', 9, 'T'),
(202, 'GYM Star cello(maroon)', ' Package Contents: 1-Piece Flask (650ml)\r\nâ€¢ Double wall insulation.\r\nâ€¢ Compact size bottle, tough and durable.\r\nâ€¢ Stylish steel bottle.\r\nâ€¢ Perfect to carry outdoors.\r\nâ€¢ Elegant look.', 'images (2).jpg', 900, '', 9, 'T'),
(203, 'GYM Star cello(silver)', ' Package Contents: 1-Piece Flask (650ml)\r\nâ€¢ Double wall insulation\r\nâ€¢ Compact size bottle, tough and durable\r\nâ€¢ Stylish steel bottle\r\nâ€¢ Perfect to carry outdoors\r\nâ€¢ Elegant look', '8122n9e7AqL._SL1500_.jpg', 900, '', 9, 'T'),
(204, 'Kool Skool cello bottle.', 'Double walled stainless steel bottle\r\nIt keeps drink hot/cold for up to 12 hours.\r\nSpill proof, sleek, stylish and Fabricated with stainless steel material.\r\nPerfect choice for your Kids.\r\nIdeal for side pocket of Bags', 'download (11).jpg', 700, '', 9, 'T'),
(205, 'Kool Skool cello (pink)', 'Double walled stainless steel bottle\r\nIt keeps drink hot/cold for up to 12 hours\r\nSpill proof, sleek, stylish and Fabricated with stainless steel material\r\nPerfect choice for your Kids\r\nIdeal for side pocket of Bags', 'download (12).jpg', 650, '', 9, 'T'),
(206, 'Thunder cello flask', 'Plastic outside surface and glass liner\r\nPlastic outside surface and glass liner\r\nDurable and break resistant\r\nAnti spill mechanism.\r\nHeat resistant handle, no leak and easy open top.\r\nKeeps liquids hot and cool for hours, non leaching and toxin free.\r\nColor: Black, Material: Stainless Steel.\r\nPackage Contents: 1-Piece Flask (4 Litres)', 'download (13).jpg', 2000, '', 9, 'T'),
(207, 'Royce cello flask(black)', 'Package Contents: 1-Piece Carafe (2 Liters).\r\nDouble wall insulation.\r\nKeeps beverages hot and cold up to 24 hours.\r\nStrong and sturdy handle.\r\nElegant look.', '81JBZ1DuoML._SY679_.jpg', 1800, '', 9, 'T'),
(208, 'Royce cello flask(silver)', 'Package Contents: 1-Piece Carafe (2 Liters)\r\nDouble wall insulation\r\nKeeps beverages hot and cold up to 24 hours\r\nStrong and sturdy handle\r\nElegant look', 'download (14).jpg', 1800, '', 9, 'T');

-- --------------------------------------------------------

--
-- Table structure for table `tbusr`
--

CREATE TABLE `tbusr` (
  `usrcod` int(11) NOT NULL,
  `usreml` varchar(100) NOT NULL,
  `usrpwd` varchar(100) NOT NULL,
  `usrregdat` datetime NOT NULL,
  `usrrol` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbusr`
--

INSERT INTO `tbusr` (`usrcod`, `usreml`, `usrpwd`, `usrregdat`, `usrrol`) VALUES
(15, 'ashupatial067@gmail.com', '669372', '2019-02-07 00:00:00', 'U'),
(16, 'anujkmr25299@gmail.com', '719635', '2019-02-08 00:00:00', 'U'),
(17, 'adminshopping@gmail.com', 'admin123', '2019-02-08 00:00:00', 'A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbcat`
--
ALTER TABLE `tbcat`
  ADD PRIMARY KEY (`catcod`);

--
-- Indexes for table `tbord`
--
ALTER TABLE `tbord`
  ADD PRIMARY KEY (`ordcod`);

--
-- Indexes for table `tborddet`
--
ALTER TABLE `tborddet`
  ADD PRIMARY KEY (`orddetcod`);

--
-- Indexes for table `tbprd`
--
ALTER TABLE `tbprd`
  ADD PRIMARY KEY (`prdcod`);

--
-- Indexes for table `tbusr`
--
ALTER TABLE `tbusr`
  ADD PRIMARY KEY (`usrcod`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbcat`
--
ALTER TABLE `tbcat`
  MODIFY `catcod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `tbord`
--
ALTER TABLE `tbord`
  MODIFY `ordcod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tborddet`
--
ALTER TABLE `tborddet`
  MODIFY `orddetcod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbprd`
--
ALTER TABLE `tbprd`
  MODIFY `prdcod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;
--
-- AUTO_INCREMENT for table `tbusr`
--
ALTER TABLE `tbusr`
  MODIFY `usrcod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
