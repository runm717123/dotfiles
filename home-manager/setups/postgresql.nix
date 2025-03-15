{
  config,
  pkgs,
  ...
}: let
  env = import (config.home.homeDirectory + "/dotfiles/env.nix");
in {
  home.sessionVariables = {
    PGDATA = "~/postgres/data";
    PGHOST = "$HOME/postgres/lock";
  };

  programs.bash.shellAliases = {
    pgk = "sudo pkill -9 postgres"; # kill postgres
    pgport = "ss -tulnp | grep postgres"; # get postgres port
    pgstart = "pg_ctl start -o \"-p 5433 -k $PGHOST -c listen_addresses='*'\"";
    pg = "pg_ctl";
  };
  # postgresql is a service, not a programs
  # home manager doesn't support services
  # services.postgresql = {
  #   enable = true;
  #   package = pkgs.postgresql_16;
  #   enableTCPIP = true;
  #   authentication = ''
  #     local all all trust
  #     host all all 127.0.0.1/32 trust
  #     host all all ::1/128 trust
  #   '';
  #   dataDir = "${config.home.homeDirectory}/.local/share/postgres";
  #   initialScript = builtins.toFile "init.sql" ''
  #     DO $$
  #     BEGIN
  #       IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = '${env.PG_USERNAME}') THEN
  #         CREATE ROLE ${env.PG_USERNAME} WITH LOGIN SUPERUSER PASSWORD '${env.PG_PASSWORD}';
  #       END IF;
  #     END $$;
  #   '';
  # };
  #};
  #
  # with the above commented out, you can use the following step
  # 1. make sure to have home.sessionVariables.PGDATA and PGHOST defined
  # 2. run initdb -D $PGDATA, it will automatically create the user with $USER
  #
  # NOTE: without $PG_HOST, postgres will try to make lock file in unwritable directory
  # 3. run pg_ctl start -o "-k $PGHOST" // seems like PGHOST need to be used manually like this
  #
  # 4. can use pg_dump -U $USER to dump the database, e.g pg_dump -U $USER -d cat -f backup_cat.sql
  # 5. can use pg_dumpall -U $USER to dump the database, e.g psql -U $USER -d your_database -f backup.sql
  # 6. can use psql -U $USER -d database_name to connect to the database
  # 7. can use \l to list the databases, and \c database_name to change database
  # 8. can use SELECT schema_name FROM information_schema.schemata; to list the schemas
  # 9. can use SELECT tablename FROM pg_tables WHERE schemaname = 'public';
  # 10. test with SELECT * FROM public.users;
  #
  #
  # step to connect from windows
  # 1. ip addr show eth0 | grep "inet ", to get the ip address
  # 2. ss -tulnp | grep postgres, to get the port
  #
  # NOTE: this is not work with step num 3 above as it will override the PGHOST
  # can skip this one, and go to step 4
  # 3. can make postgresql.conf to have, listen_addresses = '*', temporarily
  #
  # NOTE: might not required
  # 4. can make pg_hba.conf to have, host all all 127.0.0.1/32 md5, temporarily
  #
}
