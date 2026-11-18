Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989307;
	b=jwrBBBGGuNcdzUCeDpB6YUmNrNaCOLh0O6o/SsgUioUKS9fJ6muImUQmlzcgeX9bgXwO
	 P3jXpsF+xlndV2NdhLRkHPDyuoipndqYU5Y/oIHcyfgdmLtuMz9IKVim4DZRj+KE8sm5N
	 ytoturfLWjD++fZbyL0JxB9CJNVexdyHwJYDcF0vz0I1K4v6r3ApKzg/xalkI+kxmw8Lt
	 LHw31/wRdUKhhbkF0r+wIWCzvkNHvLo0XeZBrQ3EygJGDwGO+pRzmOMBd+tSF4bebiZxv
	 KAEC/hHlR9UIJMeyqCn9KqcqN2Z+3HvmjnOtP7z144xJuIlIfxs3x+GzgirnEAFfsZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989307;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+6SSKo6DIEKdzeKSnxARyTBsT8VD3sb3GeJYy9w40Cg=;
	b=4Jhi9Ko4pRhT1WznzIoJemSsdN1GTyQ7zKv8P4zW/z4lEbR5WXbExyxc9zbWYSD8sgLn
	 kskCtAZWniKFxt33rgnbUGuZw/hxMTYc5YRYfVUxe31qKt+hvgxtn6LJeDCvlKrkJVJbi
	 wQdVrQZS32GkJZj4kg8cdtldXnOcbpB5F3JHzPMap7bstHineIgY6IYsqD2IhJUJtNYfa
	 xd0EkORRhedzYexsq0vuJcxVu+S9H2k1/7yM8RKiCqyE+DiOIbk7hO0fUlYjPi6DFqClP
	 r5k8Ox7A1jgzkcT6nCcaekxom4WNw/52M9e3xjCCTQ7gG5DmxpwJ7GL/t85XRfdxfUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k3H5dSQC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7C2606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 08:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k3H5dSQC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2F21F000C4;
	Wed, 18 Nov 2026 08:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794989307;
	bh=+6SSKo6DIEKdzeKSnxARyTBsT8VD3sb3GeJYy9w40Cg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k3H5dSQCD+PTg2ZMksR2qMFGM9yK3Ml98/ukmfgAjml9+OUdvl1wUypHkhjqimp8S
	 iUX5KFdcSQMXvvaqxccQcDzKUEY9rDB6q6RVq8tjT5O/EoJzrRiHLuF1yJs5Poag2a
	 7yKW1NernvcsHs2LCr4bqtcGmEucR6kNqx0/63PqWsZ3iL0mIXEY9xrA8Ch7AMUIND
	 ijMLAgwuAL7UW5EjVl2xfsZ2YHaZarpo8WAqoZHWjrmer8Py1iMJ0hryJCFLo9hQX2
	 K1BHuK/pVsleKC4eueXIWC2nkkxA2eATEJ6Nv/pKUVHVxLqtQCaBf4HOafLTvrHQwD
	 BmTPfoeJ8mmkQ==
Message-ID: <sashiko-outbox-220416@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] usb: typec: tcpm: Leave SRC_VDM_IDENTITY_REQUEST
 whatever the cable answers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261118-tcpm-soft-reset-sop-v2-3-b6decdc95e66@flipper.net>
References: <20261118-tcpm-soft-reset-sop-v2-0-b6decdc95e66@flipper.net>
 <20261118-tcpm-soft-reset-sop-v2-3-b6decdc95e66@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:08:26 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] usb: typec: tcpm: partner SVID discovery aborted on SOP' NAK
  or timeout
- [Low] usb: typec: tcpm: incomplete SOP' VDM cleanup in
  run_state_machine()
--

commit b9c2fd6cef3c4af3dcadaf4f8b5d0a17a94ce0f2
Author: Alexey Charkov <alchark@flipper.net>

usb: typec: tcpm: Leave SRC_VDM_IDENTITY_REQUEST whatever the cable answers

This commit transitions the state machine from SRC_VDM_IDENTITY_REQUEST to
SRC_SEND_CAPABILITIES on a cable plug NAK, BUSY, response timeout, or
tTypeCSendSourceCap timeout, and cleans up any pending SOP' VDM request
when entering SRC_SEND_CAPABILITIES.

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index eb30b6efa5a14..cea9e6fc39c00 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm.c
> @@ -2747,6 +2747,12 @@ static int tcpm_pd_svdm(struct tcpm_port *port, st=
ruct typec_altmode *adev,
>  		break;
>  	case CMDT_RSP_NAK:
>  		tcpm_ams_finish(port);
> +		/* Go on with Source_Capabilities, as after an ACK */
> +		if (port->state =3D=3D SRC_VDM_IDENTITY_REQUEST &&
> +		    rx_sop_type =3D=3D TCPC_TX_SOP_PRIME) {
> +			tcpm_set_state(port, SRC_SEND_CAPABILITIES, 0);
> +			return 0;
> +		}
>  		switch (cmd) {
>  		/*
>  		 * The cable is not allowed to respond with NAK so this must've happen=
ed over SOP

[ ... ]

> @@ -3041,6 +3052,8 @@ static void vdm_run_state_machine(struct tcpm_port =
*port)
>  		port->vdm_state =3D VDM_STATE_ERR_TMOUT;
>  		if (port->ams !=3D NONE_AMS)
>  			tcpm_ams_finish(port);
> +		if (port->state =3D=3D SRC_VDM_IDENTITY_REQUEST)
> +			tcpm_set_state(port, SRC_SEND_CAPABILITIES, 0);
>  		break;
>  	case VDM_STATE_ERR_SEND:
>  		/*

[Severity: Medium]
Does partner SVID and alternate mode discovery still get aborted when a
cable plug replies with CMDT_RSP_NAK or times out in VDM_STATE_BUSY?

Moving to SRC_SEND_CAPABILITIES here leaves port->cable as NULL. Once the
explicit contract is established in SRC_READY and the port partner ACKs
CMD_DISCOVER_IDENT over TCPC_TX_SOP, tcpm_pd_svdm() sees
IS_ERR_OR_NULL(port->cable) and sends CMD_DISCOVER_IDENT on
TCPC_TX_SOP_PRIME again while port->state is SRC_READY:

drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_svdm() {
    ...
				if (IS_ERR_OR_NULL(port->cable) &&
				    tcpm_can_communicate_sop_prime(port)) {
					*response_tx_sop_type =3D TCPC_TX_SOP_PRIME;
					response[0] =3D VDO(USB_SID_PD, 1,
							  typec_get_negotiated_svdm_version(typec),
							  CMD_DISCOVER_IDENT);
					rlen =3D 1;
				}
    ...
}

When that second SOP' request receives CMDT_RSP_NAK in SRC_READY,
port->state =3D=3D SRC_VDM_IDENTITY_REQUEST is false, so tcpm_pd_svdm() fal=
ls
through to case CMD_DISCOVER_IDENT and sets VDM_DISCOVERY_COMPLETE without
sending CMD_DISCOVER_SVID to the partner. Likewise, if that SOP' request
times out in VDM_STATE_BUSY in SRC_READY, vdm_run_state_machine() sets
VDM_STATE_ERR_TMOUT without advancing to VDM_DISCOVERY_CABLE_IDENT or
queueing CMD_DISCOVER_SVID on TCPC_TX_SOP (unlike VDM_STATE_ERR_SEND).

[ ... ]

> @@ -5550,8 +5563,18 @@ static void run_state_machine(struct tcpm_port *po=
rt)
>  		 * Straight from Discover Identity to the cable plug, rather
>  		 * than back through SRC_READY after a message from the sink
>  		 */
> -		if (port->prev_state =3D=3D SRC_VDM_IDENTITY_REQUEST)
> +		if (port->prev_state =3D=3D SRC_VDM_IDENTITY_REQUEST) {
>  			port->upcoming_state =3D INVALID_STATE;
> +			/* Forget the request if still waiting on the cable plug */
> +			if (port->vdm_sop_type =3D=3D TCPC_TX_SOP_PRIME &&
> +			    port->vdm_state > VDM_STATE_DONE) {
> +				port->vdm_state =3D VDM_STATE_DONE;
> +				port->vdo_data[0] =3D 0;
> +				mod_vdm_delayed_work(port, 0);
> +			}
> +			if (port->ams =3D=3D DISCOVER_IDENTITY)
> +				tcpm_ams_finish(port);
> +		}
>  		port->caps_count++;
>  		if (port->caps_count > PD_N_CAPS_COUNT) {
>  			tcpm_set_state(port, SRC_READY, 0);

[Severity: Low]
Can gating this cleanup on port->prev_state =3D=3D SRC_VDM_IDENTITY_REQUEST
skip cancelling a pending SOP' VDM when an incoming SOP message from the
sink interrupts SRC_VDM_IDENTITY_REQUEST?

In that case tcpm_pd_handle_msg() transitions SRC_VDM_IDENTITY_REQUEST ->
SRC_READY -> SRC_SEND_CAPABILITIES, so port->prev_state is SRC_READY. For
example, if an unstructured VDM arrives on SOP while vdm_state is waiting
in VDM_STATE_SEND_MESSAGE (PD_T_SINK_TX), tcpm_handle_vdm_request() calls
tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS) without resetting
vdm_state, leaving the SOP' VDM timer armed and port->vdo_data[0] set
when SRC_SEND_CAPABILITIES is entered via SRC_READY.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-tcpm-soft-=
reset-sop-v2-0-b6decdc95e66@flipper.net?part=3D3
