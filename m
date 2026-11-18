Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988306;
	b=KwPXry5ATqcoTT2nRqR4jsjpjYiwp5UKKsfpXut10+cZlzeqyCP/SzI73n9ktO1qE+Q4
	 i8hzDsEJ07uP+ybTdrK7U1bSfxJ0CVuoOCtDV21uSiFdemBu7Dcny5q3QEfP8FvA2Mido
	 cSmrRjwzufBQwvxaEHtaK5hvSRIwfgMae3dH3CPJXZVB6Ryj0jTVM42FxWoP8sKV5G67o
	 meTYCCSJLi1DAngfW3WEANV5yQ5uduAmJWwgTr+RwU3mGli5kCAPiywsldexCMptM0aGr
	 9augCvHSAmAKQgQLUldU/6VVFdkJuINno/uXVXI02tFnxCd1gM3jF+MIsFUYayiCHcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988306;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TbTl+J1WKON1ZVFZV6RRToeGHS1U+vt8cIte3veYKRs=;
	b=NtyWWk9Zpfpwr8EuNJTXQbwOgirUQ0fdpAWu/alBD3nEzGpn1+84bAHi6GhwYcqZ3ofj
	 3MReWuDjaFtu/khrR80KwfrjMDlATiwPGsj4vhPIDyyQCaIgAVKATipXnO/H6Tzthg9Eb
	 P4Ec20VzpHyKzPIQNQ/JYjgRP7/w7AsDpn6mZert8GKB++eEqMaIfHnb8xh2NPPw1v1AW
	 qz8RiMJCIc3G74FrnoF8FOIetPOQ/pDPk+xn7J4tgKp/ApVTNpZ04axEal9veN0H8BpCs
	 ZKHhyngDfG/ggJBDB+iaizyP9N/iwctNCzQ0097QVoVP8uDkl7AXzQgmlBC0j2Q3kcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YZW/ZxRF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21D4606A332
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 07:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZW/ZxRF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0511F000C6;
	Wed, 18 Nov 2026 07:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794988306;
	bh=TbTl+J1WKON1ZVFZV6RRToeGHS1U+vt8cIte3veYKRs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YZW/ZxRF2LrQ3PidIjYOiSLv97eR+yFLjNFTUnpS3Hu1UhgeLv61OiNgPak8KIYlp
	 SZwGr53Oycx5WOQA9nnPQXTfn3PqJeyejCSWrGDfjUhfE8gNRLOFyuBeS9M1Xeks9W
	 CQfoxUJotJm5Yp6Sced7RvNPLdaU+astNUnJ71yfVAA7wPdFfixam34BKyJzYywR0T
	 zgUByXjnYxUPHL7FukxOwY3Zxp8TrCIyP/+kNqX/RE4CaI+guXgzqsszPwSVzSLk5/
	 zZgAGOOSGa1+hQMeC4qIF+zc1VPjtWs8PDSbopeh7ZE/G5aI0j4kGKE+HqV5JlKb9t
	 WnbSm8nIO0Kcg==
Message-ID: <sashiko-outbox-220369@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] usb: typec: tcpm: Keep cable plug messages away
 from the port partner
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261118-tcpm-soft-reset-sop-v2-4-b6decdc95e66@flipper.net>
References: <20261118-tcpm-soft-reset-sop-v2-0-b6decdc95e66@flipper.net>
 <20261118-tcpm-soft-reset-sop-v2-4-b6decdc95e66@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 07:51:45 +0000
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
- [Medium] usb: typec: tcpm: SOP' SVDMs in tcpm_cable_vdm_expected()
  still affect SOP
- [Medium] usb: typec: tcpm: tcpm_cable_ctrl_msg_expected() aborts
  unsent SOP' VDMs
- [Low] usb: typec: tcpm: stale soft_reset_sent_prime before
  run_state_machine()
--

commit 4c61156df43ba909af0892d17e05a01aa528ddf2
Author: Alexey Charkov <alchark@flipper.net>

usb: typec: tcpm: Keep cable plug messages away from the port partner

This commit filters incoming SOP' messages so that only expected VDM and
control responses from a cable plug are passed to the protocol handlers, and
drops messages on unsupported SOP* types before updating MessageID state.

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index cea9e6fc39c00..530186b51092f 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -682,6 +682,8 @@ struct tcpm_port {
>  	 */
>  	enum tcpm_transmit_type vdm_sop_type;
>  	enum tcpm_transmit_type soft_reset_sop_type;
> +	/* The Soft_Reset in SOFT_RESET_SEND went to the cable plug */
> +	bool soft_reset_sent_prime;
>  	/*
>  	 * Prior to discovering the port partner's Specification Revision, the
>  	 * Vconn source and cable plug will use the lower of their two revision=
s.
> @@ -4179,6 +4181,64 @@ static void tcpm_pd_ext_msg_request(struct tcpm_po=
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
> +	case PD_CTRL_NOT_SUPP:
> +		/* a VDM, in the ready state, which takes it as the answer */
> +		return port->vdm_sop_type =3D=3D TCPC_TX_SOP_PRIME &&
> +		       port->vdm_state > VDM_STATE_READY &&
> +		       port->state =3D=3D ready_state(port);

[Severity: Medium]
Does checking port->vdm_state > VDM_STATE_READY allow an unsolicited SOP'
PD_CTRL_NOT_SUPP to cancel a VDM that has not been sent yet?

In enum vdm_states, VDM_STATE_WAIT_RSP_BUSY and VDM_STATE_SEND_MESSAGE are
both greater than VDM_STATE_READY.  When a PD 3.0 source queues an SOP' SVDM
in SRC_READY, vdm_run_state_machine() waits PD_T_SINK_TX in
VDM_STATE_SEND_MESSAGE before transmitting the message and clearing
port->vdo_data[0].  An unsolicited SOP' PD_CTRL_NOT_SUPP during that window
passes this check and reaches tcpm_pd_ctrl_request(), which sets
port->vdm_state to VDM_STATE_DONE, finishes the AMS without sending the VDM
or running the VDM_STATE_ERR_SEND fallback to partner discovery, and leaves
port->vdo_data[0] non-zero.

Checking port->vdm_state =3D=3D VDM_STATE_BUSY, as tcpm_cable_vdm_expected()
does, would only accept Not_Supported while waiting for a response to a VDM
already on the wire.

> +	default:
> +		return false;
> +	}
> +}
> +
> +/* Whether a cable plug VDM answers the one the port is waiting on */
> +static bool tcpm_cable_vdm_expected(struct tcpm_port *port,
> +				    const struct pd_message *msg)
> +{
> +	u32 vdo =3D le32_to_cpu(msg->payload[0]);
> +
> +	return port->vdm_sop_type =3D=3D TCPC_TX_SOP_PRIME &&
> +	       port->vdm_state =3D=3D VDM_STATE_BUSY &&
> +	       PD_VDO_SVDM(vdo) && PD_VDO_CMDT(vdo) !=3D CMDT_INIT;
> +}

[Severity: Medium]
Can a malformed SOP' SVDM response that passes tcpm_cable_vdm_expected()
still trigger transmissions to the port partner on SOP or corrupt partner
discovery state?

tcpm_cable_vdm_expected() checks neither the command nor the SVID against
 the pending SOP' request.  Once passed to tcpm_handle_vdm_request() ->
tcpm_pd_svdm(), response_tx_sop_type defaults to TCPC_TX_SOP:

drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_svdm() {
    ...
		default:
			/* Unrecognized SVDM */
			response[0] =3D p[0] | VDO_CMDT(CMDT_RSP_NAK);
			rlen =3D 1;
			response[0] =3D (response[0] & ~VDO_SVDM_VERS_MASK) |
				      (VDO_SVDM_VERS(svdm_version));
			break;
		}
		break;
	case CMDT_RSP_NAK:
		tcpm_ams_finish(port);
		/* Go on with Source_Capabilities, as after an ACK */
		if (port->state =3D=3D SRC_VDM_IDENTITY_REQUEST &&
		    rx_sop_type =3D=3D TCPC_TX_SOP_PRIME) {
			tcpm_set_state(port, SRC_SEND_CAPABILITIES, 0);
			return 0;
		}
		switch (cmd) {
		/*
		 * The cable is not allowed to respond with NAK so this must've happened =
over SOP
		 */
		case CMD_DISCOVER_IDENT:
		case CMD_DISCOVER_SVID:
			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
			break;
    ...
}

If the cable plug replies on SOP' with an unrecognized command (such as
CMD_ATTENTION with CMDT_RSP_ACK or CMD_EXIT_MODE with CMDT_RSP_NAK), the
default branches set rlen =3D 1 without updating response_tx_sop_type, so
tcpm_handle_vdm_request() queues a VDM NAK on TCPC_TX_SOP to the port
partner.  Similarly, if tcpm_vdm_ams(port) is false when the SOP' VDM
arrives (for instance, after a partner AMS interrupted port->ams), the else
branch in tcpm_handle_vdm_request() sends PD_MSG_CTRL_NOT_SUPP on SOP.

In addition, a CMDT_RSP_NAK on SOP' for CMD_DISCOVER_IDENT or
CMD_DISCOVER_SVID in SRC_READY/SNK_READY marks VDM_DISCOVERY_COMPLETE and
skips partner SVID discovery or partner altmode registration, and an
unexpected CMD_DISCOVER_MODES ACK on SOP' before CMD_DISCOVER_IDENT
registers port->plug_prime reaches tcpm_register_plug_altmodes() with
port->plug_prime =3D=3D NULL.

[ ... ]

> @@ -6256,7 +6320,9 @@ static void run_state_machine(struct tcpm_port *por=
t)
>  		 * A Soft_Reset Message Shall be targeted at a specific entity
>  		 * depending on the type of SOP* packet used.
>  		 */
> -		if (port->soft_reset_sop_type =3D=3D TCPC_TX_SOP_PRIME) {
> +		port->soft_reset_sent_prime =3D
> +			port->soft_reset_sop_type =3D=3D TCPC_TX_SOP_PRIME;
> +		if (port->soft_reset_sent_prime) {
>  			port->soft_reset_sop_type =3D TCPC_TX_SOP;
>  			port->message_id_prime =3D 0;
>  			port->rx_msgid_prime =3D -1;

[Severity: Low]
Can a stale port->soft_reset_sent_prime allow an unsolicited SOP'
PD_CTRL_ACCEPT to cancel a later SOP SOFT_RESET_SEND before
run_state_machine() runs?

After an SOP' Soft_Reset following a VCONN swap, port->soft_reset_sent_prime
remains true until the next time run_state_machine() executes
SOFT_RESET_SEND.  If tcpm_pd_ext_msg_request() later calls
tcpm_set_state(port, SOFT_RESET_SEND, 0) for a malformed SOP
PD_EXT_GET_BATT_STATUS or PD_EXT_GET_BATT_CAP message, port->state becomes
SOFT_RESET_SEND immediately while port->state_machine is queued on port->wq.
An SOP' PD_CTRL_ACCEPT already queued ahead of it on port->wq will then pass
tcpm_cable_ctrl_msg_expected() and transition the port back to
ready_state(port) before the SOP Soft_Reset is sent.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-tcpm-soft-=
reset-sop-v2-0-b6decdc95e66@flipper.net?part=3D4
