portal.excellentschoolsdetroit.org install profile
==================================================

Use this Drupal Install Profile to build portal.excellentschoolsdetroit.org.

About
-----

This install profile builds a Drupal 7 website that provides Excellent Schools Detroit with data warehousing for its staff and constituents, as well as a publicly accessible data API.

Build
-----

```shell
drush make --working-copy https://raw.github.com/bnchdrff/esdportal_profile/master/distro.make DEST_DIR
```

Configure
---------

The install profile will download the migrate_esdportal module, which includes a preconfigured migrate routine for school taxonomy terms via CSV. Enable this module so you can run the Schools data import.

To set up the Schools migrate importer source, place the schools CSV file somewhere reachable by your PHP webserver process, and modify [this line](https://github.com/bnchdrff/migrate_esdportal/blob/7.x-1.x/migrate_esdportal.migrate.inc#L45) with the correct path.

To set up the d2d migrate importer source, create a new database in the MySQL server and dump in an export of the live portal db.

The migrate_d2d imports for user and school_profile nodes need to be manually configured at admin/content/migrate/new/migrated2dwizard.

After setting up the sources for schools terms CSV and the migrate_d2d database and field mappings, run the imports like this:

```shell
drush mreg
drush mi Schools
drush mi --group ExcellentSchoolsDetroitPortal # name of the d2d group
```

When the import is complete, use views_bulk_operations to run the following PHP snippets on all school_profile nodes:

```php
$query = db_select('taxonomy_term_data', 't');
$query->fields('t',array('tid'));
$query->condition('name', $entity->title, '=');
$school_tid = $query->execute()->fetchField();
$entity->field_school['und'][0]['tid'] = $school_tid;
node_save($entity);
```

For data sources, see [this Work Dept internal issue](https://pm.theworkdept.com/issues/3057).

Credits
-------

Benjamin Chodoroff, theworkdept.com

License
-------

Copyright 2013, Benjamin Chodoroff. This software is distributed under the terms of the GNU General Public License.
