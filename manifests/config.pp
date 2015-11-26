# == Class: exim::config
#
# This class creates exims main config file
#

class exim::config {

  $acl_not_smtp                   = $::exim::acl_not_smtp
  $acl_smtp_data                  = $::exim::acl_smtp_data
  $acl_smtp_mail                  = $::exim::acl_smtp_mail
  $acl_smtp_mime                  = $::exim::acl_smtp_mime
  $acl_smtp_rcpt                  = $::exim::acl_smtp_rcpt
  $daemon_smtp_ports              = $::exim::daemon_smtp_ports
  $gnutls_compat_mode             = $::exim::gnutls_compat_mode
  $includes                       = $::exim::includes
  $macros                         = $::exim::macros
  $message_logs                   = $::exim::message_logs
  $smtp_accept_max_nonmail        = $::exim::smtp_accept_max_nonmail
  $smtp_accept_max_per_connection = $::exim::smtp_accept_max_per_connection

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
          conditions => [ ['hosts'   , ['@','127.0.0.1']], ]
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
      data        => '${lookup{$local_part}lsearch{/etc/aliases}}',
    }
    exim::router {'smarthost':
      order                    => 2,
      driver                   => 'manualroute',
      transport                => 'remote_smtp',
      route_list               => "* mail.${::domain} byname",
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
