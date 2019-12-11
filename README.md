# labofolio-env

## QuickStart

```
git clone git@github.com:foway0/labofolio-env.git
cd labofolio-env
make init
cp -ip repos/labofolio/.env.template repos/labofolio/.env
make dressup
```

## Makefile command

```
make help
    - command list
make init
    - clone repos
make build
    - docker build
make dressup
    - docker start
```

## file tree

- Makefile
- repos
  - repos.conf (list of clone repos)
  - repos.sh