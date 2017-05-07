---
title: RFC-1 -- Remove the 1024 character limit
language: en
layout: default
created: 2017-04-26 12:34:56 -0800
updated: 2017-04-26 12:34:56 -0800
toc: false
tags: []
---
## Status

2017/05/06 - **Approved (1.3)** - @flyx @ingydotnet @perlpunk #YS17

## Problem

Within block structures there is currently a 1024 character limit to see
whether a node is a key for a new mapping or not. With a few changes this
restriction can be removed.

## Proposal

When the explicit key indicator '?' is not used, content must be scanned to see
whether it is being used as a map key or not. Keys may by plain or quoted
scalars, or flow collections. YAML 1.2 has a 1024 character scan limit. This is
an ugly limitation and can hopefully be removed.

Implicit block mapping keys will have to be one line scalars. Anything else
requires them to be explicitly marked by the `? ` indicator. The primary change
is to no lonager allow implicit flow collections as keys. See [RFC-7]().

## Examples

## Discussion

@ingydotnet - Does the 1024 limit also exist for nodes inside flow structures?

## Tests

## See Also

* [RFC-7]()
