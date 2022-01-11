# puppet-exim

The exim puppet module installes and configures exim.
The goal is to support the most complex configurations and compile them
into a nice, easy to read, single configuration file.

## Usage with hiera

In the simpliest form, you can just include the exim class:

```yaml
  classes:
  - exim
```

This configures exim so that it will accept mails generated on the local system,
and forwards it to mail.<domain of your system>.

This will probably not work for you, so I suggest building your own custom configuration.
Here is an example replicating the default config:

Load the main class.
Disable the default config.
Set the acl used for rcpt checking to "acl_check_rcpt" (default, shown for demonstation)
```yaml
  exim::defaults: false
  exim::acl_smtp_rcpt: 'acl_check_rcpt'
```

Create a new, acl list named "acl_check_rcpt" :
```yaml
  exim::acls:
    'acl_check_rcpt':
      statements:
        'Accept local':
          acl_id: 1
          order:  1
          action: 'accept'
          conditions:
            hosts:
            - ':'
        'Accept hostlist':
          acl_id: 1
          order:  2
          action: 'accept'
          conditions:
            hosts:
            - '127.0.0.1'
            - '@'
        'deny all':
          acl_id: 1
          order:  3
          action: 'deny'
          conditions:
            message:
            - 'relay not permitted'
```

Create 2 routers, one to do aliasing, and one to send mails to a remote smarthost:

```yaml
  exim::routers:
    'system_aliases':
      order: 1
      driver: 'redirect'
      domains:
        - '@'
      allow_fail: true
      allow_defer: true
      data: '${lookup{$local_part}lsearch{/etc/aliases}}'
    'smarthost':
      order: 2
      driver: 'manualroute'
      transport: 'remote_smtp'
      route_list: '* mail.%{facts.networking.domain} byname'
      host_find_failed: 'defer'
      same_domain_copy_routing: true
      no_more: true
```

Create an smtp-transport:
```yaml
  exim::transports:
    'remote_smtp':
      driver: 'smtp'
```
Create an address-pipe-transport:
```yaml
  exim::transports:
    'address_pipe':
      driver: 'pipe'
      log_output: true
      return_fail_output: true
      exim_environment:
        - 'USER1': 'user1'
        - 'USER2': 'user2'
      path: '/usr/bin:/bin'
      timeout: '2h'
      timeout_defer: true
```

Create a default retry rule for all (*) mails:
```yaml
  exim::retries:
    '*': {}
```

## Usage with "classical" puppet code

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
    defaults      => false,
    acl_smtp_rcpt => 'acl_check_rcpt',
  }
```

Create a new, acl list named "acl_check_rcpt" :
```puppet
  exim::acl {'acl_check_rcpt':
    statements => {
      'Accept local' => {
        action     => 'accept',
        conditions => [ ['hosts',[':']] ],
      },
      'Accept hostlist' => {
        action     => 'accept',
        conditions => [ ['hosts'   , ['@','127.0.0.1']], ]
      },
      'deny all' => {
        action     => 'deny',
        conditions => [ ['message' , ['relay not permitted']], ]
      }
    }
  }
```

Create 2 routers, one to do aliasing, and one to send mails to a remote smarthost:

```puppet
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
    route_list               => "* mail.${facts['networking']['domain']} byname",
    host_find_failed         => 'defer',
    same_domain_copy_routing => true,
    no_more                  => true,
  }
```

Create an smtp-transport:
```puppet
  exim::transport {'remote_smtp':
    driver          => 'smtp',
  }
```
Create an address-pipe-transport:
```puppet
  exim::transport {'address_pipe':
    driver             => 'pipe',
    log_output         => true,
    return_fail_output => true,
    exim_environment   => [ 
      { 'USER1'          => 'user1' },
      { 'USER2'          => 'user2' } ],
    path               => '/usr/bin:/bin',
    timeout            => '2h',
    timeout_defer      => true,
  }
```
Create a default retry rule for all (*) mails:
```puppet
  exim::retry {'*':}
```

