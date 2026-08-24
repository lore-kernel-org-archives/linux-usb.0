Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1D343F8D3;
	Mon, 24 Aug 2026 15:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787585614; cv=none; b=R1+/06smSheLjkcukFCkZ9RlH05B1BE94B0Mma5dx+mhGiJRewRWVtuJ6BXVQya6uSoNQ+ImtzfwciDuHepGWnWrJE+PXQ+Ra/xghFszFzQkkHwq9Fab7/0zqfGmauMW9AmMv9SHRvdm2KySBTmCnQHOpHGfgI6bwYTG6BsbK6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787585614; c=relaxed/simple;
	bh=8SSQlt77m+fOb+AVhYxC8vGo6DtayiPrLbBipchx+D0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fUjH7wzZQ5im/Lz+LbOswb2GF0+ZiU8QBmu5gvLDAiwmKj78jQ82WNCk2pxrPpUQE4AXLI29pV+ddNa4ikVIOXj/jowXIq9UDVdVSZ1KuzLiKKHwOLwLxXeRJFsmS8OCSiy0GLVYemHVJflDbW+szM9uZZ3TsjMj8cXkRwOXzdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 256EB2010D6;
	Mon, 24 Aug 2026 17:33:25 +0200 (CEST)
Message-ID: <699de61dc2bfebdf18cdb0e377d1ba63886b4e12.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] usb: gadget: udc: add Axiado AX3000 and AX3005
 UDC driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>, Krutik Shah	
 <krutikshah@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tzu-Hao Wei	 <twei@axiado.com>, Karthikeyan Mitran
 <kmitran@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Date: Mon, 24 Aug 2026 17:33:25 +0200
In-Reply-To: <20260817-axiado-ax3000-usb-device-controller-v2-2-0ef033dd0a68@axiado.com>
References: 
	<20260817-axiado-ax3000-usb-device-controller-v2-0-0ef033dd0a68@axiado.com>
	 <20260817-axiado-ax3000-usb-device-controller-v2-2-0ef033dd0a68@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mo, 2026-08-17 at 22:57 -0700, Naveen Kumar Rajgiri Bassappa wrote:
> Add a driver for the USB device controller integrated into the Axiado
> AX3000 and AX3005 SoCs.
>=20
> The controller is based on the Corigine USB 3.1 device IP core and uses a=
n
> xHCI-like programming model with a command ring, an event ring, and
> per-endpoint transfer rings composed of Transfer Request Blocks (TRBs).
>=20
> The driver implements the USB gadget and endpoint operations, including
> endpoint enable and disable, request queue and dequeue, halt and wedge
> handling, and standard endpoint 0 control requests.
>=20
> It supports High-Speed and SuperSpeed operation, control, bulk,
> interrupt, and isochronous transfers, and scatter-gather requests.
>=20
> Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> ---
>  MAINTAINERS                      |    2 +
>  drivers/usb/gadget/udc/Kconfig   |   14 +
>  drivers/usb/gadget/udc/Makefile  |    1 +
>  drivers/usb/gadget/udc/crg_udc.c | 4491 ++++++++++++++++++++++++++++++++=
++++++
>  drivers/usb/gadget/udc/crg_udc.h |  355 +++
>  5 files changed, 4863 insertions(+)
>=20
[...]
> diff --git a/drivers/usb/gadget/udc/crg_udc.c b/drivers/usb/gadget/udc/cr=
g_udc.c
> new file mode 100644
> index 000000000000..bb3ed394d984
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg_udc.c
> @@ -0,0 +1,4491 @@
[...]
> +static int crg_udc_init_hw(struct crg_gadget_dev *crg_udc)
> +{
> +	struct device *dev =3D crg_udc->dev;
> +	int ret;
> +
> +	crg_udc->clk =3D devm_clk_get_optional(dev, NULL);
> +	if (IS_ERR(crg_udc->clk))
> +		return dev_err_probe(dev, PTR_ERR(crg_udc->clk),
> +				     "failed to get clock\n");
> +
> +	ret =3D clk_prepare_enable(crg_udc->clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable clock\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, crg_udc_clk_disable, crg_udc->clk=
);
> +	if (ret)
> +		return ret;
> +
> +	crg_udc->rst =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(crg_udc->rst))
> +		return dev_err_probe(dev, PTR_ERR(crg_udc->rst),
> +				     "failed to get reset\n");
> +
> +	ret =3D reset_control_deassert(crg_udc->rst);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to deassert reset\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, crg_udc_reset_assert, crg_udc->rs=
t);
> +	if (ret)
> +		return ret;

This looks like it could be simplified with
devm_reset_control_get_optional_exclusive_deasserted()

regards
Philipp
