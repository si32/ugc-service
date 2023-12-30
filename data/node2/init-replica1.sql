CREATE DATABASE replica;

CREATE TABLE replica.users_activities (
    id UUID,
    user_id UUID,
    film_id UUID,
    event_name String,
    comment String,
    film_sec Int64,
    like Bool,
    event_time DateTime
) Engine=ReplicatedMergeTree('/clickhouse/tables/shard1/users_activities', 'replica_2') PARTITION BY toYYYYMMDD(event_time) ORDER BY id;
