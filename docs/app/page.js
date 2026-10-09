export default function HomePage() {
  const packages = [
    {
      name: 'hypr',
      desc: 'Hyprland compositor configuration, keybindings, animations, monitor setup, and autostart routines.',
      path: 'hypr/.config/hypr',
    },
    {
      name: 'waybar / waybar_min',
      desc: 'Highly customized Waybar status bar setups with full modular components and minimalist variants.',
      path: 'waybar/.config/waybar',
    },
    {
      name: 'astronvim',
      desc: 'AstroNvim IDE distribution with LSP, treesitter, fuzzy finder, and custom user plugins pre-configured.',
      path: 'astronvim/.config/nvim',
    },
    {
      name: 'starship',
      desc: 'Cross-shell prompt customization delivering instantaneous context for git, cloud runtimes, and languages.',
      path: 'starship/.config/starship.toml',
    },
    {
      name: 'zsh',
      desc: 'Zsh environment configuration (.zshrc) and profile definitions tailored for high-speed terminal productivity.',
      path: 'zsh/.zshrc',
    },
    {
      name: 'tmuxinator',
      desc: 'Terminal multiplexer project sessions to instantly spawn and arrange complex dev environments.',
      path: 'tmuxinator/.config/tmuxinator',
    },
    {
      name: 'lazygit & k9s',
      desc: 'TUI dashboards for terminal Git workflow and Kubernetes cluster administration.',
      path: 'lazygit/.config/lazygit, k9s/.config/k9s',
    },
    {
      name: 'bin',
      desc: 'Custom personal executable scripts and CLI utilities automatically symlinked directly to ~/bin.',
      path: 'bin/bin',
    },
    {
      name: 'omarchynvim / svim / tvim',
      desc: 'Specialized modular Neovim variants tuned for specific project contexts and lightweight remote sessions.',
      path: 'omarchynvim, svim, tvim',
    },
  ];

  const scripts = [
    {
      cmd: './stow_all.sh',
      title: 'Meta Stower',
      desc: 'Symlinks all configured package folders into your home directory ($HOME) sequentially in one step.',
    },
    {
      cmd: './stower.sh <package_name>',
      title: 'New Package Ingestion',
      desc: 'Moves ~/.config/<package> into the repository, appends it to stow_all.sh, and creates the symlink.',
    },
    {
      cmd: './init_new_config_dir.sh <target>',
      title: 'Directory Config Snatcher',
      desc: 'Safely imports an existing ~/.config directory into the stow hierarchy with validation and verbosity.',
    },
    {
      cmd: './init_new_config_file.sh <target>',
      title: 'Single File Config Snatcher',
      desc: 'Extracts a single configuration file into the stow tree and symlinks it back cleanly.',
    },
  ];

  return (
    <div>
      {/* Hero Section */}
      <section className="hero">
        <div className="container">
          <div className="badge">GNU Stow • Linux • Dotfiles</div>
          <h1 className="hero-title">Declarative Dotfiles with GNU Stow</h1>
          <p className="hero-sub">
            Modular, symlink-managed configurations for Hyprland, Neovim, Waybar, Tmux, and Zsh. Keep your environments clean, versioned, and reproducible.
          </p>
          <div className="cta-group">
            <a href="#quickstart" className="btn btn-primary">
              Get Started
            </a>
            <a href="https://github.com/joshuacox/stowfiles" target="_blank" rel="noopener noreferrer" className="btn btn-secondary">
              View on GitHub
            </a>
          </div>
        </div>
      </section>

      {/* AdSense Slot 1: Top Banner */}
      <div className="container">
        <div className="ad-slot">
          <span>Advertisement</span>
          <ins
            className="adsbygoogle"
            style={{ display: 'block', width: '100%', minHeight: '90px' }}
            data-ad-client="ca-pub-8973108060277483"
            data-ad-slot="1234567890"
            data-ad-format="auto"
            data-full-width-responsive="true"
          />
        </div>
      </div>

      {/* Quickstart Section */}
      <section id="quickstart" className="section">
        <div className="container">
          <h2 className="section-title">Quickstart Installation</h2>
          <p className="section-sub">
            Clone the repository to your home directory, verify your dependencies, and run GNU Stow.
          </p>

          <pre>
            <code>{`# 1. Install GNU Stow
# Debian/Ubuntu
sudo apt install stow
# Arch Linux
sudo pacman -S stow
# Fedora
sudo dnf install stow

# 2. Clone repository to ~/.stowfiles
git clone https://github.com/joshuacox/stowfiles.git ~/.stowfiles
cd ~/.stowfiles

# 3. Stow an individual module (e.g. hyprland)
stow -vv hypr

# 4. Or deploy everything at once using the meta-script
./stow_all.sh`}</code>
          </pre>
        </div>
      </section>

      {/* Packages / Modules Section */}
      <section id="packages" className="section">
        <div className="container">
          <h2 className="section-title">Configured Modules</h2>
          <p className="section-sub">
            Each directory corresponds to a top-level stow package that mirrors the target file hierarchy relative to <code>$HOME</code>.
          </p>

          <div className="grid">
            {packages.map((pkg, idx) => (
              <div key={idx} className="card">
                <h3 className="card-title">📦 {pkg.name}</h3>
                <p className="card-desc" style={{ marginBottom: '0.75rem' }}>{pkg.desc}</p>
                <code>{pkg.path}</code>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* AdSense Slot 2: Mid-Content Banner */}
      <div className="container">
        <div className="ad-slot">
          <span>Advertisement</span>
          <ins
            className="adsbygoogle"
            style={{ display: 'block', width: '100%', minHeight: '90px' }}
            data-ad-client="ca-pub-8973108060277483"
            data-ad-slot="9876543210"
            data-ad-format="auto"
            data-full-width-responsive="true"
          />
        </div>
      </div>

      {/* Automation Scripts Section */}
      <section id="scripts" className="section">
        <div className="container">
          <h2 className="section-title">Automation & Helper Scripts</h2>
          <p className="section-sub">
            stowfiles ships with battle-tested shell utilities to automate ingesting new configurations and rebuilding symlinks.
          </p>

          <div className="grid">
            {scripts.map((sc, idx) => (
              <div key={idx} className="card">
                <h3 className="card-title">⚙️ {sc.title}</h3>
                <p className="card-desc" style={{ marginBottom: '0.75rem' }}>{sc.desc}</p>
                <pre style={{ margin: 0, padding: '0.5rem' }}>
                  <code>{sc.cmd}</code>
                </pre>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* How GNU Stow Works */}
      <section className="section">
        <div className="container">
          <h2 className="section-title">How GNU Stow Works Here</h2>
          <p className="section-sub">
            Understanding how GNU Stow links relative paths without copying or clobbering existing configuration files.
          </p>
          <div className="card" style={{ marginBottom: '1.5rem' }}>
            <p style={{ marginBottom: '1rem' }}>
              GNU Stow creates symlinks from the parent directory (usually your <code>$HOME</code>) to files residing inside package subdirectories.
            </p>
            <pre>
              <code>{`stowfiles/
├── hypr/
│   └── .config/
│       └── hypr/
│           └── hyprland.conf  --->  ~/.config/hypr/hyprland.conf
├── zsh/
│   └── .zshrc                 --->  ~/.zshrc
└── bin/
    └── bin/
        └── myscript           --->  ~/bin/myscript`}</code>
            </pre>
            <p style={{ marginTop: '1rem', color: 'var(--text-muted)' }}>
              To cleanly un-stow a package at any time: <code>stow -D &lt;package_name&gt;</code>.
            </p>
          </div>
        </div>
      </section>

      {/* FAQ Section */}
      <section id="faq" className="section">
        <div className="container">
          <h2 className="section-title">Frequently Asked Questions</h2>
          <div className="grid">
            <div className="card">
              <h3 className="card-title">What happens if a config file already exists?</h3>
              <p className="card-desc">
                Stow will safely abort with a conflict warning without overwriting your original file. You can either back up the existing file or use <code>init_new_config_dir.sh</code> to automatically move it into the stow tree.
              </p>
            </div>
            <div className="card">
              <h3 className="card-title">How do I add my own customized tool?</h3>
              <p className="card-desc">
                Simply run <code>./stower.sh &lt;tool_name&gt;</code>. It will move <code>~/.config/&lt;tool_name&gt;</code> into the stow directory, append it to <code>stow_all.sh</code>, and create the symlink automatically.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* AdSense Verification Section */}
      <section className="section" style={{ borderBottom: 'none' }}>
        <div className="container">
          <h2 className="section-title">AdSense & Monetization Verification</h2>
          <p className="section-sub">
            This site is configured for Google AdSense compliance with official publisher declaration.
          </p>
          <div className="card">
            <p style={{ marginBottom: '0.5rem' }}>
              <strong>Publisher ID:</strong> <code>pub-8973108060277483</code>
            </p>
            <p style={{ marginBottom: '0.5rem' }}>
              <strong>ads.txt record:</strong> <code>google.com, pub-8973108060277483, DIRECT, f08c47fec0942fa0</code>
            </p>
            <p>
              View the published <a href="./ads.txt">ads.txt file</a>.
            </p>
          </div>
        </div>
      </section>
    </div>
  );
}
