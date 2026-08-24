Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ADB3A8749;
	Mon, 24 Aug 2026 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581913; cv=none; b=OjSOKQB6aouEMwnHB+vqizC24kTzNwOYNOscdOU1mxgcnDVaF+JPn2T8GdsMIt1ly3VgXH0zL+dtgRVpvaxcaQAqXaOmtSO1ewor5I+I7g0xOAyASnC0VXqm3E3QhfGGHBdDOBUf+vZsiDFIVEEaVB5f6LKhBkP6dicVAuvHhew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581913; c=relaxed/simple;
	bh=CFdp2VkVfTAThSR2QMD1DG+F4FjVJRM+hh0mzal9d8E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bUQvz65aSt9G4MlfdAdUujPAhlIoJ7UXr5Gs4dxULpMmrfPnn3fpT3pZVJB45gO1v/h28y5duvchdwDTHZdT2di7AFPcqGd6js6p2dhqzIILJ3uRQ6YLWA20cYo21R5HRHl2KCXMkIYSyY4x6taIzjdGbxe3JvsUdRhiuFgMXDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 20ED72003DE;
	Mon, 24 Aug 2026 16:31:44 +0200 (CEST)
Message-ID: <a01e558769b4b30e792c3b37fd0bfa60d022159e.camel@pengutronix.de>
Subject: Re: [PATCH v2 02/14] phy: qcom: Introduce Qualcomm IPQ5332
 Super-Speed USB UNIPHY driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Praveenkumar I	 <quic_ipkumar@quicinc.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,  Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Greg
 Kroah-Hartman	 <gregkh@linuxfoundation.org>, Wesley Cheng
 <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Date: Mon, 24 Aug 2026 16:31:44 +0200
In-Reply-To: <20260812-ipq5018-usb3-v2-2-8f355d7ff0ef@outlook.com>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
	 <20260812-ipq5018-usb3-v2-2-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mi, 2026-08-12 at 13:34 +0400, George Moussalem via B4 Relay wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
>=20
> Adds Qualcomm 22ull Super-Speed USB UNIPHY driver support which is
> present in Qualcomm IPQ5018 & IPQ5332 SoCs.
>=20
> This PHY is interfaced with SNPS DWC3 USB and SNPS DWC PCIe. Either one
> of the interface can use the it and selection is done via mux present in
> TCSR register. By default, the PHY is configured for PCIe interface and
> needs this driver to configure the mux for USB.
>=20
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/phy/qualcomm/Kconfig                       |  10 +
>  drivers/phy/qualcomm/Makefile                      |   1 +
>  .../phy/qualcomm/phy-qcom-uniphy-usb-ss-22ull.c    | 304 +++++++++++++++=
++++++
>  3 files changed, 315 insertions(+)
>=20
[...]
> diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-usb-ss-22ull.c b/driver=
s/phy/qualcomm/phy-qcom-uniphy-usb-ss-22ull.c
> new file mode 100644
> index 000000000000..089de7cebef0
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-uniphy-usb-ss-22ull.c
> @@ -0,0 +1,304 @@
[...]
> +static int qcom_uniphy_usb_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	struct device *dev =3D &pdev->dev;
> +	struct uniphy_usb *uniphy;
> +	int ret;
> +
> +	uniphy =3D devm_kzalloc(dev, sizeof(*uniphy), GFP_KERNEL);
> +	if (!uniphy)
> +		return -ENOMEM;
> +
> +	uniphy->dev =3D dev;
> +
> +	uniphy->cfg =3D of_device_get_match_data(dev);
> +	if (!uniphy->cfg)
> +		return -EINVAL;
> +
> +	uniphy->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(uniphy->base))
> +		return dev_err_probe(dev, PTR_ERR(uniphy->base),
> +				     "failed to map base\n");
> +
> +	ret =3D devm_clk_bulk_get_all(dev, &uniphy->clks);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to get clocks\n");
> +
> +	uniphy->num_clks =3D ret;
> +
> +	uniphy->reset =3D devm_reset_control_get_exclusive_by_index(dev, 0);

There is only a single reset control. Don't use
devm_reset_control_get_exclusive_by_index(), use
devm_reset_control_get_exclusive(dev, NULL) instead.

regards
Philipp
