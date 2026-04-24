# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v3.0.0] - 2026-04-24
### :wrench: Chores
- [`7cad6cb`](https://github.com/terraform-az-modules/terraform-azurerm-storage/commit/7cad6cbe8229a6b519e9e3535ff6156b0e616667) - **deps**: bump terraform-az-modules/key-vault/azurerm *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*


## [v2.0.0] - 2026-04-21
### :wrench: Chores
- [`c18e785`](https://github.com/terraform-az-modules/terraform-azurerm-storage/commit/c18e785261c5c1b7069de7b0faaf25d1547909df) - **deps**: bump actions/checkout from 3 to 6 *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*


## [v1.3.0] - 2026-04-17
### :bug: Bug Fixes
- [`2084e00`](https://github.com/terraform-az-modules/terraform-azurerm-storage/commit/2084e00a04d27c609fa0df53bdcd11bf33a3209e) - consolidate versions.tf, remove provider_meta, upgrade to azurerm >= 4.0 *(commit by [@anmolnagpal](https://github.com/anmolnagpal))*
- [`c577d96`](https://github.com/terraform-az-modules/terraform-azurerm-storage/commit/c577d96ca2b57b6d0f4e279cac3dbdc4f0ac7c26) - replace version placeholder in example versions.tf with >= 4.0 *(commit by [@anmolnagpal](https://github.com/anmolnagpal))*

### :wrench: Chores
- [`7f6cd2d`](https://github.com/terraform-az-modules/terraform-azurerm-storage/commit/7f6cd2db950d626aed544b7ad11509bdd1c0cc94) - **deps**: bump terraform-linters/setup-tflint from 4 to 6 *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`0b6d424`](https://github.com/terraform-az-modules/terraform-azurerm-storage/commit/0b6d424ce402085438fb7f1dbb463b2fe303c731) - **deps**: bump actions/checkout from 4 to 6 *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`c39d94f`](https://github.com/terraform-az-modules/terraform-azurerm-storage/commit/c39d94fe2f3aea0350ef47491131d2c38e9fb390) - **deps**: bump hashicorp/setup-terraform from 3 to 4 *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`dbdbf70`](https://github.com/terraform-az-modules/terraform-azurerm-storage/commit/dbdbf70ee5b261d376ba9e265056e09a1a70c1cd) - add provider_meta for API usage tracking *(PR [#49](https://github.com/terraform-az-modules/terraform-azurerm-storage/pull/49) by [@clouddrove-ci](https://github.com/clouddrove-ci))*
- [`ee905c6`](https://github.com/terraform-az-modules/terraform-azurerm-storage/commit/ee905c64bc0cdf6f4cc1647ba70981106a284efb) - **deps**: bump terraform-az-modules/resource-group/azurerm *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`12ae0f4`](https://github.com/terraform-az-modules/terraform-azurerm-storage/commit/12ae0f44bb4227d8657d5d619f6d49587891df00) - **deps**: bump terraform-az-modules/log-analytics/azurerm *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`562408d`](https://github.com/terraform-az-modules/terraform-azurerm-storage/commit/562408d935d0749966dbf2ab12a116784f2c7a7b) - polish module with basic example, changelog, and version fixes *(PR [#52](https://github.com/terraform-az-modules/terraform-azurerm-storage/pull/52) by [@clouddrove-ci](https://github.com/clouddrove-ci))*
- [`8bdb4d0`](https://github.com/terraform-az-modules/terraform-azurerm-storage/commit/8bdb4d05b5a89d23c67fb8ead19efd626ff68251) - **deps**: bump terraform-az-modules/key-vault/azurerm *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`ecb603a`](https://github.com/terraform-az-modules/terraform-azurerm-storage/commit/ecb603ac8e14f503f1079c15c1094ac46537b99b) - **deps**: bump terraform-az-modules/vnet/azurerm *(PR [#54](https://github.com/terraform-az-modules/terraform-azurerm-storage/pull/54) by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`06355aa`](https://github.com/terraform-az-modules/terraform-azurerm-storage/commit/06355aa6eafb981fffd6c6c4574ad3bd26b7dcf8) - **deps**: bump terraform-az-modules/key-vault/azurerm *(PR [#55](https://github.com/terraform-az-modules/terraform-azurerm-storage/pull/55) by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`654c9d5`](https://github.com/terraform-az-modules/terraform-azurerm-storage/commit/654c9d5898cb37e36b04a8bf393156f5df3a7ad7) - **deps**: bump terraform-az-modules/subnet/azurerm *(PR [#56](https://github.com/terraform-az-modules/terraform-azurerm-storage/pull/56) by [@dependabot[bot]](https://github.com/apps/dependabot))*
- [`967d377`](https://github.com/terraform-az-modules/terraform-azurerm-storage/commit/967d3775229f0dd396cc5e6c9266ef1dd3b74c36) - **deps**: bump terraform-az-modules/key-vault/azurerm *(commit by [@dependabot[bot]](https://github.com/apps/dependabot))*


## [1.2.1] - 2026-03-20

### Changes
- Add provider_meta for API usage tracking
- Add terraform tests and pre-commit CI workflow
- Add SECURITY.md, CONTRIBUTING.md, .releaserc.json
- Standardize pre-commit to antonbabenko v1.105.0
- Set provider: none in tf-checks for validate-only CI
- Bump required_version to >= 1.10.0
[v1.3.0]: https://github.com/terraform-az-modules/terraform-azurerm-storage/compare/v1.2.1...v1.3.0
[v2.0.0]: https://github.com/terraform-az-modules/terraform-azurerm-storage/compare/v1.3.0...v2.0.0
[v3.0.0]: https://github.com/terraform-az-modules/terraform-azurerm-storage/compare/v2.0.0...v3.0.0
