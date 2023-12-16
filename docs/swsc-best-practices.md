# Software Supply Chain Best Practices

A number of SW supply chain (SWSC) best practices frameworks have been
established by CISA, NIST, and the OpenSSF.

This document tracks various frameworks and the implementation plan for
meeting these best practices.

## Frameworks

### OpenSSF Scorecard

<dl>
<dt>Summary<dd>

[Scorecard] is a tool for understanding the security best practices followed
by OSS repos and assessing the risk level that gaps introduce.

<dt>Motivation<dd>

OSS repos may expose vectors for supply chain attackers, including through
the repo configuration, source code management, build, and testing processes.

Development or test builds of software that are built and run on the same
machine, such as unit tests.

<dt>How it works<dd>

Scorecard assesses potential risks in OSS repos through a series of automated
checks.

See the [Scorecard documentation] for details.

<dt>Goal<dd>

An aggregate score of at least 5/10

<dt>Implementation Status<dd>

Not started.

- [ ] [Add Scorecard to GitHub code scanning suite]()
- [ ] Obtain aggregate score of 5/10
- [ ] Add Scorecard badge

</dl>

### OpenSSF SLSA

<dl>
<dt>Summary<dd>

Supply-chain Levels for Software Artifacts, or [SLSA] (pronounced "salsa") is
a framework for assessing the integrity level of a build process and
collecting artifact provenance information.

<dt>Motivation<dd>

Even if the origin of a software package is known and is digitally signed,
a compromise of the build process can still lead to malicious or vulnerable
software. SLSA establishes mitigation strategies for common security concerns
and provides transparency for build processes.

<dt>How it works<dd>

SLSA requires software producers to establish a consistent build process
and to choose build platform that meet certain integrity and security
requirements. By requiring the build process to collect and distribute SLSA
Provenance metadata, downstream consumers can verify the integrity and
authenticity of produced software.

See the [SLSA documentation] for details.

<dt>Goal<dd>

Build L3: Hardened builds

<dt>Implementation Status<dd>

Not started.

- [ ] Add [slsa-github-generator Action] to CI
- Collect and upload SLSA Provenance attestations for:
  - [ ] PDO eservice container
  - [ ] PDO pservice container
  - [ ] PDO sservice container

</dl>

[Add Scorecard to GitHub code scanning suite]: https://github.com/ossf/scorecard-action#workflow-setup
[Scorecard]: https://securityscorecards.dev/
[Scorecard documentation]: https://securityscorecards.dev/#the-checks
[SLSA]: https://slsa.dev/
[SLSA documentation]: https://slsa.dev/spec/v1.0/requirements
[slsa-github-generation Action]: https://github.com/slsa-framework/slsa-github-generator
