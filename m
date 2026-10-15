Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22624479869
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049094; cv=none; b=U5aDwBIZZguDg3Kvs64JMn9UwQ7pusPd2dVUQxF/+pi4O5QWgafYs+XMNRblrMkHB0ZQjL3sG0IlBm29dJG2kjoh9a8HPD24+KzB7a1hpOnHvd9Xi/ut30puG/Av2TDsG3Cw1j5VdxNUiQbgmrcPWb9/JYWMmcB6AUSQH2o/2EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049094; c=relaxed/simple;
	bh=SGWYALJKmtkN/fe4LedVXq1u+FbVS1bm/olljEGvZ7o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=R/TdQhqMnhf1iyXVSGldEirYLo0GfhKnSRTDaolET5EnRThYQLulFbdALsJuAB6YrJvpn+AfGDUWj7Me0EkFK37FcfunvWWLj0kTM/v/vhXa7GHz58LVxJELF3Y3MsoP7HUrRRb2o/lVemo9Vafe8HPHS5QVfgtJ/626FGVosSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOaNB3RE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOaNB3RE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9612E1F000CB;
	Thu, 15 Oct 2026 07:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792049083;
	bh=8vEMCKVcZehNR+sV3hC3kP5ImvAvuDNLDfJ29yek84M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lOaNB3REWczssKB1iBo8h5Yonob68RBiiFQbhXmeyOlhg4GGzFPzrRuESqXU8vwB/
	 FAcesDS/pAVdbrWKUffXK86MojhsUNHDh6cFjSI0OfIsfHDLRYW7rbS5qVimWuQWgk
	 V1RmfVzqWfRPf1pusjqosRVs6ygpT0OeHWudzBNmnMtAvBm5HnzWi7+ILKFioAlrtt
	 7DBVJgLPR+WywVmukRfyOIMQRdoEnQhMY4K7X8xBWZoDzQ7Q2v/9qOpVWW+W6TVMXm
	 eZPW3z4yiPikRYn9DG+hk00FUVbZZVsMdccWVlT4oJmNt5G1s+S5FTTfReyTZkanVx
	 AJtT1uIHncuxg==
Message-ID: <sashiko-outbox-172416@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 22/24] usb: dwc3: generic-plat: Add ZTE ZX279128S
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014072109.1759502-23-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-23-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 07:24:43 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: dwc3: generic: clock leak in resume error path
--

commit b05da126b481233779c64514b7441eac703bad0d
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

usb: dwc3: generic-plat: Add ZTE ZX279128S

This commit uses the generic DWC3 platform integration to enable clocks
and release resets for the ZTE ZX279128S SoC.

> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3=
-generic-plat.c
> index ca69ac0eb07ce..aa838cf0676f2 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -237,6 +237,7 @@ static const struct of_device_id dwc3_generic_of_matc=
h[] =3D {
>  	{ .compatible =3D "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>  	{ .compatible =3D "eswin,eic7700-dwc3", &eic7700_dwc3},
>  	{ .compatible =3D "starfive,jhb100-dwc3", },
> +	{ .compatible =3D "zte,zx279128s-dwc3", },

[Severity: Medium]
Does dwc3_generic_resume() leak the clock prepare/enable counts if
dwc3_pm_resume() returns an error during system resume?

drivers/usb/dwc3/dwc3-generic-plat.c:dwc3_generic_resume() {
	...
	ret =3D clk_bulk_prepare_enable(dwc3g->num_clocks, dwc3g->clks);
	if (ret)
		return ret;

	ret =3D dwc3_pm_resume(dwc);
	if (ret)
		return ret;
	...
}

Should clk_bulk_disable_unprepare() be called in the error path before
returning?

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014072109.1759=
502-1-ghahramani.navid@gmail.com?part=3D22
