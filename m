Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657760;
	b=Ac2xIVRPac4UUUZvgGFYW16rjkQvSBgkRNTgbyh3BRlKVkPlzGzOwOpbi/sYhL7Kksnp
	 dQ9I7sT81/fhP38o7QdjezAp3adRJzTWyR47SKpjmkFhvMZErdbX540v8qXeV7jdQXAhn
	 SJD9Lf6PVzQksARZ9dejgKz88xDMWFGAzkahHSrnCA5mjFHtKKnW/QsEaHUOS2TPyTSjW
	 7GPEv5uAxiC3HZsfHyO5NRSownbSVvXxoAOhOaGkHc3aqA8LP4jMFphQSpU+Yyras0Am6
	 5dNdvMz7h0QuWKhAQpgrCwQdHaj2O8BlypnvB2ymjbvHKjh8JyOxl2QPQJV98Key0vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657760;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iRyLUBr8NVx1KDuvuKooSHBw1nW6USVzSyiEOCGKzWA=;
	b=lZBadtKFTDhAP+l4b9pE4WIZD5Yv3kfl0KWvf5cXj0A4NE+yRbfExJ6/oP/XzcGz9fXw
	 WiVYqV75yV1BPvh7MVnpa6G9LTzFS0twEvLPP+lM4WL+if332zrqgEt1z+n2p4K8r1qIw
	 Dzn8tV3vYeAFG30y5G3vhBGF7ZiwqW89CDVDAqWeSgBeH86r0YJyVN6/PYd+ISulvg9CR
	 3b0ophNIi7ejmgUOoDToDS1Vlkmcxeuzoi59I6yLOZXqVtGVUgJG0jkLWQVTgEPnn6jta
	 ulrgW/MVj+rq0U1LGNJ7fNp1nMgH31vMWeiEmnLHBxRzR9g+LPSQjQaeWGWFm7cF/+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RBn2OzZs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23437606A329;
	Mon,  2 Nov 2026 22:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RBn2OzZs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C1A1F00A16;
	Mon,  2 Nov 2026 22:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793657759;
	bh=iRyLUBr8NVx1KDuvuKooSHBw1nW6USVzSyiEOCGKzWA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RBn2OzZsV+w0LG3kTHnrkMvYB/dnhEhc56sdJPaRfQLt1U7qE0dUF5VsTpeCVSInd
	 MchPmdyRP8gWADNV1sHrUUvfHu7lTW5o+XMyC6fdrf4NwRSLth95BCsj1dbGgptHB/
	 mEEc8PQldE2vWufXRcAWjPFrxvN2dZhGLzeW4Wx2Sa1Yj2g86pUIyuER4Z1Pht17cb
	 JN5jGtDCKFh5PUuNQWT3u5YabnGIMvrzPNaEWAcczhzBPDYnVfwQ6Q12ggYxepLqez
	 02o7BVNtNU38iPc7exLhi2Bm4yXZqIPl29UEiTwqYJ3KHTWcGjAO+QhEZepQlbe9QR
	 CDkqUOc1zGJAA==
Message-ID: <sashiko-outbox-194270@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: kaanapali: Mark the USB
 controller as a Type-C mode switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joonhoe Kim" <26rote@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102215121.738-4-26rote@gmail.com>
References: <20261102215121.738-1-26rote@gmail.com>
 <20261102215121.738-4-26rote@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 22:15:59 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] usb: dwc3: qcom: link and probe failures in dwc3_qcom_mux_register=
()
- [High] usb: dwc3: qcom: failure to restore PIPE clock in dwc3_qcom_mux_se=
t()
- [Medium] arm64: dts: qcom: kaanapali: missing mode-switch on usb_dp_qmpph=
y node
--

commit 925e748782df0ec0b3e6681dff9bc8da6c1e0380
Author: Joonhoe Kim <26rote@gmail.com>

arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch

This commit adds the mode-switch property to the Kaanapali USB controller
node so that it switches to the UTMI clock when DisplayPort pin assignments
C and E stop the USB3 PIPE clock.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index e48a179d07220..a06d5d8674885 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -3941,6 +3941,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			tx-fifo-resize;
>  			dma-coherent;
> =20
> +			mode-switch;

[Severity: High]
Does adding mode-switch here expose build and probe regressions in
drivers/usb/dwc3/dwc3-qcom.c depending on CONFIG_TYPEC?

When mode-switch is present on the usb node, dwc3_qcom_probe() calls
dwc3_qcom_mux_register(), which invokes typec_mux_register():

drivers/usb/dwc3/dwc3-qcom.c:dwc3_qcom_mux_register() {
	if (!device_property_present(qcom->dev, "mode-switch"))
		return 0;
	...
	qcom->mux =3D typec_mux_register(qcom->dev, &desc);

	return PTR_ERR_OR_ZERO(qcom->mux);
}

drivers/usb/dwc3/dwc3-qcom.c:dwc3_qcom_probe() {
	...
	ret =3D dwc3_qcom_mux_register(qcom);
	if (ret)
		goto interconnect_exit;
}

In drivers/usb/dwc3/Kconfig, USB_DWC3_QCOM does not have a dependency on
TYPEC || !TYPEC (unlike PHY_QCOM_QMP_COMBO in drivers/phy/qualcomm/Kconfig).
With the default arm64 defconfig (CONFIG_USB_DWC3_QCOM=3Dy and CONFIG_TYPEC=
=3Dm),
built-in dwc3-qcom.o references typec_mux_register(), typec_mux_unregister(=
),
and typec_mux_get_drvdata() from the loadable module typec.ko, causing a
vmlinux link failure.

Furthermore, when CONFIG_TYPEC=3Dn, the stub in include/linux/usb/typec_mux=
.h
returns ERR_PTR(-EOPNOTSUPP):

include/linux/usb/typec_mux.h:typec_mux_register() {
	return ERR_PTR(-EOPNOTSUPP);
}

Because dwc3_qcom_mux_register() propagates that error directly, won't
dwc3_qcom_probe() abort and disable USB on Kaanapali whenever CONFIG_TYPEC =
is
disabled?

[Severity: High]
Can enabling the mode switch on Kaanapali leave the controller stuck on the
19.2 MHz UTMI clock after exiting DisplayPort-only mode (Pin Assignment C or
E), breaking SuperSpeed USB 3.0?

In drivers/usb/dwc3/dwc3-qcom.c, dwc3_qcom_mux_set() updates qcom->dp_active
and qcom->dp_only, and then returns early without calling
dwc3_qcom_update_pipe_clk() whenever qcom->dp_only is false:

drivers/usb/dwc3/dwc3-qcom.c:dwc3_qcom_mux_set() {
	if (state->alt && state->alt->svid =3D=3D USB_TYPEC_DP_SID) {
		qcom->dp_active =3D true;
		qcom->dp_only =3D state->mode =3D=3D TYPEC_DP_STATE_C ||
				state->mode =3D=3D TYPEC_DP_STATE_E;
	} else if (state->mode =3D=3D TYPEC_STATE_SAFE) {
		qcom->dp_active =3D false;
	} else if (!qcom->dp_active) {
		qcom->dp_only =3D false;
	}

	/* The PHY stops the PIPE clock right after this in DP-only mode */
	if (!qcom->dp_only || pm_runtime_resume_and_get(qcom->dev))
		return 0;

	mutex_lock(&qcom->pipe_clk_lock);
	dwc3_qcom_update_pipe_clk(qcom);
	mutex_unlock(&qcom->pipe_clk_lock);
	...
}

Because dwc3_qcom_mux_set() never calls dwc3_qcom_update_pipe_clk() when
qcom->dp_only becomes false, clearing PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW
in QSCRATCH_GENERAL_CFG relies entirely on a subsequent call to
dwc3_qcom_set_role_notifier() where next_role !=3D qcom->current_role while
qcom->dp_only is already false:

drivers/usb/dwc3/dwc3-qcom.c:dwc3_qcom_set_role_notifier() {
	...
	if (qcom->current_role =3D=3D next_role)
		return;
	...
	mutex_lock(&qcom->pipe_clk_lock);
	dwc3_qcom_update_pipe_clk(qcom);
	mutex_unlock(&qcom->pipe_clk_lock);
}

Doesn't this leave qcom->utmi_pipe_clk stuck at true in several cases:

1. If a connected partner switches pin assignment in place from 4-lane DP
(TYPEC_DP_STATE_C or TYPEC_DP_STATE_E) to 2-lane DP + USB3 (TYPEC_DP_STATE_D
or TYPEC_DP_STATE_F) without changing the USB data role, dwc3_qcom_mux_set()
sets qcom->dp_only =3D false and returns early, while
dwc3_qcom_set_role_notifier() either does not run or returns early because
qcom->current_role =3D=3D next_role.

2. In drivers/soc/qcom/pmic_glink_altmode.c, pmic_glink_altmode_worker() can
transition directly to MUX_CTRL_STATE_USB3_ONLY (TYPEC_STATE_USB) or
MUX_CTRL_STATE_TUNNELING (TYPEC_MODE_USB4) without sending TYPEC_STATE_SAFE
first. Since qcom->dp_active is only cleared on TYPEC_STATE_SAFE, the
else if (!qcom->dp_active) branch is not taken and both qcom->dp_active and
qcom->dp_only remain true.

3. After unplugging a DP-only partner (which sends TYPEC_STATE_SAFE and sets
qcom->dp_active =3D false while leaving qcom->dp_only =3D true), on the next
plug-in of a USB 3.0 device, if the UCSI role notification arrives before t=
he
altmode mux notification (or if ucsi_partner_change() in
drivers/usb/typec/ucsi/ucsi.c skips typec_set_mode(con->port, TYPEC_STATE_U=
SB)
when UCSI_CONSTAT_PARTNER_FLAG_USB is not yet set),
dwc3_qcom_set_role_notifier() runs while qcom->dp_only is still true and
updates qcom->current_role =3D next_role. When dwc3_qcom_mux_set() subseque=
ntly
clears qcom->dp_only =3D false, it returns early without updating the clock=
, and
any later role notification for the same role is ignored.

[Severity: Medium]
The commit message notes that this change is needed when the USB3-DP combo =
PHY
is a mode switch. However, in arch/arm64/boot/dts/qcom/kaanapali.dtsi, the
companion usb_dp_qmpphy node only has orientation-switch and does not have
mode-switch (unlike sm8750.dtsi and eliza.dtsi):

arch/arm64/boot/dts/qcom/kaanapali.dtsi:usb_dp_qmpphy {
	...
	#clock-cells =3D <1>;
	#phy-cells =3D <1>;

	orientation-switch;

	status =3D "disabled";
}

Without mode-switch on usb_dp_qmpphy, fwnode_typec_mux_get() in
drivers/usb/typec/mux.c will not match the combo PHY, so the USB controller
will switch to the UTMI clock on DisplayPort pin assignments C and E while
usb_dp_qmpphy is never notified of the mode change. Should usb_dp_qmpphy al=
so
have mode-switch here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102215121.738-=
1-26rote@gmail.com?part=3D3
