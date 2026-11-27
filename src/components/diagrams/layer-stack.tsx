/** Confronto OSI ↔ TCP/IP con PDU per livello. */
const OSI = [
  { n: 7, name: "Application" },
  { n: 6, name: "Presentation" },
  { n: 5, name: "Session" },
  { n: 4, name: "Transport" },
  { n: 3, name: "Network" },
  { n: 2, name: "Data Link" },
  { n: 1, name: "Physical" },
];

/** span = quante righe OSI copre il livello TCP/IP */
/** row = riga di partenza nella griglia (la riga 1 è l'intestazione) */
const TCPIP = [
  { name: "Application", row: 2, span: 3, pdu: "Data", examples: "HTTP, DNS, SSH" },
  { name: "Transport", row: 5, span: 1, pdu: "Segment / Datagram", examples: "TCP, UDP" },
  { name: "Internet", row: 6, span: 1, pdu: "Packet", examples: "IPv4, IPv6, ICMP" },
  { name: "Link", row: 7, span: 2, pdu: "Frame → Bit", examples: "Ethernet, 802.11" },
];

export function LayerStack() {
  return (
    <figure aria-label="Modello OSI e modello TCP/IP a confronto">
      <div className="grid grid-cols-[minmax(0,1fr)_minmax(0,1.25fr)] gap-x-2 gap-y-1.5 text-[13px]" style={{ gridTemplateRows: "auto repeat(7, minmax(36px, auto))" }}>
        <div className="meta-strip pb-1">OSI</div>
        <div className="meta-strip pb-1">TCP/IP · PDU</div>
        {OSI.map((l, i) => (
          <div key={l.n} className="flex items-center gap-2 rounded-lg border border-line bg-surface-2 px-2.5" style={{ gridColumn: 1, gridRow: i + 2 }}>
            <span className="font-mono text-[11px] text-ink-3">L{l.n}</span>
            <span className="truncate font-medium">{l.name}</span>
          </div>
        ))}
        {TCPIP.map((l) => (
              <div
                key={l.name}
                className="flex flex-col justify-center rounded-lg border border-accent/30 bg-accent-soft px-2.5 py-1.5"
                style={{ gridColumn: 2, gridRow: `${l.row} / span ${l.span}` }}
              >
                <span className="font-medium">{l.name}</span>
                <span className="font-mono text-[11px] text-accent-text">{l.pdu}</span>
                <span className="text-[11.5px] text-ink-3">{l.examples}</span>
              </div>
        ))}
      </div>
    </figure>
  );
}
