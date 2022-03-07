# Proxima Solidity Challenge

## Problem Statement

Proxima is looking to automate the management of their yield farming positions.

A yield farming position is generally a long-term deposit in a DeFi protocol
that either yields a return or produces rewards in a third-party token that can
be claimed through various methods.

We would like you to design and build a smart-contract based solution to 
automate the interaction with third-party Defi protocols in a safe, secure, and
cost-efficient manner.

## Scoping

The problem can be broken into 3 key areas, `operations`, `authorization` and
`connections`; each with a different complexity in design or implementation.

Each of these areas is discussed below. In undertaking the challenge you should
attempt to *complete* as many areas as possible, in favor of partial attempts
and further areas.

### Required Operations on Connections

The actions that can be taken on a given investment/protocol are:

- `invest`
- `divest`
- `harvest`

In addition to this, it may be useful to support the following read only data:

- `getBalances`
- `getAPR`

### Authorization Model

We would like to split actions into two categories:
 - High Trust
 - Low Trust

High trust actions are `invest` and adding / editing any supported DeFi
connections.

Low trust actions are `divest` and `harvest`. The idea being that we would be
able to mark one of our hot wallets as a "keeper" for these low trust actions,
while the rest of the high trust actions would only be callable by our
custodian. This helps automate the portfolio without assuming risk around a
compromised server being able to steal/destroy our funds.

### Adding & Managing Connections

It is likely that we will need to add/modify/remove connections to different
DeFi protocols. Given these connections will contain our own arbitrary code,
management of them is a high trust action. Consider the life cycle of a
connection and how that may differ from the life cycle of an investment. Your
submission should detail how connections to arbitrary DeFi protocols is
supported.

There are a number of ways to achieve this, all with their own trade-offs, you
are free to explore the problem space and make a call on your preferred model.

## Considerations

- Consider the trade-off between a single smart-contract address, and using an
   address per protocol.
- Consider how the cost differs with that of an EOA, are there optimizations we
   can do to bring costs down. What use cases will be more expensive? What might
   be cheaper?
  - Cost to invest
  - Cost to divest
  - Cost to harvest
  - Cost to deploy contracts
- What is the relationship between an investment and a DeFi protocol, is it
  always 1-to-1? Is it worth modelling a protocol, or just investment
  opportunities?
