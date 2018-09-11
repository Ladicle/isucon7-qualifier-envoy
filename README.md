# ISUCON7 Qualifier x Envoy

## Requirements

HostOS: Ubuntu 18.04
Softwares:
  - docker
  - libvirt
  - vagrant

## Run benchmarker

To move to `$HOME/isubata/bench` directory, and run below command. 

```
isucon@ubuntubox: bin/bench -remotes <WebServerAddress,...> -output result.json 
```

## Getting Started

This instruction runs from in the directory containing this file.  
To clone this repository and run the following command. 

```
$ vagrant up
```

## References

- https://github.com/matsuu/vagrant-isucon/tree/master/isucon7-qualifier
