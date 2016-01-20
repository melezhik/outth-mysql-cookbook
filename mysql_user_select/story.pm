use DBI;

my $hostname    = host();
my $database    = 'mysql';
my $user        = config()->{'mysql'}{'user'};
my $password    = config()->{'mysql'}{'password'};

my $dsn = "DBI:mysql:database=$database;host=$hostname;port=$port";
 
$dbh = DBI->connect($dsn, $user, $password);

# now retrieve data from the table.
my $sth = $dbh->prepare("SELECT Host,User FROM mysql.user WHERE User='root' AND Host='localhost'");
$sth->execute();
while (my $ref = $sth->fetchrow_hashref()) {
  set_stdout("Host : $ref->{'Host'} User: $ref->{'User'}");
}
$sth->finish();
 
