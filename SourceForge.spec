Summary:	Breaking Down the Barriers to Open Source Development
Summary(pl):	Prze³amywanie barier tworzenia Wolnego Oprogramowania
Name:		SourceForge
Version:	2.0_cvs_20001116
Release:	3
License:	GPL
Group:		Development/Version Control
Source0:	SF%{version}.tar.gz
# Source0-md5:	5b6b68962e97f16ae4faf13ac9e40808
Source1:	%{name}-README.PLD
Source2:	%{name}-mod_vhost_alias.conf
Source3:	%{name}.sql
Patch0:		%{name}-PLD.patch
Patch1:		%{name}-config.patch
Requires:	php >= 3.0
Requires:	php-mysql
Requires:	mysql-client
Requires:	mysql >= 3.23
Requires:	apache-mod_ssl
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
SourceForge is a free service to Open Source developers offering easy
access to the best in CVS, mailing lists, bug tracking, message
boards/forums, task management, site hosting, permanent file archival,
full backups, and total web-based administration.

%description -l pl
SourceForge jest darmow± us³ug± dla developerów oprogramowania z
otwartymi ¼ród³ami, oferuj±c ³atwy dostêp do CVSa, list dyskusyjnych,
systemów ¶ledzenia b³êdów, tablic og³oszeñ, zarz±dzania zadaniami,
zarz±dzania stron± WWW, archiwizacji plików i ogólnej administracji
opartej na WWW.

%prep
%setup -q -n SF%{version}
%patch0 -p1
%patch1 -p1

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT/home/httpd/SourceForge/cache
install -d $RPM_BUILD_ROOT%{_sysconfdir}/SourceForge

cp -af * $RPM_BUILD_ROOT/home/httpd/SourceForge
cp -f %{SOURCE3} $RPM_BUILD_ROOT/home/httpd/SourceForge/db/SourceForge.sql
install etc/local.inc $RPM_BUILD_ROOT%{_sysconfdir}/SourceForge

install %{SOURCE1} README.PLD
install %{SOURCE2} apache-mod_vhost_alias.conf

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc docs/*
%doc AUTHORS ChangeLog README README.PLD apache-mod_vhost_alias.conf
%{_sysconfdir}/SourceForge
%dir %attr(775,root,http) /home/httpd/SourceForge/cache
%attr(755,root,root) /home/httpd/SourceForge/backend/*.pl
%attr(755,root,root) /home/httpd/SourceForge/backend/shell/*.sh
/home/httpd/SourceForge/backend/zones/*.zone
/home/httpd/SourceForge/db
%attr(755,root,root) /home/httpd/SourceForge/monitor
%attr(755,root,root) /home/httpd/SourceForge/utils/*.pl
/home/httpd/SourceForge/utils/*.c
/home/httpd/SourceForge/utils/*.php
/home/httpd/SourceForge/utils/*.txt
%attr(755,root,root) /home/httpd/SourceForge/utils/*/*.pl
%attr(755,root,root) /home/httpd/SourceForge/utils/*/*.sh
/home/httpd/SourceForge/utils/*/*.zone
/home/httpd/SourceForge/www
