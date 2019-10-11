###### Welcome to DOCEKR SWARM DEMO 
## Author: Dong Duong <dhdong1510@gmail.com>

## Commands

To create docker machines, 1 manager node and 2 worker nodes

    $ docker-machine create manager
    $ docker-machine create worker1
    $ docker-machine create worker2

SSH to manager note, init swarm mode

    $ docker-machine ssh manager

    $ docker swarm init --advertise-addr <manager machine IP Address>

Example result:

```
Swarm initialized: current node (n3odnmp063bvrw12k1n7pel3p) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-5twzecl0vfetwtmtsehxt38m3f5e5rkf0ye4isnfsbyzsu28am-av2q2da2xhzy6z2ysurfinlcs 192.168.99.101:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
```

SSH to worker nodes, join to swarm:

	$ docker-machine ssh worker1

    $ docker swarm join --token SWMTKN-1-5twzecl0vfetwtmtsehxt38m3f5e5rkf0ye4isnfsbyzsu28am-av2q2da2xhzy6z2ysurfinlcs 192.168.99.101:2377

Docker node list

	$docker node ls

Deploy docker stack with docker-compose.yml

	$docker stack deploy -c ./docker-compose.yml <Stack Name>

Docker service list

	$docker service ls

Docker service list with node detail:

	$docker service ps <Service ID>

View service log:

	$docker service logs <Service ID>

Remove stack

	$docker stack rm <Stack Name>
