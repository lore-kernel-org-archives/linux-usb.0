Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7134BB295;
	Mon, 12 Oct 2026 17:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826896; cv=none; b=Y/Y+/5XYBhzlU2z6boLhO8lM2zebsf4SAw5M/J38+yNDEINVu4kaM+JEDmEebHkeAhMp5fpfFxOYcsNxJzMBolFGL5jIzjCaeJUnF3jltRH/d4hg1TrszI41F/HR1fRoMa0snz6AL7jB/ov3jHf+nRTyTVlylLb5mVeVRdNGxog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826896; c=relaxed/simple;
	bh=6ZQkV22c0I8aCjWiJN8hyG/fsHHYJaZzW2z97+4dxAs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=V0eIcP/+5WcErQ2lsTwLAKf5EnEe0pAgdaPDZdxpNlnHqa8LxuTxcyAD1HDEWaSmO/DT+lAdeXnq8PGCbHs1b0Vfm2LhMixRv+XHBDFvSUoEyH1Nolw+CNGu3GjW/r8Kbuh+TBXI7REXCbf70kbokMPgM1LHt31w3qgFc0O46M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqi1GWAe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqi1GWAe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B8E1F0089B;
	Mon, 12 Oct 2026 17:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791826895;
	bh=zXDPG2DDOH7T1QYpn0RbI8OHS7BHDVSn8tLt4xZMpqw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mqi1GWAes25xIDC9buHG78yF4VgKtW9AJ5elI2OfJc9iP3fL7tCf6JnAkafQFp6qR
	 glxCjXrXnurSx+YWGSCKlm9pYhyGgjJ13iDN31bF6U8m9fmReoH55ho6/NAXFBxYID
	 +LjKilhUa6EEihvfHFLzPSGwDA2H/WypOQ/I/IxivFRvFR6wtUts8+QJyTsVyQQQn4
	 L5PvlkaCFDFiveJh+cmiTGbFC1qZbvrVSoCYS5N8BprQW6xJKOefEp4iKp7gPjee6s
	 sbP/otQszojEBg0zJztMANgOIzKAmfe/5onkcWrxQQFla2tjaHlvdalDyVOQwOlWsm
	 AprlGYSV///ug==
Message-ID: <sashiko-outbox-168478@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/11] dt-bindings: i2c: Add NVIDIA LSTP I2C
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: conor+dt@kernel.org, linux-usb@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261012-lstp-usb-adapter-v1-2-aambrozewicz@nvidia.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
 <20261012-lstp-usb-adapter-v1-2-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 17:41:34 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: incomplete schema validation allows unsupported clock-=
frequency property
--

commit 16ee132f4b8daa2cd636b3b3437f38ceb664442e
Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

dt-bindings: i2c: Add NVIDIA LSTP I2C

This commit adds a device tree binding for the I2C controller channel on an
NVIDIA LSTP USB device. It includes configurations for the compatible strin=
g,
register ID, and a custom property for arbitration retries. The documentati=
on
notes that the device sets the bus speed, so clock-frequency is unsupported.

> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,lstp-i2c.yaml b=
/Documentation/devicetree/bindings/i2c/nvidia,lstp-i2c.yaml
> new file mode 100644
> index 0000000000000..eacabed52cd1c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,lstp-i2c.yaml
> @@ -0,0 +1,71 @@
[ ... ]
> +description: |
> +  I2C controller channel on an NVIDIA LSTP USB device.
> +
> +  Peripherals on the bus are described as child nodes.  An i2c alias
> +  gives the bus a fixed number.
> +
> +  The bus speed is set by the device.  The LSTP protocol has no way to
> +  change it, so clock-frequency is not supported and is ignored.
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: nvidia,lstp-i2c

[Severity: Low]
Since this schema inherits from /schemas/i2c/i2c-controller.yaml# which
evaluates and permits the standard clock-frequency property, should
clock-frequency: false be explicitly defined in this properties block?

Because the property is evaluated by the $ref, the unevaluatedProperties:
false directive at the bottom of the schema does not reject it. Device
trees that incorrectly specify clock-frequency for this controller will
silently pass schema validation, despite the binding's documentation stating
it is not supported.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-lstp-usb-a=
dapter-v1-0-aambrozewicz@nvidia.com?part=3D2
