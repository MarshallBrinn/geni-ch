pkgsysconfdir = $(sysconfdir)/$(PACKAGE)

# TODO: change this to a more sane directory like
#       $(pkgdatadir)/plugins where $pkgdatadir is
#       /usr/share/geni-chapi or similar
plugindir = $(pkgdatadir)/../geni-ch/chapi/chapi/plugins

edit = sed \
	-e 's|@bindir[@]|$(bindir)|g' \
	-e 's|@pkgdatadir[@]|$(pkgdatadir)|g' \
	-e 's|@pkgsysconfdir[@]|$(pkgsysconfdir)|g' \
	-e 's|@prefix[@]|$(prefix)|g'

nobase_dist_plugin_DATA = \
	__init__.py \
	chapiv1rpc/MANIFEST.json \
	chapiv1rpc/__init__.py \
	chapiv1rpc/chapi/Clearinghouse.py \
	chapiv1rpc/chapi/DelegateBase.py \
	chapiv1rpc/chapi/Exceptions.py \
	chapiv1rpc/chapi/GuardBase.py \
	chapiv1rpc/chapi/HandlerBase.py \
	chapiv1rpc/chapi/MemberAuthority.py \
	chapiv1rpc/chapi/MethodContext.py \
	chapiv1rpc/chapi/Memoize.py \
	chapiv1rpc/chapi/Parameters.py \
	chapiv1rpc/chapi/SliceAuthority.py \
	chapiv1rpc/chapi/__init__.py \
	chapiv1rpc/plugin.py \
	chrm/__init__.py \
	chrm/ABACGuard.py \
	chrm/ArgumentCheck.py \
	chrm/CHDatabaseEngine.py \
	chrm/CHv1Guard.py \
	chrm/CHv1Implementation.py \
	chrm/CHv1PersistentImplementation.py \
	chrm/MANIFEST.json \
	chrm/ServiceRegistry.py \
	chrm/plugin.py \
	csrm/__init__.py \
	csrm/CredentialStore.py \
	csrm/MANIFEST.json \
	csrm/plugin.py \
	flaskrest/__init__.py \
	flaskrest/plugin.py \
	flaskrest/MANIFEST.json \
	logging/__init__.py \
	logging/Logging.py \
	logging/MANIFEST.json \
	logging/plugin.py \
	marm/__init__.py \
	marm/MANIFEST.json \
	marm/MAv1Guard.py \
	marm/MAv1Implementation.py \
	marm/plugin.py \
	opsmon/__init__.py \
	opsmon/plugin.py \
	opsmon/MANIFEST.json \
	opsmon/OpsMon.py \
	sarm/__init__.py \
	sarm/MANIFEST.json \
	sarm/SAv1Guard.py \
	sarm/SAv1PersistentImplementation.py \
	sarm/plugin.py
