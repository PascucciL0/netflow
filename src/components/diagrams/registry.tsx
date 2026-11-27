/**
 * Registro chiuso dei diagrammi. I contenuti (anche importati) possono solo
 * riferirsi a un id di questo registro: nessun SVG/HTML/codice arriva dall'esterno.
 * Per aggiungere un diagramma: crea il componente e registra qui l'id.
 */
import type { ReactNode } from "react";
import { FieldStrip } from "./field-strip";
import { LayerStack } from "./layer-stack";
import { MacLearning } from "./mac-learning";
import { SequenceDiagram } from "./sequence-diagram";

export const DIAGRAMS: Record<string, { title: string; render: () => ReactNode }> = {
  "mac-learning": { title: "Apprendimento della MAC Address Table", render: () => <MacLearning /> },
  "osi-tcpip-stack": { title: "OSI e TCP/IP", render: () => <LayerStack /> },
  "ethernet-frame": {
    title: "Frame Ethernet II",
    render: () => (
      <FieldStrip
        spec={{
          title: "Frame Ethernet II",
          fields: [
            { name: "Preamble", size: "7 B", group: "preamble" },
            { name: "SFD", size: "1 B", group: "preamble" },
            { name: "Dest. MAC", size: "6 B" },
            { name: "Source MAC", size: "6 B" },
            { name: "Type", size: "2 B" },
            { name: "Payload", size: "46–1500 B", group: "payload" },
            { name: "FCS", size: "4 B", group: "trailer" },
          ],
        }}
      />
    ),
  },
  "arp-exchange": {
    title: "Scambio ARP",
    render: () => (
      <SequenceDiagram
        spec={{
          title: "ARP Request in broadcast e ARP Reply in unicast",
          actors: [
            { id: "pc", label: "PC1", sub: "192.168.1.10" },
            { id: "gw", label: "R1 (gateway)", sub: "192.168.1.1" },
          ],
          messages: [
            { from: "pc", to: "gw", label: "ARP Request", detail: "dst FF:FF:FF:FF:FF:FF · chi ha .1?", broadcast: true },
            { from: "gw", to: "pc", label: "ARP Reply", detail: "unicast · .1 è 00-1a-2b-3c-4d-5e" },
          ],
        }}
      />
    ),
  },
  "tcp-handshake": {
    title: "TCP Three-Way Handshake",
    render: () => (
      <SequenceDiagram
        spec={{
          title: "TCP Three-Way Handshake",
          actors: [
            { id: "c", label: "Client", sub: "porta effimera" },
            { id: "s", label: "Server", sub: "porta 443" },
          ],
          messages: [
            { from: "c", to: "s", label: "SYN", detail: "seq = x" },
            { from: "s", to: "c", label: "SYN-ACK", detail: "seq = y · ack = x+1" },
            { from: "c", to: "s", label: "ACK", detail: "ack = y+1" },
          ],
        }}
      />
    ),
  },
  "dhcp-dora": {
    title: "DHCP DORA",
    render: () => (
      <SequenceDiagram
        spec={{
          title: "Processo DHCP DORA",
          actors: [
            { id: "c", label: "Client", sub: "UDP 68" },
            { id: "s", label: "Server DHCP", sub: "UDP 67" },
          ],
          messages: [
            { from: "c", to: "s", label: "Discover", detail: "0.0.0.0 → 255.255.255.255", broadcast: true },
            { from: "s", to: "c", label: "Offer", detail: "indirizzo proposto" },
            { from: "c", to: "s", label: "Request", detail: "broadcast · accetto l'offerta", broadcast: true },
            { from: "s", to: "c", label: "Ack", detail: "lease confermato" },
          ],
        }}
      />
    ),
  },
  "dot1q-frame": {
    title: "Frame Ethernet con tag 802.1Q",
    render: () => (
      <FieldStrip
        spec={{
          title: "Frame Ethernet con tag 802.1Q",
          fields: [
            { name: "Dest. MAC", size: "6 B" },
            { name: "Source MAC", size: "6 B" },
            { name: "802.1Q tag", size: "4 B · TPID 0x8100 + PCP/DEI/VID", group: "trailer" },
            { name: "Type", size: "2 B" },
            { name: "Payload", size: "42–1500 B", group: "payload" },
            { name: "FCS", size: "4 B", group: "trailer" },
          ],
        }}
      />
    ),
  },
  "ipv6-gua-structure": {
    title: "Struttura di un indirizzo IPv6 Global Unicast",
    render: () => (
      <FieldStrip
        spec={{
          title: "Indirizzo IPv6 Global Unicast con prefisso /48 assegnato al sito",
          fields: [
            { name: "Global routing prefix", size: "48 bit · assegnato al sito" },
            { name: "Subnet ID", size: "16 bit · scelto dall'azienda", group: "trailer" },
            { name: "Interface ID", size: "64 bit · host", group: "payload" },
          ],
        }}
      />
    ),
  },
  "slaac-exchange": {
    title: "SLAAC: Router Solicitation, Router Advertisement e DAD",
    render: () => (
      <SequenceDiagram
        spec={{
          title: "SLAAC e Duplicate Address Detection",
          actors: [
            { id: "h", label: "Host", sub: "fe80::…/64" },
            { id: "r", label: "R1", sub: "2001:db8:1::1/64" },
          ],
          messages: [
            { from: "h", to: "r", label: "Router Solicitation (133)", detail: "verso ff02::2 · tutti i router", broadcast: true },
            { from: "r", to: "h", label: "Router Advertisement (134)", detail: "prefisso 2001:db8:1::/64 · flag M/O", broadcast: true },
            { from: "h", to: "r", label: "Neighbor Solicitation (135)", detail: "DAD verso solicited-node · qualcuno usa già l'indirizzo?", broadcast: true },
          ],
        }}
      />
    ),
  },
  "pat-translation": {
    title: "PAT: traduzione di indirizzo e porta",
    render: () => (
      <SequenceDiagram
        spec={{
          title: "PAT (NAT overload) su R1",
          actors: [
            { id: "pc", label: "PC1", sub: "192.168.1.10" },
            { id: "r", label: "R1 (NAT)", sub: "203.0.113.5" },
            { id: "s", label: "Server", sub: "198.51.100.20" },
          ],
          messages: [
            { from: "pc", to: "r", label: "src 192.168.1.10:51000", detail: "inside local" },
            { from: "r", to: "s", label: "src 203.0.113.5:51000", detail: "inside global · voce nella NAT table" },
            { from: "s", to: "r", label: "dst 203.0.113.5:51000", detail: "risposta" },
            { from: "r", to: "pc", label: "dst 192.168.1.10:51000", detail: "traduzione inversa" },
          ],
        }}
      />
    ),
  },
  "ospf-adjacency": {
    title: "Formazione di un'adiacenza OSPF",
    render: () => (
      <SequenceDiagram
        spec={{
          title: "Da Down a Full su un link point-to-point",
          actors: [
            { id: "a", label: "R1", sub: "RID 1.1.1.1" },
            { id: "b", label: "R2", sub: "RID 2.2.2.2" },
          ],
          messages: [
            { from: "a", to: "b", label: "Hello", detail: "224.0.0.5 · R2: Down → Init", broadcast: true },
            { from: "b", to: "a", label: "Hello (vede 1.1.1.1)", detail: "R1: 2-Way", broadcast: true },
            { from: "a", to: "b", label: "DBD", detail: "ExStart → Exchange · riassunto LSDB" },
            { from: "b", to: "a", label: "LSR / LSU", detail: "Loading · LSA mancanti" },
            { from: "a", to: "b", label: "LSAck", detail: "LSDB sincronizzate · Full" },
          ],
        }}
      />
    ),
  },
};

export const isKnownDiagram = (id: string): boolean => id in DIAGRAMS;

export function Diagram({ id, caption }: { id: string; caption?: string }) {
  const d = DIAGRAMS[id];
  if (!d) {
    return <p className="rounded-lg border border-dashed border-line-strong p-3 text-sm text-ink-3">Diagramma non disponibile ({id}).</p>;
  }
  return (
    <div className="rounded-[var(--radius-card)] border border-line bg-surface p-3 sm:p-4">
      {d.render()}
      {caption && <p className="mt-3 text-[13px] text-ink-3">{caption}</p>}
    </div>
  );
}
