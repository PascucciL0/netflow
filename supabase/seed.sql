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
  ('security-basics', 'ccna', 'Sicurezza di rete', 'Concetti di base prima delle funzionalità specifiche.', 6)
on conflict (id) do update set track_id = excluded.track_id, title = excluded.title, summary = excluded.summary, position = excluded.position;

insert into public.topics (id, module_id, title, summary, position) values
  ('network-devices', 'network-fundamentals', 'Dispositivi di rete', 'Router, switch, firewall, access point, endpoint e server: ruolo e livello di funzionamento.', 0),
  ('network-topologies', 'network-fundamentals', 'Topologie e architetture', 'Star, mesh, two-tier, three-tier, spine-leaf, SOHO, WAN e cloud.', 1),
  ('osi-tcpip', 'network-fundamentals', 'Modello OSI e TCP/IP', 'Livelli, incapsulamento, PDU e corrispondenza tra i due modelli.', 2),
  ('ethernet-lan', 'ethernet-switching', 'Ethernet, cavi e interfacce', 'Standard Ethernet, rame e fibra, duplex, speed e problemi di interfaccia.', 0),
  ('mac-addressing', 'ethernet-switching', 'MAC address e frame Ethernet', 'Struttura del frame, indirizzi unicast, broadcast e multicast.', 1),
  ('switching-fundamentals', 'ethernet-switching', 'Switching: learning, forwarding, flooding', 'MAC Address Table, inoltro dei frame, flooding e Broadcast Domain.', 2),
  ('ipv4-addressing', 'ip-addressing', 'Indirizzamento IPv4', 'Struttura dell''indirizzo, Subnet Mask, indirizzi pubblici e privati.', 0),
  ('subnetting', 'ip-addressing', 'Subnetting IPv4', 'Calcolo di network, broadcast, host utilizzabili e VLSM.', 1),
  ('arp', 'ip-addressing', 'ARP', 'Risoluzione da indirizzo IPv4 a MAC address all''interno della subnet.', 2),
  ('icmp', 'ip-addressing', 'ICMP, ping e traceroute', 'Messaggi ICMP e strumenti di verifica della raggiungibilità.', 3),
  ('ipv6-fundamentals', 'ip-addressing', 'Fondamenti di IPv6', 'Formato, abbreviazione, tipi di indirizzo, prefissi e EUI-64.', 4),
  ('routing-fundamentals', 'routing-basics', 'Fondamenti di routing', 'Routing Table, longest prefix match, route connesse, statiche e default.', 0),
  ('tcp-udp', 'transport-services', 'TCP e UDP', 'Porte, Three-Way Handshake, affidabilità e casi d''uso.', 0),
  ('dns', 'transport-services', 'DNS', 'Risoluzione dei nomi e tipi di record.', 1),
  ('dhcp', 'transport-services', 'DHCP', 'Assegnazione automatica della configurazione IP, processo DORA e relay.', 2),
  ('ios-fundamentals', 'cisco-ios', 'Fondamenti di Cisco IOS', 'Modalità della CLI, running e startup config, comandi show essenziali.', 0),
  ('security-fundamentals', 'security-basics', 'Fondamenti di Network Security', 'Minacce, vulnerabilità, exploit, mitigazioni e principi di difesa.', 0)
on conflict (id) do update set module_id = excluded.module_id, title = excluded.title, summary = excluded.summary, position = excluded.position;

delete from public.topic_prerequisites where topic_id in ('network-devices', 'network-topologies', 'osi-tcpip', 'ethernet-lan', 'mac-addressing', 'switching-fundamentals', 'ipv4-addressing', 'subnetting', 'arp', 'icmp', 'ipv6-fundamentals', 'routing-fundamentals', 'tcp-udp', 'dns', 'dhcp', 'ios-fundamentals', 'security-fundamentals');

insert into public.topic_prerequisites (topic_id, prerequisite_id) values
  ('network-topologies', 'network-devices'),
  ('osi-tcpip', 'network-devices'),
  ('ethernet-lan', 'osi-tcpip'),
  ('mac-addressing', 'osi-tcpip'),
  ('switching-fundamentals', 'mac-addressing'),
  ('ipv4-addressing', 'osi-tcpip'),
  ('subnetting', 'ipv4-addressing'),
  ('arp', 'ipv4-addressing'),
  ('arp', 'mac-addressing'),
  ('icmp', 'ipv4-addressing'),
  ('ipv6-fundamentals', 'ipv4-addressing'),
  ('routing-fundamentals', 'subnetting'),
  ('tcp-udp', 'osi-tcpip'),
  ('dns', 'tcp-udp'),
  ('dhcp', 'ipv4-addressing'),
  ('dhcp', 'tcp-udp'),
  ('ios-fundamentals', 'network-devices'),
  ('security-fundamentals', 'network-devices');

delete from public.topic_objectives where topic_id in ('network-devices', 'network-topologies', 'osi-tcpip', 'ethernet-lan', 'mac-addressing', 'switching-fundamentals', 'ipv4-addressing', 'subnetting', 'arp', 'icmp', 'ipv6-fundamentals', 'routing-fundamentals', 'tcp-udp', 'dns', 'dhcp', 'ios-fundamentals', 'security-fundamentals');

insert into public.topic_objectives (topic_id, objective_id) values
  ('ethernet-lan', 'ccna-v2:1.1'),
  ('switching-fundamentals', 'ccna-v2:2.4'),
  ('ipv4-addressing', 'ccna-v2:1.3'),
  ('subnetting', 'ccna-v2:1.3'),
  ('icmp', 'ccna-v2:2.4'),
  ('ipv6-fundamentals', 'ccna-v2:1.4'),
  ('routing-fundamentals', 'ccna-v2:3.1'),
  ('dns', 'ccna-v2:4.4'),
  ('dhcp', 'ccna-v2:1.7'),
  ('ios-fundamentals', 'ccna-v2:2.4');

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
Una rotta statica più specifica dimenticata in configurazione "vince" su qualsiasi rotta dinamica meno specifica: è una causa frequente di traffico che segue un percorso inatteso.', 'ccna', 'routing-fundamentals', null, 2, 5, 'original', 'proposed', array['routing', 'routing-table', 'longest-prefix-match']::text[], '[]'::jsonb, '2026-11-27', '2026-11-27')
on conflict (id) do update set slug = excluded.slug, revision = excluded.revision, kind = excluded.kind, language = excluded.language,
  title = excluded.title, summary = excluded.summary, body = excluded.body, track_id = excluded.track_id, topic_id = excluded.topic_id,
  subtopic = excluded.subtopic, difficulty = excluded.difficulty, reading_minutes = excluded.reading_minutes, provenance = excluded.provenance,
  review_status = excluded.review_status, tags = excluded.tags, diagrams = excluded.diagrams, created_on = excluded.created_on, updated_on = excluded.updated_on;

delete from public.content_objectives where content_id in ('cb0ed29e-3d26-5e98-b360-23fb97c984aa', '680d75cd-a68c-57fa-9c41-1e35f2b23289', 'd5c4cbdd-ac9a-59ad-a954-c10a7b014867', 'dffaabcf-a56e-534d-a38c-842ff9792b6a', '155166f9-ff64-5536-a48a-567fe28dc070', '23525bc3-5cd3-5714-9998-75e73e7587e9', '9a88255c-bfdb-5e9b-aba4-affc0270c6d4', '0eff06c7-01d8-5299-be8d-34de078f7b8b', '3305bbc1-e089-51b2-9c84-a7425949b96b', '00702e75-7c76-53b2-ae62-8e735e8d9c77', '33c79380-e583-5727-aff9-910497dbc6f0', 'a483047e-e685-5e1c-964f-c2de0a4c7c49', '191e7924-adde-5d9e-b1b2-21480459a5ca', 'bc911fd7-e523-599f-a19d-54fd2993b410');

delete from public.content_prerequisites where content_id in ('cb0ed29e-3d26-5e98-b360-23fb97c984aa', '680d75cd-a68c-57fa-9c41-1e35f2b23289', 'd5c4cbdd-ac9a-59ad-a954-c10a7b014867', 'dffaabcf-a56e-534d-a38c-842ff9792b6a', '155166f9-ff64-5536-a48a-567fe28dc070', '23525bc3-5cd3-5714-9998-75e73e7587e9', '9a88255c-bfdb-5e9b-aba4-affc0270c6d4', '0eff06c7-01d8-5299-be8d-34de078f7b8b', '3305bbc1-e089-51b2-9c84-a7425949b96b', '00702e75-7c76-53b2-ae62-8e735e8d9c77', '33c79380-e583-5727-aff9-910497dbc6f0', 'a483047e-e685-5e1c-964f-c2de0a4c7c49', '191e7924-adde-5d9e-b1b2-21480459a5ca', 'bc911fd7-e523-599f-a19d-54fd2993b410');

delete from public.content_sources where content_id in ('cb0ed29e-3d26-5e98-b360-23fb97c984aa', '680d75cd-a68c-57fa-9c41-1e35f2b23289', 'd5c4cbdd-ac9a-59ad-a954-c10a7b014867', 'dffaabcf-a56e-534d-a38c-842ff9792b6a', '155166f9-ff64-5536-a48a-567fe28dc070', '23525bc3-5cd3-5714-9998-75e73e7587e9', '9a88255c-bfdb-5e9b-aba4-affc0270c6d4', '0eff06c7-01d8-5299-be8d-34de078f7b8b', '3305bbc1-e089-51b2-9c84-a7425949b96b', '00702e75-7c76-53b2-ae62-8e735e8d9c77', '33c79380-e583-5727-aff9-910497dbc6f0', 'a483047e-e685-5e1c-964f-c2de0a4c7c49', '191e7924-adde-5d9e-b1b2-21480459a5ca', 'bc911fd7-e523-599f-a19d-54fd2993b410');

delete from public.content_relations where content_id in ('cb0ed29e-3d26-5e98-b360-23fb97c984aa', '680d75cd-a68c-57fa-9c41-1e35f2b23289', 'd5c4cbdd-ac9a-59ad-a954-c10a7b014867', 'dffaabcf-a56e-534d-a38c-842ff9792b6a', '155166f9-ff64-5536-a48a-567fe28dc070', '23525bc3-5cd3-5714-9998-75e73e7587e9', '9a88255c-bfdb-5e9b-aba4-affc0270c6d4', '0eff06c7-01d8-5299-be8d-34de078f7b8b', '3305bbc1-e089-51b2-9c84-a7425949b96b', '00702e75-7c76-53b2-ae62-8e735e8d9c77', '33c79380-e583-5727-aff9-910497dbc6f0', 'a483047e-e685-5e1c-964f-c2de0a4c7c49', '191e7924-adde-5d9e-b1b2-21480459a5ca', 'bc911fd7-e523-599f-a19d-54fd2993b410');

insert into public.content_objectives (content_id, objective_id) values
  ('d5c4cbdd-ac9a-59ad-a954-c10a7b014867', 'ccna-v2:1.1'),
  ('dffaabcf-a56e-534d-a38c-842ff9792b6a', 'ccna-v2:2.4'),
  ('155166f9-ff64-5536-a48a-567fe28dc070', 'ccna-v2:2.4'),
  ('23525bc3-5cd3-5714-9998-75e73e7587e9', 'ccna-v2:1.3'),
  ('0eff06c7-01d8-5299-be8d-34de078f7b8b', 'ccna-v2:2.4'),
  ('33c79380-e583-5727-aff9-910497dbc6f0', 'ccna-v2:1.7'),
  ('a483047e-e685-5e1c-964f-c2de0a4c7c49', 'ccna-v2:4.4'),
  ('191e7924-adde-5d9e-b1b2-21480459a5ca', 'ccna-v2:2.4'),
  ('bc911fd7-e523-599f-a19d-54fd2993b410', 'ccna-v2:3.1');

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
  ('bc911fd7-e523-599f-a19d-54fd2993b410', 'subnetting');

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
  ('bc911fd7-e523-599f-a19d-54fd2993b410', 2, 'Implementing and Administering Cisco Solutions (200-301 CCNA) v2.0 — Exam Topics', null, 'Cisco', 'official', '2026-11-27');

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
  ('bc911fd7-e523-599f-a19d-54fd2993b410', 'cb0ed29e-3d26-5e98-b360-23fb97c984aa');

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
  ('8c032298-f18e-5178-be1d-2feb45a7db91', 'bc911fd7-e523-599f-a19d-54fd2993b410', 'ad-vs-prefix', 0, 'La Routing Table contiene 10.0.0.0/8 statica [1/0] e 10.1.0.0/16 OSPF [110/20]. Quale rotta usa il router per 10.1.9.9 e perché l''administrative distance non cambia la scelta?', 'Usa 10.1.0.0/16 via OSPF, perché è il match con il prefisso più lungo. L''administrative distance serve solo a scegliere tra rotte verso lo stesso identico prefisso apprese da sorgenti diverse; /8 e /16 sono prefissi diversi e restano entrambe installate.', array['Longest prefix match prima di tutto', 'AD confronta solo rotte verso lo stesso prefisso', 'Metric confronta rotte della stessa sorgente']::text[], array['Scegliere la statica perché ha AD più bassa']::text[])
on conflict (id) do update set position = excluded.position, prompt = excluded.prompt, answer = excluded.answer,
  key_points = excluded.key_points, common_mistakes = excluded.common_mistakes;

delete from public.recall_prompts where content_id in ('cb0ed29e-3d26-5e98-b360-23fb97c984aa', '680d75cd-a68c-57fa-9c41-1e35f2b23289', 'd5c4cbdd-ac9a-59ad-a954-c10a7b014867', 'dffaabcf-a56e-534d-a38c-842ff9792b6a', '155166f9-ff64-5536-a48a-567fe28dc070', '23525bc3-5cd3-5714-9998-75e73e7587e9', '9a88255c-bfdb-5e9b-aba4-affc0270c6d4', '0eff06c7-01d8-5299-be8d-34de078f7b8b', '3305bbc1-e089-51b2-9c84-a7425949b96b', '00702e75-7c76-53b2-ae62-8e735e8d9c77', '33c79380-e583-5727-aff9-910497dbc6f0', 'a483047e-e685-5e1c-964f-c2de0a4c7c49', '191e7924-adde-5d9e-b1b2-21480459a5ca', 'bc911fd7-e523-599f-a19d-54fd2993b410') and id not in ('da0798ff-a034-5cdc-8335-a549b50ecb09', 'c8b97076-987c-51f2-b009-a5a45fc7525d', 'eb7658d5-f676-559e-8871-c9905ffa6dbf', '775838d8-59eb-55f6-a5ee-32076dd09da8', '248315e7-0574-5061-8396-e3e919613cd2', '914b3d27-cde0-5533-8abf-de3e2837ae5b', 'f5b3c1f3-1d43-5266-abec-4d7d8fd86907', '009395bb-a624-5ecf-af4b-f91afdb05c3f', '756f1c59-f103-58fe-9c3e-4c264233b4d0', 'dcc0158d-90ca-562c-8f5d-2c15b9e7c184', '9b1753d9-f6d0-5da6-b1dd-2ad2d3c90391', 'd2f7ef8c-de3e-5e01-bcd7-d7974c052f47', '56a42cda-5b75-5ee9-b5b3-e029f9b0d8a6', 'b654563f-5cd4-5b64-9793-b52a812ad50f', 'ebf08eca-bec9-58d2-9e81-ecef9a554e85', 'de282adc-e5e1-56e8-8122-483f6e269003', 'ba33e371-686d-5b05-a772-d9349a19f7c5', '6a67863c-9ad3-5e53-ae31-48296f186bc8', '8c032298-f18e-5178-be1d-2feb45a7db91');

commit;
