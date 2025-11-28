
# SB-FASTCGI

taken from this git clone 

```
>cd /home/terry/quicklisp/local-projects/
>git clone git@github.com:terryc321/sb-fastcgi.git

> sbcl
>(ql:quickload :sb-fastcgi)
....ok

;; /usr/lib/libfcgi.so.0.0.0
>(sb-fastcgi:load-libfcgi "/usr/lib/x86_64-linux-gnu/libfcgi.so")


```

