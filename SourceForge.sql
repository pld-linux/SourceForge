# MySQL dump 8.10
#
# Host: localhost    Database: sourceforge
#--------------------------------------------------------
# Server version	3.23.25-beta

#
# Table structure for table 'activity_log'
#

CREATE TABLE activity_log (
  day int(11) DEFAULT '0' NOT NULL,
  hour int(11) DEFAULT '0' NOT NULL,
  group_id int(11) DEFAULT '0' NOT NULL,
  browser varchar(8) DEFAULT 'OTHER' NOT NULL,
  ver float(10,2) DEFAULT '0.00' NOT NULL,
  platform varchar(8) DEFAULT 'OTHER' NOT NULL,
  time int(11) DEFAULT '0' NOT NULL,
  page text,
  type int(11) DEFAULT '0' NOT NULL
);

#
# Dumping data for table 'activity_log'
#


#
# Table structure for table 'activity_log_old'
#

CREATE TABLE activity_log_old (
  day int(11) DEFAULT '0' NOT NULL,
  hour int(11) DEFAULT '0' NOT NULL,
  group_id int(11) DEFAULT '0' NOT NULL,
  browser varchar(8) DEFAULT 'OTHER' NOT NULL,
  ver float(10,2) DEFAULT '0.00' NOT NULL,
  platform varchar(8) DEFAULT 'OTHER' NOT NULL,
  time int(11) DEFAULT '0' NOT NULL,
  page text,
  type int(11) DEFAULT '0' NOT NULL
);

#
# Dumping data for table 'activity_log_old'
#


#
# Table structure for table 'activity_log_old_old'
#

CREATE TABLE activity_log_old_old (
  day int(11) DEFAULT '0' NOT NULL,
  hour int(11) DEFAULT '0' NOT NULL,
  group_id int(11) DEFAULT '0' NOT NULL,
  browser varchar(8) DEFAULT 'OTHER' NOT NULL,
  ver float(10,2) DEFAULT '0.00' NOT NULL,
  platform varchar(8) DEFAULT 'OTHER' NOT NULL,
  time int(11) DEFAULT '0' NOT NULL,
  page text,
  type int(11) DEFAULT '0' NOT NULL
);

#
# Dumping data for table 'activity_log_old_old'
#


#
# Table structure for table 'bug'
#

CREATE TABLE bug (
  bug_id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  status_id int(11) DEFAULT '0' NOT NULL,
  priority int(11) DEFAULT '0' NOT NULL,
  category_id int(11) DEFAULT '0' NOT NULL,
  submitted_by int(11) DEFAULT '0' NOT NULL,
  assigned_to int(11) DEFAULT '0' NOT NULL,
  date int(11) DEFAULT '0' NOT NULL,
  summary text,
  details text,
  close_date int(11),
  bug_group_id int(11) DEFAULT '0' NOT NULL,
  resolution_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (bug_id),
  KEY idx_bug_group_id (group_id)
);

#
# Dumping data for table 'bug'
#

INSERT INTO bug VALUES (100,1,100,0,100,100,100,0,NULL,NULL,NULL,100,100);

#
# Table structure for table 'bug_bug_dependencies'
#

CREATE TABLE bug_bug_dependencies (
  bug_depend_id int(11) NOT NULL auto_increment,
  bug_id int(11) DEFAULT '0' NOT NULL,
  is_dependent_on_bug_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (bug_depend_id),
  KEY idx_bug_bug_dependencies_bug_id (bug_id),
  KEY idx_bug_bug_is_dependent_on_task_id (is_dependent_on_bug_id)
);

#
# Dumping data for table 'bug_bug_dependencies'
#


#
# Table structure for table 'bug_canned_responses'
#

CREATE TABLE bug_canned_responses (
  bug_canned_id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  title text,
  body text,
  PRIMARY KEY (bug_canned_id),
  KEY idx_bug_canned_response_group_id (group_id)
);

#
# Dumping data for table 'bug_canned_responses'
#


#
# Table structure for table 'bug_category'
#

CREATE TABLE bug_category (
  bug_category_id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  category_name text,
  PRIMARY KEY (bug_category_id),
  KEY idx_bug_category_group_id (group_id)
);

#
# Dumping data for table 'bug_category'
#

INSERT INTO bug_category VALUES (100,1,'None');

#
# Table structure for table 'bug_filter'
#

CREATE TABLE bug_filter (
  filter_id int(11) NOT NULL auto_increment,
  user_id int(11) DEFAULT '0' NOT NULL,
  group_id int(11) DEFAULT '0' NOT NULL,
  sql_clause text DEFAULT '' NOT NULL,
  is_active int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (filter_id)
);

#
# Dumping data for table 'bug_filter'
#


#
# Table structure for table 'bug_group'
#

CREATE TABLE bug_group (
  bug_group_id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  group_name text DEFAULT '' NOT NULL,
  PRIMARY KEY (bug_group_id),
  KEY idx_bug_group_group_id (group_id)
);

#
# Dumping data for table 'bug_group'
#

INSERT INTO bug_group VALUES (100,1,'None');

#
# Table structure for table 'bug_history'
#

CREATE TABLE bug_history (
  bug_history_id int(11) NOT NULL auto_increment,
  bug_id int(11) DEFAULT '0' NOT NULL,
  field_name text DEFAULT '' NOT NULL,
  old_value text DEFAULT '' NOT NULL,
  mod_by int(11) DEFAULT '0' NOT NULL,
  date int(11),
  PRIMARY KEY (bug_history_id),
  KEY idx_bug_history_bug_id (bug_id)
);

#
# Dumping data for table 'bug_history'
#


#
# Table structure for table 'bug_resolution'
#

CREATE TABLE bug_resolution (
  resolution_id int(11) NOT NULL auto_increment,
  resolution_name text DEFAULT '' NOT NULL,
  PRIMARY KEY (resolution_id)
);

#
# Dumping data for table 'bug_resolution'
#

INSERT INTO bug_resolution VALUES (1,'Fixed');
INSERT INTO bug_resolution VALUES (2,'Invalid');
INSERT INTO bug_resolution VALUES (3,'Wont Fix');
INSERT INTO bug_resolution VALUES (4,'Later');
INSERT INTO bug_resolution VALUES (5,'Remind');
INSERT INTO bug_resolution VALUES (6,'Works For Me');
INSERT INTO bug_resolution VALUES (100,'None');
INSERT INTO bug_resolution VALUES (101,'Duplicate');

#
# Table structure for table 'bug_status'
#

CREATE TABLE bug_status (
  status_id int(11) NOT NULL auto_increment,
  status_name text,
  PRIMARY KEY (status_id)
);

#
# Dumping data for table 'bug_status'
#

INSERT INTO bug_status VALUES (1,'Open');
INSERT INTO bug_status VALUES (3,'Closed');
INSERT INTO bug_status VALUES (100,'None');

#
# Table structure for table 'bug_task_dependencies'
#

CREATE TABLE bug_task_dependencies (
  bug_depend_id int(11) NOT NULL auto_increment,
  bug_id int(11) DEFAULT '0' NOT NULL,
  is_dependent_on_task_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (bug_depend_id),
  KEY idx_bug_task_dependencies_bug_id (bug_id),
  KEY idx_bug_task_is_dependent_on_task_id (is_dependent_on_task_id)
);

#
# Dumping data for table 'bug_task_dependencies'
#


#
# Table structure for table 'canned_responses'
#

CREATE TABLE canned_responses (
  response_id int(11) NOT NULL auto_increment,
  response_title varchar(25),
  response_text text,
  PRIMARY KEY (response_id)
);

#
# Dumping data for table 'canned_responses'
#


#
# Table structure for table 'db_images'
#

CREATE TABLE db_images (
  id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  description text DEFAULT '' NOT NULL,
  bin_data longblob DEFAULT '' NOT NULL,
  filename text DEFAULT '' NOT NULL,
  filesize int(11) DEFAULT '0' NOT NULL,
  filetype text DEFAULT '' NOT NULL,
  width int(11) DEFAULT '0' NOT NULL,
  height int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (id),
  KEY idx_db_images_group (group_id)
);

#
# Dumping data for table 'db_images'
#


#
# Table structure for table 'doc_data'
#

CREATE TABLE doc_data (
  docid int(11) NOT NULL auto_increment,
  stateid int(11) DEFAULT '0' NOT NULL,
  title varchar(255) DEFAULT '' NOT NULL,
  data text DEFAULT '' NOT NULL,
  updatedate int(11) DEFAULT '0' NOT NULL,
  createdate int(11) DEFAULT '0' NOT NULL,
  created_by int(11) DEFAULT '0' NOT NULL,
  doc_group int(11) DEFAULT '0' NOT NULL,
  description text,
  language_id int(11) DEFAULT '1' NOT NULL,
  PRIMARY KEY (docid),
  KEY idx_doc_group_doc_group (doc_group)
);

#
# Dumping data for table 'doc_data'
#


#
# Table structure for table 'doc_groups'
#

CREATE TABLE doc_groups (
  doc_group int(12) NOT NULL auto_increment,
  groupname varchar(255) DEFAULT '' NOT NULL,
  group_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (doc_group),
  KEY idx_doc_groups_group (group_id)
);

#
# Dumping data for table 'doc_groups'
#

INSERT INTO doc_groups VALUES (793,'About SourceForge',1);
INSERT INTO doc_groups VALUES (794,'SourceForge Development',1);
INSERT INTO doc_groups VALUES (801,'Account Information',1);
INSERT INTO doc_groups VALUES (802,'CVS - General Information',1);
INSERT INTO doc_groups VALUES (803,'CVS - OS Specific Information',1);
INSERT INTO doc_groups VALUES (804,'Database Information',1);
INSERT INTO doc_groups VALUES (805,'General Documentation',1);
INSERT INTO doc_groups VALUES (806,'Project Administration',1);
INSERT INTO doc_groups VALUES (807,'Translated Documentation',1);
INSERT INTO doc_groups VALUES (808,'Website Hosting Information',1);

#
# Table structure for table 'doc_states'
#

CREATE TABLE doc_states (
  stateid int(11) NOT NULL auto_increment,
  name varchar(255) DEFAULT '' NOT NULL,
  PRIMARY KEY (stateid)
);

#
# Dumping data for table 'doc_states'
#

INSERT INTO doc_states VALUES (1,'active');
INSERT INTO doc_states VALUES (2,'deleted');
INSERT INTO doc_states VALUES (3,'pending');
INSERT INTO doc_states VALUES (4,'hidden');
INSERT INTO doc_states VALUES (5,'private');

#
# Table structure for table 'filemodule_monitor'
#

CREATE TABLE filemodule_monitor (
  filemodule_id int(11) DEFAULT '0' NOT NULL,
  user_id int(11) DEFAULT '0' NOT NULL,
  KEY idx_filemodule_monitor_id (filemodule_id)
);

#
# Dumping data for table 'filemodule_monitor'
#


#
# Table structure for table 'forum'
#

CREATE TABLE forum (
  msg_id int(11) NOT NULL auto_increment,
  group_forum_id int(11) DEFAULT '0' NOT NULL,
  posted_by int(11) DEFAULT '0' NOT NULL,
  subject text DEFAULT '' NOT NULL,
  body text DEFAULT '' NOT NULL,
  date int(11) DEFAULT '0' NOT NULL,
  is_followup_to int(11) DEFAULT '0' NOT NULL,
  thread_id int(11) DEFAULT '0' NOT NULL,
  has_followups int(11) DEFAULT '0',
  most_recent_date int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (msg_id),
  KEY idx_forum_group_forum_id (group_forum_id),
  KEY idx_forum_thread_id (thread_id),
  KEY forum_forumid_isfollowupto (group_forum_id,is_followup_to),
  KEY forum_forumid_isfollto_mostrecentdate (group_forum_id,is_followup_to,most_recent_date),
  KEY forum_forumid_msgid (group_forum_id,msg_id),
  KEY forum_threadid_isfollowupto (thread_id,is_followup_to)
);

#
# Dumping data for table 'forum'
#

INSERT INTO forum VALUES (1,1,100,'Welcome to Open Discussion','Welcome to Open Discussion',974405311,0,1,0,0);
INSERT INTO forum VALUES (2,2,100,'Welcome to Help','Welcome to Help',974405311,0,2,0,0);
INSERT INTO forum VALUES (3,3,100,'Welcome to Developers','Welcome to Developers',974405311,0,3,0,0);

#
# Table structure for table 'forum_agg_msg_count'
#

CREATE TABLE forum_agg_msg_count (
  group_forum_id int(11) DEFAULT '0' NOT NULL,
  count int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (group_forum_id)
);

#
# Dumping data for table 'forum_agg_msg_count'
#


#
# Table structure for table 'forum_group_list'
#

CREATE TABLE forum_group_list (
  group_forum_id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  forum_name text DEFAULT '' NOT NULL,
  is_public int(11) DEFAULT '0' NOT NULL,
  description text,
  allow_anonymous int(11) DEFAULT '0' NOT NULL,
  send_all_posts_to text,
  PRIMARY KEY (group_forum_id),
  KEY idx_forum_group_list_group_id (group_id)
);

#
# Dumping data for table 'forum_group_list'
#

INSERT INTO forum_group_list VALUES (1,2,'Open Discussion',1,'',0,NULL);
INSERT INTO forum_group_list VALUES (2,2,'Help',1,'',0,NULL);
INSERT INTO forum_group_list VALUES (3,2,'Developers',0,'',0,NULL);

#
# Table structure for table 'forum_monitored_forums'
#

CREATE TABLE forum_monitored_forums (
  monitor_id int(11) NOT NULL auto_increment,
  forum_id int(11) DEFAULT '0' NOT NULL,
  user_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (monitor_id),
  KEY idx_forum_monitor_thread_id (forum_id),
  KEY idx_forum_monitor_combo_id (forum_id,user_id)
);

#
# Dumping data for table 'forum_monitored_forums'
#


#
# Table structure for table 'forum_saved_place'
#

CREATE TABLE forum_saved_place (
  saved_place_id int(11) NOT NULL auto_increment,
  user_id int(11) DEFAULT '0' NOT NULL,
  forum_id int(11) DEFAULT '0' NOT NULL,
  save_date int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (saved_place_id)
);

#
# Dumping data for table 'forum_saved_place'
#


#
# Table structure for table 'forum_thread_id'
#

CREATE TABLE forum_thread_id (
  thread_id int(11) NOT NULL auto_increment,
  PRIMARY KEY (thread_id)
);

#
# Dumping data for table 'forum_thread_id'
#

INSERT INTO forum_thread_id VALUES (1);
INSERT INTO forum_thread_id VALUES (2);
INSERT INTO forum_thread_id VALUES (3);

#
# Table structure for table 'foundry_data'
#

CREATE TABLE foundry_data (
  foundry_id int(11) NOT NULL auto_increment,
  freeform1_html text,
  freeform2_html text,
  sponsor1_html text,
  sponsor2_html text,
  guide_image_id int(11) DEFAULT '0' NOT NULL,
  logo_image_id int(11) DEFAULT '0' NOT NULL,
  trove_categories text,
  PRIMARY KEY (foundry_id)
);

#
# Dumping data for table 'foundry_data'
#


#
# Table structure for table 'foundry_news'
#

CREATE TABLE foundry_news (
  foundry_news_id int(11) NOT NULL auto_increment,
  foundry_id int(11) DEFAULT '0' NOT NULL,
  news_id int(11) DEFAULT '0' NOT NULL,
  approve_date int(11) DEFAULT '0' NOT NULL,
  is_approved int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (foundry_news_id),
  KEY idx_foundry_news_foundry (foundry_id),
  KEY idx_foundry_news_foundry_approved_date (foundry_id,is_approved,approve_date),
  KEY idx_foundry_news_foundry_approved (foundry_id,is_approved)
);

#
# Dumping data for table 'foundry_news'
#


#
# Table structure for table 'foundry_preferred_projects'
#

CREATE TABLE foundry_preferred_projects (
  foundry_project_id int(11) NOT NULL auto_increment,
  foundry_id int(11) DEFAULT '0' NOT NULL,
  group_id int(11) DEFAULT '0' NOT NULL,
  rank int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (foundry_project_id),
  KEY idx_foundry_project_group (group_id),
  KEY idx_foundry_project_group_rank (group_id,rank)
);

#
# Dumping data for table 'foundry_preferred_projects'
#


#
# Table structure for table 'foundry_projects'
#

CREATE TABLE foundry_projects (
  id int(11) NOT NULL auto_increment,
  foundry_id int(11) DEFAULT '0' NOT NULL,
  project_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (id),
  KEY idx_foundry_projects_foundry (foundry_id)
);

#
# Dumping data for table 'foundry_projects'
#


#
# Table structure for table 'frs_dlstats_agg'
#

CREATE TABLE frs_dlstats_agg (
  file_id int(11) DEFAULT '0' NOT NULL,
  day int(11) DEFAULT '0' NOT NULL,
  downloads_http int(11) DEFAULT '0' NOT NULL,
  downloads_ftp int(11) DEFAULT '0' NOT NULL,
  KEY file_id_idx (file_id),
  KEY day_idx (day),
  KEY downloads_http_idx (downloads_http),
  KEY downloads_ftp_idx (downloads_ftp)
);

#
# Dumping data for table 'frs_dlstats_agg'
#


#
# Table structure for table 'frs_dlstats_file_agg'
#

CREATE TABLE frs_dlstats_file_agg (
  file_id int(11) DEFAULT '0' NOT NULL,
  day int(11) DEFAULT '0' NOT NULL,
  downloads int(11) DEFAULT '0' NOT NULL,
  KEY idx_dlstats_file_file_id (file_id),
  KEY idx_dlstats_file_day (day),
  KEY idx_dlstats_file_down (downloads)
);

#
# Dumping data for table 'frs_dlstats_file_agg'
#


#
# Table structure for table 'frs_dlstats_filetotal_agg'
#

CREATE TABLE frs_dlstats_filetotal_agg (
  file_id int(11) DEFAULT '0' NOT NULL,
  downloads int(11) DEFAULT '0' NOT NULL,
  KEY idx_stats_agr_tmp_fid (file_id)
);

#
# Dumping data for table 'frs_dlstats_filetotal_agg'
#


#
# Table structure for table 'frs_dlstats_filetotal_agg_old'
#

CREATE TABLE frs_dlstats_filetotal_agg_old (
  file_id int(11) DEFAULT '0' NOT NULL,
  downloads int(11) DEFAULT '0' NOT NULL,
  KEY idx_stats_agr_tmp_fid (file_id)
);

#
# Dumping data for table 'frs_dlstats_filetotal_agg_old'
#


#
# Table structure for table 'frs_dlstats_group_agg'
#

CREATE TABLE frs_dlstats_group_agg (
  group_id int(11) DEFAULT '0' NOT NULL,
  day int(11) DEFAULT '0' NOT NULL,
  downloads int(11) DEFAULT '0' NOT NULL,
  KEY group_id_idx (group_id),
  KEY day_idx (day),
  KEY downloads_idx (downloads)
);

#
# Dumping data for table 'frs_dlstats_group_agg'
#


#
# Table structure for table 'frs_dlstats_grouptotal_agg'
#

CREATE TABLE frs_dlstats_grouptotal_agg (
  group_id int(11) DEFAULT '0' NOT NULL,
  downloads int(11) DEFAULT '0' NOT NULL,
  KEY idx_stats_agr_tmp_gid (group_id)
);

#
# Dumping data for table 'frs_dlstats_grouptotal_agg'
#


#
# Table structure for table 'frs_file'
#

CREATE TABLE frs_file (
  file_id int(11) NOT NULL auto_increment,
  filename text,
  release_id int(11) DEFAULT '0' NOT NULL,
  type_id int(11) DEFAULT '0' NOT NULL,
  processor_id int(11) DEFAULT '0' NOT NULL,
  release_time int(11) DEFAULT '0' NOT NULL,
  file_size int(11) DEFAULT '0' NOT NULL,
  post_date int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (file_id),
  KEY idx_frs_file_release_id (release_id),
  KEY idx_frs_file_type (type_id),
  KEY idx_frs_file_date (post_date),
  KEY idx_frs_file_processor (processor_id),
  KEY idx_frs_file_name (filename(45))
);

#
# Dumping data for table 'frs_file'
#


#
# Table structure for table 'frs_filetype'
#

CREATE TABLE frs_filetype (
  type_id int(11) NOT NULL auto_increment,
  name text,
  PRIMARY KEY (type_id)
);

#
# Dumping data for table 'frs_filetype'
#

INSERT INTO frs_filetype VALUES (1000,'.deb');
INSERT INTO frs_filetype VALUES (2000,'.rpm');
INSERT INTO frs_filetype VALUES (3000,'.zip');
INSERT INTO frs_filetype VALUES (3001,'.bz2');
INSERT INTO frs_filetype VALUES (3002,'.gz');
INSERT INTO frs_filetype VALUES (5000,'Source .zip');
INSERT INTO frs_filetype VALUES (5001,'Source .bz2');
INSERT INTO frs_filetype VALUES (5002,'Source .gz');
INSERT INTO frs_filetype VALUES (5100,'Source .rpm');
INSERT INTO frs_filetype VALUES (5900,'Other Source File');
INSERT INTO frs_filetype VALUES (8000,'.jpg');
INSERT INTO frs_filetype VALUES (8001,'text');
INSERT INTO frs_filetype VALUES (8002,'html');
INSERT INTO frs_filetype VALUES (8003,'pdf');
INSERT INTO frs_filetype VALUES (9999,'Other');

#
# Table structure for table 'frs_package'
#

CREATE TABLE frs_package (
  package_id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  name text,
  status_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (package_id),
  KEY idx_package_group_id (group_id)
);

#
# Dumping data for table 'frs_package'
#


#
# Table structure for table 'frs_processor'
#

CREATE TABLE frs_processor (
  processor_id int(11) NOT NULL auto_increment,
  name text,
  PRIMARY KEY (processor_id)
);

#
# Dumping data for table 'frs_processor'
#

INSERT INTO frs_processor VALUES (1000,'i386');
INSERT INTO frs_processor VALUES (6000,'IA64');
INSERT INTO frs_processor VALUES (7000,'Alpha');
INSERT INTO frs_processor VALUES (8000,'Any');
INSERT INTO frs_processor VALUES (2000,'PPC');
INSERT INTO frs_processor VALUES (3000,'MIPS');
INSERT INTO frs_processor VALUES (4000,'Sparc');
INSERT INTO frs_processor VALUES (5000,'UltraSparc');
INSERT INTO frs_processor VALUES (9999,'Other');

#
# Table structure for table 'frs_release'
#

CREATE TABLE frs_release (
  release_id int(11) NOT NULL auto_increment,
  package_id int(11) DEFAULT '0' NOT NULL,
  name text,
  notes text,
  changes text,
  status_id int(11) DEFAULT '0' NOT NULL,
  preformatted int(11) DEFAULT '0' NOT NULL,
  release_date int(11) DEFAULT '0' NOT NULL,
  released_by int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (release_id),
  KEY idx_frs_release_by (released_by),
  KEY idx_frs_release_date (release_date),
  KEY idx_frs_release_package (package_id)
);

#
# Dumping data for table 'frs_release'
#


#
# Table structure for table 'frs_status'
#

CREATE TABLE frs_status (
  status_id int(11) NOT NULL auto_increment,
  name text,
  PRIMARY KEY (status_id)
);

#
# Dumping data for table 'frs_status'
#

INSERT INTO frs_status VALUES (1,'Active');
INSERT INTO frs_status VALUES (3,'Hidden');

#
# Table structure for table 'group_cvs_history'
#

CREATE TABLE group_cvs_history (
  group_id int(11) DEFAULT '0' NOT NULL,
  user_name varchar(80) DEFAULT '' NOT NULL,
  cvs_commits int(11) DEFAULT '0' NOT NULL,
  cvs_commits_wk int(11) DEFAULT '0' NOT NULL,
  cvs_adds int(11) DEFAULT '0' NOT NULL,
  cvs_adds_wk int(11) DEFAULT '0' NOT NULL,
  KEY group_id_idx (group_id),
  KEY user_name_idx (user_name)
);

#
# Dumping data for table 'group_cvs_history'
#


#
# Table structure for table 'group_history'
#

CREATE TABLE group_history (
  group_history_id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  field_name text DEFAULT '' NOT NULL,
  old_value text DEFAULT '' NOT NULL,
  mod_by int(11) DEFAULT '0' NOT NULL,
  date int(11),
  PRIMARY KEY (group_history_id),
  KEY idx_group_history_group_id (group_id)
);

#
# Dumping data for table 'group_history'
#


#
# Table structure for table 'group_type'
#

CREATE TABLE group_type (
  type_id int(11) NOT NULL auto_increment,
  name text,
  PRIMARY KEY (type_id)
);

#
# Dumping data for table 'group_type'
#

INSERT INTO group_type VALUES (1,'Project');
INSERT INTO group_type VALUES (2,'Foundry');

#
# Table structure for table 'groups'
#

CREATE TABLE groups (
  group_id int(11) NOT NULL auto_increment,
  group_name varchar(40),
  homepage varchar(128),
  is_public int(11) DEFAULT '0' NOT NULL,
  status char(1) DEFAULT 'A' NOT NULL,
  unix_group_name varchar(30) DEFAULT '' NOT NULL,
  unix_box varchar(20) DEFAULT 'shell1' NOT NULL,
  http_domain varchar(80),
  short_description varchar(255),
  cvs_box varchar(20) DEFAULT 'cvs1' NOT NULL,
  license varchar(16),
  register_purpose text,
  license_other text,
  register_time int(11) DEFAULT '0' NOT NULL,
  use_bugs int(11) DEFAULT '1' NOT NULL,
  rand_hash text,
  use_mail int(11) DEFAULT '1' NOT NULL,
  use_survey int(11) DEFAULT '1' NOT NULL,
  use_patch int(11) DEFAULT '1' NOT NULL,
  use_forum int(11) DEFAULT '1' NOT NULL,
  use_pm int(11) DEFAULT '1' NOT NULL,
  use_cvs int(11) DEFAULT '1' NOT NULL,
  use_news int(11) DEFAULT '1' NOT NULL,
  use_support int(11) DEFAULT '1' NOT NULL,
  new_bug_address text DEFAULT '' NOT NULL,
  new_patch_address text DEFAULT '' NOT NULL,
  new_support_address text DEFAULT '' NOT NULL,
  type int(11) DEFAULT '1' NOT NULL,
  use_docman int(11) DEFAULT '1' NOT NULL,
  send_all_bugs int(11) DEFAULT '0' NOT NULL,
  send_all_patches int(11) DEFAULT '0' NOT NULL,
  send_all_support int(11) DEFAULT '0' NOT NULL,
  new_task_address text DEFAULT '' NOT NULL,
  send_all_tasks int(11) DEFAULT '0' NOT NULL,
  use_bug_depend_box int(11) DEFAULT '1' NOT NULL,
  use_pm_depend_box int(11) DEFAULT '1' NOT NULL,
  PRIMARY KEY (group_id),
  KEY idx_groups_status (status),
  KEY idx_groups_public (is_public),
  KEY idx_groups_unix (unix_group_name),
  KEY idx_groups_type (type)
);

#
# Dumping data for table 'groups'
#

#
# Table structure for table 'intel_agreement'
#

CREATE TABLE intel_agreement (
  user_id int(11) DEFAULT '0' NOT NULL,
  message text,
  is_approved int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (user_id)
);

#
# Dumping data for table 'intel_agreement'
#


#
# Table structure for table 'mail_group_list'
#

CREATE TABLE mail_group_list (
  group_list_id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  list_name text,
  is_public int(11) DEFAULT '0' NOT NULL,
  password varchar(16),
  list_admin int(11) DEFAULT '0' NOT NULL,
  status int(11) DEFAULT '0' NOT NULL,
  description text,
  PRIMARY KEY (group_list_id),
  KEY idx_mail_group_list_group (group_id)
);

#
# Dumping data for table 'mail_group_list'
#


#
# Table structure for table 'news_bytes'
#

CREATE TABLE news_bytes (
  id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  submitted_by int(11) DEFAULT '0' NOT NULL,
  is_approved int(11) DEFAULT '0' NOT NULL,
  date int(11) DEFAULT '0' NOT NULL,
  forum_id int(11) DEFAULT '0' NOT NULL,
  summary text,
  details text,
  PRIMARY KEY (id),
  KEY idx_news_bytes_forum (forum_id),
  KEY idx_news_bytes_group (group_id),
  KEY idx_news_bytes_approved (is_approved)
);

#
# Dumping data for table 'news_bytes'
#


#
# Table structure for table 'patch'
#

CREATE TABLE patch (
  patch_id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  patch_status_id int(11) DEFAULT '0' NOT NULL,
  patch_category_id int(11) DEFAULT '0' NOT NULL,
  submitted_by int(11) DEFAULT '0' NOT NULL,
  assigned_to int(11) DEFAULT '0' NOT NULL,
  open_date int(11) DEFAULT '0' NOT NULL,
  summary text,
  code mediumtext,
  close_date int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (patch_id),
  KEY idx_patch_group_id (group_id)
);

#
# Dumping data for table 'patch'
#

INSERT INTO patch VALUES (1,1,100,100,100,100,0,NULL,NULL,0);

#
# Table structure for table 'patch_category'
#

CREATE TABLE patch_category (
  patch_category_id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  category_name text DEFAULT '' NOT NULL,
  PRIMARY KEY (patch_category_id),
  KEY idx_patch_group_group_id (group_id)
);

#
# Dumping data for table 'patch_category'
#

INSERT INTO patch_category VALUES (100,1,'None');

#
# Table structure for table 'patch_history'
#

CREATE TABLE patch_history (
  patch_history_id int(11) NOT NULL auto_increment,
  patch_id int(11) DEFAULT '0' NOT NULL,
  field_name text DEFAULT '' NOT NULL,
  old_value text DEFAULT '' NOT NULL,
  mod_by int(11) DEFAULT '0' NOT NULL,
  date int(11),
  PRIMARY KEY (patch_history_id),
  KEY idx_patch_history_patch_id (patch_id)
);

#
# Dumping data for table 'patch_history'
#


#
# Table structure for table 'patch_status'
#

CREATE TABLE patch_status (
  patch_status_id int(11) NOT NULL auto_increment,
  status_name text,
  PRIMARY KEY (patch_status_id)
);

#
# Dumping data for table 'patch_status'
#

INSERT INTO patch_status VALUES (1,'Open');
INSERT INTO patch_status VALUES (2,'Closed');
INSERT INTO patch_status VALUES (3,'Deleted');
INSERT INTO patch_status VALUES (4,'Postponed');
INSERT INTO patch_status VALUES (100,'None');

#
# Table structure for table 'people_job'
#

CREATE TABLE people_job (
  job_id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  created_by int(11) DEFAULT '0' NOT NULL,
  title text,
  description text,
  date int(11) DEFAULT '0' NOT NULL,
  status_id int(11) DEFAULT '0' NOT NULL,
  category_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (job_id)
);

#
# Dumping data for table 'people_job'
#


#
# Table structure for table 'people_job_category'
#

CREATE TABLE people_job_category (
  category_id int(11) NOT NULL auto_increment,
  name text,
  PRIMARY KEY (category_id)
);

#
# Dumping data for table 'people_job_category'
#

INSERT INTO people_job_category VALUES (1,'Developer');
INSERT INTO people_job_category VALUES (2,'Project Manager');
INSERT INTO people_job_category VALUES (3,'Unix Admin');
INSERT INTO people_job_category VALUES (4,'Doc Writer');
INSERT INTO people_job_category VALUES (5,'Tester');
INSERT INTO people_job_category VALUES (6,'Support Manager');
INSERT INTO people_job_category VALUES (7,'Graphic/Other Designer');

#
# Table structure for table 'people_job_inventory'
#

CREATE TABLE people_job_inventory (
  job_inventory_id int(11) NOT NULL auto_increment,
  job_id int(11) DEFAULT '0' NOT NULL,
  skill_id int(11) DEFAULT '0' NOT NULL,
  skill_level_id int(11) DEFAULT '0' NOT NULL,
  skill_year_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (job_inventory_id)
);

#
# Dumping data for table 'people_job_inventory'
#


#
# Table structure for table 'people_job_status'
#

CREATE TABLE people_job_status (
  status_id int(11) NOT NULL auto_increment,
  name text,
  PRIMARY KEY (status_id)
);

#
# Dumping data for table 'people_job_status'
#

INSERT INTO people_job_status VALUES (1,'Open');
INSERT INTO people_job_status VALUES (2,'Filled');
INSERT INTO people_job_status VALUES (3,'Deleted');

#
# Table structure for table 'people_skill'
#

CREATE TABLE people_skill (
  skill_id int(11) NOT NULL auto_increment,
  name text,
  PRIMARY KEY (skill_id)
);

#
# Dumping data for table 'people_skill'
#


#
# Table structure for table 'people_skill_inventory'
#

CREATE TABLE people_skill_inventory (
  skill_inventory_id int(11) NOT NULL auto_increment,
  user_id int(11) DEFAULT '0' NOT NULL,
  skill_id int(11) DEFAULT '0' NOT NULL,
  skill_level_id int(11) DEFAULT '0' NOT NULL,
  skill_year_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (skill_inventory_id)
);

#
# Dumping data for table 'people_skill_inventory'
#


#
# Table structure for table 'people_skill_level'
#

CREATE TABLE people_skill_level (
  skill_level_id int(11) NOT NULL auto_increment,
  name text,
  PRIMARY KEY (skill_level_id)
);

#
# Dumping data for table 'people_skill_level'
#

INSERT INTO people_skill_level VALUES (1,'Want to Learn');
INSERT INTO people_skill_level VALUES (2,'Competent');
INSERT INTO people_skill_level VALUES (3,'Wizard');
INSERT INTO people_skill_level VALUES (4,'Wrote The Book');
INSERT INTO people_skill_level VALUES (5,'Wrote It');

#
# Table structure for table 'people_skill_year'
#

CREATE TABLE people_skill_year (
  skill_year_id int(11) NOT NULL auto_increment,
  name text,
  PRIMARY KEY (skill_year_id)
);

#
# Dumping data for table 'people_skill_year'
#

INSERT INTO people_skill_year VALUES (1,'< 6 Months');
INSERT INTO people_skill_year VALUES (2,'6 Mo - 2 yr');
INSERT INTO people_skill_year VALUES (3,'2 yr - 5 yr');
INSERT INTO people_skill_year VALUES (4,'5 yr - 10 yr');
INSERT INTO people_skill_year VALUES (5,'> 10 years');

#
# Table structure for table 'project_assigned_to'
#

CREATE TABLE project_assigned_to (
  project_assigned_id int(11) NOT NULL auto_increment,
  project_task_id int(11) DEFAULT '0' NOT NULL,
  assigned_to_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (project_assigned_id),
  KEY idx_project_assigned_to_task_id (project_task_id),
  KEY idx_project_assigned_to_assigned_to (assigned_to_id)
);

#
# Dumping data for table 'project_assigned_to'
#


#
# Table structure for table 'project_counts_tmp'
#

CREATE TABLE project_counts_tmp (
  group_id int(11),
  type text,
  count float(8,5)
);

#
# Dumping data for table 'project_counts_tmp'
#


#
# Table structure for table 'project_counts_weekly_tmp'
#

CREATE TABLE project_counts_weekly_tmp (
  group_id int(11),
  type text,
  count float(8,5)
);

#
# Dumping data for table 'project_counts_weekly_tmp'
#


#
# Table structure for table 'project_dependencies'
#

CREATE TABLE project_dependencies (
  project_depend_id int(11) NOT NULL auto_increment,
  project_task_id int(11) DEFAULT '0' NOT NULL,
  is_dependent_on_task_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (project_depend_id),
  KEY idx_project_dependencies_task_id (project_task_id),
  KEY idx_project_is_dependent_on_task_id (is_dependent_on_task_id)
);

#
# Dumping data for table 'project_dependencies'
#


#
# Table structure for table 'project_group_list'
#

CREATE TABLE project_group_list (
  group_project_id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  project_name text DEFAULT '' NOT NULL,
  is_public int(11) DEFAULT '0' NOT NULL,
  description text,
  PRIMARY KEY (group_project_id),
  KEY idx_project_group_list_group_id (group_id)
);

#
# Dumping data for table 'project_group_list'
#

INSERT INTO project_group_list VALUES (1,1,'',0,NULL);

#
# Table structure for table 'project_history'
#

CREATE TABLE project_history (
  project_history_id int(11) NOT NULL auto_increment,
  project_task_id int(11) DEFAULT '0' NOT NULL,
  field_name text DEFAULT '' NOT NULL,
  old_value text DEFAULT '' NOT NULL,
  mod_by int(11) DEFAULT '0' NOT NULL,
  date int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (project_history_id),
  KEY idx_project_history_task_id (project_task_id)
);

#
# Dumping data for table 'project_history'
#


#
# Table structure for table 'project_metric'
#

CREATE TABLE project_metric (
  ranking int(11) NOT NULL auto_increment,
  percentile float(8,2),
  group_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (ranking),
  KEY idx_project_metric_group (group_id)
);

#
# Dumping data for table 'project_metric'
#


#
# Table structure for table 'project_metric_tmp1'
#

CREATE TABLE project_metric_tmp1 (
  ranking int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  value float(8,5),
  PRIMARY KEY (ranking)
);

#
# Dumping data for table 'project_metric_tmp1'
#


#
# Table structure for table 'project_metric_weekly_tmp1'
#

CREATE TABLE project_metric_weekly_tmp1 (
  ranking int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  value float(8,5),
  PRIMARY KEY (ranking)
);

#
# Dumping data for table 'project_metric_weekly_tmp1'
#


#
# Table structure for table 'project_status'
#

CREATE TABLE project_status (
  status_id int(11) NOT NULL auto_increment,
  status_name text DEFAULT '' NOT NULL,
  PRIMARY KEY (status_id)
);

#
# Dumping data for table 'project_status'
#

INSERT INTO project_status VALUES (1,'Open');
INSERT INTO project_status VALUES (2,'Closed');
INSERT INTO project_status VALUES (100,'None');
INSERT INTO project_status VALUES (3,'Deleted');

#
# Table structure for table 'project_task'
#

CREATE TABLE project_task (
  project_task_id int(11) NOT NULL auto_increment,
  group_project_id int(11) DEFAULT '0' NOT NULL,
  summary text DEFAULT '' NOT NULL,
  details text DEFAULT '' NOT NULL,
  percent_complete int(11) DEFAULT '0' NOT NULL,
  priority int(11) DEFAULT '0' NOT NULL,
  hours float(10,2) DEFAULT '0.00' NOT NULL,
  start_date int(11) DEFAULT '0' NOT NULL,
  end_date int(11) DEFAULT '0' NOT NULL,
  created_by int(11) DEFAULT '0' NOT NULL,
  status_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (project_task_id),
  KEY idx_project_task_group_project_id (group_project_id)
);

#
# Dumping data for table 'project_task'
#

INSERT INTO project_task VALUES (1,1,'','',0,0,0.00,0,0,100,100);

#
# Table structure for table 'project_weekly_metric'
#

CREATE TABLE project_weekly_metric (
  ranking int(11) NOT NULL auto_increment,
  percentile float(8,2),
  group_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (ranking),
  KEY idx_project_metric_weekly_group (group_id)
);

#
# Dumping data for table 'project_weekly_metric'
#


#
# Table structure for table 'session'
#

CREATE TABLE session (
  user_id int(11) DEFAULT '0' NOT NULL,
  session_hash char(32) DEFAULT '' NOT NULL,
  ip_addr char(15) DEFAULT '' NOT NULL,
  time int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (session_hash),
  KEY idx_session_user_id (user_id),
  KEY time_idx (time),
  KEY idx_session_time (time)
);

#
# Dumping data for table 'session'
#

#
# Table structure for table 'snippet'
#

CREATE TABLE snippet (
  snippet_id int(11) NOT NULL auto_increment,
  created_by int(11) DEFAULT '0' NOT NULL,
  name text,
  description text,
  type int(11) DEFAULT '0' NOT NULL,
  language int(11) DEFAULT '0' NOT NULL,
  license text DEFAULT '' NOT NULL,
  category int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (snippet_id),
  KEY idx_snippet_language (language),
  KEY idx_snippet_category (category)
);

#
# Dumping data for table 'snippet'
#


#
# Table structure for table 'snippet_package'
#

CREATE TABLE snippet_package (
  snippet_package_id int(11) NOT NULL auto_increment,
  created_by int(11) DEFAULT '0' NOT NULL,
  name text,
  description text,
  category int(11) DEFAULT '0' NOT NULL,
  language int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (snippet_package_id),
  KEY idx_snippet_package_language (language),
  KEY idx_snippet_package_category (category)
);

#
# Dumping data for table 'snippet_package'
#


#
# Table structure for table 'snippet_package_item'
#

CREATE TABLE snippet_package_item (
  snippet_package_item_id int(11) NOT NULL auto_increment,
  snippet_package_version_id int(11) DEFAULT '0' NOT NULL,
  snippet_version_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (snippet_package_item_id),
  KEY idx_snippet_package_item_pkg_ver (snippet_package_version_id)
);

#
# Dumping data for table 'snippet_package_item'
#


#
# Table structure for table 'snippet_package_version'
#

CREATE TABLE snippet_package_version (
  snippet_package_version_id int(11) NOT NULL auto_increment,
  snippet_package_id int(11) DEFAULT '0' NOT NULL,
  changes text,
  version text,
  submitted_by int(11) DEFAULT '0' NOT NULL,
  date int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (snippet_package_version_id),
  KEY idx_snippet_package_version_pkg_id (snippet_package_id)
);

#
# Dumping data for table 'snippet_package_version'
#


#
# Table structure for table 'snippet_version'
#

CREATE TABLE snippet_version (
  snippet_version_id int(11) NOT NULL auto_increment,
  snippet_id int(11) DEFAULT '0' NOT NULL,
  changes text,
  version text,
  submitted_by int(11) DEFAULT '0' NOT NULL,
  date int(11) DEFAULT '0' NOT NULL,
  code text,
  PRIMARY KEY (snippet_version_id),
  KEY idx_snippet_version_snippet_id (snippet_id)
);

#
# Dumping data for table 'snippet_version'
#


#
# Table structure for table 'stats_agg_logo_by_day'
#

CREATE TABLE stats_agg_logo_by_day (
  day int(11),
  count int(11)
);

#
# Dumping data for table 'stats_agg_logo_by_day'
#


#
# Table structure for table 'stats_agg_logo_by_group'
#

CREATE TABLE stats_agg_logo_by_group (
  day int(11),
  group_id int(11),
  count int(11)
);

#
# Dumping data for table 'stats_agg_logo_by_group'
#


#
# Table structure for table 'stats_agg_pages_by_browser'
#

CREATE TABLE stats_agg_pages_by_browser (
  browser varchar(8),
  count int(11)
);

#
# Dumping data for table 'stats_agg_pages_by_browser'
#


#
# Table structure for table 'stats_agg_pages_by_day'
#

CREATE TABLE stats_agg_pages_by_day (
  day int(11) DEFAULT '0' NOT NULL,
  count int(11) DEFAULT '0' NOT NULL,
  KEY idx_pages_by_day_day (day)
);

#
# Dumping data for table 'stats_agg_pages_by_day'
#


#
# Table structure for table 'stats_agg_pages_by_day_old'
#

CREATE TABLE stats_agg_pages_by_day_old (
  day int(11),
  count int(11)
);

#
# Dumping data for table 'stats_agg_pages_by_day_old'
#


#
# Table structure for table 'stats_agg_site_by_day'
#

CREATE TABLE stats_agg_site_by_day (
  day int(11) DEFAULT '0' NOT NULL,
  count int(11) DEFAULT '0' NOT NULL
);

#
# Dumping data for table 'stats_agg_site_by_day'
#


#
# Table structure for table 'stats_agg_site_by_group'
#

CREATE TABLE stats_agg_site_by_group (
  day int(11) DEFAULT '0' NOT NULL,
  group_id int(11) DEFAULT '0' NOT NULL,
  count int(11) DEFAULT '0' NOT NULL
);

#
# Dumping data for table 'stats_agg_site_by_group'
#


#
# Table structure for table 'stats_agr_filerelease'
#

CREATE TABLE stats_agr_filerelease (
  filerelease_id int(11) DEFAULT '0' NOT NULL,
  group_id int(11) DEFAULT '0' NOT NULL,
  downloads int(11) DEFAULT '0' NOT NULL,
  KEY idx_stats_agr_tmp_fid (filerelease_id),
  KEY idx_stats_agr_tmp_gid (group_id)
);

#
# Dumping data for table 'stats_agr_filerelease'
#


#
# Table structure for table 'stats_agr_project'
#

CREATE TABLE stats_agr_project (
  group_id int(11) DEFAULT '0' NOT NULL,
  group_ranking int(11) DEFAULT '0' NOT NULL,
  group_metric float(8,5) DEFAULT '0.00000' NOT NULL,
  developers smallint(6) DEFAULT '0' NOT NULL,
  file_releases smallint(6) DEFAULT '0' NOT NULL,
  downloads int(11) DEFAULT '0' NOT NULL,
  site_views int(11) DEFAULT '0' NOT NULL,
  logo_views int(11) DEFAULT '0' NOT NULL,
  msg_posted smallint(6) DEFAULT '0' NOT NULL,
  msg_uniq_auth smallint(6) DEFAULT '0' NOT NULL,
  bugs_opened smallint(6) DEFAULT '0' NOT NULL,
  bugs_closed smallint(6) DEFAULT '0' NOT NULL,
  support_opened smallint(6) DEFAULT '0' NOT NULL,
  support_closed smallint(6) DEFAULT '0' NOT NULL,
  patches_opened smallint(6) DEFAULT '0' NOT NULL,
  patches_closed smallint(6) DEFAULT '0' NOT NULL,
  tasks_opened smallint(6) DEFAULT '0' NOT NULL,
  tasks_closed smallint(6) DEFAULT '0' NOT NULL,
  help_requests smallint(6) DEFAULT '0' NOT NULL,
  cvs_checkouts smallint(6) DEFAULT '0' NOT NULL,
  cvs_commits smallint(6) DEFAULT '0' NOT NULL,
  cvs_adds smallint(6) DEFAULT '0' NOT NULL,
  KEY idx_project_agr_log_group (group_id)
);

#
# Dumping data for table 'stats_agr_project'
#


#
# Table structure for table 'stats_ftp_downloads'
#

CREATE TABLE stats_ftp_downloads (
  day int(11) DEFAULT '0' NOT NULL,
  filerelease_id int(11) DEFAULT '0' NOT NULL,
  group_id int(11) DEFAULT '0' NOT NULL,
  downloads int(11) DEFAULT '0' NOT NULL,
  KEY idx_ftpdl_day (day),
  KEY idx_ftpdl_fid (filerelease_id),
  KEY idx_ftpdl_group_id (group_id)
);

#
# Dumping data for table 'stats_ftp_downloads'
#


#
# Table structure for table 'stats_http_downloads'
#

CREATE TABLE stats_http_downloads (
  day int(11) DEFAULT '0' NOT NULL,
  filerelease_id int(11) DEFAULT '0' NOT NULL,
  group_id int(11) DEFAULT '0' NOT NULL,
  downloads int(11) DEFAULT '0' NOT NULL,
  KEY idx_httpdl_day (day),
  KEY idx_httpdl_fid (filerelease_id),
  KEY idx_httpdl_group_id (group_id)
);

#
# Dumping data for table 'stats_http_downloads'
#


#
# Table structure for table 'stats_project'
#

CREATE TABLE stats_project (
  month int(11) DEFAULT '0' NOT NULL,
  week int(11) DEFAULT '0' NOT NULL,
  day int(11) DEFAULT '0' NOT NULL,
  group_id int(11) DEFAULT '0' NOT NULL,
  group_ranking int(11) DEFAULT '0' NOT NULL,
  group_metric float(8,5) DEFAULT '0.00000' NOT NULL,
  developers smallint(6) DEFAULT '0' NOT NULL,
  file_releases smallint(6) DEFAULT '0' NOT NULL,
  downloads int(11) DEFAULT '0' NOT NULL,
  site_views int(11) DEFAULT '0' NOT NULL,
  subdomain_views int(11) DEFAULT '0' NOT NULL,
  msg_posted smallint(6) DEFAULT '0' NOT NULL,
  msg_uniq_auth smallint(6) DEFAULT '0' NOT NULL,
  bugs_opened smallint(6) DEFAULT '0' NOT NULL,
  bugs_closed smallint(6) DEFAULT '0' NOT NULL,
  support_opened smallint(6) DEFAULT '0' NOT NULL,
  support_closed smallint(6) DEFAULT '0' NOT NULL,
  patches_opened smallint(6) DEFAULT '0' NOT NULL,
  patches_closed smallint(6) DEFAULT '0' NOT NULL,
  tasks_opened smallint(6) DEFAULT '0' NOT NULL,
  tasks_closed smallint(6) DEFAULT '0' NOT NULL,
  help_requests smallint(6) DEFAULT '0' NOT NULL,
  cvs_checkouts smallint(6) DEFAULT '0' NOT NULL,
  cvs_commits smallint(6) DEFAULT '0' NOT NULL,
  cvs_adds smallint(6) DEFAULT '0' NOT NULL,
  KEY idx_project_log_group (group_id),
  KEY idx_archive_project_month (month),
  KEY idx_archive_project_week (week),
  KEY idx_archive_project_day (day),
  KEY idx_archive_project_monthday (month,day)
);

#
# Dumping data for table 'stats_project'
#


#
# Table structure for table 'stats_project_tmp'
#

CREATE TABLE stats_project_tmp (
  month int(11) DEFAULT '0' NOT NULL,
  week int(11) DEFAULT '0' NOT NULL,
  day int(11) DEFAULT '0' NOT NULL,
  group_id int(11) DEFAULT '0' NOT NULL,
  group_ranking int(11) DEFAULT '0' NOT NULL,
  group_metric float(8,5) DEFAULT '0.00000' NOT NULL,
  developers smallint(6) DEFAULT '0' NOT NULL,
  file_releases smallint(6) DEFAULT '0' NOT NULL,
  downloads int(11) DEFAULT '0' NOT NULL,
  site_views int(11) DEFAULT '0' NOT NULL,
  subdomain_views int(11) DEFAULT '0' NOT NULL,
  msg_posted smallint(6) DEFAULT '0' NOT NULL,
  msg_uniq_auth smallint(6) DEFAULT '0' NOT NULL,
  bugs_opened smallint(6) DEFAULT '0' NOT NULL,
  bugs_closed smallint(6) DEFAULT '0' NOT NULL,
  support_opened smallint(6) DEFAULT '0' NOT NULL,
  support_closed smallint(6) DEFAULT '0' NOT NULL,
  patches_opened smallint(6) DEFAULT '0' NOT NULL,
  patches_closed smallint(6) DEFAULT '0' NOT NULL,
  tasks_opened smallint(6) DEFAULT '0' NOT NULL,
  tasks_closed smallint(6) DEFAULT '0' NOT NULL,
  help_requests smallint(6) DEFAULT '0' NOT NULL,
  cvs_checkouts smallint(6) DEFAULT '0' NOT NULL,
  cvs_commits smallint(6) DEFAULT '0' NOT NULL,
  cvs_adds smallint(6) DEFAULT '0' NOT NULL,
  KEY idx_project_log_group (group_id),
  KEY idx_project_stats_day (day),
  KEY idx_project_stats_week (week),
  KEY idx_project_stats_month (month)
);

#
# Dumping data for table 'stats_project_tmp'
#


#
# Table structure for table 'stats_site'
#

CREATE TABLE stats_site (
  month int(11) DEFAULT '0' NOT NULL,
  week int(11) DEFAULT '0' NOT NULL,
  day int(11) DEFAULT '0' NOT NULL,
  site_views int(11) DEFAULT '0' NOT NULL,
  subdomain_views int(11) DEFAULT '0' NOT NULL,
  downloads int(11) DEFAULT '0' NOT NULL,
  uniq_users int(11) DEFAULT '0' NOT NULL,
  sessions int(11) DEFAULT '0' NOT NULL,
  total_users int(11) DEFAULT '0' NOT NULL,
  new_users int(11) DEFAULT '0' NOT NULL,
  new_projects int(11) DEFAULT '0' NOT NULL,
  KEY idx_stats_site_month (month),
  KEY idx_stats_site_week (week),
  KEY idx_stats_site_day (day),
  KEY idx_stats_site_monthday (month,day)
);

#
# Dumping data for table 'stats_site'
#


#
# Table structure for table 'support'
#

CREATE TABLE support (
  support_id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  support_status_id int(11) DEFAULT '0' NOT NULL,
  support_category_id int(11) DEFAULT '0' NOT NULL,
  priority int(11) DEFAULT '0' NOT NULL,
  submitted_by int(11) DEFAULT '0' NOT NULL,
  assigned_to int(11) DEFAULT '0' NOT NULL,
  open_date int(11) DEFAULT '0' NOT NULL,
  summary text,
  close_date int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (support_id),
  KEY idx_support_group_id (group_id)
);

#
# Dumping data for table 'support'
#


#
# Table structure for table 'support_canned_responses'
#

CREATE TABLE support_canned_responses (
  support_canned_id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  title text,
  body text,
  PRIMARY KEY (support_canned_id),
  KEY idx_support_canned_response_group_id (group_id)
);

#
# Dumping data for table 'support_canned_responses'
#


#
# Table structure for table 'support_category'
#

CREATE TABLE support_category (
  support_category_id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  category_name text DEFAULT '' NOT NULL,
  PRIMARY KEY (support_category_id),
  KEY idx_support_group_group_id (group_id)
);

#
# Dumping data for table 'support_category'
#

INSERT INTO support_category VALUES (100,1,'None');

#
# Table structure for table 'support_history'
#

CREATE TABLE support_history (
  support_history_id int(11) NOT NULL auto_increment,
  support_id int(11) DEFAULT '0' NOT NULL,
  field_name text DEFAULT '' NOT NULL,
  old_value text DEFAULT '' NOT NULL,
  mod_by int(11) DEFAULT '0' NOT NULL,
  date int(11),
  PRIMARY KEY (support_history_id),
  KEY idx_support_history_support_id (support_id)
);

#
# Dumping data for table 'support_history'
#


#
# Table structure for table 'support_messages'
#

CREATE TABLE support_messages (
  support_message_id int(11) NOT NULL auto_increment,
  support_id int(11) DEFAULT '0' NOT NULL,
  from_email text,
  date int(11) DEFAULT '0' NOT NULL,
  body text,
  PRIMARY KEY (support_message_id),
  KEY idx_support_messages_support_id (support_id)
);

#
# Dumping data for table 'support_messages'
#


#
# Table structure for table 'support_status'
#

CREATE TABLE support_status (
  support_status_id int(11) NOT NULL auto_increment,
  status_name text,
  PRIMARY KEY (support_status_id)
);

#
# Dumping data for table 'support_status'
#

INSERT INTO support_status VALUES (1,'Open');
INSERT INTO support_status VALUES (2,'Closed');
INSERT INTO support_status VALUES (3,'Deleted');

#
# Table structure for table 'supported_languages'
#

CREATE TABLE supported_languages (
  language_id int(11) NOT NULL auto_increment,
  name text,
  filename text,
  classname text,
  language_code char(2),
  PRIMARY KEY (language_id),
  KEY idx_supported_languages_code (language_code)
);

#
# Dumping data for table 'supported_languages'
#

INSERT INTO supported_languages VALUES (1,'English','English.class','English','en');
INSERT INTO supported_languages VALUES (2,'Japanese','Japanese.class','Japanese','ja');
INSERT INTO supported_languages VALUES (3,'Hebrew','Hebrew.class','Hebrew','ir');
INSERT INTO supported_languages VALUES (4,'Spanish','Spanish.class','Spanish','es');
INSERT INTO supported_languages VALUES (5,'Thai','Thai.class','Thai','th');
INSERT INTO supported_languages VALUES (6,'German','German.class','German','de');
INSERT INTO supported_languages VALUES (7,'French','French.class','French','fr');
INSERT INTO supported_languages VALUES (8,'Italian','Italian.class','Italian','it');
INSERT INTO supported_languages VALUES (9,'Norwegian','Norwegian.class','Norwegian','no');
INSERT INTO supported_languages VALUES (10,'Swedish','Swedish.class','Swedish','sv');
INSERT INTO supported_languages VALUES (11,'Chinese','Chinese.class','Chinese','zh');
INSERT INTO supported_languages VALUES (12,'Dutch','Dutch.class','Dutch','nl');
INSERT INTO supported_languages VALUES (13,'Esperanto','Esperanto.class','Esperanto','eo');
INSERT INTO supported_languages VALUES (14,'Catalan','Catalan.class','Catalan','ca');
INSERT INTO supported_languages VALUES (15,'Polish','Polish.class','Polish','pl');
INSERT INTO supported_languages VALUES (16,'Portuguese (Brazillian)','PortugueseBrazillian.class','PortugueseBrazillian','pt');
INSERT INTO supported_languages VALUES (17,'Russian','Russian.class','Russian','ru');
INSERT INTO supported_languages VALUES (18,'Portuguese','Portuguese.class','Portuguese','pt');
INSERT INTO supported_languages VALUES (19,'Greek','Greek.class','Greek','el');
INSERT INTO supported_languages VALUES (20,'Bulgarian','Bulgarian.class','Bulgarian','bg');
INSERT INTO supported_languages VALUES (21,'Indonesian','Indonesian.class','Indonesian','id');

#
# Table structure for table 'survey_question_types'
#

CREATE TABLE survey_question_types (
  id int(11) NOT NULL auto_increment,
  type text DEFAULT '' NOT NULL,
  PRIMARY KEY (id)
);

#
# Dumping data for table 'survey_question_types'
#

INSERT INTO survey_question_types VALUES (1,'Radio Buttons 1-5');
INSERT INTO survey_question_types VALUES (2,'Text Area');
INSERT INTO survey_question_types VALUES (3,'Radio Buttons Yes/No');
INSERT INTO survey_question_types VALUES (4,'Comment Only');
INSERT INTO survey_question_types VALUES (5,'Text Field');
INSERT INTO survey_question_types VALUES (100,'None');

#
# Table structure for table 'survey_questions'
#

CREATE TABLE survey_questions (
  question_id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  question text DEFAULT '' NOT NULL,
  question_type int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (question_id),
  KEY idx_survey_questions_group (group_id)
);

#
# Dumping data for table 'survey_questions'
#


#
# Table structure for table 'survey_rating_aggregate'
#

CREATE TABLE survey_rating_aggregate (
  type int(11) DEFAULT '0' NOT NULL,
  id int(11) DEFAULT '0' NOT NULL,
  response float DEFAULT '0' NOT NULL,
  count int(11) DEFAULT '0' NOT NULL,
  KEY idx_survey_rating_aggregate_type_id (type,id)
);

#
# Dumping data for table 'survey_rating_aggregate'
#


#
# Table structure for table 'survey_rating_response'
#

CREATE TABLE survey_rating_response (
  user_id int(11) DEFAULT '0' NOT NULL,
  type int(11) DEFAULT '0' NOT NULL,
  id int(11) DEFAULT '0' NOT NULL,
  response int(11) DEFAULT '0' NOT NULL,
  date int(11) DEFAULT '0' NOT NULL,
  KEY idx_survey_rating_responses_user_type_id (user_id,type,id),
  KEY idx_survey_rating_responses_type_id (type,id)
);

#
# Dumping data for table 'survey_rating_response'
#


#
# Table structure for table 'survey_responses'
#

CREATE TABLE survey_responses (
  user_id int(11) DEFAULT '0' NOT NULL,
  group_id int(11) DEFAULT '0' NOT NULL,
  survey_id int(11) DEFAULT '0' NOT NULL,
  question_id int(11) DEFAULT '0' NOT NULL,
  response text DEFAULT '' NOT NULL,
  date int(11) DEFAULT '0' NOT NULL,
  KEY idx_survey_responses_user_survey (user_id,survey_id),
  KEY idx_survey_responses_user_survey_question (user_id,survey_id,question_id),
  KEY idx_survey_responses_survey_question (survey_id,question_id),
  KEY idx_survey_responses_group_id (group_id)
);

#
# Dumping data for table 'survey_responses'
#


#
# Table structure for table 'surveys'
#

CREATE TABLE surveys (
  survey_id int(11) NOT NULL auto_increment,
  group_id int(11) DEFAULT '0' NOT NULL,
  survey_title text DEFAULT '' NOT NULL,
  survey_questions text DEFAULT '' NOT NULL,
  is_active int(11) DEFAULT '1' NOT NULL,
  PRIMARY KEY (survey_id),
  KEY idx_surveys_group (group_id)
);

#
# Dumping data for table 'surveys'
#


#
# Table structure for table 'system_history'
#

CREATE TABLE system_history (
  id int(11) NOT NULL auto_increment,
  system_news_id int(11) DEFAULT '0' NOT NULL,
  field_name text,
  old_value text,
  PRIMARY KEY (id)
);

#
# Dumping data for table 'system_history'
#


#
# Table structure for table 'system_machines'
#

CREATE TABLE system_machines (
  id int(11) NOT NULL auto_increment,
  machine_name text,
  description text,
  PRIMARY KEY (id)
);

#
# Dumping data for table 'system_machines'
#


#
# Table structure for table 'system_news'
#

CREATE TABLE system_news (
  id int(11) NOT NULL auto_increment,
  status_id int(11) DEFAULT '0' NOT NULL,
  service_id int(11) DEFAULT '0' NOT NULL,
  machine_id int(11) DEFAULT '0' NOT NULL,
  priority int(11) DEFAULT '0' NOT NULL,
  posted_by int(11) DEFAULT '0' NOT NULL,
  summary text,
  details text,
  PRIMARY KEY (id)
);

#
# Dumping data for table 'system_news'
#


#
# Table structure for table 'system_services'
#

CREATE TABLE system_services (
  id int(11) NOT NULL auto_increment,
  service_name text,
  PRIMARY KEY (id)
);

#
# Dumping data for table 'system_services'
#


#
# Table structure for table 'system_status'
#

CREATE TABLE system_status (
  id int(11) NOT NULL auto_increment,
  status_name text,
  PRIMARY KEY (id)
);

#
# Dumping data for table 'system_status'
#


#
# Table structure for table 'theme_prefs'
#

CREATE TABLE theme_prefs (
  user_id int(11) DEFAULT '0' NOT NULL,
  user_theme int(8) DEFAULT '0' NOT NULL,
  BODY_font char(80) DEFAULT '',
  BODY_size char(5) DEFAULT '',
  TITLEBAR_font char(80) DEFAULT '',
  TITLEBAR_size char(5) DEFAULT '',
  COLOR_TITLEBAR_BACK char(7) DEFAULT '',
  COLOR_LTBACK1 char(7) DEFAULT '',
  PRIMARY KEY (user_id)
);

#
# Dumping data for table 'theme_prefs'
#

#
# Table structure for table 'themes'
#

CREATE TABLE themes (
  theme_id int(11) NOT NULL auto_increment,
  dirname varchar(80),
  fullname varchar(80),
  PRIMARY KEY (theme_id)
);

#
# Dumping data for table 'themes'
#

INSERT INTO themes VALUES (1,'forged','Forged Metal');
INSERT INTO themes VALUES (2,'classic','Classic Sourceforge');

#
# Table structure for table 'tmp_projs_releases_tmp'
#

CREATE TABLE tmp_projs_releases_tmp (
  year int(11) DEFAULT '0' NOT NULL,
  month int(11) DEFAULT '0' NOT NULL,
  total_proj int(11) DEFAULT '0' NOT NULL,
  total_releases int(11) DEFAULT '0' NOT NULL
);

#
# Dumping data for table 'tmp_projs_releases_tmp'
#


#
# Table structure for table 'top_group'
#

CREATE TABLE top_group (
  group_id int(11) DEFAULT '0' NOT NULL,
  group_name varchar(40),
  downloads_all int(11) DEFAULT '0' NOT NULL,
  rank_downloads_all int(11) DEFAULT '0' NOT NULL,
  rank_downloads_all_old int(11) DEFAULT '0' NOT NULL,
  downloads_week int(11) DEFAULT '0' NOT NULL,
  rank_downloads_week int(11) DEFAULT '0' NOT NULL,
  rank_downloads_week_old int(11) DEFAULT '0' NOT NULL,
  userrank int(11) DEFAULT '0' NOT NULL,
  rank_userrank int(11) DEFAULT '0' NOT NULL,
  rank_userrank_old int(11) DEFAULT '0' NOT NULL,
  forumposts_week int(11) DEFAULT '0' NOT NULL,
  rank_forumposts_week int(11) DEFAULT '0' NOT NULL,
  rank_forumposts_week_old int(11) DEFAULT '0' NOT NULL,
  pageviews_proj int(11) DEFAULT '0' NOT NULL,
  rank_pageviews_proj int(11) DEFAULT '0' NOT NULL,
  rank_pageviews_proj_old int(11) DEFAULT '0' NOT NULL,
  KEY rank_downloads_all_idx (rank_downloads_all),
  KEY rank_downloads_week_idx (rank_downloads_week),
  KEY rank_userrank_idx (rank_userrank),
  KEY rank_forumposts_week_idx (rank_forumposts_week),
  KEY pageviews_proj_idx (pageviews_proj)
);

#
# Dumping data for table 'top_group'
#


#
# Table structure for table 'trove_cat'
#

CREATE TABLE trove_cat (
  trove_cat_id int(11) NOT NULL auto_increment,
  version int(11) DEFAULT '0' NOT NULL,
  parent int(11) DEFAULT '0' NOT NULL,
  root_parent int(11) DEFAULT '0' NOT NULL,
  shortname varchar(80),
  fullname varchar(80),
  description varchar(255),
  count_subcat int(11) DEFAULT '0' NOT NULL,
  count_subproj int(11) DEFAULT '0' NOT NULL,
  fullpath text DEFAULT '' NOT NULL,
  fullpath_ids text,
  PRIMARY KEY (trove_cat_id),
  KEY parent_idx (parent),
  KEY root_parent_idx (root_parent),
  KEY version_idx (version)
);

#
# Dumping data for table 'trove_cat'
#

INSERT INTO trove_cat VALUES (1,2000031601,0,0,'audience','Intended Audience','The main class of people likely to be interested in this resource.',0,0,'Intended Audience','1');
INSERT INTO trove_cat VALUES (2,2000032401,1,1,'endusers','End Users/Desktop','Programs and resources for software end users. Software for the desktop.',0,0,'Intended Audience :: End Users/Desktop','1 :: 2');
INSERT INTO trove_cat VALUES (3,2000041101,1,1,'developers','Developers','Programs and resources for software developers, to include libraries.',0,0,'Intended Audience :: Developers','1 :: 3');
INSERT INTO trove_cat VALUES (4,2000031601,1,1,'sysadmins','System Administrators','Programs and resources for people who administer computers and networks.',0,0,'Intended Audience :: System Administrators','1 :: 4');
INSERT INTO trove_cat VALUES (5,2000040701,1,1,'other','Other Audience','Programs and resources for an unlisted audience.',0,0,'Intended Audience :: Other Audience','1 :: 5');
INSERT INTO trove_cat VALUES (6,2000031601,0,0,'developmentstatus','Development Status','An indication of the development status of the software or resource.',0,0,'Development Status','6');
INSERT INTO trove_cat VALUES (7,2000040701,6,6,'planning','1 - Planning','This resource is in the planning stages only. There is no code.',0,0,'Development Status :: 1 - Planning','6 :: 7');
INSERT INTO trove_cat VALUES (8,2000040701,6,6,'prealpha','2 - Pre-Alpha','There is code for this project, but it is not usable except for further development.',0,0,'Development Status :: 2 - Pre-Alpha','6 :: 8');
INSERT INTO trove_cat VALUES (9,2000041101,6,6,'alpha','3 - Alpha','Resource is in early development, and probably incomplete and/or extremely buggy.',0,0,'Development Status :: 3 - Alpha','6 :: 9');
INSERT INTO trove_cat VALUES (10,2000040701,6,6,'beta','4 - Beta','Resource is in late phases of development. Deliverables are essentially complete, but may still have significant bugs.',0,0,'Development Status :: 4 - Beta','6 :: 10');
INSERT INTO trove_cat VALUES (11,2000040701,6,6,'production','5 - Production/Stable','Deliverables are complete and usable by the intended audience.',0,0,'Development Status :: 5 - Production/Stable','6 :: 11');
INSERT INTO trove_cat VALUES (12,2000040701,6,6,'mature','6 - Mature','This resource has an extensive history of successful use and has probably undergone several stable revisions.',0,0,'Development Status :: 6 - Mature','6 :: 12');
INSERT INTO trove_cat VALUES (13,2000031601,0,0,'license','License','License terms under which the resource is distributed.',0,0,'License','13');
INSERT INTO trove_cat VALUES (14,2000032401,13,13,'osi','OSI Approved','Licenses that have been approved by OSI as approved',0,0,'License :: OSI Approved','13 :: 14');
INSERT INTO trove_cat VALUES (15,2000032001,14,13,'gpl','GNU General Public License (GPL)','GNU General Public License.',0,0,'License :: OSI Approved :: GNU General Public License (GPL)','13 :: 14 :: 15');
INSERT INTO trove_cat VALUES (16,2000050801,14,13,'lgpl','GNU Lesser General Public License (LGPL)','GNU Lesser General Public License',0,0,'License :: OSI Approved :: GNU Lesser General Public License (LGPL)','13 :: 14 :: 16');
INSERT INTO trove_cat VALUES (17,2000032001,14,13,'artistic','Artistic License','The Perl Artistic License',0,0,'License :: OSI Approved :: Artistic License','13 :: 14 :: 17');
INSERT INTO trove_cat VALUES (18,2000031601,0,0,'topic','Topic','Topic categorization.',0,0,'Topic','18');
INSERT INTO trove_cat VALUES (19,2000032001,136,18,'archiving','Archiving','Tools for maintaining and searching software or document archives.',0,0,'Topic :: System :: Archiving','18 :: 136 :: 19');
INSERT INTO trove_cat VALUES (20,2000032401,18,18,'communications','Communications','Programs intended to facilitate communication between people.',0,0,'Topic :: Communications','18 :: 20');
INSERT INTO trove_cat VALUES (21,2000031601,20,18,'bbs','BBS','Bulletin Board systems.',0,0,'Topic :: Communications :: BBS','18 :: 20 :: 21');
INSERT INTO trove_cat VALUES (22,2000031601,20,18,'chat','Chat','Programs to support real-time communication over the Internet.',0,0,'Topic :: Communications :: Chat','18 :: 20 :: 22');
INSERT INTO trove_cat VALUES (23,2000031601,22,18,'icq','ICQ','Programs to support ICQ.',0,0,'Topic :: Communications :: Chat :: ICQ','18 :: 20 :: 22 :: 23');
INSERT INTO trove_cat VALUES (24,2000041101,22,18,'irc','Internet Relay Chat','Programs to support Internet Relay Chat.',0,0,'Topic :: Communications :: Chat :: Internet Relay Chat','18 :: 20 :: 22 :: 24');
INSERT INTO trove_cat VALUES (25,2000031601,22,18,'talk','Unix Talk','Programs to support Unix Talk protocol.',0,0,'Topic :: Communications :: Chat :: Unix Talk','18 :: 20 :: 22 :: 25');
INSERT INTO trove_cat VALUES (26,2000031601,22,18,'aim','AOL Instant Messanger','Programs to support AOL Instant Messanger.',0,0,'Topic :: Communications :: Chat :: AOL Instant Messanger','18 :: 20 :: 22 :: 26');
INSERT INTO trove_cat VALUES (27,2000031601,20,18,'conferencing','Conferencing','Software to support real-time conferencing over the Internet.',0,0,'Topic :: Communications :: Conferencing','18 :: 20 :: 27');
INSERT INTO trove_cat VALUES (28,2000031601,20,18,'email','Email','Programs for sending, processing, and handling electronic mail.',0,0,'Topic :: Communications :: Email','18 :: 20 :: 28');
INSERT INTO trove_cat VALUES (29,2000031601,28,18,'filters','Filters','Content-driven filters and dispatchers for Email.',0,0,'Topic :: Communications :: Email :: Filters','18 :: 20 :: 28 :: 29');
INSERT INTO trove_cat VALUES (30,2000031601,28,18,'listservers','Mailing List Servers','Tools for managing electronic mailing lists.',0,0,'Topic :: Communications :: Email :: Mailing List Servers','18 :: 20 :: 28 :: 30');
INSERT INTO trove_cat VALUES (31,2000031601,28,18,'mua','Email Clients (MUA)','Programs for interactively reading and sending Email.',0,0,'Topic :: Communications :: Email :: Email Clients (MUA)','18 :: 20 :: 28 :: 31');
INSERT INTO trove_cat VALUES (32,2000031601,28,18,'mta','Mail Transport Agents','Email transport and gatewaying software.',0,0,'Topic :: Communications :: Email :: Mail Transport Agents','18 :: 20 :: 28 :: 32');
INSERT INTO trove_cat VALUES (33,2000031601,28,18,'postoffice','Post-Office','Programs to support post-office protocols, including POP and IMAP.',0,0,'Topic :: Communications :: Email :: Post-Office','18 :: 20 :: 28 :: 33');
INSERT INTO trove_cat VALUES (34,2000031601,33,18,'pop3','POP3','Programs to support POP3 (Post-Office Protocol, version 3).',0,0,'Topic :: Communications :: Email :: Post-Office :: POP3','18 :: 20 :: 28 :: 33 :: 34');
INSERT INTO trove_cat VALUES (35,2000031601,33,18,'imap','IMAP','Programs to support IMAP protocol (Internet Message Access Protocol).',0,0,'Topic :: Communications :: Email :: Post-Office :: IMAP','18 :: 20 :: 28 :: 33 :: 35');
INSERT INTO trove_cat VALUES (36,2000031601,20,18,'fax','Fax','Tools for sending and receiving facsimile messages.',0,0,'Topic :: Communications :: Fax','18 :: 20 :: 36');
INSERT INTO trove_cat VALUES (37,2000031601,20,18,'fido','FIDO','Tools for FIDOnet mail and echoes.',0,0,'Topic :: Communications :: FIDO','18 :: 20 :: 37');
INSERT INTO trove_cat VALUES (38,2000031601,20,18,'hamradio','Ham Radio','Tools and resources for amateur radio.',0,0,'Topic :: Communications :: Ham Radio','18 :: 20 :: 38');
INSERT INTO trove_cat VALUES (39,2000031601,20,18,'usenet','Usenet News','Software to support USENET news.',0,0,'Topic :: Communications :: Usenet News','18 :: 20 :: 39');
INSERT INTO trove_cat VALUES (40,2000031601,20,18,'internetphone','Internet Phone','Software to support real-time speech communication over the Internet.',0,0,'Topic :: Communications :: Internet Phone','18 :: 20 :: 40');
INSERT INTO trove_cat VALUES (41,2000031601,19,18,'packaging','Packaging','Tools for packing and unpacking multi-file formats. Includes data-only formats and software package systems.',0,0,'Topic :: System :: Archiving :: Packaging','18 :: 136 :: 19 :: 41');
INSERT INTO trove_cat VALUES (42,2000031601,19,18,'compression','Compression','Tools and libraries for data compression.',0,0,'Topic :: System :: Archiving :: Compression','18 :: 136 :: 19 :: 42');
INSERT INTO trove_cat VALUES (43,2000031601,18,18,'security','Security','Security-related software, to include system administration and cryptography.',0,0,'Topic :: Security','18 :: 43');
INSERT INTO trove_cat VALUES (44,2000031601,43,18,'cryptography','Cryptography','Cryptography programs, algorithms, and libraries.',0,0,'Topic :: Security :: Cryptography','18 :: 43 :: 44');
INSERT INTO trove_cat VALUES (45,2000031601,18,18,'development','Software Development','Software used to aid software development.',0,0,'Topic :: Software Development','18 :: 45');
INSERT INTO trove_cat VALUES (46,2000031601,45,18,'build','Build Tools','Software for the build process.',0,0,'Topic :: Software Development :: Build Tools','18 :: 45 :: 46');
INSERT INTO trove_cat VALUES (47,2000031601,45,18,'debuggers','Debuggers','Programs for controlling and monitoring the execution of compiled binaries.',0,0,'Topic :: Software Development :: Debuggers','18 :: 45 :: 47');
INSERT INTO trove_cat VALUES (48,2000031601,45,18,'compilers','Compilers','Programs for compiling high-level languges into machine code.',0,0,'Topic :: Software Development :: Compilers','18 :: 45 :: 48');
INSERT INTO trove_cat VALUES (49,2000031601,45,18,'interpreters','Interpreters','Programs for interpreting and executing high-level languages directly.',0,0,'Topic :: Software Development :: Interpreters','18 :: 45 :: 49');
INSERT INTO trove_cat VALUES (50,2000031601,45,18,'objectbrokering','Object Brokering','Object brokering libraries and tools.',0,0,'Topic :: Software Development :: Object Brokering','18 :: 45 :: 50');
INSERT INTO trove_cat VALUES (51,2000031601,50,18,'corba','CORBA','Tools for implementation and use of CORBA.',0,0,'Topic :: Software Development :: Object Brokering :: CORBA','18 :: 45 :: 50 :: 51');
INSERT INTO trove_cat VALUES (52,2000031601,45,18,'versioncontrol','Version Control','Tools for managing multiple versions of evolving sources or documents.',0,0,'Topic :: Software Development :: Version Control','18 :: 45 :: 52');
INSERT INTO trove_cat VALUES (53,2000031601,52,18,'cvs','CVS','Tools for CVS (Concurrent Versioning System).',0,0,'Topic :: Software Development :: Version Control :: CVS','18 :: 45 :: 52 :: 53');
INSERT INTO trove_cat VALUES (54,2000031601,52,18,'rcs','RCS','Tools for RCS (Revision Control System).',0,0,'Topic :: Software Development :: Version Control :: RCS','18 :: 45 :: 52 :: 54');
INSERT INTO trove_cat VALUES (55,2000031601,18,18,'desktop','Desktop Environment','Accessories, managers, and utilities for your GUI desktop.',0,0,'Topic :: Desktop Environment','18 :: 55');
INSERT INTO trove_cat VALUES (56,2000031601,55,18,'windowmanagers','Window Managers','Programs that provide window control and application launching.',0,0,'Topic :: Desktop Environment :: Window Managers','18 :: 55 :: 56');
INSERT INTO trove_cat VALUES (57,2000031601,55,18,'kde','K Desktop Environment (KDE)','Software for the KDE desktop.',0,0,'Topic :: Desktop Environment :: K Desktop Environment (KDE)','18 :: 55 :: 57');
INSERT INTO trove_cat VALUES (58,2000031601,55,18,'gnome','Gnome','Software for the Gnome desktop.',0,0,'Topic :: Desktop Environment :: Gnome','18 :: 55 :: 58');
INSERT INTO trove_cat VALUES (59,2000031601,56,18,'enlightenment','Enlightenment','Software for the Enlightenment window manager.',0,0,'Topic :: Desktop Environment :: Window Managers :: Enlightenment','18 :: 55 :: 56 :: 59');
INSERT INTO trove_cat VALUES (60,2000031601,59,18,'themes','Themes','Themes for the Enlightenment window manager.',0,0,'Topic :: Desktop Environment :: Window Managers :: Enlightenment :: Themes','18 :: 55 :: 56 :: 59 :: 60');
INSERT INTO trove_cat VALUES (61,2000031601,57,18,'themes','Themes','Themes for KDE.',0,0,'Topic :: Desktop Environment :: K Desktop Environment (KDE) :: Themes','18 :: 55 :: 57 :: 61');
INSERT INTO trove_cat VALUES (62,2000031601,55,18,'screensavers','Screen Savers','Screen savers and lockers.',0,0,'Topic :: Desktop Environment :: Screen Savers','18 :: 55 :: 62');
INSERT INTO trove_cat VALUES (63,2000032001,18,18,'editors','Text Editors','Programs for editing code and documents.',0,0,'Topic :: Text Editors','18 :: 63');
INSERT INTO trove_cat VALUES (64,2000031601,63,18,'emacs','Emacs','GNU Emacs and its imitators and tools.',0,0,'Topic :: Text Editors :: Emacs','18 :: 63 :: 64');
INSERT INTO trove_cat VALUES (65,2000031601,63,18,'ide','Integrated Development Environments (IDE)','Complete editing environments for code, including cababilities such as compilation and code building assistance.',0,0,'Topic :: Text Editors :: Integrated Development Environments (IDE)','18 :: 63 :: 65');
INSERT INTO trove_cat VALUES (66,2000031601,18,18,'database','Database','Front ends, engines, and tools for database work.',0,0,'Topic :: Database','18 :: 66');
INSERT INTO trove_cat VALUES (67,2000031601,66,18,'engines','Database Engines/Servers','Programs that manage data and provide control via some query language.',0,0,'Topic :: Database :: Database Engines/Servers','18 :: 66 :: 67');
INSERT INTO trove_cat VALUES (68,2000031601,66,18,'frontends','Front-Ends','Clients and front-ends for generating queries to database engines.',0,0,'Topic :: Database :: Front-Ends','18 :: 66 :: 68');
INSERT INTO trove_cat VALUES (69,2000031601,63,18,'documentation','Documentation','Tools for the creation and use of documentation.',0,0,'Topic :: Text Editors :: Documentation','18 :: 63 :: 69');
INSERT INTO trove_cat VALUES (70,2000031601,63,18,'wordprocessors','Word Processors','WYSIWYG word processors.',0,0,'Topic :: Text Editors :: Word Processors','18 :: 63 :: 70');
INSERT INTO trove_cat VALUES (71,2000031601,18,18,'education','Education','Programs and tools for educating yourself or others.',0,0,'Topic :: Education','18 :: 71');
INSERT INTO trove_cat VALUES (72,2000031601,71,18,'cai','Computer Aided Instruction (CAI)','Programs for authoring or using Computer Aided Instrution courses.',0,0,'Topic :: Education :: Computer Aided Instruction (CAI)','18 :: 71 :: 72');
INSERT INTO trove_cat VALUES (73,2000031601,71,18,'testing','Testing','Tools for testing someone\'s knowledge on a subject.',0,0,'Topic :: Education :: Testing','18 :: 71 :: 73');
INSERT INTO trove_cat VALUES (74,2000042701,136,18,'emulators','Emulators','Emulations of foreign operating systme and machines.',0,0,'Topic :: System :: Emulators','18 :: 136 :: 74');
INSERT INTO trove_cat VALUES (75,2000031701,129,18,'financial','Financial','Programs related to finance.',0,0,'Topic :: Office/Business :: Financial','18 :: 129 :: 75');
INSERT INTO trove_cat VALUES (76,2000031601,75,18,'accounting','Accounting','Checkbook balancers and accounting programs.',0,0,'Topic :: Office/Business :: Financial :: Accounting','18 :: 129 :: 75 :: 76');
INSERT INTO trove_cat VALUES (77,2000031601,75,18,'investment','Investment','Programs for assisting in financial investment.',0,0,'Topic :: Office/Business :: Financial :: Investment','18 :: 129 :: 75 :: 77');
INSERT INTO trove_cat VALUES (78,2000031601,75,18,'spreadsheet','Spreadsheet','Spreadsheet applications.',0,0,'Topic :: Office/Business :: Financial :: Spreadsheet','18 :: 129 :: 75 :: 78');
INSERT INTO trove_cat VALUES (79,2000031601,75,18,'pointofsale','Point-Of-Sale','Point-Of-Sale applications.',0,0,'Topic :: Office/Business :: Financial :: Point-Of-Sale','18 :: 129 :: 75 :: 79');
INSERT INTO trove_cat VALUES (80,2000031601,18,18,'games','Games/Entertainment','Games and Entertainment software.',0,0,'Topic :: Games/Entertainment','18 :: 80');
INSERT INTO trove_cat VALUES (81,2000031601,80,18,'realtimestrategy','Real Time Strategy','Real Time strategy games',0,0,'Topic :: Games/Entertainment :: Real Time Strategy','18 :: 80 :: 81');
INSERT INTO trove_cat VALUES (82,2000031601,80,18,'firstpersonshooters','First Person Shooters','First Person Shooters.',0,0,'Topic :: Games/Entertainment :: First Person Shooters','18 :: 80 :: 82');
INSERT INTO trove_cat VALUES (83,2000032401,80,18,'turnbasedstrategy','Turn Based Strategy','Turn Based Strategy',0,0,'Topic :: Games/Entertainment :: Turn Based Strategy','18 :: 80 :: 83');
INSERT INTO trove_cat VALUES (84,2000031601,80,18,'rpg','Role-Playing','Role-Playing games',0,0,'Topic :: Games/Entertainment :: Role-Playing','18 :: 80 :: 84');
INSERT INTO trove_cat VALUES (85,2000031601,80,18,'simulation','Simulation','Simulation games',0,0,'Topic :: Games/Entertainment :: Simulation','18 :: 80 :: 85');
INSERT INTO trove_cat VALUES (86,2000031601,80,18,'mud','Multi-User Dungeons (MUD)','Massively-multiplayer text based games.',0,0,'Topic :: Games/Entertainment :: Multi-User Dungeons (MUD)','18 :: 80 :: 86');
INSERT INTO trove_cat VALUES (87,2000031601,18,18,'internet','Internet','Tools to assist human access to the Internet.',0,0,'Topic :: Internet','18 :: 87');
INSERT INTO trove_cat VALUES (88,2000031601,87,18,'finger','Finger','The Finger protocol for getting information about users.',0,0,'Topic :: Internet :: Finger','18 :: 87 :: 88');
INSERT INTO trove_cat VALUES (89,2000031601,87,18,'ftp','File Transfer Protocol (FTP)','Programs and tools for file transfer via FTP.',0,0,'Topic :: Internet :: File Transfer Protocol (FTP)','18 :: 87 :: 89');
INSERT INTO trove_cat VALUES (90,2000031601,87,18,'www','WWW/HTTP','Programs and tools for the World Wide Web.',0,0,'Topic :: Internet :: WWW/HTTP','18 :: 87 :: 90');
INSERT INTO trove_cat VALUES (91,2000031601,90,18,'browsers','Browsers','Web Browsers',0,0,'Topic :: Internet :: WWW/HTTP :: Browsers','18 :: 87 :: 90 :: 91');
INSERT INTO trove_cat VALUES (92,2000031601,90,18,'dynamic','Dynamic Content','Common Gateway Interface scripting and server-side parsing.',0,0,'Topic :: Internet :: WWW/HTTP :: Dynamic Content','18 :: 87 :: 90 :: 92');
INSERT INTO trove_cat VALUES (93,2000031601,90,18,'indexing','Indexing/Search','Indexing and search tools for the Web.',0,0,'Topic :: Internet :: WWW/HTTP :: Indexing/Search','18 :: 87 :: 90 :: 93');
INSERT INTO trove_cat VALUES (94,2000031601,92,18,'counters','Page Counters','Scripts to count numbers of pageviews.',0,0,'Topic :: Internet :: WWW/HTTP :: Dynamic Content :: Page Counters','18 :: 87 :: 90 :: 92 :: 94');
INSERT INTO trove_cat VALUES (95,2000031601,92,18,'messageboards','Message Boards','Online message boards',0,0,'Topic :: Internet :: WWW/HTTP :: Dynamic Content :: Message Boards','18 :: 87 :: 90 :: 92 :: 95');
INSERT INTO trove_cat VALUES (96,2000031601,92,18,'cgi','CGI Tools/Libraries','Tools for the Common Gateway Interface',0,0,'Topic :: Internet :: WWW/HTTP :: Dynamic Content :: CGI Tools/Libraries','18 :: 87 :: 90 :: 92 :: 96');
INSERT INTO trove_cat VALUES (97,2000042701,18,18,'scientific','Scientific/Engineering','Scientific applications, to include research, applied and pure mathematics and sciences.',0,0,'Topic :: Scientific/Engineering','18 :: 97');
INSERT INTO trove_cat VALUES (98,2000031601,97,18,'mathematics','Mathematics','Software to support pure and applied mathematics.',0,0,'Topic :: Scientific/Engineering :: Mathematics','18 :: 97 :: 98');
INSERT INTO trove_cat VALUES (99,2000031601,18,18,'multimedia','Multimedia','Graphics, sound, video, and multimedia.',0,0,'Topic :: Multimedia','18 :: 99');
INSERT INTO trove_cat VALUES (100,2000031601,99,18,'graphics','Graphics','Tools and resources for computer graphics.',0,0,'Topic :: Multimedia :: Graphics','18 :: 99 :: 100');
INSERT INTO trove_cat VALUES (101,2000031601,100,18,'capture','Capture','Support for scanners, cameras, and screen capture.',0,0,'Topic :: Multimedia :: Graphics :: Capture','18 :: 99 :: 100 :: 101');
INSERT INTO trove_cat VALUES (102,2000031601,101,18,'scanners','Scanners','Support for graphic scanners.',0,0,'Topic :: Multimedia :: Graphics :: Capture :: Scanners','18 :: 99 :: 100 :: 101 :: 102');
INSERT INTO trove_cat VALUES (103,2000031601,101,18,'cameras','Digital Camera','Digital Camera',0,0,'Topic :: Multimedia :: Graphics :: Capture :: Digital Camera','18 :: 99 :: 100 :: 101 :: 103');
INSERT INTO trove_cat VALUES (104,2000031601,101,18,'screencapture','Screen Capture','Screen capture tools and processors.',0,0,'Topic :: Multimedia :: Graphics :: Capture :: Screen Capture','18 :: 99 :: 100 :: 101 :: 104');
INSERT INTO trove_cat VALUES (105,2000031701,100,18,'conversion','Graphics Conversion','Programs which convert between graphics formats.',0,0,'Topic :: Multimedia :: Graphics :: Graphics Conversion','18 :: 99 :: 100 :: 105');
INSERT INTO trove_cat VALUES (106,2000031701,100,18,'editors','Editors','Drawing, painting, and structured editing programs.',0,0,'Topic :: Multimedia :: Graphics :: Editors','18 :: 99 :: 100 :: 106');
INSERT INTO trove_cat VALUES (107,2000031701,106,18,'vector','Vector-Based','Vector-Based drawing programs.',0,0,'Topic :: Multimedia :: Graphics :: Editors :: Vector-Based','18 :: 99 :: 100 :: 106 :: 107');
INSERT INTO trove_cat VALUES (108,2000031701,106,18,'raster','Raster-Based','Raster/Bitmap based drawing programs.',0,0,'Topic :: Multimedia :: Graphics :: Editors :: Raster-Based','18 :: 99 :: 100 :: 106 :: 108');
INSERT INTO trove_cat VALUES (109,2000031701,100,18,'3dmodeling','3D Modeling','Programs for working with 3D Models.',0,0,'Topic :: Multimedia :: Graphics :: 3D Modeling','18 :: 99 :: 100 :: 109');
INSERT INTO trove_cat VALUES (110,2000031701,100,18,'3drendering','3D Rendering','Programs which render 3D models.',0,0,'Topic :: Multimedia :: Graphics :: 3D Rendering','18 :: 99 :: 100 :: 110');
INSERT INTO trove_cat VALUES (111,2000031701,100,18,'presentation','Presentation','Tools for generating presentation graphics and slides.',0,0,'Topic :: Multimedia :: Graphics :: Presentation','18 :: 99 :: 100 :: 111');
INSERT INTO trove_cat VALUES (112,2000031701,100,18,'viewers','Viewers','Programs that can display various graphics formats.',0,0,'Topic :: Multimedia :: Graphics :: Viewers','18 :: 99 :: 100 :: 112');
INSERT INTO trove_cat VALUES (113,2000031701,99,18,'sound','Sound/Audio','Tools for generating, editing, analyzing, and playing sound.',0,0,'Topic :: Multimedia :: Sound/Audio','18 :: 99 :: 113');
INSERT INTO trove_cat VALUES (114,2000031701,113,18,'analysis','Analysis','Sound analysis tools, to include frequency analysis.',0,0,'Topic :: Multimedia :: Sound/Audio :: Analysis','18 :: 99 :: 113 :: 114');
INSERT INTO trove_cat VALUES (115,2000031701,113,18,'capture','Capture/Recording','Sound capture and recording.',0,0,'Topic :: Multimedia :: Sound/Audio :: Capture/Recording','18 :: 99 :: 113 :: 115');
INSERT INTO trove_cat VALUES (116,2000031701,113,18,'cdaudio','CD Audio','Programs to play and manipulate audio CDs.',0,0,'Topic :: Multimedia :: Sound/Audio :: CD Audio','18 :: 99 :: 113 :: 116');
INSERT INTO trove_cat VALUES (117,2000031701,116,18,'cdplay','CD Playing','CD Playing software, to include jukebox software.',0,0,'Topic :: Multimedia :: Sound/Audio :: CD Audio :: CD Playing','18 :: 99 :: 113 :: 116 :: 117');
INSERT INTO trove_cat VALUES (118,2000031701,116,18,'cdripping','CD Ripping','Software to convert CD Audio to other digital formats.',0,0,'Topic :: Multimedia :: Sound/Audio :: CD Audio :: CD Ripping','18 :: 99 :: 113 :: 116 :: 118');
INSERT INTO trove_cat VALUES (119,2000031701,113,18,'conversion','Conversion','Programs to convert between audio formats.',0,0,'Topic :: Multimedia :: Sound/Audio :: Conversion','18 :: 99 :: 113 :: 119');
INSERT INTO trove_cat VALUES (120,2000031701,113,18,'editors','Editors','Programs to edit/manipulate sound data.',0,0,'Topic :: Multimedia :: Sound/Audio :: Editors','18 :: 99 :: 113 :: 120');
INSERT INTO trove_cat VALUES (121,2000031701,113,18,'mixers','Mixers','Programs to mix audio.',0,0,'Topic :: Multimedia :: Sound/Audio :: Mixers','18 :: 99 :: 113 :: 121');
INSERT INTO trove_cat VALUES (122,2000031701,113,18,'players','Players','Programs to play audio files to a sound device.',0,0,'Topic :: Multimedia :: Sound/Audio :: Players','18 :: 99 :: 113 :: 122');
INSERT INTO trove_cat VALUES (123,2000031701,122,18,'mp3','MP3','Programs to play MP3 audio files.',0,0,'Topic :: Multimedia :: Sound/Audio :: Players :: MP3','18 :: 99 :: 113 :: 122 :: 123');
INSERT INTO trove_cat VALUES (124,2000031701,113,18,'speech','Speech','Speech manipulation and intepretation tools.',0,0,'Topic :: Multimedia :: Sound/Audio :: Speech','18 :: 99 :: 113 :: 124');
INSERT INTO trove_cat VALUES (125,2000031701,99,18,'video','Video','Video capture, editing, and playback.',0,0,'Topic :: Multimedia :: Video','18 :: 99 :: 125');
INSERT INTO trove_cat VALUES (126,2000031701,125,18,'capture','Capture','Video capture tools.',0,0,'Topic :: Multimedia :: Video :: Capture','18 :: 99 :: 125 :: 126');
INSERT INTO trove_cat VALUES (127,2000031701,125,18,'conversion','Conversion','Programs which convert between video formats.',0,0,'Topic :: Multimedia :: Video :: Conversion','18 :: 99 :: 125 :: 127');
INSERT INTO trove_cat VALUES (128,2000031701,125,18,'display','Display','Programs which display various video formats.',0,0,'Topic :: Multimedia :: Video :: Display','18 :: 99 :: 125 :: 128');
INSERT INTO trove_cat VALUES (129,2000031701,18,18,'office','Office/Business','Software for assisting and organizing work at your desk.',0,0,'Topic :: Office/Business','18 :: 129');
INSERT INTO trove_cat VALUES (130,2000031701,129,18,'scheduling','Scheduling','Projects for scheduling time, to include project management.',0,0,'Topic :: Office/Business :: Scheduling','18 :: 129 :: 130');
INSERT INTO trove_cat VALUES (131,2000032001,129,18,'suites','Office Suites','Integrated office suites (word processing, presentation, spreadsheet, database, etc).',0,0,'Topic :: Office/Business :: Office Suites','18 :: 129 :: 131');
INSERT INTO trove_cat VALUES (132,2000032001,18,18,'religion','Religion','Programs relating to religion and sacred texts.',0,0,'Topic :: Religion','18 :: 132');
INSERT INTO trove_cat VALUES (133,2000032001,97,18,'ai','Artificial Intelligence','Artificial Intelligence.',0,0,'Topic :: Scientific/Engineering :: Artificial Intelligence','18 :: 97 :: 133');
INSERT INTO trove_cat VALUES (134,2000032001,97,18,'astronomy','Astronomy','Software and tools related to astronomy.',0,0,'Topic :: Scientific/Engineering :: Astronomy','18 :: 97 :: 134');
INSERT INTO trove_cat VALUES (135,2000032001,97,18,'visualization','Visualization','Software for scientific visualization.',0,0,'Topic :: Scientific/Engineering :: Visualization','18 :: 97 :: 135');
INSERT INTO trove_cat VALUES (136,2000032001,18,18,'system','System','Operating system core and administration utilities.',0,0,'Topic :: System','18 :: 136');
INSERT INTO trove_cat VALUES (137,2000032001,19,18,'backup','Backup','Programs to manage and sequence system backup.',0,0,'Topic :: System :: Archiving :: Backup','18 :: 136 :: 19 :: 137');
INSERT INTO trove_cat VALUES (138,2000032001,136,18,'benchmark','Benchmark','Programs for benchmarking system performance.',0,0,'Topic :: System :: Benchmark','18 :: 136 :: 138');
INSERT INTO trove_cat VALUES (139,2000032001,136,18,'boot','Boot','Programs for bootstrapping your OS.',0,0,'Topic :: System :: Boot','18 :: 136 :: 139');
INSERT INTO trove_cat VALUES (140,2000032001,139,18,'init','Init','Init-time programs to start system services after boot.',0,0,'Topic :: System :: Boot :: Init','18 :: 136 :: 139 :: 140');
INSERT INTO trove_cat VALUES (141,2000032001,136,18,'clustering','Clustering/Distributed Networks','Tools for automatically distributing computation across a network.',0,0,'Topic :: System :: Clustering/Distributed Networks','18 :: 136 :: 141');
INSERT INTO trove_cat VALUES (142,2000032001,136,18,'filesystems','Filesystems','Support for creating, editing, reading, and writing file systems.',0,0,'Topic :: System :: Filesystems','18 :: 136 :: 142');
INSERT INTO trove_cat VALUES (143,2000032001,144,18,'linux','Linux','The Linux kernel, patches, and modules.',0,0,'Topic :: System :: Operating System Kernels :: Linux','18 :: 136 :: 144 :: 143');
INSERT INTO trove_cat VALUES (144,2000032001,136,18,'kernels','Operating System Kernels','OS Kernels, patches, modules, and tools.',0,0,'Topic :: System :: Operating System Kernels','18 :: 136 :: 144');
INSERT INTO trove_cat VALUES (145,2000032001,144,18,'bsd','BSD','Code relating to any of the BSD kernels.',0,0,'Topic :: System :: Operating System Kernels :: BSD','18 :: 136 :: 144 :: 145');
INSERT INTO trove_cat VALUES (146,2000032001,136,18,'hardware','Hardware','Tools for direct, non-kernel control and configuration of hardware.',0,0,'Topic :: System :: Hardware','18 :: 136 :: 146');
INSERT INTO trove_cat VALUES (147,2000032001,136,18,'setup','Installation/Setup','Tools for installation and setup of the operating system and other programs.',0,0,'Topic :: System :: Installation/Setup','18 :: 136 :: 147');
INSERT INTO trove_cat VALUES (148,2000032001,136,18,'logging','Logging','Utilities for clearing, rotating, and digesting system logs.',0,0,'Topic :: System :: Logging','18 :: 136 :: 148');
INSERT INTO trove_cat VALUES (149,2000032001,87,18,'dns','Name Service (DNS)','Domain name system servers and utilities.',0,0,'Topic :: Internet :: Name Service (DNS)','18 :: 87 :: 149');
INSERT INTO trove_cat VALUES (150,2000032001,136,18,'networking','Networking','Network configuration and administration.',0,0,'Topic :: System :: Networking','18 :: 136 :: 150');
INSERT INTO trove_cat VALUES (151,2000032001,150,18,'firewalls','Firewalls','Firewalls and filtering systems.',0,0,'Topic :: System :: Networking :: Firewalls','18 :: 136 :: 150 :: 151');
INSERT INTO trove_cat VALUES (152,2000032001,150,18,'monitoring','Monitoring','System monitoring, traffic analysis, and sniffers.',0,0,'Topic :: System :: Networking :: Monitoring','18 :: 136 :: 150 :: 152');
INSERT INTO trove_cat VALUES (153,2000032001,136,18,'power','Power (UPS)','Code for communication with uninterruptible power supplies.',0,0,'Topic :: System :: Power (UPS)','18 :: 136 :: 153');
INSERT INTO trove_cat VALUES (154,2000032001,18,18,'printing','Printing','Tools, daemons, and utilities for printer control.',0,0,'Topic :: Printing','18 :: 154');
INSERT INTO trove_cat VALUES (155,2000032001,152,18,'watchdog','Hardware Watchdog','Software to monitor and perform actions or shutdown on hardware trouble detection.',0,0,'Topic :: System :: Networking :: Monitoring :: Hardware Watchdog','18 :: 136 :: 150 :: 152 :: 155');
INSERT INTO trove_cat VALUES (156,2000032001,18,18,'terminals','Terminals','Terminal emulators, terminal programs, and terminal session utilities.',0,0,'Topic :: Terminals','18 :: 156');
INSERT INTO trove_cat VALUES (157,2000032001,156,18,'serial','Serial','Dialup, terminal emulation, and file transfer over serial lines.',0,0,'Topic :: Terminals :: Serial','18 :: 156 :: 157');
INSERT INTO trove_cat VALUES (158,2000032001,156,18,'virtual','Terminal Emulators/X Terminals','Programs to handle multiple terminal sessions. Includes terminal emulations for X and other window systems.',0,0,'Topic :: Terminals :: Terminal Emulators/X Terminals','18 :: 156 :: 158');
INSERT INTO trove_cat VALUES (159,2000032001,156,18,'telnet','Telnet','Support for telnet; terminal sessions across Internet links.',0,0,'Topic :: Terminals :: Telnet','18 :: 156 :: 159');
INSERT INTO trove_cat VALUES (160,2000032001,0,0,'language','Programming Language','Language in which this program was written, or was meant to support.',0,0,'Programming Language','160');
INSERT INTO trove_cat VALUES (161,2000032001,160,160,'apl','APL','APL',0,0,'Programming Language :: APL','160 :: 161');
INSERT INTO trove_cat VALUES (164,2000032001,160,160,'c','C','C',0,0,'Programming Language :: C','160 :: 164');
INSERT INTO trove_cat VALUES (162,2000032001,160,160,'assembly','Assembly','Assembly-level programs. Platform specific.',0,0,'Programming Language :: Assembly','160 :: 162');
INSERT INTO trove_cat VALUES (163,2000051001,160,160,'ada','Ada','Ada',0,0,'Programming Language :: Ada','160 :: 163');
INSERT INTO trove_cat VALUES (165,2000032001,160,160,'cpp','C++','C++',0,0,'Programming Language :: C++','160 :: 165');
INSERT INTO trove_cat VALUES (166,2000032401,160,160,'eiffel','Eiffel','Eiffel',0,0,'Programming Language :: Eiffel','160 :: 166');
INSERT INTO trove_cat VALUES (167,2000032001,160,160,'euler','Euler','Euler',0,0,'Programming Language :: Euler','160 :: 167');
INSERT INTO trove_cat VALUES (168,2000032001,160,160,'forth','Forth','Forth',0,0,'Programming Language :: Forth','160 :: 168');
INSERT INTO trove_cat VALUES (169,2000032001,160,160,'fortran','Fortran','Fortran',0,0,'Programming Language :: Fortran','160 :: 169');
INSERT INTO trove_cat VALUES (170,2000032001,160,160,'lisp','Lisp','Lisp',0,0,'Programming Language :: Lisp','160 :: 170');
INSERT INTO trove_cat VALUES (171,2000041101,160,160,'logo','Logo','Logo',0,0,'Programming Language :: Logo','160 :: 171');
INSERT INTO trove_cat VALUES (172,2000032001,160,160,'ml','ML','ML',0,0,'Programming Language :: ML','160 :: 172');
INSERT INTO trove_cat VALUES (173,2000032001,160,160,'modula','Modula','Modula-2 or Modula-3',0,0,'Programming Language :: Modula','160 :: 173');
INSERT INTO trove_cat VALUES (174,2000032001,160,160,'objectivec','Objective C','Objective C',0,0,'Programming Language :: Objective C','160 :: 174');
INSERT INTO trove_cat VALUES (175,2000032001,160,160,'pascal','Pascal','Pascal',0,0,'Programming Language :: Pascal','160 :: 175');
INSERT INTO trove_cat VALUES (176,2000032001,160,160,'perl','Perl','Perl',0,0,'Programming Language :: Perl','160 :: 176');
INSERT INTO trove_cat VALUES (177,2000032001,160,160,'prolog','Prolog','Prolog',0,0,'Programming Language :: Prolog','160 :: 177');
INSERT INTO trove_cat VALUES (178,2000032001,160,160,'python','Python','Python',0,0,'Programming Language :: Python','160 :: 178');
INSERT INTO trove_cat VALUES (179,2000032001,160,160,'rexx','Rexx','Rexx',0,0,'Programming Language :: Rexx','160 :: 179');
INSERT INTO trove_cat VALUES (180,2000032001,160,160,'simula','Simula','Simula',0,0,'Programming Language :: Simula','160 :: 180');
INSERT INTO trove_cat VALUES (181,2000032001,160,160,'smalltalk','Smalltalk','Smalltalk',0,0,'Programming Language :: Smalltalk','160 :: 181');
INSERT INTO trove_cat VALUES (182,2000032001,160,160,'tcl','Tcl','Tcl',0,0,'Programming Language :: Tcl','160 :: 182');
INSERT INTO trove_cat VALUES (183,2000032001,160,160,'php','PHP','PHP',0,0,'Programming Language :: PHP','160 :: 183');
INSERT INTO trove_cat VALUES (184,2000032001,160,160,'asp','ASP','Active Server Pages',0,0,'Programming Language :: ASP','160 :: 184');
INSERT INTO trove_cat VALUES (185,2000032001,160,160,'shell','Unix Shell','Unix Shell',0,0,'Programming Language :: Unix Shell','160 :: 185');
INSERT INTO trove_cat VALUES (186,2000032001,160,160,'visualbasic','Visual Basic','Visual Basic',0,0,'Programming Language :: Visual Basic','160 :: 186');
INSERT INTO trove_cat VALUES (187,2000032001,14,13,'bsd','BSD License','BSD License',0,0,'License :: OSI Approved :: BSD License','13 :: 14 :: 187');
INSERT INTO trove_cat VALUES (188,2000032001,14,13,'mit','MIT/X Consortium License','MIT License, also the X Consortium License.',0,0,'License :: OSI Approved :: MIT/X Consortium License','13 :: 14 :: 188');
INSERT INTO trove_cat VALUES (189,2000032001,14,13,'mpl','Mozilla Public License (MPL)','Mozilla Public License (MPL)',0,0,'License :: OSI Approved :: Mozilla Public License (MPL)','13 :: 14 :: 189');
INSERT INTO trove_cat VALUES (190,2000032001,14,13,'qpl','QT Public License (QPL)','QT Public License',0,0,'License :: OSI Approved :: QT Public License (QPL)','13 :: 14 :: 190');
INSERT INTO trove_cat VALUES (191,2000032001,14,13,'ibm','IBM Public License','IBM Public License',0,0,'License :: OSI Approved :: IBM Public License','13 :: 14 :: 191');
INSERT INTO trove_cat VALUES (192,2000032001,14,13,'cvw','MITRE Collaborative Virtual Workspace License (CVW)','MITRE Collaborative Virtual Workspace License (CVW)',0,0,'License :: OSI Approved :: MITRE Collaborative Virtual Workspace License (CVW)','13 :: 14 :: 192');
INSERT INTO trove_cat VALUES (193,2000032001,14,13,'ricoh','Ricoh Source Code Public License','Ricoh Source Code Public License',0,0,'License :: OSI Approved :: Ricoh Source Code Public License','13 :: 14 :: 193');
INSERT INTO trove_cat VALUES (194,2000032001,14,13,'python','Python License','Python License',0,0,'License :: OSI Approved :: Python License','13 :: 14 :: 194');
INSERT INTO trove_cat VALUES (195,2000032001,14,13,'zlib','zlib/libpng License','zlib/libpng License',0,0,'License :: OSI Approved :: zlib/libpng License','13 :: 14 :: 195');
INSERT INTO trove_cat VALUES (196,2000040701,13,13,'other','Other/Proprietary License','Non OSI-Approved/Proprietary license.',0,0,'License :: Other/Proprietary License','13 :: 196');
INSERT INTO trove_cat VALUES (197,2000032001,13,13,'publicdomain','Public Domain','Public Domain. No author-retained rights.',0,0,'License :: Public Domain','13 :: 197');
INSERT INTO trove_cat VALUES (198,2000032001,160,160,'java','Java','Java',0,0,'Programming Language :: Java','160 :: 198');
INSERT INTO trove_cat VALUES (199,2000032101,0,0,'os','Operating System','What operating system the program requires to run, if any.',0,0,'Operating System','199');
INSERT INTO trove_cat VALUES (200,2000032101,199,199,'posix','POSIX','POSIX plus standard Berkeley socket facilities. Don\'t list a more specific OS unless your program requires it.',0,0,'Operating System :: POSIX','199 :: 200');
INSERT INTO trove_cat VALUES (201,2000032101,200,199,'linux','Linux','Any version of Linux. Don\'t specify a subcategory unless the program requires a particular distribution.',0,0,'Operating System :: POSIX :: Linux','199 :: 200 :: 201');
INSERT INTO trove_cat VALUES (202,2000032101,200,199,'bsd','BSD','Any variant of BSD. Don\'t specify a subcategory unless the program requires a particular BSD flavor.',0,0,'Operating System :: POSIX :: BSD','199 :: 200 :: 202');
INSERT INTO trove_cat VALUES (203,2000041101,202,199,'freebsd','FreeBSD','FreeBSD',0,0,'Operating System :: POSIX :: BSD :: FreeBSD','199 :: 200 :: 202 :: 203');
INSERT INTO trove_cat VALUES (204,2000032101,202,199,'netbsd','NetBSD','NetBSD',0,0,'Operating System :: POSIX :: BSD :: NetBSD','199 :: 200 :: 202 :: 204');
INSERT INTO trove_cat VALUES (205,2000032101,202,199,'openbsd','OpenBSD','OpenBSD',0,0,'Operating System :: POSIX :: BSD :: OpenBSD','199 :: 200 :: 202 :: 205');
INSERT INTO trove_cat VALUES (206,2000032101,202,199,'bsdos','BSD/OS','BSD/OS',0,0,'Operating System :: POSIX :: BSD :: BSD/OS','199 :: 200 :: 202 :: 206');
INSERT INTO trove_cat VALUES (207,2000032101,200,199,'sun','SunOS/Solaris','Any Sun Microsystems OS.',0,0,'Operating System :: POSIX :: SunOS/Solaris','199 :: 200 :: 207');
INSERT INTO trove_cat VALUES (208,2000032101,200,199,'sco','SCO','SCO',0,0,'Operating System :: POSIX :: SCO','199 :: 200 :: 208');
INSERT INTO trove_cat VALUES (209,2000032101,200,199,'hpux','HP-UX','HP-UX',0,0,'Operating System :: POSIX :: HP-UX','199 :: 200 :: 209');
INSERT INTO trove_cat VALUES (210,2000032101,200,199,'aix','AIX','AIX',0,0,'Operating System :: POSIX :: AIX','199 :: 200 :: 210');
INSERT INTO trove_cat VALUES (211,2000032101,200,199,'irix','IRIX','IRIX',0,0,'Operating System :: POSIX :: IRIX','199 :: 200 :: 211');
INSERT INTO trove_cat VALUES (212,2000032101,200,199,'other','Other','Other specific POSIX OS, specified in description.',0,0,'Operating System :: POSIX :: Other','199 :: 200 :: 212');
INSERT INTO trove_cat VALUES (213,2000032101,160,160,'other','Other','Other programming language, specified in description.',0,0,'Programming Language :: Other','160 :: 213');
INSERT INTO trove_cat VALUES (214,2000032101,199,199,'microsoft','Microsoft','Microsoft operating systems.',0,0,'Operating System :: Microsoft','199 :: 214');
INSERT INTO trove_cat VALUES (215,2000032101,214,199,'msdos','MS-DOS','Microsoft Disk Operating System (DOS)',0,0,'Operating System :: Microsoft :: MS-DOS','199 :: 214 :: 215');
INSERT INTO trove_cat VALUES (216,2000032101,214,199,'windows','Windows','Windows software, not specific to any particular version of Windows.',0,0,'Operating System :: Microsoft :: Windows','199 :: 214 :: 216');
INSERT INTO trove_cat VALUES (217,2000032101,216,199,'win31','Windows 3.1 or Earlier','Windows 3.1 or Earlier',0,0,'Operating System :: Microsoft :: Windows :: Windows 3.1 or Earlier','199 :: 214 :: 216 :: 217');
INSERT INTO trove_cat VALUES (218,2000032101,216,199,'win95','Windows 95/98/2000','Windows 95, Windows 98, and Windows 2000.',0,0,'Operating System :: Microsoft :: Windows :: Windows 95/98/2000','199 :: 214 :: 216 :: 218');
INSERT INTO trove_cat VALUES (219,2000041101,216,199,'winnt','Windows NT/2000','Windows NT and Windows 2000.',0,0,'Operating System :: Microsoft :: Windows :: Windows NT/2000','199 :: 214 :: 216 :: 219');
INSERT INTO trove_cat VALUES (220,2000032101,199,199,'os2','OS/2','OS/2',0,0,'Operating System :: OS/2','199 :: 220');
INSERT INTO trove_cat VALUES (221,2000032101,199,199,'macos','MacOS','MacOS',0,0,'Operating System :: MacOS','199 :: 221');
INSERT INTO trove_cat VALUES (222,2000032101,216,199,'wince','Windows CE','Windows CE',0,0,'Operating System :: Microsoft :: Windows :: Windows CE','199 :: 214 :: 216 :: 222');
INSERT INTO trove_cat VALUES (223,2000032101,199,199,'palmos','PalmOS','PalmOS (for Palm Pilot)',0,0,'Operating System :: PalmOS','199 :: 223');
INSERT INTO trove_cat VALUES (224,2000032101,199,199,'beos','BeOS','BeOS',0,0,'Operating System :: BeOS','199 :: 224');
INSERT INTO trove_cat VALUES (225,2000032101,0,0,'environment','Environment','Run-time environment required for this program.',0,0,'Environment','225');
INSERT INTO trove_cat VALUES (226,2000041101,225,225,'console','Console (Text Based)','Console-based programs.',0,0,'Environment :: Console (Text Based)','225 :: 226');
INSERT INTO trove_cat VALUES (227,2000032401,226,225,'curses','Curses','Curses-based software.',0,0,'Environment :: Console (Text Based) :: Curses','225 :: 226 :: 227');
INSERT INTO trove_cat VALUES (228,2000040701,226,225,'newt','Newt','Newt',0,0,'Environment :: Console (Text Based) :: Newt','225 :: 226 :: 228');
INSERT INTO trove_cat VALUES (229,2000040701,225,225,'x11','X11 Applications','Programs that run in an X windowing environment.',0,0,'Environment :: X11 Applications','225 :: 229');
INSERT INTO trove_cat VALUES (230,2000040701,225,225,'win32','Win32 (MS Windows)','Programs designed to run in a graphical Microsoft Windows environment.',0,0,'Environment :: Win32 (MS Windows)','225 :: 230');
INSERT INTO trove_cat VALUES (231,2000040701,229,225,'gnome','Gnome','Programs designed to run in a Gnome environment.',0,0,'Environment :: X11 Applications :: Gnome','225 :: 229 :: 231');
INSERT INTO trove_cat VALUES (232,2000040701,229,225,'kde','KDE','Programs designed to run in a KDE environment.',0,0,'Environment :: X11 Applications :: KDE','225 :: 229 :: 232');
INSERT INTO trove_cat VALUES (233,2000040701,225,225,'other','Other Environment','Programs designed to run in an environment other than one listed.',0,0,'Environment :: Other Environment','225 :: 233');
INSERT INTO trove_cat VALUES (234,2000040701,18,18,'other','Other/Nonlisted Topic','Topic does not fit into any listed category.',0,0,'Topic :: Other/Nonlisted Topic','18 :: 234');
INSERT INTO trove_cat VALUES (235,2000041001,199,199,'independent','OS Independent','This software does not depend on any particular operating system.',0,0,'Operating System :: OS Independent','199 :: 235');
INSERT INTO trove_cat VALUES (236,2000040701,199,199,'other','Other OS','Program is designe for a nonlisted operating system.',0,0,'Operating System :: Other OS','199 :: 236');
INSERT INTO trove_cat VALUES (237,2000041001,225,225,'web','Web Environment','This software is designed for a web environment.',0,0,'Environment :: Web Environment','225 :: 237');
INSERT INTO trove_cat VALUES (238,2000041101,225,225,'daemon','No Input/Output (Daemon)','This program has no input or output, but is intended to run in the background as a daemon.',0,0,'Environment :: No Input/Output (Daemon)','225 :: 238');
INSERT INTO trove_cat VALUES (239,2000041301,144,18,'gnuhurd','GNU Hurd','Kernel code and modules for GNU Hurd.',0,0,'Topic :: System :: Operating System Kernels :: GNU Hurd','18 :: 136 :: 144 :: 239');
INSERT INTO trove_cat VALUES (240,2000041301,200,199,'gnuhurd','GNU Hurd','GNU Hurd',0,0,'Operating System :: POSIX :: GNU Hurd','199 :: 200 :: 240');
INSERT INTO trove_cat VALUES (241,2000050101,251,18,'napster','Napster','Clients and servers for the Napster file sharing protocol.',0,0,'Topic :: Communications :: File Sharing :: Napster','18 :: 20 :: 251 :: 241');
INSERT INTO trove_cat VALUES (242,2000042701,160,160,'scheme','Scheme','Scheme programming language.',0,0,'Programming Language :: Scheme','160 :: 242');
INSERT INTO trove_cat VALUES (243,2000042701,90,18,'sitemanagement','Site Management','Tools for maintanance and management of web sites.',0,0,'Topic :: Internet :: WWW/HTTP :: Site Management','18 :: 87 :: 90 :: 243');
INSERT INTO trove_cat VALUES (244,2000042701,243,18,'linkchecking','Link Checking','Tools to assist in checking for broken links.',0,0,'Topic :: Internet :: WWW/HTTP :: Site Management :: Link Checking','18 :: 87 :: 90 :: 243 :: 244');
INSERT INTO trove_cat VALUES (245,2000042701,87,18,'loganalysis','Log Analysis','Software to help analyze various log files.',0,0,'Topic :: Internet :: Log Analysis','18 :: 87 :: 245');
INSERT INTO trove_cat VALUES (246,2000042701,97,18,'eda','Electronic Design Automation (EDA)','Tools for circuit design, schematics, board layout, and more.',0,0,'Topic :: Scientific/Engineering :: Electronic Design Automation (EDA)','18 :: 97 :: 246');
INSERT INTO trove_cat VALUES (247,2000042701,20,18,'telephony','Telephony','Telephony related applications, to include automated voice response systems.',0,0,'Topic :: Communications :: Telephony','18 :: 20 :: 247');
INSERT INTO trove_cat VALUES (248,2000042801,113,18,'midi','MIDI','Software related to MIDI synthesis and playback.',0,0,'Topic :: Multimedia :: Sound/Audio :: MIDI','18 :: 99 :: 113 :: 248');
INSERT INTO trove_cat VALUES (249,2000042801,113,18,'synthesis','Sound Synthesis','Software for creation and synthesis of sound.',0,0,'Topic :: Multimedia :: Sound/Audio :: Sound Synthesis','18 :: 99 :: 113 :: 249');
INSERT INTO trove_cat VALUES (250,2000042801,90,18,'httpservers','HTTP Servers','Software designed to serve content via the HTTP protocol.',0,0,'Topic :: Internet :: WWW/HTTP :: HTTP Servers','18 :: 87 :: 90 :: 250');
INSERT INTO trove_cat VALUES (251,2000050101,20,18,'filesharing','File Sharing','Software for person-to-person online file sharing.',0,0,'Topic :: Communications :: File Sharing','18 :: 20 :: 251');
INSERT INTO trove_cat VALUES (252,2000071101,97,18,'bioinformatics','Bio-Informatics','Category for gene software (e.g. Gene Ontology)',0,0,'Topic :: Scientific/Engineering :: Bio-Informatics','18 :: 97 :: 252');
INSERT INTO trove_cat VALUES (253,2000071101,136,18,'sysadministration','Systems Administration','Systems Administration Software (e.g. configuration apps.)',0,0,'Topic :: System :: Systems Administration','18 :: 136 :: 253');
INSERT INTO trove_cat VALUES (254,2000071101,160,160,'plsql','PL/SQL','PL/SQL Programming Language',0,0,'Programming Language :: PL/SQL','160 :: 254');
INSERT INTO trove_cat VALUES (255,2000071101,160,160,'progress','PROGRESS','PROGRESS Programming Language',0,0,'Programming Language :: PROGRESS','160 :: 255');
INSERT INTO trove_cat VALUES (256,2000071101,125,18,'nonlineareditor','Non-Linear Editor','Video Non-Linear Editors',0,0,'Topic :: Multimedia :: Video :: Non-Linear Editor','18 :: 99 :: 125 :: 256');
INSERT INTO trove_cat VALUES (257,2000071101,136,18,'softwaredist','Software Distribution','Systems software for distributing other software.',0,0,'Topic :: System :: Software Distribution','18 :: 136 :: 257');
INSERT INTO trove_cat VALUES (258,2000071101,160,160,'objectpascal','Object Pascal','Object Pascal',0,0,'Programming Language :: Object Pascal','160 :: 258');
INSERT INTO trove_cat VALUES (259,2000071401,45,18,'codegen','Code Generators','Code Generators',0,0,'Topic :: Software Development :: Code Generators','18 :: 45 :: 259');
INSERT INTO trove_cat VALUES (260,2000071401,52,18,'SCCS','SCCS','SCCS',0,0,'Topic :: Software Development :: Version Control :: SCCS','18 :: 45 :: 52 :: 260');
INSERT INTO trove_cat VALUES (261,2000072501,160,160,'xbasic','XBasic','XBasic programming language',0,0,'Programming Language :: XBasic','160 :: 261');
INSERT INTO trove_cat VALUES (262,2000073101,160,160,'coldfusion','Cold Fusion','Cold Fusion Language',0,0,'Programming Language :: Cold Fusion','160 :: 262');
INSERT INTO trove_cat VALUES (263,2000080401,160,160,'euphoria','Euphoria','Euphoria programming language - http://www.rapideuphoria.com/',0,0,'Programming Language :: Euphoria','160 :: 263');
INSERT INTO trove_cat VALUES (264,2000080701,160,160,'erlang','Erlang','Erlang - developed by Ericsson - http://www.erlang.org/',0,0,'Programming Language :: Erlang','160 :: 264');
INSERT INTO trove_cat VALUES (265,2000080801,160,160,'Delphi','Delphi','Borland/Inprise Delphi',0,0,'Programming Language :: Delphi','160 :: 265');
INSERT INTO trove_cat VALUES (266,2000081601,97,18,'medical','Medical Science Apps.','Medical / BioMedical Science Apps.',0,0,'Topic :: Scientific/Engineering :: Medical Science Apps.','18 :: 97 :: 266');
INSERT INTO trove_cat VALUES (267,2000082001,160,160,'zope','Zope','Zope Object Publishing',0,0,'Programming Language :: Zope','160 :: 267');
INSERT INTO trove_cat VALUES (268,2000082101,80,18,'Puzzles','Puzzle Games','Puzzle Games',0,0,'Topic :: Games/Entertainment :: Puzzle Games','18 :: 80 :: 268');
INSERT INTO trove_cat VALUES (269,2000082801,160,160,'asm','Assembly','ASM programming',0,0,'Programming Language :: Assembly','160 :: 269');

#
# Table structure for table 'trove_group_link'
#

CREATE TABLE trove_group_link (
  trove_group_id int(11) NOT NULL auto_increment,
  trove_cat_id int(11) DEFAULT '0' NOT NULL,
  trove_cat_version int(11) DEFAULT '0' NOT NULL,
  group_id int(11) DEFAULT '0' NOT NULL,
  trove_cat_root int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (trove_group_id),
  KEY idx_trove_group_link_group_id (group_id),
  KEY idx_trove_group_link_cat_id (trove_cat_id)
);

#
# Dumping data for table 'trove_group_link'
#

#
# Table structure for table 'trove_treesums'
#

CREATE TABLE trove_treesums (
  trove_treesums_id int(11) NOT NULL auto_increment,
  trove_cat_id int(11) DEFAULT '0' NOT NULL,
  limit_1 int(11) DEFAULT '0' NOT NULL,
  subprojects int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (trove_treesums_id)
);

#
# Dumping data for table 'trove_treesums'
#


#
# Table structure for table 'unix_uids'
#

CREATE TABLE unix_uids (
  id int(11) NOT NULL auto_increment,
  PRIMARY KEY (id)
);

#
# Dumping data for table 'unix_uids'
#

INSERT INTO unix_uids VALUES (1);

#
# Table structure for table 'user_bookmarks'
#

CREATE TABLE user_bookmarks (
  bookmark_id int(11) NOT NULL auto_increment,
  user_id int(11) DEFAULT '0' NOT NULL,
  bookmark_url text,
  bookmark_title text,
  PRIMARY KEY (bookmark_id),
  KEY idx_user_bookmark_user_id (user_id)
);

#
# Dumping data for table 'user_bookmarks'
#


#
# Table structure for table 'user_diary'
#

CREATE TABLE user_diary (
  id int(11) NOT NULL auto_increment,
  user_id int(11) DEFAULT '0' NOT NULL,
  date_posted int(11) DEFAULT '0' NOT NULL,
  summary text,
  details text,
  is_public int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (id),
  KEY idx_user_diary_user_date (user_id,date_posted),
  KEY idx_user_diary_date (date_posted),
  KEY idx_user_diary_user (user_id)
);

#
# Dumping data for table 'user_diary'
#


#
# Table structure for table 'user_diary_monitor'
#

CREATE TABLE user_diary_monitor (
  monitor_id int(11) NOT NULL auto_increment,
  monitored_user int(11) DEFAULT '0' NOT NULL,
  user_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (monitor_id),
  KEY idx_user_diary_monitor_user (user_id),
  KEY idx_user_diary_monitor_monitored_user (monitored_user)
);

#
# Dumping data for table 'user_diary_monitor'
#


#
# Table structure for table 'user_group'
#

CREATE TABLE user_group (
  user_group_id int(11) NOT NULL auto_increment,
  user_id int(11) DEFAULT '0' NOT NULL,
  group_id int(11) DEFAULT '0' NOT NULL,
  admin_flags char(16) DEFAULT '' NOT NULL,
  bug_flags int(11) DEFAULT '0' NOT NULL,
  forum_flags int(11) DEFAULT '0' NOT NULL,
  project_flags int(11) DEFAULT '2' NOT NULL,
  patch_flags int(11) DEFAULT '1' NOT NULL,
  support_flags int(11) DEFAULT '1' NOT NULL,
  doc_flags int(11) DEFAULT '0' NOT NULL,
  cvs_flags int(11) DEFAULT '1' NOT NULL,
  PRIMARY KEY (user_group_id),
  KEY idx_user_group_user_id (user_id),
  KEY idx_user_group_group_id (group_id),
  KEY bug_flags_idx (bug_flags),
  KEY forum_flags_idx (forum_flags),
  KEY project_flags_idx (project_flags),
  KEY admin_flags_idx (admin_flags)
);

#
# Dumping data for table 'user_group'
#

INSERT INTO user_group VALUES (1,101,2,'A',2,2,2,1,1,0,1);

#
# Table structure for table 'user_metric'
#

CREATE TABLE user_metric (
  ranking int(11) NOT NULL auto_increment,
  user_id int(11) DEFAULT '0' NOT NULL,
  times_ranked int(11) DEFAULT '0' NOT NULL,
  avg_raters_importance float(10,8) DEFAULT '0.00000000' NOT NULL,
  avg_rating float(10,8) DEFAULT '0.00000000' NOT NULL,
  metric float(10,8) DEFAULT '0.00000000' NOT NULL,
  percentile float(10,8) DEFAULT '0.00000000' NOT NULL,
  importance_factor float(10,8) DEFAULT '0.00000000' NOT NULL,
  PRIMARY KEY (ranking)
);

#
# Dumping data for table 'user_metric'
#


#
# Table structure for table 'user_metric0'
#

CREATE TABLE user_metric0 (
  ranking int(11) NOT NULL auto_increment,
  user_id int(11) DEFAULT '0' NOT NULL,
  times_ranked int(11) DEFAULT '0' NOT NULL,
  avg_raters_importance float(10,8) DEFAULT '0.00000000' NOT NULL,
  avg_rating float(10,8) DEFAULT '0.00000000' NOT NULL,
  metric float(10,8) DEFAULT '0.00000000' NOT NULL,
  percentile float(10,8) DEFAULT '0.00000000' NOT NULL,
  importance_factor float(10,8) DEFAULT '0.00000000' NOT NULL,
  PRIMARY KEY (ranking),
  KEY idx_user_metric0_user_id (user_id)
);

#
# Dumping data for table 'user_metric0'
#


#
# Table structure for table 'user_metric_tmp1_1'
#

CREATE TABLE user_metric_tmp1_1 (
  user_id int(11) DEFAULT '0' NOT NULL,
  times_ranked int(11) DEFAULT '0' NOT NULL,
  avg_raters_importance float(10,8) DEFAULT '0.00000000' NOT NULL,
  avg_rating float(10,8) DEFAULT '0.00000000' NOT NULL,
  metric float(10,8) DEFAULT '0.00000000' NOT NULL
);

#
# Dumping data for table 'user_metric_tmp1_1'
#


#
# Table structure for table 'user_preferences'
#

CREATE TABLE user_preferences (
  user_id int(11) DEFAULT '0' NOT NULL,
  preference_name varchar(20),
  preference_value varchar(20),
  set_date int(11) DEFAULT '0' NOT NULL,
  KEY idx_user_pref_user_id (user_id)
);

#
# Dumping data for table 'user_preferences'
#


#
# Table structure for table 'user_ratings'
#

CREATE TABLE user_ratings (
  rated_by int(11) DEFAULT '0' NOT NULL,
  user_id int(11) DEFAULT '0' NOT NULL,
  rate_field int(11) DEFAULT '0' NOT NULL,
  rating int(11) DEFAULT '0' NOT NULL,
  KEY idx_user_ratings_rated_by (rated_by),
  KEY idx_user_ratings_user_id (user_id)
);

#
# Dumping data for table 'user_ratings'
#


#
# Table structure for table 'users'
#

CREATE TABLE users (
  user_id int(11) NOT NULL auto_increment,
  user_name text DEFAULT '' NOT NULL,
  email text DEFAULT '' NOT NULL,
  user_pw varchar(32) DEFAULT '' NOT NULL,
  realname varchar(32) DEFAULT '' NOT NULL,
  status char(1) DEFAULT 'A' NOT NULL,
  shell varchar(20) DEFAULT '/bin/bash' NOT NULL,
  unix_pw varchar(40) DEFAULT '' NOT NULL,
  unix_status char(1) DEFAULT 'N' NOT NULL,
  unix_uid int(11) DEFAULT '0' NOT NULL,
  unix_box varchar(10) DEFAULT 'shell1' NOT NULL,
  add_date int(11) DEFAULT '0' NOT NULL,
  confirm_hash varchar(32),
  mail_siteupdates int(11) DEFAULT '0' NOT NULL,
  mail_va int(11) DEFAULT '0' NOT NULL,
  authorized_keys text,
  email_new text,
  people_view_skills int(11) DEFAULT '0' NOT NULL,
  people_resume text DEFAULT '' NOT NULL,
  timezone varchar(64) DEFAULT 'GMT',
  language int(11) DEFAULT '1' NOT NULL,
  PRIMARY KEY (user_id),
  KEY idx_user_user (status)
);

#
# Dumping data for table 'users'
#

INSERT INTO users VALUES (100,'None','noreply@sourceforge.net','*********34343','','A','/bin/bash','','N',0,'shell1',0,NULL,0,0,NULL,NULL,0,'','GMT',1);
