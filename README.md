# NixPythonFlake


## Nix flake example 

### To run:

```bash
nix develop
```


## Nix flake with docker export example

### To run
copy the flake_with_docker_export.nix into flake.nix

```
nix build .#myAppImage
sudo docker load < result
sudo docker run -it djangoappimage-ex:stable
```


# References 
- https://www.tweag.io/blog/2020-05-25-flakes/
- https://johns.codes/blog/rust-enviorment-and-docker-build-with-nix-flakes
- [Nix + Docker, a match made in heaven](https://www.youtube.com/watch?v=WP_oAmV6C2U&t=3007s)
- [Matthew Croughan - Use flake.nix, not Dockerfile - MCH2022](https://www.youtube.com/watch?v=0uixRE8xlbY&t=185s)
- https://aige.eu/posts/reproducible-development-environments-with-nix-flakes/
