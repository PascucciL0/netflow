"use client";

import { useState } from "react";

/**
 * Visualizzazione interattiva dell'apprendimento della MAC Address Table.
 * Tre host nella VLAN 10 collegati a SW1. Indirizzi d'esempio (ipotetici).
 */
const HOSTS = [
  { id: "A", port: "Gi0/1", mac: "0050.7966.6801", x: 60 },
  { id: "B", port: "Gi0/2", mac: "0050.7966.6802", x: 180 },
  { id: "C", port: "Gi0/3", mac: "0050.7966.6803", x: 300 },
] as const;

type HostId = (typeof HOSTS)[number]["id"];

interface Step {
  title: string;
  text: string;
  ingress?: HostId;
  egress: HostId[];
  table: HostId[];
  learned?: HostId;
}

const STEPS: Step[] = [
  { title: "Tabella vuota", text: "SW1 è appena stato acceso: la MAC Address Table non contiene voci dinamiche.", egress: [], table: [] },
  {
    title: "A invia un frame a B",
    text: "SW1 apprende il MAC di origine di A su Gi0/1. Il MAC di destinazione di B è sconosciuto: flooding su tutte le porte della VLAN tranne quella di ingresso.",
    ingress: "A",
    egress: ["B", "C"],
    table: ["A"],
    learned: "A",
  },
  {
    title: "B risponde ad A",
    text: "SW1 apprende il MAC di B su Gi0/2. Il MAC di A è già in tabella: il frame esce solo da Gi0/1. C non riceve nulla.",
    ingress: "B",
    egress: ["A"],
    table: ["A", "B"],
    learned: "B",
  },
  {
    title: "A invia un altro frame a B",
    text: "Entrambi i MAC sono noti: inoltro known unicast solo su Gi0/2. Il flooding non è più necessario.",
    ingress: "A",
    egress: ["B"],
    table: ["A", "B"],
  },
];

export function MacLearning() {
  const [i, setI] = useState(0);
  const step = STEPS[i];
  const sw = { x: 180, y: 40 };

  return (
    <figure aria-label="Apprendimento della MAC Address Table, passo per passo">
      <svg viewBox="0 0 360 190" className="h-auto w-full" role="img" aria-label={`Passo ${i + 1}: ${step.title}`}>
        <defs>
          <marker id="ml-arrow" viewBox="0 0 10 10" refX="5" refY="5" markerWidth="6" markerHeight="6" orient="auto">
            <path d="M0 0 L10 5 L0 10 z" fill="var(--accent)" />
          </marker>
        </defs>
        {HOSTS.map((h) => {
          const isIn = step.ingress === h.id;
          const isOut = step.egress.includes(h.id);
          const active = isIn || isOut;
          return (
            <g key={h.id}>
              <line x1={sw.x} y1={sw.y + 18} x2={h.x} y2={140} stroke={active ? "var(--accent)" : "var(--line-strong)"} strokeWidth={active ? 2.4 : 1.4} />
              {active && (
                <line
                  x1={isIn ? h.x : sw.x}
                  y1={isIn ? 140 : sw.y + 18}
                  x2={isIn ? (h.x + sw.x) / 2 : (h.x + sw.x) / 2}
                  y2={(140 + sw.y + 18) / 2}
                  stroke="var(--accent)"
                  strokeWidth={2.4}
                  markerEnd="url(#ml-arrow)"
                />
              )}
              <text x={(h.x + sw.x) / 2 + (h.x < sw.x ? -22 : h.x > sw.x ? 22 : 12)} y={100} textAnchor="middle" fontSize="10.5" fontFamily="var(--font-mono)" fill="var(--text-3)">
                {h.port}
              </text>
              <rect x={h.x - 30} y={140} width={60} height={34} rx={8} fill={isIn ? "var(--accent-soft)" : "var(--surface-2)"} stroke={active ? "var(--accent)" : "var(--line-strong)"} />
              <text x={h.x} y={162} textAnchor="middle" fontSize="13" fontWeight="600" fill="var(--text)">
                PC-{h.id}
              </text>
            </g>
          );
        })}
        <rect x={sw.x - 44} y={sw.y - 18} width={88} height={36} rx={8} fill="var(--surface-3)" stroke="var(--line-strong)" />
        <text x={sw.x} y={sw.y + 5} textAnchor="middle" fontSize="13" fontWeight="600" fill="var(--text)">
          SW1
        </text>
      </svg>

      <div className="mt-3 rounded-lg border border-line">
        <div className="meta-strip border-b border-line px-3 py-2">MAC Address Table · VLAN 10</div>
        <table className="w-full font-mono text-[12px]">
          <thead className="sr-only">
            <tr><th>MAC address</th><th>Porta</th></tr>
          </thead>
          <tbody>
            {step.table.length === 0 && (
              <tr><td className="px-3 py-2 text-ink-3" colSpan={2}>nessuna voce</td></tr>
            )}
            {step.table.map((id) => {
              const h = HOSTS.find((x) => x.id === id)!;
              return (
                <tr key={id} className={step.learned === id ? "bg-accent-soft" : ""}>
                  <td className="px-3 py-1.5">{h.mac}</td>
                  <td className="px-3 py-1.5 text-right">{h.port}{step.learned === id && <span className="ml-2 text-accent-text">nuova</span>}</td>
                </tr>
              );
            })}
          </tbody>
        </table>
      </div>

      <p className="mt-3 text-[14px] leading-relaxed text-ink-2" aria-live="polite">
        <span className="font-semibold text-ink">{i + 1}/{STEPS.length} · {step.title}.</span> {step.text}
      </p>
      <div className="mt-3 flex gap-2">
        <button type="button" onClick={() => setI((v) => Math.max(0, v - 1))} disabled={i === 0} className="h-10 flex-1 rounded-[10px] border border-line-strong text-[14px] font-medium text-ink disabled:opacity-40">
          Indietro
        </button>
        <button type="button" onClick={() => setI((v) => Math.min(STEPS.length - 1, v + 1))} disabled={i === STEPS.length - 1} className="h-10 flex-1 rounded-[10px] bg-accent text-[14px] font-medium text-on-accent disabled:opacity-40">
          Avanti
        </button>
      </div>
    </figure>
  );
}
