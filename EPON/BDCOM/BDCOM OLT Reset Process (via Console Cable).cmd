🧰 BDCOM OLT Reset Process (via Console Cable)
🔹 Step-by-Step Guide

Console Connection Setup

Connect your console cable to the CLI port of the BDCOM OLT.

Open a terminal software (e.g., PuTTY / Tera Term):

Power on the OLT and wait for the boot sequence to start.

Interrupt Boot Process

During the boot process, press and hold Ctrl + P repeatedly until the OLT startup is interrupted.

Wait until the OLT prompt appears.

Execute Reset Commands
Once you reach the OLT CLI prompt, enter the following commands one by one:

OLT# delete startup-config
this file will be erased, are you sure? (y/n) y

OLT# delete config.db
this file will be erased, are you sure? (y/n) y

OLT# delete ifindex-config
this file will be erased, are you sure? (y/n) y

OLT# reboot
Do you want to reboot the Switch (y/n)? y


Final Step

The OLT will now reboot automatically.

After reboot, it will load with factory default settings — i.e., all previous configurations will be erased.
