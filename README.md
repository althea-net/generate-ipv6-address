### GENERATE-IPV6-ADDRESS
generate-ipv6-address - perform IPv6 address generation

## SYNOPSIS       

	generate-ipv6-address [ -p ] { -r | prefix } [ mac-48 ]

## DESCRIPTION       
Generate-ipv6-address generates IPv6 addresses from a given prefix and either a given MAC-48 address (an Ethernet hadrware address) or a randomly drawn host number.

## OPTIONS       

	-p     Generate a prefix rather than a node address.

	-r     Use a randomly generated RFC 4193 prefix.

	-s     Use a randomly generated subnet number rather than 0. This is only useful with -r, or when given a /48 prefix.

	**prefix** Use the given prefix.  /64 is implied, except when -s is specified, in which case /48 is implied.

        **mac-48** Generate a host number from the given MAC-48 address.  If omitted, the host number is drawn randomly (and the local/global bit is set to zero).


## EXAMPLES       

Generate a host number from a given prefix and MAC-48 address:              

	$ ahcp-generate-address 2001:DB8:1234:5678:: 12:34:56:78:9a:bc       
	
Generate a host number from a given prefix and a randomly chosen host number:

	$ ahcp-generate-address 2001:DB8:1234:5678:: 
	
Generate a random /48 prefix according to RFC 4193:              

	$ ahcp-generate-address -p -r
 
Generate a random /64 prefix according to RFC 4193:              

	$ generate-ipv6-address -p -r -sSEE ALSO       


## AUTHOR       Juliusz Chroboczek.

