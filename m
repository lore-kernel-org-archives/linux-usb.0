Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657325;
	b=4hV5lAay6zf2nLUP7fOmI+uwoVghsVLNasjygiG8/xpWs6ga1ZqEcvv/ujOwlR/8SSt8
	 pdWLMrzbPi0BYIXXhM63R35uVEld4iVo0ITdajuh+2RMSQ2BgFNlrRqg4EOjxTklvxOeQ
	 re9TFYSKjlI1+56LZrJpbxS/qB5W7RWWnc4tgz1/8m1aDslheFIQHAUSgeZ4XkoTgAn36
	 zuBzUyxPx5rZxFfMTuD2MAmDVn2AZre6a8subO3iiGskIfrGOv5bv8Lr9Adkx0elYw5X+
	 a4EaEC5bv4BF/Pb24v9qSpxCtuNA3lCxAGi3ZvJVul3QYCwpA+m7uGn0sJXI9mYpVkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657325;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+lLCtUsI7pq5yPw0lI70X6FupAlg7rZjQclvzMRYOzs=;
	b=EbzKHtkrS6VTq0nle72qGmL5VPwUi/QihUVAqzf306tI9pmwn1V9s9d+/LtbkdBas4fJ
	 w8X7JJFdsqIEnBV8+J5Xy3IZ6DaMl843FE7ZAsJJvdEWJw7GLi2jsDgjMYYI1VjTW7KRd
	 dZAc6qYR+L/G6Thtk1wNG3pPSBDBP7XZzgQ6Jd0gtiRXlhtqkrcdSuMdGXAwD5G98YzM4
	 bmVukDaDnh3+OXMcl5krNLY2NquCGIKBuz+newBvMOcnMrV2A1oxBj5NzDyoyRZoutwKi
	 TuyYxxGRhNDjyPbyCI+ina9JjCVdMVRXvV5tCEMN7hpdRsCPZ28H8xTwVtgEdiUm0Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lkxTIRaN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A4F606A324;
	Mon,  2 Nov 2026 22:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lkxTIRaN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CB31F00A16;
	Mon,  2 Nov 2026 22:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793657324;
	bh=+lLCtUsI7pq5yPw0lI70X6FupAlg7rZjQclvzMRYOzs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lkxTIRaNB+W7lvO/DAacmTThD1CekzPHQ0Gn8Reev2fBGleP0Eo6S7g3cuJAz7CCi
	 m0c3EW5VrZdZIUfcGUwUozcM52E86IPT41UXuq7hnwTu2Uk9tPXSECyNr7k8ahmNaw
	 8CMuWwlWo5Ifn070s8IscTYkdZD1Of5/eK1WMINLMuZqOJBB/eLXRJb+5rcpu/i9LA
	 Pon8EynbihFZUZg6jV4QAiZ/k6LBeiWohVIpioRfaqYAMT4iX9oP+uOVu1/aCq6MuW
	 PSNhjh99kzQ//EeCmkFTDOB2tgJUO0jp5SosDHnYYPpM2+uzUrNSU/2UpYom8aKKqG
	 kaPnV2HsCJx+Q==
Message-ID: <sashiko-outbox-194253@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] usb: dwc3: qcom: Use the UTMI clock as PIPE clock
 in DisplayPort-only modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joonhoe Kim" <26rote@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102215121.738-3-26rote@gmail.com>
References: <20261102215121.738-1-26rote@gmail.com>
 <20261102215121.738-3-26rote@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 22:08:43 +0000
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
- [High] usb: dwc3: qcom: missing CONFIG_TYPEC handling in dwc3_qcom_mux_re=
gister()
- [High] usb: dwc3: qcom: UTMI clock stuck after DP-only exit in dwc3_qcom_=
mux_set()
--

commit 248cd44664911cc499b2fd0be17d977befe94173
Author: Joonhoe Kim <26rote@gmail.com>

usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only modes

This commit registers dwc3-qcom as a Type-C mode switch when the
"mode-switch" property is present and selects the UTMI clock as the PIPE
clock during DisplayPort-only pin assignments (C and E). It defers
switching back to the PHY PIPE clock until a role change notification
occurs after leaving the safe state.

> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56b..4919deae682d9 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
[ ... ]
> @@ -419,21 +429,77 @@ static irqreturn_t qcom_dwc3_resume_irq(int irq, vo=
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
> +static void dwc3_qcom_update_pipe_clk(struct dwc3_qcom *qcom)
> +{
> +	if (qcom->ignore_pipe_clk || qcom->dp_only =3D=3D qcom->utmi_pipe_clk)
> +		return;
> +
> +	dwc3_qcom_select_utmi_clk(qcom, qcom->dp_only);
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
> +		qcom->dp_active =3D true;
> +		qcom->dp_only =3D state->mode =3D=3D TYPEC_DP_STATE_C ||
> +				state->mode =3D=3D TYPEC_DP_STATE_E;
> +	} else if (state->mode =3D=3D TYPEC_STATE_SAFE) {
> +		qcom->dp_active =3D false;
> +	} else if (!qcom->dp_active) {
> +		qcom->dp_only =3D false;
> +	}
> +
> +	/* The PHY stops the PIPE clock right after this in DP-only mode */
> +	if (!qcom->dp_only || pm_runtime_resume_and_get(qcom->dev))
> +		return 0;
> +
> +	dwc3_qcom_update_pipe_clk(qcom);
> +	pm_runtime_put_autosuspend(qcom->dev);
> +
> +	return 0;
> +}

[Severity: High]
Can the controller get stuck on the UTMI clock after leaving a
DisplayPort-only mode?

In dwc3_qcom_mux_set(), when qcom->dp_only transitions to false, the
function returns early at:

	if (!qcom->dp_only || pm_runtime_resume_and_get(qcom->dev))
		return 0;

Switching back to the PHY PIPE clock via dwc3_qcom_select_utmi_clk(qcom,
false) therefore relies entirely on a subsequent call to
dwc3_qcom_set_role_notifier() where next_role !=3D qcom->current_role.

However, as noted in the commit message, role and mux notifications arrive
from different services in no fixed order. After unplugging a 4-lane DP
monitor (where TYPEC_STATE_SAFE sets qcom->dp_active =3D false while leaving
qcom->dp_only =3D true and qcom->utmi_pipe_clk =3D true), plugging in a USB=
 3.x
device or 2-lane DP + USB 3.x dock can deliver the role change first:

1. dwc3_qcom_set_role_notifier(USB_ROLE_HOST) runs while qcom->dp_only is
   still true, so dwc3_qcom_update_pipe_clk() does nothing and
   qcom->current_role becomes USB_ROLE_HOST.
2. dwc3_qcom_mux_set() runs next and sets qcom->dp_only =3D false (for
   TYPEC_STATE_USB or TYPEC_DP_STATE_D), then returns early because
   !qcom->dp_only is true.
3. Any subsequent role notification for USB_ROLE_HOST returns early at
   if (qcom->current_role =3D=3D next_role) in dwc3_qcom_set_role_notifier(=
).

Similarly, if a dock reconfigures its DisplayPort pin assignment in-place
from 4-lane DP (TYPEC_DP_STATE_C or TYPEC_DP_STATE_E) to 2-lane DP + USB3
(TYPEC_DP_STATE_D or TYPEC_DP_STATE_F) without changing the USB role, or if
pmic_glink_altmode_sc8280xp_notify() coalesces MUX_CTRL_STATE_NO_CONN with
a subsequent USB3 state before its worker runs (leaving qcom->dp_active
true when TYPEC_STATE_USB arrives), qcom->utmi_pipe_clk will remain true
with PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW asserted in
QSCRATCH_GENERAL_CFG.

> +
> +static int dwc3_qcom_mux_register(struct dwc3_qcom *qcom)
> +{
> +	struct typec_mux_desc desc =3D {};
> +
> +	if (!device_property_present(qcom->dev, "mode-switch"))
> +		return 0;
> +
> +	desc.drvdata =3D qcom;
> +	desc.fwnode =3D dev_fwnode(qcom->dev);
> +	desc.set =3D dwc3_qcom_mux_set;
> +
> +	qcom->mux =3D typec_mux_register(qcom->dev, &desc);
> +
> +	return PTR_ERR_OR_ZERO(qcom->mux);
> +}

[Severity: High]
What happens here when CONFIG_USB_DWC3_QCOM=3Dy and CONFIG_TYPEC=3Dm, or wh=
en
CONFIG_TYPEC=3Dn?

In drivers/usb/dwc3/Kconfig, USB_DWC3_QCOM does not depend on
TYPEC || !TYPEC, so built-in dwc3-qcom.o will fail to link against
typec_mux_register(), typec_mux_unregister(), and typec_mux_get_drvdata()
when CONFIG_TYPEC=3Dm.

Additionally, when CONFIG_TYPEC=3Dn, the stub for typec_mux_register() in
include/linux/usb/typec_mux.h returns ERR_PTR(-EOPNOTSUPP):

static inline struct typec_mux_dev *
typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
{
	return ERR_PTR(-EOPNOTSUPP);
}

On a board with the "mode-switch" property in its device tree,
dwc3_qcom_mux_register() will return -EOPNOTSUPP to dwc3_qcom_probe() and
abort probing of the USB controller.

Should USB_DWC3_QCOM add a Kconfig dependency on TYPEC || !TYPEC (or
TYPEC || TYPEC=3Dn, like PHY_QCOM_QMP_COMBO) and guard the mux registration
when CONFIG_TYPEC is disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102215121.738-=
1-26rote@gmail.com?part=3D2
