# GPG 

```
gpg --verify linux-6.12.tar.xz.sig linux-6.12.tar.xz
```

most time will not have gpg key 

```
gpg --auto-key-retrieve --verify yourfile.tar.xz.sig
```

expand tarball xz files 

```
tar -xJvf yourfile.tar.xz
```

