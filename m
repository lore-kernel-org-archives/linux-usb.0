Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794774608;
	b=WJfPUn7N7kMQoGPQna6e/B175DxS3WcHIZhEHMTR6NKPJ86Neb8VNX9fJ+ukYJ3YrKki
	 d+a6cdrQWpNcpuDCUtnXsoFrc5hSzc6tMWYtg8p1LfA9fNzB2kOrRU1FZNA1Z9ovsZUI2
	 H2nhoBVa+ZMx9GrYfvAOX1ELt49CxhdB6NT3Z+abTydF8VHQGlOvFlyrW5i2pEkUQC5Jr
	 7vWRY3oCpRgDDc9bvF2WajpqV7A4XQaCbAEosO1YoVc7Pu/WAxgm85a7+sBlOWKC7Zop1
	 B60Y2NtI6WuQ4Y+rKF8bmdOLGAgOxTiGouiz8XQ9LLOTSYZWdG4ova7m6CSV94tOhgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774608;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EsB+wa7pdrR0/PfhiCcVmP99w9cFnfunKoaASMTis+A=;
	b=XImAG4q3UhbAxEnsQyljZbfe861fhQuRdcByEBMHIiI06MVABrC3JME91K71+LuSjdyZ
	 Ql1wLUi9Y/psU516cIotktRqXUBB2nx6jooFu/StndqpseNScunVYywKD2F0AvAz6Wo53
	 0bc91f4HVmmbN0Aq7HRhJ3BDiQOya+CbgzaGelQVkJuL9/1SdAIeWF61v/pOGczHRyVs8
	 z6/hFnGj7fnc5nvDbURfpG53h8qCTIzyoOQTC5xeI/yOGN0YVvBQibqduVoRw6D9wIj/V
	 kXEEgTAzFS1Ql5uxUJtFt5Qe4nBppCZCfGWg15R+xYxkeak0KqZticrEJIBF6Iff8JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6RX5llA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4081606A334;
	Sun, 15 Nov 2026 20:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6RX5llA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2344C1F000C4;
	Sun, 15 Nov 2026 20:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774608;
	bh=EsB+wa7pdrR0/PfhiCcVmP99w9cFnfunKoaASMTis+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b6RX5llAxB04jbesu6fkk1adM9AFwLzCgtaptmrT/QmJA7cW/dZuskszAaX/xeXv0
	 C5D4uVOF2EyGgGxmocBIIJ88IWGCn3rJc9LN6Jbx9NOxeh9oRVbjWrmDDEwGPeg8UI
	 /mNXo8SkiFKX6PZj48MEkyvxbDMnf+BqoBVAiTONhlHv+JZIEi3LTIbOCNwAcq6HLG
	 v9tpwVTsuKVEf4+vxjhSzFTx9AKIPQINiFyUXhdc6pUkHWWUr+iuJzZndIaQP6aRDS
	 xeK/6Eh81vCjUQbZX4ffKe7XXg0e2J5zkfdxp0b2YqjLdCSwysdJFJX9YXtcKUL+uL
	 ruUFy40qtiX5w==
Message-ID: <sashiko-outbox-215815@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: usb: snps,dwc3-common: Document
 usb-psy-name
Reply-To: sashiko-reviews@lists.linux.dev
To: "Venkat Yadlapati" <venkat.yadlapati@yahoo.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-vantage-dwc3-v1-1-6abb5a3277f0@yahoo.com>
References: <20261116-vantage-dwc3-v1-1-6abb5a3277f0@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 20:30:07 +0000
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
- [Medium] dt-bindings: usb: snps,dwc3-common: usb-psy-name exposes
  Linux psy name
--

commit 4bb8a88bbaa8fbc9c3b1e6963f4478fd21569377
Author: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

dt-bindings: usb: snps,dwc3-common: Document usb-psy-name

This commit documents the usb-psy-name string property in the common
Synopsys DWC3 Devicetree binding schema.

> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml =
b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6c0b8b6538246..5d46db402f935 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -42,6 +42,13 @@ properties:
>      minItems: 1
>      maxItems: 19
> =20
> +  usb-psy-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Name of the power supply that is told the current the USB host
> +      grants to the device (e.g. after enumeration), so the charger can
> +      draw it.
> +
>    phy-names:
>      minItems: 1
>      maxItems: 19

[Severity: Medium]
Should usb-psy-name be part of the Devicetree binding ABI rather than a
phandle reference?

In drivers/usb/dwc3/core.c, dwc3_get_usb_power_supply() passes
usb-psy-name to power_supply_get_by_name(), which matches against the
Linux-internal power_supply_desc.name string (such as "qcom-battmgr-usb").
Devicetree bindings describe hardware relationships between devices using
phandles (for example, power-supplies or a usb-connector graph link)
rather than Linux driver registration names, which are normally only used
by legacy board files or software_node glue.

In addition, the qcom_battmgr use case mentioned in the patch notes will
not work at runtime: dwc3_vbus_draw_work() calls
power_supply_set_property() with POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT,
but neither sm8350_usb_psy_desc nor sc8280xp_usb_psy_desc in
drivers/power/supply/qcom_battmgr.c defines a .set_property callback, so
power_supply_set_property() always returns -ENODEV.

Also, this places usb-psy-name in the middle of the paired phys and
phy-names properties.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-vantage-dw=
c3-v1-1-6abb5a3277f0@yahoo.com?part=3D1
