Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B3930ACF0
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 04:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773720965; cv=none; b=mjgJn7ny28352RH6iq26fSBHqzTPoRnrg+c7S5qweBuW5b0oLFMoKazA9ZAw96/+rHGX2jMPdI+L2bHQRmlRR1qsvQ+B3QUOo5b1SvYJoEKmk5k4N59mODgvaNDoZG1KWVZySTHZbfUxIxAc3jKWAup0soBOjVpCrOvy6paJC70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773720965; c=relaxed/simple;
	bh=o+rgNewqoJ4290bVj4LAo/MvWyje+OUbt8vKys4+zzc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=uHkYd7fMUap2hRTfeexM4KZQGsmOAS7n0TVliYg8gEQNXI0rdFt2w+Fu7KPZ87zWwnJSTlv1HARV96IHEYQWl0mZ7AfaTietbQZV+9H/2ppuRSV8jyYpzlwkoyoRLF/aAuIyphN4DzQGEdMQzM9Vggh0qme9U6e3nMMZPNujqZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qSHJnnWA; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qSHJnnWA"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773720950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dsfrICEAiF/QAe2USeGCcUz3O4end0xEuayixaEUc2o=;
	b=qSHJnnWA1z4yQ791SI42jydSs85/p/pHYyjQ+bwrVSkzyWzeEBe79Y7MkjkHaK1Z3zo+o1
	vApaRtahOPedpcuys2wFm3B4HQGQ7GcTa/4RwqC0fBtjJ3piDg1174tYGPelBUaSz2ZAV7
	Lbbsoh7JnXBp2k4xhYZGWHBfOgyrCOE=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 12:15:02 +0800
Message-Id: <DH4RL1NROT5O.2BN4PC3IH3DV2@linux.dev>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Ze Huang"
 <huang.ze@linux.dev>, "Yixun Lan" <dlan@kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, "Thinh Nguyen"
 <Thinh.Nguyen@synopsys.com>
References: <20260316080000.3130372-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260316080000.3130372-1-amadeus@jmu.edu.cn>
X-Migadu-Flow: FLOW_OUT

On Mon Mar 16, 2026 at 4:00 PM CST, Chukun Pan wrote:
> Some boards provide USB VBUS through a controllable regulator. Add
> support for the optional vbus-supply property so the regulator can
> be properly managed instead of left always-on. Note that this does
> not apply to USB Hub downstream ports with different VBUS supplies.
>
> The enabled and disabled actions of the regulator are handled
> automatically by devm_regulator_get_enable_optional().
>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
> The vbus-supply property has been declared in spacemit,k1-dwc3.yaml
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bi=
ndings/usb/spacemit%2Ck1-dwc3.yaml#L71
> ---
>  drivers/usb/dwc3/dwc3-generic-plat.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3=
-generic-plat.c
> index e846844e0023..83b4e4d69ba9 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -12,6 +12,7 @@
>  #include <linux/reset.h>
>  #include <linux/regmap.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/regulator/consumer.h>
>  #include "glue.h"
> =20
>  #define EIC7700_HSP_BUS_FILTER_EN	BIT(0)
> @@ -113,6 +114,10 @@ static int dwc3_generic_probe(struct platform_device=
 *pdev)
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "failed to get clocks\n");
> =20
> +	ret =3D devm_regulator_get_enable_optional(dev, "vbus");
> +	if (ret && ret !=3D -ENODEV)
> +		return dev_err_probe(dev, ret, "failed to enable VBUS\n");
> +
>  	dwc3g->num_clocks =3D ret;
>  	dwc3g->dwc.dev =3D dev;
>  	probe_data.dwc =3D &dwc3g->dwc;

This could be useful for boards with direct-attached VBUS.

Just to clarify, the vbus-supply binding is for potential direct-attached
designs. For current boards (like K1 BPI-F3 and Jupiter) with the VL817 hub=
,
we'll use onboard_usb_dev instead.
