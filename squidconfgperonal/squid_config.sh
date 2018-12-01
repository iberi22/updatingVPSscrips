
acl url1 url_regex -i 127.0.0.1
acl url2 url_regex -i localhost
acl url3 url_regex -i yourippppppppppppppppp
http_access allow url1
http_access allow url2
http_access allow url3
http_access deny all
http_port 8080
http_port 80
http_port 3128
forwarded_for off
via off
# NOMBRE DEL SERVIDOR
visible_hostname VPS_TEST_s4m@beri
# CACHE CONFIGURACIONTEST1 SQUID4.4
#disable cache descomentar # cache deny all
#cache deny all
cache_mem 1000 MB
memory_cache_mode always
maximum_object_size_in_memory 32 KB
maximum_object_size 1024 MB
minimum_object_size 0 KB
cache_swap_low 70
cache_swap_high 75
#cache_dir ufs /var/spool/squid 100 16 256
cache_dir ufs /var/spool/squid 5000 16 256
access_log /var/log/squid/access.log squid

