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
