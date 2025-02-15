# Create The Server
Follow the instructions [here](https://minecraftservercontrol.github.io/docs/mscs/getting-started).

- Keep in mind the IP address you want to use

## Forge/NeoForge
- When creating a modded server, look for the server download.
  - On curseforge, you need to download the server from the app
- Another note about using modpacks, if you are using `mscs`, then you have to configure the server using the same
  method as they show.

The run script in the `server` directory needs to look like the listing below. Also make sure the script has execute
permissions: `sudo chmod +x run.sh`.

```shell
#!/usr/bin/env sh
# Forge requires a configured set of both JVM and program arguments.
# Add custom JVM arguments to the user_jvm_args.txt
# Add custom program arguments {such as nogui} to this file in the next line before the "$@" or
#  pass them to this script directly
java @user_jvm_args.txt @libraries/net/neoforged/neoforge/21.1.77/unix_args.txt "$@"
```

To get the paths setup correctly, run the following script:

Forge
```shell
sudo sed -i "\|@[^\"]|s|@|@$(pwd)/|" run.sh;
sudo sed -i "s|\"\$@|--nogui &|g" run.sh;
sudo sed -i "s|libraries|$(pwd)/libraries|g" run.sh;
sudo sed -i "s|libraries|$(pwd)/libraries|g" libraries/net/minecraftforge/forge/*/unix_args.txt
```

Neoforge
```
sudo sed -i "\|@[^\"]|s|@|@$(pwd)/|" run.sh;
sudo sed -i "s|\"\$@|--nogui &|g" run.sh;
sudo sed -i "s|libraries|$(pwd)/libraries|g" run.sh;
sudo sed -i "s|libraries|$(pwd)/libraries|g" libraries/net/neoforged/neoforge/*/unix_args.txt
```

You'll then need to modify the `mscs` server properties file and include the following lines:

```
mscs-client-version=#.##.#
mscs-server-version=#.##.#
mscs-server-command=/opt/mscs/server/[server-directory]/run.sh
mscs-server-url=
```

# DDNS
- Create a DDNS account at [Dynu](dynu.com).
- Use [IP Chicken](https://ipchicken.com/) to ensure the DNS service points to the correct IP address.

# Port Forwarding
Port forward the external IP address to the internal one on chuggy.
