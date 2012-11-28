/*------------------------------------------------------------------------------------------------------------------------

    Author: Sean Goresht, Jobelle Firme, Nick Valera
    github: https://github.com/srsgores/joomla-music-collaborator

    Licensed under the GPL License
    Date: December, 2012

    ======================================
    File:  install.sql
    ======================================
    This file contains all the installation sql data for the application.  This is always executed on install, by overriding the postflight() method in Joomla.

--------------------------------------------------------------------------------------------------------------------- */

-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 28, 2012 at 03:26 AM
-- Server version: 5.5.27-log
-- PHP Version: 5.3.16

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: 'jcollaborator'
--
CREATE DATABASE 'jcollaborator' DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE 'jcollaborator';
--
-- Database: 'test'
--
CREATE DATABASE 'test' DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE 'test';

-- --------------------------------------------------------

--
-- Table structure for table 'jcollaborator_change'
--

CREATE TABLE IF NOT EXISTS 'jcollaborator_change' (
  'id' int(1) NOT NULL,
  'date' date NOT NULL,
  'tname' varchar(10) NOT NULL,
  'username' varchar(8) NOT NULL,
  PRIMARY KEY ('id'),
  KEY 'username' ('username'),
  KEY 'tname' ('tname')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'jcollaborator_genre'
--

CREATE TABLE IF NOT EXISTS 'jcollaborator_genre' (
  'name' varchar(20) NOT NULL,
  PRIMARY KEY ('name')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'jcollaborator_instrument'
--

CREATE TABLE IF NOT EXISTS 'jcollaborator_instrument' (
  'type' varchar(20) NOT NULL,
  PRIMARY KEY ('type')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'jcollaborator_issue'
--

CREATE TABLE IF NOT EXISTS 'jcollaborator_issue' (
  'id' int(1) NOT NULL,
  'date' date NOT NULL,
  'description' varchar(20) NOT NULL,
  PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'jcollaborator_plays'
--

CREATE TABLE IF NOT EXISTS 'jcollaborator_plays' (
  'itype' varchar(10) NOT NULL,
  'gname' varchar(10) NOT NULL,
  'uname' varchar(10) NOT NULL,
  KEY 'itype' ('itype','gname','uname'),
  KEY 'gname' ('gname'),
  KEY 'uname' ('uname')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'jcollaborator_pullRequest'
--

CREATE TABLE IF NOT EXISTS 'jcollaborator_pullRequest' (
  'id' int(1) NOT NULL,
  'date' date NOT NULL,
  'description' varchar(20) NOT NULL,
  PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'jcollaborator_sends'
--

CREATE TABLE IF NOT EXISTS 'jcollaborator_sends' (
  'pid' int(1) NOT NULL,
  'sid' int(1) NOT NULL,
  'username' varchar(20) NOT NULL,
  KEY 'pid' ('pid'),
  KEY 'sid' ('sid'),
  KEY 'username' ('username')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'jcollaborator_track'
--

CREATE TABLE IF NOT EXISTS 'jcollaborator_track' (
  'name' varchar(15) NOT NULL,
  'length' time NOT NULL,
  'username' varchar(8) NOT NULL,
  PRIMARY KEY ('name'),
  KEY 'username' ('username')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'jcollaborator_user'
--

CREATE TABLE IF NOT EXISTS 'jcollaborator_user' (
  'username' varchar(8) NOT NULL,
  'name' varchar(10) NOT NULL,
  'age' int(1) NOT NULL,
  'contact' int(1) NOT NULL,
  'experience' varchar(10) NOT NULL,
  PRIMARY KEY ('username')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table 'jcollaborator_user_DAW'
--

CREATE TABLE IF NOT EXISTS 'jcollaborator_user_DAW' (
  'username' varchar(8) NOT NULL,
  'uDAW' varchar(10) NOT NULL,
  PRIMARY KEY ('uDAW'),
  KEY 'username' ('username')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table 'jcollaborator_change'
--
ALTER TABLE 'jcollaborator_change'
  ADD CONSTRAINT 'jcollaborator_change_ibfk_2' FOREIGN KEY ('username') REFERENCES 'jcollaborator_user' ('username') ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT 'jcollaborator_change_ibfk_1' FOREIGN KEY ('tname') REFERENCES 'jcollaborator_track' ('name') ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table 'jcollaborator_plays'
--
ALTER TABLE 'jcollaborator_plays'
  ADD CONSTRAINT 'jcollaborator_plays_ibfk_3' FOREIGN KEY ('uname') REFERENCES 'jcollaborator_user' ('username') ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT 'jcollaborator_plays_ibfk_1' FOREIGN KEY ('itype') REFERENCES 'jcollaborator_instrument' ('type') ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT 'jcollaborator_plays_ibfk_2' FOREIGN KEY ('gname') REFERENCES 'jcollaborator_genre' ('name') ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table 'jcollaborator_sends'
--
ALTER TABLE 'jcollaborator_sends'
  ADD CONSTRAINT 'jcollaborator_sends_ibfk_3' FOREIGN KEY ('username') REFERENCES 'jcollaborator_user' ('username') ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT 'jcollaborator_sends_ibfk_1' FOREIGN KEY ('pid') REFERENCES 'jcollaborator_pullRequest' ('id') ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT 'jcollaborator_sends_ibfk_2' FOREIGN KEY ('sid') REFERENCES 'jcollaborator_issue' ('id') ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table 'jcollaborator_track'
--
ALTER TABLE 'jcollaborator_track'
  ADD CONSTRAINT 'jcollaborator_track_ibfk_1' FOREIGN KEY ('username') REFERENCES 'jcollaborator_user' ('username') ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table 'jcollaborator_user_DAW'
--
ALTER TABLE 'jcollaborator_user_DAW'
  ADD CONSTRAINT 'jcollaborator_user_daw_ibfk_1' FOREIGN KEY ('username') REFERENCES 'jcollaborator_user' ('username') ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
