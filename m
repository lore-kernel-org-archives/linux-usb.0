Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115535;
	b=3ZoGRWxuKnVGaGifXB7MRTBQskXB10wLuN5d8kCmx0+BdfqqRwmFYMTGUBOC4GaGa//V
	 WOKMroCALU+uv5azEzHmMFbwMcntO+iWE2eSaglCefc6VrAg3Qog41sE5bLZXvgj4YCwy
	 SDykSc6ZziIZMQenV2rmh+Qv6leYfa1Uw0UyJI4elWHnnd62CeAnUDBEFggnmoUsWDNsX
	 XY3gkLiOxC4Koxm2daEC+JsJR3lBlP6OM4UXLCsm85I6DHLR/UjBMSIw/lvBEp8HFztc/
	 LGyKanQ4NX49SbAe5VicHCyQkd2MfoCn8lnaGeKfo2YAm/3sY7OAILW+TU2P8MjmHGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115535;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Qc1JX3Xp8Xhe811ek9bj1AaoYE/kMD5uoW2IMdIz/Us=;
	b=GUhpFBvkDJdiwBtq+if+a0/2X0avHdioXoC3guHk1wt0hwdN5h4ndV2e1MLwLtuirO9G
	 AgrIZ7yDwmGKh4jOIlVSo98BVUdgMYS+TB4rb5AO/kseBepNOLNStsLeVa1XElPgxKCQ3
	 0v04SShBKp+kAjtouH0S8SpsjJmhypxkZZ5bTMeyptQCFZ2FlAaLUkHgo7dp2Y6FhhCrd
	 vQUvLs+Bd2NJuy+WMw/3yjV37SJgObzmFKzO/RQRdbIfSz4J1gKW24Wpd15BxGuG8AT62
	 rAtwA09n8Ov8ntSEGdf+z6V6TP6BGmMl/HarLfpKS83m+GUX6K94UU9wxVap0J8l6SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXBYaKxX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97536606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 19:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXBYaKxX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060C81F000C7;
	Thu, 19 Nov 2026 19:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795115535;
	bh=Qc1JX3Xp8Xhe811ek9bj1AaoYE/kMD5uoW2IMdIz/Us=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=RXBYaKxXi5qDOSUxiubh6k2WTLpOR4/2hTkhncgrTfWVJS+Wahaa5imTNdbs965pv
	 53nkr5SLt3YgJtl4SdBPR5jQOccGBF3sK4hrCp/H7iSEthMkpM7T/mmP7R0h+qO9lC
	 JfUp5jgtej36SlTmi2tLjHMSR4wKGjtDzwmNu7B0zXAOz8BLDdpeP8tefRTKzLX7Ea
	 yfoJ2QF/Zh9ee6cVFOMFXY0Iad/dXbJOQL1aEgGr2GMKZ7G6uwBZBtPvwU39L8jwae
	 NX9VdmCXSeM9FsB02gvqu24dbp70jm54fucpgjbsDga3w1NiI91fxnureDpC5ISEhj
	 n+hCgHSrKxD3A==
Message-ID: <sashiko-outbox-223836@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: bdc: Use devm_clk_get_optional_enabled() in
 bdc_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Elfring" <Markus.Elfring@web.de>, linux-usb@vger.kernel.org
In-Reply-To: <07112f96-430c-4109-9aca-e5d17e333d67@web.de>
References: <07112f96-430c-4109-9aca-e5d17e333d67@web.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 19:12:14 +0000
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
- [High] usb: bdc: double clk_disable_unprepare() in bdc_probe() and
  bdc_remove()
--

commit c38d4d54fe3bb2b28c05aba44e9d088e2b2d7d63
Author: Markus Elfring <elfring@users.sourceforge.net>

usb: bdc: Use devm_clk_get_optional_enabled() in bdc_probe()

This commit replaces devm_clk_get_optional() and clk_prepare_enable() in
bdc_probe() with devm_clk_get_optional_enabled().

> diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/u=
dc/bdc/bdc_core.c
> index 5149c98bf9bf9..ce09327250f43 100644
> --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> @@ -530,16 +530,10 @@ static int bdc_probe(struct platform_device *pdev)
>  		}
>  	}
> =20
> -	bdc->clk =3D devm_clk_get_optional(dev, "sw_usbd");
> +	bdc->clk =3D devm_clk_get_optional_enabled(dev, "sw_usbd");
>  	if (IS_ERR(bdc->clk))
>  		return PTR_ERR(bdc->clk);
> =20
> -	ret =3D clk_prepare_enable(bdc->clk);
> -	if (ret) {
> -		dev_err(dev, "could not enable clock\n");
> -		return ret;
> -	}
> -
>  	ret =3D bdc_phy_init(bdc);
>  	if (ret) {
>  		dev_err(bdc->dev, "BDC phy init failure:%d\n", ret);

[Severity: High]
Does this cause clk_disable_unprepare(bdc->clk) to be called twice on probe
failure or driver removal?

devm_clk_get_optional_enabled() registers a devres action that calls
clk_disable_unprepare(bdc->clk) on probe failure or device unbind, but the
manual clk_disable_unprepare(bdc->clk) calls remain in the disable_clk
error path of bdc_probe() and in bdc_remove().  That underflows the clock
enable and prepare counts, triggering WARN_ON() in clk_core_disable() and
clk_core_unprepare().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/07112f96-430c-4109-=
9aca-e5d17e333d67@web.de?part=3D1
