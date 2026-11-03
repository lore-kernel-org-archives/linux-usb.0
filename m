Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716521;
	b=M1C4PYxWSxrpl3nFM6S2dQXyGqX4+47siEZArah6MEnhsBgiGOmASpELtFA5plUW7ZVx
	 otFzBlVmWiuTdAvvD9SrOJRPR95NAQmMY46NWqKKHGX2IydHnAHRm1l3WRaWhVuWKIwUI
	 sB9EFRkXqjkxM142oY14kICs6d0yLokFixzyMIVi0rZZ0JeWYc7C8mY6g8u0c7F2Bw5Xi
	 R1BiwgX2kGFHMX1K7Rjz+TOwArmKwwjPvzdGArjxBaOkpFUuSYIqDqbBejEGS0+4uUtw7
	 2Fi0F6y2+IrJ1gCkCqcx9CcwEfpTOTVWw5uoVjks8AutGACychb3rV0TqJarsOVdsdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716521;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JUCwd//FmrYIyWVKE8rnl37bcrsYgZt5lQx6QxyFuDc=;
	b=t86n+6veImwa7FWyc9hx4smCl+7HGY8WFXeXKrb/NRD7MlMr0ViSwSbeV5FnLMdUa7j8
	 87o7FHYtY0S4NUMrCIjX0TFk1znpXm9u3eT7UlmDprtS1b0EIBycn/2m82ijXR7TpEIfT
	 X17Xddmc8nyYAgkHHp6Sr4z2D3+tdMuC0VYugjR/8Yje5tkqF/JeiVeuvo8A47enjO7rY
	 f9JA8BPqb8rxKsq+FbuhsopL2XJ4f519HbLqlzGKN8Xr4h+qoiktX83ABvkgIoJbhLLxZ
	 b2YzdvoBIGhvsu1EpoCHCxiusYkf5EuW3aO7K4sO+ZHxMTTkNorUnrtZc71dJ2mZt3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCPPfE5I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7779606A324;
	Tue,  3 Nov 2026 14:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCPPfE5I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EA91F000C1;
	Tue,  3 Nov 2026 14:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793716520;
	bh=JUCwd//FmrYIyWVKE8rnl37bcrsYgZt5lQx6QxyFuDc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MCPPfE5IQUsUCSSpr/kws0u6Rc13Fd4yc1ZJkGISyjSXGE86OkdCGuMmVzmdFKhsL
	 kLGvXsv1YWtb6IlqgVmfn9/MBKoMiBRv/OmWF+RzFKOd8Ao/Lrb3MqQ2LE9SaXUxM0
	 bSEOWAW+XnoLJhCJMlDcjPxcTqT0xom7U1KVa3snkxAyD3mUa7R43cIJcJKvaRujfc
	 j1E117HcnIjSRzgZfazyU5hCl5ZVNfO18pD59pl+9QVReUy+/upMnkeiFW7KMgEUDj
	 74LfOJ/8JXcEDWiY5ejDW9CaF8QDUZlqe8WEDJ9CzOZeEI1WfGGKV/P+UIsvRPrjNb
	 KZZ+zx1EWcKnA==
Message-ID: <sashiko-outbox-195459@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] usb: dwc3: qcom: Use the UTMI clock as PIPE
 clock in DisplayPort-only modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joonhoe Kim" <26rote@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103135057.1682-3-26rote@gmail.com>
References: <20261103135057.1682-1-26rote@gmail.com>
 <20261103135057.1682-3-26rote@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:35:19 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: dwc3: qcom: broken Type-C state handling in dwc3_qcom_mux_set=
()
- [High] usb: dwc3: qcom: PM races and lost clock switches with dwc3_qcom_m=
ux_set()
--

commit 8f6090d15a3eafa1d84e143a83d04937bda97612
Author: Joonhoe Kim <26rote@gmail.com>

usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only modes

This commit registers the Qualcomm DWC3 glue driver as a Type-C mode switch
when the mode-switch property is present. It switches the controller to use
the UTMI clock in place of the PIPE clock during 4-lane DisplayPort-only
modes (pin assignments C and E) so that USB 2.0 continues to work when the
QMP combo PHY powers down its USB PCS.

> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56b..71b0402f0ae66 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
[ ... ]
> @@ -419,21 +429,72 @@ static irqreturn_t qcom_dwc3_resume_irq(int irq, vo=
id *data)
>  	return IRQ_HANDLED;
>  }
> =20
> -static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
> +static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom, bool utmi)
>  {
> -	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
>  	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
>  			  PIPE_UTMI_CLK_DIS);
> =20
>  	usleep_range(100, 1000);
> =20
> -	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
> -			  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
> +	if (utmi)
> +		dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
> +				  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
> +	else
> +		dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
> +				  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
> =20
>  	usleep_range(100, 1000);
> =20
>  	dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
>  			  PIPE_UTMI_CLK_DIS);
> +
> +	qcom->utmi_pipe_clk =3D utmi;
> +}
> +
> +static int dwc3_qcom_mux_set(struct typec_mux_dev *mux,
> +			     struct typec_mux_state *state)
> +{
> +	struct dwc3_qcom *qcom =3D typec_mux_get_drvdata(mux);
> +
> +	guard(mutex)(&qcom->pipe_clk_lock);
> +
> +	if (state->alt && state->alt->svid =3D=3D USB_TYPEC_DP_SID) {
> +		if (!qcom->dp_active)
> +			qcom->dp_only =3D state->mode =3D=3D TYPEC_DP_STATE_C ||
> +					state->mode =3D=3D TYPEC_DP_STATE_E;
> +		qcom->dp_active =3D true;
> +	} else if (state->mode =3D=3D TYPEC_STATE_SAFE) {
> +		qcom->dp_active =3D false;
> +	} else if (!qcom->dp_active) {
> +		qcom->dp_only =3D false;
> +	}

[Severity: High]
When the Type-C DisplayPort altmode driver transitions through the safe
state or exits altmode, typec_altmode_set_mux() in drivers/usb/typec/bus.c
populates state.alt with the DP altmode device (where state.alt->svid is
USB_TYPEC_DP_SID):

drivers/usb/typec/bus.c:typec_altmode_set_mux()
	state.alt =3D &alt->adev;
	state.mode =3D conf;
	state.data =3D data;

	return typec_mux_set(alt->mux, &state);

Before configuring pin assignment C or E, typec_altmode_enter() and
dp_altmode_configure_vdm() in drivers/usb/typec/altmodes/displayport.c
first place the connector into TYPEC_STATE_SAFE via typec_altmode_notify().
Because dwc3_qcom_mux_set() checks state->alt && state->alt->svid =3D=3D
USB_TYPEC_DP_SID before checking state->mode =3D=3D TYPEC_STATE_SAFE, that
initial TYPEC_STATE_SAFE notification enters the first branch, sets
qcom->dp_only =3D false, and sets qcom->dp_active =3D true. When
dp_altmode_configured() then notifies TYPEC_DP_STATE_C or TYPEC_DP_STATE_E,
qcom->dp_active is already true, so qcom->dp_only is not updated and
dwc3_qcom_select_utmi_clk() is never called.

Similarly, on disconnect or mode exit, typec_altmode_exit(), typec_remove(),
and dp_altmode_notify() pass state->alt->svid =3D=3D USB_TYPEC_DP_SID with
TYPEC_STATE_SAFE or TYPEC_STATE_USB, which also hit the first branch and
leave qcom->dp_active and qcom->dp_only stuck.

In addition, qmp_combo_typec_mux_set() in
drivers/phy/qualcomm/phy-qcom-qmp-combo.c only delays a PHY mode switch
when qmp->dp_powered_on is true:

	if (qmp->qmpphy_mode !=3D QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
		dev_dbg(qmp->dev, "typec_mux_set: DP PHY is still in use, delaying switch=
\n");
		return 0;
	}

If a port driver such as pmic_glink_altmode enters TYPEC_DP_STATE_D while
qmp->dp_powered_on is false and then reconfigures to TYPEC_DP_STATE_C or
TYPEC_DP_STATE_E without an intervening TYPEC_STATE_SAFE, the PHY switches
to QMPPHY_MODE_DP_ONLY while dwc3_qcom_mux_set() skips updating
qcom->dp_only because qcom->dp_active is already true.

Should state->mode =3D=3D TYPEC_STATE_SAFE and TYPEC_STATE_USB be checked
before inspecting state->alt, and can gating qcom->dp_only on
!qcom->dp_active miss valid transitions to DP-only mode?

> +
> +	if (qcom->ignore_pipe_clk || qcom->pm_suspended ||
> +	    qcom->dp_only =3D=3D qcom->utmi_pipe_clk ||
> +	    pm_runtime_resume_and_get(qcom->dev))
> +		return 0;
> +
> +	dwc3_qcom_select_utmi_clk(qcom, qcom->dp_only);
> +	pm_runtime_put_autosuspend(qcom->dev);
> +
> +	return 0;
> +}
[ ... ]
> @@ -756,6 +825,8 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
>  	if (ret)
>  		return ret;
> =20
> +	guard(mutex)(&qcom->pipe_clk_lock);
> +
>  	ret =3D dwc3_qcom_suspend(qcom, wakeup);
>  	if (ret)
>  		return ret;
> @@ -772,11 +843,17 @@ static int dwc3_qcom_pm_resume(struct device *dev)
>  	bool wakeup =3D device_may_wakeup(dev);
>  	int ret;
> =20
> -	ret =3D dwc3_qcom_resume(qcom, wakeup);
> -	if (ret)
> -		return ret;
> +	scoped_guard(mutex, &qcom->pipe_clk_lock) {
> +		ret =3D dwc3_qcom_resume(qcom, wakeup);
> +		if (ret)
> +			return ret;
> =20
> -	qcom->pm_suspended =3D false;
> +		if (!qcom->ignore_pipe_clk &&
> +		    qcom->dp_only !=3D qcom->utmi_pipe_clk)
> +			dwc3_qcom_select_utmi_clk(qcom, qcom->dp_only);
> +
> +		qcom->pm_suspended =3D false;
> +	}
> =20
>  	ret =3D dwc3_pm_resume(&qcom->dwc);
>  	if (ret)

[Severity: High]
How does the synchronization between dwc3_qcom_mux_set(), system sleep, and
runtime PM handle the following cases?

1. In dwc3_qcom_pm_resume(), qcom->pm_suspended is cleared and
qcom->pipe_clk_lock is released before dwc3_pm_resume(&qcom->dwc) runs:

drivers/usb/dwc3/core.c:dwc3_pm_resume()
	pm_runtime_disable(dev);
	ret =3D pm_runtime_set_active(dev);
	if (ret)
		goto out;

	ret =3D dwc3_resume_common(dwc, PMSG_RESUME);

If dwc3_qcom_mux_set() runs on a workqueue right after pipe_clk_lock is
released:
- Before pm_runtime_disable(dev), if the device was runtime-suspended prior
  to system sleep, pm_runtime_resume_and_get(qcom->dev) can trigger
  dwc3_qcom_runtime_resume() -> dwc3_runtime_resume(&qcom->dwc)
  concurrently with dwc3_pm_resume(&qcom->dwc).
- Between pm_runtime_disable(dev) and pm_runtime_enable(dev), if last_status
  was RPM_SUSPENDED, pm_runtime_resume_and_get(qcom->dev) returns -EACCES
  and dwc3_qcom_mux_set() returns 0 after dwc3_qcom_pm_resume() has already
  checked qcom->dp_only !=3D qcom->utmi_pipe_clk, losing the clock switch.
- If the device was runtime-active, pm_runtime_resume_and_get(qcom->dev)
  succeeds and dwc3_qcom_select_utmi_clk() gates PIPE_UTMI_CLK_DIS while
  dwc3_resume_common() is resetting and reinitializing the DWC3 core.

2. In dwc3_qcom_pm_suspend(), dwc3_pm_suspend(&qcom->dwc) runs before
acquiring qcom->pipe_clk_lock and setting qcom->pm_suspended =3D true. If t=
he
device was runtime-suspended, a concurrent dwc3_qcom_mux_set() call can
invoke pm_runtime_resume_and_get(qcom->dev) -> dwc3_qcom_runtime_resume()
after dwc3_pm_suspend() has completed, and dwc3_qcom_suspend() will then
disable qcom->clks while the DWC3 core and PHYs are active.

3. When the device is runtime-suspended in device role without wakeup,
dwc3_qcom_prepare() -> dwc3_pm_prepare() returns 1, enabling the PM core
direct_complete path, which disables runtime PM and skips both
dwc3_qcom_pm_suspend() and dwc3_qcom_pm_resume(). If dwc3_qcom_mux_set() is
called during system sleep under direct_complete, qcom->pm_suspended is
false and pm_runtime_resume_and_get(qcom->dev) fails with -EACCES. Because
dwc3_qcom_runtime_resume() does not check qcom->dp_only !=3D
qcom->utmi_pipe_clk, the pending clock switch is never applied on a
subsequent runtime resume.

4. When the controller is runtime-suspended and dwc3_qcom_mux_set() calls
pm_runtime_resume_and_get(qcom->dev), dwc3_qcom_runtime_resume() calls
dwc3_runtime_resume(&qcom->dwc) before dwc3_qcom_mux_set() switches the
clock via dwc3_qcom_select_utmi_clk().

Could the clock selection check be performed inside dwc3_qcom_resume() (so
both system resume and runtime resume apply any pending change before the
core resumes), with qcom->pipe_clk_lock and qcom->pm_suspended covering the
full suspend and resume sequences?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103135057.1682=
-1-26rote@gmail.com?part=3D2
