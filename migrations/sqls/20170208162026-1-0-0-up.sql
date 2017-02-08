create table if not exists users (
  id uuid default uuid_generate_v4(),
  first_name text,
  last_name text,
  email text,
  password text,
  constraint id_pk primary key(id)
);
