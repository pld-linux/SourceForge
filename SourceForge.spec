Summary:	Breaking Down the Barriers to Open Source Development
Name:		SourceForge
Version:	2.0
Release:	1
License:	GPL
Group:		Development/Version Control
Source:		http://download.sourceforge.net/alexandria/SF2_0.tar.gz
Requires:	php
Requires:	mysql
Requires:	apache-mod_ssl
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description

%description -l pl

%prep
%setup -q -n SF%{version}

%build

%install
rm -rf $RPM_BUILD_ROOT

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc docs/*
