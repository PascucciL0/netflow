/**
 * Diagramma di sequenza generico (ARP, TCP, DHCP…): colonne = attori, frecce = messaggi.
 * SVG responsive, colori dai token del tema, testo leggibile anche a 320px.
 */
export interface SequenceSpec {
  title: string;
  actors: { id: string; label: string; sub?: string }[];
  messages: { from: string; to: string; label: string; detail?: string; broadcast?: boolean }[];
}

export function SequenceDiagram({ spec }: { spec: SequenceSpec }) {
  const colW = 160;
  const width = Math.max(320, colW * spec.actors.length);
  const top = 58;
  const rowH = 58;
  const height = top + spec.messages.length * rowH + 20;
  const x = (id: string) => {
    const i = spec.actors.findIndex((a) => a.id === id);
    return colW / 2 + i * ((width - colW) / Math.max(1, spec.actors.length - 1));
  };

  return (
    <svg viewBox={`0 0 ${width} ${height}`} className="h-auto w-full" role="img" aria-label={spec.title}>
      <title>{spec.title}</title>
      <defs>
        <marker id="seq-arrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="7" orient="auto-start-reverse">
          <path d="M0 0 L10 5 L0 10 z" fill="var(--text-2)" />
        </marker>
        <marker id="seq-arrow-accent" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="7" orient="auto-start-reverse">
          <path d="M0 0 L10 5 L0 10 z" fill="var(--accent)" />
        </marker>
      </defs>
      {spec.actors.map((a) => (
        <g key={a.id}>
          <rect x={x(a.id) - 62} y={6} width={124} height={a.sub ? 40 : 30} rx={8} fill="var(--surface-2)" stroke="var(--line-strong)" />
          <text x={x(a.id)} y={a.sub ? 23 : 26} textAnchor="middle" fontSize="13" fontWeight="600" fill="var(--text)">
            {a.label}
          </text>
          {a.sub && (
            <text x={x(a.id)} y={39} textAnchor="middle" fontSize="10.5" fontFamily="var(--font-mono)" fill="var(--text-3)">
              {a.sub}
            </text>
          )}
          <line x1={x(a.id)} y1={a.sub ? 46 : 36} x2={x(a.id)} y2={height - 8} stroke="var(--line-strong)" strokeDasharray="3 4" />
        </g>
      ))}
      {spec.messages.map((m, i) => {
        const y = top + i * rowH + 26;
        const x1 = x(m.from);
        const x2 = x(m.to);
        const dir = x2 > x1 ? 1 : -1;
        const mid = (x1 + x2) / 2;
        return (
          <g key={i}>
            <line
              x1={x1 + dir * 4}
              y1={y}
              x2={x2 - dir * 6}
              y2={y}
              stroke={m.broadcast ? "var(--accent)" : "var(--text-2)"}
              strokeWidth={1.6}
              strokeDasharray={m.broadcast ? "6 4" : undefined}
              markerEnd={m.broadcast ? "url(#seq-arrow-accent)" : "url(#seq-arrow)"}
            />
            <text x={mid} y={y - 8} textAnchor="middle" fontSize="12.5" fontWeight="600" fill="var(--text)">
              {m.label}
            </text>
            {m.detail && (
              <text x={mid} y={y + 17} textAnchor="middle" fontSize="10.5" fontFamily="var(--font-mono)" fill="var(--text-3)">
                {m.detail}
              </text>
            )}
          </g>
        );
      })}
    </svg>
  );
}
