Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921960;
	b=duOy1M2PGQ2NDWAJfMytHNXSQ2M1bJ9J9tp8ZaIFr29Ucmzyvd7+MdlNFDNG/P1d3nTT
	 eK4/E92GSb/gYoQv4Tbjh0TOqeHq/6ncTWBsSErRgzsGB/GyREvagEaoIBWvndzhkj5uX
	 MKugc5XJnrfitZ0zZpuvyhbx3yPK93jd33ZS8pOUMox76RQGSMJ8de/9/buvbF75Wauk3
	 CVjY9mUt6PU2NDGFomZ4POvaBRD9WRF7sRrIHwB/saTDFpIlj7tNMcev4Kt2swkiRoMSU
	 tfJaoLQvSep9umKh3cM/vXy8QqKHVmmMLLu73YWZhQtR2y9EYxCD81wwnxahDtXnsag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921960;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rGvyXa65+jPhF49u6mGHSwSOqNT03B5XvAEIQ2fSMhk=;
	b=SHk9xP8sP6rggWJ+lMCtuf4G9bfK2l1VL5M7kvBL6Rucw8/fLx6zxZmK3F80HHA3/ou8
	 QLyRx7uVQSjoEGnIOzPtSca4X53TCJ2WbOUn1FpNeYgYbxw60S7nmv/zOqTRpmYpPXoXO
	 o8MNAXokzx5t9c73volhkWvNOSvrkd6oY4WzCD2gEFwb/VNpbjKI4TcApBHo2+CeSkc4v
	 1DNBpFxQDBgmpsJu02XmQFDvq1FNNUnDZFUPKJO/AxrDU69mKGMhUuMGVX/IqFalVKCaL
	 qcPaj0AT4DmAsZxOXuRL8Zli7R/HFj2FJfjye8039V/kg2pI/Pjq6FUCeWISRxGEPHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mH5OoSen;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6F9606A31C;
	Tue, 17 Nov 2026 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mH5OoSen
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668BC1F000C4;
	Tue, 17 Nov 2026 13:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921960;
	bh=rGvyXa65+jPhF49u6mGHSwSOqNT03B5XvAEIQ2fSMhk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mH5OoSen2cTSC5lDbmNLNR1+U6x2AM0tfkok/BdLxUg6fh4qQQDYMj5HYu0WNp6TL
	 VymTrRKJ1bhsFE0F3955KIlByTLG2ESdWUowYyLAYRtQreihh6ZrWdsiw3sCQS5oI+
	 NE8azrYp0G6+zheqb27iDzR5V2gzqPo47leL9hVI76qlpyS3nW1y+Ajj2Pp+gQQjpG
	 JV2eHlb1NUl9nHOY/ZMxqQoE4ncqMpCR/Jjw60Z06f4SDPqLz5IPk9MvxM6JYlIoNx
	 shzDy2tvLYoL/LIClx+7V4a6ZUBcK0pfCjf04vU+ujOpBUs3dzF2I9l0iuVkuVBWPD
	 RtduajTmsVLkg==
Message-ID: <sashiko-outbox-218872@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] phy: sun4i-usb: Assert reset before deasserting in
 phy init
Reply-To: sashiko-reviews@lists.linux.dev
To: Roadbobek <admin@roadbobek.com>
Cc: linux-usb@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261117-usb-sunxi-reset-fix-v1-2-c2b76e0e84e1@roadbobek.com>
References: <20261117-usb-sunxi-reset-fix-v1-0-c2b76e0e84e1@roadbobek.com>
 <20261117-usb-sunxi-reset-fix-v1-2-c2b76e0e84e1@roadbobek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:25:59 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] phy: sun4i-usb: single-word handle in Signed-off-by trailer
- [Medium] phy: sun4i-usb: sun4i_usb_phy_init() asserts shared PHY2
  reset
- [Low] phy: sun4i-usb: missing Fixes trailer for sun4i_usb_phy_init()
  reset fix
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Medium] phy: sun4i-usb: clock reference imbalance in
  sun4i_usb_phy_init() [1]
--

commit 12bd7c6ca5df3e2bb05ffe3f4ddfe21723f76996
Author: Roadbobek <admin@roadbobek.com>

> phy: sun4i-usb: Assert reset before deasserting in phy init
>
> When a bootloader initializes USB before booting Linux without
> first tearing down the controller, phy->reset may already be
> deasserted when sun4i_usb_phy_init() runs.
>
> Because reset_control_deassert() alone is a no-op on an
> already deasserted reset line, stale USB PHY state can
> persist across the bootloader-to-kernel handoff.
>
> Assert phy->reset briefly before deasserting it in
> sun4i_usb_phy_init() so the PHY starts cleanly regardless of
> prior bootloader USB usage. Tested on an Allwinner A33 Q8
> tablet (Laser MID-786).
>
> Signed-off-by: Roadbobek <admin@roadbobek.com>

[Severity: High]
The Author header and Signed-off-by trailer use a single-word handle
(Roadbobek).  Documentation/process/submitting-patches.rst requires a
known real identity (full human name) for the Developer's Certificate of
Origin and does not allow pseudonyms or handles.

[Severity: Low]
Should this bug fix include a Fixes trailer?

  Fixes: ba4bdc9e1dc0 ("PHY: sunxi: Add driver for sunxi usb phy")

> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinne=
r/phy-sun4i-usb.c
> index f26eed0db17ef..05e6dcf035a1a 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -270,6 +270,8 @@ static int sun4i_usb_phy_init(struct phy *_phy)
>  		return ret;
>  	}
> =20
> +	reset_control_assert(phy->reset);
> +	usleep_range(10, 20);
>  	ret =3D reset_control_deassert(phy->reset);
>  	if (ret) {
>  		clk_disable_unprepare(phy->clk2);

[Severity: Medium]
Can asserting phy->reset here disrupt other active USB PHYs when PHY2 is
initialized on SoCs with needs_phy2_siddq set (such as the Allwinner
H616)?

When sun4i_usb_phy_init() runs for PHY0, PHY1 or PHY3 on those SoCs, it
directly deasserts data->phys[2].reset and clears hci_phy_ctl_clear in
PHY2's PMU without going through phy_init(phy2->phy):

drivers/phy/allwinner/phy-sun4i-usb.c:sun4i_usb_phy_init() {
	/* Some PHYs on some SoCs need the help of PHY2 to work. */
	if (data->cfg->needs_phy2_siddq && phy->index !=3D 2) {
		struct sun4i_usb_phy *phy2 =3D &data->phys[2];
...
		ret =3D reset_control_deassert(phy2->reset);
}

Because sun4i_usb_phy_probe() acquires each reset via
devm_reset_control_get() (exclusive, non-refcounted), later initializing
PHY2 for ehci2/ohci2 will now pulse data->phys[2].reset low for 10-20 us
(or leave it asserted if reset_control_deassert() fails) while PHY0, PHY1
or PHY3 are already active and relying on PHY2 remaining out of reset
with SIDDQ cleared.

[Severity: Medium]
This problem wasn't introduced by this patch, but in the needs_phy2_siddq
block right below in sun4i_usb_phy_init(), does [1]
clk_disable_unprepare(phy->clk2) disable the wrong clock after enabling
phy2->clk2?

drivers/phy/allwinner/phy-sun4i-usb.c:sun4i_usb_phy_init() {
		ret =3D clk_prepare_enable(phy2->clk2);
		if (ret) {
...
		}

		if (phy2->pmu && data->cfg->hci_phy_ctl_clear) {
			val =3D readl(phy2->pmu + REG_HCI_PHY_CTL);
			val &=3D ~data->cfg->hci_phy_ctl_clear;
			writel(val, phy2->pmu + REG_HCI_PHY_CTL);
		}

		clk_disable_unprepare(phy->clk2);
}

Initializing PHY0, PHY1 or PHY3 leaks a prepare/enable reference on
phy2->clk2, while prematurely disabling phy->clk2 and causing an
underflow in sun4i_usb_phy_exit().

[1] https://sashiko.dev/#/bug/linux-16c490f9-c5d0-4103-a9d3-3f6814c64cb4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-usb-sunxi-=
reset-fix-v1-0-c2b76e0e84e1@roadbobek.com?part=3D2
