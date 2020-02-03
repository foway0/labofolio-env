# labofolio-env

## QuickStart

```
git clone git@github.com:foway0/labofolio-env.git
cd labofolio-env
make init
make setup
make dressup
```

## Makefile command

See [Makefile](https://github.com/foway0/labofolio-env/blob/master/Makefile)

## file tree

+ env_template
  - .env
  - ...
+ extends
  - mysql
  - nginx
+ Makefile
+ repos
  + repos.conf (list of clone repos)
  + repos.sh
+ docker-compose.yml