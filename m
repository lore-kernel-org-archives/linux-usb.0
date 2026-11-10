Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312594;
	b=jh2VCDO5M2J4lacj42r20zhbH6p554iRW4EKbO6nQnOd7K6783RoAdah84lc3c8gg0sj
	 ljs7TE6qEHojEHGr6MsSCrQBKX6l0DXtGtdHagnTvksJOw9mEzs+6VP7ApicQeyEwxIlM
	 NLdvAF1PwMGB6GQYiGnU++atUJhWh8nDFvDrwsaJD5sB1ocT4fzRO6awZPl8AmKsVEBQu
	 /FkmDTjz9CIIkKh/yL7NQ4a9ozp1UOxC1CiYPaEorQS+GEOO58d/W1mxfMM4mAhhmy986
	 /5feQYPd36bkxzSrHw31J2ABC4g2yjBFuutbjUPdW/ivMaD1Eh/TTEylZKPHlm87m3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312594;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mm9r4xZ7hODHcZNY2XQx9tILVaxTP+gEnRlfe75JOl8=;
	b=jQXjEQgv+jcUyEf5Z7tVjqnQQqSABd+2fHLiNpNykNNYg0Y2CuQUMj8ydp45A2hzry2a
	 LChLJq3n6r+zw0WBX5eYXYLE9/kdzcrPughRvJ8qbQ8phXbv3hnQ4CqzPzTJJtTr+AwQ4
	 1l1wnYCfU/AQkMWrzV5zCR1H+p3mR3SRvBVB2V13PeLB4qdY2DZWGKCrq0yasxlpDS7ab
	 O0KDKNOtPhqaNXpKQ+kH9nIQYTZlid8r9CYpMWRkJwb0podvEuOLK1lALioWZwNxPYdSf
	 ucuRmUbShQFWPCLHs4n11NRVR2C9PUDJQp00k+h/EM/diQ3q/MJQZygCzjsqnep3Bfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k5QSkqvQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ADB606A332
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 12:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k5QSkqvQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91761F0089F;
	Tue, 10 Nov 2026 12:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312594;
	bh=mm9r4xZ7hODHcZNY2XQx9tILVaxTP+gEnRlfe75JOl8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k5QSkqvQwXbmxcvso/SgCVTQO1NfcFrG0CEc8tJkgTx0ePKL/p2hDamy88UNEhfHj
	 p+vy17ta+b4OuVLXH6w4JLU2dTBSle9shCLs7AgyJPWXmeMlutt8cuXJt2qzMXDjRP
	 esdB4zaKlMfUoRZhG9phgvJmDwjKR1BOGwu9ZGX5q1GDQ0XeONv4bza1R+O6XXGFjy
	 vSUkqU2ueLlYNtw5XcqzuScg8FvXpw+0ho7PEdNGv9X8x9jESTDeWh7whpw4OCAu3g
	 hJtLlS4BQi/gDeHiS688IFbS06STFJd/ATsowxj8kv9KbnYCv+6IP/PCzgw8WKK73a
	 qlWpJnFz1ubnw==
Message-ID: <sashiko-outbox-206987@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] thunderbolt: Make PCIe NHI support opt-in
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chunfeng Yun" <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110114925.722014-4-chunfeng.yun@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-4-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 12:09:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] thunderbolt: missing default USB4 on CONFIG_USB4_PCI breaks
  existing configs
- [Low] thunderbolt: misplaced EXPORT_SYMBOL_GPL(tb_xdomain_remove) in
  xdomain.c
--

commit 20bc8cfb6a438440bc1447d0b676bf03b1cdb691
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

thunderbolt: Make PCIe NHI support opt-in

This commit decouples PCIe NHI and ICM support from the core USB4/Thunderbo=
lt
framework into a separate thunderbolt_pci module controlled by CONFIG_USB4_=
PCI.

> diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
> index 294b3227a5458..605af440457a1 100644
> --- a/drivers/thunderbolt/Kconfig
> +++ b/drivers/thunderbolt/Kconfig
> @@ -1,7 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  menuconfig USB4
>  	tristate "Unified support for USB4 and Thunderbolt"
> -	depends on PCI
>  	select APPLE_PROPERTIES if EFI_STUB && X86
>  	select CRC32
>  	select CRYPTO_LIB_SHA256
> @@ -18,6 +17,16 @@ menuconfig USB4
> =20
>  if USB4
> =20
> +config USB4_PCI
> +	depends on PCI
> +	tristate "Support for PCIe-attached USB4 and Thunderbolt controllers"
> +	help
> +	  Say Y here to add support for the USB4 and Thunderbolt host
> +	  routers attached over the PCIe bus, commonly found on x86 PCs.
> +
> +	  To compile this driver a module, choose M here. The module will be
> +	  called thunderbolt_pci.

[Severity: High]
Should USB4_PCI default to USB4?

Without a default, make olddefconfig on existing configs with CONFIG_USB4
enabled (as well as in-tree defconfigs such as loongson64_defconfig) will s=
et
CONFIG_USB4_PCI=3Dn and drop PCIe controller support.  On ACPI systems with=
 a
PCIe host router, having CONFIG_USB4 enabled while CONFIG_USB4_PCI is disab=
led
still causes acpi_bus_osc_negotiate_platform_control() to claim native OS
USB4 control via _OSC (disabling the firmware Connection Manager) with no OS
NHI driver bound, and causes typec_has_usb4_host_interface() to wait for a
usb4_port component that is never registered.

[ ... ]

> diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
> index 16e818c1af1c0..d2dd6dec5b474 100644
> --- a/drivers/thunderbolt/xdomain.c
> +++ b/drivers/thunderbolt/xdomain.c

[ ... ]

> @@ -2270,6 +2273,7 @@ void tb_xdomain_unregister(struct tb_xdomain *xd)
>  	dev_info(&xd->dev, "host disconnected\n");
>  	device_unregister(&xd->dev);
>  }
> +EXPORT_SYMBOL_GPL(tb_xdomain_remove);

[Severity: Low]
EXPORT_SYMBOL_GPL(tb_xdomain_remove) is placed after tb_xdomain_unregister()
instead of immediately after tb_xdomain_remove().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110114925.7220=
14-2-chunfeng.yun@mediatek.com?part=3D3
