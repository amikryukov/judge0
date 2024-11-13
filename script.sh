echo "Running isolated script"
date
sleep 7
echo "Script finished"

docker run \
    --rm \
    --cpus="0.5" \
    --memory="64m" \
    --memory-swap="64m" \
    --pids-limit=50 \
    --network="none" \
    --ulimit cpu=1 \
    --ulimit fsize=1048576 \
    --stop-timeout 5 \
    --stop-signal=SIGKILL \
    -v "$(pwd)/script.sh:/script.sh:ro" \
    alpine:latest \
   timeout 5 /bin/sh /script.sh