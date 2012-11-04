<?php
// no direct access
defined('_JEXEC') or die;
jimport("joomla.filesystem.file");
?>
<div class="row">
	<aside class="sidebar fourcol">
		<?php if (JFile::exists($this->getUserImagePath())) {?>
		<div class="profile-pic centred box">
			<img src = "<?php echo $this->getUserImagePath(); ?>" alt = "<?php echo $this.getUserName
			();?>">
		</div>
	<?php /*end if statement */ }
		else {
			?>
			<div class="profile-pic centred">
				<div class="well">
					<i class="icon-user full" data-rel = "tooltip" data-original-title = "No profile pic
					available"></i>
				</div>
			</div>
		<?php }?>
		<div class="user-summary">
			<details class = "box">
				<summary>
					<h1><?php echo $this->getUserSummaryTitle(); ?></h1>
				</summary>
				<?php echo $this->getUserSummary(); ?>
			</details>
		</div>
	</aside>
	<article class="eightcol last">
		<menu type = "list" class = "btn-toolbar toolbar-pin-right">
			<li><i class = "icon-twitter action"></i></li>
			<li><i class = "icon-github-2 action"></i></li>
			<li><i class = "icon-file-add action"></i></li>
		</menu>
		<section class="track-updates">
			<div class="row">
<?php foreach ($this->getUserTracks() as $track)
{
	?>
	<div class="eightcol">
		<?php $track->showPlayer(); ?>
	</div>
		<div class="onecol">
			<a href = "#" class = "show-version-control-details"><i class = "circle-icon icon-arrow-down-2"></i></a>
		</div>
			<div class="threecol last">
				<menu class = "social-toolbar" type = "list">
					<li><a href = "#"><i class = "icon-facebook-2"></i></a></li>
					<li><a href = "#"><i class = "icon-twitter"></i></a></li>
					<li><a href = "#"><i class = "icon-star"></i></a></li>
				</menu>
			</div>
				</div>
					<div class="row">
						<div class="track-changes">
							<?php echo $this->getTrackChanges(); ?>
						</div>
					</div>
	<?php
}
				?>
			</div>
	<div class="row">
		<div class="twelvecol last">
			<h1 class="title centred"><?php echo $this->getCurrentTracksTitle ?></h1>
<?php foreach ($this->getUserTracks() as $track) { ?>
	<a class = "circle-icon" href = "#"><i class = "icon-track"></i></a>
	<?php } ?>
		</div>
	</div>
		</section>
	</article>
</div>