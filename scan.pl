#!/usr/bin/perl
use IO::Socket;
$host = $ARGV[0]; # El primer argumento es el host
$port = $ARGV[1]; # segundo argumento el/los puertos a escanear
if($port =~ /-/){ # Si se escribe 20-30 se escaneara del puerto 20 AL 30
  @expl = split('-',$port);
  my $cantArg = scalar(@expl);# Cuento la cantidad de elementos ingresados en el segundo argumento 
  if($cantArg==2){ # Si ingreso por ejemplo dos elementos (20-32) se escanea del 20 al 32
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
    close $con;	# cierro conexión				  
    }
  }elsif($cantArg==0){  #Si se coloco "-" solamente entonces se escaneara por defecto del puerto 20 al mil
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
  }
}elsif($port =~ /,/){ # Si el argumento se separa por coma se escaneara puertos individuales
  @expl = split(',',$port);
  my $cantArg = scalar(@expl); #contamos cuantos puertos puso
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
                              PeerPort => $port,
                              Proto => 'tcp',
                              Timeout =>2
                              );
            if($con){
	      use Term::ANSIColor;
	      print color 'bold green';	    
              print("El puerto ".$port." esta abierto\n");		
	      print color "reset";
	    }else{
              print "Puerto ".$port." esta cerrado \n";  
            }
       close $con;					   
  }	
	 	 