| Command / Configuration                                       | Purpose / Description           | When to Use                        |                    |
| ------------------------------------------------------------- | ------------------------------- | ---------------------------------- | ------------------ |
| `display version` / `display patch all`                       | Show OLT version                | Check software version             |                    |
| `display current-configuration`                               | Show running configuration      | For troubleshooting                |                    |
| `display current-configuration                                | section <section>`              | Show VLAN / GPON / device config   | Narrow down config |
| `display alarm active all`                                    | Show active alarms              | Troubleshooting                    |                    |
| `display mac-address all` / `vlan <ID>` / `service-port <ID>` | Check MAC addresses             | Verify client connections          |                    |
| `undo mac-address mac <MAC> vlan <ID>`                        | Remove MAC entry                | Correct misconfigurations          |                    |
| `display arp all`                                             | Show ARP table                  | Verify IP mapping                  |                    |
| `display cpu-overload-control parameter`                      | Control CPU overload            | Troubleshooting performance issues |                    |
| `display log <all/cli/failure>`                               | Show logs                       | Track configuration history        |                    |
| `display interface` / `display interface <type>`              | Check interfaces                | Troubleshoot connectivity          |                    |
| `display ont <command>`                                       | Check ONT info, traffic, alarms | Monitor subscriber ONTs            |                    |
| `interface gpon x/x`                                          | GPON port config                | Setup or troubleshoot GPON         |                    |
| `display vlan` / `display vlan-feature`                       | Show VLAN config                | Verify VLAN setup                  |                    |
| `display dhcp config/domain/interface`                        | DHCP info                       | Check client IP allocation         |                    |
| `display pppoe` / `display radius-server`                     | PPPoE & AAA check               | Subscriber authentication          |                    |
| `display traffic` / `display traffic-a suppress`              | Traffic monitoring              | Bandwidth usage check              |                    |
