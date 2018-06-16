$TTL    86400
$ORIGIN jswlabs.com.
@  1D  IN  SOA ns1.jswlabs.com. hostmaster.jswlabs.com. (
                              2002022401 ; serial
                              3H ; refresh
                              15 ; retry
                              1w ; expire
                              3h ; nxdomain ttl
                             )
       IN  NS     ns1.jswlabs.com. ; in the domain
       IN  NS     ns2.external-domain.org. ; external to domain
@      IN  MX  10 mail.jswlabs.com. ; external mail provider
ns1    IN  A      192.168.0.1
www    IN  A      192.168.0.2
admin  IN  A      192.168.0.3
demo   IN  CNAME  www