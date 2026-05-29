class Toolsmith < Formula
  desc "Token-saving surgical reads and exact edits for AI coding agents"
  homepage "https://github.com/carlkibler/toolsmith"
  url "https://registry.npmjs.org/@carlkibler/toolsmith/-/toolsmith-0.1.45.tgz"
  sha256 "9963e80bb2f5904961fd4d336e91ce14b4df178cf9cc41456da7461071adaf52"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toolsmith --version")

    # The MCP server must answer a JSON-RPC initialize over stdio with stdout clean.
    require "open3"
    require "json"
    init = JSON.generate(
      jsonrpc: "2.0",
      id:      1,
      method:  "initialize",
      params:  {
        protocolVersion: "2024-11-05",
        clientInfo:      { name: "brew-test", version: "0" },
        capabilities:    {},
      },
    )
    out, = Open3.capture2(bin/"toolsmith-mcp", stdin_data: "#{init}\n")
    assert_match "serverInfo", out
  end
end
