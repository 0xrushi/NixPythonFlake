# NixPythonFlake


## Nix flake example 

### To run:

```bash
nix develop
```


## Nix flake with docker export example

### To run

```
nix build .#myAppImage
sudo docker load < result
sudo docker run -it djangoappimage-ex:stable
```


# References 
- https://www.tweag.io/blog/2020-05-25-flakes/
