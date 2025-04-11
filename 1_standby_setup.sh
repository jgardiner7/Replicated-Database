rm -rf /var/lib/postgresql/data/*
export PGPASSWORD="${POSTGRES_PASSWORD}"
pg_basebackup -h primary_db -D /var/lib/postgresql/data -U ${POSTGRES_USER} -Fp -Xs -P -C -S standby_slot

touch /var/lib/postgresql/data/standby.signal

echo "primary_conninfo = 'host=primary_db user=${POSTGRES_USER} password=${POSTGRES_PASSWORD}'" >> /var/lib/postgresql/data/postgresql.conf
echo "primary_slot_name = 'standby_slot'" >> /var/lib/postgresql/data/postgresql.conf