Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915569;
	b=1lqUAuga4csa/2L+C2k/YPeFG/nX+ZVYMbvSUJ5p+YKscTjMJyBm46CQvrh9pLS2poT8
	 2FchvywXoK3cg05h37Mq934bTHlbjrExuhZT3N9lhaSQkkGKOaPGPkY0eO7j0ZhbuWXLf
	 N1eZxyt5mX+lINV7pEfhartetebX1svhjajqjPEzNhoyYZe1nn9ywXR0dymaHe0JY6ISZ
	 0kQuK2FwCy1Pmr42okyMK6PRXZoO6j1Px/nLqfigrZeF3Tw6J8xEJqShhQDkYeChgnDqP
	 96K/i3GM3v+S3VBUsh496gK0HCldxdNNzgSAh6KWfOV9M0GKuwUKb5VPyXar+jv2MgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915569;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=S0byb+kjs5hSVEw9kPhd7yorfSf1qy46aFxFCHF8kTs=;
	b=Ms39ZnS405u0uB6ojiqcLHqknyjxPB5l23QwEnsIjSYRTGDgkpOxtBWbJH6WDQ8guxu6
	 B8a6RFg79Xq4hMVxUHyg4eEoA6AuNLBd5PQDJVH6WKFsKYVNhPzrK/Jv2Te71dqDYdA/o
	 0xvOK7xmJNtdPfgMQxCsvVZtdtCCIALLlcOzzU9MQIo6aPFOvfNZ2H2LU7aSEgiJ43SIb
	 M/r02tXv1435F4PblIKu/r/KBKUn5rd1CjWy+ZKnktpwMHYFsOadlWP2GhDQ6Qb6NHmF9
	 tRP0Y2rCC78m/h+cVJZ2icdlyUzLj+9J4It9TO8Sc3U1PYnqHJ9J0EQKAM79G1GVo8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B7CpCUP8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573C7606A323
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 11:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B7CpCUP8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174001F000C7;
	Tue, 17 Nov 2026 11:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794915569;
	bh=S0byb+kjs5hSVEw9kPhd7yorfSf1qy46aFxFCHF8kTs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B7CpCUP8v9j+qTitDxX7Bo+3zver0qoJ9qvBqam/vXyLxYLZYM0gppUQmwk/0glBi
	 hYTfIfLggzOE/o3U7y0m56MtrQoQ4pkgaDh3G+5gNDBho0FIGGCriVODqLdHjn4qf7
	 KTdvkbJ92Gps6r1+YoxrE48UnT2Ci1ck5s5Tge02qLVrxDKZx28X1SgbFLWu9JXe1d
	 1RUcF4Ik/3l0Vihl8/MMAq+VkKMd7LKfIaj3bTP+blnUGUGOmG0SAQGOr3ZmWJ7nqW
	 UWmocQ3nQ1FeJ9my6IINGSsHqy/kLM/NO6B+n6IW6z6q7TqQu9Z+t+mqZLSUvHnJMd
	 BB9NiAAPArsmg==
Message-ID: <sashiko-outbox-218715@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] usb: typec: tcpm: Leave SRC_VDM_IDENTITY_REQUEST
 whatever the cable answers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-tcpm-soft-reset-sop-v1-2-c7e1543828c0@flipper.net>
References: <20261117-tcpm-soft-reset-sop-v1-0-c7e1543828c0@flipper.net>
 <20261117-tcpm-soft-reset-sop-v1-2-c7e1543828c0@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 11:39:28 +0000
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
- [Medium] usb: typec: tcpm: cable NAK in tcpm_pd_svdm() skips partner
  discovery
- [Medium] usb: typec: tcpm: uncancelled VDM in SRC_VDM_IDENTITY_REQUEST
- [Medium] usb: typec: tcpm: sink message in tcpm_pd_handle_msg()
  strands port
--

commit 5097e0ac5463844ca0f58a3e399840651ccf8014
Author: Alexey Charkov <alchark@flipper.net>

usb: typec: tcpm: Leave SRC_VDM_IDENTITY_REQUEST whatever the cable answers

This commit replaces the upcoming_state assignment in
SRC_VDM_IDENTITY_REQUEST with a delayed state transition to
SRC_SEND_CAPABILITIES after PD_T_SEND_SOURCE_CAP.

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 8c5be904d7725..947fca918414e 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -6553,7 +6553,11 @@ static void run_state_machine(struct tcpm_port *po=
rt)
>  	/* Cable states */
>  	case SRC_VDM_IDENTITY_REQUEST:
>  		mod_vdm_discovery_delayed_work(port, 0);
> -		port->upcoming_state =3D SRC_SEND_CAPABILITIES;
> +		/*
> +		 * Go on with Source_Capabilities whatever becomes of Discover
> +		 * Identity, unless the cable plug answers sooner
> +		 */
> +		tcpm_set_state(port, SRC_SEND_CAPABILITIES, PD_T_SEND_SOURCE_CAP);
>  		break;
> =20
>  	default:

[Severity: Medium]
If the cable plug replies with CMDT_RSP_NAK in SRC_VDM_IDENTITY_REQUEST,
does leaving the state after PD_T_SEND_SOURCE_CAP skip all SOP partner VDM
discovery once the explicit contract is established?

When CMDT_RSP_NAK arrives over TCPC_TX_SOP_PRIME, tcpm_pd_svdm() assumes
the NAK came from the partner over SOP and marks discovery complete:

drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_svdm() {
	...
	case CMDT_RSP_NAK:
		tcpm_ams_finish(port);
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

When the timer then moves the port to SRC_SEND_CAPABILITIES and later
SRC_READY under an explicit contract, port->vdm_discovery_state is already
VDM_DISCOVERY_COMPLETE instead of VDM_DISCOVERY_UNKNOWN.  SRC_READY skips
tcpm_set_initial_svdm_version(), and tcpm_vdm_discovery_work() returns
immediately without discovering the partner's identity, SVIDs, or alternate
modes.

[Severity: Medium]
Can an in-flight SOP' VDM exchange outlive the PD_T_SEND_SOURCE_CAP timeout
and corrupt partner discovery after the port moves to
SRC_SEND_CAPABILITIES?

If the cable plug responds with CMDT_RSP_BUSY, tcpm_handle_vdm_request()
sets VDM_STATE_WAIT_RSP_BUSY and schedules a retry after PD_T_VDM_BUSY
(100 ms).  When that timer fires, port->state is still
SRC_VDM_IDENTITY_REQUEST, so vdm_run_state_machine() queues a new SOP'
transmission across PD_T_SINK_TX (16 ms) and PD_T_VDM_SNDR_RSP (30 ms),
which extends past the 150 ms PD_T_SEND_SOURCE_CAP timeout.

When PD_T_SEND_SOURCE_CAP expires and transitions port->state to
SRC_SEND_CAPABILITIES, the active VDM state machine and AMS are not
cancelled.  A subsequent SOP' CMDT_RSP_ACK in tcpm_pd_svdm() or TX failure
in vdm_run_state_machine() then sees port->state !=3D
SRC_VDM_IDENTITY_REQUEST, advances port->vdm_discovery_state to
VDM_DISCOVERY_CABLE_IDENT, and queues CMD_DISCOVER_SVID on SOP before an
explicit contract or partner identity discovery has happened.

[Severity: Medium]
Does dropping port->upcoming_state =3D SRC_SEND_CAPABILITIES cause a sink
message handled via tcpm_pd_handle_msg() to strand the port in SRC_READY
without an explicit contract?

While in SRC_VDM_IDENTITY_REQUEST, tcpm_ams_interruptible(port) is true.
If the sink sends a message that takes the default interruptible path in
tcpm_pd_handle_msg() (such as an unsupported message or
PD_CTRL_GET_SINK_CAP), tcpm_set_state(port, ready_state(port), 0) clears
port->delayed_state and cancels the pending PD_T_SEND_SOURCE_CAP timer:

drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_handle_msg() {
	...
		} else {
			port->next_ams =3D ams;
			tcpm_set_state(port, ready_state(port), 0);
			/* 6.8.1 process the Message */
			tcpm_queue_message(port, message);
		}
	...
}

Once the queued reply is sent, run_state_machine() enters SRC_READY with
port->upcoming_state =3D=3D INVALID_STATE and port->explicit_contract =3D=
=3D false,
so it never returns to SRC_SEND_CAPABILITIES.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-tcpm-soft-=
reset-sop-v1-0-c7e1543828c0@flipper.net?part=3D2
