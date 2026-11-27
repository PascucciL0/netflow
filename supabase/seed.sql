-- GENERATO da supabase/scripts/generate-seed.ts: non modificare a mano.
-- Rigenera con: npm run db:seed

begin;

insert into public.blueprint_objectives (id, blueprint_id, code, domain_code, title) values
  ('ccna-v2:1.1', 'ccna-200-301-v2', '1.1', '1.0', 'Diagnose interface and cable (copper and fiber) issues such as collisions, errors, mismatched duplex, speed, distance, interface, signal levels, pin out, and cable types'),
  ('ccna-v2:1.2', 'ccna-200-301-v2', '1.2', '1.0', 'Describe the role and function of hypervisors, virtual machines, and containers'),
  ('ccna-v2:1.3', 'ccna-200-301-v2', '1.3', '1.0', 'Troubleshoot IPv4 address configuration, assignment, and subnetting (public and private)'),
  ('ccna-v2:1.4', 'ccna-200-301-v2', '1.4', '1.0', 'Troubleshoot IPv6 address configuration, assignment, and prefix sizing (unicast and modified EUI 64)'),
  ('ccna-v2:1.5', 'ccna-200-301-v2', '1.5', '1.0', 'Describe wireless principles'),
  ('ccna-v2:1.5.a', 'ccna-200-301-v2', '1.5.a', '1.0', 'Band and channel selection'),
  ('ccna-v2:1.5.b', 'ccna-200-301-v2', '1.5.b', '1.0', 'RF characteristics'),
  ('ccna-v2:1.5.c', 'ccna-200-301-v2', '1.5.c', '1.0', 'Security protocols'),
  ('ccna-v2:1.5.d', 'ccna-200-301-v2', '1.5.d', '1.0', 'Cause of interference'),
  ('ccna-v2:1.6', 'ccna-200-301-v2', '1.6', '1.0', 'Troubleshoot wired and wireless client connectivity (IP configuration, network reachability, and wireless security parameters on Windows, MacOS, and Linux)'),
  ('ccna-v2:1.7', 'ccna-200-301-v2', '1.7', '1.0', 'Troubleshoot DHCPv4 client, server, and relay on IOS devices'),
  ('ccna-v2:2.1', 'ccna-200-301-v2', '2.1', '2.0', 'Configure network infrastructure connectivity (switch-to-switch and switch-to-router)'),
  ('ccna-v2:2.1.a', 'ccna-200-301-v2', '2.1.a', '2.0', 'Layer 2/Layer 3 physical interfaces'),
  ('ccna-v2:2.1.b', 'ccna-200-301-v2', '2.1.b', '2.0', 'Layer 2 802.1Q trunk interfaces'),
  ('ccna-v2:2.1.c', 'ccna-200-301-v2', '2.1.c', '2.0', 'Layer 2/Layer 3 LACP port-channel/EtherChannel'),
  ('ccna-v2:2.1.d', 'ccna-200-301-v2', '2.1.d', '2.0', 'Switch virtual interface (SVI)'),
  ('ccna-v2:2.2', 'ccna-200-301-v2', '2.2', '2.0', 'Configure Layer 2 switch port attributes for edge-host connectivity (VLAN, PoE, port channel, and LACP)'),
  ('ccna-v2:2.2.a', 'ccna-200-301-v2', '2.2.a', '2.0', 'Desktop, printer, and IOT appliances'),
  ('ccna-v2:2.2.b', 'ccna-200-301-v2', '2.2.b', '2.0', 'Wireless access points (standalone and controller based)'),
  ('ccna-v2:2.2.c', 'ccna-200-301-v2', '2.2.c', '2.0', 'Voice over IP phone'),
  ('ccna-v2:2.2.d', 'ccna-200-301-v2', '2.2.d', '2.0', 'Virtualized hosts'),
  ('ccna-v2:2.2.e', 'ccna-200-301-v2', '2.2.e', '2.0', 'Network appliances'),
  ('ccna-v2:2.3', 'ccna-200-301-v2', '2.3', '2.0', 'Validate the accuracy of network documentation using CDP and LLDP'),
  ('ccna-v2:2.4', 'ccna-200-301-v2', '2.4', '2.0', 'Troubleshoot basic Layer 2/Layer 3 connectivity and device operations using show commands (including show logs), ping, extended ping, trace route, and packet capture output'),
  ('ccna-v2:2.5', 'ccna-200-301-v2', '2.5', '2.0', 'Configure operations of the Rapid Per VLAN Spanning Tree Protocol (Rapid PVST+)'),
  ('ccna-v2:2.5.a', 'ccna-200-301-v2', '2.5.a', '2.0', 'Root port, root bridge (primary/secondary), and other port names'),
  ('ccna-v2:2.5.b', 'ccna-200-301-v2', '2.5.b', '2.0', 'Port states and roles'),
  ('ccna-v2:2.5.c', 'ccna-200-301-v2', '2.5.c', '2.0', 'PortFast'),
  ('ccna-v2:2.5.d', 'ccna-200-301-v2', '2.5.d', '2.0', 'Root guard, loop guard, and BPDU guard'),
  ('ccna-v2:3.1', 'ccna-200-301-v2', '3.1', '3.0', 'Interpret a routing table to identify the next hop for a packet (routing protocol, prefix/mask, administrative distance, metric, and default route)'),
  ('ccna-v2:3.2', 'ccna-200-301-v2', '3.2', '3.0', 'Troubleshoot IPv4 and IPv6 static routing'),
  ('ccna-v2:3.2.a', 'ccna-200-301-v2', '3.2.a', '3.0', 'Default route'),
  ('ccna-v2:3.2.b', 'ccna-200-301-v2', '3.2.b', '3.0', 'Network route'),
  ('ccna-v2:3.2.c', 'ccna-200-301-v2', '3.2.c', '3.0', 'Host route'),
  ('ccna-v2:3.2.d', 'ccna-200-301-v2', '3.2.d', '3.0', 'Floating static'),
  ('ccna-v2:3.3', 'ccna-200-301-v2', '3.3', '3.0', 'Configure single area OSPFv2 for IPv4 and OSPFv3 for IPv6'),
  ('ccna-v2:3.3.a', 'ccna-200-301-v2', '3.3.a', '3.0', 'Neighbor adjacencies (excluding authentication)'),
  ('ccna-v2:3.3.b', 'ccna-200-301-v2', '3.3.b', '3.0', 'Point-to-point'),
  ('ccna-v2:3.3.c', 'ccna-200-301-v2', '3.3.c', '3.0', 'Broadcast (DR/BDR selection)'),
  ('ccna-v2:3.3.d', 'ccna-200-301-v2', '3.3.d', '3.0', 'Router ID'),
  ('ccna-v2:3.4', 'ccna-200-301-v2', '3.4', '3.0', 'Interpret the operational status of First Hop Redundancy Protocols (HSRP and VRRP)'),
  ('ccna-v2:4.1', 'ccna-200-301-v2', '4.1', '4.0', 'Configure network devices with local usernames and as an AAA client (TACACS+ and RADIUS) for management'),
  ('ccna-v2:4.2', 'ccna-200-301-v2', '4.2', '4.0', 'Manage device configuration and software files using secure file transfer operations with SFTP/SCP'),
  ('ccna-v2:4.3', 'ccna-200-301-v2', '4.3', '4.0', 'Configure NAT/PAT on IOS XE routers'),
  ('ccna-v2:4.4', 'ccna-200-301-v2', '4.4', '4.0', 'Diagnose issues with DNS records (A, AAAA, CNAME, MX, NS, and PTR) to support host, web application, and mail server access by name'),
  ('ccna-v2:4.5', 'ccna-200-301-v2', '4.5', '4.0', 'Describe IPsec remote access and site-to-site VPNs (protocols and transport modes)'),
  ('ccna-v2:4.6', 'ccna-200-301-v2', '4.6', '4.0', 'Configure IPv4 access control lists (standard, extended, numbered, and named ACLs)'),
  ('ccna-v2:4.7', 'ccna-200-301-v2', '4.7', '4.0', 'Configure Layer 2 security features'),
  ('ccna-v2:4.7.a', 'ccna-200-301-v2', '4.7.a', '4.0', 'DHCP snooping'),
  ('ccna-v2:4.7.b', 'ccna-200-301-v2', '4.7.b', '4.0', 'Dynamic ARP inspection'),
  ('ccna-v2:4.7.c', 'ccna-200-301-v2', '4.7.c', '4.0', 'Storm control'),
  ('ccna-v2:4.7.d', 'ccna-200-301-v2', '4.7.d', '4.0', 'RA guard'),
  ('ccna-v2:4.7.e', 'ccna-200-301-v2', '4.7.e', '4.0', 'Port security'),
  ('ccna-v2:5.1', 'ccna-200-301-v2', '5.1', '5.0', 'Describe the role of agentic AI in network operations'),
  ('ccna-v2:5.2', 'ccna-200-301-v2', '5.2', '5.0', 'Select a prompt to send to a generative AI system to support network operations considering prompt components such as data classification, output format, persona, and instructions'),
  ('ccna-v2:5.3', 'ccna-200-301-v2', '5.3', '5.0', 'Describe network management approaches (device-based, cloud-based, controller-based, automation-based, and infrastructure as code)'),
  ('ccna-v2:5.4', 'ccna-200-301-v2', '5.4', '5.0', 'Describe the function of SNMP in network operations'),
  ('ccna-v2:5.5', 'ccna-200-301-v2', '5.5', '5.0', 'Use configuration management mechanisms such as Ansible to execute commands'),
  ('ccna-v2:5.6', 'ccna-200-301-v2', '5.6', '5.0', 'Interpret syslog message content, severity levels, and facilities')
on conflict (id) do update set blueprint_id = excluded.blueprint_id, code = excluded.code, domain_code = excluded.domain_code, title = excluded.title;

insert into public.learning_tracks (id, title, summary, blueprint_id, position) values
  ('ccna', 'Cisco CCNA 200-301 v2.0', 'Fondamenti di networking, switching, routing, servizi e sicurezza secondo il blueprint ufficiale CCNA v2.0.', 'ccna-200-301-v2', 0)
on conflict (id) do update set title = excluded.title, summary = excluded.summary, blueprint_id = excluded.blueprint_id, position = excluded.position;

insert into public.modules (id, track_id, title, summary, position) values
  ('network-fundamentals', 'ccna', 'Fondamenti di rete', 'Dispositivi, topologie, architetture e modelli a livelli.', 0),
  ('ethernet-switching', 'ccna', 'Ethernet e switching', 'Frame Ethernet, MAC address, cablaggio e funzionamento dello switch.', 1),
  ('ip-addressing', 'ccna', 'Indirizzamento IP', 'IPv4, subnetting, IPv6 e protocolli di supporto al livello 3.', 2),
  ('routing-basics', 'ccna', 'Routing', 'Come un router decide il next hop.', 3),
  ('transport-services', 'ccna', 'Trasporto e servizi', 'TCP, UDP e i servizi che rendono utilizzabile una rete.', 4),
  ('cisco-ios', 'ccna', 'Cisco IOS', 'CLI, modalità, configurazione e comandi di verifica.', 5),
  ('security-basics', 'ccna', 'Sicurezza di rete', 'Concetti di base prima delle funzionalità specifiche.', 6),
  ('network-operations', 'ccna', 'Operazioni e gestione', 'Monitoraggio, gestione e automazione della rete.', 7)
on conflict (id) do update set track_id = excluded.track_id, title = excluded.title, summary = excluded.summary, position = excluded.position;

insert into public.topics (id, module_id, title, summary, position) values
  ('network-devices', 'network-fundamentals', 'Dispositivi di rete', 'Router, switch, firewall, access point, endpoint e server: ruolo e livello di funzionamento.', 0),
  ('network-topologies', 'network-fundamentals', 'Topologie e architetture', 'Star, mesh, two-tier, three-tier, spine-leaf, SOHO, WAN e cloud.', 1),
  ('osi-tcpip', 'network-fundamentals', 'Modello OSI e TCP/IP', 'Livelli, incapsulamento, PDU e corrispondenza tra i due modelli.', 2),
  ('virtualization', 'network-fundamentals', 'Virtualizzazione e cloud', 'Hypervisor, macchine virtuali, container e modelli di servizio cloud.', 3),
  ('wireless-fundamentals', 'network-fundamentals', 'Fondamenti di wireless', 'Bande, canali, caratteristiche RF, sicurezza e cause di interferenza.', 4),
  ('ethernet-lan', 'ethernet-switching', 'Ethernet, cavi e interfacce', 'Standard Ethernet, rame e fibra, duplex, speed e problemi di interfaccia.', 0),
  ('mac-addressing', 'ethernet-switching', 'MAC address e frame Ethernet', 'Struttura del frame, indirizzi unicast, broadcast e multicast.', 1),
  ('switching-fundamentals', 'ethernet-switching', 'Switching: learning, forwarding, flooding', 'MAC Address Table, inoltro dei frame, flooding e Broadcast Domain.', 2),
  ('vlans', 'ethernet-switching', 'VLAN e Access Port', 'Segmentazione della LAN, Access Port, Voice VLAN e porte per dispositivi finali.', 3),
  ('vlan-trunking', 'ethernet-switching', 'Trunk 802.1Q e DTP', 'Tag 802.1Q, Native VLAN, VLAN consentite e negoziazione DTP.', 4),
  ('inter-vlan-routing', 'ethernet-switching', 'Routing tra VLAN', 'Router-on-a-stick, sotto-interfacce e SVI su switch multilayer.', 5),
  ('stp', 'ethernet-switching', 'Spanning Tree e Rapid PVST+', 'Perché servono, elezione del Root Bridge, ruoli e stati delle porte, PortFast e protezioni.', 6),
  ('etherchannel', 'ethernet-switching', 'EtherChannel e LACP', 'Aggregazione di link fisici, modalità LACP/PAgP e requisiti di compatibilità.', 7),
  ('cdp-lldp', 'ethernet-switching', 'CDP e LLDP', 'Scoperta dei vicini e verifica della documentazione di rete.', 8),
  ('ipv4-addressing', 'ip-addressing', 'Indirizzamento IPv4', 'Struttura dell''indirizzo, Subnet Mask, indirizzi pubblici e privati.', 0),
  ('subnetting', 'ip-addressing', 'Subnetting IPv4', 'Calcolo di network, broadcast, host utilizzabili e VLSM.', 1),
  ('arp', 'ip-addressing', 'ARP', 'Risoluzione da indirizzo IPv4 a MAC address all''interno della subnet.', 2),
  ('icmp', 'ip-addressing', 'ICMP, ping e traceroute', 'Messaggi ICMP e strumenti di verifica della raggiungibilità.', 3),
  ('ipv6-fundamentals', 'ip-addressing', 'Fondamenti di IPv6', 'Formato, abbreviazione, tipi di indirizzo, prefissi e EUI-64.', 4),
  ('ipv6-ndp-slaac', 'ip-addressing', 'IPv6: NDP e SLAAC', 'Neighbor Discovery, Router Advertisement, SLAAC e DAD.', 5),
  ('routing-fundamentals', 'routing-basics', 'Fondamenti di routing', 'Routing Table, longest prefix match, route connesse, statiche e default.', 0),
  ('static-routing', 'routing-basics', 'Routing statico', 'Route di default, di rete, host route e floating static, in IPv4 e IPv6.', 1),
  ('ospf', 'routing-basics', 'OSPF single area', 'Link-state, adiacenze, Router ID, DR/BDR, costo e OSPFv3.', 2),
  ('fhrp', 'routing-basics', 'First Hop Redundancy (HSRP, VRRP)', 'Default Gateway ridondato con IP e MAC virtuali.', 3),
  ('tcp-udp', 'transport-services', 'TCP e UDP', 'Porte, Three-Way Handshake, affidabilità e casi d''uso.', 0),
  ('dns', 'transport-services', 'DNS', 'Risoluzione dei nomi e tipi di record.', 1),
  ('dhcp', 'transport-services', 'DHCP', 'Assegnazione automatica della configurazione IP, processo DORA e relay.', 2),
  ('nat', 'transport-services', 'NAT e PAT', 'Traduzione degli indirizzi: terminologia, NAT statico, dinamico e PAT.', 3),
  ('ios-fundamentals', 'cisco-ios', 'Fondamenti di Cisco IOS', 'Modalità della CLI, running e startup config, comandi show essenziali.', 0),
  ('device-access', 'cisco-ios', 'Accesso sicuro ai dispositivi', 'Utenti locali, SSH, AAA con TACACS+ e RADIUS, trasferimento sicuro dei file.', 1),
  ('security-fundamentals', 'security-basics', 'Fondamenti di Network Security', 'Minacce, vulnerabilità, exploit, mitigazioni e principi di difesa.', 0),
  ('acl', 'security-basics', 'Access Control List IPv4', 'ACL standard ed estese, numerate e named, wildcard mask e posizionamento.', 1),
  ('layer2-security', 'security-basics', 'Sicurezza di livello 2', 'Port Security, DHCP snooping, Dynamic ARP Inspection, storm control e RA guard.', 2),
  ('ipsec-vpn', 'security-basics', 'VPN IPsec', 'VPN site-to-site e remote access, AH ed ESP, transport e tunnel mode.', 3),
  ('syslog-snmp', 'network-operations', 'Syslog e SNMP', 'Livelli di severità, facility e funzionamento di SNMP.', 0),
  ('network-automation', 'network-operations', 'Gestione e automazione', 'Approcci device-based, cloud, controller e automazione con Ansible; AI nelle operazioni di rete.', 1)
on conflict (id) do update set module_id = excluded.module_id, title = excluded.title, summary = excluded.summary, position = excluded.position;

delete from public.topic_prerequisites where topic_id in ('network-devices', 'network-topologies', 'osi-tcpip', 'virtualization', 'wireless-fundamentals', 'ethernet-lan', 'mac-addressing', 'switching-fundamentals', 'vlans', 'vlan-trunking', 'inter-vlan-routing', 'stp', 'etherchannel', 'cdp-lldp', 'ipv4-addressing', 'subnetting', 'arp', 'icmp', 'ipv6-fundamentals', 'ipv6-ndp-slaac', 'routing-fundamentals', 'static-routing', 'ospf', 'fhrp', 'tcp-udp', 'dns', 'dhcp', 'nat', 'ios-fundamentals', 'device-access', 'security-fundamentals', 'acl', 'layer2-security', 'ipsec-vpn', 'syslog-snmp', 'network-automation');

insert into public.topic_prerequisites (topic_id, prerequisite_id) values
  ('network-topologies', 'network-devices'),
  ('osi-tcpip', 'network-devices'),
  ('virtualization', 'network-devices'),
  ('wireless-fundamentals', 'network-devices'),
  ('wireless-fundamentals', 'ethernet-lan'),
  ('ethernet-lan', 'osi-tcpip'),
  ('mac-addressing', 'osi-tcpip'),
  ('switching-fundamentals', 'mac-addressing'),
  ('vlans', 'switching-fundamentals'),
  ('vlan-trunking', 'vlans'),
  ('inter-vlan-routing', 'vlan-trunking'),
  ('inter-vlan-routing', 'routing-fundamentals'),
  ('stp', 'vlan-trunking'),
  ('etherchannel', 'vlan-trunking'),
  ('etherchannel', 'stp'),
  ('cdp-lldp', 'switching-fundamentals'),
  ('ipv4-addressing', 'osi-tcpip'),
  ('subnetting', 'ipv4-addressing'),
  ('arp', 'ipv4-addressing'),
  ('arp', 'mac-addressing'),
  ('icmp', 'ipv4-addressing'),
  ('ipv6-fundamentals', 'ipv4-addressing'),
  ('ipv6-ndp-slaac', 'ipv6-fundamentals'),
  ('routing-fundamentals', 'subnetting'),
  ('static-routing', 'routing-fundamentals'),
  ('ospf', 'static-routing'),
  ('fhrp', 'routing-fundamentals'),
  ('fhrp', 'arp'),
  ('tcp-udp', 'osi-tcpip'),
  ('dns', 'tcp-udp'),
  ('dhcp', 'ipv4-addressing'),
  ('dhcp', 'tcp-udp'),
  ('nat', 'ipv4-addressing'),
  ('nat', 'tcp-udp'),
  ('ios-fundamentals', 'network-devices'),
  ('device-access', 'ios-fundamentals'),
  ('device-access', 'tcp-udp'),
  ('security-fundamentals', 'network-devices'),
  ('acl', 'subnetting'),
  ('acl', 'tcp-udp'),
  ('layer2-security', 'vlans'),
  ('layer2-security', 'dhcp'),
  ('layer2-security', 'arp'),
  ('ipsec-vpn', 'security-fundamentals'),
  ('ipsec-vpn', 'nat'),
  ('syslog-snmp', 'ios-fundamentals'),
  ('network-automation', 'ios-fundamentals'),
  ('network-automation', 'device-access');

delete from public.topic_objectives where topic_id in ('network-devices', 'network-topologies', 'osi-tcpip', 'virtualization', 'wireless-fundamentals', 'ethernet-lan', 'mac-addressing', 'switching-fundamentals', 'vlans', 'vlan-trunking', 'inter-vlan-routing', 'stp', 'etherchannel', 'cdp-lldp', 'ipv4-addressing', 'subnetting', 'arp', 'icmp', 'ipv6-fundamentals', 'ipv6-ndp-slaac', 'routing-fundamentals', 'static-routing', 'ospf', 'fhrp', 'tcp-udp', 'dns', 'dhcp', 'nat', 'ios-fundamentals', 'device-access', 'security-fundamentals', 'acl', 'layer2-security', 'ipsec-vpn', 'syslog-snmp', 'network-automation');

insert into public.topic_objectives (topic_id, objective_id) values
  ('virtualization', 'ccna-v2:1.2'),
  ('wireless-fundamentals', 'ccna-v2:1.5'),
  ('wireless-fundamentals', 'ccna-v2:1.5.a'),
  ('wireless-fundamentals', 'ccna-v2:1.5.b'),
  ('wireless-fundamentals', 'ccna-v2:1.5.c'),
  ('wireless-fundamentals', 'ccna-v2:1.5.d'),
  ('ethernet-lan', 'ccna-v2:1.1'),
  ('switching-fundamentals', 'ccna-v2:2.4'),
  ('vlans', 'ccna-v2:2.2'),
  ('vlans', 'ccna-v2:2.2.a'),
  ('vlans', 'ccna-v2:2.2.c'),
  ('vlan-trunking', 'ccna-v2:2.1'),
  ('vlan-trunking', 'ccna-v2:2.1.b'),
  ('inter-vlan-routing', 'ccna-v2:2.1.a'),
  ('inter-vlan-routing', 'ccna-v2:2.1.d'),
  ('stp', 'ccna-v2:2.5'),
  ('stp', 'ccna-v2:2.5.a'),
  ('stp', 'ccna-v2:2.5.b'),
  ('stp', 'ccna-v2:2.5.c'),
  ('stp', 'ccna-v2:2.5.d'),
  ('etherchannel', 'ccna-v2:2.1.c'),
  ('cdp-lldp', 'ccna-v2:2.3'),
  ('ipv4-addressing', 'ccna-v2:1.3'),
  ('subnetting', 'ccna-v2:1.3'),
  ('icmp', 'ccna-v2:2.4'),
  ('ipv6-fundamentals', 'ccna-v2:1.4'),
  ('ipv6-ndp-slaac', 'ccna-v2:1.4'),
  ('routing-fundamentals', 'ccna-v2:3.1'),
  ('static-routing', 'ccna-v2:3.2'),
  ('static-routing', 'ccna-v2:3.2.a'),
  ('static-routing', 'ccna-v2:3.2.b'),
  ('static-routing', 'ccna-v2:3.2.c'),
  ('static-routing', 'ccna-v2:3.2.d'),
  ('ospf', 'ccna-v2:3.3'),
  ('ospf', 'ccna-v2:3.3.a'),
  ('ospf', 'ccna-v2:3.3.b'),
  ('ospf', 'ccna-v2:3.3.c'),
  ('ospf', 'ccna-v2:3.3.d'),
  ('fhrp', 'ccna-v2:3.4'),
  ('dns', 'ccna-v2:4.4'),
  ('dhcp', 'ccna-v2:1.7'),
  ('nat', 'ccna-v2:4.3'),
  ('ios-fundamentals', 'ccna-v2:2.4'),
  ('device-access', 'ccna-v2:4.1'),
  ('device-access', 'ccna-v2:4.2'),
  ('acl', 'ccna-v2:4.6'),
  ('layer2-security', 'ccna-v2:4.7'),
  ('layer2-security', 'ccna-v2:4.7.a'),
  ('layer2-security', 'ccna-v2:4.7.b'),
  ('layer2-security', 'ccna-v2:4.7.c'),
  ('layer2-security', 'ccna-v2:4.7.d'),
  ('layer2-security', 'ccna-v2:4.7.e'),
  ('ipsec-vpn', 'ccna-v2:4.5'),
  ('syslog-snmp', 'ccna-v2:5.4'),
  ('syslog-snmp', 'ccna-v2:5.6'),
  ('network-automation', 'ccna-v2:5.1'),
  ('network-automation', 'ccna-v2:5.2'),
  ('network-automation', 'ccna-v2:5.3'),
  ('network-automation', 'ccna-v2:5.5');

insert into public.content_items (id, owner_id, slug, revision, kind, language, title, summary, body, track_id, topic_id, subtopic,
  difficulty, reading_minutes, provenance, review_status, tags, diagrams, created_on, updated_on) values
  ('cb0ed29e-3d26-5e98-b360-23fb97c984aa', null, 'router-vs-switch', 1, 'comparison', 'it', 'Switch e router: due decisioni diverse', 'Lo switch decide su quale porta inoltrare un frame dentro la LAN. Il router decide verso quale rete inoltrare un pacchetto. Confonderli porta a errori di progettazione e di troubleshooting.', 'Uno **switch** lavora al livello 2: legge il **MAC address di destinazione** del frame Ethernet e lo inoltra sulla porta giusta all''interno della stessa LAN (e della stessa VLAN). Non sa nulla di reti IP diverse.

Un **router** lavora al livello 3: legge l''**indirizzo IP di destinazione** del pacchetto, consulta la **Routing Table** e lo inoltra verso il next hop. È il dispositivo che collega reti diverse e che separa i Broadcast Domain.

| | Switch | Router |
|---|---|---|
| Livello | 2 (Data Link) | 3 (Network) |
| Indirizzo usato | MAC address | indirizzo IP |
| Tabella | MAC Address Table | Routing Table |
| Broadcast | li inoltra a tutte le porte della VLAN | non li inoltra tra interfacce |
| Ambito | dentro una LAN | tra reti diverse |

### Perché conta nella pratica
Quando due PC nella stessa subnet non comunicano, il problema va cercato soprattutto al livello 2: cavo, porta, VLAN, MAC Address Table. Quando non comunicano PC di subnet diverse, entra in gioco anche il Default Gateway, cioè il router.

Esistono anche switch **multilayer** (Layer 3 switch) che eseguono il routing in hardware: la distinzione tra le due *funzioni* resta valida anche quando stanno nello stesso dispositivo.', 'ccna', 'network-devices', null, 1, 3, 'original', 'proposed', array['switch', 'router', 'livelli']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('680d75cd-a68c-57fa-9c41-1e35f2b23289', null, 'osi-encapsulation', 1, 'lesson', 'it', 'Incapsulamento: cosa aggiunge ogni livello', 'Mentre i dati scendono lungo lo stack, ogni livello aggiunge le proprie informazioni di controllo. Capire l''incapsulamento significa sapere quale dispositivo legge quale header.', 'Il **modello OSI** descrive la comunicazione in sette livelli; il **modello TCP/IP**, usato realmente su Internet, li raggruppa in quattro (o cinque, nella versione didattica che separa livello fisico e Data Link).

Quando un''applicazione invia dati, ogni livello aggiunge un proprio header:

1. **Trasporto** (TCP o UDP) aggiunge le porte di origine e destinazione: la PDU si chiama **segment** (TCP) o datagram (UDP).
2. **Network** (IP) aggiunge gli indirizzi IP di origine e destinazione: la PDU è il **packet**.
3. **Data Link** (Ethernet) aggiunge i MAC address e il trailer FCS: la PDU è il **frame**.
4. **Fisico**: il frame viene trasmesso come **bit** sul mezzo.

Il destinatario esegue il processo inverso, la **de-incapsulamento**: ogni livello legge il proprio header, lo rimuove e passa il contenuto al livello superiore.

### Perché è utile
Ogni dispositivo "apre" il pacchetto solo fino al livello in cui lavora. Uno switch legge l''header Ethernet; un router rimuove l''header Ethernet, legge quello IP, decide il next hop e **costruisce un nuovo frame** per il collegamento successivo. Per questo i MAC address cambiano a ogni hop, mentre gli indirizzi IP di origine e destinazione restano gli stessi (senza NAT).

Questo è anche il metodo di troubleshooting più solido: procedere per livelli, dal fisico in su, invece di provare soluzioni a caso.', 'ccna', 'osi-tcpip', null, 1, 4, 'original', 'proposed', array['osi', 'tcp-ip', 'pdu']::text[], '[{"id":"osi-tcpip-stack","caption":"Modello OSI e modello TCP/IP con le PDU di ciascun livello."}]'::jsonb, '2026-11-27', '2026-11-27'),
  ('d5c4cbdd-ac9a-59ad-a954-c10a7b014867', null, 'ethernet-frame-structure', 1, 'lesson', 'it', 'Anatomia del frame Ethernet', 'Preambolo, SFD, MAC di destinazione e di origine, Type, payload e FCS: cosa contiene ogni campo e perché la destinazione viene prima dell''origine.', 'Un frame **Ethernet II** è composto da:

| Campo | Byte | Funzione |
|---|---|---|
| Preamble | 7 | sequenza alternata di 1 e 0 che permette la sincronizzazione |
| SFD | 1 | Start Frame Delimiter: segnala l''inizio del frame vero e proprio |
| Destination MAC | 6 | a chi è destinato il frame |
| Source MAC | 6 | chi ha inviato il frame |
| Type / Length | 2 | il protocollo incapsulato (es. 0x0800 = IPv4, 0x86DD = IPv6) oppure la lunghezza |
| Payload | 46–1500 | il pacchetto di livello 3 |
| FCS | 4 | Frame Check Sequence: un CRC per rilevare errori |

Preamble e SFD spesso non vengono conteggiati nella dimensione del frame. Escludendoli, header (14 byte) + FCS (4 byte) = 18 byte; con il payload minimo di 46 byte si ottiene la **dimensione minima di 64 byte**. Un frame più corto è un **runt**.

### Perché la destinazione viene prima
Lo switch può iniziare a decidere dove inoltrare il frame appena ha letto i primi 6 byte dopo l''SFD. Lo sfrutta la modalità *cut-through*, che inoltra prima di aver ricevuto l''intero frame.

### FCS: rileva, non corregge
Se il CRC calcolato non coincide con l''FCS, il frame viene **scartato**. Ethernet non ritrasmette: se serve, lo farà un livello superiore (per esempio TCP). Contatori di errori CRC in crescita su un''interfaccia indicano spesso problemi fisici: cavo danneggiato, interferenze o duplex mismatch.', 'ccna', 'mac-addressing', null, 1, 4, 'original', 'proposed', array['ethernet', 'frame', 'mac']::text[], '[{"id":"ethernet-frame","caption":"Campi del frame Ethernet II con dimensioni in byte."}]'::jsonb, '2026-11-27', '2026-11-27'),
  ('dffaabcf-a56e-534d-a38c-842ff9792b6a', null, 'switch-mac-learning', 1, 'lesson', 'it', 'Come uno switch apprende i MAC address', 'Uno switch costruisce la MAC Address Table osservando il MAC address di origine dei frame ricevuti. Il MAC di destinazione serve invece a decidere dove inoltrare.', 'Uno switch apprende i MAC address di origine dei frame Ethernet ricevuti e li memorizza nella **MAC Address Table**, associandoli alla porta di ingresso. Se l''indirizzo MAC di destinazione è sconosciuto, lo switch esegue il **flooding** del frame all''interno della stessa VLAN.

Le due operazioni usano campi diversi del frame:

- **Learning** → MAC address di **origine**: "chi ha inviato questo frame si trova dietro questa porta".
- **Forwarding** → indirizzo MAC di **destinazione**: "su quale porta devo inoltrarlo?".

Per la destinazione ci sono tre casi:

1. **Known unicast**: il MAC è nella tabella → il frame esce solo dalla porta associata.
2. **Unknown unicast**: il MAC non è nella tabella → flooding su tutte le porte della VLAN tranne quella di ingresso.
3. **Broadcast** (FF:FF:FF:FF:FF:FF) → sempre flooding nella VLAN.

Se la porta associata alla destinazione coincide con quella di ingresso, il frame viene scartato (*filtering*).

### Aging
Le voci apprese dinamicamente scadono se non vengono rinnovate: su molti switch Cisco l''aging time predefinito è di 300 secondi. In questo modo la tabella si adatta quando un host viene spostato su un''altra porta.

```
SW1# show mac address-table dynamic
          Mac Address Table
-------------------------------------------
Vlan    Mac Address       Type        Ports
----    -----------       --------    -----
  10    0050.7966.6801    DYNAMIC     Gi0/1
  10    0050.7966.6802    DYNAMIC     Gi0/2
```

### In azienda
Se un host risulta appreso su una porta inattesa (per esempio la porta di uplink), il frame sta arrivando da un altro switch: è il punto di partenza per capire dove si trova fisicamente un dispositivo.', 'ccna', 'switching-fundamentals', null, 1, 4, 'original', 'proposed', array['switching', 'mac-address-table', 'flooding']::text[], '[{"id":"mac-learning","caption":"Segui passo per passo come la MAC Address Table si popola."}]'::jsonb, '2026-11-27', '2026-11-27'),
  ('155166f9-ff64-5536-a48a-567fe28dc070', null, 'unknown-unicast-flooding', 1, 'recall', 'it', 'Destinazione sconosciuta: cosa fa lo switch?', 'Scenario di active recall sul comportamento dello switch con un MAC address di destinazione non presente nella tabella.', 'Lo switch SW1 è appena stato acceso e la sua MAC Address Table è vuota. PC-A, collegato a Gi0/1 nella VLAN 10, invia un frame unicast a PC-B, collegato a Gi0/3 nella stessa VLAN. Sulle porte Gi0/2 e Gi0/4 ci sono altri host della VLAN 10; Gi0/5 è nella VLAN 20.', 'ccna', 'switching-fundamentals', null, 1, 2, 'hypothetical', 'proposed', array['switching', 'flooding']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('23525bc3-5cd3-5714-9998-75e73e7587e9', null, 'rfc1918-private-addresses', 1, 'lesson', 'it', 'Indirizzi IPv4 privati (RFC 1918)', 'Tre blocchi di indirizzi riservati all''uso interno: perché esistono, quali sono e cosa implica usarli.', 'La RFC 1918 riserva tre blocchi di indirizzi IPv4 per le reti private:

| Blocco | Intervallo | Prefisso |
|---|---|---|
| 10.0.0.0 | 10.0.0.0 – 10.255.255.255 | /8 |
| 172.16.0.0 | 172.16.0.0 – 172.31.255.255 | /12 |
| 192.168.0.0 | 192.168.0.0 – 192.168.255.255 | /16 |

### Quale problema risolvono
Lo spazio IPv4 pubblico è limitato. Gli indirizzi privati possono essere riutilizzati in qualsiasi organizzazione perché **non vengono instradati su Internet**. Per comunicare con l''esterno, un dispositivo di bordo traduce gli indirizzi privati in pubblici tramite **NAT/PAT**.

### Implicazioni pratiche
- Due aziende possono usare entrambe 10.0.0.0/8 senza conflitti, finché non devono collegare le reti tra loro: in una fusione aziendale o con una VPN site-to-site, gli intervalli sovrapposti diventano un problema concreto.
- Il blocco 172.16.0.0/12 arriva fino a **172.31**.255.255: un indirizzo come 172.32.1.1 è pubblico. È un errore frequente.
- Un host con indirizzo 169.254.x.x non ha un indirizzo RFC 1918: è un indirizzo link-local assegnato automaticamente quando il client non ha ottenuto risposta dal server DHCP.', 'ccna', 'ipv4-addressing', null, 1, 3, 'official', 'proposed', array['ipv4', 'rfc1918', 'nat']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('9a88255c-bfdb-5e9b-aba4-affc0270c6d4', null, 'arp-resolution', 1, 'lesson', 'it', 'ARP: dal next hop al MAC address', 'Prima di inviare un pacchetto IPv4 su Ethernet, l''host deve conoscere il MAC address del destinatario locale o del Default Gateway. ARP lo scopre con una richiesta broadcast e una risposta unicast.', 'Per costruire un frame Ethernet un host deve conoscere il **MAC address di destinazione**. Conosce però solo l''indirizzo IP. **ARP** (Address Resolution Protocol) risolve un indirizzo IPv4 nel corrispondente MAC address **all''interno della stessa subnet**.

### Quale IP viene risolto
L''host confronta l''IP di destinazione con la propria subnet:
- destinazione **nella stessa subnet** → risolve l''IP del destinatario;
- destinazione **in un''altra subnet** → risolve l''IP del **Default Gateway**.

### Lo scambio
1. **ARP Request** in broadcast (destinazione FF:FF:FF:FF:FF:FF): "Chi ha 192.168.1.1? Lo dica a 192.168.1.10". Tutti gli host della VLAN la ricevono.
2. Solo l''host che possiede quell''IP risponde con una **ARP Reply** in **unicast** al richiedente.
3. Il richiedente salva l''associazione nella **ARP cache** e la riusa per un certo tempo.

Chi riceve la Request può anche registrare il MAC del mittente: la comunicazione di ritorno, molto probabile, non richiederà un''altra risoluzione.

```
PC> arp -a
  Internet Address      Physical Address      Type
  192.168.1.1           00-1a-2b-3c-4d-5e     dynamic
```

### Errori comuni e sicurezza
- Un Default Gateway configurato in un''altra subnet impedisce la risoluzione: ARP non attraversa i router.
- ARP non prevede autenticazione: chiunque può inviare risposte false (*ARP spoofing*). La contromisura sugli switch Cisco è **Dynamic ARP Inspection**, che si appoggia a DHCP snooping.', 'ccna', 'arp', null, 1, 4, 'original', 'proposed', array['arp', 'ipv4', 'broadcast']::text[], '[{"id":"arp-exchange","caption":"ARP Request in broadcast e ARP Reply in unicast."}]'::jsonb, '2026-11-27', '2026-11-27'),
  ('0eff06c7-01d8-5299-be8d-34de078f7b8b', null, 'icmp-ping-traceroute', 1, 'lesson', 'it', 'Ping e traceroute: cosa succede davvero', 'Ping usa ICMP Echo Request ed Echo Reply. Traceroute sfrutta il TTL e i messaggi Time Exceeded per scoprire i router lungo il percorso.', '**ICMP** è il protocollo con cui i dispositivi IP segnalano errori e informazioni di controllo. Viaggia direttamente dentro IP (protocol number 1), senza porte.

### Ping
`ping` invia un **Echo Request** (type 8) e attende un **Echo Reply** (type 0). Una risposta dimostra che il percorso funziona **in entrambe le direzioni**: un ping fallito può dipendere anche dalla rotta di ritorno.

Su Cisco IOS l''output è compatto:

```
R1# ping 10.0.0.2
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 10.0.0.2, timeout is 2 seconds:
.!!!!
Success rate is 80 percent (4/5)
```

`!` = risposta ricevuta, `.` = timeout, `U` = Destination Unreachable ricevuto. Il primo `.` è tipico: il router stava ancora risolvendo il next hop con ARP.

### Traceroute
Ogni router decrementa il **TTL** dell''header IP; quando arriva a zero scarta il pacchetto e può inviare un **Time Exceeded** (type 11) al mittente. Traceroute invia sonde con TTL = 1, 2, 3… e ogni Time Exceeded rivela un hop. Windows (`tracert`) usa ICMP Echo, mentre Cisco IOS e Linux usano per impostazione predefinita datagram UDP: la destinazione finale risponde con un Destination Unreachable (port unreachable).

### Interpretazione in azienda
Un hop con `* * *` non significa per forza un guasto: molti dispositivi limitano o filtrano i messaggi ICMP. Conta se i salti successivi rispondono e se la destinazione è raggiungibile.', 'ccna', 'icmp', null, 1, 5, 'original', 'proposed', array['icmp', 'ping', 'traceroute', 'ttl']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('3305bbc1-e089-51b2-9c84-a7425949b96b', null, 'tcp-three-way-handshake', 1, 'lesson', 'it', 'TCP Three-Way Handshake', 'SYN, SYN-ACK, ACK: come due host sincronizzano i numeri di sequenza prima di scambiare dati in modo affidabile.', 'TCP è **orientato alla connessione**: prima di trasmettere dati, client e server stabiliscono una connessione con il **Three-Way Handshake**.

1. **SYN** — il client invia un segment con il flag SYN e il proprio **Initial Sequence Number** (ISN).
2. **SYN-ACK** — il server risponde con SYN e ACK: conferma l''ISN del client (ACK = ISN client + 1) e comunica il proprio ISN.
3. **ACK** — il client conferma l''ISN del server. La connessione è stabilita.

### Perché tre messaggi
Ciascun lato deve comunicare il proprio numero di sequenza iniziale e ricevere conferma che l''altro lo ha ricevuto. Con due soli messaggi il server non saprebbe se il client ha ricevuto il suo ISN. Gli ISN vengono scelti per ogni connessione in modo non prevedibile: rende più difficile iniettare segment falsi in una connessione esistente.

### Chiusura
La connessione viene chiusa con lo scambio di segment **FIN** e ACK in ciascuna direzione, oppure interrotta bruscamente con un **RST**.

### In una cattura Wireshark
Un SYN senza risposta indica di solito un filtro (firewall o ACL) o un host irraggiungibile. Un SYN seguito subito da RST indica invece che l''host è raggiungibile ma nessun servizio è in ascolto su quella porta.', 'ccna', 'tcp-udp', null, 1, 4, 'original', 'proposed', array['tcp', 'handshake']::text[], '[{"id":"tcp-handshake","caption":"Apertura di una connessione TCP."}]'::jsonb, '2026-11-27', '2026-11-27'),
  ('00702e75-7c76-53b2-ae62-8e735e8d9c77', null, 'tcp-vs-udp', 1, 'comparison', 'it', 'TCP o UDP: quale scegliere e perché', 'TCP offre affidabilità e ordinamento al costo di overhead e latenza. UDP è minimale e lascia queste scelte all''applicazione.', '| | TCP | UDP |
|---|---|---|
| Connessione | sì (Three-Way Handshake) | no |
| Affidabilità | acknowledgment e ritrasmissione | nessuna |
| Ordinamento | numeri di sequenza | nessuno |
| Controllo di flusso | window | nessuno |
| Header | 20 byte minimo | 8 byte |
| Esempi | HTTPS, SSH, SMTP | DNS (query), DHCP, VoIP, streaming |

L''header UDP contiene solo quattro campi da 16 bit: porta di origine, porta di destinazione, lunghezza e checksum.

### Come ragionare
TCP non è "migliore" di UDP. Per una telefonata VoIP un pacchetto ritrasmesso in ritardo è inutile: meglio perderlo e passare al successivo. Per il trasferimento di un file, invece, ogni byte deve arrivare integro e in ordine.

Molti protocolli moderni costruiscono la propria affidabilità sopra UDP, quando serve controllare in modo diverso latenza e ritrasmissioni.

### Errore comune
Dire che DNS usa "solo UDP". Le query usano normalmente UDP sulla porta 53, ma DNS usa anche TCP sulla porta 53, per esempio per i trasferimenti di zona o per le risposte troppo grandi.', 'ccna', 'tcp-udp', null, 1, 3, 'original', 'proposed', array['tcp', 'udp', 'porte']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('33c79380-e583-5727-aff9-910497dbc6f0', null, 'dhcp-dora', 1, 'lesson', 'it', 'DHCP: il processo DORA', 'Discover, Offer, Request, Ack: come un client senza indirizzo ottiene la configurazione IP, e perché serve il relay quando il server è in un''altra subnet.', '**DHCP** assegna automaticamente indirizzo IP, Subnet Mask, Default Gateway, server DNS e altri parametri. Il server usa la porta **UDP 67**, il client la porta **UDP 68**.

### DORA
1. **Discover** — il client, ancora senza indirizzo, invia un broadcast (origine 0.0.0.0, destinazione 255.255.255.255) per cercare un server.
2. **Offer** — il server propone un indirizzo dal proprio pool.
3. **Request** — il client chiede formalmente l''indirizzo offerto. Il messaggio è broadcast anche per informare eventuali altri server che la loro offerta non è stata scelta.
4. **Ack** — il server conferma: il client può usare l''indirizzo per la durata del **lease**.

### DHCP relay
I broadcast non attraversano i router. Se il server DHCP si trova in un''altra subnet, l''interfaccia del router rivolta ai client deve essere configurata come **relay agent**: riceve il broadcast e lo inoltra in unicast al server.

```
R1(config)# interface g0/1
R1(config-if)# ip helper-address 10.10.10.5
```

Il relay indica l''interfaccia da cui ha ricevuto la richiesta: così il server sceglie il pool corretto per quella subnet.

### Troubleshooting
Un client con indirizzo **169.254.x.x** (APIPA su Windows) non ha ricevuto risposta. Controlla nell''ordine: connettività di livello 2 e VLAN, presenza di `ip helper-address` sull''interfaccia giusta, raggiungibilità del server dal relay, pool esaurito o assente per quella subnet.', 'ccna', 'dhcp', null, 1, 5, 'original', 'proposed', array['dhcp', 'dora', 'relay']::text[], '[{"id":"dhcp-dora","caption":"I quattro messaggi del processo DORA."}]'::jsonb, '2026-11-27', '2026-11-27'),
  ('a483047e-e685-5e1c-964f-c2de0a4c7c49', null, 'dns-record-types', 1, 'lesson', 'it', 'Record DNS: A, AAAA, CNAME, MX, NS, PTR', 'I sei tipi di record citati dal blueprint, cosa contengono e quali sintomi produce un record sbagliato.', 'Il **DNS** traduce nomi in indirizzi (e viceversa) tramite **record** memorizzati nelle zone.

| Record | Contiene | Esempio |
|---|---|---|
| **A** | un indirizzo IPv4 | `www.example.com → 192.0.2.10` |
| **AAAA** | un indirizzo IPv6 | `www.example.com → 2001:db8::10` |
| **CNAME** | un alias verso un altro nome | `intranet.example.com → web01.example.com` |
| **MX** | il server di posta del dominio, con priorità | `example.com → 10 mail.example.com` |
| **NS** | i server autoritativi della zona | `example.com → ns1.example.com` |
| **PTR** | il nome associato a un indirizzo (reverse lookup) | `10.2.0.192.in-addr.arpa → www.example.com` |

### Diagnosi per sintomo
- **Il sito risponde via IP ma non via nome** → record A/AAAA mancante o errato, oppure il client usa un server DNS sbagliato.
- **Funziona in IPv4 ma è lento o fallisce su alcuni client** → record AAAA presente che punta a un indirizzo IPv6 non raggiungibile: molti client provano prima IPv6.
- **La posta non arriva** → record MX assente, o MX che punta a un nome senza record A/AAAA. Un MX deve puntare a un nome, non a un indirizzo IP.
- **I log mostrano solo IP o i controlli antispam falliscono** → manca il PTR per l''indirizzo.

### Strumenti
```
nslookup -type=mx example.com
dig example.com AAAA
```
Gli esempi usano domini e indirizzi riservati alla documentazione (example.com, 192.0.2.0/24, 2001:db8::/32).', 'ccna', 'dns', null, 1, 5, 'original', 'proposed', array['dns', 'record']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('191e7924-adde-5d9e-b1b2-21480459a5ca', null, 'ios-essential-show', 1, 'command', 'it', 'Comandi show essenziali di Cisco IOS', 'I comandi di verifica da usare per primi su un dispositivo Cisco: cosa mostrano e quando servono.', 'La verifica parte quasi sempre dagli stessi comandi. In **privileged EXEC** (prompt `#`) si eseguono direttamente; in configurazione si possono anteporre con `do`.

```
R1# show ip interface brief
Interface              IP-Address      OK? Method Status                Protocol
GigabitEthernet0/0     10.0.0.1        YES manual up                    up
GigabitEthernet0/1     192.168.1.1     YES manual up                    down
GigabitEthernet0/2     unassigned      YES unset  administratively down down
```

Come leggere *Status/Protocol*:
- **up/up** — interfaccia operativa.
- **up/down** — livello fisico attivo ma problema di livello 2 (per esempio incapsulamento o keepalive).
- **down/down** — problema fisico: cavo, porta remota spenta.
- **administratively down/down** — l''interfaccia è disattivata con `shutdown`.

| Comando | Quando usarlo |
|---|---|
| `show running-config` | configurazione attiva in RAM |
| `show startup-config` | configurazione salvata in NVRAM, usata al riavvio |
| `show interfaces g0/1` | contatori, errori CRC, duplex e speed |
| `show ip route` | Routing Table |
| `show mac address-table` | MAC Address Table (switch) |
| `show vlan brief` | VLAN e porte access associate (switch) |
| `show version` | versione IOS, uptime, registro di configurazione |
| `show logging` | messaggi syslog in memoria |

### Errore classico
Le modifiche entrano subito in **running-config** ma si perdono al riavvio se non vengono salvate con `copy running-config startup-config` (o `write memory`).', 'ccna', 'ios-fundamentals', null, 1, 5, 'original', 'proposed', array['ios', 'show', 'cli']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('bc911fd7-e523-599f-a19d-54fd2993b410', null, 'routing-longest-prefix', 1, 'lesson', 'it', 'Longest prefix match: come il router sceglie la rotta', 'Quando più rotte corrispondono alla destinazione, vince quella con il prefisso più lungo. Administrative distance e metric entrano in gioco solo per rotte con lo stesso prefisso.', 'Per ogni pacchetto il router cerca nella **Routing Table** tutte le rotte che contengono l''indirizzo di destinazione e sceglie quella con il **prefisso più lungo**, cioè la più specifica.

```
R1# show ip route
Gateway of last resort is 203.0.113.1 to network 0.0.0.0

S*    0.0.0.0/0 [1/0] via 203.0.113.1
      10.0.0.0/8 is variably subnetted, 3 subnets, 3 masks
S        10.0.0.0/8 [1/0] via 10.255.0.2
O        10.1.0.0/16 [110/20] via 10.255.0.6, 00:12:03, GigabitEthernet0/1
S        10.1.5.0/24 [1/0] via 10.255.0.10
```

Destinazioni di esempio:
- **10.1.5.20** → corrisponde a /0, /8, /16 e /24 → vince **10.1.5.0/24**.
- **10.1.9.9** → corrisponde a /0, /8, /16 → vince **10.1.0.0/16** (OSPF), anche se la statica /8 ha administrative distance più bassa.
- **10.200.1.1** → vince **10.0.0.0/8**.
- **8.8.8.8** → solo la **default route** 0.0.0.0/0.

### Ordine delle decisioni
1. **Longest prefix match** tra tutte le rotte installate.
2. Per installare una rotta verso lo **stesso prefisso** proveniente da sorgenti diverse si confronta l''**administrative distance** (statica 1, OSPF 110).
3. A parità di sorgente si confronta la **metric** del protocollo.

Nel formato `[110/20]` il primo numero è l''administrative distance, il secondo la metric.

### Perché conta
Una rotta statica più specifica dimenticata in configurazione "vince" su qualsiasi rotta dinamica meno specifica: è una causa frequente di traffico che segue un percorso inatteso.', 'ccna', 'routing-fundamentals', null, 2, 5, 'original', 'proposed', array['routing', 'routing-table', 'longest-prefix-match']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('d382335d-a200-525f-9120-15334aa1f322', null, 'vlan-concept', 1, 'lesson', 'it', 'Cos''è una VLAN e quale problema risolve', 'Una VLAN divide uno switch fisico in più LAN logiche: ogni VLAN è un Broadcast Domain separato. Per passare da una VLAN all''altra serve il routing.', 'Senza VLAN, tutte le porte di uno switch appartengono allo stesso **Broadcast Domain**: un ARP Request, un DHCP Discover o un frame con MAC address di destinazione sconosciuto raggiungono ogni host collegato. In una rete con centinaia di dispositivi questo significa traffico inutile e nessuna separazione tra reparti.

Una **VLAN** (Virtual LAN) raggruppa le porte dello switch in LAN logiche indipendenti. Lo switch mantiene la MAC Address Table per VLAN ed esegue il flooding **solo verso le porte della stessa VLAN**.

### Cosa cambia in pratica
- **Separazione a livello 2**: un host della VLAN 10 non riceve i broadcast della VLAN 20.
- **Una VLAN corrisponde di norma a una subnet IP**: VLAN 10 = 192.168.10.0/24, VLAN 20 = 192.168.20.0/24.
- **Comunicazione tra VLAN solo tramite un dispositivo di livello 3** (router o switch multilayer), che è anche il punto in cui applicare ACL e controlli.

### Esempio
| VLAN | Uso | Subnet |
|---|---|---|
| 10 | Uffici | 192.168.10.0/24 |
| 20 | Stampanti | 192.168.20.0/24 |
| 30 | Telefoni IP | 192.168.30.0/24 |

La VLAN 1 è quella di default: tutte le porte vi appartengono finché non vengono assegnate ad altre VLAN. In azienda si evita di usarla per il traffico degli utenti.', 'ccna', 'vlans', null, 1, 3, 'original', 'proposed', array['vlan', 'broadcast-domain', 'switch']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('a91010c7-1bb6-535b-9004-7f3fb7668ba1', null, 'access-port-config', 1, 'config', 'it', 'Configurare una Access Port e la Voice VLAN', 'Una Access Port appartiene a una sola VLAN dati e invia frame senza tag. Per un telefono IP si aggiunge la Voice VLAN sulla stessa porta.', 'Una **Access Port** collega un dispositivo finale (PC, stampante, dispositivo IoT). Appartiene a **una sola VLAN dati** e i frame escono senza tag 802.1Q: l''host non sa nulla di VLAN.

```
SW1(config)# vlan 10
SW1(config-vlan)# name UFFICI
SW1(config-vlan)# vlan 30
SW1(config-vlan)# name VOCE
SW1(config-vlan)# exit
SW1(config)# interface range gigabitEthernet1/0/1 - 24
SW1(config-if-range)# switchport mode access
SW1(config-if-range)# switchport access vlan 10
SW1(config-if-range)# switchport voice vlan 30
```

- `switchport mode access` fissa la porta in modalità access e disattiva la negoziazione di un trunk.
- `switchport access vlan 10` assegna la VLAN dati. Se la VLAN non esiste ancora, molti switch la creano automaticamente.
- `switchport voice vlan 30` aggiunge una **Voice VLAN**: il telefono IP marca il proprio traffico con il tag della VLAN 30, mentre il PC collegato alla porta del telefono resta nella VLAN 10 senza tag.

### Verifica
```
SW1# show vlan brief
SW1# show interfaces gigabitEthernet1/0/1 switchport
```
In `show vlan brief` le Access Port compaiono accanto alla loro VLAN; i trunk invece **non** compaiono in questo elenco.', 'ccna', 'vlans', null, 1, 3, 'original', 'proposed', array['vlan', 'access-port', 'voice-vlan', 'ios']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('85454276-0723-52d6-ba26-7a94ef15aa46', null, 'trunk-8021q', 1, 'lesson', 'it', 'Trunk 802.1Q: come più VLAN condividono un link', 'Un trunk trasporta il traffico di più VLAN sullo stesso collegamento aggiungendo a ogni frame un tag 802.1Q di 4 byte. La Native VLAN viaggia senza tag.', 'Tra due switch, o tra uno switch e un router, servirebbe un cavo per ogni VLAN. Il **trunk** risolve il problema: un solo link trasporta più VLAN, e ogni frame indica la propria VLAN con un **tag 802.1Q**.

### Il tag
Il tag di 4 byte viene inserito tra il MAC address di origine e il campo Type:
- **TPID** (16 bit) = `0x8100`, indica che il frame è taggato;
- **PCP** (3 bit), priorità per la QoS di livello 2;
- **DEI** (1 bit);
- **VID** (12 bit), il numero di VLAN: valori utilizzabili da 1 a 4094.

Poiché il frame cambia, lo switch ricalcola l''FCS quando aggiunge o toglie il tag.

### Native VLAN
I frame della **Native VLAN** attraversano il trunk **senza tag**; chi li riceve senza tag li assegna alla propria Native VLAN. Per default la Native VLAN è la **VLAN 1**, e deve essere la stessa ai due capi del link.

### Configurazione
```
SW1(config)# interface gigabitEthernet1/0/24
SW1(config-if)# switchport trunk encapsulation dot1q   ! solo sugli switch che supportano anche ISL
SW1(config-if)# switchport mode trunk
SW1(config-if)# switchport trunk native vlan 99
SW1(config-if)# switchport trunk allowed vlan 10,20,30,99
```
Per default un trunk consente **tutte le VLAN da 1 a 4094**. Limitare l''elenco con `allowed vlan` riduce il flooding inutile e la superficie d''attacco.', 'ccna', 'vlan-trunking', null, 2, 4, 'original', 'proposed', array['trunk', '802-1q', 'native-vlan']::text[], '[{"id":"dot1q-frame","caption":"Il tag 802.1Q si inserisce dopo il MAC address di origine."}]'::jsonb, '2026-11-27', '2026-11-27'),
  ('d0939326-daf8-5b17-882a-38d4ab290ae2', null, 'dtp-modes', 1, 'comparison', 'it', 'DTP: quando due porte formano un trunk', 'Le modalità access, trunk, dynamic auto e dynamic desirable decidono se un link diventa trunk. Due porte in dynamic auto restano access.', '**DTP** (Dynamic Trunking Protocol) è un protocollo Cisco che negozia se un link tra switch deve diventare un trunk.

| Modalità | Comportamento |
|---|---|
| `access` | Mai trunk. |
| `trunk` | Trunk incondizionato; invia comunque messaggi DTP. |
| `dynamic desirable` | Cerca attivamente di formare un trunk. |
| `dynamic auto` | Diventa trunk solo se l''altro lato è `trunk` o `desirable`. |
| `nonegotiate` | Disattiva i messaggi DTP (si usa insieme a `trunk` o `access`). |

### Risultato tra due porte
| | trunk | desirable | auto | access |
|---|---|---|---|---|
| **trunk** | trunk | trunk | trunk | non funziona |
| **desirable** | trunk | trunk | trunk | access |
| **auto** | trunk | trunk | **access** | access |
| **access** | non funziona | access | access | access |

`trunk` contro `access` produce una configurazione incoerente: un lato tagga, l''altro no, e il traffico non funziona correttamente.

### Nella pratica
La modalità dinamica di default varia in base al modello di switch. In produzione si configurano i link in modo **esplicito**: `switchport mode trunk` (con `switchport nonegotiate`) tra switch e `switchport mode access` verso gli host. Una porta utente lasciata in modalità dinamica potrebbe negoziare un trunk con un dispositivo che finge di essere uno switch.', 'ccna', 'vlan-trunking', null, 2, 3, 'original', 'proposed', array['dtp', 'trunk', 'sicurezza']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('515d68b9-e263-5df9-882c-a1571f1073fa', null, 'native-vlan-mismatch', 1, 'troubleshooting', 'it', 'Scenario: gli host della VLAN 99 vedono traffico della VLAN 1', 'Un trunk con Native VLAN diverse ai due lati unisce due VLAN senza che il link cada. Come riconoscerlo e correggerlo.', '### Sintomi
- Il trunk tra SW1 e SW2 è attivo e le VLAN 10 e 20 funzionano.
- Un host della VLAN 99 su SW2 riceve broadcast che provengono dalla VLAN 1 di SW1.
- Sulla console compare un messaggio CDP di *native VLAN mismatch*.

### Verifica
```
SW1# show interfaces trunk
Port        Mode         Encapsulation  Status        Native vlan
Gi1/0/24    on           802.1q         trunking      1

SW2# show interfaces trunk
Port        Mode         Encapsulation  Status        Native vlan
Gi1/0/24    on           802.1q         trunking      99
```

### Causa
I frame della Native VLAN attraversano il trunk **senza tag**. SW1 invia senza tag il traffico della VLAN 1; SW2 lo riceve senza tag e lo assegna alla **sua** Native VLAN, la 99. Le due VLAN si fondono in un unico Broadcast Domain e gli host possono finire nella subnet sbagliata.

### Correzione
Allineare la Native VLAN su entrambi i lati, di preferenza una VLAN dedicata e inutilizzata:
```
SW1(config)# interface gigabitEthernet1/0/24
SW1(config-if)# switchport trunk native vlan 99
```

### Perché conta
Il link non cade: il problema è silenzioso e si manifesta come indirizzi DHCP della subnet sbagliata o host irraggiungibili. Usare una Native VLAN dedicata riduce anche il rischio degli attacchi di *VLAN hopping* basati sul doppio tag.', 'ccna', 'vlan-trunking', null, 2, 4, 'hypothetical', 'proposed', array['trunk', 'native-vlan', 'troubleshooting']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('6ea16f93-12c0-5293-bdbe-5f63f369fdac', null, 'router-on-a-stick', 1, 'config', 'it', 'Router-on-a-stick: routing tra VLAN con sotto-interfacce', 'Un router collegato a un trunk usa una sotto-interfaccia per VLAN, ognuna con il proprio tag e il proprio Default Gateway.', 'Gli host di VLAN diverse stanno in subnet diverse: per comunicare serve un dispositivo di livello 3. Con **router-on-a-stick** (ROAS) un solo link fisico tra switch e router trasporta tutte le VLAN, e il router crea una **sotto-interfaccia** per ciascuna.

```
SW1(config)# interface gigabitEthernet1/0/1
SW1(config-if)# switchport mode trunk
SW1(config-if)# switchport trunk allowed vlan 10,20

R1(config)# interface gigabitEthernet0/0
R1(config-if)# no shutdown
R1(config-if)# interface gigabitEthernet0/0.10
R1(config-subif)# encapsulation dot1q 10
R1(config-subif)# ip address 192.168.10.1 255.255.255.0
R1(config-subif)# interface gigabitEthernet0/0.20
R1(config-subif)# encapsulation dot1q 20
R1(config-subif)# ip address 192.168.20.1 255.255.255.0
```

- Il numero dopo il punto è solo un identificativo locale; per chiarezza si usa lo stesso numero della VLAN.
- `encapsulation dot1q 10` collega la sotto-interfaccia al tag della VLAN 10. Per la Native VLAN si aggiunge la parola chiave `native`, oppure si configura l''indirizzo sull''interfaccia fisica.
- L''interfaccia fisica deve essere attiva (`no shutdown`); le sotto-interfacce ne seguono lo stato.
- Gli host usano come Default Gateway l''indirizzo della sotto-interfaccia della propria VLAN.

### Limite
Tutto il traffico tra VLAN sale e scende sullo stesso link: con molto traffico il collegamento diventa un collo di bottiglia. Nelle reti più grandi si usano le **SVI** su uno switch multilayer.', 'ccna', 'inter-vlan-routing', null, 2, 4, 'original', 'proposed', array['inter-vlan', 'roas', 'sotto-interfacce']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('cf331cd3-a550-5c6b-ae59-f8151d3b9355', null, 'svi-inter-vlan', 1, 'config', 'it', 'SVI: routing tra VLAN su uno switch multilayer', 'Una Switch Virtual Interface è un''interfaccia di livello 3 associata a una VLAN. Su uno switch multilayer sostituisce il router-on-a-stick.', 'Una **SVI** (Switch Virtual Interface) è un''interfaccia virtuale di livello 3 che rappresenta una VLAN all''interno dello switch. Su uno switch multilayer le SVI fanno da Default Gateway per le VLAN e il routing avviene in hardware, senza un link verso un router esterno.

```
SW1(config)# ip routing
SW1(config)# interface vlan 10
SW1(config-if)# ip address 192.168.10.1 255.255.255.0
SW1(config-if)# no shutdown
SW1(config-if)# interface vlan 20
SW1(config-if)# ip address 192.168.20.1 255.255.255.0
SW1(config-if)# no shutdown
```

### Quando una SVI è up/up
Una SVI è attiva solo se:
1. la VLAN **esiste** nel database dello switch;
2. almeno una porta della VLAN (Access Port o trunk che la trasporta) è attiva e in **forwarding** per lo Spanning Tree;
3. la SVI non è in `shutdown` (le SVI create vengono spente per default).

Senza `ip routing` lo switch non instrada tra le SVI: ogni SVI resta raggiungibile, ma il traffico tra VLAN non passa.

### Porte routed
Su uno switch multilayer si può anche trasformare una porta fisica in interfaccia di livello 3 con `no switchport`, ad esempio per il link verso un router o un firewall.', 'ccna', 'inter-vlan-routing', null, 2, 3, 'original', 'proposed', array['svi', 'multilayer', 'inter-vlan']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('078e5817-97ec-5f15-bf73-e040a7fdce7d', null, 'stp-why', 1, 'lesson', 'it', 'Perché serve lo Spanning Tree', 'I link ridondanti tra switch creano loop di livello 2: i frame Ethernet non hanno TTL e girano all''infinito. STP blocca le porte necessarie a rompere il loop.', 'La ridondanza è indispensabile: se un link cade, la rete deve continuare a funzionare. Ma tra switch due percorsi alternativi formano un **loop di livello 2**, e Ethernet non ha alcun meccanismo per gestirlo.

### Cosa succede senza STP
- **Broadcast storm**: un broadcast viene inoltrato in flooding su tutte le porte, torna indietro dall''altro percorso e viene inoltrato di nuovo. L''header Ethernet non ha un campo **TTL** come IP, quindi il frame non scade mai e i frame si moltiplicano fino a saturare i link.
- **Instabilità della MAC Address Table**: lo stesso MAC address di origine arriva alternativamente da porte diverse e lo switch continua ad aggiornare la tabella (*MAC flapping*).
- **Frame duplicati**: lo stesso frame unicast arriva più volte alla destinazione.

### Cosa fa lo Spanning Tree
Lo **Spanning Tree Protocol** elegge un **Root Bridge** e, per ogni segmento, sceglie un unico percorso verso di esso. Le porte che creerebbero un loop vengono messe in stato **blocking** (o *discarding* in RSTP): non inoltrano traffico utente ma continuano ad ascoltare le **BPDU**. Se un link attivo cade, una porta bloccata può passare in forwarding.

Gli switch Cisco eseguono per default una variante **per VLAN**: PVST+ o, sugli switch recenti e all''esame, **Rapid PVST+**. Ogni VLAN ha una propria istanza di Spanning Tree e può avere un Root Bridge diverso.', 'ccna', 'stp', null, 1, 3, 'original', 'proposed', array['stp', 'loop', 'broadcast-storm']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('5e78a1cc-d447-5987-a2c0-cff10b2c1045', null, 'stp-root-election', 1, 'lesson', 'it', 'Elezione del Root Bridge e scelta delle porte', 'Il Bridge ID più basso diventa Root Bridge. Poi ogni switch sceglie la propria Root Port e ogni segmento una Designated Port; le altre porte vengono bloccate.', '### 1. Root Bridge
Ogni switch ha un **Bridge ID** (BID) = priorità (default **32768**) + **VLAN ID** (*extended system ID*) + MAC address. Vince il **BID più basso**: prima si confronta la priorità, a parità il MAC address più basso. Per questo, in una VLAN 10 con priorità di default, il BID mostrato è 32778.

La priorità si configura in multipli di **4096**:
```
SW1(config)# spanning-tree vlan 10 root primary     ! oppure: spanning-tree vlan 10 priority 24576
SW2(config)# spanning-tree vlan 10 root secondary
```
Tutte le porte del Root Bridge sono Designated Port.

### 2. Root Port (una per ogni switch non root)
È la porta con il **costo di percorso più basso** verso il Root Bridge. A parità: BID del vicino più basso, poi Port ID del vicino più basso (priorità di porta, default 128, + numero di porta).

Costi di default (metodo *short*): 10 Mbps = 100, 100 Mbps = 19, 1 Gbps = 4, 10 Gbps = 2.

### 3. Designated Port (una per ogni segmento)
Su ogni collegamento, la porta dello switch con il costo più basso verso il Root Bridge diventa Designated Port. A parità, vince lo switch con BID più basso.

### 4. Tutte le altre
Le porte che non sono né Root né Designated vengono bloccate (in RSTP: ruolo **Alternate** o **Backup**, stato discarding).', 'ccna', 'stp', null, 2, 5, 'original', 'proposed', array['stp', 'root-bridge', 'bridge-id']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('19ad7725-4602-5b20-862c-1896f50516d3', null, 'rstp-roles-states', 1, 'comparison', 'it', 'Rapid PVST+: ruoli e stati delle porte', 'RSTP separa il ruolo di una porta (Root, Designated, Alternate, Backup) dal suo stato (Discarding, Learning, Forwarding) e converge in pochi secondi.', 'Lo STP classico (802.1D) impiega fino a 30–50 secondi per portare una porta in forwarding. **RSTP** (802.1w, oggi integrato in 802.1Q) converge molto più in fretta grazie a nuovi ruoli e a una negoziazione diretta tra switch vicini. **Rapid PVST+** è la versione Cisco per VLAN di RSTP.

### Ruoli
| Ruolo | Significato |
|---|---|
| **Root** | La porta migliore verso il Root Bridge (una per switch non root). |
| **Designated** | La porta che inoltra su un segmento verso il lato opposto al root. |
| **Alternate** | Percorso alternativo verso il root, ricevuto da un **altro switch**. Pronta a diventare Root Port se quella attuale cade. |
| **Backup** | Percorso di riserva verso un segmento su cui lo **stesso switch** ha già una Designated Port (raro: richiede un hub condiviso). |

### Stati
| STP classico | RSTP | Inoltra dati? | Apprende MAC? |
|---|---|---|---|
| Disabled, Blocking, Listening | **Discarding** | no | no |
| Learning | **Learning** | no | sì |
| Forwarding | **Forwarding** | sì | sì |

### Tipi di link
- **Point-to-point**: link full-duplex tra switch; la negoziazione proposal/agreement porta subito in forwarding.
- **Shared**: link half-duplex (hub); RSTP torna ai timer classici.
- **Edge**: porta verso un host, equivalente a PortFast; passa subito in forwarding.

Attivazione: `spanning-tree mode rapid-pvst`.', 'ccna', 'stp', null, 2, 4, 'original', 'proposed', array['rstp', 'rapid-pvst', 'stp']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('c929301e-ecaa-5e4a-a3a3-0cfcf6281c77', null, 'portfast-bpduguard', 1, 'config', 'it', 'PortFast e BPDU Guard sulle porte verso gli host', 'PortFast porta subito in forwarding le porte verso PC e server. BPDU Guard le disattiva se ricevono una BPDU, cioè se qualcuno collega uno switch.', 'Su una porta verso un PC, attendere gli stati intermedi dello Spanning Tree è inutile: l''host non crea loop. Il ritardo può però far fallire la richiesta DHCP all''avvio.

### PortFast
**PortFast** porta l''interfaccia direttamente in forwarding, saltando listening e learning.
```
SW1(config)# interface gigabitEthernet1/0/5
SW1(config-if)# spanning-tree portfast
! oppure, per tutte le Access Port:
SW1(config)# spanning-tree portfast default
```
Va usato **solo** verso host, server o router: su un link verso un altro switch può creare un loop temporaneo.

### BPDU Guard
Se su una porta PortFast arriva una BPDU, significa che è stato collegato uno switch. **BPDU Guard** mette la porta in stato **error-disabled**.
```
SW1(config-if)# spanning-tree bpduguard enable
! oppure, per tutte le porte PortFast:
SW1(config)# spanning-tree portfast bpduguard default
```

### Ripristino di una porta err-disabled
```
SW1# show interfaces status err-disabled
SW1(config)# interface gigabitEthernet1/0/5
SW1(config-if)# shutdown
SW1(config-if)# no shutdown
```
Si può anche configurare il ripristino automatico con `errdisable recovery cause bpduguard`. Prima di riattivare la porta, va rimosso lo switch non autorizzato.', 'ccna', 'stp', null, 1, 3, 'original', 'proposed', array['portfast', 'bpdu-guard', 'err-disabled']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('fb919662-a463-51e1-9f1b-94eb611d0f49', null, 'root-loop-guard', 1, 'comparison', 'it', 'Root Guard e Loop Guard: due protezioni diverse', 'Root Guard impedisce a uno switch esterno di diventare Root Bridge. Loop Guard impedisce a una porta bloccata di passare in forwarding quando smette di ricevere BPDU.', '| | Root Guard | Loop Guard |
|---|---|---|
| Problema | Uno switch collegato al bordo con priorità più bassa si prende il ruolo di Root Bridge | Una porta non riceve più BPDU (es. guasto unidirezionale) e passa in forwarding, creando un loop |
| Dove si configura | Porte Designated verso il bordo della rete o verso switch non controllati | Porte Root e Alternate, cioè quelle che ricevono BPDU |
| Cosa fa | Se riceve una BPDU superiore, la porta passa in stato **root-inconsistent** (bloccata) | Se le BPDU smettono di arrivare, la porta viene bloccata invece di diventare Designated |
| Ripristino | Automatico quando cessano le BPDU superiori | Automatico quando le BPDU tornano |
| Comando | `spanning-tree guard root` | `spanning-tree guard loop` |

### BPDU Guard, per confronto
**BPDU Guard** reagisce a **qualsiasi** BPDU e mette la porta in err-disabled; si usa sulle porte verso gli host. Root Guard accetta le BPDU normali e reagisce solo a quelle **superiori**.

### Esempio di uso
In un''azienda con switch di distribuzione gestiti dal team di rete e switch di accesso in un''area affidata a terzi, Root Guard sulle porte dei distribution switch verso quell''area impedisce che un errore di configurazione sposti il Root Bridge e cambi il percorso di tutto il traffico.', 'ccna', 'stp', null, 3, 3, 'original', 'proposed', array['root-guard', 'loop-guard', 'stp']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('7c9d8143-ee1d-56f4-8dc2-4aeb1f3cb2b4', null, 'etherchannel-lacp', 1, 'config', 'it', 'EtherChannel con LACP', 'EtherChannel unisce più link fisici in un''unica interfaccia logica: più banda, ridondanza e nessuna porta bloccata dallo Spanning Tree.', 'Con due link tra gli stessi switch, lo Spanning Tree ne blocca uno. **EtherChannel** li raggruppa in un''unica interfaccia logica, il **Port-channel**: lo Spanning Tree vede un solo link e il traffico viene distribuito su tutti i membri.

### Modalità
| Protocollo | Modalità | Si forma con |
|---|---|---|
| **LACP** (standard IEEE) | `active` | active, passive |
| | `passive` | solo active |
| **PAgP** (Cisco) | `desirable` | desirable, auto |
| | `auto` | solo desirable |
| Statico | `on` | solo on |

Due lati `passive` (o due `auto`) non formano il canale. `on` non negozia nulla: si usa solo se entrambi i lati sono `on`.

### Configurazione
```
SW1(config)# interface range gigabitEthernet1/0/1 - 2
SW1(config-if-range)# channel-group 1 mode active
SW1(config-if-range)# exit
SW1(config)# interface port-channel 1
SW1(config-if)# switchport mode trunk
```

### Requisiti
Le porte membro devono avere la stessa configurazione: **speed e duplex**, modalità access o trunk, **VLAN di accesso** oppure **Native VLAN** e VLAN consentite. LACP permette fino a **8 porte attive** per canale. Il bilanciamento avviene per flusso, in base a un hash di indirizzi MAC o IP: un singolo flusso usa un solo link.

### Verifica
```
SW1# show etherchannel summary
```
Il flag **P** indica una porta inserita nel canale, **SU** un Port-channel di livello 2 attivo.', 'ccna', 'etherchannel', null, 2, 4, 'original', 'proposed', array['etherchannel', 'lacp', 'port-channel']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('b4a7a38b-659c-5422-aaa3-119c4cd6b869', null, 'etherchannel-troubleshooting', 1, 'troubleshooting', 'it', 'Scenario: un membro dell''EtherChannel resta sospeso', 'Su quattro porte configurate, tre sono nel canale e una appare con il flag s. Il motivo è quasi sempre una configurazione diversa dalle altre.', '### Sintomo
```
SW1# show etherchannel summary
Group  Port-channel  Protocol    Ports
------+-------------+-----------+------------------------------------
1      Po1(SU)         LACP      Gi1/0/1(P)  Gi1/0/2(P)  Gi1/0/3(P)  Gi1/0/4(s)
```
Gi1/0/4 è **sospesa** (`s`): non trasporta traffico.

### Ipotesi da verificare, in ordine
1. **Configurazione della porta diversa** dalle altre: `show running-config interface gi1/0/4`. Basta una VLAN consentita in più o in meno, una Native VLAN diversa o la porta lasciata in access mentre il canale è trunk.
2. **Speed o duplex diversi**: `show interfaces gi1/0/4 status`.
3. **Dall''altra parte** la porta corrispondente non è nel gruppo o è collegata a un altro switch (verificabile con CDP o LLDP).

### Correzione
La configurazione si modifica sull''interfaccia `port-channel`, che la propaga ai membri. Per riallineare una porta rimasta indietro conviene rimuoverla dal gruppo, riportarla alla configurazione standard e reinserirla:
```
SW1(config)# default interface gigabitEthernet1/0/4
SW1(config)# interface gigabitEthernet1/0/4
SW1(config-if)# channel-group 1 mode active
```

### Da ricordare
Il canale non segnala un errore evidente: continua a funzionare con meno banda e meno ridondanza. Controllare `show etherchannel summary` dopo ogni modifica.', 'ccna', 'etherchannel', null, 2, 3, 'hypothetical', 'proposed', array['etherchannel', 'troubleshooting']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('31312177-9638-5483-a52d-1a553a958a4c', null, 'cdp-lldp', 1, 'comparison', 'it', 'CDP e LLDP: verificare la documentazione di rete', 'CDP (Cisco) e LLDP (IEEE 802.1AB) annunciano ai vicini diretti nome, modello e porta. Servono a controllare che lo schema di rete corrisponda alla realtà.', 'Lo schema dice che Gi1/0/48 di SW1 va al router R1. È vero? **CDP** e **LLDP** lo dicono in pochi secondi: ogni dispositivo annuncia ai **vicini direttamente collegati** chi è e da quale porta trasmette.

| | CDP | LLDP |
|---|---|---|
| Standard | Proprietario Cisco | IEEE 802.1AB |
| Livello | 2 (non attraversa i router) | 2 (non attraversa i router) |
| Stato di default sugli switch Cisco | Attivo | Spesso disattivo: `lldp run` |
| Timer / holdtime di default | 60 s / 180 s | 30 s / 120 s |
| Comando | `show cdp neighbors [detail]` | `show lldp neighbors [detail]` |

### Leggere l''output
```
SW1# show cdp neighbors
Device ID   Local Intrfce   Holdtme   Capability   Platform   Port ID
R1          Gig 1/0/48      152       R S I        ISR4331    Gig 0/0/1
SW2         Gig 1/0/24      164       S I          C9200      Gig 1/0/24
```
- **Local Intrfce** è la porta di SW1; **Port ID** è la porta del vicino.
- **Capability**: R = router, S = switch, I = IGMP.
- Con `detail` si vedono anche indirizzo IP di gestione, versione software e, per CDP, Native VLAN e duplex.

### Sicurezza
Le informazioni viaggiano in chiaro: sulle porte verso Internet o verso utenti non fidati si disattivano con `no cdp enable` e `no lldp transmit` / `no lldp receive` sull''interfaccia.', 'ccna', 'cdp-lldp', null, 1, 3, 'original', 'proposed', array['cdp', 'lldp', 'documentazione']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('280aaced-4d95-556f-bba5-2bc86aa823da', null, 'interface-errors', 1, 'output_analysis', 'it', 'Leggere i contatori di errore di un''interfaccia', 'CRC, runt, giant, collisioni e late collision raccontano cosa non va sul cavo o nella negoziazione. Ecco come interpretarli.', '```
SW1# show interfaces gigabitEthernet1/0/10
GigabitEthernet1/0/10 is up, line protocol is up (connected)
  Full-duplex, 1000Mb/s, media type is 10/100/1000BaseTX
  ...
     5 minute input rate 2000 bits/sec, 3 packets/sec
     183421 packets input, 25012211 bytes, 0 no buffer
     0 runts, 0 giants, 0 throttles
     1532 input errors, 1532 CRC, 0 frame, 0 overrun, 0 ignored
     0 output errors, 0 collisions, 0 interface resets
     0 late collision, 0 deferred
```

| Contatore | Cosa indica | Cause tipiche |
|---|---|---|
| **CRC** | FCS del frame non corrisponde: il frame è arrivato danneggiato | cavo difettoso o troppo lungo, interferenze, connettore, fibra sporca, duplex mismatch |
| **Runts** | Frame più corti di 64 byte | collisioni, duplex mismatch |
| **Giants** | Frame più lunghi del massimo consentito | MTU diversa, jumbo frame non configurati |
| **Input errors** | Totale degli errori in ricezione | somma di CRC, runts, giants e altri |
| **Collisions** | Collisioni durante la trasmissione | normali solo in half-duplex |
| **Late collision** | Collisione dopo i primi 64 byte del frame | **duplex mismatch** o cavo oltre la lunghezza massima |

### Come ragionare
- Su un link **full-duplex** collisioni e late collision devono essere **zero**.
- CRC in crescita con collisioni a zero fanno pensare al **livello fisico**: cavo, connettore, porta. Si sostituisce il cavo e si azzerano i contatori con `clear counters` per vedere se l''errore continua.
- I contatori sono cumulativi: conta la loro **crescita**, non il valore assoluto.', 'ccna', 'ethernet-lan', null, 2, 4, 'original', 'proposed', array['interfacce', 'crc', 'collisioni', 'troubleshooting']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('be098602-8939-5896-a525-c8867527e7f4', null, 'duplex-mismatch', 1, 'troubleshooting', 'it', 'Scenario: link lento con autonegoziazione disattivata da un lato', 'Un lato è forzato a 100/full, l''altro è in auto: il link sale ma è lentissimo. Il risultato è un duplex mismatch.', '### Situazione
Un server è collegato a Gi1/0/12 di SW1. Il tecnico del server ha forzato la scheda di rete a **100 Mbps full-duplex**; la porta dello switch è rimasta in **auto**. Il link è up, ma i trasferimenti sono molto lenti e a tratti si bloccano.

### Cosa succede
Quando un lato non partecipa all''autonegoziazione, l''altro lato riesce comunque a rilevare la **velocità** dal segnale, ma non il **duplex**. Per i link a 10/100 Mbps, in mancanza di negoziazione lo standard prevede **half-duplex**. Risultato:
- lo switch lavora a 100 Mbps **half-duplex**;
- il server a 100 Mbps **full-duplex**.

### Come si manifesta
```
SW1# show interfaces gigabitEthernet1/0/12
  Half-duplex, 100Mb/s ...
     ... 0 runts ...
     3412 late collision
```
- Sul lato **half-duplex** (switch): **collisioni e late collision**, perché lo switch smette di trasmettere quando riceve.
- Sul lato **full-duplex** (server): **CRC e runt**, frame troncati dallo switch che interrompe la trasmissione.

### Correzione
Usare la stessa impostazione ai due lati: **auto/auto** (preferibile) oppure la stessa velocità e lo stesso duplex forzati su entrambi.
```
SW1(config)# interface gigabitEthernet1/0/12
SW1(config-if)# speed 100
SW1(config-if)# duplex full
```', 'ccna', 'ethernet-lan', null, 2, 4, 'hypothetical', 'proposed', array['duplex', 'autonegoziazione', 'troubleshooting']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('df479dab-854b-573d-8554-235c4540221e', null, 'subnetting-method', 1, 'lesson', 'it', 'Subnetting veloce con il metodo del block size', 'Per trovare network, broadcast e host di una subnet basta individuare l''ottetto interessante e il block size: 256 meno il valore della mask in quell''ottetto.', 'Esempio: **172.16.45.130/27**. Quali sono indirizzo di rete, broadcast e range di host?

### 1. Trova l''ottetto interessante
/27 = 255.255.255.**224**. L''ottetto in cui la mask non è né 255 né 0 è il quarto: lì si decide tutto.

### 2. Calcola il block size
**256 − 224 = 32**. Le subnet partono a multipli di 32 nel quarto ottetto: 0, 32, 64, 96, **128**, 160, 192, 224.

### 3. Colloca l''indirizzo
130 sta tra 128 e 160:
| | Indirizzo |
|---|---|
| Rete | 172.16.45.**128** |
| Primo host | 172.16.45.129 |
| Ultimo host | 172.16.45.158 |
| Broadcast | 172.16.45.**159** (il blocco successivo meno 1) |

### 4. Quanti host
Bit di host = 32 − 27 = 5 → 2⁵ − 2 = **30 host utilizzabili** (si tolgono rete e broadcast).

### Tabella da tenere a mente
| Prefisso | Mask (ultimo ottetto non 0) | Block size | Host |
|---|---|---|---|
| /25 | 128 | 128 | 126 |
| /26 | 192 | 64 | 62 |
| /27 | 224 | 32 | 30 |
| /28 | 240 | 16 | 14 |
| /29 | 248 | 8 | 6 |
| /30 | 252 | 4 | 2 |

Lo stesso ragionamento vale quando l''ottetto interessante è il terzo: con /20 (255.255.**240**.0) il block size è 16 nel terzo ottetto.', 'ccna', 'subnetting', null, 2, 4, 'original', 'proposed', array['subnetting', 'ipv4', 'calcolo']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('1fb6663f-73a9-532b-abd4-35a041912ab3', null, 'subnetting-practice', 1, 'recall', 'it', 'Esercizi di subnetting: dal requisito alla mask', 'Tre esercizi per passare dal numero di host o di subnet richiesti alla mask corretta.', 'Per scegliere la mask partendo da un requisito:
- **numero di host**: cerca il più piccolo *h* tale che 2ʰ − 2 ≥ host richiesti; il prefisso è 32 − *h*;
- **numero di subnet**: cerca il più piccolo *s* tale che 2ˢ ≥ subnet richieste; aggiungi *s* bit al prefisso di partenza.', 'ccna', 'subnetting', null, 2, 4, 'original', 'proposed', array['subnetting', 'esercizi']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('cf69d04d-1dea-5c58-9cb8-7013ba67e62a', null, 'vlsm-design', 1, 'lesson', 'it', 'VLSM: assegnare subnet di dimensioni diverse', 'Con VLSM ogni subnet riceve solo gli indirizzi che le servono. Il metodo: ordinare dalla più grande alla più piccola e assegnare in sequenza.', '**VLSM** (Variable Length Subnet Masking) permette di usare prefissi diversi all''interno dello stesso blocco. Invece di dare a tutte le subnet la stessa dimensione, ognuna riceve quella necessaria.

### Esempio
Blocco disponibile: **10.1.1.0/24**. Requisiti: Uffici 100 host, Laboratorio 50, Ospiti 25, due link tra router.

### Metodo
1. Ordina dalla subnet più grande alla più piccola.
2. Per ciascuna scegli il prefisso più lungo che basta.
3. Assegna in sequenza: ogni subnet parte dove finisce la precedente, così ogni rete è allineata al proprio block size.

| Subnet | Host | Prefisso | Rete | Broadcast |
|---|---|---|---|---|
| Uffici | 100 | /25 (126) | 10.1.1.0 | 10.1.1.127 |
| Laboratorio | 50 | /26 (62) | 10.1.1.128 | 10.1.1.191 |
| Ospiti | 25 | /27 (30) | 10.1.1.192 | 10.1.1.223 |
| Link R1–R2 | 2 | /30 | 10.1.1.224 | 10.1.1.227 |
| Link R2–R3 | 2 | /30 | 10.1.1.228 | 10.1.1.231 |

Restano liberi 10.1.1.232–255 per usi futuri.

### Perché l''ordine conta
Se si assegnasse prima un /30 a partire da 10.1.1.0, la subnet /25 non potrebbe più iniziare da .0 e i blocchi rimasti sarebbero frammentati: la /25 deve partire da un multiplo di 128.', 'ccna', 'subnetting', null, 2, 4, 'original', 'proposed', array['vlsm', 'subnetting', 'progettazione']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('45145bca-b4dc-5d0e-b561-8c03cd24610b', null, 'ipv4-host-troubleshooting', 1, 'troubleshooting', 'it', 'Scenario: il PC raggiunge la LAN ma non Internet', 'Un PC fa ping agli host della propria subnet ma non a quelli remoti. Quattro controlli sulla configurazione IP individuano quasi sempre la causa.', '### Situazione
PC1 ha questa configurazione:
```
C:\> ipconfig
   IPv4 Address. . . . . . . . . . . : 192.168.10.25
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . : 192.168.1.1
```
Ping verso 192.168.10.30 (stessa subnet): riuscito. Ping verso 8.8.8.8: fallito.

### Ragionamento
Per destinazioni fuori dalla propria subnet, l''host invia il pacchetto al **Default Gateway**, che deve trovarsi **nella sua stessa subnet**. 192.168.1.1 non appartiene a 192.168.10.0/24: il PC non riesce nemmeno a risolverne l''indirizzo con ARP.

### Lista di controllo
1. **Indirizzo e mask**: l''host è nella subnet prevista per la sua VLAN? Una mask sbagliata (es. /16 invece di /24) fa credere all''host che destinazioni remote siano locali e lo porta a fare ARP invece di usare il gateway.
2. **Default Gateway**: è nella stessa subnet ed è l''indirizzo reale dell''interfaccia del router o della SVI?
3. **Raggiungibilità del gateway**: `ping 192.168.10.1`; se fallisce, il problema è nella LAN (VLAN, porta, SVI down).
4. **DNS**: se `ping 8.8.8.8` funziona ma `ping www.esempio.it` no, il problema è la risoluzione dei nomi, non il routing.

### Correzione
Impostare il Default Gateway corretto, 192.168.10.1, a mano o, meglio, verificando l''opzione Router dello scope DHCP.', 'ccna', 'ipv4-addressing', null, 1, 3, 'hypothetical', 'proposed', array['troubleshooting', 'default-gateway', 'ipv4']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('67333b75-0bae-57d6-a48a-f3bd5d318acb', null, 'ipv6-address-format', 1, 'lesson', 'it', 'Scrivere e abbreviare gli indirizzi IPv6', '128 bit, otto gruppi da 16 bit in esadecimale. Due regole di abbreviazione e la forma canonica della RFC 5952.', 'Un indirizzo IPv6 è lungo **128 bit**, scritto come **otto gruppi di 4 cifre esadecimali** (16 bit ciascuno) separati da due punti:
```
2001:0db8:0000:0000:0000:ff00:0042:8329
```

### Regole di abbreviazione
1. **Zeri iniziali** di ogni gruppo si possono omettere: `0db8` → `db8`, `0042` → `42`, `0000` → `0`.
2. **Una sola sequenza** di gruppi tutti a zero si sostituisce con `::`. Una sola, altrimenti non si saprebbe quanti gruppi rappresenta ciascuna.
```
2001:db8::ff00:42:8329
```

### Forma canonica (RFC 5952)
La RFC 5952 raccomanda una sola rappresentazione per ogni indirizzo:
- gli zeri iniziali **devono** essere omessi;
- `::` deve abbreviare la sequenza di zeri **più lunga**; a parità, la **prima**;
- `::` **non** si usa per un singolo gruppo `0`;
- le cifre esadecimali si scrivono in **minuscolo**.

| Indirizzo | Forma canonica |
|---|---|
| 2001:0DB8:0000:0001:0000:0000:0000:0001 | 2001:db8:0:1::1 |
| 2001:db8:0:0:1:0:0:1 | 2001:db8::1:0:0:1 |
| 2001:db8:0:1:1:1:1:1 | 2001:db8:0:1:1:1:1:1 |

### Prefissi
Come in IPv4 con CIDR: `2001:db8:acad:1::/64`. Nelle LAN si usa quasi sempre **/64**: 64 bit per la rete e 64 per l''Interface ID.', 'ccna', 'ipv6-fundamentals', null, 1, 3, 'original', 'proposed', array['ipv6', 'abbreviazione', 'rfc5952']::text[], '[{"id":"ipv6-gua-structure"}]'::jsonb, '2026-11-27', '2026-11-27'),
  ('588fd3db-064d-5429-90a1-2d39a6655df7', null, 'ipv6-address-types', 1, 'comparison', 'it', 'Tipi di indirizzo IPv6: global, link-local, unique local, multicast', 'IPv6 non ha broadcast. Un''interfaccia ha di solito più indirizzi: almeno un link-local e uno o più global unicast. Ecco come riconoscerli dal prefisso.', '| Tipo | Prefisso | Ambito | Uso |
|---|---|---|---|
| **Global Unicast** | 2000::/3 (inizia per 2 o 3) | Internet | Equivalente di un indirizzo pubblico IPv4 |
| **Unique Local** | fc00::/7 (in pratica fd00::/8) | Organizzazione | Simile agli indirizzi privati; non instradato su Internet |
| **Link-Local** | fe80::/10 | Solo il link | Generato automaticamente; usato da NDP, dai protocolli di routing e come next hop |
| **Multicast** | ff00::/8 | Variabile | Sostituisce il broadcast |
| **Loopback** | ::1/128 | Host | Come 127.0.0.1 |
| **Non specificato** | ::/128 | — | Origine prima di avere un indirizzo |

### Multicast da riconoscere
| Indirizzo | Destinatari |
|---|---|
| ff02::1 | tutti i nodi del link |
| ff02::2 | tutti i router del link |
| ff02::1:ffXX:XXXX | **solicited-node**, ricavato dagli ultimi 24 bit dell''indirizzo unicast; usato da NDP al posto dell''ARP broadcast |

### Nella pratica Cisco
```
R1(config)# ipv6 unicast-routing
R1(config)# interface gigabitEthernet0/0
R1(config-if)# ipv6 address 2001:db8:acad:1::1/64
R1(config-if)# ipv6 address fe80::1 link-local
R1# show ipv6 interface brief
```
Configurare il link-local a mano (es. `fe80::1`) rende più leggibili le Routing Table e i next hop. Senza `ipv6 unicast-routing` il router non inoltra pacchetti IPv6 e non invia Router Advertisement.', 'ccna', 'ipv6-fundamentals', null, 1, 4, 'original', 'proposed', array['ipv6', 'link-local', 'multicast']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('436e1cfb-339e-5ee1-90a7-84862b868b60', null, 'ipv6-eui64', 1, 'lesson', 'it', 'Modified EUI-64: dall''indirizzo MAC all''Interface ID', 'EUI-64 ricava i 64 bit dell''Interface ID dal MAC address: si divide il MAC a metà, si inserisce FFFE e si inverte il settimo bit.', 'Con un prefisso /64, l''host deve generare 64 bit di **Interface ID**. Il metodo **Modified EUI-64** li ricava dal MAC address di 48 bit.

### Procedura
MAC address: **00-1A-2B-3C-4D-5E**
1. Dividi il MAC a metà: `001A2B` | `3C4D5E`.
2. Inserisci **FFFE** in mezzo: `001A2BFFFE3C4D5E`.
3. Inverti il **settimo bit** del primo byte (bit Universal/Local): `00` = 0000 0000 → 0000 0**0**10 = `02`.
4. Risultato: `021A:2BFF:FE3C:4D5E`.

Con il prefisso 2001:db8:1:1::/64 l''indirizzo diventa **2001:db8:1:1:21a:2bff:fe3c:4d5e**.

### Trucco per il settimo bit
Basta guardare la seconda cifra esadecimale del primo byte e sommare o sottrarre 2: 0 ↔ 2, 4 ↔ 6, 8 ↔ A, C ↔ E (e 1 ↔ 3, 5 ↔ 7, 9 ↔ B, D ↔ F).

### Su IOS
```
R1(config-if)# ipv6 address 2001:db8:1:1::/64 eui-64
```
Anche gli indirizzi link-local generati automaticamente sui router Cisco usano EUI-64.

### Nota sulla privacy
Un Interface ID derivato dal MAC è sempre lo stesso, anche cambiando rete: identifica il dispositivo. I sistemi operativi moderni per questo generano Interface ID casuali o opachi per gli indirizzi degli host.', 'ccna', 'ipv6-fundamentals', null, 2, 4, 'original', 'proposed', array['ipv6', 'eui-64', 'interface-id']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('4cacfc2d-a645-50f3-ba69-3839736094ad', null, 'ipv6-slaac-ndp', 1, 'lesson', 'it', 'NDP e SLAAC: come un host IPv6 si configura da solo', 'Con NDP l''host scopre router, prefisso e vicini. Con SLAAC costruisce il proprio indirizzo dal prefisso del Router Advertisement e verifica che sia libero con DAD.', '**NDP** (Neighbor Discovery Protocol) usa messaggi **ICMPv6** e sostituisce ARP e parte di DHCP.

| Messaggio | Tipo ICMPv6 | A cosa serve |
|---|---|---|
| Router Solicitation (RS) | 133 | L''host chiede ai router di annunciarsi (verso ff02::2) |
| Router Advertisement (RA) | 134 | Il router annuncia prefisso, lunghezza, gateway e flag |
| Neighbor Solicitation (NS) | 135 | Chiede il MAC address di un vicino; usato anche per DAD |
| Neighbor Advertisement (NA) | 136 | Risposta con il MAC address |
| Redirect | 137 | Il router indica un next hop migliore |

### SLAAC passo per passo
1. L''host genera un **link-local** e verifica che sia unico.
2. Invia un **RS**; il router risponde con un **RA** contenente il prefisso (es. 2001:db8:1:1::/64).
3. L''host combina il prefisso con un **Interface ID** (EUI-64 o casuale).
4. Prima di usarlo esegue la **DAD** (Duplicate Address Detection): invia un NS per il proprio indirizzo; se nessuno risponde, l''indirizzo è libero.
5. Usa come Default Gateway l''indirizzo **link-local** del router che ha inviato l''RA.

Ogni indirizzo ha una **preferred lifetime** e una **valid lifetime**, indicate nell''RA.

### I flag dell''RA
- **M** (Managed): gli indirizzi si ottengono da un server **DHCPv6 stateful**.
- **O** (Other): l''indirizzo si fa con SLAAC, le altre informazioni (es. DNS) si chiedono a **DHCPv6 stateless**.', 'ccna', 'ipv6-ndp-slaac', null, 2, 4, 'original', 'proposed', array['ipv6', 'ndp', 'slaac', 'dad']::text[], '[{"id":"slaac-exchange"}]'::jsonb, '2026-11-27', '2026-11-27'),
  ('e56facf2-5546-5db7-827c-942260ba899c', null, 'administrative-distance', 1, 'lesson', 'it', 'Administrative Distance e metrica: chi vince tra due route', 'Il router sceglie prima il prefisso più lungo. A parità di prefisso decide l''Administrative Distance della fonte, e solo dentro lo stesso protocollo la metrica.', 'Un router può conoscere la stessa destinazione da fonti diverse: una route statica, OSPF, EIGRP. Per decidere quale installare nella Routing Table usa tre criteri, in quest''ordine.

1. **Longest prefix match** al momento dell''inoltro: 10.1.1.0/24 e 10.1.0.0/16 sono destinazioni diverse e convivono nella tabella; vince la più specifica che contiene l''indirizzo.
2. **Administrative Distance** (AD): per lo **stesso prefisso** appreso da fonti diverse vince l''AD più bassa, cioè la fonte considerata più affidabile.
3. **Metrica**: per lo stesso prefisso appreso dallo **stesso protocollo** vince la metrica più bassa (costo per OSPF, metrica composita per EIGRP, hop count per RIP). A parità di metrica il router può bilanciare il traffico (ECMP).

### Valori di default Cisco
| Fonte | AD |
|---|---|
| Connessa | 0 |
| Statica | 1 |
| eBGP | 20 |
| EIGRP interno | 90 |
| OSPF | 110 |
| IS-IS | 115 |
| RIP | 120 |
| EIGRP esterno | 170 |
| iBGP | 200 |
| Sconosciuta | 255 (mai installata) |

In `show ip route` l''AD è il primo numero tra parentesi quadre: `[110/2]` = AD 110, metrica 2.

Le metriche di protocolli diversi non si confrontano mai tra loro: un costo OSPF 20 e una metrica RIP 2 non sono paragonabili, per questo serve l''AD.', 'ccna', 'routing-fundamentals', null, 2, 4, 'original', 'proposed', array['administrative-distance', 'metrica', 'routing-table']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('db8f5d45-4567-5c1b-8ae5-dc20be849810', null, 'show-ip-route', 1, 'output_analysis', 'it', 'Leggere `show ip route` riga per riga', 'Codice della fonte, prefisso, [AD/metrica], next hop, età e interfaccia di uscita: come estrarre il percorso di un pacchetto dalla Routing Table.', '```
R1# show ip route
Codes: L - local, C - connected, S - static, O - OSPF, D - EIGRP ...
Gateway of last resort is 203.0.113.1 to network 0.0.0.0

S*    0.0.0.0/0 [1/0] via 203.0.113.1
      10.0.0.0/8 is variably subnetted, 4 subnets, 4 masks
C        10.0.12.0/30 is directly connected, GigabitEthernet0/1
L        10.0.12.1/32 is directly connected, GigabitEthernet0/1
O        10.2.0.0/16 [110/2] via 10.0.12.2, 00:14:03, GigabitEthernet0/1
O        10.2.5.0/24 [110/3] via 10.0.12.2, 00:14:03, GigabitEthernet0/1
```

### Come si legge una riga
`O 10.2.0.0/16 [110/2] via 10.0.12.2, 00:14:03, GigabitEthernet0/1`
| Parte | Significato |
|---|---|
| `O` | appresa da OSPF |
| `10.2.0.0/16` | rete di destinazione e prefisso |
| `[110/2]` | AD 110, metrica (costo) 2 |
| `via 10.0.12.2` | next hop |
| `00:14:03` | da quanto tempo la route è in tabella |
| `GigabitEthernet0/1` | interfaccia di uscita |

### Righe speciali
- **C** e **L**: ogni indirizzo configurato su un''interfaccia attiva genera una route connessa (la subnet) e una **local** /32 (l''indirizzo del router stesso).
- **S\*** con `0.0.0.0/0`: route di default; l''asterisco la indica come candidata a *gateway of last resort*.

### Esercizio
Un pacchetto per **10.2.5.9**: corrispondono 10.2.0.0/16, 10.2.5.0/24 e 0.0.0.0/0. Vince **10.2.5.0/24**, il prefisso più lungo. Next hop 10.0.12.2, uscita Gi0/1.
Un pacchetto per **10.3.1.1**: nessuna route specifica, si usa la **default route** verso 203.0.113.1.', 'ccna', 'routing-fundamentals', null, 2, 4, 'original', 'proposed', array['routing-table', 'show-ip-route', 'output']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('c17b1b9a-ade1-5193-b29d-e48c69ccacb8', null, 'static-route-types', 1, 'config', 'it', 'Route statiche: di rete, host e di default', 'Una route statica indica next hop o interfaccia di uscita per un prefisso. Cambiando il prefisso si ottiene una route di rete, una host route o la default route.', '```
R1(config)# ip route 192.168.50.0 255.255.255.0 10.0.12.2        ! route di rete
R1(config)# ip route 192.168.50.10 255.255.255.255 10.0.13.2     ! host route (/32)
R1(config)# ip route 0.0.0.0 0.0.0.0 203.0.113.1                  ! default route
```

| Tipo | Prefisso | Uso tipico |
|---|---|---|
| **Network route** | la subnet di destinazione | raggiungere una LAN remota |
| **Host route** | /32 | instradare un singolo host per un percorso diverso (es. un server) |
| **Default route** | 0.0.0.0/0 | tutto ciò che non ha una route più specifica, di solito verso Internet |

### Next hop o interfaccia di uscita
- **Next hop** (`10.0.12.2`): il router fa una ricerca ricorsiva per capire da quale interfaccia raggiungerlo.
- **Interfaccia di uscita** (`GigabitEthernet0/1`): adatta ai link point-to-point. Su Ethernet è sconsigliata da sola, perché il router considera ogni destinazione direttamente collegata e deve fare ARP per ciascuna.
- **Entrambi** (`ip route 192.168.50.0 255.255.255.0 GigabitEthernet0/1 10.0.12.2`): la forma più precisa.

### Il ritorno
Una route statica funziona in **una sola direzione**. Se R1 conosce la LAN di R2 ma R2 non conosce quella di R1, i ping falliscono: la richiesta arriva, la risposta no.

### Verifica
```
R1# show ip route static
R1# ping 192.168.50.1 source 192.168.10.1
```', 'ccna', 'static-routing', null, 1, 4, 'original', 'proposed', array['static-route', 'default-route', 'host-route']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('36633e1d-bddc-577d-bee3-e180a53eeb5c', null, 'floating-static', 1, 'config', 'it', 'Floating static route: un percorso di riserva', 'Una route statica con Administrative Distance più alta di quella principale resta fuori dalla Routing Table finché il percorso principale non scompare.', 'Una **floating static route** è una route statica di backup: le si assegna un''**Administrative Distance** più alta della route principale, così non viene installata finché la principale esiste.

### Esempio
R1 raggiunge la sede remota 10.50.0.0/16 tramite OSPF sul link in fibra (AD 110). Come riserva c''è un link 4G verso 198.51.100.1.
```
R1(config)# ip route 10.50.0.0 255.255.0.0 198.51.100.1 130
```
- Finché OSPF annuncia 10.50.0.0/16, la route OSPF (AD 110) vince e la statica (AD 130) non compare in `show ip route`.
- Se il link in fibra cade e la route OSPF scompare, la statica viene installata e il traffico passa sul 4G.

### Scegliere il valore di AD
Deve essere **più alto** della route da proteggere:
| Principale | AD | Floating static, ad esempio |
|---|---|---|
| statica | 1 | 2 o superiore |
| EIGRP interno | 90 | 95 |
| OSPF | 110 | 115–130 |

### Attenzione
La route di backup si attiva solo se la principale **sparisce** dalla tabella. Con una route statica principale verso un next hop, se il link cade ma l''interfaccia locale resta up (ad esempio attraverso uno switch), la route principale rimane in tabella e il backup non entra in funzione. In questi casi si usa un meccanismo di tracciamento come IP SLA.', 'ccna', 'static-routing', null, 2, 3, 'original', 'proposed', array['floating-static', 'backup', 'administrative-distance']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('f6757f1b-c0d8-5625-90d7-2240591736d1', null, 'ipv6-static-routes', 1, 'config', 'it', 'Route statiche IPv6', 'La sintassi è `ipv6 route prefisso/lunghezza next-hop`. Con un next hop link-local bisogna indicare anche l''interfaccia di uscita.', '```
R1(config)# ipv6 unicast-routing
R1(config)# ipv6 route 2001:db8:50::/64 2001:db8:12::2                    ! next hop global
R1(config)# ipv6 route 2001:db8:60::/64 GigabitEthernet0/1 fe80::2       ! next hop link-local
R1(config)# ipv6 route ::/0 2001:db8:ffff::1                              ! default route
R1(config)# ipv6 route 2001:db8:70::/64 2001:db8:13::2 130                ! floating static
```

### Perché il link-local richiede l''interfaccia
Gli indirizzi **link-local** (fe80::/10) sono validi solo sul singolo link e possono ripetersi su interfacce diverse: `fe80::2` potrebbe esistere sia dietro Gi0/0 sia dietro Gi0/1. Il router non può dedurre l''interfaccia, quindi va scritta esplicitamente.

### Verifica
```
R1# show ipv6 route static
R1# ping 2001:db8:50::1
```

### Errori frequenti
- Dimenticare `ipv6 unicast-routing`: il router non inoltra pacchetti IPv6.
- Scrivere la mask come in IPv4: in IPv6 si usa sempre la lunghezza del prefisso (`/64`).
- Default route IPv6: `::/0`, non `0::0 0::0`.', 'ccna', 'static-routing', null, 2, 3, 'original', 'proposed', array['ipv6', 'static-route']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('ffd406f8-fd0d-5c61-b6c0-5221d55a6b62', null, 'static-route-troubleshooting', 1, 'troubleshooting', 'it', 'Scenario: la route statica c''è ma il traffico non passa', 'R1 ha la route verso la LAN di R3, ma il ping fallisce. Tre errori tipici: next hop sbagliato, ritorno mancante, prefisso scritto male.', '### Topologia
PC1 (192.168.1.10) – R1 – 10.0.12.0/30 – R2 – 10.0.23.0/30 – R3 – PC3 (192.168.3.10)

Configurazione di R1:
```
R1(config)# ip route 192.168.3.0 255.255.255.0 10.0.23.2
```
Il ping da PC1 a PC3 fallisce.

### Analisi
1. **Il next hop è raggiungibile da R1?** 10.0.23.2 non appartiene a nessuna subnet collegata a R1. La ricerca ricorsiva fallisce e la route non viene installata (in `show ip route` non compare). Il next hop corretto è il vicino diretto, **10.0.12.2** (R2).
2. **R2 sa dove andare?** R2 deve avere una route per 192.168.3.0/24 verso 10.0.23.2.
3. **Il ritorno esiste?** R3 e R2 devono conoscere 192.168.1.0/24.

### Strumenti
```
R1# show ip route 192.168.3.0
R1# traceroute 192.168.3.10
```
`traceroute` mostra fino a quale router il pacchetto arriva: se si ferma a R2, il problema è su R2 o oltre.

### Altri errori frequenti
- Prefisso o mask sbagliati: `ip route 192.168.30.0 255.255.255.0 …` crea una route per un''altra rete. Se indirizzo e mask non sono coerenti (bit di host a 1), IOS rifiuta il comando con *Inconsistent address and mask*.
- Interfaccia di uscita sbagliata o in shutdown: la route sparisce dalla tabella.
- Una route più specifica, magari appresa da un protocollo dinamico, attira il traffico altrove.', 'ccna', 'static-routing', null, 2, 4, 'hypothetical', 'proposed', array['static-route', 'troubleshooting', 'traceroute']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('14ffc845-1de0-537d-85fd-b10a9685f7ff', null, 'ospf-fundamentals', 1, 'lesson', 'it', 'OSPF: link-state, aree e costo', 'Ogni router OSPF conosce la mappa completa dell''area e calcola i percorsi migliori con l''algoritmo SPF. La metrica è il costo, derivato dalla banda.', '**OSPF** (Open Shortest Path First) è un protocollo di routing **link-state**, standard aperto, usato in moltissime reti aziendali.

### Come funziona
1. I router scoprono i vicini con i pacchetti **Hello**.
2. Si scambiano **LSA** (Link State Advertisement) che descrivono i propri link.
3. Ogni router costruisce la stessa **LSDB** (Link State Database), cioè la mappa dell''area.
4. Ognuno esegue l''algoritmo **SPF** (Dijkstra) mettendosi alla radice e installa nella Routing Table i percorsi a costo minimo.

Un protocollo **distance vector** (come RIP) conosce solo "distanza e direzione" annunciate dai vicini; OSPF invece conosce la topologia.

### Aree
Le aree limitano la dimensione della LSDB. All''esame CCNA si usa **OSPF single area**, cioè tutti i router nell''**area 0** (backbone). In una rete multi-area, i router tra due aree sono **ABR** (Area Border Router).

### Costo
Costo = **reference bandwidth / banda dell''interfaccia**. La reference bandwidth di default è **100 Mbps**:
| Interfaccia | Costo con reference 100 Mbps |
|---|---|
| 10 Mbps | 10 |
| 100 Mbps | 1 |
| 1 Gbps | 1 |
| 10 Gbps | 1 |

Il costo minimo è 1, quindi FastEthernet e 10 Gigabit risultano uguali. Si corregge alzando la reference bandwidth su **tutti** i router:
```
R1(config-router)# auto-cost reference-bandwidth 100000   ! in Mbps: 100 Gbps
```
In alternativa si imposta il costo per interfaccia con `ip ospf cost`.

La metrica di una route è la **somma dei costi** delle interfacce di uscita lungo il percorso.', 'ccna', 'ospf', null, 2, 4, 'original', 'proposed', array['ospf', 'link-state', 'costo']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('3b9bba2b-e3c4-5740-96d1-d8241a5ab713', null, 'ospf-neighbors', 1, 'lesson', 'it', 'Adiacenze OSPF: dagli Hello allo stato Full', 'Due router OSPF diventano vicini solo se alcuni parametri degli Hello coincidono. Poi sincronizzano le LSDB passando per ExStart, Exchange e Loading.', '### Gli stati
| Stato | Cosa è successo |
|---|---|
| **Down** | Nessun Hello ricevuto dal vicino |
| **Init** | Ricevuto un Hello, ma il vicino non mi elenca ancora |
| **2-Way** | Ciascuno vede il proprio Router ID negli Hello dell''altro: comunicazione bidirezionale |
| **ExStart** | Si decide chi guida lo scambio (master/slave) |
| **Exchange** | Scambio dei DBD, il riassunto della LSDB |
| **Loading** | Richiesta (LSR) e invio (LSU) delle LSA mancanti |
| **Full** | LSDB sincronizzate: adiacenza completa |

Gli Hello sono inviati a **224.0.0.5** (tutti i router OSPF). Timer di default su Ethernet e point-to-point: **Hello 10 s, Dead 40 s**.

### Cosa deve coincidere
- **Area ID**
- **Subnet e mask** dell''interfaccia (su reti broadcast)
- **Hello e Dead interval**
- **Autenticazione**, se configurata
- **Flag di area stub**

E inoltre: **Router ID diversi**, interfaccia **non passiva**, **MTU uguale** (un MTU diverso blocca i router in ExStart/Exchange).

### 2-Way non è sempre un problema
Su una rete broadcast con più router, i router che non sono DR né BDR (**DROther**) restano in **2-Way** tra loro: diventano Full solo con DR e BDR. È il comportamento normale.

```
R1# show ip ospf neighbor
Neighbor ID  Pri  State         Dead Time  Address    Interface
2.2.2.2        1  FULL/DR       00:00:36   10.0.0.2   Gi0/0
3.3.3.3        1  2WAY/DROTHER  00:00:33   10.0.0.3   Gi0/0
```', 'ccna', 'ospf', null, 2, 5, 'original', 'proposed', array['ospf', 'adiacenza', 'neighbor-states']::text[], '[{"id":"ospf-adjacency"}]'::jsonb, '2026-11-27', '2026-11-27'),
  ('fbf39b97-630b-578c-858a-42239c8925cc', null, 'ospf-dr-bdr', 1, 'lesson', 'it', 'DR e BDR: perché esistono e come vengono eletti', 'Su una rete broadcast OSPF elegge un Designated Router e un backup per evitare che tutti i router si scambino LSA con tutti. L''elezione non è preemptive.', 'Su una Ethernet con *n* router, se ognuno formasse un''adiacenza Full con tutti si avrebbero n(n−1)/2 adiacenze e molti LSA duplicati. OSPF elegge invece:
- un **DR** (Designated Router), con cui tutti formano un''adiacenza Full;
- un **BDR** (Backup DR), pronto a sostituirlo;
- gli altri sono **DROther** e restano in 2-Way tra loro.

I DROther inviano gli aggiornamenti a **224.0.0.6** (DR e BDR); il DR li ridistribuisce a tutti su **224.0.0.5**.

### Elezione
1. Vince la **priorità OSPF** più alta dell''interfaccia (default **1**, intervallo 0–255).
2. A parità, vince il **Router ID** più alto.
3. Priorità **0** = il router non può diventare né DR né BDR.

```
R1(config)# interface gigabitEthernet0/0
R1(config-if)# ip ospf priority 100
```

### Non è preemptive
Se un router con priorità più alta si aggiunge dopo l''elezione, **non** prende il posto del DR. Il ruolo cambia solo se il DR cade (il BDR diventa DR e si elegge un nuovo BDR) o se si riavvia il processo OSPF con `clear ip ospf process`.

### Point-to-point
Sui link punto-punto non si elegge alcun DR. Su un collegamento Ethernet tra due soli router si può configurare `ip ospf network point-to-point`: niente elezione e adiacenza più rapida.', 'ccna', 'ospf', null, 2, 4, 'original', 'proposed', array['ospf', 'dr', 'bdr', 'elezione']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('00f947c6-9c0b-5e79-b092-ac96d6ca1434', null, 'ospf-router-id', 1, 'flashcard', 'it', 'Come OSPF sceglie il Router ID', 'Router ID manuale, poi l''indirizzo di loopback più alto, poi il più alto tra le interfacce fisiche attive.', 'Il **Router ID** (RID) è un numero di 32 bit scritto come un indirizzo IPv4. Identifica il router nella LSDB e deve essere **unico** nel dominio OSPF.

```
R1(config)# router ospf 1
R1(config-router)# router-id 1.1.1.1
R1# clear ip ospf process
```
Il nuovo RID si applica solo dopo il riavvio del processo (o del router).', 'ccna', 'ospf', null, 1, 1, 'original', 'proposed', array['ospf', 'router-id']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('81d555a3-f2bb-5df3-8872-fd39ae63611c', null, 'ospf-config', 1, 'config', 'it', 'Configurare OSPFv2 single area', 'Due modi per attivare OSPF sulle interfacce: il comando network con wildcard nel processo, oppure ip ospf area sull''interfaccia. Più passive-interface e default route.', '### Metodo 1: `network` con wildcard mask
```
R1(config)# router ospf 1
R1(config-router)# router-id 1.1.1.1
R1(config-router)# network 10.0.12.0 0.0.0.3 area 0
R1(config-router)# network 192.168.1.0 0.0.0.255 area 0
R1(config-router)# passive-interface gigabitEthernet0/1
```
Il comando `network` non annuncia una rete: **attiva OSPF sulle interfacce** il cui indirizzo rientra nell''intervallo. OSPF poi annuncia la subnet di quelle interfacce. `network 0.0.0.0 255.255.255.255 area 0` le attiva tutte.

### Metodo 2: sull''interfaccia
```
R1(config)# interface gigabitEthernet0/0
R1(config-if)# ip ospf 1 area 0
R1(config-if)# ip ospf network point-to-point
```
Più leggibile: la configurazione OSPF di ogni interfaccia è accanto alla sua configurazione IP.

### Passive interface
`passive-interface` smette di inviare Hello su un''interfaccia ma **continua ad annunciarne la subnet**. Si usa verso le LAN degli utenti, dove non ci sono router OSPF: evita adiacenze indesiderate.

### Annunciare la default route
```
R1(config-router)# default-information originate
```
R1 annuncia la propria default route (statica, verso l''ISP) agli altri router OSPF.

### Verifica
```
R1# show ip protocols
R1# show ip ospf interface brief
R1# show ip ospf neighbor
R1# show ip route ospf
```', 'ccna', 'ospf', null, 2, 5, 'original', 'proposed', array['ospf', 'configurazione', 'passive-interface']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('2285243a-cf60-5402-ac43-bd59eb5f8583', null, 'ospf-troubleshooting', 1, 'troubleshooting', 'it', 'Scenario: due router OSPF non diventano vicini', 'R1 e R2 sono collegati e si raggiungono con il ping, ma `show ip ospf neighbor` è vuoto. Come trovare il parametro che non coincide.', '### Situazione
```
R1# show ip ospf neighbor
R1#
R1# ping 10.0.12.2
!!!!!
```
La connettività IP c''è, l''adiacenza no.

### Verifiche
```
R1# show ip ospf interface gigabitEthernet0/0
  Internet Address 10.0.12.1/30, Area 0
  Process ID 1, Router ID 1.1.1.1, Network Type POINT_TO_POINT, Cost: 1
  Timer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5

R2# show ip ospf interface gigabitEthernet0/0
  Internet Address 10.0.12.2/30, Area 1
  Process ID 1, Router ID 2.2.2.2, Network Type POINT_TO_POINT, Cost: 1
  Timer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5
```
**Area diversa**: R1 in area 0, R2 in area 1. Gli Hello vengono scartati.

### Lista di controllo
| Controllo | Comando |
|---|---|
| OSPF attivo sull''interfaccia? | `show ip ospf interface brief` |
| Interfaccia passiva? | `show ip protocols` (sezione Passive Interface) |
| Area, timer, tipo di rete | `show ip ospf interface` |
| Subnet e mask uguali | `show ip interface brief`, `show running-config interface` |
| Router ID duplicato | `show ip protocols` su entrambi |
| ACL che blocca OSPF (protocollo IP 89) | `show ip interface` |
| Bloccati in EXSTART/EXCHANGE | confrontare l''MTU con `show interfaces` |

Il comando `debug ip ospf hello` mostra il motivo esatto del rifiuto (ad esempio *Mismatched hello parameters*), ma va usato con cautela sui router in produzione.', 'ccna', 'ospf', null, 2, 4, 'hypothetical', 'proposed', array['ospf', 'troubleshooting', 'adiacenza']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('36a14c81-1b3a-5496-b6a4-3538123c71c6', null, 'ospfv3-config', 1, 'config', 'it', 'OSPFv3 per IPv6', 'OSPFv3 si attiva per interfaccia, usa gli indirizzi link-local per scambiarsi i pacchetti e mantiene un Router ID a 32 bit.', '```
R1(config)# ipv6 unicast-routing
R1(config)# ipv6 router ospf 1
R1(config-rtr)# router-id 1.1.1.1
R1(config-rtr)# exit
R1(config)# interface gigabitEthernet0/0
R1(config-if)# ipv6 address 2001:db8:12::1/64
R1(config-if)# ipv6 ospf 1 area 0
R1(config-if)# interface gigabitEthernet0/1
R1(config-if)# ipv6 address 2001:db8:1::1/64
R1(config-if)# ipv6 ospf 1 area 0
```

### Differenze principali rispetto a OSPFv2
- Si attiva **sull''interfaccia** (`ipv6 ospf 1 area 0`); non esiste il comando `network`.
- Funziona **per link** e non per subnet: due router possono diventare vicini anche se i loro indirizzi global sono in prefissi diversi.
- I pacchetti partono dall''indirizzo **link-local** dell''interfaccia; per questo il next hop delle route OSPFv3 è un indirizzo fe80::.
- Il **Router ID** resta a 32 bit: senza indirizzi IPv4 va configurato a mano.
- Multicast: ff02::5 (tutti i router OSPF) e ff02::6 (DR e BDR).

### Verifica
```
R1# show ipv6 ospf neighbor
R1# show ipv6 route ospf
O   2001:db8:3::/64 [110/2]
     via FE80::2, GigabitEthernet0/0
```
I concetti di area, costo, DR/BDR e stati dei vicini sono gli stessi di OSPFv2.', 'ccna', 'ospf', null, 2, 4, 'original', 'proposed', array['ospfv3', 'ipv6', 'ospf']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('1eda16c4-b633-5954-b191-7423f09dffe5', null, 'fhrp-hsrp-vrrp', 1, 'comparison', 'it', 'HSRP e VRRP: un Default Gateway che non cade', 'Due router condividono un indirizzo IP e un MAC address virtuali. Gli host puntano al gateway virtuale; se il router attivo cade, il secondo subentra in pochi secondi.', 'Un host ha un solo Default Gateway. Se quel router si guasta, la LAN resta isolata anche se un secondo router è collegato. Un **FHRP** (First Hop Redundancy Protocol) risolve il problema con un **indirizzo IP virtuale** e un **MAC address virtuale** condivisi tra più router.

| | HSRP | VRRP (v3) |
|---|---|---|
| Standard | Cisco (RFC 2281 informativa) | IETF, RFC 9568 |
| Ruoli | **Active** e **Standby** | **Master** (Active) e **Backup** |
| Priorità di default | 100 | 100; 255 per il proprietario dell''indirizzo |
| Preemption di default | **disattiva** | **attiva** |
| MAC virtuale | 0000.0c07.acXX (HSRPv1, XX = gruppo) | 0000.5e00.01XX (XX = VRID) |
| Multicast | 224.0.0.2 (v1), UDP 1985 | 224.0.0.18 |
| Timer | Hello 3 s, Hold 10 s | Advertisement 1 s |

### Come funziona il failover
1. Il router con priorità più alta diventa Active e risponde agli ARP per l''IP virtuale con il **MAC virtuale**.
2. Gli host continuano a usare lo stesso IP e lo stesso MAC del gateway: non devono aggiornare nulla.
3. Se lo Standby non riceve più Hello per l''intervallo di hold, diventa Active e inizia a rispondere al MAC virtuale; invia un *gratuitous ARP* perché gli switch aggiornino la MAC Address Table.

### Preemption
Senza `preempt`, un router con priorità più alta che torna online **non** riprende il ruolo di Active. In HSRP va configurata esplicitamente se si vuole un ruolo deterministico.

GLBP, un terzo protocollo Cisco, aggiunge il bilanciamento del carico tra più gateway; all''esame CCNA v2.0 l''obiettivo cita HSRP e VRRP.', 'ccna', 'fhrp', null, 2, 5, 'original', 'proposed', array['fhrp', 'hsrp', 'vrrp', 'gateway']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('20c22bf3-b697-5fdf-ab9c-acc284c00eed', null, 'hsrp-show-standby', 1, 'output_analysis', 'it', 'Interpretare `show standby brief`', 'Lo stato HSRP di ogni router in una riga: gruppo, priorità, preemption, ruolo, indirizzo del router attivo, dello standby e IP virtuale.', '```
R1# show standby brief
                     P indicates configured to preempt.
                     |
Interface   Grp  Pri P State   Active          Standby         Virtual IP
Gi0/1       10   110 P Active  local           192.168.10.3    192.168.10.1

R2# show standby brief
Interface   Grp  Pri P State   Active          Standby         Virtual IP
Gi0/1       10   100   Standby 192.168.10.2    local           192.168.10.1
```

| Colonna | R1 | Significato |
|---|---|---|
| Grp | 10 | Numero del gruppo HSRP (deve coincidere sui due router) |
| Pri | 110 | Priorità; vince la più alta |
| P | P | Preemption configurata |
| State | Active | Ruolo attuale |
| Active / Standby | local / .3 | Chi ha i due ruoli; `local` = questo router |
| Virtual IP | .1 | L''indirizzo da usare come Default Gateway degli host |

### Configurazione che produce questo output
```
R1(config)# interface gigabitEthernet0/1
R1(config-if)# ip address 192.168.10.2 255.255.255.0
R1(config-if)# standby version 2
R1(config-if)# standby 10 ip 192.168.10.1
R1(config-if)# standby 10 priority 110
R1(config-if)# standby 10 preempt
```

### Segnali di problemi
- Entrambi i router **Active**: non si vedono gli Hello (VLAN diversa, ACL, gruppo diverso). Si genera un conflitto sull''IP virtuale.
- **Virtual IP** diverso sui due router: configurazione incoerente.
- State **Init** che non cambia: l''interfaccia è down o la configurazione del gruppo è incompleta. **Listen** è invece normale per un terzo router del gruppo, che non è né Active né Standby.', 'ccna', 'fhrp', null, 2, 3, 'original', 'proposed', array['hsrp', 'output', 'show-standby']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152', null, 'nat-terminology', 1, 'lesson', 'it', 'NAT: inside local, inside global e le altre tre parole da non confondere', 'Il NAT traduce gli indirizzi al confine della rete. Quattro termini descrivono ogni indirizzo dal punto di vista del router: inside o outside, local o global.', 'Il **NAT** (Network Address Translation) modifica l''indirizzo IP di origine o di destinazione dei pacchetti che attraversano un router. L''uso più comune: far uscire su Internet gli host con indirizzi privati RFC 1918 usando un indirizzo pubblico.

### I quattro termini
- **Inside / Outside**: *di chi* è l''indirizzo. Inside = un host della nostra rete; outside = un host esterno.
- **Local / Global**: *da dove* lo si guarda. Local = come appare dentro la rete; global = come appare all''esterno.

| Termine | Esempio | Significato |
|---|---|---|
| **Inside local** | 192.168.1.10 | L''indirizzo reale del PC interno |
| **Inside global** | 203.0.113.5 | L''indirizzo con cui il PC appare su Internet |
| **Outside global** | 198.51.100.20 | L''indirizzo reale del server esterno |
| **Outside local** | 198.51.100.20 | Come il server appare dall''interno; di solito uguale all''outside global |

### Tipi di NAT
- **NAT statico**: una corrispondenza fissa 1:1 tra inside local e inside global. Serve per rendere raggiungibile da Internet un server interno.
- **NAT dinamico**: gli indirizzi interni ricevono un indirizzo libero da un **pool** di indirizzi pubblici. 1:1, ma temporaneo; se il pool è esaurito, i nuovi host non escono.
- **PAT** (NAT *overload*): molti host condividono **un solo** indirizzo pubblico. Il router distingue le connessioni tramite le **porte** di trasporto. La RFC 3022 lo chiama **NAPT**.

Il NAT non è una funzione di sicurezza: nasconde gli indirizzi interni, ma il filtraggio va fatto con ACL o firewall.', 'ccna', 'nat', null, 1, 4, 'original', 'proposed', array['nat', 'pat', 'terminologia']::text[], '[{"id":"pat-translation"}]'::jsonb, '2026-11-27', '2026-11-27'),
  ('8eef167f-6d28-54d1-9e17-8bf5908d06b3', null, 'nat-config', 1, 'config', 'it', 'Configurare NAT statico, dinamico e PAT su IOS XE', 'Si indicano le interfacce inside e outside, poi la regola di traduzione: static per un server, pool per il NAT dinamico, overload per il PAT.', '### 1. Interfacce
```
R1(config)# interface gigabitEthernet0/0/1
R1(config-if)# ip nat inside
R1(config-if)# interface gigabitEthernet0/0/0
R1(config-if)# ip nat outside
```

### 2a. NAT statico (server pubblicato)
```
R1(config)# ip nat inside source static 192.168.1.100 203.0.113.10
```

### 2b. NAT dinamico con pool
```
R1(config)# access-list 1 permit 192.168.1.0 0.0.0.255
R1(config)# ip nat pool PUBBLICI 203.0.113.20 203.0.113.30 netmask 255.255.255.0
R1(config)# ip nat inside source list 1 pool PUBBLICI
```
L''ACL non filtra traffico: **seleziona** gli indirizzi da tradurre.

### 2c. PAT sull''indirizzo dell''interfaccia
```
R1(config)# access-list 1 permit 192.168.1.0 0.0.0.255
R1(config)# ip nat inside source list 1 interface gigabitEthernet0/0/0 overload
```
È la configurazione tipica di una piccola sede con un solo indirizzo pubblico assegnato dall''ISP. `overload` si può usare anche con un pool.

### Verifica
```
R1# show ip nat translations
Pro  Inside global       Inside local        Outside local       Outside global
tcp  203.0.113.5:51000   192.168.1.10:51000  198.51.100.20:443   198.51.100.20:443
---  203.0.113.10        192.168.1.100       ---                 ---
R1# show ip nat statistics
R1# clear ip nat translation *
```
Le traduzioni statiche compaiono sempre; quelle dinamiche solo mentre c''è traffico e scadono dopo un timeout.', 'ccna', 'nat', null, 2, 4, 'original', 'proposed', array['nat', 'pat', 'configurazione']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('0a475bf0-007c-5558-b4e1-4879f1557116', null, 'nat-troubleshooting', 1, 'troubleshooting', 'it', 'Scenario: gli utenti non escono su Internet dopo la modifica al NAT', 'La configurazione PAT sembra corretta ma `show ip nat translations` è vuoto. Tre errori tipici: inside e outside invertiti, ACL sbagliata, route mancante.', '### Situazione
```
R1# show running-config | include nat
 ip nat outside            ! su Gi0/0/1, verso la LAN
 ip nat inside             ! su Gi0/0/0, verso l''ISP
ip nat inside source list 1 interface GigabitEthernet0/0/0 overload
R1# show access-lists 1
Standard IP access list 1
    10 permit 192.168.10.0, wildcard bits 0.0.0.255
```
La LAN è 192.168.1.0/24. `show ip nat translations` è vuoto.

### Due errori
1. **Inside e outside invertiti**: la LAN è marcata come outside. Il router traduce solo i pacchetti che entrano da un''interfaccia inside e escono da una outside.
2. **ACL che non corrisponde**: permette 192.168.10.0/24, mentre gli host sono in 192.168.1.0/24. Nessun pacchetto viene selezionato.

### Correzione
```
R1(config)# interface gigabitEthernet0/0/1
R1(config-if)# no ip nat outside
R1(config-if)# ip nat inside
R1(config-if)# interface gigabitEthernet0/0/0
R1(config-if)# no ip nat inside
R1(config-if)# ip nat outside
R1(config)# no access-list 1
R1(config)# access-list 1 permit 192.168.1.0 0.0.0.255
```

### Altri controlli
- **Default route** verso l''ISP presente: senza, il pacchetto non viene instradato e la traduzione non avviene.
- **Pool esaurito** nel NAT dinamico senza overload: `show ip nat statistics` mostra i *misses*.
- `debug ip nat` mostra in tempo reale le traduzioni.', 'ccna', 'nat', null, 2, 4, 'hypothetical', 'proposed', array['nat', 'troubleshooting']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('8035bedc-7639-5358-a7ce-bf2dd7c6f984', null, 'dhcp-relay-ios', 1, 'config', 'it', 'DHCP su IOS: server, esclusioni e relay con ip helper-address', 'Un router può fare da server DHCP per più VLAN. Se il server è in un''altra subnet, il router della VLAN inoltra le richieste in unicast con ip helper-address.', '### Router come server DHCP
```
R1(config)# ip dhcp excluded-address 192.168.10.1 192.168.10.10
R1(config)# ip dhcp pool VLAN10
R1(dhcp-config)# network 192.168.10.0 255.255.255.0
R1(dhcp-config)# default-router 192.168.10.1
R1(dhcp-config)# dns-server 192.168.100.53
R1(dhcp-config)# domain-name azienda.local
R1(dhcp-config)# lease 1
```
Le **esclusioni** si configurano fuori dal pool e proteggono gli indirizzi statici (gateway, stampanti, server).

### DHCP relay
Il **DHCP Discover** è un broadcast: non attraversa il router. Se il server DHCP si trova in un''altra subnet, l''interfaccia del router che riceve il broadcast lo inoltra **in unicast** al server:
```
R1(config)# interface gigabitEthernet0/0.10
R1(config-subif)# ip helper-address 192.168.100.20
```
Il relay inserisce nel campo **giaddr** l''indirizzo dell''interfaccia che ha ricevuto la richiesta: il server usa quel valore per scegliere lo scope corretto.

### Router come client DHCP
```
R1(config)# interface gigabitEthernet0/0/0
R1(config-if)# ip address dhcp
```
Tipico verso l''ISP.

### Verifica
```
R1# show ip dhcp binding
R1# show ip dhcp pool
R1# show ip dhcp conflict
```', 'ccna', 'dhcp', null, 2, 4, 'original', 'proposed', array['dhcp', 'relay', 'helper-address']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('075a52d9-9c2d-54d8-8c6a-dd50e28243c6', null, 'dhcp-troubleshooting', 1, 'troubleshooting', 'it', 'Scenario: i client della nuova VLAN ricevono un indirizzo 169.254.x.x', 'Un indirizzo APIPA significa che il client non ha ricevuto risposta DHCP. Si segue il percorso del Discover dal client al server.', '### Situazione
È stata creata la VLAN 30 con SVI 192.168.30.1 su SW-CORE. I PC della VLAN 30 mostrano 169.254.12.7/16. Il server DHCP centrale è 10.0.100.20 e serve correttamente le altre VLAN.

### Percorso da verificare
1. **Livello 2**: la porta del PC è nella VLAN 30? La VLAN 30 è consentita sui trunk fino a SW-CORE?
   `show interfaces gi1/0/7 switchport`, `show interfaces trunk`
2. **SVI**: `interface vlan 30` è up/up?
3. **Relay**: sulla SVI c''è `ip helper-address 10.0.100.20`? Spesso è la riga dimenticata quando si crea una VLAN.
4. **Server**: esiste uno scope per 192.168.30.0/24? Il server ha una route di ritorno verso 192.168.30.1?
5. **DHCP snooping**: se attivo, la porta verso il server o l''uplink è **trusted**? Su una porta untrusted le risposte del server vengono scartate.
6. **Pool esaurito**: `show ip dhcp pool` (se il server è un router IOS).

### In questo caso
```
SW-CORE# show running-config interface vlan 30
interface Vlan30
 ip address 192.168.30.1 255.255.255.0
```
Manca il relay:
```
SW-CORE(config)# interface vlan 30
SW-CORE(config-if)# ip helper-address 10.0.100.20
```
Poi sul client: `ipconfig /release` e `ipconfig /renew`.', 'ccna', 'dhcp', null, 2, 4, 'hypothetical', 'proposed', array['dhcp', 'troubleshooting', 'apipa']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('3aa005c1-b264-58dc-86d1-bd787e242596', null, 'dns-troubleshooting', 1, 'troubleshooting', 'it', 'Diagnosticare i record DNS: A, AAAA, CNAME, MX, NS, PTR', 'Il sito risponde per IP ma non per nome, la posta non arriva, il traceroute mostra nomi sbagliati: ogni sintomo punta a un tipo di record diverso.', '| Sintomo | Record da controllare | Esempio di verifica |
|---|---|---|
| `www.esempio.it` non si apre, l''IP sì | **A** (IPv4) o **AAAA** (IPv6) | `nslookup www.esempio.it` |
| Funziona in IPv4 ma i client IPv6 non arrivano | **AAAA** errato o che punta a un server senza IPv6 attivo | `nslookup -type=AAAA www.esempio.it` |
| Un alias porta al server sbagliato | **CNAME** che punta a un nome non aggiornato | `nslookup -type=CNAME shop.esempio.it` |
| La posta in arrivo non viene consegnata | **MX** (con la sua priorità) e il record A del server indicato | `nslookup -type=MX esempio.it` |
| Le modifiche non si propagano o il dominio non risolve | **NS**: i server autoritativi delegati | `nslookup -type=NS esempio.it` |
| Log e traceroute mostrano nomi errati per gli IP | **PTR** nella zona inversa | `nslookup 203.0.113.10` |

### Da ricordare
- Un CNAME punta a un **nome**, mai a un indirizzo; l''MX punta a un nome che deve avere un record A/AAAA.
- I resolver conservano le risposte per il **TTL** del record: dopo una modifica, alcuni client vedono ancora il valore vecchio. `ipconfig /flushdns` svuota la cache del client Windows.
- Prima di dare la colpa al DNS si verifica che l''host abbia un **server DNS** configurato e raggiungibile (`ipconfig /all`).

### Su IOS
```
R1(config)# ip name-server 192.168.100.53
R1(config)# ip domain lookup
R1(config)# ip host SW1 192.168.99.11      ! voce statica locale
```
Il router può anche fare da server DNS semplice con `ip dns server`.', 'ccna', 'dns', null, 2, 4, 'original', 'proposed', array['dns', 'troubleshooting', 'record']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('78a39a80-291a-5670-b8ca-b8f8f73f1d89', null, 'acl-standard-extended', 1, 'lesson', 'it', 'ACL standard ed estese: cosa confrontano e dove applicarle', 'Le ACL standard guardano solo l''indirizzo di origine; le estese anche destinazione, protocollo e porte. Le regole si leggono dall''alto e finiscono con un deny implicito.', 'Una **Access Control List** è un elenco ordinato di regole (ACE) *permit* o *deny*. Applicata a un''interfaccia in una direzione (`in` o `out`), filtra i pacchetti.

### Come viene valutata
1. Le regole si leggono **dall''alto verso il basso**.
2. Alla **prima corrispondenza** il router applica l''azione e smette di leggere.
3. Se nessuna regola corrisponde, il pacchetto viene scartato: alla fine di ogni ACL c''è un **deny implicito**.

Un''ACL con solo regole deny blocca quindi **tutto**. Serve almeno un permit.

### Standard ed estese
| | Standard | Estesa |
|---|---|---|
| Confronta | solo IP di **origine** | origine, **destinazione**, protocollo, porte |
| Numeri | 1–99, 1300–1999 | 100–199, 2000–2699 |
| Dove applicarla | **vicino alla destinazione** | **vicino all''origine** |

### Perché il posizionamento
- Una **standard** non conosce la destinazione: messa vicino all''origine bloccherebbe quell''host verso *tutte* le reti.
- Un''**estesa** descrive con precisione il traffico: vicino all''origine il pacchetto indesiderato viene scartato subito, senza consumare banda nel resto della rete.

### Una ACL per interfaccia, direzione e protocollo
Su ogni interfaccia si può applicare al massimo un''ACL IPv4 in ingresso e una in uscita. Una nuova `ip access-group` sostituisce quella precedente.', 'ccna', 'acl', null, 1, 4, 'original', 'proposed', array['acl', 'sicurezza', 'filtraggio']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('8109621d-9488-5492-9efa-13b66f3015f3', null, 'acl-wildcard', 1, 'recall', 'it', 'Wildcard mask: esercizi di calcolo', 'Nella wildcard mask il bit 0 significa "deve corrispondere", il bit 1 "ignora". Per una subnet si calcola come 255.255.255.255 meno la Subnet Mask.', '- **0** = il bit deve coincidere; **1** = il bit può essere qualsiasi.
- Per una subnet: wildcard = 255.255.255.255 − Subnet Mask. Per /24 → 0.0.0.255; per /26 → 0.0.0.63.
- Abbreviazioni: `host 10.1.1.1` = 10.1.1.1 0.0.0.0; `any` = 0.0.0.0 255.255.255.255.', 'ccna', 'acl', null, 2, 3, 'original', 'proposed', array['acl', 'wildcard', 'esercizi']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('b77ab9ed-dd5c-5582-8f93-f52885da90e1', null, 'acl-config', 1, 'config', 'it', 'Scrivere e applicare un''ACL estesa named', 'Un esempio completo: consentire il web verso un server, bloccare il resto del traffico da una VLAN, e modificare l''ACL senza riscriverla.', '### Obiettivo
La VLAN Ospiti (192.168.50.0/24) può raggiungere il server web interno 10.10.10.80 solo su HTTPS, può navigare su Internet e non deve raggiungere altre reti interne (10.0.0.0/8).

```
R1(config)# ip access-list extended OSPITI-IN
R1(config-ext-nacl)# 10 permit tcp 192.168.50.0 0.0.0.255 host 10.10.10.80 eq 443
R1(config-ext-nacl)# 20 permit udp 192.168.50.0 0.0.0.255 host 10.10.10.53 eq 53
R1(config-ext-nacl)# 30 deny ip 192.168.50.0 0.0.0.255 10.0.0.0 0.255.255.255
R1(config-ext-nacl)# 40 permit ip 192.168.50.0 0.0.0.255 any
R1(config-ext-nacl)# exit
R1(config)# interface gigabitEthernet0/0.50
R1(config-subif)# ip access-group OSPITI-IN in
```
- La regola 20 consente il DNS interno, necessario per risolvere i nomi.
- L''ordine conta: il permit verso il server (10) deve precedere il deny verso 10.0.0.0/8 (30).
- Applicata **in ingresso** sulla sotto-interfaccia degli ospiti, cioè vicino all''origine.

### Modificare una ACL named
I numeri di sequenza permettono di inserire o togliere singole righe:
```
R1(config)# ip access-list extended OSPITI-IN
R1(config-ext-nacl)# 15 permit icmp 192.168.50.0 0.0.0.255 host 10.10.10.80 echo
R1(config-ext-nacl)# no 20
```

### Verifica
```
R1# show access-lists OSPITI-IN
Extended IP access list OSPITI-IN
    10 permit tcp 192.168.50.0 0.0.0.255 host 10.10.10.80 eq 443 (152 matches)
    ...
R1# show ip interface gigabitEthernet0/0.50 | include access list
```
I contatori *matches* mostrano quali regole vengono usate; una regola con zero corrispondenze dopo molto tempo è da rivedere.', 'ccna', 'acl', null, 2, 5, 'hypothetical', 'proposed', array['acl', 'named-acl', 'configurazione']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('5d131b49-d63b-56b3-ad08-34a0dbac9926', null, 'port-security', 1, 'config', 'it', 'Port Security: limitare i MAC address su una porta', 'Port Security limita quanti e quali MAC address possono usare una porta. Tre modalità di violazione: protect, restrict e shutdown, quella di default.', '**Port Security** controlla i MAC address di origine dei frame ricevuti su una porta. Si configura solo su porte **access** o **trunk statiche**, non su porte in modalità dinamica.

```
SW1(config)# interface gigabitEthernet1/0/10
SW1(config-if)# switchport mode access
SW1(config-if)# switchport port-security
SW1(config-if)# switchport port-security maximum 2
SW1(config-if)# switchport port-security mac-address sticky
SW1(config-if)# switchport port-security violation restrict
```
- **Massimo di default: 1** MAC address.
- `mac-address sticky`: i MAC appresi dinamicamente vengono aggiunti alla **running-config**. Restano dopo un riavvio solo se si salva la configurazione.

### Modalità di violazione
| Modalità | Scarta i frame non autorizzati | Log/SNMP | Contatore violazioni | Porta |
|---|---|---|---|---|
| **protect** | sì | no | no | resta attiva |
| **restrict** | sì | sì | sì | resta attiva |
| **shutdown** (default) | sì | sì | sì | **err-disabled** |

Esiste anche `shutdown vlan`, che disattiva solo la VLAN interessata sulla porta.

### Verifica e ripristino
```
SW1# show port-security interface gigabitEthernet1/0/10
SW1# show port-security address
SW1(config-if)# shutdown
SW1(config-if)# no shutdown
```
Con `errdisable recovery cause psecure-violation` il ripristino diventa automatico.

### Uso tipico
Una porta in sala riunioni con `maximum 2` (telefono IP + PC) impedisce di collegare uno switch con molti dispositivi. Port Security limita anche gli attacchi di **MAC flooding**, che cercano di riempire la MAC Address Table.', 'ccna', 'layer2-security', null, 2, 4, 'original', 'proposed', array['port-security', 'sicurezza', 'err-disabled']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728', null, 'dhcp-snooping', 1, 'lesson', 'it', 'DHCP snooping: fermare i server DHCP non autorizzati', 'Lo switch distingue porte trusted e untrusted. Sulle untrusted scarta i messaggi da server DHCP e costruisce una tabella di binding usata anche da DAI.', 'Un server DHCP non autorizzato, anche solo un router domestico collegato per errore, può assegnare agli host un **Default Gateway falso**: il traffico passa da lui (*man-in-the-middle*) o non esce affatto.

### Come funziona
- Ogni porta è **untrusted** per default. Si configurano come **trusted** solo le porte verso il vero server DHCP e gli uplink verso il resto della rete.
- Su una porta untrusted lo switch **scarta i messaggi da server** (DHCPOFFER, DHCPACK, DHCPNAK).
- Per i messaggi dei client lo switch verifica anche che il MAC address di origine coincida con il campo client MAC del messaggio DHCP.
- Dalle risposte ACK lo switch costruisce la **binding table**: MAC, IP, VLAN, porta e lease di ogni client.

### Configurazione
```
SW1(config)# ip dhcp snooping
SW1(config)# ip dhcp snooping vlan 10,20
SW1(config)# interface gigabitEthernet1/0/48
SW1(config-if)# ip dhcp snooping trust
SW1(config)# interface range gigabitEthernet1/0/1 - 24
SW1(config-if-range)# ip dhcp snooping limit rate 10
```
DHCP snooping è **disattivato per default** e va abilitato sia globalmente sia per VLAN.

### Option 82
Con snooping attivo lo switch inserisce per default l''**opzione 82** (informazioni sull''agente relay) nelle richieste. Se il server o un relay a monte non la accettano da uno switch di accesso, i client non ottengono indirizzi: in quel caso si disattiva con `no ip dhcp snooping information option`.

### Verifica
```
SW1# show ip dhcp snooping
SW1# show ip dhcp snooping binding
```', 'ccna', 'layer2-security', null, 2, 4, 'original', 'proposed', array['dhcp-snooping', 'sicurezza', 'rogue-dhcp']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('35bedb68-10ff-55ac-b2a6-9c958cbca79e', null, 'dynamic-arp-inspection', 1, 'lesson', 'it', 'Dynamic ARP Inspection contro l''ARP spoofing', 'DAI controlla i messaggi ARP ricevuti sulle porte untrusted e li confronta con la binding table di DHCP snooping. Un ARP che non corrisponde viene scartato.', 'L''**ARP spoofing** (o *ARP poisoning*) sfrutta il fatto che ARP non ha autenticazione: un attaccante invia ARP Reply non richiesti dicendo "l''IP del gateway è il mio MAC". Gli host aggiornano la cache ARP e inviano il traffico all''attaccante.

### Come funziona DAI
- Come per DHCP snooping, le porte sono **untrusted per default**.
- Su una porta untrusted, ogni messaggio ARP viene confrontato con la **binding table di DHCP snooping**: la coppia IP–MAC dichiarata deve corrispondere a un binding valido su quella VLAN e quella porta.
- Gli ARP non validi vengono **scartati** e registrati.
- Sulle porte trusted (uplink, router) non si fa alcun controllo.

### Configurazione
```
SW1(config)# ip arp inspection vlan 10,20
SW1(config)# interface gigabitEthernet1/0/48
SW1(config-if)# ip arp inspection trust
```
Prerequisito: **DHCP snooping attivo** sulle stesse VLAN. Gli host con IP statico non hanno un binding: servono **ARP ACL** dedicate, altrimenti i loro ARP vengono scartati.

### Rate limit
Sulle porte untrusted DAI limita per default gli ARP a **15 pacchetti al secondo**. Se il limite viene superato, la porta va in **err-disabled**.
```
SW1(config-if)# ip arp inspection limit rate 25
```

### Verifiche facoltative
`ip arp inspection validate src-mac dst-mac ip` aggiunge controlli di coerenza tra header Ethernet e contenuto ARP.', 'ccna', 'layer2-security', null, 3, 4, 'original', 'proposed', array['dai', 'arp-spoofing', 'sicurezza']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('93d8fe55-e868-50cd-bf37-c2edeafdcb47', null, 'ra-guard-storm-control', 1, 'comparison', 'it', 'Storm control e RA Guard', 'Storm control limita il volume di broadcast, multicast o unicast su una porta. RA Guard blocca i Router Advertisement IPv6 che arrivano da porte non autorizzate.', '| | Storm control | RA Guard |
|---|---|---|
| Protegge da | tempeste di traffico (loop, schede guaste, attacchi) | falsi router IPv6 che annunciano prefissi e gateway |
| Cosa osserva | il volume di traffico broadcast, multicast o unicast in ingresso | i messaggi ICMPv6 Router Advertisement |
| Azione | scarta il traffico oltre la soglia; facoltativamente `shutdown` o trap | scarta gli RA sulle porte dove non è previsto un router |

### Storm control
La soglia si esprime in percentuale della banda, bit/s o pacchetti/s, per ciascun tipo di traffico:
```
SW1(config)# interface gigabitEthernet1/0/10
SW1(config-if)# storm-control broadcast level 5.00 3.00
SW1(config-if)# storm-control action trap
```
Con due valori (5.00 e 3.00) si indicano la soglia di blocco e quella di ripristino. È una difesa in più contro gli effetti di un loop di livello 2, non un sostituto dello Spanning Tree.

### RA Guard
Con SLAAC gli host accettano gli RA e configurano prefisso e Default Gateway. Un dispositivo che invia RA falsi può dirottare il traffico IPv6, anche in una rete che "non usa IPv6", perché gli host moderni hanno IPv6 attivo per default. RA Guard (RFC 6105) filtra gli RA nello switch, consentendoli solo sulle porte verso i router legittimi.
```
SW1(config)# ipv6 nd raguard policy HOST
SW1(config-nd-raguard)# device-role host
SW1(config)# interface range gigabitEthernet1/0/1 - 24
SW1(config-if-range)# ipv6 nd raguard attach-policy HOST
```', 'ccna', 'layer2-security', null, 3, 4, 'original', 'proposed', array['storm-control', 'ra-guard', 'ipv6', 'sicurezza']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('816c4e9d-4e7c-5254-9f18-bfcc030d5095', null, 'ssh-config', 1, 'config', 'it', 'Accesso SSH a un dispositivo Cisco', 'Hostname, dominio, chiavi RSA, utente locale e linee VTY limitate a SSH: i passi per sostituire Telnet, che trasmette tutto in chiaro.', '**Telnet** (TCP 23) invia username, password e comandi **in chiaro**. **SSH** (TCP **22**) cifra la sessione. Sui dispositivi di rete si usa solo SSH, preferibilmente versione 2.

```
SW1(config)# hostname SW1
SW1(config)# ip domain name azienda.local
SW1(config)# crypto key generate rsa modulus 2048
SW1(config)# ip ssh version 2
SW1(config)# username admin privilege 15 secret Pa55-di-esempio
SW1(config)# enable secret Altra-pa55-di-esempio
SW1(config)# line vty 0 15
SW1(config-line)# login local
SW1(config-line)# transport input ssh
SW1(config-line)# exec-timeout 10 0
SW1(config-line)# access-class GESTIONE in
```

### Perché ogni riga
- **hostname** e **ip domain name** servono a generare le chiavi: il nome della chiave è `hostname.dominio`.
- **crypto key generate rsa** crea la coppia di chiavi; con modulus 768 o superiore si può usare SSHv2.
- **username … secret** salva la password con un hash; `password` invece la lascia in chiaro (o con la debole cifratura tipo 7).
- **login local** usa il database degli utenti locali.
- **transport input ssh** rifiuta Telnet sulle linee VTY.
- **access-class** applica un''ACL standard alle linee VTY: solo la rete di gestione può collegarsi.

### Verifica
```
SW1# show ip ssh
SW1# show ssh
```
Su uno switch di livello 2 serve anche un indirizzo di gestione (SVI) e un `ip default-gateway` per essere raggiungibile da altre subnet.', 'ccna', 'device-access', null, 1, 4, 'original', 'proposed', array['ssh', 'sicurezza', 'vty']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('13c2c721-2ea4-5ed4-91af-3d9f30800af5', null, 'aaa-tacacs-radius', 1, 'comparison', 'it', 'AAA con TACACS+ e RADIUS', 'Autenticazione, autorizzazione e accounting centralizzati: TACACS+ separa le tre funzioni e cifra tutto il pacchetto; RADIUS le combina e protegge solo la password.', 'Con molti dispositivi, gestire utenti locali su ognuno diventa ingestibile. **AAA** centralizza:
- **Authentication**: chi sei (username, password, certificato);
- **Authorization**: cosa puoi fare (livello di privilegio, comandi consentiti);
- **Accounting**: cosa hai fatto (registro di accessi e comandi).

Il router o lo switch è il **client AAA**; il server (ad esempio Cisco ISE) verifica le credenziali.

| | TACACS+ | RADIUS |
|---|---|---|
| Trasporto | **TCP 49** | **UDP 1812** (autenticazione), 1813 (accounting) |
| Funzioni AAA | **separate** | autenticazione e autorizzazione **combinate** |
| Protezione | **tutto il corpo** del pacchetto offuscato | protetta solo la **password** |
| Uso tipico | amministrazione dei dispositivi, autorizzazione comando per comando | accesso utenti alla rete: 802.1X, Wi-Fi, VPN |
| Origine | Cisco, oggi descritto in RFC 8907 | standard IETF, RFC 2865 |

### Configurazione di base (client TACACS+)
```
R1(config)# aaa new-model
R1(config)# tacacs server ISE1
R1(config-server-tacacs)# address ipv4 10.0.100.10
R1(config-server-tacacs)# key Chiave-condivisa-di-esempio
R1(config)# aaa authentication login default group tacacs+ local
R1(config)# aaa authorization exec default group tacacs+ local
R1(config)# aaa accounting commands 15 default start-stop group tacacs+
```
La parola chiave `local` in fondo è il **fallback**: se il server non risponde, si entra con gli utenti locali. Senza, un guasto del server AAA può chiudere fuori gli amministratori.', 'ccna', 'device-access', null, 2, 4, 'original', 'proposed', array['aaa', 'tacacs', 'radius', 'sicurezza']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('dc8482bb-6869-5202-909a-8de3b9530442', null, 'secure-file-transfer', 1, 'lesson', 'it', 'Trasferire configurazioni e immagini IOS in modo sicuro', 'TFTP e FTP trasmettono i file senza cifratura. SCP e SFTP viaggiano dentro SSH: si usano per backup di configurazione e aggiornamenti software.', '| Protocollo | Trasporto | Autenticazione | Cifratura |
|---|---|---|---|
| TFTP | UDP 69 | nessuna | no |
| FTP | TCP 20/21 | username e password in chiaro | no |
| **SCP** | dentro SSH (TCP 22) | utente SSH | sì |
| **SFTP** | dentro SSH (TCP 22) | utente SSH | sì |

Una configurazione contiene hash di password, chiavi condivise di AAA e VPN, community SNMP: trasferirla in chiaro espone tutto.

### Backup della configurazione con SCP
```
R1# copy running-config scp://admin@10.0.100.50/backup/R1.cfg
```

### Aggiornare l''immagine IOS
```
R1# show flash:
R1# copy scp://admin@10.0.100.50/images/nuova-immagine.bin flash:
R1# verify /md5 flash:nuova-immagine.bin
R1(config)# boot system flash:nuova-immagine.bin
R1# copy running-config startup-config
R1# reload
```
Prima di riavviare si controlla che lo spazio in flash sia sufficiente e che l''hash corrisponda a quello pubblicato dal produttore.

### Router come server SCP
```
R1(config)# ip scp server enable
```
Richiede SSH e AAA configurati.', 'ccna', 'device-access', null, 2, 3, 'original', 'proposed', array['scp', 'sftp', 'backup', 'ios']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('09a8d6ec-71af-5c14-bdfe-41242583ef9b', null, 'ipsec-vpn', 1, 'lesson', 'it', 'VPN IPsec: site-to-site, remote access, AH ed ESP', 'IPsec protegge i pacchetti IP con autenticazione e cifratura. In tunnel mode cifra l''intero pacchetto originale e aggiunge un nuovo header: è la base delle VPN site-to-site.', 'Una **VPN** crea un collegamento privato e cifrato attraverso una rete non fidata, tipicamente Internet.

### Tipi di VPN
- **Site-to-site**: due gateway (router o firewall) collegano permanentemente due sedi. Gli host non sanno nulla della VPN: il traffico viene cifrato quando esce dal gateway.
- **Remote access**: un singolo utente con un client software (o TLS nel browser) si collega alla rete aziendale da qualsiasi luogo.

### I protocolli di IPsec
| | AH | ESP |
|---|---|---|
| Integrità e autenticazione | sì | sì |
| **Cifratura** | **no** | **sì** |
| Protocollo IP | 51 | 50 |
| Compatibilità con NAT | no | sì, con NAT-Traversal (UDP 4500) |

In pratica si usa quasi sempre **ESP**. Le chiavi si negoziano con **IKE** (oggi IKEv2), che usa UDP 500.

### Transport e tunnel mode
- **Transport mode**: protegge il **payload**; l''header IP originale resta. Usato tra due host.
- **Tunnel mode**: protegge **l''intero pacchetto originale** e aggiunge un **nuovo header IP** con gli indirizzi dei due gateway. Quando un estremo della Security Association è un gateway, si usa il tunnel mode.

### Security Association
Una **SA** è unidirezionale: per una comunicazione bidirezionale servono due SA IPsec, una per verso. Ogni SA definisce algoritmi, chiavi e durata.', 'ccna', 'ipsec-vpn', null, 2, 4, 'original', 'proposed', array['ipsec', 'vpn', 'esp', 'tunnel-mode']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('09324d70-e863-5a05-b891-81d95bd17f1c', null, 'syslog-severity', 1, 'lesson', 'it', 'Syslog: leggere un messaggio e i livelli di severità', 'Ogni messaggio syslog ha facility, severità da 0 a 7 e mnemonico. Configurando un livello si ricevono quel livello e tutti quelli più gravi.', '### Anatomia di un messaggio Cisco
```
*Nov 27 10:15:42.123: %LINEPROTO-5-UPDOWN: Line protocol on Interface GigabitEthernet0/1, changed state to down
```
| Parte | Valore | Significato |
|---|---|---|
| Timestamp | `*Nov 27 10:15:42.123` | l''asterisco indica che l''orologio non è sincronizzato (manca NTP) |
| Facility | `LINEPROTO` | la funzione che genera il messaggio |
| Severità | `5` | Notice |
| Mnemonico | `UPDOWN` | il tipo di evento |
| Testo | `Line protocol on …` | la descrizione |

### Livelli (RFC 5424)
| Livello | Nome | Esempio |
|---|---|---|
| 0 | Emergency | sistema inutilizzabile |
| 1 | Alert | intervento immediato |
| 2 | Critical | condizione critica |
| 3 | Error | errore |
| 4 | Warning | avviso |
| 5 | Notice | evento normale ma significativo (interfaccia up/down) |
| 6 | Informational | informativo |
| 7 | Debug | output di `debug` |

Frase per ricordarli: *Every Awesome Cisco Engineer Will Need Ice cream Daily*.

### Configurare le destinazioni
```
R1(config)# logging host 10.0.100.30
R1(config)# logging trap warnings       ! al server: livelli 0–4
R1(config)# logging buffered 16384 informational
R1(config)# logging console errors
R1(config)# service timestamps log datetime msec
R1(config)# terminal monitor             ! in EXEC: vedere i log in una sessione SSH
```
Un livello include **sé stesso e tutti i livelli più gravi** (numero più basso). Per il server syslog si usano spesso le facility **local0–local7** (valori 16–23), configurabili con `logging facility`.', 'ccna', 'syslog-snmp', null, 1, 4, 'original', 'proposed', array['syslog', 'logging', 'severita']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('54ff5635-fecc-5042-acba-b3c69590f70f', null, 'snmp-fundamentals', 1, 'lesson', 'it', 'SNMP: manager, agent, MIB e i messaggi principali', 'Il manager interroga gli agent sui dispositivi con Get e li modifica con Set; gli agent avvisano il manager con Trap e Inform. SNMPv3 aggiunge autenticazione e cifratura.', '**SNMP** (Simple Network Management Protocol) permette a un sistema di monitoraggio di leggere lo stato dei dispositivi: utilizzo CPU, traffico sulle interfacce, temperatura, stato dei link.

### Componenti
- **Manager** (NMS): il software di monitoraggio.
- **Agent**: il processo SNMP sul router o sullo switch.
- **MIB**: la struttura delle informazioni disponibili. Ogni valore ha un **OID**, un identificativo numerico gerarchico.

### Messaggi (SNMPv2)
| PDU | Direzione | Uso |
|---|---|---|
| **GetRequest** | manager → agent | leggi un valore |
| **GetNextRequest** | manager → agent | leggi il valore successivo nella MIB |
| **GetBulkRequest** | manager → agent | leggi molti valori in una richiesta |
| **SetRequest** | manager → agent | modifica un valore |
| **Response** | agent → manager | risposta alle richieste |
| **SNMPv2-Trap** | agent → manager | notifica di un evento, senza conferma |
| **InformRequest** | agent → manager | notifica con conferma di ricezione |

Le richieste arrivano all''agent su **UDP 161**; trap e inform vanno al manager su **UDP 162**.

### Versioni
| Versione | Sicurezza |
|---|---|
| v1, v2c | **community string** in chiaro (una sorta di password condivisa) |
| **v3** | utenti, **autenticazione** e **cifratura** (livelli noAuthNoPriv, authNoPriv, authPriv) |

```
R1(config)# snmp-server group MONITOR v3 priv
R1(config)# snmp-server user nms MONITOR v3 auth sha Auth-di-esempio priv aes 128 Priv-di-esempio
R1(config)# snmp-server host 10.0.100.40 version 3 priv nms
```
In produzione si usa SNMPv3 con authPriv; le community v2c, se proprio servono, solo in lettura e limitate da ACL.', 'ccna', 'syslog-snmp', null, 2, 4, 'original', 'proposed', array['snmp', 'monitoraggio', 'mib']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('9a4610c6-6a22-5496-916e-9fd15656e371', null, 'network-management-approaches', 1, 'comparison', 'it', 'Gestire la rete: device-based, controller, cloud e automazione', 'Dalla CLI su ogni dispositivo al controller che gestisce centinaia di apparati con policy centrali: differenze, vantaggi e limiti di ciascun approccio.', '| Approccio | Come funziona | Punti di forza | Limiti |
|---|---|---|---|
| **Device-based** | CLI o GUI su ogni dispositivo, uno alla volta | controllo totale, nessuna dipendenza | lento, errori di battitura, configurazioni che divergono |
| **Automazione (es. Ansible)** | script e playbook applicano le stesse modifiche a molti dispositivi | ripetibilità, configurazioni versionate | serve competenza; un errore si propaga ovunque |
| **Controller-based (SDN)** | un controller centrale definisce le policy e programma i dispositivi | visione d''insieme, policy coerenti, API | dipendenza dal controller e dal produttore |
| **Cloud-based** | la console di gestione è un servizio in cloud (es. Meraki) | nessun server da gestire, accesso ovunque | richiede connettività verso il cloud, abbonamento |

### Piani di un dispositivo
- **Data plane**: inoltra il traffico (switching, routing, ACL in hardware).
- **Control plane**: decide come inoltrare (protocolli di routing, STP, ARP).
- **Management plane**: accesso per gestirlo (SSH, SNMP, API).

Nel modello **controller-based** il controller assume gran parte del control plane e della gestione, mentre il data plane resta nei dispositivi.

### Le API del controller
- **Northbound**: verso le applicazioni e gli script degli amministratori, tipicamente **REST** con dati in **JSON**.
- **Southbound**: verso i dispositivi, ad esempio NETCONF, RESTCONF, OpenFlow o la CLI via SSH.

### Intent-based networking
L''amministratore descrive l''**intento** ("gli ospiti accedono solo a Internet") e il controller traduce l''intento in configurazioni su tutti i dispositivi, verificandone l''applicazione.', 'ccna', 'network-automation', null, 2, 4, 'professional', 'proposed', array['sdn', 'controller', 'automazione', 'gestione']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('8840c908-6860-592f-bc95-deff22d874b4', null, 'ansible-ios-command', 1, 'config', 'it', 'Eseguire comandi su IOS con Ansible', 'Ansible si collega ai dispositivi via SSH senza agent e applica playbook YAML. Il modulo ios_command esegue comandi show; per le modifiche si usa ios_config.', '**Ansible** è uno strumento di automazione **agentless**: non richiede software sui dispositivi, si collega via **SSH** ed esegue i task descritti in **playbook YAML**. Il modello è *push*: il nodo di controllo invia le istruzioni.

### Inventario
```ini
[access_switches]
sw1 ansible_host=10.0.99.11
sw2 ansible_host=10.0.99.12

[access_switches:vars]
ansible_network_os=cisco.ios.ios
ansible_connection=ansible.netcommon.network_cli
ansible_user=automazione
```

### Playbook: raccogliere informazioni
```yaml
- name: Verifica versione e interfacce
  hosts: access_switches
  gather_facts: false
  tasks:
    - name: Esegui comandi show
      cisco.ios.ios_command:
        commands:
          - show version
          - show ip interface brief
        wait_for:
          - result[0] contains IOS
      register: output

    - name: Mostra le interfacce
      ansible.builtin.debug:
        var: output.stdout_lines[1]
```
```
$ ansible-playbook -i inventario.ini verifica.yml
```

### Da sapere
- `ios_command` invia comandi e restituisce l''output, ma **non** funziona in modalità di configurazione: per modificare la configurazione si usa `cisco.ios.ios_config` o i moduli specifici per risorsa.
- `wait_for` ripete il comando finché la condizione è vera o scade il tempo; con `match: any` basta una condizione.
- Le credenziali non vanno scritte nel playbook: si usano **Ansible Vault** o variabili d''ambiente.', 'ccna', 'network-automation', null, 2, 4, 'professional', 'proposed', array['ansible', 'automazione', 'yaml']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('c8bde22b-8ea9-56d5-88ac-e862213a5017', null, 'ai-network-operations', 1, 'enterprise', 'it', 'AI nelle operazioni di rete: agenti e prompt efficaci', 'Un sistema di AI agentica pianifica ed esegue passi usando strumenti, sotto controllo umano. Un buon prompt dà contesto, vincoli e formato, e non contiene segreti.', 'Il blueprint CCNA v2.0 chiede di saper descrivere il ruolo dell''**AI agentica** nelle operazioni di rete e di scegliere un **prompt** adatto, considerando l''uso responsabile.

### AI generativa e AI agentica
- **AI generativa**: risponde a una richiesta producendo testo, codice o configurazioni. Non agisce da sola.
- **AI agentica**: riceve un obiettivo, lo scompone in passi e usa **strumenti** (API del controller, comandi show, ticket) per raccoglierne i dati e, se autorizzata, applicare modifiche. Osserva il risultato e decide il passo successivo.

Esempio: "Gli utenti del secondo piano sono lenti". Un agente legge la telemetria, esegue `show interfaces` sugli switch del piano, trova un uplink con CRC in crescita e propone di aprire un ticket per la sostituzione del cavo.

### Uso responsabile
- **Human in the loop**: le azioni che cambiano la rete vanno approvate da una persona, almeno finché l''agente non ha dimostrato affidabilità su un perimetro limitato.
- **Privilegi minimi**: l''agente usa un account con i soli permessi necessari, idealmente in sola lettura.
- **Tracciabilità**: ogni azione registrata nei log.
- **Verifica**: un modello può produrre comandi plausibili ma errati. Si controlla l''output prima di applicarlo, preferibilmente in laboratorio.

### Scegliere un prompt
| Prompt debole | Prompt migliore |
|---|---|
| "Configura OSPF" | "Scrivi la configurazione OSPFv2 single area per un ISR con IOS XE: area 0, Gi0/0/0 verso R2 (10.0.12.1/30, point-to-point), Gi0/0/1 LAN 192.168.1.0/24 passiva, router-id 1.1.1.1. Restituisci solo i comandi e una riga di spiegazione per ognuno." |

Un prompt efficace indica **piattaforma e versione**, **contesto** e **vincoli**, il **formato** atteso e cosa fare in caso di dubbio.

### Cosa non inserire mai
Password, chiavi condivise, community SNMP, configurazioni complete non anonimizzate, indirizzi pubblici e nomi interni, quando il servizio AI è esterno all''azienda. Si sostituiscono con segnaposto.', 'ccna', 'network-automation', null, 2, 5, 'professional', 'proposed', array['ai', 'agentic-ai', 'prompt', 'operazioni']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('ddfdd16f-1d44-53f5-a5cc-35037d614b48', null, 'virtualization-basics', 1, 'lesson', 'it', 'Hypervisor, macchine virtuali e container', 'Un hypervisor esegue più macchine virtuali, ognuna con il proprio sistema operativo. I container condividono il kernel dell''host: sono più leggeri, ma meno isolati.', '### Hypervisor
Il software che crea ed esegue le **macchine virtuali** (VM) assegnando a ciascuna CPU, memoria, disco e interfacce di rete virtuali.
| Tipo | Dove gira | Esempi | Uso |
|---|---|---|---|
| **Tipo 1** (bare metal) | direttamente sull''hardware | VMware ESXi, Microsoft Hyper-V, KVM | data center, server aziendali |
| **Tipo 2** (hosted) | come applicazione su un sistema operativo | VirtualBox, VMware Workstation | laboratori, test sul PC |

### Macchine virtuali e container
| | Macchina virtuale | Container |
|---|---|---|
| Contiene | un sistema operativo completo (guest OS) + applicazioni | applicazione e dipendenze |
| Kernel | proprio | **condiviso** con l''host |
| Avvio | minuti | secondi |
| Isolamento | forte | minore |
| Esempi | VM Windows Server, VM Linux | Docker, gestiti su larga scala da Kubernetes |

### E la rete?
Le VM si collegano a uno **switch virtuale** (vSwitch) all''interno dell''host. Il vSwitch ha porte verso le schede virtuali delle VM e usa le schede fisiche del server come uplink. Per questo la porta dello switch fisico verso un host di virtualizzazione è spesso un **trunk 802.1Q**: le VM appartengono a VLAN diverse.

```
SW1(config)# interface gigabitEthernet1/0/20
SW1(config-if)# description ESXi-01 vmnic0
SW1(config-if)# switchport mode trunk
SW1(config-if)# switchport trunk allowed vlan 10,20,30
SW1(config-if)# spanning-tree portfast trunk
```

### Cloud
Il cloud offre risorse virtualizzate come servizio: **IaaS** (VM e rete), **PaaS** (piattaforma su cui eseguire applicazioni), **SaaS** (applicazione pronta all''uso).', 'ccna', 'virtualization', null, 1, 4, 'professional', 'proposed', array['virtualizzazione', 'hypervisor', 'container', 'cloud']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('55c767e2-841b-5003-b493-023452c32dd8', null, 'wireless-rf-channels', 1, 'lesson', 'it', 'Wi-Fi: bande, canali e caratteristiche RF', '2,4 GHz arriva più lontano ma ha solo tre canali non sovrapposti; 5 e 6 GHz offrono molti più canali e meno interferenze, con una copertura minore.', '### Bande
| | 2,4 GHz | 5 GHz | 6 GHz |
|---|---|---|---|
| Portata | maggiore | minore | minore |
| Penetrazione nei muri | migliore | peggiore | peggiore |
| Canali da 20 MHz non sovrapposti | **3** (1, 6, 11) | molti (circa 20–25, secondo il paese) | molti di più |
| Interferenze | molte: Bluetooth, forni a microonde, reti vicine | meno; alcuni canali richiedono DFS per non disturbare i radar | poche |
| Standard | 802.11b/g/n/ax | 802.11a/n/ac/ax | 802.11ax (Wi-Fi 6E) e successivi |

### Canali
Un canale a 2,4 GHz è largo circa 22 MHz (20 MHz per OFDM), ma i canali sono distanziati di soli 5 MHz: due AP vicini sui canali 1 e 3 si disturbano. Con 1, 6 e 11 non ci sono sovrapposizioni. In 5 GHz si possono unire canali adiacenti (40, 80, 160 MHz) per avere più banda, al prezzo di meno canali disponibili.

### Caratteristiche RF
- **Ampiezza** e **potenza**: si misurano in **dBm**. −30 dBm è un segnale fortissimo, −67 dBm è un valore tipico minimo per la voce, −90 dBm è vicino al rumore. +3 dB = potenza doppia, −3 dB = metà.
- **RSSI**: potenza del segnale ricevuto. **SNR**: differenza tra segnale e rumore; più è alto, meglio è.
- Comportamenti del segnale: **assorbimento** (muri, acqua, persone), **riflessione** (metallo, vetri), **rifrazione**, **diffrazione** attorno agli ostacoli, **scattering** su superfici irregolari.

### Nella progettazione
Si pianificano le celle in modo che gli AP adiacenti usino canali diversi, e si preferiscono 5 e 6 GHz per gli utenti che le supportano.', 'ccna', 'wireless-fundamentals', null, 1, 4, 'professional', 'proposed', array['wireless', 'wi-fi', 'canali', 'rf']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('a1aa299b-b36b-5086-9d1d-53515fdb542c', null, 'wireless-security', 1, 'comparison', 'it', 'Sicurezza Wi-Fi: da WEP a WPA3', 'WEP e WPA sono superati. WPA2 con AES è ancora diffuso; WPA3 sostituisce la PSK con SAE e rende obbligatoria la protezione dei frame di gestione.', '| | WEP | WPA | WPA2 | WPA3 |
|---|---|---|---|---|
| Cifratura | RC4 | TKIP (RC4) | **AES-CCMP** | AES-CCMP / **GCMP** |
| Stato | violato, da non usare | deprecato | ancora diffuso | raccomandato |
| Personal | chiave statica | PSK | PSK | **SAE** |
| Enterprise | — | 802.1X | 802.1X | 802.1X, con modalità a 192 bit |
| Protezione dei frame di gestione (PMF) | no | no | facoltativa | **obbligatoria** |

### Personal ed Enterprise
- **Personal**: tutti usano la stessa passphrase. Semplice, adatto a casa e piccoli uffici. Con WPA2-PSK, chi cattura l''handshake può tentare di indovinare la password offline.
- **Enterprise**: ogni utente si autentica con le proprie credenziali o un certificato tramite **802.1X/EAP**. L''AP (o il controller WLC) fa da autenticatore e inoltra le richieste a un server **RADIUS**. Revocare un utente non richiede di cambiare la password a tutti.

### Cosa migliora WPA3
- **SAE** (Simultaneous Authentication of Equals) sostituisce la PSK: resiste agli attacchi a dizionario offline e garantisce *forward secrecy*.
- **PMF** obbligatoria: impedisce gli attacchi di deautenticazione con frame di gestione falsi.
- **Enhanced Open (OWE)**: cifratura anche sulle reti aperte senza password, come quelle per gli ospiti.', 'ccna', 'wireless-fundamentals', null, 2, 4, 'professional', 'proposed', array['wireless', 'wpa3', '802-1x', 'sicurezza']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27'),
  ('ede7ab03-ea04-5ffd-8865-0c143e3bbffe', null, 'wireless-interference', 1, 'troubleshooting', 'it', 'Scenario: Wi-Fi lento in sala riunioni all''ora di pranzo', 'Segnale forte ma prestazioni pessime in certi orari. Si distinguono interferenze Wi-Fi (co-channel, canale adiacente) e non Wi-Fi.', '### Situazione
In sala riunioni l''RSSI è buono (−55 dBm), ma tra le 12 e le 14 le videochiamate si bloccano. I client sono collegati a 2,4 GHz. Accanto alla sala c''è la cucina con due forni a microonde.

### Ipotesi
1. **Interferenza non Wi-Fi**: i forni a microonde lavorano intorno a 2,45 GHz e disturbano soprattutto i canali alti della banda 2,4 GHz. Il problema compare quando i forni sono accesi, cioè all''ora di pranzo. Anche telefoni cordless, Bluetooth e telecamere wireless possono interferire.
2. **Co-channel interference**: più AP sullo stesso canale si sentono e devono dividersi il tempo di trasmissione. Non è rumore, ma **contesa**: la capacità si riduce.
3. **Adjacent channel interference**: AP vicini su canali sovrapposti (es. 1 e 3) si disturbano come rumore, peggio della co-channel.
4. **Troppi client** sullo stesso AP durante una riunione affollata.

### Come verificare
- Confrontare l''**SNR**, non solo l''RSSI: se il rumore sale nelle ore del problema, l''SNR crolla anche con segnale forte.
- Usare l''analisi dello spettro del controller (o di un analizzatore) per riconoscere le firme di microonde e Bluetooth.
- Verificare il piano dei canali degli AP vicini.

### Soluzioni
- Spostare i client su **5 GHz** o 6 GHz (*band steering*), dove i microonde non interferiscono.
- Rivedere i canali a 2,4 GHz usando solo 1, 6, 11 e ridurre la potenza degli AP per limitare le sovrapposizioni.
- Riposizionare l''AP lontano dalla cucina, se possibile.', 'ccna', 'wireless-fundamentals', null, 2, 4, 'hypothetical', 'proposed', array['wireless', 'interferenze', 'troubleshooting']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27')
on conflict (id) do update set slug = excluded.slug, revision = excluded.revision, kind = excluded.kind, language = excluded.language,
  title = excluded.title, summary = excluded.summary, body = excluded.body, track_id = excluded.track_id, topic_id = excluded.topic_id,
  subtopic = excluded.subtopic, difficulty = excluded.difficulty, reading_minutes = excluded.reading_minutes, provenance = excluded.provenance,
  review_status = excluded.review_status, tags = excluded.tags, diagrams = excluded.diagrams, created_on = excluded.created_on, updated_on = excluded.updated_on;

delete from public.content_objectives where content_id in ('cb0ed29e-3d26-5e98-b360-23fb97c984aa', '680d75cd-a68c-57fa-9c41-1e35f2b23289', 'd5c4cbdd-ac9a-59ad-a954-c10a7b014867', 'dffaabcf-a56e-534d-a38c-842ff9792b6a', '155166f9-ff64-5536-a48a-567fe28dc070', '23525bc3-5cd3-5714-9998-75e73e7587e9', '9a88255c-bfdb-5e9b-aba4-affc0270c6d4', '0eff06c7-01d8-5299-be8d-34de078f7b8b', '3305bbc1-e089-51b2-9c84-a7425949b96b', '00702e75-7c76-53b2-ae62-8e735e8d9c77', '33c79380-e583-5727-aff9-910497dbc6f0', 'a483047e-e685-5e1c-964f-c2de0a4c7c49', '191e7924-adde-5d9e-b1b2-21480459a5ca', 'bc911fd7-e523-599f-a19d-54fd2993b410', 'd382335d-a200-525f-9120-15334aa1f322', 'a91010c7-1bb6-535b-9004-7f3fb7668ba1', '85454276-0723-52d6-ba26-7a94ef15aa46', 'd0939326-daf8-5b17-882a-38d4ab290ae2', '515d68b9-e263-5df9-882c-a1571f1073fa', '6ea16f93-12c0-5293-bdbe-5f63f369fdac', 'cf331cd3-a550-5c6b-ae59-f8151d3b9355', '078e5817-97ec-5f15-bf73-e040a7fdce7d', '5e78a1cc-d447-5987-a2c0-cff10b2c1045', '19ad7725-4602-5b20-862c-1896f50516d3', 'c929301e-ecaa-5e4a-a3a3-0cfcf6281c77', 'fb919662-a463-51e1-9f1b-94eb611d0f49', '7c9d8143-ee1d-56f4-8dc2-4aeb1f3cb2b4', 'b4a7a38b-659c-5422-aaa3-119c4cd6b869', '31312177-9638-5483-a52d-1a553a958a4c', '280aaced-4d95-556f-bba5-2bc86aa823da', 'be098602-8939-5896-a525-c8867527e7f4', 'df479dab-854b-573d-8554-235c4540221e', '1fb6663f-73a9-532b-abd4-35a041912ab3', 'cf69d04d-1dea-5c58-9cb8-7013ba67e62a', '45145bca-b4dc-5d0e-b561-8c03cd24610b', '67333b75-0bae-57d6-a48a-f3bd5d318acb', '588fd3db-064d-5429-90a1-2d39a6655df7', '436e1cfb-339e-5ee1-90a7-84862b868b60', '4cacfc2d-a645-50f3-ba69-3839736094ad', 'e56facf2-5546-5db7-827c-942260ba899c', 'db8f5d45-4567-5c1b-8ae5-dc20be849810', 'c17b1b9a-ade1-5193-b29d-e48c69ccacb8', '36633e1d-bddc-577d-bee3-e180a53eeb5c', 'f6757f1b-c0d8-5625-90d7-2240591736d1', 'ffd406f8-fd0d-5c61-b6c0-5221d55a6b62', '14ffc845-1de0-537d-85fd-b10a9685f7ff', '3b9bba2b-e3c4-5740-96d1-d8241a5ab713', 'fbf39b97-630b-578c-858a-42239c8925cc', '00f947c6-9c0b-5e79-b092-ac96d6ca1434', '81d555a3-f2bb-5df3-8872-fd39ae63611c', '2285243a-cf60-5402-ac43-bd59eb5f8583', '36a14c81-1b3a-5496-b6a4-3538123c71c6', '1eda16c4-b633-5954-b191-7423f09dffe5', '20c22bf3-b697-5fdf-ab9c-acc284c00eed', '449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152', '8eef167f-6d28-54d1-9e17-8bf5908d06b3', '0a475bf0-007c-5558-b4e1-4879f1557116', '8035bedc-7639-5358-a7ce-bf2dd7c6f984', '075a52d9-9c2d-54d8-8c6a-dd50e28243c6', '3aa005c1-b264-58dc-86d1-bd787e242596', '78a39a80-291a-5670-b8ca-b8f8f73f1d89', '8109621d-9488-5492-9efa-13b66f3015f3', 'b77ab9ed-dd5c-5582-8f93-f52885da90e1', '5d131b49-d63b-56b3-ad08-34a0dbac9926', 'cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728', '35bedb68-10ff-55ac-b2a6-9c958cbca79e', '93d8fe55-e868-50cd-bf37-c2edeafdcb47', '816c4e9d-4e7c-5254-9f18-bfcc030d5095', '13c2c721-2ea4-5ed4-91af-3d9f30800af5', 'dc8482bb-6869-5202-909a-8de3b9530442', '09a8d6ec-71af-5c14-bdfe-41242583ef9b', '09324d70-e863-5a05-b891-81d95bd17f1c', '54ff5635-fecc-5042-acba-b3c69590f70f', '9a4610c6-6a22-5496-916e-9fd15656e371', '8840c908-6860-592f-bc95-deff22d874b4', 'c8bde22b-8ea9-56d5-88ac-e862213a5017', 'ddfdd16f-1d44-53f5-a5cc-35037d614b48', '55c767e2-841b-5003-b493-023452c32dd8', 'a1aa299b-b36b-5086-9d1d-53515fdb542c', 'ede7ab03-ea04-5ffd-8865-0c143e3bbffe');

delete from public.content_prerequisites where content_id in ('cb0ed29e-3d26-5e98-b360-23fb97c984aa', '680d75cd-a68c-57fa-9c41-1e35f2b23289', 'd5c4cbdd-ac9a-59ad-a954-c10a7b014867', 'dffaabcf-a56e-534d-a38c-842ff9792b6a', '155166f9-ff64-5536-a48a-567fe28dc070', '23525bc3-5cd3-5714-9998-75e73e7587e9', '9a88255c-bfdb-5e9b-aba4-affc0270c6d4', '0eff06c7-01d8-5299-be8d-34de078f7b8b', '3305bbc1-e089-51b2-9c84-a7425949b96b', '00702e75-7c76-53b2-ae62-8e735e8d9c77', '33c79380-e583-5727-aff9-910497dbc6f0', 'a483047e-e685-5e1c-964f-c2de0a4c7c49', '191e7924-adde-5d9e-b1b2-21480459a5ca', 'bc911fd7-e523-599f-a19d-54fd2993b410', 'd382335d-a200-525f-9120-15334aa1f322', 'a91010c7-1bb6-535b-9004-7f3fb7668ba1', '85454276-0723-52d6-ba26-7a94ef15aa46', 'd0939326-daf8-5b17-882a-38d4ab290ae2', '515d68b9-e263-5df9-882c-a1571f1073fa', '6ea16f93-12c0-5293-bdbe-5f63f369fdac', 'cf331cd3-a550-5c6b-ae59-f8151d3b9355', '078e5817-97ec-5f15-bf73-e040a7fdce7d', '5e78a1cc-d447-5987-a2c0-cff10b2c1045', '19ad7725-4602-5b20-862c-1896f50516d3', 'c929301e-ecaa-5e4a-a3a3-0cfcf6281c77', 'fb919662-a463-51e1-9f1b-94eb611d0f49', '7c9d8143-ee1d-56f4-8dc2-4aeb1f3cb2b4', 'b4a7a38b-659c-5422-aaa3-119c4cd6b869', '31312177-9638-5483-a52d-1a553a958a4c', '280aaced-4d95-556f-bba5-2bc86aa823da', 'be098602-8939-5896-a525-c8867527e7f4', 'df479dab-854b-573d-8554-235c4540221e', '1fb6663f-73a9-532b-abd4-35a041912ab3', 'cf69d04d-1dea-5c58-9cb8-7013ba67e62a', '45145bca-b4dc-5d0e-b561-8c03cd24610b', '67333b75-0bae-57d6-a48a-f3bd5d318acb', '588fd3db-064d-5429-90a1-2d39a6655df7', '436e1cfb-339e-5ee1-90a7-84862b868b60', '4cacfc2d-a645-50f3-ba69-3839736094ad', 'e56facf2-5546-5db7-827c-942260ba899c', 'db8f5d45-4567-5c1b-8ae5-dc20be849810', 'c17b1b9a-ade1-5193-b29d-e48c69ccacb8', '36633e1d-bddc-577d-bee3-e180a53eeb5c', 'f6757f1b-c0d8-5625-90d7-2240591736d1', 'ffd406f8-fd0d-5c61-b6c0-5221d55a6b62', '14ffc845-1de0-537d-85fd-b10a9685f7ff', '3b9bba2b-e3c4-5740-96d1-d8241a5ab713', 'fbf39b97-630b-578c-858a-42239c8925cc', '00f947c6-9c0b-5e79-b092-ac96d6ca1434', '81d555a3-f2bb-5df3-8872-fd39ae63611c', '2285243a-cf60-5402-ac43-bd59eb5f8583', '36a14c81-1b3a-5496-b6a4-3538123c71c6', '1eda16c4-b633-5954-b191-7423f09dffe5', '20c22bf3-b697-5fdf-ab9c-acc284c00eed', '449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152', '8eef167f-6d28-54d1-9e17-8bf5908d06b3', '0a475bf0-007c-5558-b4e1-4879f1557116', '8035bedc-7639-5358-a7ce-bf2dd7c6f984', '075a52d9-9c2d-54d8-8c6a-dd50e28243c6', '3aa005c1-b264-58dc-86d1-bd787e242596', '78a39a80-291a-5670-b8ca-b8f8f73f1d89', '8109621d-9488-5492-9efa-13b66f3015f3', 'b77ab9ed-dd5c-5582-8f93-f52885da90e1', '5d131b49-d63b-56b3-ad08-34a0dbac9926', 'cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728', '35bedb68-10ff-55ac-b2a6-9c958cbca79e', '93d8fe55-e868-50cd-bf37-c2edeafdcb47', '816c4e9d-4e7c-5254-9f18-bfcc030d5095', '13c2c721-2ea4-5ed4-91af-3d9f30800af5', 'dc8482bb-6869-5202-909a-8de3b9530442', '09a8d6ec-71af-5c14-bdfe-41242583ef9b', '09324d70-e863-5a05-b891-81d95bd17f1c', '54ff5635-fecc-5042-acba-b3c69590f70f', '9a4610c6-6a22-5496-916e-9fd15656e371', '8840c908-6860-592f-bc95-deff22d874b4', 'c8bde22b-8ea9-56d5-88ac-e862213a5017', 'ddfdd16f-1d44-53f5-a5cc-35037d614b48', '55c767e2-841b-5003-b493-023452c32dd8', 'a1aa299b-b36b-5086-9d1d-53515fdb542c', 'ede7ab03-ea04-5ffd-8865-0c143e3bbffe');

delete from public.content_sources where content_id in ('cb0ed29e-3d26-5e98-b360-23fb97c984aa', '680d75cd-a68c-57fa-9c41-1e35f2b23289', 'd5c4cbdd-ac9a-59ad-a954-c10a7b014867', 'dffaabcf-a56e-534d-a38c-842ff9792b6a', '155166f9-ff64-5536-a48a-567fe28dc070', '23525bc3-5cd3-5714-9998-75e73e7587e9', '9a88255c-bfdb-5e9b-aba4-affc0270c6d4', '0eff06c7-01d8-5299-be8d-34de078f7b8b', '3305bbc1-e089-51b2-9c84-a7425949b96b', '00702e75-7c76-53b2-ae62-8e735e8d9c77', '33c79380-e583-5727-aff9-910497dbc6f0', 'a483047e-e685-5e1c-964f-c2de0a4c7c49', '191e7924-adde-5d9e-b1b2-21480459a5ca', 'bc911fd7-e523-599f-a19d-54fd2993b410', 'd382335d-a200-525f-9120-15334aa1f322', 'a91010c7-1bb6-535b-9004-7f3fb7668ba1', '85454276-0723-52d6-ba26-7a94ef15aa46', 'd0939326-daf8-5b17-882a-38d4ab290ae2', '515d68b9-e263-5df9-882c-a1571f1073fa', '6ea16f93-12c0-5293-bdbe-5f63f369fdac', 'cf331cd3-a550-5c6b-ae59-f8151d3b9355', '078e5817-97ec-5f15-bf73-e040a7fdce7d', '5e78a1cc-d447-5987-a2c0-cff10b2c1045', '19ad7725-4602-5b20-862c-1896f50516d3', 'c929301e-ecaa-5e4a-a3a3-0cfcf6281c77', 'fb919662-a463-51e1-9f1b-94eb611d0f49', '7c9d8143-ee1d-56f4-8dc2-4aeb1f3cb2b4', 'b4a7a38b-659c-5422-aaa3-119c4cd6b869', '31312177-9638-5483-a52d-1a553a958a4c', '280aaced-4d95-556f-bba5-2bc86aa823da', 'be098602-8939-5896-a525-c8867527e7f4', 'df479dab-854b-573d-8554-235c4540221e', '1fb6663f-73a9-532b-abd4-35a041912ab3', 'cf69d04d-1dea-5c58-9cb8-7013ba67e62a', '45145bca-b4dc-5d0e-b561-8c03cd24610b', '67333b75-0bae-57d6-a48a-f3bd5d318acb', '588fd3db-064d-5429-90a1-2d39a6655df7', '436e1cfb-339e-5ee1-90a7-84862b868b60', '4cacfc2d-a645-50f3-ba69-3839736094ad', 'e56facf2-5546-5db7-827c-942260ba899c', 'db8f5d45-4567-5c1b-8ae5-dc20be849810', 'c17b1b9a-ade1-5193-b29d-e48c69ccacb8', '36633e1d-bddc-577d-bee3-e180a53eeb5c', 'f6757f1b-c0d8-5625-90d7-2240591736d1', 'ffd406f8-fd0d-5c61-b6c0-5221d55a6b62', '14ffc845-1de0-537d-85fd-b10a9685f7ff', '3b9bba2b-e3c4-5740-96d1-d8241a5ab713', 'fbf39b97-630b-578c-858a-42239c8925cc', '00f947c6-9c0b-5e79-b092-ac96d6ca1434', '81d555a3-f2bb-5df3-8872-fd39ae63611c', '2285243a-cf60-5402-ac43-bd59eb5f8583', '36a14c81-1b3a-5496-b6a4-3538123c71c6', '1eda16c4-b633-5954-b191-7423f09dffe5', '20c22bf3-b697-5fdf-ab9c-acc284c00eed', '449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152', '8eef167f-6d28-54d1-9e17-8bf5908d06b3', '0a475bf0-007c-5558-b4e1-4879f1557116', '8035bedc-7639-5358-a7ce-bf2dd7c6f984', '075a52d9-9c2d-54d8-8c6a-dd50e28243c6', '3aa005c1-b264-58dc-86d1-bd787e242596', '78a39a80-291a-5670-b8ca-b8f8f73f1d89', '8109621d-9488-5492-9efa-13b66f3015f3', 'b77ab9ed-dd5c-5582-8f93-f52885da90e1', '5d131b49-d63b-56b3-ad08-34a0dbac9926', 'cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728', '35bedb68-10ff-55ac-b2a6-9c958cbca79e', '93d8fe55-e868-50cd-bf37-c2edeafdcb47', '816c4e9d-4e7c-5254-9f18-bfcc030d5095', '13c2c721-2ea4-5ed4-91af-3d9f30800af5', 'dc8482bb-6869-5202-909a-8de3b9530442', '09a8d6ec-71af-5c14-bdfe-41242583ef9b', '09324d70-e863-5a05-b891-81d95bd17f1c', '54ff5635-fecc-5042-acba-b3c69590f70f', '9a4610c6-6a22-5496-916e-9fd15656e371', '8840c908-6860-592f-bc95-deff22d874b4', 'c8bde22b-8ea9-56d5-88ac-e862213a5017', 'ddfdd16f-1d44-53f5-a5cc-35037d614b48', '55c767e2-841b-5003-b493-023452c32dd8', 'a1aa299b-b36b-5086-9d1d-53515fdb542c', 'ede7ab03-ea04-5ffd-8865-0c143e3bbffe');

delete from public.content_relations where content_id in ('cb0ed29e-3d26-5e98-b360-23fb97c984aa', '680d75cd-a68c-57fa-9c41-1e35f2b23289', 'd5c4cbdd-ac9a-59ad-a954-c10a7b014867', 'dffaabcf-a56e-534d-a38c-842ff9792b6a', '155166f9-ff64-5536-a48a-567fe28dc070', '23525bc3-5cd3-5714-9998-75e73e7587e9', '9a88255c-bfdb-5e9b-aba4-affc0270c6d4', '0eff06c7-01d8-5299-be8d-34de078f7b8b', '3305bbc1-e089-51b2-9c84-a7425949b96b', '00702e75-7c76-53b2-ae62-8e735e8d9c77', '33c79380-e583-5727-aff9-910497dbc6f0', 'a483047e-e685-5e1c-964f-c2de0a4c7c49', '191e7924-adde-5d9e-b1b2-21480459a5ca', 'bc911fd7-e523-599f-a19d-54fd2993b410', 'd382335d-a200-525f-9120-15334aa1f322', 'a91010c7-1bb6-535b-9004-7f3fb7668ba1', '85454276-0723-52d6-ba26-7a94ef15aa46', 'd0939326-daf8-5b17-882a-38d4ab290ae2', '515d68b9-e263-5df9-882c-a1571f1073fa', '6ea16f93-12c0-5293-bdbe-5f63f369fdac', 'cf331cd3-a550-5c6b-ae59-f8151d3b9355', '078e5817-97ec-5f15-bf73-e040a7fdce7d', '5e78a1cc-d447-5987-a2c0-cff10b2c1045', '19ad7725-4602-5b20-862c-1896f50516d3', 'c929301e-ecaa-5e4a-a3a3-0cfcf6281c77', 'fb919662-a463-51e1-9f1b-94eb611d0f49', '7c9d8143-ee1d-56f4-8dc2-4aeb1f3cb2b4', 'b4a7a38b-659c-5422-aaa3-119c4cd6b869', '31312177-9638-5483-a52d-1a553a958a4c', '280aaced-4d95-556f-bba5-2bc86aa823da', 'be098602-8939-5896-a525-c8867527e7f4', 'df479dab-854b-573d-8554-235c4540221e', '1fb6663f-73a9-532b-abd4-35a041912ab3', 'cf69d04d-1dea-5c58-9cb8-7013ba67e62a', '45145bca-b4dc-5d0e-b561-8c03cd24610b', '67333b75-0bae-57d6-a48a-f3bd5d318acb', '588fd3db-064d-5429-90a1-2d39a6655df7', '436e1cfb-339e-5ee1-90a7-84862b868b60', '4cacfc2d-a645-50f3-ba69-3839736094ad', 'e56facf2-5546-5db7-827c-942260ba899c', 'db8f5d45-4567-5c1b-8ae5-dc20be849810', 'c17b1b9a-ade1-5193-b29d-e48c69ccacb8', '36633e1d-bddc-577d-bee3-e180a53eeb5c', 'f6757f1b-c0d8-5625-90d7-2240591736d1', 'ffd406f8-fd0d-5c61-b6c0-5221d55a6b62', '14ffc845-1de0-537d-85fd-b10a9685f7ff', '3b9bba2b-e3c4-5740-96d1-d8241a5ab713', 'fbf39b97-630b-578c-858a-42239c8925cc', '00f947c6-9c0b-5e79-b092-ac96d6ca1434', '81d555a3-f2bb-5df3-8872-fd39ae63611c', '2285243a-cf60-5402-ac43-bd59eb5f8583', '36a14c81-1b3a-5496-b6a4-3538123c71c6', '1eda16c4-b633-5954-b191-7423f09dffe5', '20c22bf3-b697-5fdf-ab9c-acc284c00eed', '449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152', '8eef167f-6d28-54d1-9e17-8bf5908d06b3', '0a475bf0-007c-5558-b4e1-4879f1557116', '8035bedc-7639-5358-a7ce-bf2dd7c6f984', '075a52d9-9c2d-54d8-8c6a-dd50e28243c6', '3aa005c1-b264-58dc-86d1-bd787e242596', '78a39a80-291a-5670-b8ca-b8f8f73f1d89', '8109621d-9488-5492-9efa-13b66f3015f3', 'b77ab9ed-dd5c-5582-8f93-f52885da90e1', '5d131b49-d63b-56b3-ad08-34a0dbac9926', 'cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728', '35bedb68-10ff-55ac-b2a6-9c958cbca79e', '93d8fe55-e868-50cd-bf37-c2edeafdcb47', '816c4e9d-4e7c-5254-9f18-bfcc030d5095', '13c2c721-2ea4-5ed4-91af-3d9f30800af5', 'dc8482bb-6869-5202-909a-8de3b9530442', '09a8d6ec-71af-5c14-bdfe-41242583ef9b', '09324d70-e863-5a05-b891-81d95bd17f1c', '54ff5635-fecc-5042-acba-b3c69590f70f', '9a4610c6-6a22-5496-916e-9fd15656e371', '8840c908-6860-592f-bc95-deff22d874b4', 'c8bde22b-8ea9-56d5-88ac-e862213a5017', 'ddfdd16f-1d44-53f5-a5cc-35037d614b48', '55c767e2-841b-5003-b493-023452c32dd8', 'a1aa299b-b36b-5086-9d1d-53515fdb542c', 'ede7ab03-ea04-5ffd-8865-0c143e3bbffe');

insert into public.content_objectives (content_id, objective_id) values
  ('d5c4cbdd-ac9a-59ad-a954-c10a7b014867', 'ccna-v2:1.1'),
  ('dffaabcf-a56e-534d-a38c-842ff9792b6a', 'ccna-v2:2.4'),
  ('155166f9-ff64-5536-a48a-567fe28dc070', 'ccna-v2:2.4'),
  ('23525bc3-5cd3-5714-9998-75e73e7587e9', 'ccna-v2:1.3'),
  ('0eff06c7-01d8-5299-be8d-34de078f7b8b', 'ccna-v2:2.4'),
  ('33c79380-e583-5727-aff9-910497dbc6f0', 'ccna-v2:1.7'),
  ('a483047e-e685-5e1c-964f-c2de0a4c7c49', 'ccna-v2:4.4'),
  ('191e7924-adde-5d9e-b1b2-21480459a5ca', 'ccna-v2:2.4'),
  ('bc911fd7-e523-599f-a19d-54fd2993b410', 'ccna-v2:3.1'),
  ('d382335d-a200-525f-9120-15334aa1f322', 'ccna-v2:2.2'),
  ('a91010c7-1bb6-535b-9004-7f3fb7668ba1', 'ccna-v2:2.2'),
  ('a91010c7-1bb6-535b-9004-7f3fb7668ba1', 'ccna-v2:2.2.a'),
  ('a91010c7-1bb6-535b-9004-7f3fb7668ba1', 'ccna-v2:2.2.c'),
  ('85454276-0723-52d6-ba26-7a94ef15aa46', 'ccna-v2:2.1'),
  ('85454276-0723-52d6-ba26-7a94ef15aa46', 'ccna-v2:2.1.b'),
  ('d0939326-daf8-5b17-882a-38d4ab290ae2', 'ccna-v2:2.1.b'),
  ('515d68b9-e263-5df9-882c-a1571f1073fa', 'ccna-v2:2.1.b'),
  ('515d68b9-e263-5df9-882c-a1571f1073fa', 'ccna-v2:2.4'),
  ('6ea16f93-12c0-5293-bdbe-5f63f369fdac', 'ccna-v2:2.1.a'),
  ('6ea16f93-12c0-5293-bdbe-5f63f369fdac', 'ccna-v2:2.1.b'),
  ('cf331cd3-a550-5c6b-ae59-f8151d3b9355', 'ccna-v2:2.1.a'),
  ('cf331cd3-a550-5c6b-ae59-f8151d3b9355', 'ccna-v2:2.1.d'),
  ('078e5817-97ec-5f15-bf73-e040a7fdce7d', 'ccna-v2:2.5'),
  ('5e78a1cc-d447-5987-a2c0-cff10b2c1045', 'ccna-v2:2.5'),
  ('5e78a1cc-d447-5987-a2c0-cff10b2c1045', 'ccna-v2:2.5.a'),
  ('19ad7725-4602-5b20-862c-1896f50516d3', 'ccna-v2:2.5'),
  ('19ad7725-4602-5b20-862c-1896f50516d3', 'ccna-v2:2.5.b'),
  ('c929301e-ecaa-5e4a-a3a3-0cfcf6281c77', 'ccna-v2:2.5.c'),
  ('c929301e-ecaa-5e4a-a3a3-0cfcf6281c77', 'ccna-v2:2.5.d'),
  ('fb919662-a463-51e1-9f1b-94eb611d0f49', 'ccna-v2:2.5.d'),
  ('7c9d8143-ee1d-56f4-8dc2-4aeb1f3cb2b4', 'ccna-v2:2.1.c'),
  ('b4a7a38b-659c-5422-aaa3-119c4cd6b869', 'ccna-v2:2.1.c'),
  ('b4a7a38b-659c-5422-aaa3-119c4cd6b869', 'ccna-v2:2.4'),
  ('31312177-9638-5483-a52d-1a553a958a4c', 'ccna-v2:2.3'),
  ('280aaced-4d95-556f-bba5-2bc86aa823da', 'ccna-v2:1.1'),
  ('280aaced-4d95-556f-bba5-2bc86aa823da', 'ccna-v2:2.4'),
  ('be098602-8939-5896-a525-c8867527e7f4', 'ccna-v2:1.1'),
  ('df479dab-854b-573d-8554-235c4540221e', 'ccna-v2:1.3'),
  ('1fb6663f-73a9-532b-abd4-35a041912ab3', 'ccna-v2:1.3'),
  ('cf69d04d-1dea-5c58-9cb8-7013ba67e62a', 'ccna-v2:1.3'),
  ('45145bca-b4dc-5d0e-b561-8c03cd24610b', 'ccna-v2:1.3'),
  ('45145bca-b4dc-5d0e-b561-8c03cd24610b', 'ccna-v2:1.6'),
  ('67333b75-0bae-57d6-a48a-f3bd5d318acb', 'ccna-v2:1.4'),
  ('588fd3db-064d-5429-90a1-2d39a6655df7', 'ccna-v2:1.4'),
  ('436e1cfb-339e-5ee1-90a7-84862b868b60', 'ccna-v2:1.4'),
  ('4cacfc2d-a645-50f3-ba69-3839736094ad', 'ccna-v2:1.4'),
  ('e56facf2-5546-5db7-827c-942260ba899c', 'ccna-v2:3.1'),
  ('db8f5d45-4567-5c1b-8ae5-dc20be849810', 'ccna-v2:3.1'),
  ('c17b1b9a-ade1-5193-b29d-e48c69ccacb8', 'ccna-v2:3.2'),
  ('c17b1b9a-ade1-5193-b29d-e48c69ccacb8', 'ccna-v2:3.2.a'),
  ('c17b1b9a-ade1-5193-b29d-e48c69ccacb8', 'ccna-v2:3.2.b'),
  ('c17b1b9a-ade1-5193-b29d-e48c69ccacb8', 'ccna-v2:3.2.c'),
  ('36633e1d-bddc-577d-bee3-e180a53eeb5c', 'ccna-v2:3.2'),
  ('36633e1d-bddc-577d-bee3-e180a53eeb5c', 'ccna-v2:3.2.d'),
  ('f6757f1b-c0d8-5625-90d7-2240591736d1', 'ccna-v2:3.2'),
  ('f6757f1b-c0d8-5625-90d7-2240591736d1', 'ccna-v2:3.2.a'),
  ('f6757f1b-c0d8-5625-90d7-2240591736d1', 'ccna-v2:3.2.b'),
  ('f6757f1b-c0d8-5625-90d7-2240591736d1', 'ccna-v2:3.2.d'),
  ('ffd406f8-fd0d-5c61-b6c0-5221d55a6b62', 'ccna-v2:3.2'),
  ('ffd406f8-fd0d-5c61-b6c0-5221d55a6b62', 'ccna-v2:2.4'),
  ('14ffc845-1de0-537d-85fd-b10a9685f7ff', 'ccna-v2:3.3'),
  ('3b9bba2b-e3c4-5740-96d1-d8241a5ab713', 'ccna-v2:3.3'),
  ('3b9bba2b-e3c4-5740-96d1-d8241a5ab713', 'ccna-v2:3.3.a'),
  ('fbf39b97-630b-578c-858a-42239c8925cc', 'ccna-v2:3.3.b'),
  ('fbf39b97-630b-578c-858a-42239c8925cc', 'ccna-v2:3.3.c'),
  ('00f947c6-9c0b-5e79-b092-ac96d6ca1434', 'ccna-v2:3.3.d'),
  ('81d555a3-f2bb-5df3-8872-fd39ae63611c', 'ccna-v2:3.3'),
  ('81d555a3-f2bb-5df3-8872-fd39ae63611c', 'ccna-v2:3.3.b'),
  ('81d555a3-f2bb-5df3-8872-fd39ae63611c', 'ccna-v2:3.3.d'),
  ('2285243a-cf60-5402-ac43-bd59eb5f8583', 'ccna-v2:3.3'),
  ('2285243a-cf60-5402-ac43-bd59eb5f8583', 'ccna-v2:3.3.a'),
  ('2285243a-cf60-5402-ac43-bd59eb5f8583', 'ccna-v2:2.4'),
  ('36a14c81-1b3a-5496-b6a4-3538123c71c6', 'ccna-v2:3.3'),
  ('1eda16c4-b633-5954-b191-7423f09dffe5', 'ccna-v2:3.4'),
  ('20c22bf3-b697-5fdf-ab9c-acc284c00eed', 'ccna-v2:3.4'),
  ('449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152', 'ccna-v2:4.3'),
  ('8eef167f-6d28-54d1-9e17-8bf5908d06b3', 'ccna-v2:4.3'),
  ('0a475bf0-007c-5558-b4e1-4879f1557116', 'ccna-v2:4.3'),
  ('8035bedc-7639-5358-a7ce-bf2dd7c6f984', 'ccna-v2:1.7'),
  ('075a52d9-9c2d-54d8-8c6a-dd50e28243c6', 'ccna-v2:1.7'),
  ('075a52d9-9c2d-54d8-8c6a-dd50e28243c6', 'ccna-v2:1.6'),
  ('3aa005c1-b264-58dc-86d1-bd787e242596', 'ccna-v2:4.4'),
  ('78a39a80-291a-5670-b8ca-b8f8f73f1d89', 'ccna-v2:4.6'),
  ('8109621d-9488-5492-9efa-13b66f3015f3', 'ccna-v2:4.6'),
  ('b77ab9ed-dd5c-5582-8f93-f52885da90e1', 'ccna-v2:4.6'),
  ('5d131b49-d63b-56b3-ad08-34a0dbac9926', 'ccna-v2:4.7'),
  ('5d131b49-d63b-56b3-ad08-34a0dbac9926', 'ccna-v2:4.7.e'),
  ('cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728', 'ccna-v2:4.7'),
  ('cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728', 'ccna-v2:4.7.a'),
  ('35bedb68-10ff-55ac-b2a6-9c958cbca79e', 'ccna-v2:4.7'),
  ('35bedb68-10ff-55ac-b2a6-9c958cbca79e', 'ccna-v2:4.7.b'),
  ('93d8fe55-e868-50cd-bf37-c2edeafdcb47', 'ccna-v2:4.7'),
  ('93d8fe55-e868-50cd-bf37-c2edeafdcb47', 'ccna-v2:4.7.c'),
  ('93d8fe55-e868-50cd-bf37-c2edeafdcb47', 'ccna-v2:4.7.d'),
  ('816c4e9d-4e7c-5254-9f18-bfcc030d5095', 'ccna-v2:4.1'),
  ('13c2c721-2ea4-5ed4-91af-3d9f30800af5', 'ccna-v2:4.1'),
  ('dc8482bb-6869-5202-909a-8de3b9530442', 'ccna-v2:4.2'),
  ('09a8d6ec-71af-5c14-bdfe-41242583ef9b', 'ccna-v2:4.5'),
  ('09324d70-e863-5a05-b891-81d95bd17f1c', 'ccna-v2:5.6'),
  ('54ff5635-fecc-5042-acba-b3c69590f70f', 'ccna-v2:5.4'),
  ('9a4610c6-6a22-5496-916e-9fd15656e371', 'ccna-v2:5.3'),
  ('8840c908-6860-592f-bc95-deff22d874b4', 'ccna-v2:5.5'),
  ('c8bde22b-8ea9-56d5-88ac-e862213a5017', 'ccna-v2:5.1'),
  ('c8bde22b-8ea9-56d5-88ac-e862213a5017', 'ccna-v2:5.2'),
  ('ddfdd16f-1d44-53f5-a5cc-35037d614b48', 'ccna-v2:1.2'),
  ('ddfdd16f-1d44-53f5-a5cc-35037d614b48', 'ccna-v2:2.2.d'),
  ('55c767e2-841b-5003-b493-023452c32dd8', 'ccna-v2:1.5'),
  ('55c767e2-841b-5003-b493-023452c32dd8', 'ccna-v2:1.5.a'),
  ('55c767e2-841b-5003-b493-023452c32dd8', 'ccna-v2:1.5.b'),
  ('a1aa299b-b36b-5086-9d1d-53515fdb542c', 'ccna-v2:1.5'),
  ('a1aa299b-b36b-5086-9d1d-53515fdb542c', 'ccna-v2:1.5.c'),
  ('ede7ab03-ea04-5ffd-8865-0c143e3bbffe', 'ccna-v2:1.5.d'),
  ('ede7ab03-ea04-5ffd-8865-0c143e3bbffe', 'ccna-v2:1.6');

insert into public.content_prerequisites (content_id, topic_id) values
  ('680d75cd-a68c-57fa-9c41-1e35f2b23289', 'network-devices'),
  ('d5c4cbdd-ac9a-59ad-a954-c10a7b014867', 'osi-tcpip'),
  ('dffaabcf-a56e-534d-a38c-842ff9792b6a', 'mac-addressing'),
  ('155166f9-ff64-5536-a48a-567fe28dc070', 'mac-addressing'),
  ('23525bc3-5cd3-5714-9998-75e73e7587e9', 'osi-tcpip'),
  ('9a88255c-bfdb-5e9b-aba4-affc0270c6d4', 'ipv4-addressing'),
  ('9a88255c-bfdb-5e9b-aba4-affc0270c6d4', 'mac-addressing'),
  ('0eff06c7-01d8-5299-be8d-34de078f7b8b', 'ipv4-addressing'),
  ('3305bbc1-e089-51b2-9c84-a7425949b96b', 'osi-tcpip'),
  ('00702e75-7c76-53b2-ae62-8e735e8d9c77', 'osi-tcpip'),
  ('33c79380-e583-5727-aff9-910497dbc6f0', 'ipv4-addressing'),
  ('33c79380-e583-5727-aff9-910497dbc6f0', 'tcp-udp'),
  ('a483047e-e685-5e1c-964f-c2de0a4c7c49', 'tcp-udp'),
  ('191e7924-adde-5d9e-b1b2-21480459a5ca', 'network-devices'),
  ('bc911fd7-e523-599f-a19d-54fd2993b410', 'subnetting'),
  ('d382335d-a200-525f-9120-15334aa1f322', 'switching-fundamentals'),
  ('a91010c7-1bb6-535b-9004-7f3fb7668ba1', 'vlans'),
  ('85454276-0723-52d6-ba26-7a94ef15aa46', 'vlans'),
  ('d0939326-daf8-5b17-882a-38d4ab290ae2', 'vlans'),
  ('515d68b9-e263-5df9-882c-a1571f1073fa', 'vlan-trunking'),
  ('6ea16f93-12c0-5293-bdbe-5f63f369fdac', 'vlan-trunking'),
  ('6ea16f93-12c0-5293-bdbe-5f63f369fdac', 'routing-fundamentals'),
  ('cf331cd3-a550-5c6b-ae59-f8151d3b9355', 'vlans'),
  ('cf331cd3-a550-5c6b-ae59-f8151d3b9355', 'routing-fundamentals'),
  ('078e5817-97ec-5f15-bf73-e040a7fdce7d', 'switching-fundamentals'),
  ('5e78a1cc-d447-5987-a2c0-cff10b2c1045', 'stp'),
  ('19ad7725-4602-5b20-862c-1896f50516d3', 'stp'),
  ('c929301e-ecaa-5e4a-a3a3-0cfcf6281c77', 'stp'),
  ('fb919662-a463-51e1-9f1b-94eb611d0f49', 'stp'),
  ('7c9d8143-ee1d-56f4-8dc2-4aeb1f3cb2b4', 'vlan-trunking'),
  ('7c9d8143-ee1d-56f4-8dc2-4aeb1f3cb2b4', 'stp'),
  ('b4a7a38b-659c-5422-aaa3-119c4cd6b869', 'etherchannel'),
  ('31312177-9638-5483-a52d-1a553a958a4c', 'switching-fundamentals'),
  ('280aaced-4d95-556f-bba5-2bc86aa823da', 'ethernet-lan'),
  ('be098602-8939-5896-a525-c8867527e7f4', 'ethernet-lan'),
  ('df479dab-854b-573d-8554-235c4540221e', 'ipv4-addressing'),
  ('1fb6663f-73a9-532b-abd4-35a041912ab3', 'subnetting'),
  ('cf69d04d-1dea-5c58-9cb8-7013ba67e62a', 'subnetting'),
  ('45145bca-b4dc-5d0e-b561-8c03cd24610b', 'ipv4-addressing'),
  ('67333b75-0bae-57d6-a48a-f3bd5d318acb', 'ipv4-addressing'),
  ('588fd3db-064d-5429-90a1-2d39a6655df7', 'ipv6-fundamentals'),
  ('436e1cfb-339e-5ee1-90a7-84862b868b60', 'ipv6-fundamentals'),
  ('4cacfc2d-a645-50f3-ba69-3839736094ad', 'ipv6-fundamentals'),
  ('e56facf2-5546-5db7-827c-942260ba899c', 'routing-fundamentals'),
  ('db8f5d45-4567-5c1b-8ae5-dc20be849810', 'routing-fundamentals'),
  ('c17b1b9a-ade1-5193-b29d-e48c69ccacb8', 'routing-fundamentals'),
  ('36633e1d-bddc-577d-bee3-e180a53eeb5c', 'static-routing'),
  ('f6757f1b-c0d8-5625-90d7-2240591736d1', 'static-routing'),
  ('f6757f1b-c0d8-5625-90d7-2240591736d1', 'ipv6-fundamentals'),
  ('ffd406f8-fd0d-5c61-b6c0-5221d55a6b62', 'static-routing'),
  ('14ffc845-1de0-537d-85fd-b10a9685f7ff', 'routing-fundamentals'),
  ('3b9bba2b-e3c4-5740-96d1-d8241a5ab713', 'ospf'),
  ('fbf39b97-630b-578c-858a-42239c8925cc', 'ospf'),
  ('00f947c6-9c0b-5e79-b092-ac96d6ca1434', 'ospf'),
  ('81d555a3-f2bb-5df3-8872-fd39ae63611c', 'ospf'),
  ('2285243a-cf60-5402-ac43-bd59eb5f8583', 'ospf'),
  ('36a14c81-1b3a-5496-b6a4-3538123c71c6', 'ospf'),
  ('36a14c81-1b3a-5496-b6a4-3538123c71c6', 'ipv6-fundamentals'),
  ('1eda16c4-b633-5954-b191-7423f09dffe5', 'routing-fundamentals'),
  ('1eda16c4-b633-5954-b191-7423f09dffe5', 'arp'),
  ('20c22bf3-b697-5fdf-ab9c-acc284c00eed', 'fhrp'),
  ('449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152', 'ipv4-addressing'),
  ('449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152', 'tcp-udp'),
  ('8eef167f-6d28-54d1-9e17-8bf5908d06b3', 'nat'),
  ('0a475bf0-007c-5558-b4e1-4879f1557116', 'nat'),
  ('8035bedc-7639-5358-a7ce-bf2dd7c6f984', 'dhcp'),
  ('075a52d9-9c2d-54d8-8c6a-dd50e28243c6', 'dhcp'),
  ('3aa005c1-b264-58dc-86d1-bd787e242596', 'dns'),
  ('78a39a80-291a-5670-b8ca-b8f8f73f1d89', 'subnetting'),
  ('78a39a80-291a-5670-b8ca-b8f8f73f1d89', 'tcp-udp'),
  ('8109621d-9488-5492-9efa-13b66f3015f3', 'acl'),
  ('b77ab9ed-dd5c-5582-8f93-f52885da90e1', 'acl'),
  ('5d131b49-d63b-56b3-ad08-34a0dbac9926', 'vlans'),
  ('cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728', 'dhcp'),
  ('cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728', 'vlans'),
  ('35bedb68-10ff-55ac-b2a6-9c958cbca79e', 'arp'),
  ('35bedb68-10ff-55ac-b2a6-9c958cbca79e', 'layer2-security'),
  ('93d8fe55-e868-50cd-bf37-c2edeafdcb47', 'layer2-security'),
  ('93d8fe55-e868-50cd-bf37-c2edeafdcb47', 'ipv6-ndp-slaac'),
  ('816c4e9d-4e7c-5254-9f18-bfcc030d5095', 'ios-fundamentals'),
  ('13c2c721-2ea4-5ed4-91af-3d9f30800af5', 'device-access'),
  ('dc8482bb-6869-5202-909a-8de3b9530442', 'device-access'),
  ('09a8d6ec-71af-5c14-bdfe-41242583ef9b', 'security-fundamentals'),
  ('09324d70-e863-5a05-b891-81d95bd17f1c', 'ios-fundamentals'),
  ('54ff5635-fecc-5042-acba-b3c69590f70f', 'ios-fundamentals'),
  ('9a4610c6-6a22-5496-916e-9fd15656e371', 'ios-fundamentals'),
  ('8840c908-6860-592f-bc95-deff22d874b4', 'network-automation'),
  ('c8bde22b-8ea9-56d5-88ac-e862213a5017', 'network-automation'),
  ('ddfdd16f-1d44-53f5-a5cc-35037d614b48', 'network-devices'),
  ('55c767e2-841b-5003-b493-023452c32dd8', 'network-devices'),
  ('a1aa299b-b36b-5086-9d1d-53515fdb542c', 'wireless-fundamentals'),
  ('ede7ab03-ea04-5ffd-8865-0c143e3bbffe', 'wireless-fundamentals');

insert into public.content_sources (content_id, position, title, url, publisher, source_type, verified_on) values
  ('cb0ed29e-3d26-5e98-b360-23fb97c984aa', 0, 'RFC 1812 — Requirements for IP Version 4 Routers', 'https://www.rfc-editor.org/rfc/rfc1812', 'RFC Editor', 'rfc', null),
  ('cb0ed29e-3d26-5e98-b360-23fb97c984aa', 1, 'IEEE 802.1Q — Bridges and Bridged Networks', null, 'IEEE', 'standard', null),
  ('680d75cd-a68c-57fa-9c41-1e35f2b23289', 0, 'RFC 1122 — Requirements for Internet Hosts — Communication Layers', 'https://www.rfc-editor.org/rfc/rfc1122', 'RFC Editor', 'rfc', null),
  ('d5c4cbdd-ac9a-59ad-a954-c10a7b014867', 0, 'IEEE 802.3 — Ethernet', null, 'IEEE', 'standard', null),
  ('dffaabcf-a56e-534d-a38c-842ff9792b6a', 0, 'IEEE 802.1Q — Bridges and Bridged Networks', null, 'IEEE', 'standard', null),
  ('dffaabcf-a56e-534d-a38c-842ff9792b6a', 1, 'Cisco IOS Configuration Fundamentals Command Reference', null, 'Cisco', 'vendor_docs', null),
  ('155166f9-ff64-5536-a48a-567fe28dc070', 0, 'IEEE 802.1Q — Bridges and Bridged Networks', null, 'IEEE', 'standard', null),
  ('23525bc3-5cd3-5714-9998-75e73e7587e9', 0, 'RFC 1918 — Address Allocation for Private Internets', 'https://www.rfc-editor.org/rfc/rfc1918', 'RFC Editor', 'rfc', '2026-11-27'),
  ('23525bc3-5cd3-5714-9998-75e73e7587e9', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('9a88255c-bfdb-5e9b-aba4-affc0270c6d4', 0, 'RFC 826 — An Ethernet Address Resolution Protocol', 'https://www.rfc-editor.org/rfc/rfc826', 'RFC Editor', 'rfc', '2026-11-27'),
  ('0eff06c7-01d8-5299-be8d-34de078f7b8b', 0, 'RFC 792 — Internet Control Message Protocol', 'https://www.rfc-editor.org/rfc/rfc792', 'RFC Editor', 'rfc', '2026-11-27'),
  ('0eff06c7-01d8-5299-be8d-34de078f7b8b', 1, 'RFC 791 — Internet Protocol', 'https://www.rfc-editor.org/rfc/rfc791', 'RFC Editor', 'rfc', '2026-11-27'),
  ('0eff06c7-01d8-5299-be8d-34de078f7b8b', 2, 'Cisco IOS Configuration Fundamentals Command Reference', null, 'Cisco', 'vendor_docs', null),
  ('3305bbc1-e089-51b2-9c84-a7425949b96b', 0, 'RFC 9293 — Transmission Control Protocol (TCP)', 'https://www.rfc-editor.org/rfc/rfc9293', 'RFC Editor', 'rfc', '2026-11-27'),
  ('00702e75-7c76-53b2-ae62-8e735e8d9c77', 0, 'RFC 768 — User Datagram Protocol', 'https://www.rfc-editor.org/rfc/rfc768', 'RFC Editor', 'rfc', '2026-11-27'),
  ('00702e75-7c76-53b2-ae62-8e735e8d9c77', 1, 'RFC 9293 — Transmission Control Protocol (TCP)', 'https://www.rfc-editor.org/rfc/rfc9293', 'RFC Editor', 'rfc', '2026-11-27'),
  ('00702e75-7c76-53b2-ae62-8e735e8d9c77', 2, 'RFC 1035 — Domain Names — Implementation and Specification', 'https://www.rfc-editor.org/rfc/rfc1035', 'RFC Editor', 'rfc', '2026-11-27'),
  ('33c79380-e583-5727-aff9-910497dbc6f0', 0, 'RFC 2131 — Dynamic Host Configuration Protocol', 'https://www.rfc-editor.org/rfc/rfc2131', 'RFC Editor', 'rfc', '2026-11-27'),
  ('33c79380-e583-5727-aff9-910497dbc6f0', 1, 'Cisco IOS Configuration Fundamentals Command Reference', null, 'Cisco', 'vendor_docs', null),
  ('33c79380-e583-5727-aff9-910497dbc6f0', 2, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('a483047e-e685-5e1c-964f-c2de0a4c7c49', 0, 'RFC 1035 — Domain Names — Implementation and Specification', 'https://www.rfc-editor.org/rfc/rfc1035', 'RFC Editor', 'rfc', '2026-11-27'),
  ('a483047e-e685-5e1c-964f-c2de0a4c7c49', 1, 'RFC 3596 — DNS Extensions to Support IP Version 6', 'https://www.rfc-editor.org/rfc/rfc3596', 'RFC Editor', 'rfc', '2026-11-27'),
  ('a483047e-e685-5e1c-964f-c2de0a4c7c49', 2, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('191e7924-adde-5d9e-b1b2-21480459a5ca', 0, 'Cisco IOS Configuration Fundamentals Command Reference', null, 'Cisco', 'vendor_docs', null),
  ('191e7924-adde-5d9e-b1b2-21480459a5ca', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('bc911fd7-e523-599f-a19d-54fd2993b410', 0, 'RFC 1812 — Requirements for IP Version 4 Routers', 'https://www.rfc-editor.org/rfc/rfc1812', 'RFC Editor', 'rfc', null),
  ('bc911fd7-e523-599f-a19d-54fd2993b410', 1, 'Cisco IOS Configuration Fundamentals Command Reference', null, 'Cisco', 'vendor_docs', null),
  ('bc911fd7-e523-599f-a19d-54fd2993b410', 2, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('d382335d-a200-525f-9120-15334aa1f322', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('d382335d-a200-525f-9120-15334aa1f322', 1, 'IEEE 802.1Q — Bridges and Bridged Networks', null, 'IEEE', 'standard', null),
  ('d382335d-a200-525f-9120-15334aa1f322', 2, 'VLAN Configuration Guide, Cisco IOS 15.2(7)Ex (Catalyst 1000) — Configuring VLAN Trunks', 'https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst1000/software/releases/15_2_7_e/configuration_guides/vlan/b_1527e_vlan_c1000_cg/configuring_vlan_trunks.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('a91010c7-1bb6-535b-9004-7f3fb7668ba1', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('a91010c7-1bb6-535b-9004-7f3fb7668ba1', 1, 'VLAN Configuration Guide, Cisco IOS 15.2(7)Ex (Catalyst 1000) — Configuring VLAN Trunks', 'https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst1000/software/releases/15_2_7_e/configuration_guides/vlan/b_1527e_vlan_c1000_cg/configuring_vlan_trunks.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('a91010c7-1bb6-535b-9004-7f3fb7668ba1', 2, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('85454276-0723-52d6-ba26-7a94ef15aa46', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('85454276-0723-52d6-ba26-7a94ef15aa46', 1, 'VLAN Configuration Guide, Cisco IOS 15.2(7)Ex (Catalyst 1000) — Configuring VLAN Trunks', 'https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst1000/software/releases/15_2_7_e/configuration_guides/vlan/b_1527e_vlan_c1000_cg/configuring_vlan_trunks.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('85454276-0723-52d6-ba26-7a94ef15aa46', 2, 'IEEE 802.1Q — Bridges and Bridged Networks', null, 'IEEE', 'standard', null),
  ('d0939326-daf8-5b17-882a-38d4ab290ae2', 0, 'VLAN Configuration Guide, Cisco IOS 15.2(7)Ex (Catalyst 1000) — Configuring VLAN Trunks', 'https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst1000/software/releases/15_2_7_e/configuration_guides/vlan/b_1527e_vlan_c1000_cg/configuring_vlan_trunks.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('d0939326-daf8-5b17-882a-38d4ab290ae2', 1, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('515d68b9-e263-5df9-882c-a1571f1073fa', 0, 'VLAN Configuration Guide, Cisco IOS 15.2(7)Ex (Catalyst 1000) — Configuring VLAN Trunks', 'https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst1000/software/releases/15_2_7_e/configuration_guides/vlan/b_1527e_vlan_c1000_cg/configuring_vlan_trunks.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('515d68b9-e263-5df9-882c-a1571f1073fa', 1, 'Catalyst 3560 Configuration Guide 15.0(2)SE — Configuring CDP', 'https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst3560/software/release/15-0_2_se/configuration/guide/scg3560/swcdp.html', 'Cisco', 'vendor_docs', null),
  ('515d68b9-e263-5df9-882c-a1571f1073fa', 2, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('6ea16f93-12c0-5293-bdbe-5f63f369fdac', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('6ea16f93-12c0-5293-bdbe-5f63f369fdac', 1, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('cf331cd3-a550-5c6b-ae59-f8151d3b9355', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('cf331cd3-a550-5c6b-ae59-f8151d3b9355', 1, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('078e5817-97ec-5f15-bf73-e040a7fdce7d', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('078e5817-97ec-5f15-bf73-e040a7fdce7d', 1, 'Catalyst 2960 Software Configuration Guide 15.2(2)E — Configuring Optional Spanning-Tree Features', 'https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst2960/software/release/15-2_2_e/configuration/guide/b_1522e_2960_2960c_2960s_2960sf_2960p_cg/b_1522e_2960_2960c_2960s_2960sf_2960p_cg_chapter_010010.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('078e5817-97ec-5f15-bf73-e040a7fdce7d', 2, 'IEEE 802.1Q — Bridges and Bridged Networks', null, 'IEEE', 'standard', null),
  ('5e78a1cc-d447-5987-a2c0-cff10b2c1045', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('5e78a1cc-d447-5987-a2c0-cff10b2c1045', 1, 'IEEE 802.1Q — Bridges and Bridged Networks', null, 'IEEE', 'standard', null),
  ('5e78a1cc-d447-5987-a2c0-cff10b2c1045', 2, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('19ad7725-4602-5b20-862c-1896f50516d3', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('19ad7725-4602-5b20-862c-1896f50516d3', 1, 'IEEE 802.1Q — Bridges and Bridged Networks', null, 'IEEE', 'standard', null),
  ('19ad7725-4602-5b20-862c-1896f50516d3', 2, 'Catalyst 2960 Software Configuration Guide 15.2(2)E — Configuring Optional Spanning-Tree Features', 'https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst2960/software/release/15-2_2_e/configuration/guide/b_1522e_2960_2960c_2960s_2960sf_2960p_cg/b_1522e_2960_2960c_2960s_2960sf_2960p_cg_chapter_010010.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('c929301e-ecaa-5e4a-a3a3-0cfcf6281c77', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('c929301e-ecaa-5e4a-a3a3-0cfcf6281c77', 1, 'Catalyst 2960 Software Configuration Guide 15.2(2)E — Configuring Optional Spanning-Tree Features', 'https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst2960/software/release/15-2_2_e/configuration/guide/b_1522e_2960_2960c_2960s_2960sf_2960p_cg/b_1522e_2960_2960c_2960s_2960sf_2960p_cg_chapter_010010.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('fb919662-a463-51e1-9f1b-94eb611d0f49', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('fb919662-a463-51e1-9f1b-94eb611d0f49', 1, 'Catalyst 2960 Software Configuration Guide 15.2(2)E — Configuring Optional Spanning-Tree Features', 'https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst2960/software/release/15-2_2_e/configuration/guide/b_1522e_2960_2960c_2960s_2960sf_2960p_cg/b_1522e_2960_2960c_2960s_2960sf_2960p_cg_chapter_010010.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('7c9d8143-ee1d-56f4-8dc2-4aeb1f3cb2b4', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('7c9d8143-ee1d-56f4-8dc2-4aeb1f3cb2b4', 1, 'EtherChannel Configuration Guide, Cisco IOS XE 17 (Catalyst 9000)', 'https://www.cisco.com/c/en/us/td/docs/switches/lan/c9000/lyr2-fwd/etherchannel/etherchannel-configuration-guide/m_ethernetchannel.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('7c9d8143-ee1d-56f4-8dc2-4aeb1f3cb2b4', 2, 'IEEE 802.1AX — Link Aggregation', null, 'IEEE', 'standard', null),
  ('b4a7a38b-659c-5422-aaa3-119c4cd6b869', 0, 'EtherChannel Configuration Guide, Cisco IOS XE 17 (Catalyst 9000)', 'https://www.cisco.com/c/en/us/td/docs/switches/lan/c9000/lyr2-fwd/etherchannel/etherchannel-configuration-guide/m_ethernetchannel.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('b4a7a38b-659c-5422-aaa3-119c4cd6b869', 1, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('31312177-9638-5483-a52d-1a553a958a4c', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('31312177-9638-5483-a52d-1a553a958a4c', 1, 'Catalyst 3750 Configuration Guide 15.0(2)SE — Configuring LLDP, LLDP-MED, and Wired Location Service', 'https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst3750/software/release/15-0_2_se/configuration/guide/scg3750/swlldp.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('31312177-9638-5483-a52d-1a553a958a4c', 2, 'Catalyst 3560 Configuration Guide 15.0(2)SE — Configuring CDP', 'https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst3560/software/release/15-0_2_se/configuration/guide/scg3560/swcdp.html', 'Cisco', 'vendor_docs', null),
  ('280aaced-4d95-556f-bba5-2bc86aa823da', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('280aaced-4d95-556f-bba5-2bc86aa823da', 1, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('be098602-8939-5896-a525-c8867527e7f4', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('be098602-8939-5896-a525-c8867527e7f4', 1, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('df479dab-854b-573d-8554-235c4540221e', 0, 'RFC 4632 — Classless Inter-domain Routing (CIDR)', 'https://www.rfc-editor.org/rfc/rfc4632.txt', 'RFC Editor', 'rfc', '2026-11-27'),
  ('df479dab-854b-573d-8554-235c4540221e', 1, 'RFC 791 — Internet Protocol', 'https://www.rfc-editor.org/rfc/rfc791', 'RFC Editor', 'rfc', '2026-11-27'),
  ('df479dab-854b-573d-8554-235c4540221e', 2, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('1fb6663f-73a9-532b-abd4-35a041912ab3', 0, 'RFC 4632 — Classless Inter-domain Routing (CIDR)', 'https://www.rfc-editor.org/rfc/rfc4632.txt', 'RFC Editor', 'rfc', '2026-11-27'),
  ('1fb6663f-73a9-532b-abd4-35a041912ab3', 1, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('cf69d04d-1dea-5c58-9cb8-7013ba67e62a', 0, 'RFC 4632 — Classless Inter-domain Routing (CIDR)', 'https://www.rfc-editor.org/rfc/rfc4632.txt', 'RFC Editor', 'rfc', '2026-11-27'),
  ('cf69d04d-1dea-5c58-9cb8-7013ba67e62a', 1, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('45145bca-b4dc-5d0e-b561-8c03cd24610b', 0, 'RFC 791 — Internet Protocol', 'https://www.rfc-editor.org/rfc/rfc791', 'RFC Editor', 'rfc', '2026-11-27'),
  ('45145bca-b4dc-5d0e-b561-8c03cd24610b', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('45145bca-b4dc-5d0e-b561-8c03cd24610b', 2, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('67333b75-0bae-57d6-a48a-f3bd5d318acb', 0, 'RFC 5952 — A Recommendation for IPv6 Address Text Representation', 'https://www.rfc-editor.org/info/rfc5952/', 'RFC Editor', 'rfc', '2026-11-27'),
  ('67333b75-0bae-57d6-a48a-f3bd5d318acb', 1, 'RFC 4291 — IP Version 6 Addressing Architecture', 'https://www.rfc-editor.org/rfc/rfc4291', 'RFC Editor', 'rfc', '2026-11-27'),
  ('588fd3db-064d-5429-90a1-2d39a6655df7', 0, 'RFC 4291 — IP Version 6 Addressing Architecture', 'https://www.rfc-editor.org/rfc/rfc4291', 'RFC Editor', 'rfc', '2026-11-27'),
  ('588fd3db-064d-5429-90a1-2d39a6655df7', 1, 'RFC 4861 — Neighbor Discovery for IP version 6 (IPv6)', 'https://rfc-editor.org/rfc/rfc4861', 'RFC Editor', 'rfc', '2026-11-27'),
  ('436e1cfb-339e-5ee1-90a7-84862b868b60', 0, 'RFC 4291 — IP Version 6 Addressing Architecture', 'https://www.rfc-editor.org/rfc/rfc4291', 'RFC Editor', 'rfc', '2026-11-27'),
  ('4cacfc2d-a645-50f3-ba69-3839736094ad', 0, 'RFC 4861 — Neighbor Discovery for IP version 6 (IPv6)', 'https://rfc-editor.org/rfc/rfc4861', 'RFC Editor', 'rfc', '2026-11-27'),
  ('4cacfc2d-a645-50f3-ba69-3839736094ad', 1, 'RFC 4862 — IPv6 Stateless Address Autoconfiguration', 'https://www.rfc-editor.org/rfc/rfc4862.html', 'RFC Editor', 'rfc', '2026-11-27'),
  ('e56facf2-5546-5db7-827c-942260ba899c', 0, 'Understand Administrative Distance', 'https://www.cisco.com/c/en/us/support/docs/ip/border-gateway-protocol-bgp/15986-admin-distance.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('e56facf2-5546-5db7-827c-942260ba899c', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('db8f5d45-4567-5c1b-8ae5-dc20be849810', 0, 'Understand Administrative Distance', 'https://www.cisco.com/c/en/us/support/docs/ip/border-gateway-protocol-bgp/15986-admin-distance.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('db8f5d45-4567-5c1b-8ae5-dc20be849810', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('db8f5d45-4567-5c1b-8ae5-dc20be849810', 2, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('c17b1b9a-ade1-5193-b29d-e48c69ccacb8', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('c17b1b9a-ade1-5193-b29d-e48c69ccacb8', 1, 'Understand Administrative Distance', 'https://www.cisco.com/c/en/us/support/docs/ip/border-gateway-protocol-bgp/15986-admin-distance.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('c17b1b9a-ade1-5193-b29d-e48c69ccacb8', 2, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('36633e1d-bddc-577d-bee3-e180a53eeb5c', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('36633e1d-bddc-577d-bee3-e180a53eeb5c', 1, 'Understand Administrative Distance', 'https://www.cisco.com/c/en/us/support/docs/ip/border-gateway-protocol-bgp/15986-admin-distance.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('f6757f1b-c0d8-5625-90d7-2240591736d1', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('f6757f1b-c0d8-5625-90d7-2240591736d1', 1, 'RFC 4291 — IP Version 6 Addressing Architecture', 'https://www.rfc-editor.org/rfc/rfc4291', 'RFC Editor', 'rfc', '2026-11-27'),
  ('ffd406f8-fd0d-5c61-b6c0-5221d55a6b62', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('ffd406f8-fd0d-5c61-b6c0-5221d55a6b62', 1, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('14ffc845-1de0-537d-85fd-b10a9685f7ff', 0, 'RFC 2328 — OSPF Version 2', 'https://www.rfc-editor.org/rfc/rfc2328.html', 'RFC Editor', 'rfc', null),
  ('14ffc845-1de0-537d-85fd-b10a9685f7ff', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('14ffc845-1de0-537d-85fd-b10a9685f7ff', 2, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('3b9bba2b-e3c4-5740-96d1-d8241a5ab713', 0, 'RFC 2328 — OSPF Version 2', 'https://www.rfc-editor.org/rfc/rfc2328.html', 'RFC Editor', 'rfc', null),
  ('3b9bba2b-e3c4-5740-96d1-d8241a5ab713', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('3b9bba2b-e3c4-5740-96d1-d8241a5ab713', 2, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('fbf39b97-630b-578c-858a-42239c8925cc', 0, 'RFC 2328 — OSPF Version 2', 'https://www.rfc-editor.org/rfc/rfc2328.html', 'RFC Editor', 'rfc', null),
  ('fbf39b97-630b-578c-858a-42239c8925cc', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('fbf39b97-630b-578c-858a-42239c8925cc', 2, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('00f947c6-9c0b-5e79-b092-ac96d6ca1434', 0, 'RFC 2328 — OSPF Version 2', 'https://www.rfc-editor.org/rfc/rfc2328.html', 'RFC Editor', 'rfc', null),
  ('00f947c6-9c0b-5e79-b092-ac96d6ca1434', 1, 'RFC 5340 — OSPF for IPv6', 'https://www.rfc-editor.org/rfc/rfc5340.html', 'RFC Editor', 'rfc', '2026-11-27'),
  ('00f947c6-9c0b-5e79-b092-ac96d6ca1434', 2, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('81d555a3-f2bb-5df3-8872-fd39ae63611c', 0, 'RFC 2328 — OSPF Version 2', 'https://www.rfc-editor.org/rfc/rfc2328.html', 'RFC Editor', 'rfc', null),
  ('81d555a3-f2bb-5df3-8872-fd39ae63611c', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('81d555a3-f2bb-5df3-8872-fd39ae63611c', 2, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('2285243a-cf60-5402-ac43-bd59eb5f8583', 0, 'RFC 2328 — OSPF Version 2', 'https://www.rfc-editor.org/rfc/rfc2328.html', 'RFC Editor', 'rfc', null),
  ('2285243a-cf60-5402-ac43-bd59eb5f8583', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('2285243a-cf60-5402-ac43-bd59eb5f8583', 2, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('36a14c81-1b3a-5496-b6a4-3538123c71c6', 0, 'RFC 5340 — OSPF for IPv6', 'https://www.rfc-editor.org/rfc/rfc5340.html', 'RFC Editor', 'rfc', '2026-11-27'),
  ('36a14c81-1b3a-5496-b6a4-3538123c71c6', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('1eda16c4-b633-5954-b191-7423f09dffe5', 0, 'RFC 2281 — Cisco Hot Standby Router Protocol (HSRP)', 'https://www.rfc-editor.org/rfc/rfc2281.txt', 'RFC Editor', 'rfc', '2026-11-27'),
  ('1eda16c4-b633-5954-b191-7423f09dffe5', 1, 'RFC 9568 — Virtual Router Redundancy Protocol (VRRP) Version 3 for IPv4 and IPv6', 'https://www.rfc-editor.org/rfc/rfc9568.html', 'RFC Editor', 'rfc', '2026-11-27'),
  ('1eda16c4-b633-5954-b191-7423f09dffe5', 2, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('20c22bf3-b697-5fdf-ab9c-acc284c00eed', 0, 'RFC 2281 — Cisco Hot Standby Router Protocol (HSRP)', 'https://www.rfc-editor.org/rfc/rfc2281.txt', 'RFC Editor', 'rfc', '2026-11-27'),
  ('20c22bf3-b697-5fdf-ab9c-acc284c00eed', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152', 0, 'RFC 3022 — Traditional IP Network Address Translator (Traditional NAT)', 'https://www.rfc-editor.org/rfc/rfc3022.html', 'RFC Editor', 'rfc', '2026-11-27'),
  ('449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152', 1, 'IP Addressing Configuration Guide, Cisco IOS XE 17.x — Configuring NAT for IP Address Conservation', 'https://www.cisco.com/c/en/us/td/docs/routers/ios/config/17-x/ip-addressing/b-ip-addressing/m_iadnat-addr-consv-xe.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152', 2, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('8eef167f-6d28-54d1-9e17-8bf5908d06b3', 0, 'IP Addressing Configuration Guide, Cisco IOS XE 17.x — Configuring NAT for IP Address Conservation', 'https://www.cisco.com/c/en/us/td/docs/routers/ios/config/17-x/ip-addressing/b-ip-addressing/m_iadnat-addr-consv-xe.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('8eef167f-6d28-54d1-9e17-8bf5908d06b3', 1, 'RFC 3022 — Traditional IP Network Address Translator (Traditional NAT)', 'https://www.rfc-editor.org/rfc/rfc3022.html', 'RFC Editor', 'rfc', '2026-11-27'),
  ('8eef167f-6d28-54d1-9e17-8bf5908d06b3', 2, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('0a475bf0-007c-5558-b4e1-4879f1557116', 0, 'IP Addressing Configuration Guide, Cisco IOS XE 17.x — Configuring NAT for IP Address Conservation', 'https://www.cisco.com/c/en/us/td/docs/routers/ios/config/17-x/ip-addressing/b-ip-addressing/m_iadnat-addr-consv-xe.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('0a475bf0-007c-5558-b4e1-4879f1557116', 1, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('8035bedc-7639-5358-a7ce-bf2dd7c6f984', 0, 'RFC 2131 — Dynamic Host Configuration Protocol', 'https://www.rfc-editor.org/rfc/rfc2131', 'RFC Editor', 'rfc', '2026-11-27'),
  ('8035bedc-7639-5358-a7ce-bf2dd7c6f984', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('8035bedc-7639-5358-a7ce-bf2dd7c6f984', 2, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('075a52d9-9c2d-54d8-8c6a-dd50e28243c6', 0, 'RFC 2131 — Dynamic Host Configuration Protocol', 'https://www.rfc-editor.org/rfc/rfc2131', 'RFC Editor', 'rfc', '2026-11-27'),
  ('075a52d9-9c2d-54d8-8c6a-dd50e28243c6', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('3aa005c1-b264-58dc-86d1-bd787e242596', 0, 'RFC 1035 — Domain Names — Implementation and Specification', 'https://www.rfc-editor.org/rfc/rfc1035', 'RFC Editor', 'rfc', '2026-11-27'),
  ('3aa005c1-b264-58dc-86d1-bd787e242596', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('78a39a80-291a-5670-b8ca-b8f8f73f1d89', 0, 'Configure Commonly Used IP ACLs', 'https://www.cisco.com/c/en/us/support/docs/ip/access-lists/26448-ACLsamples.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('78a39a80-291a-5670-b8ca-b8f8f73f1d89', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('78a39a80-291a-5670-b8ca-b8f8f73f1d89', 2, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('8109621d-9488-5492-9efa-13b66f3015f3', 0, 'Configure Commonly Used IP ACLs', 'https://www.cisco.com/c/en/us/support/docs/ip/access-lists/26448-ACLsamples.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('8109621d-9488-5492-9efa-13b66f3015f3', 1, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('b77ab9ed-dd5c-5582-8f93-f52885da90e1', 0, 'Configure Commonly Used IP ACLs', 'https://www.cisco.com/c/en/us/support/docs/ip/access-lists/26448-ACLsamples.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('b77ab9ed-dd5c-5582-8f93-f52885da90e1', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('b77ab9ed-dd5c-5582-8f93-f52885da90e1', 2, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('5d131b49-d63b-56b3-ad08-34a0dbac9926', 0, 'Security Configuration Guide, Cisco IOS 15.2(7)Ex (Catalyst 2960-L) — Port Security', 'https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst2960l/software/15-2_7_e/configuration_guide/sec/b_1527e_security_2960l_cg/port_security.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('5d131b49-d63b-56b3-ad08-34a0dbac9926', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728', 0, 'Catalyst 2960-Plus/2960-C Configuration Guide 15.2(3)E — Configuring DHCP', 'https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst2960/software/release/15-2_3_e/consolidated_guide/b_1523e_2960p_2960c_cg/m_1522e_sec_dhcp_2960_cg.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('35bedb68-10ff-55ac-b2a6-9c958cbca79e', 0, 'Security Configuration Guide, Cisco IOS XE 17.8.x (Catalyst 9300) — Configuring Dynamic ARP Inspection', 'https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst9300/software/release/17-8/configuration_guide/sec/b_178_sec_9300_cg/configuring_dynamic_arp_inspection.html', 'Cisco', 'vendor_docs', '2026-11-27'),
  ('35bedb68-10ff-55ac-b2a6-9c958cbca79e', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('93d8fe55-e868-50cd-bf37-c2edeafdcb47', 0, 'RFC 6105 — IPv6 Router Advertisement Guard', 'https://www.rfc-editor.org/info/rfc6105/', 'RFC Editor', 'rfc', '2026-11-27'),
  ('93d8fe55-e868-50cd-bf37-c2edeafdcb47', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('816c4e9d-4e7c-5254-9f18-bfcc030d5095', 0, 'RFC 4253 — The Secure Shell (SSH) Transport Layer Protocol', 'https://www.rfc-editor.org/rfc/rfc4253.html', 'RFC Editor', 'rfc', '2026-11-27'),
  ('816c4e9d-4e7c-5254-9f18-bfcc030d5095', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('816c4e9d-4e7c-5254-9f18-bfcc030d5095', 2, 'Free CCNA 200-301 course (riferimento di studio di Lorenzo)', null, 'Jeremy''s IT Lab', 'course', null),
  ('13c2c721-2ea4-5ed4-91af-3d9f30800af5', 0, 'RFC 8907 — The TACACS+ Protocol', 'https://www.rfc-editor.org/info/rfc8907/', 'RFC Editor', 'rfc', '2026-11-27'),
  ('13c2c721-2ea4-5ed4-91af-3d9f30800af5', 1, 'RFC 2865 — Remote Authentication Dial In User Service (RADIUS)', 'https://www.rfc-editor.org/rfc/rfc2865.txt', 'RFC Editor', 'rfc', '2026-11-27'),
  ('13c2c721-2ea4-5ed4-91af-3d9f30800af5', 2, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('dc8482bb-6869-5202-909a-8de3b9530442', 0, 'RFC 4253 — The Secure Shell (SSH) Transport Layer Protocol', 'https://www.rfc-editor.org/rfc/rfc4253.html', 'RFC Editor', 'rfc', '2026-11-27'),
  ('dc8482bb-6869-5202-909a-8de3b9530442', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('09a8d6ec-71af-5c14-bdfe-41242583ef9b', 0, 'RFC 4301 — Security Architecture for the Internet Protocol', 'https://www.rfc-editor.org/rfc/rfc4301.txt', 'RFC Editor', 'rfc', '2026-11-27'),
  ('09a8d6ec-71af-5c14-bdfe-41242583ef9b', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('09324d70-e863-5a05-b891-81d95bd17f1c', 0, 'RFC 5424 — The Syslog Protocol', 'https://www.rfc-editor.org/rfc/rfc5424.html', 'RFC Editor', 'rfc', '2026-11-27'),
  ('09324d70-e863-5a05-b891-81d95bd17f1c', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('54ff5635-fecc-5042-acba-b3c69590f70f', 0, 'RFC 3416 — Version 2 of the Protocol Operations for SNMP', 'https://rfc-editor.org/rfc/rfc3416', 'RFC Editor', 'rfc', '2026-11-27'),
  ('54ff5635-fecc-5042-acba-b3c69590f70f', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('9a4610c6-6a22-5496-916e-9fd15656e371', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('8840c908-6860-592f-bc95-deff22d874b4', 0, 'cisco.ios.ios_command module', 'https://docs.ansible.com/projects/ansible/latest/collections/cisco/ios/ios_command_module.html', 'Ansible Community Documentation', 'vendor_docs', '2026-11-27'),
  ('8840c908-6860-592f-bc95-deff22d874b4', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('c8bde22b-8ea9-56d5-88ac-e862213a5017', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('ddfdd16f-1d44-53f5-a5cc-35037d614b48', 0, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('55c767e2-841b-5003-b493-023452c32dd8', 0, 'IEEE 802.11 — Wireless LAN Medium Access Control and Physical Layer Specifications', null, 'IEEE', 'standard', null),
  ('55c767e2-841b-5003-b493-023452c32dd8', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('a1aa299b-b36b-5086-9d1d-53515fdb542c', 0, 'IEEE 802.11 — Wireless LAN Medium Access Control and Physical Layer Specifications', null, 'IEEE', 'standard', null),
  ('a1aa299b-b36b-5086-9d1d-53515fdb542c', 1, 'RFC 2865 — Remote Authentication Dial In User Service (RADIUS)', 'https://www.rfc-editor.org/rfc/rfc2865.txt', 'RFC Editor', 'rfc', '2026-11-27'),
  ('a1aa299b-b36b-5086-9d1d-53515fdb542c', 2, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27'),
  ('ede7ab03-ea04-5ffd-8865-0c143e3bbffe', 0, 'IEEE 802.11 — Wireless LAN Medium Access Control and Physical Layer Specifications', null, 'IEEE', 'standard', null),
  ('ede7ab03-ea04-5ffd-8865-0c143e3bbffe', 1, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27');

insert into public.content_relations (content_id, related_id) values
  ('cb0ed29e-3d26-5e98-b360-23fb97c984aa', 'dffaabcf-a56e-534d-a38c-842ff9792b6a'),
  ('cb0ed29e-3d26-5e98-b360-23fb97c984aa', 'bc911fd7-e523-599f-a19d-54fd2993b410'),
  ('680d75cd-a68c-57fa-9c41-1e35f2b23289', 'd5c4cbdd-ac9a-59ad-a954-c10a7b014867'),
  ('680d75cd-a68c-57fa-9c41-1e35f2b23289', 'cb0ed29e-3d26-5e98-b360-23fb97c984aa'),
  ('d5c4cbdd-ac9a-59ad-a954-c10a7b014867', 'dffaabcf-a56e-534d-a38c-842ff9792b6a'),
  ('d5c4cbdd-ac9a-59ad-a954-c10a7b014867', '680d75cd-a68c-57fa-9c41-1e35f2b23289'),
  ('dffaabcf-a56e-534d-a38c-842ff9792b6a', '155166f9-ff64-5536-a48a-567fe28dc070'),
  ('dffaabcf-a56e-534d-a38c-842ff9792b6a', 'd5c4cbdd-ac9a-59ad-a954-c10a7b014867'),
  ('155166f9-ff64-5536-a48a-567fe28dc070', 'dffaabcf-a56e-534d-a38c-842ff9792b6a'),
  ('23525bc3-5cd3-5714-9998-75e73e7587e9', '33c79380-e583-5727-aff9-910497dbc6f0'),
  ('9a88255c-bfdb-5e9b-aba4-affc0270c6d4', '680d75cd-a68c-57fa-9c41-1e35f2b23289'),
  ('9a88255c-bfdb-5e9b-aba4-affc0270c6d4', '0eff06c7-01d8-5299-be8d-34de078f7b8b'),
  ('0eff06c7-01d8-5299-be8d-34de078f7b8b', '9a88255c-bfdb-5e9b-aba4-affc0270c6d4'),
  ('0eff06c7-01d8-5299-be8d-34de078f7b8b', 'bc911fd7-e523-599f-a19d-54fd2993b410'),
  ('3305bbc1-e089-51b2-9c84-a7425949b96b', '00702e75-7c76-53b2-ae62-8e735e8d9c77'),
  ('00702e75-7c76-53b2-ae62-8e735e8d9c77', '3305bbc1-e089-51b2-9c84-a7425949b96b'),
  ('00702e75-7c76-53b2-ae62-8e735e8d9c77', 'a483047e-e685-5e1c-964f-c2de0a4c7c49'),
  ('33c79380-e583-5727-aff9-910497dbc6f0', '23525bc3-5cd3-5714-9998-75e73e7587e9'),
  ('33c79380-e583-5727-aff9-910497dbc6f0', '00702e75-7c76-53b2-ae62-8e735e8d9c77'),
  ('a483047e-e685-5e1c-964f-c2de0a4c7c49', '00702e75-7c76-53b2-ae62-8e735e8d9c77'),
  ('191e7924-adde-5d9e-b1b2-21480459a5ca', 'cb0ed29e-3d26-5e98-b360-23fb97c984aa'),
  ('bc911fd7-e523-599f-a19d-54fd2993b410', '0eff06c7-01d8-5299-be8d-34de078f7b8b'),
  ('bc911fd7-e523-599f-a19d-54fd2993b410', 'cb0ed29e-3d26-5e98-b360-23fb97c984aa'),
  ('d382335d-a200-525f-9120-15334aa1f322', 'a91010c7-1bb6-535b-9004-7f3fb7668ba1'),
  ('d382335d-a200-525f-9120-15334aa1f322', '85454276-0723-52d6-ba26-7a94ef15aa46'),
  ('d382335d-a200-525f-9120-15334aa1f322', 'cb0ed29e-3d26-5e98-b360-23fb97c984aa'),
  ('a91010c7-1bb6-535b-9004-7f3fb7668ba1', 'd382335d-a200-525f-9120-15334aa1f322'),
  ('a91010c7-1bb6-535b-9004-7f3fb7668ba1', '85454276-0723-52d6-ba26-7a94ef15aa46'),
  ('85454276-0723-52d6-ba26-7a94ef15aa46', 'd0939326-daf8-5b17-882a-38d4ab290ae2'),
  ('85454276-0723-52d6-ba26-7a94ef15aa46', '515d68b9-e263-5df9-882c-a1571f1073fa'),
  ('85454276-0723-52d6-ba26-7a94ef15aa46', 'a91010c7-1bb6-535b-9004-7f3fb7668ba1'),
  ('d0939326-daf8-5b17-882a-38d4ab290ae2', '85454276-0723-52d6-ba26-7a94ef15aa46'),
  ('d0939326-daf8-5b17-882a-38d4ab290ae2', '515d68b9-e263-5df9-882c-a1571f1073fa'),
  ('515d68b9-e263-5df9-882c-a1571f1073fa', '85454276-0723-52d6-ba26-7a94ef15aa46'),
  ('515d68b9-e263-5df9-882c-a1571f1073fa', 'd0939326-daf8-5b17-882a-38d4ab290ae2'),
  ('6ea16f93-12c0-5293-bdbe-5f63f369fdac', 'cf331cd3-a550-5c6b-ae59-f8151d3b9355'),
  ('6ea16f93-12c0-5293-bdbe-5f63f369fdac', '85454276-0723-52d6-ba26-7a94ef15aa46'),
  ('cf331cd3-a550-5c6b-ae59-f8151d3b9355', '6ea16f93-12c0-5293-bdbe-5f63f369fdac'),
  ('cf331cd3-a550-5c6b-ae59-f8151d3b9355', 'd382335d-a200-525f-9120-15334aa1f322'),
  ('078e5817-97ec-5f15-bf73-e040a7fdce7d', '5e78a1cc-d447-5987-a2c0-cff10b2c1045'),
  ('078e5817-97ec-5f15-bf73-e040a7fdce7d', '19ad7725-4602-5b20-862c-1896f50516d3'),
  ('078e5817-97ec-5f15-bf73-e040a7fdce7d', 'dffaabcf-a56e-534d-a38c-842ff9792b6a'),
  ('5e78a1cc-d447-5987-a2c0-cff10b2c1045', '078e5817-97ec-5f15-bf73-e040a7fdce7d'),
  ('5e78a1cc-d447-5987-a2c0-cff10b2c1045', '19ad7725-4602-5b20-862c-1896f50516d3'),
  ('19ad7725-4602-5b20-862c-1896f50516d3', '5e78a1cc-d447-5987-a2c0-cff10b2c1045'),
  ('19ad7725-4602-5b20-862c-1896f50516d3', 'c929301e-ecaa-5e4a-a3a3-0cfcf6281c77'),
  ('c929301e-ecaa-5e4a-a3a3-0cfcf6281c77', 'fb919662-a463-51e1-9f1b-94eb611d0f49'),
  ('c929301e-ecaa-5e4a-a3a3-0cfcf6281c77', '19ad7725-4602-5b20-862c-1896f50516d3'),
  ('fb919662-a463-51e1-9f1b-94eb611d0f49', 'c929301e-ecaa-5e4a-a3a3-0cfcf6281c77'),
  ('fb919662-a463-51e1-9f1b-94eb611d0f49', '5e78a1cc-d447-5987-a2c0-cff10b2c1045'),
  ('7c9d8143-ee1d-56f4-8dc2-4aeb1f3cb2b4', 'b4a7a38b-659c-5422-aaa3-119c4cd6b869'),
  ('7c9d8143-ee1d-56f4-8dc2-4aeb1f3cb2b4', '078e5817-97ec-5f15-bf73-e040a7fdce7d'),
  ('b4a7a38b-659c-5422-aaa3-119c4cd6b869', '7c9d8143-ee1d-56f4-8dc2-4aeb1f3cb2b4'),
  ('31312177-9638-5483-a52d-1a553a958a4c', '191e7924-adde-5d9e-b1b2-21480459a5ca'),
  ('280aaced-4d95-556f-bba5-2bc86aa823da', 'be098602-8939-5896-a525-c8867527e7f4'),
  ('be098602-8939-5896-a525-c8867527e7f4', '280aaced-4d95-556f-bba5-2bc86aa823da'),
  ('df479dab-854b-573d-8554-235c4540221e', 'cf69d04d-1dea-5c58-9cb8-7013ba67e62a'),
  ('df479dab-854b-573d-8554-235c4540221e', '23525bc3-5cd3-5714-9998-75e73e7587e9'),
  ('1fb6663f-73a9-532b-abd4-35a041912ab3', 'df479dab-854b-573d-8554-235c4540221e'),
  ('1fb6663f-73a9-532b-abd4-35a041912ab3', 'cf69d04d-1dea-5c58-9cb8-7013ba67e62a'),
  ('cf69d04d-1dea-5c58-9cb8-7013ba67e62a', 'df479dab-854b-573d-8554-235c4540221e'),
  ('cf69d04d-1dea-5c58-9cb8-7013ba67e62a', '1fb6663f-73a9-532b-abd4-35a041912ab3'),
  ('45145bca-b4dc-5d0e-b561-8c03cd24610b', '9a88255c-bfdb-5e9b-aba4-affc0270c6d4'),
  ('45145bca-b4dc-5d0e-b561-8c03cd24610b', '33c79380-e583-5727-aff9-910497dbc6f0'),
  ('67333b75-0bae-57d6-a48a-f3bd5d318acb', '588fd3db-064d-5429-90a1-2d39a6655df7'),
  ('67333b75-0bae-57d6-a48a-f3bd5d318acb', '436e1cfb-339e-5ee1-90a7-84862b868b60'),
  ('588fd3db-064d-5429-90a1-2d39a6655df7', '67333b75-0bae-57d6-a48a-f3bd5d318acb'),
  ('588fd3db-064d-5429-90a1-2d39a6655df7', '4cacfc2d-a645-50f3-ba69-3839736094ad'),
  ('436e1cfb-339e-5ee1-90a7-84862b868b60', '67333b75-0bae-57d6-a48a-f3bd5d318acb'),
  ('436e1cfb-339e-5ee1-90a7-84862b868b60', '4cacfc2d-a645-50f3-ba69-3839736094ad'),
  ('4cacfc2d-a645-50f3-ba69-3839736094ad', '588fd3db-064d-5429-90a1-2d39a6655df7'),
  ('4cacfc2d-a645-50f3-ba69-3839736094ad', '436e1cfb-339e-5ee1-90a7-84862b868b60'),
  ('4cacfc2d-a645-50f3-ba69-3839736094ad', '93d8fe55-e868-50cd-bf37-c2edeafdcb47'),
  ('e56facf2-5546-5db7-827c-942260ba899c', 'bc911fd7-e523-599f-a19d-54fd2993b410'),
  ('e56facf2-5546-5db7-827c-942260ba899c', 'db8f5d45-4567-5c1b-8ae5-dc20be849810'),
  ('e56facf2-5546-5db7-827c-942260ba899c', '36633e1d-bddc-577d-bee3-e180a53eeb5c'),
  ('db8f5d45-4567-5c1b-8ae5-dc20be849810', 'e56facf2-5546-5db7-827c-942260ba899c'),
  ('db8f5d45-4567-5c1b-8ae5-dc20be849810', 'bc911fd7-e523-599f-a19d-54fd2993b410'),
  ('db8f5d45-4567-5c1b-8ae5-dc20be849810', 'c17b1b9a-ade1-5193-b29d-e48c69ccacb8'),
  ('c17b1b9a-ade1-5193-b29d-e48c69ccacb8', '36633e1d-bddc-577d-bee3-e180a53eeb5c'),
  ('c17b1b9a-ade1-5193-b29d-e48c69ccacb8', 'f6757f1b-c0d8-5625-90d7-2240591736d1'),
  ('c17b1b9a-ade1-5193-b29d-e48c69ccacb8', 'db8f5d45-4567-5c1b-8ae5-dc20be849810'),
  ('36633e1d-bddc-577d-bee3-e180a53eeb5c', 'e56facf2-5546-5db7-827c-942260ba899c'),
  ('36633e1d-bddc-577d-bee3-e180a53eeb5c', 'c17b1b9a-ade1-5193-b29d-e48c69ccacb8'),
  ('f6757f1b-c0d8-5625-90d7-2240591736d1', 'c17b1b9a-ade1-5193-b29d-e48c69ccacb8'),
  ('f6757f1b-c0d8-5625-90d7-2240591736d1', '588fd3db-064d-5429-90a1-2d39a6655df7'),
  ('ffd406f8-fd0d-5c61-b6c0-5221d55a6b62', 'c17b1b9a-ade1-5193-b29d-e48c69ccacb8'),
  ('ffd406f8-fd0d-5c61-b6c0-5221d55a6b62', '0eff06c7-01d8-5299-be8d-34de078f7b8b'),
  ('14ffc845-1de0-537d-85fd-b10a9685f7ff', '3b9bba2b-e3c4-5740-96d1-d8241a5ab713'),
  ('14ffc845-1de0-537d-85fd-b10a9685f7ff', '81d555a3-f2bb-5df3-8872-fd39ae63611c'),
  ('14ffc845-1de0-537d-85fd-b10a9685f7ff', 'e56facf2-5546-5db7-827c-942260ba899c'),
  ('3b9bba2b-e3c4-5740-96d1-d8241a5ab713', 'fbf39b97-630b-578c-858a-42239c8925cc'),
  ('3b9bba2b-e3c4-5740-96d1-d8241a5ab713', '2285243a-cf60-5402-ac43-bd59eb5f8583'),
  ('3b9bba2b-e3c4-5740-96d1-d8241a5ab713', '14ffc845-1de0-537d-85fd-b10a9685f7ff'),
  ('fbf39b97-630b-578c-858a-42239c8925cc', '3b9bba2b-e3c4-5740-96d1-d8241a5ab713'),
  ('fbf39b97-630b-578c-858a-42239c8925cc', '00f947c6-9c0b-5e79-b092-ac96d6ca1434'),
  ('00f947c6-9c0b-5e79-b092-ac96d6ca1434', 'fbf39b97-630b-578c-858a-42239c8925cc'),
  ('00f947c6-9c0b-5e79-b092-ac96d6ca1434', '36a14c81-1b3a-5496-b6a4-3538123c71c6'),
  ('81d555a3-f2bb-5df3-8872-fd39ae63611c', '3b9bba2b-e3c4-5740-96d1-d8241a5ab713'),
  ('81d555a3-f2bb-5df3-8872-fd39ae63611c', '2285243a-cf60-5402-ac43-bd59eb5f8583'),
  ('81d555a3-f2bb-5df3-8872-fd39ae63611c', '8109621d-9488-5492-9efa-13b66f3015f3'),
  ('2285243a-cf60-5402-ac43-bd59eb5f8583', '3b9bba2b-e3c4-5740-96d1-d8241a5ab713'),
  ('2285243a-cf60-5402-ac43-bd59eb5f8583', '81d555a3-f2bb-5df3-8872-fd39ae63611c'),
  ('36a14c81-1b3a-5496-b6a4-3538123c71c6', '81d555a3-f2bb-5df3-8872-fd39ae63611c'),
  ('36a14c81-1b3a-5496-b6a4-3538123c71c6', '00f947c6-9c0b-5e79-b092-ac96d6ca1434'),
  ('36a14c81-1b3a-5496-b6a4-3538123c71c6', '588fd3db-064d-5429-90a1-2d39a6655df7'),
  ('1eda16c4-b633-5954-b191-7423f09dffe5', '20c22bf3-b697-5fdf-ab9c-acc284c00eed'),
  ('1eda16c4-b633-5954-b191-7423f09dffe5', '9a88255c-bfdb-5e9b-aba4-affc0270c6d4'),
  ('20c22bf3-b697-5fdf-ab9c-acc284c00eed', '1eda16c4-b633-5954-b191-7423f09dffe5'),
  ('449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152', '8eef167f-6d28-54d1-9e17-8bf5908d06b3'),
  ('449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152', '23525bc3-5cd3-5714-9998-75e73e7587e9'),
  ('8eef167f-6d28-54d1-9e17-8bf5908d06b3', '449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152'),
  ('8eef167f-6d28-54d1-9e17-8bf5908d06b3', '0a475bf0-007c-5558-b4e1-4879f1557116'),
  ('0a475bf0-007c-5558-b4e1-4879f1557116', '8eef167f-6d28-54d1-9e17-8bf5908d06b3'),
  ('8035bedc-7639-5358-a7ce-bf2dd7c6f984', '33c79380-e583-5727-aff9-910497dbc6f0'),
  ('8035bedc-7639-5358-a7ce-bf2dd7c6f984', '075a52d9-9c2d-54d8-8c6a-dd50e28243c6'),
  ('8035bedc-7639-5358-a7ce-bf2dd7c6f984', 'cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728'),
  ('075a52d9-9c2d-54d8-8c6a-dd50e28243c6', '8035bedc-7639-5358-a7ce-bf2dd7c6f984'),
  ('075a52d9-9c2d-54d8-8c6a-dd50e28243c6', '33c79380-e583-5727-aff9-910497dbc6f0'),
  ('3aa005c1-b264-58dc-86d1-bd787e242596', 'a483047e-e685-5e1c-964f-c2de0a4c7c49'),
  ('78a39a80-291a-5670-b8ca-b8f8f73f1d89', '8109621d-9488-5492-9efa-13b66f3015f3'),
  ('78a39a80-291a-5670-b8ca-b8f8f73f1d89', 'b77ab9ed-dd5c-5582-8f93-f52885da90e1'),
  ('8109621d-9488-5492-9efa-13b66f3015f3', '78a39a80-291a-5670-b8ca-b8f8f73f1d89'),
  ('8109621d-9488-5492-9efa-13b66f3015f3', 'b77ab9ed-dd5c-5582-8f93-f52885da90e1'),
  ('8109621d-9488-5492-9efa-13b66f3015f3', '81d555a3-f2bb-5df3-8872-fd39ae63611c'),
  ('b77ab9ed-dd5c-5582-8f93-f52885da90e1', '78a39a80-291a-5670-b8ca-b8f8f73f1d89'),
  ('b77ab9ed-dd5c-5582-8f93-f52885da90e1', '8109621d-9488-5492-9efa-13b66f3015f3'),
  ('5d131b49-d63b-56b3-ad08-34a0dbac9926', 'cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728'),
  ('5d131b49-d63b-56b3-ad08-34a0dbac9926', 'c929301e-ecaa-5e4a-a3a3-0cfcf6281c77'),
  ('cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728', '35bedb68-10ff-55ac-b2a6-9c958cbca79e'),
  ('cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728', '33c79380-e583-5727-aff9-910497dbc6f0'),
  ('cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728', '5d131b49-d63b-56b3-ad08-34a0dbac9926'),
  ('35bedb68-10ff-55ac-b2a6-9c958cbca79e', 'cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728'),
  ('35bedb68-10ff-55ac-b2a6-9c958cbca79e', '9a88255c-bfdb-5e9b-aba4-affc0270c6d4'),
  ('93d8fe55-e868-50cd-bf37-c2edeafdcb47', '4cacfc2d-a645-50f3-ba69-3839736094ad'),
  ('93d8fe55-e868-50cd-bf37-c2edeafdcb47', '078e5817-97ec-5f15-bf73-e040a7fdce7d'),
  ('816c4e9d-4e7c-5254-9f18-bfcc030d5095', '13c2c721-2ea4-5ed4-91af-3d9f30800af5'),
  ('816c4e9d-4e7c-5254-9f18-bfcc030d5095', 'dc8482bb-6869-5202-909a-8de3b9530442'),
  ('13c2c721-2ea4-5ed4-91af-3d9f30800af5', '816c4e9d-4e7c-5254-9f18-bfcc030d5095'),
  ('dc8482bb-6869-5202-909a-8de3b9530442', '816c4e9d-4e7c-5254-9f18-bfcc030d5095'),
  ('dc8482bb-6869-5202-909a-8de3b9530442', '191e7924-adde-5d9e-b1b2-21480459a5ca'),
  ('09a8d6ec-71af-5c14-bdfe-41242583ef9b', '449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152'),
  ('09324d70-e863-5a05-b891-81d95bd17f1c', '54ff5635-fecc-5042-acba-b3c69590f70f'),
  ('09324d70-e863-5a05-b891-81d95bd17f1c', '191e7924-adde-5d9e-b1b2-21480459a5ca'),
  ('54ff5635-fecc-5042-acba-b3c69590f70f', '09324d70-e863-5a05-b891-81d95bd17f1c'),
  ('54ff5635-fecc-5042-acba-b3c69590f70f', '9a4610c6-6a22-5496-916e-9fd15656e371'),
  ('9a4610c6-6a22-5496-916e-9fd15656e371', '8840c908-6860-592f-bc95-deff22d874b4'),
  ('9a4610c6-6a22-5496-916e-9fd15656e371', 'c8bde22b-8ea9-56d5-88ac-e862213a5017'),
  ('8840c908-6860-592f-bc95-deff22d874b4', '9a4610c6-6a22-5496-916e-9fd15656e371'),
  ('c8bde22b-8ea9-56d5-88ac-e862213a5017', '9a4610c6-6a22-5496-916e-9fd15656e371'),
  ('c8bde22b-8ea9-56d5-88ac-e862213a5017', '8840c908-6860-592f-bc95-deff22d874b4'),
  ('ddfdd16f-1d44-53f5-a5cc-35037d614b48', '85454276-0723-52d6-ba26-7a94ef15aa46'),
  ('55c767e2-841b-5003-b493-023452c32dd8', 'a1aa299b-b36b-5086-9d1d-53515fdb542c'),
  ('55c767e2-841b-5003-b493-023452c32dd8', 'ede7ab03-ea04-5ffd-8865-0c143e3bbffe'),
  ('a1aa299b-b36b-5086-9d1d-53515fdb542c', '55c767e2-841b-5003-b493-023452c32dd8'),
  ('a1aa299b-b36b-5086-9d1d-53515fdb542c', '13c2c721-2ea4-5ed4-91af-3d9f30800af5'),
  ('ede7ab03-ea04-5ffd-8865-0c143e3bbffe', '55c767e2-841b-5003-b493-023452c32dd8');

insert into public.recall_prompts (id, content_id, key, position, prompt, answer, key_points, common_mistakes) values
  ('da0798ff-a034-5cdc-8335-a549b50ecb09', 'cb0ed29e-3d26-5e98-b360-23fb97c984aa', 'broadcast', 0, 'Perché un router separa i Broadcast Domain mentre uno switch no?', 'Uno switch inoltra i frame broadcast (destinazione FF:FF:FF:FF:FF:FF) su tutte le porte della stessa VLAN, quindi tutti gli host della VLAN condividono lo stesso Broadcast Domain. Un router invece non inoltra i broadcast di livello 2 da un''interfaccia all''altra: ogni interfaccia del router delimita un Broadcast Domain diverso.', array['Lo switch fa flooding dei broadcast nella VLAN', 'Il router non inoltra i broadcast tra interfacce', 'Ogni interfaccia del router è un Broadcast Domain separato']::text[], array['Pensare che lo switch separi i Broadcast Domain: separa i Collision Domain (una porta = un Collision Domain), non i Broadcast Domain']::text[]),
  ('c8b97076-987c-51f2-b009-a5a45fc7525d', '680d75cd-a68c-57fa-9c41-1e35f2b23289', 'mac-change', 0, 'Un pacchetto attraversa due router per raggiungere un server. Quali indirizzi cambiano a ogni hop e quali restano uguali? Perché?', 'Cambiano i MAC address di origine e destinazione, perché ogni router de-incapsula il frame ricevuto e ne costruisce uno nuovo per il collegamento successivo, usando il proprio MAC come origine e il MAC del next hop come destinazione. Restano invariati gli indirizzi IP di origine e destinazione, che identificano gli estremi della comunicazione (in assenza di NAT). Il router modifica comunque alcuni campi dell''header IP, come il TTL.', array['I MAC address hanno validità solo sul singolo collegamento', 'Gli indirizzi IP identificano gli estremi end-to-end', 'Il router ricostruisce il frame a ogni hop', 'Il TTL viene decrementato a ogni hop']::text[], array['Pensare che il MAC di destinazione sia quello del server remoto: è quello del next hop (spesso il Default Gateway)']::text[]),
  ('eb7658d5-f676-559e-8871-c9905ffa6dbf', 'd5c4cbdd-ac9a-59ad-a954-c10a7b014867', 'min-size', 0, 'Perché un frame Ethernet ha una dimensione minima di 64 byte e da quali campi è composta?', 'I 64 byte si ottengono da header (Destination MAC 6 + Source MAC 6 + Type 2 = 14 byte), payload minimo di 46 byte e FCS di 4 byte. Preamble e SFD non sono conteggiati. Se il payload è più corto di 46 byte viene aggiunto padding. Il minimo deriva storicamente dalla necessità di rilevare le collisioni nelle reti half-duplex condivise.', array['14 + 46 + 4 = 64 byte', 'Preamble e SFD esclusi dal conteggio', 'Payload corto ⇒ padding', 'Frame sotto i 64 byte = runt']::text[], array['Includere preamble e SFD nel calcolo dei 64 byte']::text[]),
  ('775838d8-59eb-55f6-a5ee-32076dd09da8', 'd5c4cbdd-ac9a-59ad-a954-c10a7b014867', 'fcs', 1, 'Cosa fa uno switch quando l''FCS di un frame ricevuto non è corretto?', 'Scarta il frame e incrementa il contatore degli errori CRC dell''interfaccia. Ethernet rileva gli errori ma non li corregge e non ritrasmette: l''eventuale recupero spetta ai protocolli dei livelli superiori, come TCP.', array['Frame scartato', 'Contatore CRC incrementato', 'Nessuna ritrasmissione a livello 2']::text[], array['Pensare che Ethernet richieda la ritrasmissione del frame']::text[]),
  ('248315e7-0574-5061-8396-e3e919613cd2', 'dffaabcf-a56e-534d-a38c-842ff9792b6a', 'why-source', 0, 'Perché uno switch apprende il MAC address di origine e non quello di destinazione?', 'Il MAC address di origine dice con certezza che quell''host è raggiungibile tramite la porta da cui è arrivato il frame. Il MAC di destinazione indica solo dove il mittente vuole arrivare, non dove si trova il destinatario. Lo switch usa quindi l''origine per costruire la tabella e la destinazione per decidere l''inoltro.', array['Origine = prova della posizione dell''host', 'Destinazione = decisione di inoltro', 'Associazione MAC → porta (e VLAN)']::text[], array['Pensare che lo switch "chieda" la posizione dei MAC: l''apprendimento è passivo']::text[]),
  ('914b3d27-cde0-5533-8abf-de3e2837ae5b', '155166f9-ff64-5536-a48a-567fe28dc070', 'scenario', 0, 'Descrivi cosa fa SW1 con il primo frame di PC-A e cosa cambia nella MAC Address Table. Su quali porte esce il frame?', 'SW1 registra il MAC address di origine di PC-A associato a Gi0/1 nella VLAN 10. Il MAC di destinazione (PC-B) non è in tabella: è un unknown unicast, quindi SW1 esegue il flooding su tutte le porte della VLAN 10 tranne quella di ingresso, cioè Gi0/2, Gi0/3 e Gi0/4. Gi0/5 non riceve nulla perché appartiene alla VLAN 20. Quando PC-B risponderà, SW1 apprenderà il suo MAC su Gi0/3 e il traffico successivo sarà inoltrato solo tra Gi0/1 e Gi0/3.', array['Learning del MAC di origine su Gi0/1', 'Unknown unicast ⇒ flooding', 'Flooding limitato alla VLAN, esclusa la porta di ingresso', 'La risposta di PC-B completa la tabella']::text[], array['Includere Gi0/5: il flooding non attraversa le VLAN', 'Includere la porta di ingresso Gi0/1', 'Confondere unknown unicast con broadcast: il frame resta unicast, solo l''inoltro è a tutte le porte']::text[]),
  ('f5b3c1f3-1d43-5266-abec-4d7d8fd86907', '23525bc3-5cd3-5714-9998-75e73e7587e9', 'ranges', 0, 'Quali sono i tre blocchi privati della RFC 1918 con il relativo prefisso? 172.20.5.1 e 172.33.0.1 sono privati?', '10.0.0.0/8, 172.16.0.0/12 (172.16.0.0 – 172.31.255.255) e 192.168.0.0/16. 172.20.5.1 è privato perché rientra in 172.16–172.31; 172.33.0.1 è pubblico perché è fuori dal /12.', array['10.0.0.0/8', '172.16.0.0/12 = da 172.16 a 172.31', '192.168.0.0/16']::text[], array['Considerare privato tutto 172.x.x.x', 'Confondere 169.254.0.0/16 (link-local) con un blocco RFC 1918']::text[]),
  ('009395bb-a624-5ecf-af4b-f91afdb05c3f', '9a88255c-bfdb-5e9b-aba4-affc0270c6d4', 'gateway', 0, 'PC1 (192.168.1.10/24) deve raggiungere 8.8.8.8. Quale indirizzo IP risolve con ARP e perché?', 'Risolve l''IP del Default Gateway, per esempio 192.168.1.1. 8.8.8.8 non appartiene alla subnet 192.168.1.0/24, quindi il pacchetto deve essere consegnato al router. Il frame avrà come MAC di destinazione quello del gateway, mentre il pacchetto IP avrà come destinazione 8.8.8.8.', array['Confronto con la propria subnet', 'Destinazione remota ⇒ ARP per il Default Gateway', 'MAC del gateway, IP del destinatario finale']::text[], array['Pensare che PC1 invii un''ARP Request per 8.8.8.8', 'Pensare che ARP attraversi il router']::text[]),
  ('756f1c59-f103-58fe-9c3e-4c264233b4d0', '9a88255c-bfdb-5e9b-aba4-affc0270c6d4', 'bcast-ucast', 1, 'Perché l''ARP Request è broadcast mentre l''ARP Reply è unicast?', 'Chi invia la Request non conosce ancora il MAC del destinatario, quindi deve chiedere a tutti gli host della subnet tramite broadcast. Chi risponde conosce già il MAC del richiedente, contenuto nella Request, e può rispondere direttamente in unicast senza disturbare gli altri host.', array['Request: MAC di destinazione sconosciuto ⇒ broadcast', 'Reply: MAC del richiedente noto ⇒ unicast']::text[], '{}'::text[]),
  ('dcc0158d-90ca-562c-8f5d-2c15b9e7c184', '0eff06c7-01d8-5299-be8d-34de078f7b8b', 'ttl', 0, 'Come fa traceroute a scoprire l''indirizzo di ciascun router lungo il percorso?', 'Invia sonde con TTL crescente: 1, poi 2, poi 3 e così via. Ogni router decrementa il TTL; il router che lo porta a zero scarta il pacchetto e risponde con un ICMP Time Exceeded, rivelando il proprio indirizzo. Si procede finché la destinazione risponde, con un Echo Reply o con un Port Unreachable a seconda dell''implementazione.', array['TTL decrementato a ogni hop', 'TTL = 0 ⇒ scarto e Time Exceeded (type 11)', 'Sonde con TTL crescente', 'Fine: risposta della destinazione']::text[], array['Pensare che i router "annuncino" il percorso', 'Interpretare * * * sempre come guasto']::text[]),
  ('9b1753d9-f6d0-5da6-b1dd-2ad2d3c90391', '0eff06c7-01d8-5299-be8d-34de078f7b8b', 'ping-codes', 1, 'In un ping da Cisco IOS ottieni ".!!!!". Cosa significano i simboli e qual è la causa più probabile del primo punto?', '"!" indica un Echo Reply ricevuto, "." un timeout. Il primo pacchetto è andato perso più probabilmente perché il router doveva ancora risolvere con ARP il MAC del next hop: il pacchetto in attesa viene scartato e i successivi trovano la voce ARP già pronta.', array['! = reply', '"." = timeout', 'Primo timeout tipico dovuto ad ARP']::text[], array['Concludere che il collegamento perde il 20% dei pacchetti']::text[]),
  ('d2f7ef8c-de3e-5e01-bcd7-d7974c052f47', '3305bbc1-e089-51b2-9c84-a7425949b96b', 'why-three', 0, 'Perché il Three-Way Handshake richiede tre messaggi e non due?', 'Entrambi i lati devono comunicare il proprio Initial Sequence Number e ricevere conferma. Il SYN porta l''ISN del client; il SYN-ACK conferma l''ISN del client e porta quello del server; l''ACK finale conferma l''ISN del server. Senza il terzo messaggio il server non avrebbe conferma che il client ha ricevuto il suo numero di sequenza.', array['Due ISN da sincronizzare', 'Ogni ISN deve essere confermato', 'Il SYN-ACK combina conferma e nuovo ISN']::text[], array['Pensare che l''handshake serva a scambiare dati applicativi']::text[]),
  ('56a42cda-5b75-5ee9-b5b3-e029f9b0d8a6', '3305bbc1-e089-51b2-9c84-a7425949b96b', 'syn-rst', 1, 'In una cattura vedi un SYN verso la porta 443 seguito immediatamente da un RST del server. Cosa ne deduci?', 'L''host di destinazione è raggiungibile e ha risposto, ma nessun servizio è in ascolto sulla porta 443: il sistema operativo rifiuta la connessione con un RST. Se invece il SYN restasse senza risposta, la causa più probabile sarebbe un filtro lungo il percorso o un host irraggiungibile.', array['RST = host raggiungibile, porta chiusa', 'Nessuna risposta = filtro o host irraggiungibile']::text[], array['Attribuire l''RST a un problema di routing']::text[]),
  ('b654563f-5cd4-5b64-9793-b52a812ad50f', '00702e75-7c76-53b2-ae62-8e735e8d9c77', 'voip', 0, 'Perché il traffico voce in tempo reale viaggia normalmente su UDP e non su TCP?', 'Nella voce in tempo reale conta la latenza: un pacchetto ritrasmesso arriverebbe troppo tardi per essere riprodotto. TCP introdurrebbe ritrasmissioni e attese per l''ordinamento che peggiorano la conversazione. UDP consegna subito ciò che arriva; l''applicazione tollera piccole perdite.', array['Latenza più importante dell''affidabilità', 'Ritrasmissione inutile oltre una certa soglia di tempo', 'UDP ha overhead minimo']::text[], array['Dire che UDP è usato perché "più veloce" senza spiegare il ruolo delle ritrasmissioni']::text[]),
  ('ebf08eca-bec9-58d2-9e81-ecef9a554e85', '33c79380-e583-5727-aff9-910497dbc6f0', 'relay', 0, 'I client della VLAN 20 ricevono un indirizzo 169.254.x.x. Il server DHCP è in un''altra subnet e funziona per le altre VLAN. Qual è la causa più probabile e come la verifichi?', 'La causa più probabile è l''assenza o l''errore del DHCP relay sull''interfaccia (o SVI) gateway della VLAN 20: il Discover in broadcast non attraversa il router. Si verifica con show running-config interface sull''interfaccia della VLAN 20, controllando che esista ip helper-address con l''IP corretto del server. Poi si verifica che sul server esista un pool per quella subnet e che il server sia raggiungibile dal router.', array['Broadcast non attraversa i router', 'ip helper-address sull''interfaccia rivolta ai client', 'Pool per la subnet corretta sul server', '169.254.x.x = nessuna risposta DHCP']::text[], array['Configurare ip helper-address sull''interfaccia verso il server invece che verso i client']::text[]),
  ('de282adc-e5e1-56e8-8122-483f6e269003', '33c79380-e583-5727-aff9-910497dbc6f0', 'dora-order', 1, 'Elenca i quattro messaggi DORA, chi li invia e perché il Request è ancora broadcast.', 'Discover (client), Offer (server), Request (client), Ack (server). Il Request è broadcast perché il client non ha ancora un indirizzo confermato e perché, se più server hanno risposto, tutti devono sapere quale offerta è stata accettata: gli altri possono liberare gli indirizzi proposti.', array['Discover e Request dal client', 'Offer e Ack dal server', 'Request broadcast: informa tutti i server']::text[], '{}'::text[]),
  ('ba33e371-686d-5b05-a772-d9349a19f7c5', 'a483047e-e685-5e1c-964f-c2de0a4c7c49', 'mail', 0, 'Gli utenti ricevono email da tutti tranne che da un nuovo dominio aziendale appena configurato. Quali record DNS controlli e in che ordine?', 'Prima il record MX del dominio: deve esistere e puntare al nome del server di posta. Poi il record A (o AAAA) di quel nome, che deve risolvere all''indirizzo corretto del server. Infine, per la reputazione verso gli altri server, il PTR dell''indirizzo pubblico del server di posta. Un MX che punta direttamente a un IP o a un nome senza A/AAAA non funziona.', array['MX → nome del mail server', 'A/AAAA del mail server', 'PTR per il reverse lookup', 'MX non deve contenere un IP']::text[], array['Controllare solo il record A del dominio principale']::text[]),
  ('6a67863c-9ad3-5e53-ae31-48296f186bc8', '191e7924-adde-5d9e-b1b2-21480459a5ca', 'updown', 0, 'Un''interfaccia mostra Status "up" e Protocol "down". Cosa indica e dove cerchi il problema?', 'Il livello fisico è attivo (c''è segnale/portante), ma il livello Data Link non è operativo. Si controlla la configurazione di livello 2 ai due estremi: incapsulamento, keepalive, mismatch tra le due interfacce sui collegamenti seriali. Con down/down invece il problema è fisico; con administratively down l''interfaccia è in shutdown.', array['Status = livello 1, Protocol = livello 2', 'up/down ⇒ problema di livello 2', 'down/down ⇒ problema fisico', 'administratively down ⇒ shutdown']::text[], array['Cercare un problema di indirizzamento IP: non cambia lo stato Protocol']::text[]),
  ('8c032298-f18e-5178-be1d-2feb45a7db91', 'bc911fd7-e523-599f-a19d-54fd2993b410', 'ad-vs-prefix', 0, 'La Routing Table contiene 10.0.0.0/8 statica [1/0] e 10.1.0.0/16 OSPF [110/20]. Quale rotta usa il router per 10.1.9.9 e perché l''administrative distance non cambia la scelta?', 'Usa 10.1.0.0/16 via OSPF, perché è il match con il prefisso più lungo. L''administrative distance serve solo a scegliere tra rotte verso lo stesso identico prefisso apprese da sorgenti diverse; /8 e /16 sono prefissi diversi e restano entrambe installate.', array['Longest prefix match prima di tutto', 'AD confronta solo rotte verso lo stesso prefisso', 'Metric confronta rotte della stessa sorgente']::text[], array['Scegliere la statica perché ha AD più bassa']::text[]),
  ('6017ef49-ae9f-5ae5-9640-43910e36b920', 'd382335d-a200-525f-9120-15334aa1f322', 'broadcast', 0, 'Un PC nella VLAN 10 invia un ARP Request. Quali host lo ricevono e perché?', 'Solo gli host collegati a porte della VLAN 10 (sullo stesso switch e, tramite i trunk, sugli altri switch). Lo switch esegue il flooding del broadcast solo all''interno della VLAN di provenienza, perché ogni VLAN è un Broadcast Domain separato.', array['Flooding limitato alla VLAN', 'Ogni VLAN = un Broadcast Domain', 'I trunk estendono la VLAN tra switch']::text[], array['Pensare che il broadcast arrivi a tutte le porte dello switch', 'Pensare che serva un router per separare i broadcast all''interno dello stesso switch']::text[]),
  ('55d6de77-753a-59e7-80a7-9c7d725ba03c', 'a91010c7-1bb6-535b-9004-7f3fb7668ba1', 'voice', 0, 'Su una porta con `switchport access vlan 10` e `switchport voice vlan 30` sono collegati un telefono IP e, dietro, un PC. Come viaggia il traffico di ciascuno?', 'Il telefono invia il traffico voce con tag 802.1Q della VLAN 30. Il PC, collegato alla porta switch del telefono, invia frame senza tag che lo switch assegna alla VLAN dati 10. Sulla stessa porta fisica convivono quindi due VLAN, ma la porta resta una Access Port.', array['Voce: con tag, VLAN 30', 'Dati: senza tag, VLAN 10', 'La porta non diventa un trunk']::text[], array['Pensare che serva un trunk per collegare un telefono IP', 'Configurare il PC con il tag della VLAN dati']::text[]),
  ('06f57638-2453-53cd-8860-9de3363a2833', 'a91010c7-1bb6-535b-9004-7f3fb7668ba1', 'show-vlan', 1, 'Hai configurato Gi1/0/24 come trunk ma non la vedi in `show vlan brief`. È un problema?', 'No. `show vlan brief` elenca le VLAN e le Access Port assegnate a ciascuna. Le porte trunk non compaiono: si verificano con `show interfaces trunk`.', array['show vlan brief = Access Port', 'show interfaces trunk = trunk']::text[], '{}'::text[]),
  ('fc76f744-1419-5adc-8fbd-1889151facb1', '85454276-0723-52d6-ba26-7a94ef15aa46', 'tag', 0, 'Descrivi il tag 802.1Q: dove si trova nel frame, quanto è lungo e quale campo identifica la VLAN?', 'È lungo 4 byte e si inserisce tra il MAC address di origine e il campo Type. Contiene il TPID (0x8100), il PCP per la priorità, il bit DEI e il VID di 12 bit che indica la VLAN (1–4094). Inserire o togliere il tag modifica il frame, quindi l''FCS va ricalcolato.', array['4 byte dopo il MAC di origine', 'TPID 0x8100', 'VID 12 bit, VLAN 1–4094', 'FCS ricalcolato']::text[], array['Pensare che il tag venga aggiunto anche sulle Access Port', 'Collocare il tag prima del MAC di destinazione']::text[]),
  ('fe767cd6-f34a-5b0c-a164-36a505457009', '85454276-0723-52d6-ba26-7a94ef15aa46', 'native', 1, 'Cosa succede a un frame della Native VLAN quando attraversa un trunk 802.1Q?', 'Viene inviato senza tag. Lo switch che lo riceve senza tag lo assegna alla propria Native VLAN. Per questo la Native VLAN deve coincidere ai due capi del trunk.', array['Native VLAN = senza tag', 'Default VLAN 1', 'Deve coincidere ai due lati']::text[], '{}'::text[]),
  ('6a006de6-38a7-54db-aaef-27cf0f0eca54', 'd0939326-daf8-5b17-882a-38d4ab290ae2', 'auto-auto', 0, 'Due switch sono collegati con entrambe le porte in `dynamic auto`. Si forma un trunk? Perché?', 'No, il link resta in modalità access. Una porta dynamic auto diventa trunk solo se l''altro lato chiede attivamente il trunk, cioè è in modalità trunk o dynamic desirable. Due porte auto aspettano entrambe e nessuna avvia la negoziazione.', array['auto è passiva', 'Serve almeno un lato trunk o desirable']::text[], array['Pensare che due porte dinamiche formino sempre un trunk']::text[]),
  ('474c78d4-c01b-5196-bdce-490aef62ae8d', '515d68b9-e263-5df9-882c-a1571f1073fa', 'diagnose', 0, 'Quale comando usi per confrontare la Native VLAN ai due capi di un trunk, e che cosa succede al traffico se non coincidono?', '`show interfaces trunk` su entrambi gli switch, colonna Native vlan. Se non coincidono, il traffico non taggato inviato da un lato viene assegnato a una VLAN diversa dall''altro lato: le due Native VLAN si fondono, mentre il trunk resta attivo.', array['show interfaces trunk', 'Traffico non taggato cambia VLAN', 'Il link resta su']::text[], array['Aspettarsi che il trunk vada in down']::text[]),
  ('d6f478dc-9ae2-5700-9d90-d34951488753', '6ea16f93-12c0-5293-bdbe-5f63f369fdac', 'subif', 0, 'Quali due comandi servono su una sotto-interfaccia ROAS per la VLAN 20, e cosa fa ciascuno?', '`encapsulation dot1q 20` associa la sotto-interfaccia ai frame con tag VLAN 20 (in ricezione li accetta, in trasmissione li tagga con 20). `ip address 192.168.20.1 255.255.255.0` assegna l''indirizzo che fa da Default Gateway per gli host della VLAN 20.', array['encapsulation dot1q <vlan>', 'IP = Default Gateway della VLAN']::text[], array['Pensare che il numero della sotto-interfaccia determini la VLAN']::text[]),
  ('1ac5cc2f-b6bc-54bb-bbf9-c70e9eada6e4', 'cf331cd3-a550-5c6b-ae59-f8151d3b9355', 'down', 0, 'Hai creato `interface vlan 30` con un indirizzo IP, ma la SVI resta down/down. Quali cause controlli?', 'Che la VLAN 30 esista nel database (show vlan brief); che almeno una porta della VLAN 30 sia attiva e in forwarding, come Access Port o su un trunk che consente la VLAN 30; che la SVI non sia in shutdown. Per il routing tra VLAN serve inoltre `ip routing`.', array['VLAN esistente', 'Almeno una porta attiva nella VLAN', 'no shutdown', 'ip routing per instradare']::text[], array['Cercare il problema nell''indirizzo IP, che non influisce sullo stato up/down']::text[]),
  ('18d18a92-b473-531e-9361-af9b8c0e0dce', '078e5817-97ec-5f15-bf73-e040a7fdce7d', 'ttl', 0, 'Perché un loop di livello 2 è molto più grave di un loop di routing IP?', 'Perché l''header Ethernet non ha un campo TTL. Un pacchetto IP in loop viene scartato quando il TTL arriva a zero; un frame Ethernet in loop, soprattutto se broadcast, viene inoltrato all''infinito e duplicato dal flooding, fino a saturare la rete (broadcast storm).', array['Nessun TTL in Ethernet', 'Flooding moltiplica i frame', 'Broadcast storm, MAC flapping']::text[], array['Pensare che gli switch riconoscano e scartino i frame già visti']::text[]),
  ('a119030a-4784-5e29-948c-a68c2ab93735', '5e78a1cc-d447-5987-a2c0-cff10b2c1045', 'election', 0, 'SW1 ha priorità 32768 e MAC 0011.1111.1111, SW2 priorità 28672 e MAC 0000.0000.0001, SW3 priorità 28672 e MAC 0000.0000.0002. Chi diventa Root Bridge e perché?', 'SW2. Si confronta prima la priorità: SW2 e SW3 hanno 28672, inferiore a 32768 di SW1. A parità di priorità decide il MAC address più basso, e quello di SW2 (0000.0000.0001) è inferiore a quello di SW3.', array['Prima la priorità', 'Poi il MAC address più basso', 'Vince il BID più basso']::text[], array['Scegliere SW1 perché ha il MAC più basso senza guardare la priorità', 'Pensare che vinca il valore più alto']::text[]),
  ('2b19d885-3321-58db-bb6f-69426e5e9a9e', '5e78a1cc-d447-5987-a2c0-cff10b2c1045', 'cost', 1, 'Uno switch raggiunge il Root Bridge in due modi: dalla porta Gi0/1, con un link diretto a 100 Mbps, oppure dalla porta Gi0/2, attraverso un altro switch con due link da 1 Gbps. Quale diventa Root Port?', 'Gi0/2. Il percorso diretto a 100 Mbps costa 19. Il percorso attraverso l''altro switch costa 4 + 4 = 8. Vince il costo totale più basso verso il Root Bridge, non il numero di salti.', array['Si sommano i costi dei link fino al root', '100 Mbps = 19, 1 Gbps = 4', 'Conta il costo, non i salti']::text[], array['Scegliere il percorso diretto perché ha meno salti']::text[]),
  ('73f75b07-aa25-5b48-b501-e397f2feb181', '19ad7725-4602-5b20-862c-1896f50516d3', 'alternate', 0, 'Che differenza c''è tra una porta Alternate e una porta Backup in RSTP?', 'Entrambe sono in stato discarding e pronte a subentrare. La Alternate riceve BPDU migliori da un altro switch e offre un percorso alternativo verso il Root Bridge: sostituisce la Root Port. La Backup riceve BPDU migliori dallo stesso switch (un''altra sua porta sullo stesso segmento condiviso) e fa da riserva a una Designated Port.', array['Alternate: BPDU da un altro switch, riserva della Root Port', 'Backup: BPDU dallo stesso switch, riserva della Designated Port']::text[], array['Pensare che Alternate e Backup siano sinonimi']::text[]),
  ('d4781347-96e9-5d6d-80c0-a9517a7850fc', '19ad7725-4602-5b20-862c-1896f50516d3', 'states', 1, 'Quali sono i tre stati RSTP e quali corrispondono agli stati dello STP classico?', 'Discarding (raggruppa Disabled, Blocking e Listening: non inoltra e non apprende), Learning (non inoltra ma apprende i MAC address) e Forwarding (inoltra e apprende).', array['Discarding = disabled + blocking + listening', 'Learning', 'Forwarding']::text[], '{}'::text[]),
  ('89ebd8ea-5208-5dd2-89ae-af5bd5359ffe', 'c929301e-ecaa-5e4a-a3a3-0cfcf6281c77', 'why', 0, 'Perché PortFast e BPDU Guard si configurano quasi sempre insieme?', 'PortFast rende subito attiva una porta verso un host, ma se qualcuno vi collega uno switch quel link entra in forwarding senza la protezione dello Spanning Tree e può creare un loop. BPDU Guard copre proprio questo caso: alla prima BPDU ricevuta la porta va in err-disabled.', array['PortFast: forwarding immediato', 'Rischio: switch collegato a una porta PortFast', 'BPDU Guard: err-disabled alla prima BPDU']::text[], array['Pensare che PortFast disattivi lo Spanning Tree sulla porta']::text[]),
  ('9caf2a60-df15-5f4a-a6b7-ac8804d7b7d3', 'c929301e-ecaa-5e4a-a3a3-0cfcf6281c77', 'recover', 1, 'Una porta è in err-disabled per BPDU Guard. Come la riattivi manualmente?', 'Si verifica con `show interfaces status err-disabled`, si rimuove la causa (lo switch collegato), poi sull''interfaccia si esegue `shutdown` seguito da `no shutdown`. In alternativa si configura `errdisable recovery cause bpduguard`.', array['shutdown / no shutdown', 'Rimuovere prima la causa']::text[], '{}'::text[]),
  ('530c08d6-bd90-59a8-ba69-c12b5fb2634b', 'fb919662-a463-51e1-9f1b-94eb611d0f49', 'which', 0, 'Una porta riceve una BPDU con un Bridge ID migliore di quello del Root Bridge attuale. Con Root Guard attivo cosa succede? E con BPDU Guard?', 'Con Root Guard la porta passa in stato root-inconsistent (bloccata) finché arrivano BPDU superiori, poi torna attiva da sola: il Root Bridge resta quello previsto. Con BPDU Guard la porta va in err-disabled alla prima BPDU di qualsiasi tipo e va riattivata manualmente o con errdisable recovery.', array['Root Guard: root-inconsistent, ripristino automatico', 'BPDU Guard: err-disabled per qualsiasi BPDU']::text[], array['Confondere root-inconsistent con err-disabled']::text[]),
  ('d35fc7f0-9ce6-5ce0-a429-500567b80c5e', '7c9d8143-ee1d-56f4-8dc2-4aeb1f3cb2b4', 'modes', 0, 'SW1 ha le porte in `channel-group 1 mode passive`, SW2 in `mode passive`. Si forma il Port-channel? Cosa cambieresti?', 'No. In passive una porta risponde ai messaggi LACP ma non li avvia: con due lati passive nessuno inizia la negoziazione. Basta mettere almeno un lato in active (di solito entrambi).', array['passive non avvia LACP', 'Serve almeno un lato active']::text[], array['Pensare che passive + passive funzioni perché entrambi usano LACP']::text[]),
  ('8074f3e9-02f4-5bf2-b605-4ee139f6f323', '7c9d8143-ee1d-56f4-8dc2-4aeb1f3cb2b4', 'hash', 1, 'Un EtherChannel ha 4 link da 1 Gbps. Un unico trasferimento di file tra due server può raggiungere 4 Gbps?', 'No. Il bilanciamento è per flusso: un hash su indirizzi MAC/IP (e a volte porte) sceglie un solo link per ogni flusso, quindi un singolo trasferimento resta limitato a 1 Gbps. La banda aggregata si sfrutta con molti flussi diversi.', array['Bilanciamento per flusso, non per frame', 'Un flusso = un link']::text[], '{}'::text[]),
  ('2d63c245-1b7b-5683-97ee-de2ae1222f26', 'b4a7a38b-659c-5422-aaa3-119c4cd6b869', 'suspended', 0, 'Un membro di EtherChannel appare con il flag `s`. Quali sono le cause più probabili?', 'La porta è sospesa perché non è compatibile con le altre del canale: configurazione diversa (modalità access/trunk, VLAN di accesso, Native VLAN, VLAN consentite) oppure speed/duplex diversi. Va confrontata con gli altri membri e riallineata.', array['Configurazione non identica', 'Speed/duplex diversi', 'Controllare anche il lato remoto']::text[], '{}'::text[]),
  ('d25fb5c3-88a7-5c88-8e14-0258aba768f4', '31312177-9638-5483-a52d-1a553a958a4c', 'ports', 0, 'Nell''output di `show cdp neighbors` di SW1 compare: Device ID R1, Local Intrfce Gig 1/0/48, Port ID Gig 0/0/1. Come lo descrivi in uno schema di rete?', 'La porta Gi1/0/48 di SW1 è collegata alla porta Gi0/0/1 del router R1. Local Intrfce è sempre l''interfaccia del dispositivo su cui esegui il comando, Port ID quella del vicino.', array['Local Intrfce = porta locale', 'Port ID = porta del vicino']::text[], array['Invertire porta locale e porta remota']::text[]),
  ('48e6c10d-01a0-55f4-9727-43a37c9e52ef', '31312177-9638-5483-a52d-1a553a958a4c', 'lldp-off', 1, 'Su uno switch Cisco `show lldp neighbors` restituisce un errore o nessun vicino, mentre CDP funziona. Qual è la causa più probabile?', 'LLDP è disattivato globalmente: su molti switch Cisco è disattivo per default. Si attiva con `lldp run` in configurazione globale.', array['LLDP spesso disattivo per default', 'lldp run']::text[], '{}'::text[]),
  ('b296520e-fb81-506d-9218-a0f901667cb5', '280aaced-4d95-556f-bba5-2bc86aa823da', 'crc', 0, 'Un''interfaccia full-duplex a 1 Gbps mostra CRC in costante aumento e zero collisioni. Qual è l''ipotesi principale e come la verifichi?', 'Un problema fisico: cavo danneggiato o troppo lungo, connettore, porta o interferenze. Si sostituisce il cavo (o si prova un''altra porta), si azzerano i contatori con `clear counters` e si osserva se i CRC continuano a crescere.', array['CRC = frame danneggiati', 'Zero collisioni → poco probabile un problema di duplex', 'clear counters e osservare la crescita']::text[], array['Guardare solo il valore assoluto dei contatori']::text[]),
  ('ea3ca39a-7a8d-5aee-b9e4-c580c4b7699e', '280aaced-4d95-556f-bba5-2bc86aa823da', 'late', 1, 'Cosa indica una late collision e perché su un link full-duplex non dovrebbe mai esserci?', 'È una collisione rilevata dopo che sono già stati trasmessi i primi 64 byte del frame. In full-duplex non esistono collisioni, perché trasmissione e ricezione usano canali separati: se le vedi, un lato è probabilmente in half-duplex (duplex mismatch) oppure il cavo supera la lunghezza massima.', array['Collisione oltre i primi 64 byte', 'Full-duplex = zero collisioni', 'Indizio di duplex mismatch']::text[], '{}'::text[]),
  ('d6cb8b50-a75f-5ad2-a265-9a8a8d93d1f0', 'be098602-8939-5896-a525-c8867527e7f4', 'which-side', 0, 'In un duplex mismatch, quali contatori di errore crescono su ciascun lato?', 'Sul lato in half-duplex crescono collisioni e soprattutto late collision. Sul lato in full-duplex crescono CRC e runt, perché riceve frame interrotti dal lato half-duplex.', array['Half: late collision', 'Full: CRC e runt']::text[], array['Aspettarsi che il link vada in down: di solito resta up ma lento']::text[]),
  ('30e42546-8ff7-5a96-bbf1-7b4bfa41a5b4', 'be098602-8939-5896-a525-c8867527e7f4', 'auto', 1, 'Uno switch in auto è collegato a un host forzato a 100/full. Quale duplex sceglie lo switch e perché?', 'Half-duplex. Lo switch rileva la velocità di 100 Mbps dal segnale, ma senza autonegoziazione dall''altra parte non riceve informazioni sul duplex e per 10/100 Mbps adotta half-duplex.', array['La velocità si rileva, il duplex no', 'Default half-duplex a 10/100']::text[], '{}'::text[]),
  ('a4cc0ac8-2872-532c-b89e-3d40ed3cc969', 'df479dab-854b-573d-8554-235c4540221e', 'ex1', 0, 'Indirizzo 10.20.30.77/28: indica rete, broadcast e range di host.', '/28 = mask 255.255.255.240, block size 16 nel quarto ottetto. Le subnet partono a 64 e 80; 77 sta nella subnet 10.20.30.64. Broadcast 10.20.30.79, host da 10.20.30.65 a 10.20.30.78 (14 host).', array['Block size 16', 'Rete .64', 'Broadcast .79', 'Host .65–.78']::text[], array['Usare 77 − 16 invece di cercare il multiplo di 16']::text[]),
  ('fdfa0276-29ae-568f-8939-b7e853f1611a', 'df479dab-854b-573d-8554-235c4540221e', 'ex2', 1, 'Indirizzo 192.168.37.200/20: qual è l''indirizzo di rete e quale il broadcast?', '/20 = 255.255.240.0: l''ottetto interessante è il terzo, block size 16. I multipli di 16 vicini a 37 sono 32 e 48. Rete 192.168.32.0, broadcast 192.168.47.255.', array['Ottetto interessante: il terzo', 'Rete 192.168.32.0', 'Broadcast 192.168.47.255']::text[], array['Lavorare sul quarto ottetto anche quando la mask lo azzera']::text[]),
  ('b753fccd-6771-5a2e-9276-11bf27444467', '1fb6663f-73a9-532b-abd4-35a041912ab3', 'hosts', 0, 'Una VLAN deve contenere 50 host. Qual è il prefisso più lungo (subnet più piccola) che puoi usare?', '/26. Servono 6 bit di host: 2⁶ − 2 = 62 ≥ 50, mentre 5 bit darebbero solo 30 host. 32 − 6 = 26, mask 255.255.255.192.', array['2ʰ − 2 ≥ host', '6 bit → 62 host', '/26 = 255.255.255.192']::text[], array['Dimenticare il −2 e scegliere /27 pensando a 32 indirizzi']::text[]),
  ('f18c8a13-208e-52b6-a5a9-af6af86b2a1a', '1fb6663f-73a9-532b-abd4-35a041912ab3', 'subnets', 1, 'Hai 192.168.10.0/24 e ti servono 6 subnet della stessa dimensione. Quale prefisso usi e quanti host ha ciascuna?', 'Servono 3 bit di subnet (2³ = 8 ≥ 6): /24 + 3 = /27. Ogni subnet ha 5 bit di host: 30 host utilizzabili. Le subnet sono .0, .32, .64 … .224.', array['2ˢ ≥ subnet', '/27', '30 host per subnet']::text[], '{}'::text[]),
  ('b1aff2e9-2982-54f4-83c0-c7a73ef920c0', '1fb6663f-73a9-532b-abd4-35a041912ab3', 'p2p', 2, 'Quale prefisso IPv4 si usa tipicamente per un link point-to-point tra due router, e quale alternativa permette di non sprecare indirizzi?', '/30: 4 indirizzi, 2 utilizzabili, uno per router. In alternativa si può usare /31, che sui link point-to-point usa entrambi gli indirizzi senza rete e broadcast (RFC 3021).', array['/30 = 2 host', '/31 su point-to-point']::text[], '{}'::text[]),
  ('6a7df112-9df8-5dd4-93f4-9eba9142f299', 'cf69d04d-1dea-5c58-9cb8-7013ba67e62a', 'order', 0, 'Perché in un piano VLSM si assegnano prima le subnet più grandi?', 'Perché ogni subnet deve iniziare a un multiplo del proprio block size. Assegnando prima le più grandi, ognuna trova un inizio allineato e lo spazio residuo resta contiguo; assegnando prima quelle piccole si frammenta il blocco e una subnet grande potrebbe non trovare più un inizio valido.', array['Allineamento al block size', 'Evitare la frammentazione']::text[], '{}'::text[]),
  ('60689f97-aa5d-5618-86c3-95e84bed106e', '45145bca-b4dc-5d0e-b561-8c03cd24610b', 'mask', 0, 'Un host ha 192.168.10.25/16 invece di /24, con gateway 192.168.10.1. Cosa succede quando prova a raggiungere 192.168.20.5, che si trova in un''altra VLAN?', 'Con la mask /16 l''host considera 192.168.20.5 nella propria rete (192.168.0.0/16) e invia un ARP Request per quell''indirizzo invece di inoltrare il pacchetto al gateway. L''ARP non riceve risposta, perché la destinazione è in un altro Broadcast Domain, e la comunicazione fallisce.', array['La mask decide locale o remoto', 'Locale → ARP diretto', 'Remoto → Default Gateway']::text[], array['Pensare che la mask sbagliata non conti finché il gateway è giusto']::text[]),
  ('7dc2be74-ddb6-5d73-b391-1d9b97b10155', '67333b75-0bae-57d6-a48a-f3bd5d318acb', 'abbr', 0, 'Abbrevia nella forma canonica: 2001:0DB8:0000:0000:0001:0000:0000:00AB', '2001:db8::1:0:0:ab. Ci sono due sequenze di zeri lunghe due gruppi ciascuna: a parità si abbrevia la prima. Zeri iniziali omessi e lettere minuscole.', array['Una sola ::', 'A parità la prima sequenza', 'Minuscolo, niente zeri iniziali']::text[], array['Usare :: due volte', 'Abbreviare la seconda sequenza invece della prima']::text[]),
  ('fad71284-b5d7-562e-88be-a9f060b2b423', '67333b75-0bae-57d6-a48a-f3bd5d318acb', 'expand', 1, 'Espandi 2001:db8:a::12 in forma completa.', '2001:0db8:000a:0000:0000:0000:0000:0012. Ci sono quattro gruppi espliciti (2001, db8, a, 12), quindi :: rappresenta 8 − 4 = 4 gruppi a zero.', array['Contare i gruppi espliciti', ':: = gruppi mancanti fino a 8']::text[], '{}'::text[]),
  ('9aee6ef9-e009-5980-a83f-149fdeb08d95', '588fd3db-064d-5429-90a1-2d39a6655df7', 'identify', 0, 'Classifica: fe80::a1b:2cff:fe3d:4e5f, 2001:db8:1::10, ff02::2, fd12:3456:789a::1.', 'fe80::… è link-local (fe80::/10); 2001:db8:1::10 è nello spazio global unicast (2000::/3, anche se 2001:db8::/32 è riservato alla documentazione); ff02::2 è multicast verso tutti i router del link; fd12:… è unique local (fc00::/7).', array['fe80 = link-local', '2000::/3 = global', 'ff = multicast', 'fd = unique local']::text[], '{}'::text[]),
  ('dc742506-6c7a-53f2-91ed-3215b60dc1c7', '588fd3db-064d-5429-90a1-2d39a6655df7', 'no-broadcast', 1, 'IPv6 non ha broadcast. Come trova un host il MAC address di un vicino senza inviare un frame a tutti?', 'Con NDP: invia un Neighbor Solicitation al multicast solicited-node dell''indirizzo cercato (ff02::1:ff + ultimi 24 bit). Solo gli host con quegli ultimi 24 bit, idealmente solo la destinazione, ascoltano quel gruppo e rispondono con un Neighbor Advertisement.', array['Neighbor Solicitation', 'Multicast solicited-node', 'Neighbor Advertisement']::text[], '{}'::text[]),
  ('91f1cdd1-cb29-5648-8023-2164cd62b6b9', '436e1cfb-339e-5ee1-90a7-84862b868b60', 'calc', 0, 'Calcola l''Interface ID Modified EUI-64 per il MAC address 0C-7A-15-60-B2-91.', 'Si divide in 0C7A15 e 60B291, si inserisce FFFE: 0C7A15FFFE60B291. Il primo byte 0C = 0000 1100: invertendo il settimo bit diventa 0000 1110 = 0E. Interface ID: 0e7a:15ff:fe60:b291.', array['Inserire FFFE a metà', 'Invertire il 7° bit: 0C → 0E']::text[], array['Invertire il primo bit invece del settimo', 'Dimenticare FFFE']::text[]),
  ('a0654b20-72ce-53b4-8d3a-0743ba2ad878', '4cacfc2d-a645-50f3-ba69-3839736094ad', 'steps', 0, 'Descrivi come un host ottiene un indirizzo global unicast con SLAAC, incluso il controllo dei duplicati.', 'Invia un Router Solicitation a ff02::2; il router risponde con un Router Advertisement che contiene il prefisso /64. L''host aggiunge un Interface ID (EUI-64 o casuale) e, prima di usare l''indirizzo, esegue la DAD inviando un Neighbor Solicitation per quell''indirizzo: se nessuno risponde con un Neighbor Advertisement, l''indirizzo è libero. Il gateway è il link-local del router.', array['RS → RA con prefisso', 'Prefisso + Interface ID', 'DAD con NS', 'Gateway = link-local del router']::text[], array['Pensare che SLAAC richieda un server DHCP']::text[]),
  ('838a6910-4646-58b9-b12b-55a7dd37f791', '4cacfc2d-a645-50f3-ba69-3839736094ad', 'flags', 1, 'Cosa indicano i flag M e O in un Router Advertisement?', 'M = 1: gli indirizzi vanno ottenuti da un server DHCPv6 stateful. O = 1 (con M = 0): l''indirizzo si costruisce con SLAAC e le altre informazioni, come i server DNS, si chiedono a un DHCPv6 stateless.', array['M = DHCPv6 stateful', 'O = DHCPv6 stateless per le altre opzioni']::text[], '{}'::text[]),
  ('f06283f0-369c-5917-b921-6fbfebf8d310', 'e56facf2-5546-5db7-827c-942260ba899c', 'choose', 0, 'R1 impara 10.5.0.0/16 da OSPF con costo 20 e da EIGRP con metrica 3072. Quale route installa e perché?', 'Quella EIGRP: lo stesso prefisso arriva da due protocolli diversi, quindi decide l''Administrative Distance. EIGRP interno ha AD 90, OSPF 110: vince EIGRP. Le metriche di protocolli diversi non si confrontano.', array['Stesso prefisso, protocolli diversi → AD', 'EIGRP 90 < OSPF 110']::text[], array['Confrontare costo OSPF e metrica EIGRP']::text[]),
  ('f0091ade-425e-5ccc-89ad-00d6a2f04f25', 'e56facf2-5546-5db7-827c-942260ba899c', 'lpm', 1, 'R1 ha una route OSPF per 10.1.1.0/24 e una route statica per 10.1.0.0/16. Un pacchetto è destinato a 10.1.1.50. Quale route usa?', 'La route OSPF 10.1.1.0/24, perché è il prefisso più lungo che contiene la destinazione. L''AD conta solo per scegliere tra route con lo stesso prefisso; qui i prefissi sono diversi e convivono entrambi nella tabella.', array['Longest prefix match prima di tutto', 'AD solo a parità di prefisso']::text[], array['Scegliere la statica perché ha AD 1']::text[]),
  ('5fa2bbad-4bee-5c99-a2fb-a321eb0ec6a8', 'db8f5d45-4567-5c1b-8ae5-dc20be849810', 'read', 0, 'Nella riga `O 172.16.8.0/22 [110/65] via 10.0.0.2, 00:02:11, Serial0/0/0`, cosa indicano 110 e 65?', '110 è l''Administrative Distance (OSPF) e 65 la metrica, cioè il costo OSPF totale per raggiungere 172.16.8.0/22 passando per il next hop 10.0.0.2.', array['Primo numero: AD', 'Secondo numero: metrica']::text[], '{}'::text[]),
  ('1560789c-515f-56f0-ba60-44ef39ca5743', 'db8f5d45-4567-5c1b-8ae5-dc20be849810', 'local', 1, 'Perché in `show ip route` compare una route L 10.0.12.1/32 accanto alla route C 10.0.12.0/30?', 'La route C rappresenta la subnet collegata all''interfaccia; la route L (local) /32 rappresenta l''indirizzo configurato sul router stesso. Serve al router per riconoscere i pacchetti destinati a sé, che non vanno inoltrati ma elaborati localmente.', array['C = subnet collegata', 'L = indirizzo dell''interfaccia /32']::text[], '{}'::text[]),
  ('b6025aea-1fcc-5c13-97a0-76b57d620928', 'c17b1b9a-ade1-5193-b29d-e48c69ccacb8', 'types', 0, 'Scrivi i comandi per: (1) la default route verso 203.0.113.1; (2) una host route per 10.9.9.9 via 10.0.0.6.', '(1) `ip route 0.0.0.0 0.0.0.0 203.0.113.1`. (2) `ip route 10.9.9.9 255.255.255.255 10.0.0.6`.', array['Default: 0.0.0.0 0.0.0.0', 'Host route: mask /32']::text[], '{}'::text[]),
  ('046bcb14-71aa-560c-97db-5faff07864c1', 'c17b1b9a-ade1-5193-b29d-e48c69ccacb8', 'return', 1, 'Hai configurato su R1 una route statica per la LAN dietro R2. Il ping da un PC di R1 verso un PC di R2 fallisce, ma `show ip route` su R1 è corretto. Qual è la prima cosa da controllare?', 'Il percorso di ritorno: R2 deve avere una route (statica, dinamica o di default) verso la LAN di R1. Il routing è indipendente in ogni direzione.', array['Ogni router decide da solo', 'Serve la route di ritorno']::text[], '{}'::text[]),
  ('9d7b2223-f7ac-579d-822d-bac0b4c50c8a', '36633e1d-bddc-577d-bee3-e180a53eeb5c', 'ad', 0, 'La route principale verso 10.50.0.0/16 è appresa con OSPF. Scrivi una floating static di backup via 198.51.100.1 e spiega perché in condizioni normali non compare in tabella.', '`ip route 10.50.0.0 255.255.0.0 198.51.100.1 130`. Ha AD 130, più alta dell''AD 110 di OSPF: per lo stesso prefisso il router installa la route con AD più bassa. La statica viene installata solo quando la route OSPF scompare.', array['AD maggiore della principale', 'Installata solo se la principale sparisce']::text[], array['Usare AD 1 o lasciare il default, che renderebbe la statica la route principale']::text[]),
  ('26d871c1-b494-565a-937a-65e5ea29606e', 'f6757f1b-c0d8-5625-90d7-2240591736d1', 'll', 0, 'Perché `ipv6 route 2001:db8:60::/64 fe80::2` viene rifiutato, mentre `ipv6 route 2001:db8:60::/64 GigabitEthernet0/1 fe80::2` è accettato?', 'Un indirizzo link-local vale solo su un link e lo stesso fe80::2 può comparire su più interfacce. Senza l''interfaccia di uscita il router non sa su quale link cercare il next hop, quindi l''interfaccia è obbligatoria.', array['Link-local non è univoco tra interfacce', 'Interfaccia obbligatoria']::text[], '{}'::text[]),
  ('87b29eb6-3d3d-58e6-8d64-f98f92143eb4', 'ffd406f8-fd0d-5c61-b6c0-5221d55a6b62', 'nexthop', 0, 'Perché una route statica con un next hop che non è su una subnet collegata può non comparire in `show ip route`?', 'Il router deve risolvere il next hop in modo ricorsivo: cerca nella Routing Table una route per raggiungerlo. Se non ne trova, la route statica non è utilizzabile e non viene installata. Il next hop deve essere un vicino raggiungibile, normalmente sulla subnet condivisa.', array['Ricerca ricorsiva del next hop', 'Next hop = vicino diretto']::text[], array['Indicare come next hop il router finale invece del vicino']::text[]),
  ('99bc5f73-0c47-55be-a994-0c4b4d9a9dfa', '14ffc845-1de0-537d-85fd-b10a9685f7ff', 'cost', 0, 'Con la reference bandwidth di default, un percorso usa due link da 1 Gbps e un altro un solo link da 100 Mbps. Quale preferisce OSPF? Ha senso?', 'Con reference 100 Mbps entrambi i tipi di link costano 1: il percorso con due link da 1 Gbps costa 2, quello con un link da 100 Mbps costa 1, quindi OSPF preferisce il link a 100 Mbps. Non ha senso dal punto di vista della banda: si risolve con `auto-cost reference-bandwidth` più alta su tutti i router.', array['Costo = reference / banda, minimo 1', 'Default 100 Mbps appiattisce i link veloci', 'Cambiare la reference su tutti i router']::text[], array['Pensare che OSPF consideri automaticamente la banda reale oltre i 100 Mbps']::text[]),
  ('94ee074c-87d9-57d9-9fbe-7f993baed07f', '14ffc845-1de0-537d-85fd-b10a9685f7ff', 'ls-vs-dv', 1, 'Qual è la differenza essenziale tra un protocollo link-state come OSPF e uno distance vector?', 'Con il link-state ogni router riceve le descrizioni dei link (LSA) di tutta l''area, costruisce la stessa LSDB e calcola da solo i percorsi con SPF. Con il distance vector il router conosce solo le route e le metriche annunciate dai vicini, senza vedere la topologia.', array['Link-state: mappa completa + SPF', 'Distance vector: route sentite dai vicini']::text[], '{}'::text[]),
  ('450c5051-63e9-5d91-9517-5285ac044754', '3b9bba2b-e3c4-5740-96d1-d8241a5ab713', 'match', 0, 'Elenca i parametri che devono coincidere perché due router OSPF sulla stessa Ethernet diventino vicini.', 'Area ID, subnet e mask, Hello e Dead interval, autenticazione e flag stub. Inoltre i Router ID devono essere diversi, l''interfaccia non deve essere passiva e, per arrivare a Full, l''MTU deve essere uguale.', array['Area, subnet/mask, timer, autenticazione, stub', 'RID unici, non passive', 'MTU per arrivare a Full']::text[], array['Pensare che debba coincidere il process ID (`router ospf 1`): è locale']::text[]),
  ('e4666c12-6fbe-5439-bb3b-afc71954552a', '3b9bba2b-e3c4-5740-96d1-d8241a5ab713', '2way', 1, 'In `show ip ospf neighbor` vedi un vicino in 2WAY/DROTHER. Devi intervenire?', 'Non necessariamente. Su una rete broadcast due DROther restano in 2-Way tra loro e formano l''adiacenza Full solo con DR e BDR. È un problema solo se il vicino dovrebbe essere DR/BDR, o su un link point-to-point, dove l''atteso è Full.', array['DROther ↔ DROther = 2-Way è normale', 'Full solo con DR/BDR']::text[], '{}'::text[]),
  ('a89eba49-deb5-569e-aeca-4beef35b1d80', 'fbf39b97-630b-578c-858a-42239c8925cc', 'elect', 0, 'Su una Ethernet ci sono R1 (priorità 1, RID 1.1.1.1), R2 (priorità 1, RID 2.2.2.2), R3 (priorità 0, RID 9.9.9.9). Tutti partono insieme. Chi è DR e chi BDR?', 'DR = R2, BDR = R1. R3 ha priorità 0 e non partecipa. Tra R1 e R2 la priorità è uguale, quindi vince il Router ID più alto: R2.', array['Priorità più alta', 'Poi RID più alto', 'Priorità 0 esclusa']::text[], array['Scegliere R3 perché ha il RID più alto']::text[]),
  ('c974636b-24c0-5a1b-bf40-770ff78cb999', 'fbf39b97-630b-578c-858a-42239c8925cc', 'preempt', 1, 'Dopo l''elezione colleghi R4 con priorità 200. Diventa subito DR?', 'No. L''elezione OSPF non è preemptive: R4 diventa DROther finché il DR attuale non cade o il processo OSPF non viene riavviato.', array['Nessuna preemption']::text[], '{}'::text[]),
  ('12b506eb-8f04-5a5b-bb4e-c33399769b40', '00f947c6-9c0b-5e79-b092-ac96d6ca1434', 'order', 0, 'In che ordine Cisco IOS sceglie il Router ID OSPF?', '1) Il valore configurato con `router-id`. 2) In mancanza, l''indirizzo IPv4 più alto tra le interfacce di loopback attive. 3) In mancanza, l''indirizzo IPv4 più alto tra le interfacce fisiche attive. La scelta avviene all''avvio del processo: per cambiarla serve `clear ip ospf process`.', array['router-id manuale', 'Loopback più alta', 'Interfaccia fisica più alta', 'Serve clear ip ospf process']::text[], array['Pensare che vinca la loopback più bassa', 'Aspettarsi che il RID cambi subito dopo il comando']::text[]),
  ('6f8b388b-d632-5499-8970-396157a10251', '00f947c6-9c0b-5e79-b092-ac96d6ca1434', 'v3', 1, 'Un router con sole interfacce IPv6 avvia OSPFv3 e il processo non parte. Perché?', 'Anche in OSPFv3 il Router ID resta un numero di 32 bit. Se il router non ha alcun indirizzo IPv4 da cui ricavarlo, bisogna configurarlo a mano con `router-id` nel processo `ipv6 router ospf`.', array['RID a 32 bit anche in OSPFv3', 'Senza IPv4 va configurato a mano']::text[], '{}'::text[]),
  ('6a6b9880-4ec1-5296-ae01-73c714589484', '81d555a3-f2bb-5df3-8872-fd39ae63611c', 'network', 0, 'Cosa fa esattamente `network 10.0.12.0 0.0.0.3 area 0`?', 'Attiva OSPF in area 0 su tutte le interfacce il cui indirizzo IP rientra in 10.0.12.0–10.0.12.3. Su quelle interfacce il router invia Hello, forma adiacenze e annuncia la subnet configurata. Non annuncia direttamente un prefisso.', array['Seleziona interfacce', 'Wildcard 0.0.0.3 = 4 indirizzi', 'Annuncia la subnet dell''interfaccia']::text[], array['Pensare che il comando annunci la rete scritta, anche senza interfacce corrispondenti']::text[]),
  ('8a59b525-3437-5c97-a967-3cc62e67bff6', '81d555a3-f2bb-5df3-8872-fd39ae63611c', 'passive', 1, 'Perché si configura `passive-interface` sull''interfaccia LAN degli utenti, e cosa continua a succedere su quell''interfaccia?', 'Per non inviare Hello OSPF in una LAN dove non ci sono router: evita traffico inutile e impedisce che un dispositivo non autorizzato formi un''adiacenza. La subnet della LAN continua comunque a essere annunciata agli altri router.', array['Niente Hello', 'La subnet resta annunciata']::text[], '{}'::text[]),
  ('a855ad86-b967-52c8-bd99-e6fc8c9b0fcb', '2285243a-cf60-5402-ac43-bd59eb5f8583', 'exstart', 0, 'Due router OSPF restano bloccati in EXSTART/EXCHANGE. Qual è la causa più frequente?', 'Un MTU diverso sulle due interfacce. Gli Hello passano e i router arrivano a 2-Way, ma i pacchetti DBD sono rifiutati dal lato con MTU più piccolo e lo scambio non si completa.', array['MTU mismatch', 'Gli Hello passano, i DBD no']::text[], '{}'::text[]),
  ('44b0c2ff-059f-582c-8c6f-8e394d4d99d3', '2285243a-cf60-5402-ac43-bd59eb5f8583', 'steps', 1, 'R1 e R2 si pingano ma non sono vicini OSPF. Elenca, in ordine, cosa controlli.', 'Che OSPF sia attivo sulle interfacce e che non siano passive; che area, subnet/mask, Hello/Dead e tipo di rete coincidano; che i Router ID siano diversi; che l''autenticazione sia uguale; che nessuna ACL blocchi il protocollo 89 o il multicast 224.0.0.5. Se arrivano a ExStart, l''MTU.', array['OSPF attivo e non passivo', 'Parametri Hello', 'RID unici', 'ACL']::text[], '{}'::text[]),
  ('accf79ac-f5bc-567b-b6bc-3cd12b7f4334', '36a14c81-1b3a-5496-b6a4-3538123c71c6', 'nexthop', 0, 'Perché in `show ipv6 route ospf` il next hop delle route OSPFv3 è un indirizzo fe80::?', 'Perché OSPFv3 invia i propri pacchetti usando l''indirizzo link-local dell''interfaccia come origine. Il router impara quindi i vicini tramite il loro link-local, che diventa il next hop delle route.', array['Pacchetti OSPFv3 da link-local', 'Next hop = link-local del vicino']::text[], '{}'::text[]),
  ('fa636991-e7be-57ed-8a55-194e3e1d93fb', '1eda16c4-b633-5954-b191-7423f09dffe5', 'mac', 0, 'Perché un FHRP usa anche un MAC address virtuale e non solo un IP virtuale?', 'Perché gli host memorizzano nella cache ARP il MAC address del gateway. Se il gateway rispondesse con il MAC reale del router attivo, dopo un failover gli host continuerebbero a inviare frame al MAC del router guasto finché la cache non scade. Con un MAC virtuale condiviso il nuovo Active risponde allo stesso MAC e il passaggio è trasparente.', array['Cache ARP degli host', 'MAC virtuale condiviso', 'Gratuitous ARP per aggiornare gli switch']::text[], '{}'::text[]),
  ('c2ffe11c-4a13-5b88-ac69-82214430d796', '1eda16c4-b633-5954-b191-7423f09dffe5', 'preempt', 1, 'R1 (priorità 110) è HSRP Active, R2 (priorità 100) Standby. R1 si riavvia e torna online. Chi è Active? E con VRRP?', 'In HSRP resta Active R2, perché la preemption è disattiva per default: serve `standby <gruppo> preempt` su R1. In VRRP la preemption è attiva per default, quindi R1 torna Master.', array['HSRP: preempt disattivo di default', 'VRRP: preempt attivo di default']::text[], '{}'::text[]),
  ('189ed33f-00bd-5b7c-970a-6255676da040', '20c22bf3-b697-5fdf-ab9c-acc284c00eed', 'both-active', 0, 'Su R1 e R2 `show standby brief` mostra State Active per lo stesso gruppo. Cosa significa e cosa controlli?', 'I due router non ricevono gli Hello HSRP l''uno dell''altro, quindi ciascuno si considera Active. Si controlla che le interfacce siano nella stessa VLAN e subnet, che numero di gruppo e versione HSRP coincidano e che nessuna ACL blocchi il multicast HSRP.', array['Hello non ricevuti', 'Stessa VLAN, gruppo, versione', 'ACL']::text[], '{}'::text[]),
  ('062415ae-6e8a-59df-97bb-caf5eb2531d6', '449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152', 'terms', 0, 'PC1 (192.168.1.10) naviga su un server (198.51.100.20) attraverso R1, che usa PAT con l''indirizzo 203.0.113.5. Indica inside local, inside global, outside local e outside global.', 'Inside local 192.168.1.10; inside global 203.0.113.5; outside global 198.51.100.20; outside local 198.51.100.20 (il server non viene tradotto, quindi appare allo stesso modo anche dall''interno).', array['Inside/outside = di chi è l''host', 'Local/global = da quale lato lo vedi']::text[], array['Pensare che l''indirizzo del server sia inside global perché è pubblico']::text[]),
  ('a373b4b4-625c-576d-9094-38b8de2355d6', '449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152', 'pat', 1, 'Come fa un router PAT a distinguere le risposte destinate a due PC interni che usano lo stesso indirizzo pubblico?', 'Tiene una tabella di traduzione che associa indirizzo e porta interni a indirizzo pubblico e porta. Le risposte arrivano tutte all''indirizzo pubblico, ma con porte di destinazione diverse: dalla porta il router ricava l''host interno. Se due host usano la stessa porta di origine, il router ne assegna una diversa.', array['Traduzione indirizzo + porta', 'NAT table', 'Porta diversa se in conflitto']::text[], '{}'::text[]),
  ('b2b36960-5e8e-5778-ab7a-3e3f9da70ed1', '8eef167f-6d28-54d1-9e17-8bf5908d06b3', 'pat', 0, 'Scrivi la configurazione PAT che traduce la LAN 10.1.1.0/24 sull''indirizzo dell''interfaccia Gi0/0/0 (outside), con Gi0/0/1 inside.', '`interface g0/0/1` + `ip nat inside`; `interface g0/0/0` + `ip nat outside`; `access-list 1 permit 10.1.1.0 0.0.0.255`; `ip nat inside source list 1 interface g0/0/0 overload`.', array['inside/outside sulle interfacce', 'ACL per selezionare', 'overload = PAT']::text[], array['Dimenticare ip nat inside/outside', 'Omettere overload e ottenere NAT dinamico 1:1']::text[]),
  ('762d1acd-0801-58b5-a58d-e243639d18d9', '0a475bf0-007c-5558-b4e1-4879f1557116', 'empty', 0, 'La tabella NAT resta vuota anche se gli utenti generano traffico verso Internet. Quali tre cose verifichi per prime?', 'Che `ip nat inside` sia sull''interfaccia verso la LAN e `ip nat outside` su quella verso l''ISP; che l''ACL usata nella regola NAT corrisponda alla subnet reale degli host; che esista una route (di solito la default) verso Internet.', array['inside/outside corretti', 'ACL corrispondente', 'Route verso l''esterno']::text[], '{}'::text[]),
  ('5a006b3e-67d3-5218-a808-9a51a7e7e2ba', '8035bedc-7639-5358-a7ce-bf2dd7c6f984', 'relay', 0, 'Il server DHCP è in 10.0.100.0/24, i PC della VLAN 20 in 192.168.20.0/24. Dove configuri `ip helper-address` e come fa il server a sapere da quale pool assegnare l''indirizzo?', 'Sull''interfaccia (o sotto-interfaccia/SVI) che fa da gateway per la VLAN 20, cioè dove arriva il broadcast del client. Il relay inoltra la richiesta in unicast e scrive nel campo giaddr l''indirizzo di quell''interfaccia (192.168.20.1): il server sceglie il pool che contiene quell''indirizzo.', array['Sull''interfaccia della VLAN dei client', 'Broadcast → unicast', 'giaddr seleziona lo scope']::text[], array['Configurarlo sull''interfaccia verso il server']::text[]),
  ('f7a488ab-1c2c-5ede-800a-1f3bc8b1c9ab', '075a52d9-9c2d-54d8-8c6a-dd50e28243c6', 'apipa', 0, 'Cosa indica un indirizzo 169.254.x.x su un client Windows e quali sono i punti da verificare nell''ordine?', 'Che il client non ha ricevuto alcuna risposta DHCP e si è assegnato un indirizzo link-local. Si verifica: VLAN della porta e trunk; SVI o gateway up; `ip helper-address` sull''interfaccia della VLAN se il server è remoto; scope presente sul server e route di ritorno; porte trusted se è attivo DHCP snooping; pool non esaurito.', array['169.254 = nessuna risposta DHCP', 'L2 → gateway → relay → server → snooping']::text[], '{}'::text[]),
  ('92a8029f-901f-5a63-a8b1-ed662a6e32bd', '3aa005c1-b264-58dc-86d1-bd787e242596', 'mx', 0, 'La posta per esempio.it non arriva. Il record MX punta a mail.esempio.it. Cosa verifichi?', 'Che il record MX esista e abbia la priorità prevista, che mail.esempio.it abbia un record A (o AAAA) con l''indirizzo corretto del server di posta e che quel server sia raggiungibile sulle porte di posta. Un MX deve puntare a un nome, non a un indirizzo IP né a un CNAME.', array['MX → nome', 'Il nome deve avere A/AAAA']::text[], '{}'::text[]),
  ('4be00043-4c55-5faa-bc41-b613481a6fab', '3aa005c1-b264-58dc-86d1-bd787e242596', 'ttl', 1, 'Hai cambiato il record A di www.esempio.it un''ora fa. Alcuni utenti vedono il nuovo server, altri il vecchio. Perché?', 'I resolver e i client conservano in cache la risposta precedente per la durata del TTL del record. Finché il TTL non scade, continuano a usare il vecchio indirizzo. Sul client si può svuotare la cache con `ipconfig /flushdns`.', array['Cache per la durata del TTL']::text[], '{}'::text[]),
  ('b5597e8e-0e6d-53c2-8409-06302ade7de4', '78a39a80-291a-5670-b8ca-b8f8f73f1d89', 'implicit', 0, 'Un''ACL applicata in ingresso contiene solo `deny 192.168.1.50`. Che effetto ha sul resto del traffico?', 'Blocca tutto. 192.168.1.50 corrisponde alla regola deny; tutti gli altri pacchetti non corrispondono a nessuna regola e vengono scartati dal deny implicito finale. Serve aggiungere `permit any` dopo la regola deny.', array['Prima corrispondenza', 'Deny implicito finale', 'Serve almeno un permit']::text[], array['Pensare che il traffico non citato passi']::text[]),
  ('5a4c7644-e444-5da6-a8dc-fcafc4decdb2', '78a39a80-291a-5670-b8ca-b8f8f73f1d89', 'place', 1, 'Perché un''ACL standard si applica vicino alla destinazione e un''estesa vicino all''origine?', 'La standard confronta solo l''origine: vicino all''origine bloccherebbe quell''host verso ogni destinazione. Vicino alla destinazione blocca solo il traffico diretto lì. L''estesa specifica anche destinazione e protocollo, quindi può stare vicino all''origine ed evitare che il traffico vietato attraversi la rete.', array['Standard: solo origine → vicino alla destinazione', 'Estesa: precisa → vicino all''origine']::text[], '{}'::text[]),
  ('1a793d42-0ab0-5563-ba93-489813e69390', '8109621d-9488-5492-9efa-13b66f3015f3', 'subnet', 0, 'Quale wildcard mask seleziona la subnet 172.16.32.0/20?', '0.0.15.255. La mask /20 è 255.255.240.0; 255.255.255.255 − 255.255.240.0 = 0.0.15.255. Il comando è ad esempio `permit 172.16.32.0 0.0.15.255`.', array['255.255.255.255 − mask', '/20 → 0.0.15.255']::text[], array['Usare la Subnet Mask al posto della wildcard']::text[]),
  ('0b780373-83b4-5d27-bdb1-05d5a9c01202', '8109621d-9488-5492-9efa-13b66f3015f3', 'range', 1, 'Quali indirizzi seleziona `192.168.10.64 0.0.0.31`?', 'Da 192.168.10.64 a 192.168.10.95: la wildcard 0.0.0.31 lascia liberi gli ultimi 5 bit, cioè 32 indirizzi a partire da .64 (la subnet 192.168.10.64/27).', array['31 = 5 bit liberi = 32 indirizzi', 'Corrisponde a /27']::text[], '{}'::text[]),
  ('3503e89d-9fe3-582c-977a-284523e8faf0', '8109621d-9488-5492-9efa-13b66f3015f3', 'host', 2, 'Scrivi in due modi equivalenti la condizione "solo l''host 10.0.0.5".', '`host 10.0.0.5` oppure `10.0.0.5 0.0.0.0`: la wildcard tutta a zero richiede che ogni bit coincida.', array['host = wildcard 0.0.0.0']::text[], '{}'::text[]),
  ('6f3f121b-3ee5-566d-867a-2e11ff5f17a9', 'b77ab9ed-dd5c-5582-8f93-f52885da90e1', 'order', 0, 'Nella ACL OSPITI-IN, cosa succederebbe se la regola `deny ip 192.168.50.0 0.0.0.255 10.0.0.0 0.255.255.255` fosse la prima?', 'Il traffico HTTPS verso 10.10.10.80 e il DNS verso 10.10.10.53 verrebbero bloccati, perché quegli indirizzi rientrano in 10.0.0.0/8 e il router si ferma alla prima regola che corrisponde. I permit specifici devono precedere il deny generico.', array['Prima corrispondenza', 'Specifico prima del generico']::text[], '{}'::text[]),
  ('97ef4c7b-dc21-58b0-ba30-79e61ace44a3', 'b77ab9ed-dd5c-5582-8f93-f52885da90e1', 'edit', 1, 'Come inserisci una nuova regola tra la 10 e la 20 di un''ACL named senza riscriverla?', 'Si entra in `ip access-list extended <nome>` e si scrive la regola con un numero di sequenza intermedio, ad esempio `15 permit ...`. Con `no <numero>` si cancella una singola regola.', array['Numeri di sequenza', 'no <seq> per cancellare']::text[], '{}'::text[]),
  ('7ba206b6-06b9-507c-b976-a5c740a89372', '5d131b49-d63b-56b3-ad08-34a0dbac9926', 'modes', 0, 'Confronta le modalità di violazione protect, restrict e shutdown.', 'Tutte scartano i frame dei MAC non autorizzati. Protect lo fa in silenzio, senza log né contatore. Restrict genera log/trap SNMP e incrementa il contatore, ma la porta resta attiva. Shutdown, il default, porta l''interfaccia in err-disabled.', array['protect: silenzioso', 'restrict: log + contatore', 'shutdown: err-disabled (default)']::text[], array['Pensare che protect generi log', 'Pensare che la modalità di default sia restrict']::text[]),
  ('a4018b0b-3a3e-5114-be26-81f375ed9b49', '5d131b49-d63b-56b3-ad08-34a0dbac9926', 'sticky', 1, 'Hai configurato `mac-address sticky`, lo switch si riavvia e i MAC appresi spariscono. Perché?', 'Gli indirizzi sticky vengono scritti nella running-config. Se non si salva con `copy running-config startup-config` (o `write memory`), dopo il riavvio vanno persi.', array['Sticky → running-config', 'Salvare la configurazione']::text[], '{}'::text[]),
  ('faf44189-d4af-5fbf-a066-697df7137145', 'cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728', 'trust', 0, 'Su quali porte configuri `ip dhcp snooping trust` e cosa succede se dimentichi l''uplink verso il server?', 'Sulle porte verso il server DHCP legittimo e sugli uplink verso gli switch di distribuzione o il router che fa da relay. Se l''uplink resta untrusted, lo switch scarta le OFFER e gli ACK del server vero e nessun client ottiene un indirizzo.', array['Trusted: server e uplink', 'Untrusted scarta OFFER/ACK']::text[], array['Mettere trusted le porte degli utenti']::text[]),
  ('793109c7-6e2a-5381-bc05-e0ae6c2bfdd6', 'cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728', 'binding', 1, 'A cosa serve la binding table di DHCP snooping oltre a bloccare i server non autorizzati?', 'Registra per ogni client MAC, IP, VLAN e porta. Altre funzioni di sicurezza la usano come fonte di verità, in particolare Dynamic ARP Inspection (e IP Source Guard) per verificare che un host usi davvero l''indirizzo che gli è stato assegnato.', array['MAC-IP-VLAN-porta', 'Usata da DAI']::text[], '{}'::text[]),
  ('bda78087-5d78-5cf9-88de-bf50fe2325cb', '35bedb68-10ff-55ac-b2a6-9c958cbca79e', 'how', 0, 'Come decide DAI se un ARP ricevuto su una porta untrusted è legittimo?', 'Confronta l''indirizzo IP e il MAC address dichiarati nel messaggio ARP con la binding table di DHCP snooping (o con un''ARP ACL per gli host statici). Se non esiste un binding corrispondente per quella VLAN e porta, l''ARP viene scartato.', array['Binding table di DHCP snooping', 'ARP ACL per host statici', 'Solo porte untrusted']::text[], '{}'::text[]),
  ('8309473f-95ee-5635-8db4-cbfc84f15bac', '35bedb68-10ff-55ac-b2a6-9c958cbca79e', 'static', 1, 'Dopo aver attivato DAI, una stampante con IP statico non comunica più. Perché?', 'La stampante non ha ottenuto l''indirizzo via DHCP, quindi nella binding table non esiste alcun binding per lei. DAI considera i suoi ARP non validi e li scarta. Serve un''ARP ACL che autorizzi la sua coppia IP–MAC (o una voce statica nella binding table).', array['Nessun binding per gli IP statici', 'ARP ACL']::text[], '{}'::text[]),
  ('8ebc340c-25ae-587d-9b10-e6f38546d920', '93d8fe55-e868-50cd-bf37-c2edeafdcb47', 'ra', 0, 'Perché RA Guard è utile anche in una rete aziendale che non ha ancora pianificato IPv6?', 'Perché i sistemi operativi moderni hanno IPv6 attivo per default e accettano i Router Advertisement. Un dispositivo che invia RA falsi può far configurare agli host un indirizzo e un Default Gateway IPv6 controllati da lui, e intercettare il traffico che preferisce IPv6. RA Guard scarta gli RA sulle porte degli host.', array['IPv6 attivo per default sugli host', 'RA falsi = gateway falso', 'Filtrare gli RA sulle porte host']::text[], '{}'::text[]),
  ('7ec8c5e3-54cb-5bfd-b047-62b6358cba9d', '93d8fe55-e868-50cd-bf37-c2edeafdcb47', 'storm', 1, 'Storm control sostituisce lo Spanning Tree? Motiva.', 'No. Lo Spanning Tree evita che il loop si formi bloccando le porte ridondanti. Storm control interviene dopo, limitando il volume di broadcast/multicast/unicast su una porta: attenua i danni di un loop o di un dispositivo guasto, ma non rimuove la causa.', array['STP previene', 'Storm control limita i danni']::text[], '{}'::text[]),
  ('0a4a56a5-3d5e-5f3a-a9fc-5b442c3b32df', '816c4e9d-4e7c-5254-9f18-bfcc030d5095', 'prereq', 0, 'Quali prerequisiti servono prima di generare le chiavi RSA per SSH su un dispositivo Cisco, e perché?', 'Un hostname diverso da quello di default e un nome di dominio (`ip domain name`). Il dispositivo usa la combinazione hostname.dominio per nominare la coppia di chiavi RSA; senza, il comando `crypto key generate rsa` viene rifiutato.', array['hostname', 'ip domain name', 'Chiave nominata hostname.dominio']::text[], '{}'::text[]),
  ('27c1cdd0-326e-5e04-98a6-c64503d6b9c6', '816c4e9d-4e7c-5254-9f18-bfcc030d5095', 'vty', 1, 'Quali comandi sulle linee VTY impediscono Telnet e limitano l''accesso alla sola rete di gestione?', '`transport input ssh` accetta solo SSH; `access-class <ACL> in` applica un''ACL standard che consente solo gli indirizzi della rete di gestione; `login local` richiede utente e password locali.', array['transport input ssh', 'access-class', 'login local']::text[], '{}'::text[]),
  ('06b1a6e3-289d-5496-b473-28f695beba90', '13c2c721-2ea4-5ed4-91af-3d9f30800af5', 'compare', 0, 'Perché per l''amministrazione dei dispositivi di rete si preferisce TACACS+ a RADIUS?', 'Perché TACACS+ separa autenticazione, autorizzazione e accounting, consentendo di autorizzare e registrare ogni singolo comando, e offusca l''intero corpo del pacchetto, non solo la password. Usa inoltre TCP 49. RADIUS combina autenticazione e autorizzazione ed è più adatto all''accesso degli utenti alla rete (802.1X, VPN).', array['AAA separati', 'Autorizzazione per comando', 'Tutto il pacchetto protetto']::text[], '{}'::text[]),
  ('71482f06-4b07-535c-9e22-1e8d26ef2dcf', '13c2c721-2ea4-5ed4-91af-3d9f30800af5', 'fallback', 1, 'Cosa fa `local` in `aaa authentication login default group tacacs+ local` e quando entra in gioco?', 'È il metodo di riserva: se nessun server TACACS+ risponde, il dispositivo usa il database degli utenti locali. Non viene usato se il server risponde rifiutando le credenziali.', array['Fallback solo se il server non risponde']::text[], array['Pensare che local venga provato anche quando il server rifiuta la password']::text[]),
  ('abaec370-6960-5e5f-b38e-9d3d75036650', 'dc8482bb-6869-5202-909a-8de3b9530442', 'why', 0, 'Perché per il backup delle configurazioni si usa SCP o SFTP invece di TFTP?', 'TFTP non ha autenticazione e trasmette il file in chiaro su UDP 69. Una configurazione contiene informazioni sensibili (hash delle password, chiavi AAA e VPN, community SNMP). SCP e SFTP viaggiano dentro una sessione SSH cifrata e autenticata.', array['TFTP: niente autenticazione né cifratura', 'SCP/SFTP dentro SSH']::text[], '{}'::text[]),
  ('96fbf2eb-2aca-5d07-bc80-d4ef14fe6911', '09a8d6ec-71af-5c14-bdfe-41242583ef9b', 'ah-esp', 0, 'Una VPN deve garantire riservatezza del traffico e attraversare un router che fa NAT. Usi AH o ESP? Perché?', 'ESP. AH fornisce integrità e autenticazione ma non cifra, e protegge anche campi dell''header IP che il NAT modifica, quindi non funziona attraverso il NAT. ESP cifra il payload e, con NAT-Traversal (incapsulamento in UDP 4500), attraversa il NAT.', array['AH non cifra', 'AH incompatibile con NAT', 'ESP + NAT-T']::text[], '{}'::text[]),
  ('14c2fe03-f78a-5c72-a53d-8dc72cea535f', '09a8d6ec-71af-5c14-bdfe-41242583ef9b', 'tunnel', 1, 'Che differenza c''è tra transport mode e tunnel mode in IPsec?', 'In transport mode IPsec protegge il payload e mantiene l''header IP originale: si usa tra due host. In tunnel mode protegge l''intero pacchetto originale, header compreso, e aggiunge un nuovo header IP con gli indirizzi dei gateway: è la modalità delle VPN site-to-site.', array['Transport: header originale visibile', 'Tunnel: nuovo header, pacchetto intero protetto']::text[], '{}'::text[]),
  ('269b4052-bf7d-59cf-a628-550fbda2c37d', '09324d70-e863-5a05-b891-81d95bd17f1c', 'levels', 0, 'Con `logging trap notifications` (livello 5), quali messaggi arrivano al server syslog?', 'I messaggi di livello da 0 a 5: Emergency, Alert, Critical, Error, Warning e Notice. Informational (6) e Debug (7) no. Un livello include sé stesso e tutti quelli più gravi.', array['Livello configurato + quelli più gravi', '0–5']::text[], array['Pensare che arrivino solo i messaggi di livello 5', 'Pensare che arrivino i livelli 5–7']::text[]),
  ('4ef40e23-3fb6-5362-9110-031ff14409dc', '09324d70-e863-5a05-b891-81d95bd17f1c', 'parse', 1, 'Nel messaggio `%OSPF-5-ADJCHG: Process 1, Nbr 2.2.2.2 on Gi0/0 from FULL to DOWN` individua facility, severità e mnemonico.', 'Facility OSPF, severità 5 (Notice), mnemonico ADJCHG (cambio di adiacenza). Il testo indica che il vicino 2.2.2.2 è passato da FULL a DOWN.', array['%FACILITY-SEVERITÀ-MNEMONICO']::text[], '{}'::text[]),
  ('e32983ef-96c1-5ac9-b760-47ccbc9aed82', '54ff5635-fecc-5042-acba-b3c69590f70f', 'trap-inform', 0, 'Che differenza c''è tra una Trap e un Inform SNMP?', 'Entrambi sono notifiche inviate dall''agent al manager senza che il manager le abbia richieste. La Trap non prevede conferma: se va persa, l''agent non lo sa. L''Inform richiede una Response dal manager e viene ritrasmesso se la conferma non arriva.', array['Trap: nessuna conferma', 'Inform: confermato']::text[], '{}'::text[]),
  ('6091e0ec-a68d-5781-906e-6005c4d6e66c', '54ff5635-fecc-5042-acba-b3c69590f70f', 'v3', 1, 'Perché SNMPv2c è considerato insicuro e cosa offre SNMPv3?', 'SNMPv2c autentica solo con una community string che viaggia in chiaro: chi intercetta il traffico la legge, e una community read-write consente di modificare la configurazione. SNMPv3 introduce utenti con autenticazione (es. SHA) e cifratura (es. AES), con il livello authPriv.', array['v2c: community in chiaro', 'v3: auth + priv']::text[], '{}'::text[]),
  ('52a59d3b-cbc1-57e4-9cb1-10ada0cef8ea', '9a4610c6-6a22-5496-916e-9fd15656e371', 'planes', 0, 'Distingui data plane, control plane e management plane con un esempio ciascuno.', 'Data plane: inoltrare un frame o un pacchetto, applicare un''ACL in hardware. Control plane: calcolare le route con OSPF, eleggere il Root Bridge, risolvere ARP. Management plane: accedere al dispositivo via SSH, interrogarlo con SNMP o tramite API.', array['Data: inoltro', 'Control: decisioni e protocolli', 'Management: accesso e gestione']::text[], '{}'::text[]),
  ('b4de206c-d81c-5aa9-9e82-b4e0a430919d', '9a4610c6-6a22-5496-916e-9fd15656e371', 'apis', 1, 'Cosa sono le API northbound e southbound di un controller SDN?', 'Le northbound collegano il controller alle applicazioni e agli script degli amministratori, di solito con REST e JSON. Le southbound collegano il controller ai dispositivi che gestisce, con protocolli come NETCONF, RESTCONF, OpenFlow o SSH.', array['Northbound: verso app (REST/JSON)', 'Southbound: verso dispositivi']::text[], '{}'::text[]),
  ('e68ed7f3-60fd-5fd1-87c6-217bfc624b54', '8840c908-6860-592f-bc95-deff22d874b4', 'module', 0, 'Vuoi aggiungere una VLAN a 50 switch con Ansible. Usi ios_command? Motiva.', 'No. `ios_command` esegue comandi e ne restituisce l''output ma non supporta la modalità di configurazione: è adatto ai comandi show. Per modificare la configurazione si usa `cisco.ios.ios_config` o un modulo dedicato come `cisco.ios.ios_vlans`.', array['ios_command: solo lettura/EXEC', 'ios_config o moduli di risorsa per modificare']::text[], '{}'::text[]),
  ('51138a9b-41d1-5f21-9f20-9167cd6ac121', '8840c908-6860-592f-bc95-deff22d874b4', 'agentless', 1, 'Cosa significa che Ansible è agentless e quale protocollo usa con i dispositivi Cisco IOS?', 'Che non serve installare software sui dispositivi gestiti: il nodo di controllo si collega direttamente via SSH (connessione network_cli) ed esegue i task. Strumenti come Puppet e Chef invece usano di norma un agent sul nodo.', array['Nessun agent', 'SSH / network_cli', 'Push']::text[], '{}'::text[]),
  ('2b328fc7-24c9-59c9-b1b0-72d2e914ff8c', 'c8bde22b-8ea9-56d5-88ac-e862213a5017', 'agentic', 0, 'In cosa si distingue un sistema di AI agentica da un assistente generativo usato in chat, nel contesto delle operazioni di rete?', 'L''assistente generativo produce una risposta (testo, comandi) a una richiesta e si ferma: è l''operatore a decidere e agire. Il sistema agentico riceve un obiettivo, pianifica più passi e usa strumenti (API, comandi, ticket) per raccogliere dati e, se autorizzato, agire, valutando il risultato a ogni passo. Per questo richiede privilegi minimi, approvazione umana e log delle azioni.', array['Obiettivo → piano → azioni con strumenti', 'Human in the loop', 'Privilegi minimi e log']::text[], '{}'::text[]),
  ('9e5f3cb7-8e3e-5333-ae0c-f4b37d918f3f', 'c8bde22b-8ea9-56d5-88ac-e862213a5017', 'prompt', 1, 'Stai per chiedere a un servizio AI esterno di analizzare la running-config di un router. Cosa fai prima di incollarla?', 'Rimuovo o sostituisco con segnaposto ogni dato sensibile: hash e password, chiavi di AAA, VPN e routing, community SNMP, indirizzi pubblici e nomi interni. Poi scrivo un prompt con piattaforma, versione, obiettivo dell''analisi e formato della risposta, e verifico i suggerimenti prima di applicarli.', array['Niente segreti in un servizio esterno', 'Contesto, vincoli, formato', 'Verificare l''output']::text[], '{}'::text[]),
  ('64645f8b-3f5b-5422-a804-8531ddad871b', 'ddfdd16f-1d44-53f5-a5cc-35037d614b48', 'types', 0, 'Che differenza c''è tra un hypervisor di tipo 1 e uno di tipo 2? Fai un esempio di ciascuno.', 'Il tipo 1 (bare metal) gira direttamente sull''hardware del server, senza un sistema operativo sotto, ed è usato nei data center: VMware ESXi, Hyper-V, KVM. Il tipo 2 (hosted) gira come applicazione sopra un sistema operativo esistente ed è usato per test e laboratori: VirtualBox, VMware Workstation.', array['Tipo 1: sull''hardware', 'Tipo 2: sopra un OS']::text[], '{}'::text[]),
  ('c63cc190-2c95-51d8-9311-65c1fa365182', 'ddfdd16f-1d44-53f5-a5cc-35037d614b48', 'vm-container', 1, 'Perché un container si avvia più in fretta di una VM, e qual è il compromesso?', 'Il container non contiene un sistema operativo completo: condivide il kernel dell''host e include solo l''applicazione e le sue dipendenze, quindi non deve avviare un OS. Il compromesso è un isolamento minore: tutti i container dipendono dallo stesso kernel.', array['Kernel condiviso', 'Più leggero, meno isolato']::text[], '{}'::text[]),
  ('1ea22b8e-8f53-580f-a811-3c39465244b3', 'ddfdd16f-1d44-53f5-a5cc-35037d614b48', 'trunk', 2, 'Perché la porta dello switch verso un server di virtualizzazione è spesso configurata come trunk?', 'Perché sul server girano VM che appartengono a VLAN diverse. Il vSwitch dell''hypervisor riceve i frame taggati 802.1Q dall''uplink fisico e li consegna alle VM della VLAN corretta.', array['VM in VLAN diverse', 'vSwitch gestisce i tag']::text[], '{}'::text[]),
  ('36a31fd6-b9a0-5e3a-8944-db733ffa0a6b', '55c767e2-841b-5003-b493-023452c32dd8', 'channels', 0, 'Devi installare tre AP vicini in banda 2,4 GHz. Quali canali assegni e perché?', '1, 6 e 11: sono gli unici tre canali da 20 MHz che non si sovrappongono nella banda 2,4 GHz, perché i canali sono distanziati di 5 MHz mentre ognuno occupa circa 20–22 MHz.', array['1, 6, 11', 'Canali distanziati 5 MHz']::text[], array['Usare 1, 2, 3 pensando che numeri diversi bastino']::text[]),
  ('1a433eb3-553e-5c1d-9983-78f848d40dbd', '55c767e2-841b-5003-b493-023452c32dd8', 'db', 1, 'Un client passa da −55 dBm a −58 dBm. Quanto è cambiata la potenza ricevuta?', 'È dimezzata: una diminuzione di 3 dB corrisponde alla metà della potenza.', array['−3 dB = metà', '+3 dB = doppio']::text[], '{}'::text[]),
  ('a8645db0-2393-5e30-b4bd-67c8f3048ea3', 'a1aa299b-b36b-5086-9d1d-53515fdb542c', 'enterprise', 0, 'Perché in azienda si preferisce WPA2/WPA3-Enterprise a una passphrase condivisa?', 'Con Enterprise ogni utente si autentica individualmente via 802.1X/EAP contro un server RADIUS: si può revocare un singolo accesso, applicare policy per utente e registrare chi si collega. Con una passphrase condivisa, l''uscita di un dipendente obbliga a cambiarla su tutti i dispositivi e non si sa chi si è collegato.', array['Credenziali individuali', '802.1X + RADIUS', 'Revoca per utente']::text[], '{}'::text[]),
  ('80d91106-8721-5546-b2ef-0b53480e4c46', 'a1aa299b-b36b-5086-9d1d-53515fdb542c', 'sae', 1, 'Quale vulnerabilità di WPA2-PSK affronta SAE in WPA3?', 'Con WPA2-PSK chi cattura il 4-way handshake può provare offline milioni di password finché non trova quella giusta. SAE usa uno scambio che non espone dati utili a questo attacco: ogni tentativo richiede un''interazione con la rete, rendendo impraticabile l''attacco a dizionario offline.', array['Attacco a dizionario offline', 'SAE lo impedisce']::text[], '{}'::text[]),
  ('c763d3a3-3cdf-573a-bf60-388487dcf957', 'ede7ab03-ea04-5ffd-8865-0c143e3bbffe', 'snr', 0, 'Un client ha RSSI −55 dBm ma prestazioni pessime. Perché l''RSSI da solo non basta per diagnosticare il problema?', 'Perché le prestazioni dipendono dal rapporto segnale/rumore (SNR). Se c''è molto rumore, ad esempio da un forno a microonde, l''SNR è basso anche con un segnale forte e il client deve ritrasmettere o usare velocità più basse.', array['Conta l''SNR', 'Rumore alto = SNR basso anche con buon RSSI']::text[], '{}'::text[]),
  ('7cf0a1a1-2fe9-5494-9cf8-995eff739bfe', 'ede7ab03-ea04-5ffd-8865-0c143e3bbffe', 'cci-aci', 1, 'Che differenza c''è tra co-channel interference e adjacent channel interference?', 'Nella co-channel più AP usano lo stesso canale: si riconoscono e si alternano nella trasmissione, quindi la capacità si divide ma i frame restano decodificabili. Nell''adjacent channel gli AP usano canali sovrapposti ma diversi: non si coordinano e ciascuno vede l''altro come rumore, con errori e ritrasmissioni.', array['Co-channel: contesa', 'Adjacent: rumore, peggio']::text[], '{}'::text[])
on conflict (id) do update set position = excluded.position, prompt = excluded.prompt, answer = excluded.answer,
  key_points = excluded.key_points, common_mistakes = excluded.common_mistakes;

delete from public.recall_prompts where content_id in ('cb0ed29e-3d26-5e98-b360-23fb97c984aa', '680d75cd-a68c-57fa-9c41-1e35f2b23289', 'd5c4cbdd-ac9a-59ad-a954-c10a7b014867', 'dffaabcf-a56e-534d-a38c-842ff9792b6a', '155166f9-ff64-5536-a48a-567fe28dc070', '23525bc3-5cd3-5714-9998-75e73e7587e9', '9a88255c-bfdb-5e9b-aba4-affc0270c6d4', '0eff06c7-01d8-5299-be8d-34de078f7b8b', '3305bbc1-e089-51b2-9c84-a7425949b96b', '00702e75-7c76-53b2-ae62-8e735e8d9c77', '33c79380-e583-5727-aff9-910497dbc6f0', 'a483047e-e685-5e1c-964f-c2de0a4c7c49', '191e7924-adde-5d9e-b1b2-21480459a5ca', 'bc911fd7-e523-599f-a19d-54fd2993b410', 'd382335d-a200-525f-9120-15334aa1f322', 'a91010c7-1bb6-535b-9004-7f3fb7668ba1', '85454276-0723-52d6-ba26-7a94ef15aa46', 'd0939326-daf8-5b17-882a-38d4ab290ae2', '515d68b9-e263-5df9-882c-a1571f1073fa', '6ea16f93-12c0-5293-bdbe-5f63f369fdac', 'cf331cd3-a550-5c6b-ae59-f8151d3b9355', '078e5817-97ec-5f15-bf73-e040a7fdce7d', '5e78a1cc-d447-5987-a2c0-cff10b2c1045', '19ad7725-4602-5b20-862c-1896f50516d3', 'c929301e-ecaa-5e4a-a3a3-0cfcf6281c77', 'fb919662-a463-51e1-9f1b-94eb611d0f49', '7c9d8143-ee1d-56f4-8dc2-4aeb1f3cb2b4', 'b4a7a38b-659c-5422-aaa3-119c4cd6b869', '31312177-9638-5483-a52d-1a553a958a4c', '280aaced-4d95-556f-bba5-2bc86aa823da', 'be098602-8939-5896-a525-c8867527e7f4', 'df479dab-854b-573d-8554-235c4540221e', '1fb6663f-73a9-532b-abd4-35a041912ab3', 'cf69d04d-1dea-5c58-9cb8-7013ba67e62a', '45145bca-b4dc-5d0e-b561-8c03cd24610b', '67333b75-0bae-57d6-a48a-f3bd5d318acb', '588fd3db-064d-5429-90a1-2d39a6655df7', '436e1cfb-339e-5ee1-90a7-84862b868b60', '4cacfc2d-a645-50f3-ba69-3839736094ad', 'e56facf2-5546-5db7-827c-942260ba899c', 'db8f5d45-4567-5c1b-8ae5-dc20be849810', 'c17b1b9a-ade1-5193-b29d-e48c69ccacb8', '36633e1d-bddc-577d-bee3-e180a53eeb5c', 'f6757f1b-c0d8-5625-90d7-2240591736d1', 'ffd406f8-fd0d-5c61-b6c0-5221d55a6b62', '14ffc845-1de0-537d-85fd-b10a9685f7ff', '3b9bba2b-e3c4-5740-96d1-d8241a5ab713', 'fbf39b97-630b-578c-858a-42239c8925cc', '00f947c6-9c0b-5e79-b092-ac96d6ca1434', '81d555a3-f2bb-5df3-8872-fd39ae63611c', '2285243a-cf60-5402-ac43-bd59eb5f8583', '36a14c81-1b3a-5496-b6a4-3538123c71c6', '1eda16c4-b633-5954-b191-7423f09dffe5', '20c22bf3-b697-5fdf-ab9c-acc284c00eed', '449e8ef4-b8f8-5c83-bffe-0fd0cb7ec152', '8eef167f-6d28-54d1-9e17-8bf5908d06b3', '0a475bf0-007c-5558-b4e1-4879f1557116', '8035bedc-7639-5358-a7ce-bf2dd7c6f984', '075a52d9-9c2d-54d8-8c6a-dd50e28243c6', '3aa005c1-b264-58dc-86d1-bd787e242596', '78a39a80-291a-5670-b8ca-b8f8f73f1d89', '8109621d-9488-5492-9efa-13b66f3015f3', 'b77ab9ed-dd5c-5582-8f93-f52885da90e1', '5d131b49-d63b-56b3-ad08-34a0dbac9926', 'cf7c5df9-1b4d-5f2b-8c6f-ca1b5881c728', '35bedb68-10ff-55ac-b2a6-9c958cbca79e', '93d8fe55-e868-50cd-bf37-c2edeafdcb47', '816c4e9d-4e7c-5254-9f18-bfcc030d5095', '13c2c721-2ea4-5ed4-91af-3d9f30800af5', 'dc8482bb-6869-5202-909a-8de3b9530442', '09a8d6ec-71af-5c14-bdfe-41242583ef9b', '09324d70-e863-5a05-b891-81d95bd17f1c', '54ff5635-fecc-5042-acba-b3c69590f70f', '9a4610c6-6a22-5496-916e-9fd15656e371', '8840c908-6860-592f-bc95-deff22d874b4', 'c8bde22b-8ea9-56d5-88ac-e862213a5017', 'ddfdd16f-1d44-53f5-a5cc-35037d614b48', '55c767e2-841b-5003-b493-023452c32dd8', 'a1aa299b-b36b-5086-9d1d-53515fdb542c', 'ede7ab03-ea04-5ffd-8865-0c143e3bbffe') and id not in ('da0798ff-a034-5cdc-8335-a549b50ecb09', 'c8b97076-987c-51f2-b009-a5a45fc7525d', 'eb7658d5-f676-559e-8871-c9905ffa6dbf', '775838d8-59eb-55f6-a5ee-32076dd09da8', '248315e7-0574-5061-8396-e3e919613cd2', '914b3d27-cde0-5533-8abf-de3e2837ae5b', 'f5b3c1f3-1d43-5266-abec-4d7d8fd86907', '009395bb-a624-5ecf-af4b-f91afdb05c3f', '756f1c59-f103-58fe-9c3e-4c264233b4d0', 'dcc0158d-90ca-562c-8f5d-2c15b9e7c184', '9b1753d9-f6d0-5da6-b1dd-2ad2d3c90391', 'd2f7ef8c-de3e-5e01-bcd7-d7974c052f47', '56a42cda-5b75-5ee9-b5b3-e029f9b0d8a6', 'b654563f-5cd4-5b64-9793-b52a812ad50f', 'ebf08eca-bec9-58d2-9e81-ecef9a554e85', 'de282adc-e5e1-56e8-8122-483f6e269003', 'ba33e371-686d-5b05-a772-d9349a19f7c5', '6a67863c-9ad3-5e53-ae31-48296f186bc8', '8c032298-f18e-5178-be1d-2feb45a7db91', '6017ef49-ae9f-5ae5-9640-43910e36b920', '55d6de77-753a-59e7-80a7-9c7d725ba03c', '06f57638-2453-53cd-8860-9de3363a2833', 'fc76f744-1419-5adc-8fbd-1889151facb1', 'fe767cd6-f34a-5b0c-a164-36a505457009', '6a006de6-38a7-54db-aaef-27cf0f0eca54', '474c78d4-c01b-5196-bdce-490aef62ae8d', 'd6f478dc-9ae2-5700-9d90-d34951488753', '1ac5cc2f-b6bc-54bb-bbf9-c70e9eada6e4', '18d18a92-b473-531e-9361-af9b8c0e0dce', 'a119030a-4784-5e29-948c-a68c2ab93735', '2b19d885-3321-58db-bb6f-69426e5e9a9e', '73f75b07-aa25-5b48-b501-e397f2feb181', 'd4781347-96e9-5d6d-80c0-a9517a7850fc', '89ebd8ea-5208-5dd2-89ae-af5bd5359ffe', '9caf2a60-df15-5f4a-a6b7-ac8804d7b7d3', '530c08d6-bd90-59a8-ba69-c12b5fb2634b', 'd35fc7f0-9ce6-5ce0-a429-500567b80c5e', '8074f3e9-02f4-5bf2-b605-4ee139f6f323', '2d63c245-1b7b-5683-97ee-de2ae1222f26', 'd25fb5c3-88a7-5c88-8e14-0258aba768f4', '48e6c10d-01a0-55f4-9727-43a37c9e52ef', 'b296520e-fb81-506d-9218-a0f901667cb5', 'ea3ca39a-7a8d-5aee-b9e4-c580c4b7699e', 'd6cb8b50-a75f-5ad2-a265-9a8a8d93d1f0', '30e42546-8ff7-5a96-bbf1-7b4bfa41a5b4', 'a4cc0ac8-2872-532c-b89e-3d40ed3cc969', 'fdfa0276-29ae-568f-8939-b7e853f1611a', 'b753fccd-6771-5a2e-9276-11bf27444467', 'f18c8a13-208e-52b6-a5a9-af6af86b2a1a', 'b1aff2e9-2982-54f4-83c0-c7a73ef920c0', '6a7df112-9df8-5dd4-93f4-9eba9142f299', '60689f97-aa5d-5618-86c3-95e84bed106e', '7dc2be74-ddb6-5d73-b391-1d9b97b10155', 'fad71284-b5d7-562e-88be-a9f060b2b423', '9aee6ef9-e009-5980-a83f-149fdeb08d95', 'dc742506-6c7a-53f2-91ed-3215b60dc1c7', '91f1cdd1-cb29-5648-8023-2164cd62b6b9', 'a0654b20-72ce-53b4-8d3a-0743ba2ad878', '838a6910-4646-58b9-b12b-55a7dd37f791', 'f06283f0-369c-5917-b921-6fbfebf8d310', 'f0091ade-425e-5ccc-89ad-00d6a2f04f25', '5fa2bbad-4bee-5c99-a2fb-a321eb0ec6a8', '1560789c-515f-56f0-ba60-44ef39ca5743', 'b6025aea-1fcc-5c13-97a0-76b57d620928', '046bcb14-71aa-560c-97db-5faff07864c1', '9d7b2223-f7ac-579d-822d-bac0b4c50c8a', '26d871c1-b494-565a-937a-65e5ea29606e', '87b29eb6-3d3d-58e6-8d64-f98f92143eb4', '99bc5f73-0c47-55be-a994-0c4b4d9a9dfa', '94ee074c-87d9-57d9-9fbe-7f993baed07f', '450c5051-63e9-5d91-9517-5285ac044754', 'e4666c12-6fbe-5439-bb3b-afc71954552a', 'a89eba49-deb5-569e-aeca-4beef35b1d80', 'c974636b-24c0-5a1b-bf40-770ff78cb999', '12b506eb-8f04-5a5b-bb4e-c33399769b40', '6f8b388b-d632-5499-8970-396157a10251', '6a6b9880-4ec1-5296-ae01-73c714589484', '8a59b525-3437-5c97-a967-3cc62e67bff6', 'a855ad86-b967-52c8-bd99-e6fc8c9b0fcb', '44b0c2ff-059f-582c-8c6f-8e394d4d99d3', 'accf79ac-f5bc-567b-b6bc-3cd12b7f4334', 'fa636991-e7be-57ed-8a55-194e3e1d93fb', 'c2ffe11c-4a13-5b88-ac69-82214430d796', '189ed33f-00bd-5b7c-970a-6255676da040', '062415ae-6e8a-59df-97bb-caf5eb2531d6', 'a373b4b4-625c-576d-9094-38b8de2355d6', 'b2b36960-5e8e-5778-ab7a-3e3f9da70ed1', '762d1acd-0801-58b5-a58d-e243639d18d9', '5a006b3e-67d3-5218-a808-9a51a7e7e2ba', 'f7a488ab-1c2c-5ede-800a-1f3bc8b1c9ab', '92a8029f-901f-5a63-a8b1-ed662a6e32bd', '4be00043-4c55-5faa-bc41-b613481a6fab', 'b5597e8e-0e6d-53c2-8409-06302ade7de4', '5a4c7644-e444-5da6-a8dc-fcafc4decdb2', '1a793d42-0ab0-5563-ba93-489813e69390', '0b780373-83b4-5d27-bdb1-05d5a9c01202', '3503e89d-9fe3-582c-977a-284523e8faf0', '6f3f121b-3ee5-566d-867a-2e11ff5f17a9', '97ef4c7b-dc21-58b0-ba30-79e61ace44a3', '7ba206b6-06b9-507c-b976-a5c740a89372', 'a4018b0b-3a3e-5114-be26-81f375ed9b49', 'faf44189-d4af-5fbf-a066-697df7137145', '793109c7-6e2a-5381-bc05-e0ae6c2bfdd6', 'bda78087-5d78-5cf9-88de-bf50fe2325cb', '8309473f-95ee-5635-8db4-cbfc84f15bac', '8ebc340c-25ae-587d-9b10-e6f38546d920', '7ec8c5e3-54cb-5bfd-b047-62b6358cba9d', '0a4a56a5-3d5e-5f3a-a9fc-5b442c3b32df', '27c1cdd0-326e-5e04-98a6-c64503d6b9c6', '06b1a6e3-289d-5496-b473-28f695beba90', '71482f06-4b07-535c-9e22-1e8d26ef2dcf', 'abaec370-6960-5e5f-b38e-9d3d75036650', '96fbf2eb-2aca-5d07-bc80-d4ef14fe6911', '14c2fe03-f78a-5c72-a53d-8dc72cea535f', '269b4052-bf7d-59cf-a628-550fbda2c37d', '4ef40e23-3fb6-5362-9110-031ff14409dc', 'e32983ef-96c1-5ac9-b760-47ccbc9aed82', '6091e0ec-a68d-5781-906e-6005c4d6e66c', '52a59d3b-cbc1-57e4-9cb1-10ada0cef8ea', 'b4de206c-d81c-5aa9-9e82-b4e0a430919d', 'e68ed7f3-60fd-5fd1-87c6-217bfc624b54', '51138a9b-41d1-5f21-9f20-9167cd6ac121', '2b328fc7-24c9-59c9-b1b0-72d2e914ff8c', '9e5f3cb7-8e3e-5333-ae0c-f4b37d918f3f', '64645f8b-3f5b-5422-a804-8531ddad871b', 'c63cc190-2c95-51d8-9311-65c1fa365182', '1ea22b8e-8f53-580f-a811-3c39465244b3', '36a31fd6-b9a0-5e3a-8944-db733ffa0a6b', '1a433eb3-553e-5c1d-9983-78f848d40dbd', 'a8645db0-2393-5e30-b4bd-67c8f3048ea3', '80d91106-8721-5546-b2ef-0b53480e4c46', 'c763d3a3-3cdf-573a-bf60-388487dcf957', '7cf0a1a1-2fe9-5494-9cf8-995eff739bfe');

commit;
