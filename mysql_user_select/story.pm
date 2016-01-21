use DBI;

my $hostname    = host();
my $database    = 'mysql';
my $port        = config()->{'mysql'}{'port'};

my $user        = config()->{'mysql'}{'user'};
my $password    = config()->{'mysql'}{'password'};

my $dsn = "DBI:mysql:database=$database;host=$hostname;port=$port";
 
$dbh = DBI->connect($dsn, $user, $password);

warn $port;
warn $user;
warn $password;
warn $hostname;
warn $database;

my $sth = $dbh->prepare("SELECT Host,User FROM mysql.user WHERE User='root' AND Host='127.0.0.1'");
$sth->execute();

set_stdout(qq{'SELECT Host,User FROM mysql.user WHERE User='root' AND Host='127.0.0.1'});
while (my $ref = $sth->fetchrow_hashref()) {
  set_stdout("Host : $ref->{'Host'} User: $ref->{'User'}");
}
$sth->finish();

my $sth = $dbh->prepare("SELECT Host,User FROM mysql.user WHERE User='root' AND Host='localhost'");
$sth->execute();

set_stdout(qq{'SELECT Host,User FROM mysql.user WHERE User='root' AND Host='localhost'});
while (my $ref = $sth->fetchrow_hashref()) {
  set_stdout("Host : $ref->{'Host'} User: $ref->{'User'}");
}
$sth->finish();

