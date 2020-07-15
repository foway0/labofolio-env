# labofolio-env

## QuickStart

```
git clone git@github.com:foway0/labofolio-env.git
cd labofolio-env
make init
make setup
make dressup
```

## hostfile

127.0.0.1 local-api.labofolio.com
127.0.0.1 local-admin.labofolio.com

## Makefile command

See [Makefile](https://github.com/foway0/labofolio-env/blob/master/Makefile)

## file tree
└── labofolio-env
    ├── Makefile
    ├── README.md
    ├── docker-compose.yml
    ├── env_template
    ├── extends
    │   ├── mysql
    │   │   ├── Dockerfile
    │   │   └── my.cnf
    │   ├── nginx
    │   │   ├── Dockerfile
    │   │   └── nginx.conf
    │   └── redis
    │       ├── Dockerfile
    │       ├── docker-entrypoint.sh
    │       └── redis-cluster.conf
    └── repos
        ├── repos.conf
        └── repos.sh
