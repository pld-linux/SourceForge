Summary:	
Summary(pl):	
Name:		SourceForge
Version:	1.1.0
Release:	1
License:	GPL
Group:		
Group(pl):	
Source:		%{name}-%{version}.tar.gz
Requires:	php
Requires:	mysql
Requires:	apache-mod_ssl
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description

%description -l pl

%prep
%setup -q

%build

%install
rm -rf $RPM_BUILD_ROOT

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc docs/*
