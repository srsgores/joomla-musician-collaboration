<?php

defined('_JEXEC') or die('Restricted access');

$app = JFactory::getApplication();
$admin = $app->isAdmin();
if ($admin == 1)
{
	?>

<article class = "markdown-body entry-content" itemprop = "mainContentOfPage"><h1>
	<a name = "joomla-musician-collaboration-component-for-joomla-3" class = "anchor" href = "#joomla-musician-collaboration-component-for-joomla-3"><span class = "mini-icon mini-icon-link"></span></a>Joomla
	Musician Collaboration Component for Joomla! 3</h1>

	<p>Introducing joomla musician collaboration, a component for Joomla 3 that allows you to create a musician network,
		and allows sharing of tracks from 3rd-parties.</p>

	<h2>
		<a name = "functions" class = "anchor" href = "#functions"><span class = "mini-icon mini-icon-link"></span></a>Functions
	</h2>

	<ul>
		<li>Facebook-like UI, with git-like user interactions</li>
		<li>Detailed information about changes to each track, per profile</li>
		<li>Customizable profile information, for each registered Joomla user</li>
		<li>Integration with third-party services including Facebook, SoundCloud, ReverbNation, and others.</li>
		<li>Advanced properties (html5, css3, ...)</li>
		<li>Compatability with IE7 and below, with gracefull degradation</li>
	</ul>
	<h2>
		<a name = "documentation" class = "anchor" href = "#documentation"><span class = "mini-icon mini-icon-link"></span></a>Documentation
	</h2>

	<p>Docs are coming soon.</p>

	<h2>
		<a name = "develop-with-us" class = "anchor" href = "#develop-with-us"><span class = "mini-icon mini-icon-link"></span></a>Develop
		with Us</h2>

	<ul>
		<li>Start by reading up on the Joomla CMS: <a href = "http://developer.joomla.org/manual/">joomla reference
			manual</a>
		</li>
		<li><a href = "http://docs.joomla.org/Developing_a_Model-View-Controller_Component/3.0/">Take a look at the
			information about developing for Joomla 3</a></li>
	</ul>
	<h2>
		<a name = "authors" class = "anchor" href = "#authors"><span class = "mini-icon mini-icon-link"></span></a>Authors
	</h2>

	<p>Joomla musician collaboration was created by Sean Goresht, Nick Valera, and Jobelle Firme for a course at the
		University of Calgary, CPSC 471.</p>

	<h2>
		<a name = "stuff-we-used" class = "anchor" href = "#stuff-we-used"><span class = "mini-icon mini-icon-link"></span></a>Stuff
		We Use(d)</h2>

	<ul>
		<li>Starter component for Joomla 3: <a href = "http://ribafs.org/sites/cursodephp/down/joomla/com_ola_j3.zip">http://ribafs.org/sites/cursodephp/down/joomla/com_ola_j3.zip</a>
		</li>
		<li>Sublime Text 2</li>
		<li>JetBrains PHPStorm</li>
		<li>AMPPS</li>
		<li>PostGreSQL</li>
		<li>PGAdmin III</li>
	</ul>
	<h2>
		<a name = "license" class = "anchor" href = "#license"><span class = "mini-icon mini-icon-link"></span></a>License
	</h2>

	<p>Licensed under the GNU General Public License. You may freely redistribute this project, but please include the
		header information about us, the original authors. Thanks :)</p></article>
<?php
}
else
{

	jimport('joomla.application.component.controller');

	// Create the controller
	$controller = JControllerLegacy::getInstance('JCollaborator');

	// Perform the Request task
	$controller->execute(JRequest::getCmd('task'));

	// Redirect if set by the controller
	$controller->redirect();
}

?>