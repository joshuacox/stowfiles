import './globals.css';

export const metadata = {
  title: 'stowfiles - Dotfiles Management with GNU Stow',
  description: 'Complete guide and documentation for managing modular configuration files with GNU Stow, Hyprland, Neovim, Waybar, Tmux, and Zsh.',
  keywords: ['dotfiles', 'gnu stow', 'hyprland', 'neovim', 'astronvim', 'zsh', 'waybar', 'starship'],
  authors: [{ name: 'Joshua Cox' }],
  metadataBase: new URL('https://joshuacox.github.io/stowfiles'),
  openGraph: {
    title: 'stowfiles - Modern Dotfiles Management with GNU Stow',
    description: 'Declarative, modular dotfiles management with GNU Stow for Linux environments.',
    type: 'website',
  },
  other: {
    'google-adsense-account': 'ca-pub-8973108060277483',
  },
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <head>
        {/* Google tag (gtag.js) */}
        <script async src="https://www.googletagmanager.com/gtag/js?id=G-L1H2CLH4R3" />
        <script
          dangerouslySetInnerHTML={{
            __html: `
              window.dataLayer = window.dataLayer || [];
              function gtag(){dataLayer.push(arguments);}
              gtag('js', new Date());

              gtag('config', 'G-L1H2CLH4R3');
            `,
          }}
        />
        <meta name="google-adsense-account" content="ca-pub-8973108060277483" />
        <script
          async
          src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-8973108060277483"
          crossOrigin="anonymous"
        />
      </head>
      <body>
        <header className="header">
          <div className="container nav">
            <a href="./" className="logo">
              <span>⚡ stowfiles</span>
            </a>
            <nav className="nav-links">
              <a href="#quickstart">Quickstart</a>
              <a href="#packages">Modules</a>
              <a href="#scripts">Automation</a>
              <a href="#faq">FAQ</a>
              <a href="https://github.com/joshuacox/stowfiles" target="_blank" rel="noopener noreferrer">
                GitHub ↗
              </a>
            </nav>
          </div>
        </header>

        <main>{children}</main>

        <footer className="footer">
          <div className="container">
            <div className="footer-links">
              <a href="https://github.com/joshuacox/stowfiles" target="_blank" rel="noopener noreferrer">
                Source Code
              </a>
              <a href="./ads.txt">ads.txt</a>
              <a href="https://github.com/joshuacox/stowfiles/blob/main/LICENSE" target="_blank" rel="noopener noreferrer">
                MIT License
              </a>
            </div>
            <p>© {new Date().getFullYear()} stowfiles. Released under the MIT License.</p>
          </div>
        </footer>
      </body>
    </html>
  );
}
