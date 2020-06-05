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

  if $::exim::defaults {
    exim::acl {'acl_check_rcpt':
      statements => {
        'Accept local'    => {
          acl_id     => 1,
          order      => 1,
          action     => 'accept',
          conditions => [ ['hosts',[':']] ],
        },
        'Accept hostlist' => {
          acl_id     => 1,
          order      => 2,
          action     => 'accept',
          conditions => [ ['hosts'   , ['127.0.0.1','@']], ]
        },
        'deny all'        => {
          acl_id     => 1,
          order      => 3,
          action     => 'deny',
          conditions => [ ['message' , ['relay not permitted']], ]
        },
      }
    }

    exim::router {'system_aliases':
      order       => 1,
      driver      => 'redirect',
      domains     => ['@'],
      allow_fail  => true,
      allow_defer => true,
      data        => "\${lookup{\$local_part}lsearch{/etc/aliases}}",
    }
    exim::router {'smarthost':
      order                    => 2,
      driver                   => 'manualroute',
      transport                => 'remote_smtp',
      route_list               => "* mail.${facts['networking']['domain']} byname",
      host_find_failed         => 'defer',
      same_domain_copy_routing => 'yes',
      no_more                  => true,
    }

    exim::transport {'remote_smtp':
      driver          => 'smtp',
    }
    exim::retry {'*':}
  }
}
