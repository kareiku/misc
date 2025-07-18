---
title: Packaging Rule Set
layout: default
---

# Packaging Rule Set

## Parameters

- $Q :=$ quantity needed
- $D :=$ number of days
- $R :=$ repeat rate (how many days you can use a certain kind of item)
- $W :=$ number of times laundering

## Cleanwear Efficiency Formula™

$Q = ceil(D / (R * (W + 1)))$

## Recommended Repeat Rate for Clothes in Winter

| Piece of Clothing   | $R$      |
|---------------------|----------|
| Underwear           | $1$      |
| Socks               | $[1, 2]$ |
| Shirts              | $2$      |
| Sweaters & hoodies  | $[3, 5]$ |
| Pants               | $[3, 5]$ |
| Coat                | $D$      |
| Gloves, scarf & hat | $D$      |
| Sleepwear           | $[1, 2]$ |
