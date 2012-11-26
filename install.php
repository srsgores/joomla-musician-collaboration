<?php
/*-------------------------------------------------------------------------------------------------------------------

    Author: Sean Goresht, Jobelle Firme, Nick Valera
    github: https://github.com/srsgores/joomla-music-collaborator

    Licensed under the GPL License
    Date: December, 2012

    ======================================
    File:  install.php
    ======================================
    This file will initialize the installation process and then install all the needed sql for this application

--------------------------------------------------------------------------------------------------------------------- */
defined("_JEXEC") or die("Restricted access");

class com_jcollaboratorInstallScript
{
	function install($parent) //overriding the Joomla install function.  Here, we can say what custom stuff happens
	{
		$this->createTables($parent);
		return true;
	}
	function uninstall($parent)
	{
		//nothing for now
	}

	function update($parent)
	{
		//say what happens when the component is updated (in terms of any custom functions ie. SQL, DDL, etc.)
		$this->updateTables();
	}

	//Class functions
	private function createTables($parent)
	{
		$db = JFactory::getDbo();
		$db->setDebug(0);
		//get query from sql file
		$query = null; //set query to null; otherwise, we will add a new value
		$src = $parent->getParent()->getPath("source");
		$queryPath = $src . "sql/install.sql";
		if ($queryPath)
		{
			//if the sql file does exist, then let's assign its contents to our query variable
			$query = file_get_contents($queryPath);
			$db->setQuery($query);
			//now execute the query
			$db->query();
		}
		//display an error message if there is one
		echo $db->getErrorMsg();
	}

	private function updateTables()
	{
	}
}