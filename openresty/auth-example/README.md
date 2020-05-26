
```shell script
# unknown user
http localhost:8080

# known user
http localhost:8080 x-real-userid:100

#
http localhost:8080 x-real-userid:101

# 
http localhost:8080 Cookie:finauth=777

http localhost:8080 Cookie:finauth=777 x-real-userid:101

http localhost:8080 Cookie:finauth=666 x-real-userid:101
```