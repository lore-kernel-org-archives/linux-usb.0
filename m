Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915779;
	b=xPZMWe6MdcXZKGHnxIH5rRSD/LDHIx9j1xjALlGy98UgJGKQ5S4BjUtgrnlnhKYEJNIq
	 /YLchIp7/WVIju2Sy5BL5krQwXvCESk8SoxcksSj8HNVjtfgs+G+e65qd/KAmqoECRl4l
	 yrlJjsT+vOy1X+GoBZx2w8eJmaGRraA5WtY8ccfqhfWYkII3sN8sKcuNAUaf0zuiUjFi1
	 fADWVktrkdBtGkyE+SQBmmhrwXpkmRYJtLWbI0uXomZ1ARe+fHT/d/bUwFY+C8Ca2CqKS
	 zNwTgCvWT8neNYPdD5JF7imhgC1TtWrry5r0ukG9JFd2YPB0jbX4d4cyQIVTQcPdrVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915779;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wIK87O7uyzPYlJqNMQ9CZEXA3RMgdpErsXadEV7aDng=;
	b=UBalMO/GMUiQHahKixl7WeODKsXUfqoSWwfLVkQWmt31YHT06DkFLUSCkZRxAD+w+Ldb
	 BBRowzANgS0MuldncL6YIbS58ZZa5IOe4U4Q7SAas25v5Q4oNgVlC7xDiI4a934Y9/fbT
	 1D8AY8iUvNbRXSjjGy1EmtRJIYDKr4rwfyvQ8UrUgH3QJMyzDos+N11pPGSrXkAWwKPAJ
	 5MtxHPdLxM2mFUceWXwPg655Ov1JZzOKIR6VrOGoRkNKXcZOEpaDrGO6AutEhlOmtpM0C
	 80UEnB8Cty8FmoU+9TKmYAcJxmkIQg6h3UepLSOiTlMLwMQGGAMPrnTN49EdnqJpI6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TD4fYpFX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7C8606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 11:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TD4fYpFX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D704E1F000C5;
	Tue, 17 Nov 2026 11:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794915779;
	bh=wIK87O7uyzPYlJqNMQ9CZEXA3RMgdpErsXadEV7aDng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TD4fYpFXBjqhPxIgDtpVLJz0Kv2UO2nGdqkScNWgLWJPngtzPxI1OIypiEroBPA7h
	 9zegTDq8Uhe0X3cenlVrzGdKNuALVOci8saUkBVeTlh7PHYrZVeFATPn6/S8anI8Bf
	 Oii3ra+klv/SBktLhWuFtLOCJz0PcxDEuaCi79PkQvLSyeC9p2rAgZqRAF0QslCQYh
	 /YxbiCn9MKSYhhIciXAgOFNFlYAQNifl6Aq+alaYum7Qjb7Jf2mqg/lE3PXoK9lhfd
	 NZe5JXJz/OqnDLZ1W/gh+ZyuGAB4bT3EZB5Ujy9ev2T5c89OnzbSIU7hw98dd+l5Ax
	 f3VouvHwupiYw==
Message-ID: <sashiko-outbox-218719@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] usb: typec: tcpm: Keep cable plug messages away
 from the port partner
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-tcpm-soft-reset-sop-v1-3-c7e1543828c0@flipper.net>
References: <20261117-tcpm-soft-reset-sop-v1-0-c7e1543828c0@flipper.net>
 <20261117-tcpm-soft-reset-sop-v1-3-c7e1543828c0@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 11:42:58 +0000
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
- [Medium] usb: typec: tcpm: SOP' VDMs in tcpm_pd_cable_msg_request()
  affect partner
- [Medium] usb: typec: tcpm: SOP' PD_CTRL_REJECT in
  tcpm_pd_ctrl_request() resets partner
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] usb: typec: tcpm: infinite discovery retry loop in
  tcpm_pd_ctrl_request() [1]
--

commit a17153f1f38f59679f1ba169d5aec3d715a00c73
Author: Alexey Charkov <alchark@flipper.net>

usb: typec: tcpm: Keep cable plug messages away from the port partner

This commit filters incoming SOP' messages in tcpm_pd_rx_handler() through
tcpm_pd_cable_msg_request() so that only VDMs and expected control responses
from a cable plug are processed, while dropping unsupported SOP* types befo=
re
updating MessageID tracking.

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 947fca918414e..2a909ca96811d 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
[ ... ]
> @@ -4164,6 +4166,52 @@ static void tcpm_pd_ext_msg_request(struct tcpm_po=
rt *port,
>  	}
>  }
> =20
> +/* Whether a cable plug control message responds to what the port sent i=
t */
> +static bool tcpm_cable_ctrl_msg_expected(struct tcpm_port *port,
> +					 enum pd_ctrl_msg_type type)
> +{
> +	switch (type) {
> +	case PD_CTRL_ACCEPT:
> +		/* the Soft_Reset after a VCONN Swap */
> +		return port->state =3D=3D SOFT_RESET_SEND &&
> +		       port->soft_reset_sent_prime;
> +	case PD_CTRL_REJECT:
> +	case PD_CTRL_NOT_SUPP:
> +		/* a VDM, in the ready state, which takes it as the answer */
> +		return port->vdm_sop_type =3D=3D TCPC_TX_SOP_PRIME &&
> +		       port->vdm_state > VDM_STATE_READY &&
> +		       port->state =3D=3D ready_state(port);
> +	default:
> +		return false;
> +	}
> +}

[Severity: Medium]
When a cable plug replies to a structured VDM with PD_CTRL_REJECT in the
ready state, does forwarding it to tcpm_pd_ctrl_request() still soft-reset
the port partner?

At the top of tcpm_pd_ctrl_request(), any control message other than
PD_CTRL_NOT_SUPP and PD_CTRL_GOOD_CRC aborts an active VDM AMS before the
switch statement:

drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_ctrl_request() {
    ...
	if (tcpm_vdm_ams(port) && type !=3D PD_CTRL_NOT_SUPP && type !=3D PD_CTRL_=
GOOD_CRC) {
		port->vdm_state =3D VDM_STATE_ERR_BUSY;
		tcpm_ams_finish(port);
		mod_vdm_delayed_work(port, 0);
	}
    ...
}

Because port->vdm_state is overwritten with VDM_STATE_ERR_BUSY (-3), the
subsequent port->vdm_state > VDM_STATE_READY check in the SRC_READY and
SNK_READY cases evaluates to false, falling through to the default branch
and triggering a soft reset against the port partner on SOP.

> +
> +/*
> + * A cable plug only responds to the VCONN source: to its VDMs, and to i=
ts
> + * Soft_Reset. Hand those to the usual handlers, which tell SOP' apart w=
here
> + * it matters, and drop anything else on SOP': it comes from a cable plug
> + * that breaks the rules, and no sequence has the port answer a cable pl=
ug.
> + */
> +static void tcpm_pd_cable_msg_request(struct tcpm_port *port,
> +				      const struct pd_message *msg)
> +{
> +	unsigned int type =3D pd_header_type_le(msg->header);
> +	bool ext =3D le16_to_cpu(msg->header) & PD_HEADER_EXT_HDR;
> +	bool ctrl =3D !ext && !pd_header_cnt_le(msg->header);
> +
> +	if (!ext && !ctrl && type =3D=3D PD_DATA_VENDOR_DEF) {
> +		tcpm_pd_data_request(port, msg, TCPC_TX_SOP_PRIME);
> +		return;
> +	}

[Severity: Medium]
Can an unexpected or malformed SOP' VDM passed to tcpm_pd_data_request()
still cause the port to send messages to or reset the port partner on SOP?

Unlike tcpm_cable_ctrl_msg_expected(), this path does not check whether the
port is waiting for an SOP' VDM response.  In tcpm_handle_vdm_request(), an
unstructured SOP' VDM (or an SVDM when no VDM AMS, partner altmode, or sink
VDO is active) hits the else branch and calls
tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS), which transmits
Not_Supported on SOP or initiates a soft or hard reset of the port partner:

drivers/usb/typec/tcpm/tcpm.c:tcpm_handle_vdm_request() {
    ...
	if (PD_VDO_SVDM(p[0]) && (adev || tcpm_vdm_ams(port) || port->nr_snk_vdo))=
 {
		port->vdm_sm_running =3D true;
		rlen =3D tcpm_pd_svdm(port, adev, p, cnt, response, &adev_action,
				    rx_sop_type, &response_tx_sop_type);
	} else {
		if (port->negotiated_rev >=3D PD_REV30)
			tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
	}
    ...
}

In addition, if the port is waiting for an SOP VDM response from the partner
(port->vdm_state =3D=3D VDM_STATE_BUSY && port->vdm_sop_type =3D=3D TCPC_TX=
_SOP), an
unsolicited SOP' VDM mutates port->vdm_state and port->vdo_retry for the
partner VDM state machine.  Finally, an SOP' SVDM that hits a CMDT_RSP_NAK
path in tcpm_pd_svdm() leaves response_tx_sop_type at its default of
TCPC_TX_SOP and queues the VDM NAK to the port partner.

> +	if (ctrl && tcpm_cable_ctrl_msg_expected(port, type)) {
> +		tcpm_pd_ctrl_request(port, msg, TCPC_TX_SOP_PRIME);
> +		return;
> +	}

[Severity: High]
This problem wasn't introduced by this patch, but when
tcpm_pd_ctrl_request() handles PD_CTRL_NOT_SUPP or PD_CTRL_REJECT for an
in-flight VDM in SRC_READY or SNK_READY [1], does it leave
port->vdm_discovery_state unadvanced and cause an infinite discovery retry
loop?

In tcpm_pd_ctrl_request(), the SRC_READY and SNK_READY handler sets
port->vdm_state =3D VDM_STATE_DONE and finishes the VDM AMS without updating
port->vdm_discovery_state:

drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_ctrl_request() {
    ...
		case SRC_READY:
		case SNK_READY:
			if (port->vdm_state > VDM_STATE_READY) {
				port->vdm_state =3D VDM_STATE_DONE;
				if (tcpm_vdm_ams(port))
					tcpm_ams_finish(port);
				mod_vdm_delayed_work(port, 0);
				break;
			}
    ...
}

When a discovery command such as DISCOVER_SVIDS or DISCOVER_MODES is
answered with PD_CTRL_NOT_SUPP, port->vdm_discovery_state remains in its
intermediate phase instead of advancing, so subsequent state machine runs in
SRC_READY or SNK_READY that schedule mod_vdm_discovery_delayed_work(port, 0)
repeatedly re-send the same rejected VDM command.

[1] https://sashiko.dev/#/bug/linux-2c1789d2-5c2d-407e-af88-42956bee42c7

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-tcpm-soft-=
reset-sop-v1-0-c7e1543828c0@flipper.net?part=3D3
