Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795375916;
	b=AGeB9oEuUYMpkd6GjjrRKwDGmK5gYp1l8P7ehiqPsTAD+pvLRItLqD84hG5jjwaSLo+9
	 9NGVnOl8xhjhcfeD5yW16Mow9Vm6tSG8YHsGrQtS2zKF3QPOBFuwfBAZ0BcUNxrp+Pd/T
	 bNlFbUWEAgEEkIHAcfegmG/YW4EmodskvELBaYfsrVwFiDi357bqFgSBXuIEe6Qk7KG8w
	 xBIvIt3pDGmTuyUv0tu9SthXV9ofDZksVb+4bgTq9DCrfasCsbq01ZO+55Bcwz8kdZN6F
	 u4wPDaDqcfMj3eR23WcVlpC32hkV8BIWW1Z0wfHdLQBmhSrXBnMOB+8A5BJKuGTG+EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375916;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zswNxRlmIVI2NHAGg8UhwTfy05EQBpASQT0+aCvmtfU=;
	b=2Uh101WI9O132JduQabjmxtMTmoILnNdyIFt5t++0B+v9Vk8TtGXWxZ7JjYvBtJZ1ecX
	 iTOG12uLb4SSUnRbenTNmNH5rOEv1JiZ9t9jlUMiOQG1Mn6yZxuXRKKJYBX49ILkurTXh
	 4H7KWF+NKj6u7EQ9qwU1FnokzeCV/NSK3TOjGorU9bvwKsRTKl6C05vMxgp5Wot85qf67
	 sRnxVkCAgbuWf6SnmhNSUFwF+3HCK1pVZCODWsWXW7d6lmf+mSvd19uvth+Gm5/PMbw0C
	 YWz44h9ilh+Csgf4bKs+JRV6xGT6Qoxod6TCX/OQms1edfJrV+Iwqm/fnS0/HrbGhwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZS6TJYSy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F6F606A31A;
	Sun, 22 Nov 2026 19:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZS6TJYSy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263A01F000CA;
	Sun, 22 Nov 2026 19:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795375916;
	bh=zswNxRlmIVI2NHAGg8UhwTfy05EQBpASQT0+aCvmtfU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZS6TJYSyVGSNoMPbn1f0xX1b9pnA2O7qClbiKnbJ9p9jYVyXJIMMIEMtGXJYQ3QJX
	 Lym8wDQGJkNkHjZ0FZ5U9u0gqVHsiWtO5qi6PF4tvMDuTXbufKeuAzEjvoHMM6lWTk
	 wy2fxIGjaNQhHA8X4dl8sQPtMAphdh6fUjFnJoii/73vIx8rLy9RfgvHDDbATrk95p
	 DKDR66dVe/e6cPn7mIVsxMpjQFlLEgYVdkwOHFRXTi0ZyHGUsABO9VqCQn195wBSPk
	 9mfRIBqPmEq0uJGUgDj4k8Tuj/6uk5KQ16ETaKv6orjJdaN19RdCJTzcR0bghtCE8e
	 CZ2x1yFIUOtZw==
Message-ID: <sashiko-outbox-228257@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: snps,dwc3-common: Document
 usb-psy-name
Reply-To: sashiko-reviews@lists.linux.dev
To: "Venkat Yadlapati" <venkat.yadlapati@yahoo.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-vantage-dwc3-v2-1-2e741a834411@yahoo.com>
References: <20261123-vantage-dwc3-v2-1-2e741a834411@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 19:31:55 +0000
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

commit 27eb59afa8c6a2fd9ecc95737f8c70278b4ddb0d
Author: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

dt-bindings: usb: snps,dwc3-common: Document usb-psy-name

This commit documents the usb-psy-name string property in the common
Synopsys DesignWare USB3 controller Devicetree binding schema.

> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml =
b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6c0b8b6538246..41e8537b34d50 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -51,6 +51,13 @@ properties:
>        - items:
>            pattern: "^usb(2-([0-9]|1[0-4])|3-[0-3])$"
> =20
> +  usb-psy-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Name of the power supply that is told the current the USB host
> +      grants to the device (e.g. after enumeration), so the charger can
> +      draw it.
> +
>    snps,usb2-lpm-disable:
>      description: Indicate if we don't want to enable USB2 HW LPM for host
>        mode.

[Severity: Medium]
Should a Linux power_supply registration name string be part of the
Devicetree binding ABI?

dwc3_get_usb_power_supply() reads usb-psy-name via
device_property_read_string() and passes it to power_supply_get_by_name(),
which matches against the kernel-internal power_supply_desc.name string
(such as "qcom-battmgr-usb") rather than describing hardware.  Per
Documentation/devicetree/bindings/writing-bindings.rst, Devicetree bindings
should reference other devices via phandles (such as power-supplies or a
USB connector graph link) rather than driver or device name strings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-vantage-dw=
c3-v2-1-2e741a834411@yahoo.com?part=3D1
