# influx-s3-backup
This is "simple as it gets" influxDB 2.0 backup script with S3 used as storage. With bundled helm chart and docker container.

# How to use

As helm chart.
```shell
# add helm repository
helm repo add encero https://encero.github.io/influx-s3-backup/

touch values.yaml

#install the helm chart
helm upgrade --install --values values.yaml influx-s3-backup encero/influx-s3-backup
```

or the container directly
```shell
docker run ghcr.io/encero/influx-s3-backup
```

# configuration
See the [docker/backup.sh](docker/backup.sh) and [charts/influx-s3-backup/values.yaml](charts/influx-s3-backup/values.yaml) for configuration options.


