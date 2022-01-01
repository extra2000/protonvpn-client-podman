# protonvpn-client-podman

| License | Versioning | Build |
| ------- | ---------- | ----- |
| [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) | [![Build status](https://ci.appveyor.com/api/projects/status/wrx80cn34fvryodc/branch/master?svg=true)](https://ci.appveyor.com/project/nikAizuddin/protonvpn-client-podman/branch/master) |

ProtonVPN CLI client deployment using Podman.


## Building image

```
podman build -t extra2000/protonvpn-client .
```


## Load SELinux policy

```
sudo semodule -i selinux/protonvpn_client.cil /usr/share/udica/templates/base_container.cil
```


## How to Run?

Spawn a container:
```
podman run -it --rm --privileged --security-opt label=type:protonvpn_client.process extra2000/protonvpn-client bash
```

Initialize profile, connect to random server, get status, and then disconnect:
```
protonvpn init
protonvpn connect -r
protonvpn status
protonvpn disconnect
```

See [Rafficer/linux-cli-community](https://github.com/Rafficer/linux-cli-community) repository for more commands.
