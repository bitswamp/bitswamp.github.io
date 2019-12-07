---
layout: post
title: Allow pip to use older version of dependencies when building a wheel
---

I was in the situation where I wanted to build a `pandas` wheel for Alpine Linux. Additionally, I wanted to use a specific version of `numpy` to satisfy `pandas`'s dependency check. 

Simply running `pip wheel numpy==$NUMPY_VERSION` followed by `pip wheel pandas==$PANDAS_VERSION` caused `numpy` to be built twice, because the `pandas` build prefered to download and build the most recent dependencies rather than use the ones that existed locally.

### Starting Dockerfile

```
FROM python:3.6-alpine AS build

```