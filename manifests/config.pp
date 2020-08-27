# @api private
class exim::config inherits exim {

  concat { $::exim::config_path:
  }
  concat::fragment { 'main':
    target  => $::exim::config_path,
    content => template("${module_name}/base.erb"),
    order   => '0001',
  }
  concat::fragment { 'acl-header':
    target  => $::exim::config_path,
    content => template("${module_name}/acl/acl-header.erb"),
    order   => '1000',
  }
  concat::fragment { 'router-header':
    target  => $::exim::config_path,
    content => template("${module_name}/router/router-header.erb"),
    order   => '2000',
  }
  concat::fragment { 'transport-header':
    target  => $::exim::config_path,
    content => template("${module_name}/transport/transport-header.erb"),
    order   => '3000',
  }
  concat::fragment { 'retry-header':
    target  => $::exim::config_path,
    content => template("${module_name}/retry/retry-header.erb"),
    order   => '4000',
  }
  concat::fragment { 'authenticator-header':
    target  => $::exim::config_path,
    content => template("${module_name}/authenticator/authenticator-header.erb"),
    order   => '5000',
  }
  concat::fragment { 'rewrite-header':
    target  => $::exim::config_path,
    content => template("${module_name}/rewrite/rewrite-header.erb"),
    order   => '6000',
  }
  if ($::exim::defaults == true) {
    ensure_resources('exim::acl',
      lookup('exim::::defaults::acls',Optional[Hash], 'deep', {}))
    ensure_resources('exim::acl::statement',
      lookup('exim::::defaults::acl::statements',Optional[Hash], 'deep', {}))
    ensure_resources('exim::router',
      lookup('exim::::defaults::routers',Optional[Hash], 'deep', {}))
    ensure_resources('exim::transport',
      lookup('exim::::defaults::transports',Optional[Hash], 'deep', {}))
    ensure_resources('exim::retry',
      lookup('exim::::defaults::retries',Optional[Hash], 'deep', {}))
    ensure_resources('exim::hostlist',
      lookup('exim::::defaults::hostlists',Optional[Hash], 'deep', {}))
    ensure_resources('exim::domainlist',
      lookup('exim::::defaults::domainlists',Optional[Hash], 'deep', {}))
    ensure_resources('exim::authenticator',
      lookup('exim::::defaults::authenticators',Optional[Hash], 'deep', {}))
  }
  if ($::exim::ensure_resources == true) {
    ensure_resources('exim::acl',
      lookup('exim::acls',Optional[Hash], 'deep', {}))
    ensure_resources('exim::acl::statement',
      lookup('exim::acl::statements',Optional[Hash], 'deep', {}))
    ensure_resources('exim::router',
      lookup('exim::routers',Optional[Hash], 'deep', {}))
    ensure_resources('exim::transport',
      lookup('exim::transports',Optional[Hash], 'deep', {}))
    ensure_resources('exim::retry',
      lookup('exim::retries',Optional[Hash], 'deep', {}))
    ensure_resources('exim::hostlist',
      lookup('exim::hostlists',Optional[Hash], 'deep', {}))
    ensure_resources('exim::domainlist',
      lookup('exim::domainlists',Optional[Hash], 'deep', {}))
    ensure_resources('exim::authenticator',
      lookup('exim::authenticators',Optional[Hash], 'deep', {}))
  }
}
