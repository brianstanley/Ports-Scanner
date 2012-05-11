#/usr/bin/perl-w
use Socket; #llamamos al modulo socket
my($host,$port, $data, $protocol); #declaramos variables a usar
print("Ingresar ip que quiere escanear>"); 
$host=<STDIN>;
chomp($host);
$port=20; #Empiezo a escanear desde el puerto 20
$protocol = getprotobyname('tcp'); #retorna datos que utilizara el socket de acuerdo a tcp
for($port;$port<=1000;$port++){
	socket(Sock_Manejador, PF_INET, SOCK_STREAM, $protocol) || die "socket: $!"; #gestionamos socket
	$data = sockaddr_in($port,inet_aton($host));#preparamos la data que usaremos para la conexion
	if(connect(Sock_Manejador,$data)){
	   use Term::ANSIColor; #Para colorear en verde si se conecta
	   print color 'bold green';
	   print("El puerto ".$port." esta abierto\n");		
	   print color 'reset';	
	}else{
           print "Puerto ".$port." cerrado\n";
	};
	close(Sock_Manejador);	 # cerramos sockets
};
exit;