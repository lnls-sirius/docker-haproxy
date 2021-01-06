# HAProxy Docker Image
In order to use version 2.2+ we must replace `reqrep` with `http-request replace-path`.
[HAProxy Community Docs v2.2](https://cbonte.github.io/haproxy-dconv/2.2/configuration.html)

## Running 

Use the `docker-compose.yml` file with `docker-compose` to deploy the container. The image requires a configuration file named `haproxy.cfg` with your cluster settings and a ssl `pem` certificate called `haproxy.pem`. 
