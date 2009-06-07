<?php // no direct access
defined('_JEXEC') or die('Restricted access'); ?>
<?php if($type == 'logout') : ?>
<form action="index.php" method="post" name="login" id="form-login">
<?php if ($params->get('greeting')) : ?>
	<span class="greeting"><?php echo JText::sprintf( 'HINAME', $user->get('name') ); ?></span>
<?php endif; ?>
	<a href="javascript:document.login.submit();"><span class="logoutsubmit"><span><?php echo JText::_( 'BUTTON_LOGOUT'); ?></span></span></a>
	<input type="hidden" name="option" value="com_user" />
	<input type="hidden" name="task" value="logout" />
	<input type="hidden" name="return" value="<?php echo $return; ?>" />
</form>
<?php else : ?>
<?php if(JPluginHelper::isEnabled('authentication', 'openid')) : ?>
	<?php JHTML::_('script', 'openid.js'); ?>
<?php endif; ?>
<form action="<?php echo JRoute::_( 'index.php', true, $params->get('usesecure')); ?>" method="post" name="login" id="form-login" >
	<?php echo $params->get('pretext'); ?>
		<div class="loginelement">
			<label for="modlgn_username"><?php echo JText::_( 'Username' ); ?></label>
			<input id="modlgn_username" type="text" name="username" class="inputbox" alt="username" size="10" />
		</div>
		<div class="loginelement">
			<label for="modlgn_passwd"><?php echo JText::_( 'Password' ); ?></label>
			<input id="modlgn_passwd" type="password" name="passwd" class="inputbox" size="10" alt="password" />
		</div>
		<a href="javascript:document.login.submit();" class="nounder"><span class="loginsubmit"><?php echo JText::_( 'BUTTON_LOGIN'); ?></span></a>
		<!-- uncomment these links if you need them
		<ul>
			<li>
				<a href="<?php echo JRoute::_( 'index.php?option=com_user&view=reset' ); ?>">
				<?php echo JText::_('FORGOT_YOUR_PASSWORD'); ?>
				</a>
			</li>
			<li>
				<a href="<?php echo JRoute::_( 'index.php?option=com_user&view=remind' ); ?>">
				<?php echo JText::_('FORGOT_YOUR_USERNAME'); ?>
				</a>
			</li>
		</ul>			
		-->
		<?php
		$usersConfig = &JComponentHelper::getParams( 'com_users' );
		if ($usersConfig->get('allowUserRegistration')) : ?>
		<div class="loginelement">
		
				<a href="<?php echo JRoute::_( 'index.php?option=com_user&task=register' ); ?>">
				<?php echo JText::_('REGISTER'); ?>
				</a>
			</div>	
		<?php endif; ?>

	<?php echo $params->get('posttext'); ?>

	<input type="hidden" name="remember" value="yes" />
	<input type="hidden" name="option" value="com_user" />
	<input type="hidden" name="task" value="login" />
	<input type="hidden" name="return" value="<?php echo $return; ?>" />
	<?php echo JHTML::_( 'form.token' ); ?>
</form>
<?php endif; ?>
