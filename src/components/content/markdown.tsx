import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";

/**
 * Rendering Markdown sicuro: nessun HTML grezzo (react-markdown lo scarta senza rehype-raw),
 * URL filtrati dal urlTransform di default (blocca javascript:, data:, ecc.), link esterni isolati.
 */
export function Markdown({ source }: { source: string }) {
  return (
    <div className="prose-nf">
      <ReactMarkdown
        remarkPlugins={[remarkGfm]}
        skipHtml
        components={{
          a: ({ href, children }) => (
            <a href={href} target="_blank" rel="noopener noreferrer nofollow">
              {children}
            </a>
          ),
          img: () => null,
        }}
      >
        {source}
      </ReactMarkdown>
    </div>
  );
}
