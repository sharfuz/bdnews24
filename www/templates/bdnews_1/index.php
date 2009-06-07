<?php
// no direct access
defined( '_JEXEC' ) or die( 'Restricted index access' );
define( 'YOURBASEPATH', dirname(__FILE__) );
require( YOURBASEPATH.DS."rt_styleswitcher.php");
JHTML::_( 'behavior.mootools' );
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" >
	<head>
<jdoc:include type="head" />
	<?php
	$live_site        					= $mainframe->getCfg('live_site');
	$default_style    					= $this->params->get("defaultStyle", "style1");
	$template_width   					= $this->params->get("templateWidth", "966"); 
	$sidebar_width						= $this->params->get("sidebarWidth", "250");
	$sidebar_side     					= $this->params->get("sidebarSide", "right");
	$menu_name       	 				= $this->params->get("menuName", "mainmenu");
	$menu_type        					= $this->params->get("menuType", "moomenu");
	$default_font     					= $this->params->get("defaultFont", "default");
    $show_breadcrumbs 					= ($this->params->get("showBreadcrumbs", 0)  == 0)?"false":"true";
	$show_fontbuttons 					= ($this->params->get("showFontbuttons", 1)  == 0)?"false":"true";
    $show_moduleslider 					= ($this->params->get("showModuleslider", 1)  == 0)?"false":"true";
    $enable_pngfix 				        = ($this->params->get("enablePngfix", 1)  == 0)?"false":"true";

	// moomenu options
	$moo_bgiframe     					= ($this->params->get("moo_bgiframe'","0") == 0)?"false":"true";
	$moo_delay       					= $this->params->get("moo_delay", "500");
	$moo_duration    					= $this->params->get("moo_duration", "400");
	$moo_fps          					= $this->params->get("moo_fps", "100");
	$moo_transition   					= $this->params->get("moo_transition", "Expo.easeOut");	

	// rokzoom options
	$enable_rokzoom   					= ($this->params->get("enableRokzoom", 1)  == 0)?"false":"true";
	$zoom_resize_duration     			= $this->params->get("zoom_resize_duration", "700");
	$zoom_opacity_duration     			= $this->params->get("zoom_opacity_duration", "500");
	$zoom_transition   			  		= $this->params->get("zoom_transition", "Cubic.easeOut");
	
	// module title for moduleslider
	$module_slider_height 				= $this->params->get("moduleSliderHeight", 200);
	$max_mods_per_row					= $this->params->get("maxModsPerRow", 3);
	$ms_title1							= $this->params->get("msTitle1", "Group 1 Tab");	
	$ms_title2							= $this->params->get("msTitle2", "Group 2 Tab");	
	$ms_title3							= $this->params->get("msTitle3", "Group 3 Tab");	
	$ms_title4							= $this->params->get("msTitle4", "Group 4 Tab");	
	$ms_title5							= $this->params->get("msTitle5", "Group 5 Tab");		
	$ms_module1							= $this->params->get("msModule1", "user12");		
	$ms_module2							= $this->params->get("msModule2", "user13");			
	$ms_module3							= $this->params->get("msModule3", "user14");			
	$ms_module4							= $this->params->get("msModule4", "user15");			
	$ms_module5							= $this->params->get("msModule5", "user16");

	require(YOURBASEPATH .DS."rt_styleloader.php");
	require(YOURBASEPATH .DS."rt_tabmodules.php");
	require(YOURBASEPATH .DS."rt_utils.php");
	
	
	?>
	<link rel="shortcut icon" href="<?php echo $this->baseurl; ?>/images/favicon.ico" />
	<?php if($mtype=="moomenu" or $mtype=="suckerfish") :?>
	<link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/css/rokmoomenu.css" rel="stylesheet" type="text/css" />
	<?php endif; ?>
	<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/system/css/system.css" type="text/css" />
	<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/system/css/general.css" type="text/css" />
	<link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/css/template.css" rel="stylesheet" type="text/css" />
	<link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/css/<?php echo $tstyle; ?>.css" rel="stylesheet" type="text/css" />
	<?php if($enable_rokzoom=="true") :?>
	<link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/rokzoom/rokzoom.css" rel="stylesheet" type="text/css" />
	<?php endif; ?>
	<link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/rokzoom/template_ko.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		div.wrapper { <?php echo $template_width; ?>padding:0;}
		td.sidecol { width: <?php echo $sidebar_width; ?>px;}
	</style>	
	<?php if (rok_isIe7()) :?>
	<!--[if IE 7]>
	<link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/css/template_ie7.css" rel="stylesheet" type="text/css" />	
	<![endif]-->	
	<?php endif; ?>
	<?php if (rok_isIe6()) :?>
	<!--[if lte IE 6]>
	<link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/css/template_ie6.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
	<?php if($enable_pngfix=="true") : ?>
	img { behavior: url(<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/css/iepngfix.htc); } 
	<?php endif; ?>
	</style>
	<![endif]-->
	<?php endif; ?>
	<?php if($enable_rokzoom=="true") :?>
	<script type="text/javascript" src="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/rokzoom/rokzoom.js"></script>
	<?php endif; ?>
	<?php if($mtype=="moomenu") :?>
	<script type="text/javascript" src="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/js/rokmoomenu.js"></script>
	<script type="text/javascript" src="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/js/mootools.bgiframe.js"></script>
	<script type="text/javascript">
	window.addEvent('domready', function() {
		new Rokmoomenu($E('ul.menutop'), {
			bgiframe: false,
			delay: 500,
			animate: {
				props: ['opacity'],
				opts: {
					duration:600,
					fps: 100,
					transition: Fx.Transitions.Quad.easeOut
				}
			}
		});
	});
	</script>
	<?php endif; ?>	
	<?php if($mtype=="suckerfish" or $mtype=="splitmenu") :
		echo "<!--[if IE]>\n";		
		echo "<script type=\"text/javascript\" src=\"" . $this->baseurl . "/templates/" . $this->template . "/js/ie_suckerfish.js\"></script>\n";
		echo "<![endif]-->\n";
	endif; ?>	
	<?php if($enable_rokzoom=="true") :?>
	<script type="text/javascript">
		window.addEvent('load', function() {
			RokZoom.init({
				imageDir: '<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/rokzoom/images/',
				resizeFX: {
					duration: 700,
					transition: Fx.Transitions.Cubic.easeOut,
					wait: true
				},
				opacityFX: {
					duration: 500,
					wait: false	
				}
			});
		});
	</script>
	<?php endif; ?>
	</head>
	<body class="<?php echo $fontstyle; ?> <?php echo $tstyle; ?>">
		<!-- start header bar -->
		<?php if ($this->countModules('newsflash') or $this->countModules('top')) : ?>
			<div id="header-bar">
				<div class="wrapper">
					<div id="newsflash-module">
						<jdoc:include type="modules" name="newsflash" style="none" />
					</div>
					<div id="mod-login">
						<jdoc:include type="modules" name="top" style="none" />
					</div>
				</div>
			</div>
			
			<?php if ($this->countModules('pagepeel')) : ?>
			    <div style="position: absolute; top: 0; right: 0;">
			    	<jdoc:include type="modules" name="pagepeel" style="none" />
			    </div>
			<?php endif; ?>			
			
			<div class="clr"></div>
		<?php endif; ?>	
		<!-- end header bar -->
		<!-- start logo area -->
		<div class="wrapper">
			<div id="header">
				<a href="<?php echo $this->baseurl;?>" class="nounder"><img src="<?php echo $this->baseurl;?>/images/blank.png" border="0" alt="" id="logo" /></a>
				<div id="banner" align="right">
					<jdoc:include type="modules" name="banner" style="none" />
				</div>
			</div>
		</div>
		<!-- end logo area -->
		<!-- start overall frame -->
		<div class="wrapper">
			<div id="mainpage">
				<div class="right">
					<div id="mainpage2">
						<div id="mainpage3">
							<!-- start menu bar -->
							<?php //if ($show_fontbuttons == "true") : ?>
							<!-- <div id="accessibility">
								<div id="buttons">
								<a href="<?php echo $thisurl; ?>fontstyle=f-larger" title="Increase size" class="large"><span class="button">&nbsp;</span></a>
			  					<a href="<?php echo $thisurl; ?>fontstyle=f-default" title="Default size" class="default"><span class="button">&nbsp;</span></a>
			  					<a href="<?php echo $thisurl; ?>fontstyle=f-smaller" title="Decrease size" class="small"><span class="button">&nbsp;</span></a>
								</div>
							</div> -->
							<?php //endif; ?>	
							<div id="horiz-menu" class="<?php echo $mtype; ?>">
								<?php if($mtype != "module") :
									echo $mainnav;
								else: ?>
									<jdoc:include type="modules" name="toolbar" style="none" />
						    	<?php endif; ?>	
							</div>
							<!-- end menu bar -->
							<!-- start main content -->
							<div id="main-content">
								<div class="bottom-left">
									<div id="main-content2">
										<div id="main-content3">
											<table class="mainbody" border="0" cellspacing="0" cellpadding="0">
												<tr valign="top">
													<!-- when side column is on the left -->
													<?php if ($sidebar_side=="left" and ($this->countModules('left') or ($subnav))) : ?>
														<td class="sidecol">
															<div class="sameheight">
																<div id="sidecol-top">
																	<div id="sidecol-top2">
																	</div>
																</div>
																<?php if ($this->countModules('search')) : ?>
																	<div id="mod-search">
																		<jdoc:include type="modules" name="search" style="xhtml" />
																	</div>
																<?php endif; ?>
																<?php if($subnav) : ?>
																	<div id="sub-menu">
																		<?php echo $subnav; ?>
																	</div>
																<?php endif; ?>
																<jdoc:include type="modules" name="left" style="rounded" />
															</div>
															<div id="sidecol-bottom">
																<div id="sidecol-bottom2">
																</div>
															</div>
														</td>
													<?php endif; ?>
													<!-- end side column -->
													<!-- start main column -->
													<td class="maincol">
														<div id="maincol">
															<div id="referencewidth" class="sameheight">
																<div class="padding">
																	<?php if ($show_breadcrumbs == "true") : ?>
					                                                     <jdoc:include type="module" name="breadcrumbs" style="none" />
				                                                    <?php endif; ?>
																	<jdoc:include type="message" />
																	<jdoc:include type="component" />
																	<jdoc:include type="modules" name="ad_1" style="none" />
																	<?php if ($this->countModules('user1') or $this->countModules('user2') or $this->countModules('user3')) : ?>
																		<div id="headlinemodules" class="spacer<?php echo $headlinemod_width; ?>">
																			<?php if ($this->countModules('user1')) : ?>
																				<div class="block">
																					<jdoc:include type="modules" name="user1" style="xhtml" />
																				</div>
																			<?php endif; ?>
																			<?php if ($this->countModules('user2')) : ?>
																				<div class="block">
																					<jdoc:include type="modules" name="user2" style="xhtml" />
																				</div>
																			<?php endif; ?>
																			<?php if ($this->countModules('user3')) : ?>
																				<div class="block">
																					<jdoc:include type="modules" name="user3" style="xhtml" />
																				</div>
																			<?php endif; ?>
																		</div>
																	<?php endif; ?>
																	<jdoc:include type="modules" name="ad_2" style="none" />
																</div>
																<?php if ($this->countModules('advert1')) : ?>
																	<jdoc:include type="modules" name="advert1" style="rounded" />
																<?php endif; ?>
																<div class="padding"><jdoc:include type="modules" name="ad_3" style="none" /></div>
																<?php if ($this->countModules('advert2') or $this->countModules('advert3')) : ?>
																	<div id="morenews">
																		<div id="morenews2">
																			<div id="morenews3">
																				<div id="morenews4">
																					<span class="morenews-header">And in other news</span>
																					<div id="morenews-modules" class="spacer<?php echo $morenews_width; ?>">
																						<?php if ($this->countModules('advert2')) : ?>
																							<div class="block">
																								<div class="divider">
																									<jdoc:include type="modules" name="advert2" style="xhtml" />
																								</div>
																							</div>
																						<?php endif; ?>
																						<?php if ($this->countModules('advert3')) : ?>
																							<div class="block">
																								<jdoc:include type="modules" name="advert3" style="xhtml" />
																							</div>
																						<?php endif; ?>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																<?php endif; ?>
																<div class="padding"><jdoc:include type="modules" name="ad_4" style="none" /></div>
																<?php if ($this->countModules('user4') or $this->countModules('user5')) : ?>
																	<div id="newsblock2" class="spacer<?php echo $newsblock2_width; ?>">
																		<?php if ($this->countModules('user4')) : ?>
																			<div class="block">
																				<jdoc:include type="modules" name="user4" style="rounded" />
																			</div>
																		<?php endif; ?>
																		<?php if ($this->countModules('user5')) : ?>
																			<div class="block">
																				<jdoc:include type="modules" name="user5" style="rounded" />
																			</div>
																		<?php endif; ?>
																	</div>
																<?php endif; ?>
																<div class="padding"><jdoc:include type="modules" name="ad_5" style="none" /></div>
																<?php if ($this->countModules('user6') or $this->countModules('user7') or $this->countModules('user8')) : ?>
																	<div id="newsblock3" class="spacer<?php echo $newsblock3_width; ?>">
																		<?php if ($this->countModules('user6')) : ?>
																			<div class="block">
																				<jdoc:include type="modules" name="user6" style="rounded" />
																			</div>
																		<?php endif; ?>
																		<?php if ($this->countModules('user7')) : ?>
																			<div class="block">
																				<jdoc:include type="modules" name="user7" style="rounded" />
																			</div>
																		<?php endif; ?>
																		<?php if ($this->countModules('user8')) : ?>
																			<div class="block">
																				<jdoc:include type="modules" name="user8" style="rounded" />
																			</div>
																		<?php endif; ?>
																	</div>
																<?php endif; ?>
																<div class="padding"><jdoc:include type="modules" name="ad_6" style="none" /></div>
																<?php if ($show_moduleslider=="true" and ($this->countModules('user12') or $this->countModules('user13') 
																or $this->countModules('user14') or $this->countModules('user15') or $this->countModules('user16'))) : ?>
																<div id="moduleslider-size">
																	<?php displayTabs($this); ?>
																</div>
															<?php endif; ?>
															<div class="padding"><jdoc:include type="modules" name="ad_7" style="none" /></div>
														</div>
													</div>
												</td>
												<!-- end main column -->
												<!-- when side column is on the right -->
												<td>   foo bar    </td>
												
												<?php if ($sidebar_side=="right" and ($this->countModules('right') or ($subnav))) : ?>
													<td class="sidecol">
														<div class="sameheight">
															<div id="sidecol-top">
																<div id="sidecol-top2">
																</div>
															</div>
															<?php if ($this->countModules('search')) : ?>
																<div id="mod-search">
																	<jdoc:include type="modules" name="search" style="xhtml" />
																</div>
															<?php endif; ?>
															<?php if($subnav) : ?>
																<div id="sub-menu">
																	<?php echo $subnav; ?>
																</div>
															<?php endif; ?>
															<jdoc:include type="modules" name="right" style="rounded" />
															<?php /* if ($this->countModules('banner2')) : ?>
																<div align="center">
																	<jdoc:include type="modules" name="banner2" style="rounded" />
																</div>
															<?php endif; */ ?>
														</div>
														<div id="sidecol-bottom">
															<div id="sidecol-bottom2">
															</div>
														</div>
													</td>
												<?php endif; ?>
												<!-- end side column -->
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- end main content -->
						<!-- start bottom modules -->
						<?php if ($this->countModules('user9') or $this->countModules('user10') or $this->countModules('user11')) : ?>
							<div id="bottom-modules-top">
								<div class="top-left">
									<div class="middle">
									</div>
								</div>
							</div>
							<div id="bottom-modules">
								<div class="right">
									<div id="bottommods" class="spacer<?php echo $bottommods_width; ?>">
										<?php if ($this->countModules('user9')) : ?>
											<div class="block">
												<jdoc:include type="modules" name="user9" style="xhtml" />
											</div>
										<?php endif; ?>
										<?php if ($this->countModules('user10')) : ?>
											<div class="block">
												<jdoc:include type="modules" name="user10" style="xhtml" />
											</div>
										<?php endif; ?>
										<?php if ($this->countModules('user11')) : ?>
											<div class="block">
												<jdoc:include type="modules" name="user11" style="xhtml" />
											</div>
										<?php endif; ?>
									</div>
								</div>
							</div>
							<div id="bottom-modules-bottom">
								<div class="bottom-left">
									<div class="middle">
									</div>
								</div>
							</div>
						<?php endif; ?>
						<!-- end bottom modules -->
						<!-- start footer -->
						<div align="center">
							<a href="http://www.kodiva.com/" title="Knowledge Development & Innovation" class="nounder"><img src="<?php echo $this->baseurl;?>/templates/<?php echo $this->template; ?>/images/blank.gif" border="0" alt="www.kodiva.com" id="rocket" /></a>
						</div>
						<!-- end footer -->
						<div id="mainpage-bottom">
							<div class="right">
								<div class="left">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end overall frame -->
    <script type="text/javascript" src="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template?>/js/roksameheight.js"></script>
</body>
</html>