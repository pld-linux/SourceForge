Summary:	Breaking Down the Barriers to Open Source Development
Name:		SourceForge
Version:	2.0
Release:	1
License:	GPL
Group:		Development/Version Control
Group(de):	Entwicklung/Versionkontrolle
Group(pl):	Programowanie/Zarz±dzanie wersjami
Source0:	http://download.sourceforge.net/alexandria/SF2_0.tar.gz
Source1:	SourceForge-README.PLD
Patch0:		%{name}-PLD.patch
Requires:	php >= 3.0
Requires:	php-mysql
Requires:	mysql-client
Requires:	mysql
Requires:	apache-mod_ssl
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
SourceForge is a free service to Open Source developers offering easy
access to the best in CVS, mailing lists, bug tracking, message
boards/forums, task management, site hosting, permanent file archival,
full backups, and total web-based administration.

%description -l pl
SourceForge jest darmow± us³ug± dla developerów oprogramowania z otwartymi
¼ród³ami, oferuj±c ³atwy dostêp do CVSa, list dyskusyjnych, systemów
¶ledzenia b³êdów, tablic og³oszeñ, zarz±dzania zadaniami, zarz±dzania
stron± WWW, archiwizacji plików i ogólnej administracji opartej na WWW.

%prep
%setup -q -n SF%{version}
%patch0 -p1

%build

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT/home/httpd/SourceForge
install -d $RPM_BUILD_ROOT/etc/SourceForge

cp -af * $RPM_BUILD_ROOT/home/httpd/SourceForge
install etc/local.inc $RPM_BUILD_ROOT/etc/SourceForge

install %{SOURCE1} README.PLD

gzip -9nf AUTHORS CONTRIBUTING ChangeLog README README.PLD

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc docs/*
%doc *.gz
/etc/SourceForge
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
