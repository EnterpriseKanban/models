create table if not exists users (
  id uuid default uuid_generate_v4(),
  first_name text not null  constraint first_name_not_empty check (first_name <> ''),
  last_name text not null  constraint last_name_not_empty check (last_name <> ''),
  email text not null  unique constraint email_not_empty check (email <> ''),
  password text constraint password_not_empty check (password <> ''),
  constraint id_pk primary key(id)
);
