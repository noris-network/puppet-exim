# puppet-exim

The exim puppet module installes and configures exim.
The goal is to support the most complex configurations and compile them
into a nice, easy to read, single configuration file.

## Usage

In the simpliest form, you can just include the exim class:

```puppet
  include exim
```

This configures exim so that it will accept mails generated on the local system,
and forwards it to mail.<domain of your system>.

This will probably not work for you, so I suggest building your own custom configuration.
Here is an example replicating the default config:

Load the main class.
Disable the default config.
Set the acl used for rcpt checking to "acl_check_rcpt" (default, shown for demonstation)
```puppet
  class {'exim':
    defaults       => false,
    acl_check_rcpt => 'acl_check_rcpt',
  }
```

Create a new, empty acl list named "acl_check_rcpt" and assign an id to it:
```puppet
  exim::acl {'acl_check_rcpt':
    acl_id => 1,
  }
```

Fill the acl with statements, referencing the id given above:
```puppet
  exim::acl::statement {'Accept local':
    acl_id     => 1,
    order      => 1,
    action     => 'accept',
    conditions => [ ['hosts',[':']] ],
  }
  exim::acl::statement {'Accept hostlist':
    acl_id     => 1,
    order      => 2,
    action     => 'accept',
    conditions => [ ['hosts'   , ['@','127.0.0.1']], ]
  }
  exim::acl::statement {'deny all':
    acl_id     => 1,
    order      => 3,
    action     => 'deny',
    conditions => [ ['message' , ['relay not permitted']], ]
  }
```

Create 2 routers, one to do aliasing, and one to send mails to a remote smarthost:

```puppet
  exim::router {'system_aliases':
    order       => 1,
    driver      => 'redirect',
    domains     => '@',
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
```

Create an smtp-transport:
```puppet
  exim::transport {'remote_smtp':
    driver          => 'smtp',
  }
```
Create a default retry rule for all (*) mails:
```puppet
  exim::retry {'*':}
```

