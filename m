Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965452;
	b=ibBT1SK2+vT5cI93Qg/FXOObT41Ae2I7z/zqmJ0V4UGQ5FwYDXU4p2nSov9TrXX90PXl
	 3BltKbCVL62U2hFTPjw1LBLOd1P8pWoeGgmSnHsqAsoNFGrJxdv4L6M0G/OCLBaKj38QU
	 wWQWv614IkFXA95vsDk9jfgCiqVuBX5ztR/XDxGMLHMRN/UmGvbHKQz0227HASq60LiUH
	 Oly1V4iB55BuEZf/pv7hWsqoJiYLS4wdRPIoHIKMwcrlZ86UmsuUcElIzbkvlvpG4H0+g
	 kYMhA3I6k2i0w+ZO/UMdu2swTYC740/l8loY0BdWpohvit/D1stYyKEb7hrIjM5bArw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965452;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n3hVNK+y1wCP4Lqm1G8XbO8IYXGR7svgX1tiTiOPxok=;
	b=ZK28J071IYJ3rsxrcJ+oMhaJj2pekk7S3Yq6W96QOTlYH+8N+3E4xohhpH1e3m4SldtS
	 xDLZ/lH2RO87cH3mL/pWuue1SyPk7mvBXPGTfJiTGN6HwlrzXSjDW5qlZaDXLdYQOwyDS
	 Urt3ueivxfUiEBrIQfBvmxB7t62fQ09VQh+irIuCKlMAJrWsX+pComH/w6oSrzCFv5WWR
	 WjPc4L7aieJzu94/kUzIchq/avf3/bj7pq1WlIzxyYJrtkYr5Aj6JZbnxePMciqQHsC+x
	 iCMiMUhciNPJSyfVR5F4OLe6EneUfa9QLv7/1BZQeCYwUeF/ggULM3w0WJYYeOsgQQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OVzN+UN7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6649B606A905;
	Fri,  6 Nov 2026 11:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OVzN+UN7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C861F008A1;
	Fri,  6 Nov 2026 11:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793965452;
	bh=n3hVNK+y1wCP4Lqm1G8XbO8IYXGR7svgX1tiTiOPxok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OVzN+UN7jcNB0JfvqfU5pytFP46xRDIrrr5YCw0Ck+Ze2wiFtK6dRmuZ/aCMYSmcH
	 y7bEq0VdMmRWnh3OWA36fc5eQxXhjJNZJQ3mP9ADeWpx0CRpIOs/D3D8neVDevz3OC
	 3UQPk9LDvlRzJ+LaQUe/RAf/4clw+R+9dK653Ftz+4gzhV8dpknFemspG3fPpkJWmh
	 Igto+4WZ3H1UNguwIlVdiQ9KXZf+K3dPGwQM/jaDvKVEmgZkd7O91qLCco7+nOdSiF
	 lfPV0BVEPjU08mgvnIPNKMQjqJFw0Bh0Bouwwpeo34e0cyE/K9xlMYE1ehUjXXxhmp
	 s4Kgp7igR5bNg==
Message-ID: <sashiko-outbox-201351@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: dwc3: imx8mp: set needs_full_reinit as true
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261106111943.2868733-3-xu.yang_2@oss.nxp.com>
References: <20261106111943.2868733-1-xu.yang_2@oss.nxp.com>
 <20261106111943.2868733-3-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 11:44:11 +0000
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
- [Medium] usb: dwc3: imx8mp: bitfield race on needs_full_reinit in
  dwc3_imx8mp_probe()
--

commit f35ce9daa116e0df2a34cb6ec0a405a630719820
Author: Xu Yang <xu.yang_2@nxp.com>

usb: dwc3: imx8mp: set needs_full_reinit as true

This commit sets dwc3->needs_full_reinit in dwc3_imx8mp_probe() so that the
USB3 controller is re-initialized after system suspend on i.MX8MP.

> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8m=
p.c
> index ee92a5efaa6e8..78cb79fefba2c 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -267,6 +267,7 @@ static int dwc3_imx8mp_probe(struct platform_device *=
pdev)
>  	}
> =20
>  	dwc3->glue_ops =3D &dwc3_imx_glue_ops;
> +	dwc3->needs_full_reinit =3D true;

[Severity: Medium]
Can setting dwc3->needs_full_reinit without holding dwc3->lock clobber
adjacent bitfields in struct dwc3?

needs_full_reinit is a 1-bit bitfield sharing a storage word with runtime
gadget flags:

drivers/usb/dwc3/core.h:struct dwc3 {
    ...
	unsigned		connected:1;
	unsigned		softconnect:1;
    ...
	unsigned		pending_events:1;
	unsigned		do_fifo_resize:1;
	unsigned		pullups_connected:1;
	unsigned		setup_packet_pending:1;
	unsigned		three_stage_setup:1;
    ...
	unsigned		needs_full_reinit:1;
};

Earlier in dwc3_imx8mp_probe(), of_platform_populate() synchronously runs
dwc3_probe() -> dwc3_core_probe() -> dwc3_core_init_mode().  In peripheral
mode, usb_add_gadget() registers the UDC, allowing a gadget driver to bind
and start the controller before of_platform_populate() returns:

CPU0                              CPU1
dwc3_imx8mp_probe()
  of_platform_populate()
    ...
      usb_add_gadget()
                                  gadget_bind_driver()
                                    ...
                                      dwc3_gadget_pullup()
                                        spin_lock_irqsave(&dwc->lock)
  /* RMW loads bitfield word */
                                        dwc3_gadget_soft_connect()
                                          dwc->pullups_connected =3D true;
                                        spin_unlock_irqrestore(&dwc->lock)
  dwc3->needs_full_reinit =3D true;
  /* RMW store overwrites pullups_connected */

Overwriting pullups_connected or adjacent EP0 and event flags can corrupt
EP0 state or cause dwc3_gadget_soft_disconnect() to see pullups_connected
as zero and skip halting the controller before suspend.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106111943.2868=
733-1-xu.yang_2@oss.nxp.com?part=3D2
