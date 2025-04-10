rm -rf /var/lib/postgresql/data/*
export PGPASSWORD="repuser_password"
pg_basebackup -h primary_db -D /var/lib/postgresql/data -U repuser -Fp -Xs -P -C -S standby_slot

touch /var/lib/postgresql/data/standby.signal

echo "primary_conninfo = 'host=primary_db user=repuser password=repuser_password'" >> /var/lib/postgresql/data/postgresql.conf
echo "primary_slot_name = 'standby_slot'" >> /var/lib/postgresql/data/postgresql.conf