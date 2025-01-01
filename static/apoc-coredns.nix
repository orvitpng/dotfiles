''
  . {
      forward . 1.1.1.1 1.0.0.1
      cache
  }

  sonnygrace.net {
      hosts {
          192.168.0.2 sonnygrace.net
      }
      rewrite name regex (.*)\.sonnygrace\.net sonnygrace.net
  }
''
