CREATE TABLE servers (
	hostname text NOT NULL,
	date_cpt text, 
	time_cpt text,
	os text,
	osrel text,
	total_m text,
        cpubrand text,
        cores text,
        arch text,
	server_brand text,
	virt_role text,
	virt_type text,
	uptime text,
	CONSTRAINT pk_servers_hostname PRIMARY KEY (hostname)
);

CREATE TABLE rpm_packages (
	hostname text,
	date_cpt text,
        time_cpt text,
	rpm_name text,
	rpm_version text,
	rpm_release text,
	CONSTRAINT fk_rpms_pckgs_hostname FOREIGN KEY (hostname)
        REFERENCES pico_schema.servers (hostname) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
);


CREATE TABLE servers_pre (
        hostname text NOT NULL,
        date_cpt text,
        time_cpt text,
        os text,
        osrel text,
        total_m text,
        cpubrand text,
        cores text,
        arch text,
        server_brand text,
        virt_role text,
        virt_type text
        uptime text,
        CONSTRAINT pk_servers_archive_hostname PRIMARY KEY (hostname)
);


CREATE TABLE rpm_packages_pre (
        hostname text,
        date_cpt text,
        time_cpt text,
        rpm_name text,
        rpm_version text,
        rpm_release text,
        CONSTRAINT fk_rpms_pckgs_hostname FOREIGN KEY (hostname)
        REFERENCES pico_schema.servers (hostname) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
);

#Now create the python script to query the data.
#You will need to also write queries
#Next think how you will approach the comparison of data


