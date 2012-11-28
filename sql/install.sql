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

DROP TABLE IF EXISTS '#__jcollaborator'; /*Drop the table if it already exists*/

CREATE TABLE '#__jcollaborator'  /*Create the table we will be using for the project*/
(
	'id' int(11) NOT NULL AUTO_INCREMENT,
	'attribute' varchar(25) NOT NULL,
	'catid' int(11) NOT NULL DEFAULT '0',
	'params' TEXT NOT NULL DEFAULT '',
	PRIMARY KEY ('id')
)

ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

INSERT INTO '#__jcollaborator' ('attribute') VALUES
	('Sample User'),
	('Sample Username'),
	('Sample description goes here');
	
CREATE TABLE IF NOT EXISTS 'jcollaborator_users' (
	'username' varchar(8) NOT NULL,
	'name' varchar(8) NOT NULL,
	'age' int(2) unsigned NOT NULL,
	'contact' varchar(8) NOT NULL,
	'experience' varchar(8) NOT NULL,
	UNIQUE KEY 'username' ('username')
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS 'jcollaborator_track' (
  'name' varchar(15) NOT NULL,
  'length' time NOT NULL,
  'username' varchar(8) NOT NULL,
  PRIMARY KEY ('name')
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS 'jcollaborator_change' (
  'id' int(1) NOT NULL,
  'date' date NOT NULL,
  'tname' varchar(8) NOT NULL,
  'username' varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jcollaborator_genre`
--

CREATE TABLE IF NOT EXISTS 'jcollaborator_genre' (
  'name' varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jcollaborator_instrument`
--

CREATE TABLE IF NOT EXISTS 'jcollaborator_instrument' (
  'type' varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jcollaborator_user_DAW`
--

CREATE TABLE IF NOT EXISTS 'jcollaborator_user_DAW' (
  'username' varchar(20) NOT NULL,
  'u_DAW' varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
