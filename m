Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885343;
	b=sdRN9RGBdNwDfbCq2bK1pDUrJDW2LxaJAdrWsayImAIEcSlLFmjrC7gY0pNPf8pcUbDn
	 oqSRJb2yNHBqwcH/phLgtURkUrtBg5Jh9MbcjU1fmpjLvzXTy5WVoajzBLDalC51yfNsU
	 An04ULZrQd/euwUarSvXtlNRwGvzsOG7IWkapEVFnwXal3mpIHLheD9I/Ih3CT6tuB/rU
	 iF107TgR/Fx3nHXIPi8ld32MDVjKpuLQCz7s8e9ONZR2PMmB2wyoQk2bGjoGesv8OEw3M
	 hBiBd8Cy8XM8OOvriyJSYD6mAizXb6FiepTY58xPTdhHGaFe8TFtLdl8Eh1P2DDOQWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885343;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EXCkhC9s9bFU0Si5utMIhT8ww50iNweoVBMADooFS0g=;
	b=IQZbPzDTNhWphiCsze3ptzAOAX/vmRVes0Nww04oQusNUEKuJ6vedsexeBj9phkbU2z2
	 yp+PD9J0Gsywmfkd2djGmyvvpL/G4tG7SqPFVaF/5A1jCja7dej+gJjJ9a/uTFpox38+g
	 vHmVJ1YCvOZ6FifwFWrG1vTM4uRL+96PHZCeuAR/RtRewDN1hBuBW+ejshIvSHnESi3fu
	 Ri4OTXo9KedFKSea5pDN49vCtcEOOIDppyySHKYtbl55B6HSRDaHr4eIbQuwkMFD8a84Y
	 qpb0mfqkCCa8oRD2OveYKcnr0leRjlMJ5jAxV/SuFoGaB3joG4OtM58NTr0wistCCdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XWIqAIVj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF237606A32F;
	Tue, 17 Nov 2026 03:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XWIqAIVj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4047A1F000C4;
	Tue, 17 Nov 2026 03:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794885343;
	bh=EXCkhC9s9bFU0Si5utMIhT8ww50iNweoVBMADooFS0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XWIqAIVjjIAho8++CPIxW518TPBy7Ej6zIsfwOiW7nYuWVVpnM9BKbiB3wQt2D6fV
	 07ss7nY11+WLbtIs5jWwj38Lv6gf/WxjNhOQSmiT8lTsk+L+JBMI2xUwcpEpRbXvTt
	 9NlE9c414zLau7WR7aYbaTsmgFWYUPICQhKo2DvwlUbkRW2NSa+yTjOpytfP60ChX9
	 Hu3DHxemvtkxDX+WoW+KSkDbjG0CjGcwaAEtI0A2GB+eMa/mBmm0+pavfyEZ4sWmOi
	 3fCKBIZ3hKVsN+BzUc2C66hWSFY3aeCWk4joNUY/AH6jUOfmQgqMXq3Oqn1P8NAVdV
	 GaZ7AaLmMHqqw==
Message-ID: <sashiko-outbox-218132@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] usb: cdns3: Add CIX Sky1 glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Yang" <hongliang.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117021705.2202892-3-hongliang.yang@cixtech.com>
References: <20261117021705.2202892-1-hongliang.yang@cixtech.com>
 <20261117021705.2202892-3-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 03:15:42 +0000
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
- [Medium] usb: cdns3: cdnsp-sky1: pdata leak and silent child failure
  in cdnsp_sky1_probe()
--

commit c575d53bf0eb9b8bf707582d20e9f670aee59e99
Author: Hongliang Yang <hongliang.yang@cixtech.com>

usb: cdns3: Add CIX Sky1 glue driver

This commit adds a glue layer driver for the Cadence USBSSP controller on
the CIX Sky1 SoC, managing its clocks, resets, mode straps, and child
device creation.

> diff --git a/drivers/usb/cdns3/cdnsp-sky1.c b/drivers/usb/cdns3/cdnsp-sky=
1.c
> new file mode 100644
> index 0000000000000..7738ac7268de6
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdnsp-sky1.c
[ ... ]
> +static int cdnsp_sky1_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	/*
> +	 * platform_device_release() kfree()s dev.platform_data, so this
> +	 * buffer belongs to the child device once it is created. It cannot be
> +	 * devm-managed. cdnsp_sky1_check_children() guarantees that exactly one
> +	 * child takes it over, so it is not released here, not even on failure:
> +	 * a child that was created and then failed to register frees it on its
> +	 * own.
> +	 */
> +	cdns_sky1_pdata =3D kzalloc(sizeof(*cdns_sky1_pdata), GFP_KERNEL);
> +	if (!cdns_sky1_pdata) {
> +		ret =3D -ENOMEM;
> +		goto err_quiesce;
> +	}
> +	cdns_sky1_pdata->platform_suspend =3D cdns_sky1_platform_suspend;
> +	cdns_sky1_pdata->quirks =3D CDNS3_DEFAULT_PM_RUNTIME_ALLOW;
> +	cdns_sky1_auxdata[0].platform_data =3D cdns_sky1_pdata;
> +	ret =3D of_platform_populate(node, NULL, cdns_sky1_auxdata, dev);
> +	if (ret) {
> +		dev_err(dev, "failed to create children: %d\n", ret);
> +		goto err_quiesce;
> +	}

[Severity: Medium]
Can this leak cdns_sky1_pdata and silently succeed when creating the child
device fails?

drivers/of/platform.c:of_platform_device_create_pdata() {
	if (!of_device_is_available(np) ||
	    of_node_test_and_set_flag(np, OF_POPULATED))
		return NULL;

	dev =3D of_device_alloc(np, bus_id, parent);
	if (!dev)
		goto err_clear_flag;
	...
	dev->dev.platform_data =3D platform_data;
}

drivers/of/platform.c:of_platform_bus_create() {
	dev =3D of_platform_device_create_pdata(bus, bus_id, platform_data, parent=
);
	if (!dev || !of_match_node(matches, bus))
		return 0;
}

If of_device_alloc() fails (or OF_POPULATED is already set),
dev->dev.platform_data is never assigned, so platform_device_release()
never frees cdns_sky1_pdata.  In addition, of_platform_bus_create()
returns 0 when of_platform_device_create_pdata() returns NULL, so
of_platform_populate() only returns a non-zero error before any child is
created (such as -ENODEV when CONFIG_OF_ADDRESS is disabled), leaking
cdns_sky1_pdata on the goto err_quiesce path as well, while a child
creation failure causes cdnsp_sky1_probe() to return 0 with no child
device registered and the clocks and resets left active.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117021705.2202=
892-1-hongliang.yang@cixtech.com?part=3D2
