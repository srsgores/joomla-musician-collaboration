<?php
/*------------------------------------------------------------------------------------------------------------------------

    Author: Sean Goresht, Jobelle Firme, Nick Valera
    github: https://github.com/srsgores/joomla-music-collaborator

    Licensed under the GPL License
    Date: December, 2012

    ======================================
    File:  Controller.php
    ======================================
    This file will control the entire application, by using separate classes, and passing model data to the view.

--------------------------------------------------------------------------------------------------------------------- */
// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.controller');

class JCollaborator extends JControllerLegacy
{

	public function display($cachable = false, $urlparams = false)
	{
		JRequest::setVar('view', 'default'); // force it to be the search view

		return parent::display($cachable, $urlparams);
	}

}
