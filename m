Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718314;
	b=Cl2sDBVGIB0UsTMKu97flEUIjZqDthxG4dwTmy33Ev/8T3SD3PZxkAISjqtNI3O16G1Y
	 xMw1tNUSmS9DAK1L5pYNw231ytsgg3hL1RypkqqWpl2eBd436VzexHLxIWZ2A77niFpCq
	 SXM3zP33tmHskCfkLKM9LbJGixvalHIdCRENPoBnRImzJON/svz79Twe7lXykXMBagzAA
	 Kr6k2+v3xFfjQmBOxBytL2FSAf/Yk29nV2WNkn3iUtFkx7YHfWmTeoUbR4wMkDppiHh2J
	 T6dHv8C+Cw8DG7CBWGEx+RSO3Thd9YKqkc2GSnJE8Yf0HSI5umaFMC8eZfU15JOarEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718314;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Hth1zOYqu4nC0RncTQP2jKNxjJEdw1iVk3pWXd/QbHs=;
	b=vgdn75EIqoAnEYW79gufx8VWMXC4NQhx8SQk4II2VBgQAukC6xryu4CrrJS6XtdO5a8J
	 c3mDiy+ZnS3pDYdkiehsAwuxFKY/1vxyZtyxucI9a8OOycvE/fUF1ERgZaGH1l3Q+Jh43
	 uX/6HGC3CiMSRp84U8+nffcDwRXxE7+pJjyq3Hvt5DrQ+27JzPWN0WwlkgMlU9dVNrnIB
	 Zw7QQGHAYJYSDUR8wPCi2CN1SsjmTOGTxKslL1McOh/dOoG8Pvfii6BTFQxv7rcXhwyR2
	 ZwUGkItMbBGmnp4ndXay2unetMSu+pixHWDc/gewmniEBBMg/pl/2GiqE34FGHkp/lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JeW6CWy0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B32606A333;
	Tue,  3 Nov 2026 15:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JeW6CWy0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD1B1F000C1;
	Tue,  3 Nov 2026 15:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718314;
	bh=Hth1zOYqu4nC0RncTQP2jKNxjJEdw1iVk3pWXd/QbHs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JeW6CWy0Vbpzj9DuHBa/l1GWsihQ06s9xSIr7PLVYOaqcEw1BjA1+3R+hOGG6YSa3
	 cCs30X4gv5CRv6P2nxNECzNx61lUDov7nytHaAJY1EUGzIFhthN6eSNbcyCFoMrOwG
	 Aswjivg0wZ7jCy9tChr7nFbkztPGwN7zOF1t6aIhax7aix4LULOrnCBLuzt1iw8Qb1
	 a+Ebf/P7tgzszkfSSLa4/rtHvZexLKfOUVUI+rxDtzoNNC4IKu1x86HYsSFh0CDEgz
	 OPMglniK7RVpbRsTAOuN8i7TY3tSKBglU07ZLjOM+chjuy0LpMjDHQDU/4t69c9pfp
	 XdUHfVu8I8quw==
Message-ID: <sashiko-outbox-195550@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kaanapali: Mark the USB
 controller as a Type-C mode switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joonhoe Kim" <26rote@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103135057.1682-4-26rote@gmail.com>
References: <20261103135057.1682-1-26rote@gmail.com>
 <20261103135057.1682-4-26rote@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 15:05:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: dwc3: qcom: race between dwc3_qcom_mux_set() and system sus=
pend/resume
--

commit fe7520845f2780f9c1a4d2eb56c40d6f95200b73
Author: Joonhoe Kim <26rote@gmail.com>

arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch

This commit marks the Kaanapali USB controller node with the mode-switch
property so that it switches to the UTMI clock when the USB3-DP combo PHY
enters DisplayPort-only mode and stops the USB3 PIPE clock.

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

[Severity: Medium]
Can enabling mode-switch on the Kaanapali USB controller trigger a race
between dwc3_qcom_mux_set() and system suspend/resume in
drivers/usb/dwc3/dwc3-qcom.c?

On Kaanapali boards (kaanapali-mtp.dts and kaanapali-qrd.dts),
qcom,kaanapali-pmic-glink instantiates UCSI on connector@0. In
ucsi_register_port(), UCSI creates a non-freezable singlethread workqueue
(con->wq) and acquires the USB controller mode switch via typec_mux_get().
If a connector change happens during system sleep transitions,
ucsi_handle_connector_change() runs on con->wq and invokes
typec_set_mode() -> typec_mux_set() -> dwc3_qcom_mux_set():

drivers/usb/dwc3/dwc3-qcom.c:dwc3_qcom_mux_set() {
	...
	if (qcom->ignore_pipe_clk || qcom->pm_suspended ||
	    qcom->dp_only =3D=3D qcom->utmi_pipe_clk ||
	    pm_runtime_resume_and_get(qcom->dev))
		return 0;

	dwc3_qcom_select_utmi_clk(qcom, qcom->dp_only);
	...
}

In dwc3_qcom_pm_suspend(), dwc3_pm_suspend(&qcom->dwc) runs before acquiring
qcom->pipe_clk_lock and setting qcom->pm_suspended =3D true, while runtime =
PM
is still enabled until device_suspend_late():

drivers/usb/dwc3/dwc3-qcom.c:dwc3_qcom_pm_suspend() {
	...
	ret =3D dwc3_pm_suspend(&qcom->dwc);
	if (ret)
		return ret;

	guard(mutex)(&qcom->pipe_clk_lock);

	ret =3D dwc3_qcom_suspend(qcom, wakeup);
	if (ret)
		return ret;

	qcom->pm_suspended =3D true;
	...
}

If qcom->dev was runtime-suspended and dwc3_qcom_mux_set() runs after
dwc3_pm_suspend() finishes but before pipe_clk_lock is acquired,
dwc3_qcom_mux_set() sees qcom->pm_suspended =3D=3D false and calls
pm_runtime_resume_and_get(qcom->dev). Wouldn't that run
dwc3_qcom_runtime_resume() -> dwc3_runtime_resume(&qcom->dwc) (reinitializi=
ng
the core and resuming the PHYs) right before dwc3_qcom_suspend() disables
the glue clocks and interconnects?

Similarly, in dwc3_qcom_pm_resume(), qcom->pm_suspended is cleared and
pipe_clk_lock is released before calling dwc3_pm_resume(&qcom->dwc):

drivers/usb/dwc3/dwc3-qcom.c:dwc3_qcom_pm_resume() {
	...
	scoped_guard(mutex, &qcom->pipe_clk_lock) {
		ret =3D dwc3_qcom_resume(qcom, wakeup);
		if (ret)
			return ret;

		if (!qcom->ignore_pipe_clk &&
		    qcom->dp_only !=3D qcom->utmi_pipe_clk)
			dwc3_qcom_select_utmi_clk(qcom, qcom->dp_only);

		qcom->pm_suspended =3D false;
	}

	ret =3D dwc3_pm_resume(&qcom->dwc);
	...
}

Inside dwc3_pm_resume(), pm_runtime_disable(dev) is held across
pm_runtime_set_active(dev) and dwc3_resume_common(). If qcom->dev was
runtime-suspended prior to system sleep, __pm_runtime_disable() records
dev->power.last_status =3D RPM_SUSPENDED, so rpm_resume() returns -EACCES w=
hile
runtime PM is disabled. If dwc3_qcom_mux_set() runs during that window, it
sees qcom->pm_suspended =3D=3D false, updates qcom->dp_only, and returns 0 =
when
pm_runtime_resume_and_get(qcom->dev) fails with -EACCES. Doesn't this skip
dwc3_qcom_select_utmi_clk() and leave qcom->utmi_pipe_clk out of sync with
qcom->dp_only?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103135057.1682=
-1-26rote@gmail.com?part=3D3
