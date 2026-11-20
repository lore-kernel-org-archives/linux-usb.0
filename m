Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203663;
	b=WtyFR/x+eaPe3StVbCHEBye9rsZn4InlGPlRg7T1iOTd4CpjKiU5uGPsy+gUryAvPxSV
	 6bulD6Jcdk2Nk47nuoshgfyF+2dveqvSgvGCDvzqlxxcELTHCmft3rM0sELC3Gktm5xDS
	 8Hi1Z54jvsxB+Qq7JfOjgqYX2NKZecykcW8usZMvwPRkqTegneKtz7Pvb34GifUQ69loD
	 DLT3bfdmiJlB3tXdAS+bngK+zZ1GEikc5jqmlugiVgrRdQHnmqRMXp5/G6Dxq8rcz/D6E
	 GivfrOtYtp0Y7RWu3q/4mphrV82GzRldVjjdzvo4+e31sRz8Y76YDjf1yBZsiFl1qIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203663;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NMOdEzBrH0u2TTI5nfJV2ZDBnC7oHY3+e7rlPlJxIu4=;
	b=jLAlaXeS10DPZ2xF6H2pEcbeJBlZRpF8hFjG1CbtIeyauX+YskiBwks4A0wsHU7q2OlV
	 svCfq/Iv93klPL1mcrcCi8bUz6lsIu4nUdkx//+ACvlvarg7cxfa6cOnoyqE8KWBzN3ul
	 D+mqwI1Yn/XW3DlEvdFnmIx0agx/Ipan03ptSWZ3kaZeYdPIIir+Dy+m95BagaXakyrfe
	 B1jBRIQTJ20aVzxsgCFtbsaayN8BQRihPSCHcO7r0cKspYGK8L5nQ4yfZyx7leemmJ+wp
	 RhyKI+uuOjH56Wrfut2GpIl142aNYF/OvUeZKD3iMXfAWArc/ZQQZCld1XvkN/svteg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k5ybSVno;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37805606A6F2
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 19:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k5ybSVno
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DF91F000C4;
	Fri, 20 Nov 2026 19:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795203662;
	bh=NMOdEzBrH0u2TTI5nfJV2ZDBnC7oHY3+e7rlPlJxIu4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k5ybSVnotfnoH/V/kwhbgvMuEN1FQ//9ZhlDbnuvZHRWKrioITbLK+XX4YuUGkMt9
	 jOSyFUPquh+hLzzPXPDWHBj3qNFzSuTED8on93jeTNJlNoKgmEru9qqMFxLPhlrMnN
	 2nWhYNB4++NX9apeoQqKOPV/18ymGsEa5fbOXS0XrzFaMNBSV9TBNQ0rv3hU/hoKCb
	 iD0oMi9rREMuB7NBRziDXcV4FPu8ia01mqz8SM48krw7dUBXGguczuUQp2KYTsoOc9
	 bol2MyYsFY05PH6AcmK3Wfdf/e5OSiVJGM7Myq9OOCtcPyCfzaibtmf7qV8KNyGENO
	 UHDBNjLcjtHCw==
Message-ID: <sashiko-outbox-225943@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH usb v4] usb: typec: tcpm: exempt Soft Reset from the
 SOP' MessageID duplicate check
Reply-To: sashiko-reviews@lists.linux.dev
To: memoriaru@foxmail.com
Cc: linux-usb@vger.kernel.org
In-Reply-To: <tencent_D1222948818CA62395FED66DB7F2967B1809@qq.com>
References: <tencent_443620EAE95525A375BB2D8A653406630A07@qq.com>
 <awBIRnc9lBkdVhEK@black.igk.intel.com>
 <1795204200.cover.tcpm-v4@foxmail.com>
 <tencent_D1222948818CA62395FED66DB7F2967B1809@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 19:41:01 +0000
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
- [Medium] usb: typec: tcpm: SOP' PD_CTRL_SOFT_RESET still resets SOP in
  SOFT_RESET
--

commit 64dabb00274a597dc73a5939c6dcd78aa8aea76c
Author: Zhang Hewei <memoriaru@foxmail.com>

usb: typec: tcpm: exempt Soft Reset from the SOP' MessageID duplicate check

This commit exempts PD_CTRL_SOFT_RESET from the MessageID duplicate check
on the SOP' receive path in tcpm_pd_rx_handler().

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index bf7fd632d815e..6a657dbf4e7ae 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4206,7 +4206,8 @@ static void tcpm_pd_rx_handler(struct kthread_work =
*work)
>  		 */
>  		switch (rx_sop_type) {
>  		case TCPC_TX_SOP_PRIME:
> -			if (msgid =3D=3D port->rx_msgid_prime)
> +			if (msgid =3D=3D port->rx_msgid_prime &&
> +			    type !=3D PD_CTRL_SOFT_RESET)
>  				goto done;
>  			port->rx_msgid_prime =3D msgid;
>  			break;

[Severity: Medium]
Does an incoming SOP' PD_CTRL_SOFT_RESET still reset the SOP channel
instead of SOP'?

When a cable sends PD_CTRL_SOFT_RESET on TCPC_TX_SOP_PRIME,
tcpm_pd_rx_handler() sets port->rx_msgid_prime =3D 0 and calls
tcpm_pd_ctrl_request(port, msg, TCPC_TX_SOP_PRIME), which ignores
rx_sop_type and enters SOFT_RESET:

drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_ctrl_request() {
	...
	case PD_CTRL_SOFT_RESET:
		port->ams =3D SOFT_RESET_AMS;
		tcpm_set_state(port, SOFT_RESET, 0);
		break;
	...
}

drivers/usb/typec/tcpm/tcpm.c:run_state_machine() {
	...
	case SOFT_RESET:
		port->message_id =3D 0;
		port->rx_msgid =3D -1;
		/* remove existing capabilities */
		tcpm_partner_source_caps_reset(port);
		tcpm_pd_send_control(port, PD_CTRL_ACCEPT, TCPC_TX_SOP);
		port->vdm_sm_running =3D false;
		port->explicit_contract =3D false;
		tcpm_ams_finish(port);
		if (port->pwr_role =3D=3D TYPEC_SOURCE) {
			port->upcoming_state =3D SRC_SEND_CAPABILITIES;
			tcpm_ams_start(port, POWER_NEGOTIATION);
		} else {
			tcpm_set_state(port, SNK_WAIT_CAPABILITIES, 0);
		}
		break;
	...
}

Because SOFT_RESET only resets the SOP state, port->message_id_prime is
not zeroed, port->rx_msgid_prime stays at 0 (so the cable's next SOP'
message with MessageID 0 is dropped as a duplicate), PD_CTRL_ACCEPT is
sent on TCPC_TX_SOP to the port partner instead of the cable, and the SOP
power contract is torn down.

The commit message also notes that "the PD message duplicate-check and
the SOFT_RESET state handling treat the SOP and SOP' channels
differently", so it looks like the tcpm_pd_ctrl_request() and SOFT_RESET
changes were omitted from the patch.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_D1222948818=
CA62395FED66DB7F2967B1809@qq.com?part=3D1
