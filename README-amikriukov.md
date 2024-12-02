## Build an image

Sources of isolate, compilers and judge0 on the same folder.

### build `judge0-compilers`

```bash
cd judge0-compilers
docker build -t judge0-compilers -f Dockerfile ../
cd ../

# verify image creation
docker images | grep judge0                       
```

Notes:
* Root repository is used for the docker context in order to utilize isolate version from the repository itself.


### build `judge0`

```bash
cd judge0
docker build -t judge0 -f Dockerfile .
cd ..

# verify image creation
docker images | grep judge0  
```

## Run judge0 locally

With docker-compose

```bash
cd judge0
docker compose -f docker-compose.yml up
```

Notes:
* Log level and other default configs are available in `code-execution-judge0/judge0/config/environments/` folder

## Possible problems

There might be problems with cgroup delegation.

```text
Cannot set /sys/fs/cgroup//box-8/cgroup.procs to 2\n: No such file or directory\n
```

What we need to do, is to make sure that isolate will be able to create subgroups and it is added to cgroup.procs

See details in
https://man7.org/conf/ndctechtown2021/cgroups-v2-part-2-diving-deeper-NDC-TechTown-2021-Kerrisk.pdf

For that reason, one solution (instead of `# hack for isolate`) would be to start systemd with the service from [systemd](isolate%2Fsystemd) folder within the container.
Or, as defined at the moment - to create a cgroup during [docker-entrypoint.sh](judge0%2Fdocker-entrypoint.sh) script, and start the process of the application:
That is preferred approach. 