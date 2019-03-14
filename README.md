# nixops-blender-farm

This is some code I set up a while back to deploy machines with blender on
Digital Ocean with a mount pointing to a shared fileserver using WebDAV (or
NFS). It might be helpful to you, but some work is needed to make it nice,
havent tested it in a while either so there might be bugs/errors. Might fix
those if I get some time.

* Edit `nas.nix` to reflect your configuration

* The `do.sh` uses pass to retrieve the DO-token

* The blender 2.80 beta binary in blender.nix is outdated, consider using
  nixpkgs.blender instead.

To create machines:

```$ ./do.sh nixops create```

To deploy changes to machines:

```$ ./do.sh nixops deploy```

To run a command on all machines

```$ ./do.sh nixops ssh-for-each -p "echo 1"```

To actually use blender you must execute blender using ssh on the machines.
