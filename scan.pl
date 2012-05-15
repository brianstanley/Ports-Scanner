#!/usr/bin/perl
use IO::Socket;
$host = $ARGV[0];
$arg = $ARGV[1];
if($arg =~ /-/){
  @expl = split('-',$arg);
  my $cantArg = scalar(@expl);
  if($cantArg==2){
    for($port=@expl[0]; $port<=@expl[1];$port++){
            my $con = IO::Socket::INET->new(
                              PeerAddr => $host,
                              PeerPort => $port,
                              Proto => 'tcp',
                              Timeout =>2
                              );
            if($con){
		use Term::ANSIColor; #para colorear en verde si se conecta
		print color 'bold green';
		print("El puerto ".$port." esta abierto\n ");
		print color 'reset';
		
            }else{
		print "Puerto ".$port." esta cerrado \n";  
            }   
    close $con;					  
    }
  }elsif($cantArg==0){
    for($port=20; $port<=1000;$port++){
            my $con = IO::Socket::INET->new(
                              PeerAddr => $host,
                              PeerPort => $port,
                              Proto => 'tcp',
                              Timeout =>2
                              );
         if($con){
		use Term::ANSIColor; #para colorear en verde si se conecta
		print color 'bold green';
		print("El puerto ".$port." esta abierto\n ");
		print color 'reset';
		
            }else{
		print "Puerto ".$port." esta cerrado \n";  
            }  
    close $con;					  
    }
  }elsif($cantArg==1){
    my $con = IO::Socket::INET->new(
                              PeerAddr => $host,
                              PeerPort => @expl[0],
                              Proto => 'tcp',
                              Timeout =>2
                              );
              if($con){
		use Term::ANSIColor; #para colorear en verde si se conecta
		print color 'bold green';
		print("El puerto ".$port." esta abierto\n ");
		print color 'reset';
		
            }else{
		print "Puerto ".$port." esta cerrado \n";  
            }
       close $con;					   
  }
}elsif($arg =~ /,/){
  @expl = split(',',$arg);
  my $cantArg = scalar(@expl);
  for($i=0;$i<$cantArg;$i++){
        my $con = IO::Socket::INET->new(
                              PeerAddr => $host,
                              PeerPort => @expl[$i],
                              Proto => 'tcp',
                              Timeout =>2
                              );
            if($con){
	      use Term::ANSIColor;
	      print color 'bold green';	    
              print("El puerto ".@expl[$i]." esta abierto\n");		
	      print color "reset";
	    }else{
              print "Puerto ".@expl[$i]." esta cerrado \n";  
            }
       close $con;					   
  }  
}else{
        my $con = IO::Socket::INET->new(
                              PeerAddr => $host,
                              PeerPort => $arg,
                              Proto => 'tcp',
                              Timeout =>2
                              );
            if($con){
	      use Term::ANSIColor;
	      print color 'bold green';	    
              print("El puerto ".$arg." esta abierto\n");		
	      print color "reset";
	    }else{
              print "Puerto ".$arg." esta cerrado \n";  
            }
       close $con;					   
  }	
	 	 