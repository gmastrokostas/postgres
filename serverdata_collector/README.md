License
-------

BSD

Description
-----------
Playbook "main.yml" is used to capture 
 - Generic server info such as, hostname, CPU Brand, RAM capacity, Hardware brand etc.
 - {{ansible_facts.packages}} to collect all installed rpm packages

The playbook in turn copies the remote files locally to the ansible control node.
Then the playbook executes local actions to insert the data to a postgres database.

The database consists of two tables so far.
 - servers -- Which contains the generic info as mentioned above.
 - rpm_packages -- Which contains all installed RPMs.

The servers table uses the "hostname" as a primary key.
The rpm_packages table uses the "hostname" field from table "servers" as a FK.

It should be noted that each time the playbook all tables are truncated so the latest status of all servers will be views.

In Progress:
 - Insert the RPM packages data to a backup table so you have a comparison (pre/post) change
 - Insert SAR performance data to a new table
 - Generate custom facts through bash scripts to collect data not available in ansible_facts
 - Start optimizing the database

