<?php

define('ESDPORTAL_SITE_NAME', $_SERVER['SERVER_NAME']);

/**
 * Implements hook_form_alter().
 *
 * Allows the profile to alter the site configuration form.
 */
function esdportal_profile_form_install_configure_form_alter(&$form, $form_state) {
  $form['site_information']['site_name']['#default_value'] = ESDPORTAL_SITE_NAME;
  $form['site_information']['site_mail']['#default_value'] = 'ben@theworkdept.com';

  $form['admin_account']['account']['name']['#default_value'] = 'admin';
  $form['admin_account']['account']['mail']['#default_value'] = 'ben@theworkdept.com';

  $form['update_notifications']['update_status_module']['#default_value'][0] = 0;
  $form['update_notifications']['update_status_module']['#default_value'][1] = 0;
}
