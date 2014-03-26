api = 2
core = 7.x

; omega8.cc core
projects[drupal][type] = "core"
projects[drupal][download][type] = "get"
projects[drupal][download][url] = "http://files.aegir.cc/core/drupal-7.26.1.tar.gz"
projects[drupal][patch][tableheaders][url] = "https://drupal.org/files/2097081-fix-sticky-header-column-width-7.x-6.patch"
projects[drupal][patch][tableheaders][md5] = "df41415bf45413a51d618946f0fb1e6b"

projects[esdportal_profile][type] = profile
projects[esdportal_profile][download][type] = git
projects[esdportal_profile][download][url] = https://github.com/ESDet/esdportal_profile.git
projects[esdportal_profile][download][branch] = "3681-webform_localization"
