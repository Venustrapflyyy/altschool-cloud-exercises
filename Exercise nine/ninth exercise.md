## Task 
- "193.16.20.35/29". What is the Network IP, number of hosts, range of IP addresses and broadcast IP from this subnet?


## Instruction 
- Submit all your answer as a markdown file in the folder for this exercise 


## Process 

- I first converted the original IP address (193.16.20.35), to binary, which gave me 110000011. 00010000. 00010100. 0010011 

-  '/29' made the first 29 bits unavailable to the host, also making the first 29 bits the network part of the address and the remaining 3 bits the host part in the IP address. 

-  The netmask of the subnet can be gotten by firstly converting the network part into 1s and the host part into 0s then converting these binary numbers to decimal. 

-  The wildcard of the subnet can be gotten by firstly converting the network part into 0s and the host part into 1s then converting these binary numbers to decimal. 

-  Thus, the netmask is both 11111111. 11111111. 11111111. 11111 000 and 255. 255. 255. 248 

-  And the wildcard is both 00000000. 00000000. 00000000. 00000 111 and 0. 0. 0. 7 

-  The addition of both numbers would give 11111111. 11111111. 11111111. 11111111 and 255. 255. 255. 255, in binary and decimal respectively. 

-  The network IP can be gotten by doing; The affected octet in the netmask minus the corresponding octet in the given IP address (both in binary) 
the affected octet in this case is the last octet. The result in binary is converted to decimal as made the last part of the gigen IP address in decimal. 
i.e 11111000 - 00100011 = 00100000 = 32 (in decimal). 

- Network IP = 193. 16. 20. 32

- The broadcast IP can be gotten by adding the wildcard in decimal to the network IP in decimal i.e 193. 16. 20. 32 + 0. 0. 0. 7 = 193. 16. 20. 39 

- Broadcast IP = 193. 16. 20. 39 


- The host min is the IP address immediately after the network IP i.e 193. 16. 20. 33 

- The host max is the IP address immediately before the broadcast IP i.e 193. 16. 20. 38 

- The number of hosts is the number of available IP addresses between the network IP and the broadcast IP i.e "6" 

## Summary/Answer 

- The network IP is 193. 16. 20. 32 

- The number of hosts is 6 

- The range of IP addresses are from 193. 16. 20. 33 to 193. 16. 20. 38 

- The broadcast IP is 193. 16. 20. 39  
