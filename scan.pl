#/usr/bin/perl-w
use Socket; #llamamos al modulo socket
my($host,$port, $data, $protocol); #declaramos variables a usar
print("Ingresar ip que quiere escanear>"); 
$host=<STDIN>;
chomp($host);
$port=20; #Empieza a escanear desde el puerto 20
$protocol = getprotobyname('tcp'); #retorna datos que utilizara el socket de acuerdo a tcp
for($port;$port<=1000;$port++){
	socket(Sock_Manejador, PF_INET, SOCK_STREAM, $protocol) || die "socket: $!"; #gestionamos socket
	$data = sockaddr_in($port,inet_aton($host));#preparamos la data que usaremos para la conexion, el inet atoma traduce en 4 bytes la direccion ip obligatoria para el connect sock
	if(connect(Sock_Manejador,$data)){ ##conectamos
	   use Term::ANSIColor; #para colorear en verde si se conecta
	   print color 'bold green';
	   print("El puerto ".$port." esta abierto\n");		
	   print color 'reset';	# reiniciamos el color por si va a un puerto cerrado para que no aparesca verde
	}else{
           print "Puerto ".$port." cerrado\n";
	};
	close(Sock_Manejador);	 # cerramos sockets
};
exit;