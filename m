Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393891;
	b=xcvnNmkCRg+qke6NIv8OY2SoyavP8z+RQ1II2uRudYxBgrcABp34OkGhIk2bH97LGuj8
	 vV1n8SKDzg/qVZ/xSZ8cGF5zJTmGzw9EPLvw9IbpXmFdY9MQcgtN9tUF5mJob6S6UHlTR
	 WADhdG+nqmUPLvB8TYYoJ8Tw0t8rHkZjorti7KSiuBMrx09q8K7OuYMBywNvEDcqZGDr9
	 mBZGtTYWiyG8yP2MWYJQcBMrsV+3v2OvKuAUM06ZUhmyX01cgAPWw2ABflouA7qpXwfaz
	 Al4LcQdeIemjPzs2xBzEz1qohup1fqxa7/8iIhux/FhFyaUh0gJtgVhkbHBinvsIdIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393891;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2GwTKIi/C0ze0wcl8im51F1rhbTkNrLFibhxpwsemRs=;
	b=jgBgcyRvHvf06wYA8E0mkXrIqzd5zk6e7mMmQT16qElr4tdEZ51LU17VL3JJpYCoYKkt
	 aJRTTQjwuo6YI5mKDhnly74dnVKPlwi7Ksyaql1TOmwVG15sFTVIkFiqCY98DtiFqoo/t
	 mDuNyXdgGzE76ZkIoVKlTbkycR9OibEatmlVJoO4tzDtQjlbT4Z4ouM61TzNUK7UG4yVt
	 12OPllQI6ObbSsWbF005fPvJmlI3QElM1t/jCM2zZOERleL2oo70hrHssFqi4F3jeoPsz
	 OOOzPibfbH8NMzqLBX4bVGTbB4dprrom45BwRMtj5BaTrFD4LqTkOSSWd1il5QHaIbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=btfFVMIT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086AC606A321;
	Wed, 11 Nov 2026 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=btfFVMIT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A491F00A05;
	Wed, 11 Nov 2026 10:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794393890;
	bh=2GwTKIi/C0ze0wcl8im51F1rhbTkNrLFibhxpwsemRs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=btfFVMITNPMFdtkzW7H5aa7NQRKKAbIlsQneqAnT/p3PHp7O5VPCi5XPOY58WJTla
	 yyNa3mf2YKu8QuA7EASy5ybEKEEGWbPva1AwLwKHsWfP/OPj3c+HYPZTio8Pyb/klm
	 /oqwSycys2AcrBHjtzaDlfICI3YM1agQ+qk5/7DSeMPyHhkksVJMei1W+9/ksxuoda
	 HGMMh+EPE3CMkRdwvxHFagfBH/eLkNoNRwlRGeM47vy8f/+PJWokHVIn7KM1Hji+C1
	 OmIpx+GAH5diT4VvRmXgYIo7twKLYymPnmJ3bNE3WsPDdSXeu+VOPUWzCPilQ46ku5
	 o74mfV1vOUghw==
Message-ID: <sashiko-outbox-208827@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add Genesys Logic GL3525 hub
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fei Shao" <fshao@chromium.org>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111103710.1393311-2-fshao@chromium.org>
References: <20261111103710.1393311-1-fshao@chromium.org>
 <20261111103710.1393311-2-fshao@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 10:44:49 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: usb: unwieldy per-compatible conditionals in
  genesys,gl850g.yaml
--

commit 74488a0f4f0a5f370e0fe57ea84abc8dcd904262
Author: Fei Shao <fshao@chromium.org>

dt-bindings: usb: Add Genesys Logic GL3525 hub controller

This commit adds the USB 3.2 (usb5e3,629) and USB 2.0 (usb5e3,630)
compatible strings for the Genesys Logic GL3525 hub controller to
genesys,gl850g.yaml.

> diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/=
Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> index e8b8c03f87a0e..5153a988a835e 100644
> --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
[ ... ]
> @@ -70,6 +72,8 @@ allOf:
>              enum:
>                - usb5e3,610
>                - usb5e3,620
> +              - usb5e3,629
> +              - usb5e3,630
>      then:
>        properties:
>          peer-hub: true

[Severity: Low]
This isn't a bug, but the per-compatible if-then conditionals in allOf are
becoming unwieldy and inconsistent as more hub variants with different
supply and peer-hub rules are added to genesys,gl850g.yaml.

In particular, setting peer-hub: true and vdd-supply: true in the then
blocks is redundant because those properties are already defined at the top
level, usb5e3,626 is omitted from the conditionals entirely (leaving
vdd12-supply allowed on usb5e3,626 while disallowing it here), and
usb5e3,610 is restricted to vdd12-supply: false even when paired as the USB
2.0 companion hub for GL3590 (usb5e3,625).  Could these variants be split
into separate schema documents, or the conditionals simplified to only
restrict the properties that do not apply to specific compatibles?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111103710.1393=
311-1-fshao@chromium.org?part=3D1
