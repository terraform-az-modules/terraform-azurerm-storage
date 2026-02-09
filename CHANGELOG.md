## Unreleased

- examples/docs: refreshed examples to private-first defaults, removed broad `0.0.0.0/0` allowlists, and documented explicit public opt-out scenarios (e.g., static website hosting).
- **BREAKING CHANGE**: `public_network_access_enabled` now defaults to `false` to improve security. Set `public_network_access_enabled = true` to retain previous public access behavior.
- security: added secure network-rule defaults in schema (`default_action = "Deny"`, `bypass = ["AzureServices"]`) while keeping overrides configurable.
- security(checkov): added targeted skip annotations with rationale for context-dependent controls (replication strategy, shared key usage, queue/blob logging architecture, HSM key type, and network policy flexibility).
- docs: clarified security defaults and consumer responsibilities in README.
