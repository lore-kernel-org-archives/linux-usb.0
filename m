Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915024;
	b=xpNmAJ30s9gqSv0MfHLLiYgRgKUjZmn6O7cdQaEcG8Hi/TOHnS3SdL96hv9bbpgZNIb1
	 qFNRKg/t4u0R6NKJSWpn2Y76BnzLauHBgR4G+Shkbm0e/QOlFJCguxQ5po4ib2HQ+1Ur/
	 X16IdL+Y9IZ9q6qXYcSpw1SRaY1sHQ2Z3r3zJKUqEyUuvNZn0YoRDJ2YX+5cdUFRFVNo3
	 xzYp6qYPKRqVXMeup41x81OPl/HcgYMUU1jPl6dZGwQZkdRf+v/aDq8Ftn7nv4UPcUx/F
	 fJOcmZE9I2/KELoLmjCBmWKOwCX56amEg+/bWCsOh9Dqwlb/jqebEGYcywoWqTgx/gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915024;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=T1s30aA8ugf7isPG5S/sVfQvJg6/E0Ud3Dqo9FndpMI=;
	b=IET/V+3CYli3vShrJJX3fLdznJ2Qg8tlq2/FFooBo9MAZjYPkXPiXvTNrw0xt4VO6sjU
	 On35uIp7OuX+vpW3wQOpV9snuoU16lKFUZSR7KEVPRW8eB6QmqMvnbGcB1qrll7gzfI3Q
	 i2ccs63Hyr78e5/r7TDlKkshTz5IkNTxE18VOPy7m1rTew/0hRW8H9J5ZVo4jhBFtOO2I
	 HhZ06YL/lo/ue1Y+bk9ximINn7aTu4Gc07P4mm7Qr9Fw5Oa8wrxtyM65To8Y5RejVXBkO
	 9OUkZO7qr4aRsHmmExu2hFeY5jnClUeJZjthNMY2smSbjod24Gh1uf9nKGrSPc8JyoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJmrZmL2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B33A606A329
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 11:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJmrZmL2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62151F000C4;
	Tue, 17 Nov 2026 11:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794915024;
	bh=T1s30aA8ugf7isPG5S/sVfQvJg6/E0Ud3Dqo9FndpMI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eJmrZmL2RyV9gVU4kA6TfLjgPBrXw15Gwr/ZIHEp/nOB6eGXCADIN9hVTvFKx+d8h
	 5gQTChfv2CFrJelkbSvH2bYelM7wQEdVfK1DBtxsgZuy+MYnm5PW51xitbOc/t50eY
	 x1SK0r5gzgLfDhUo2ro7hA06Q/o9/y1Kd+7UVQgfEfcDHd1vLpyiIox7wmX8ehOjoH
	 NsxnUSZxspqKl1GE6pXE6JNUOWkMZ5XIc2kv0GhVdxT8bbB0kbSuANdKr0Bfs8JZV5
	 bRdf8RUUOoMHFedxh6/iBvZU/UecEATXAl7cJA3MyK5sjtl2Sa71z05MecdIbO5CLI
	 w0Pj8LplpSH3A==
Message-ID: <sashiko-outbox-218712@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] usb: typec: tcpm: Keep the Soft_Reset target apart
 from the VDM one
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-tcpm-soft-reset-sop-v1-1-c7e1543828c0@flipper.net>
References: <20261117-tcpm-soft-reset-sop-v1-0-c7e1543828c0@flipper.net>
 <20261117-tcpm-soft-reset-sop-v1-1-c7e1543828c0@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 11:30:23 +0000
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
- [Medium] usb: typec: tcpm: stale upcoming_state in run_state_machine()
  sends SOP reset
--

commit 2100338173ee82724a16da9e2eef51514fc95f54
Author: Alexey Charkov <alchark@flipper.net>

usb: typec: tcpm: Keep the Soft_Reset target apart from the VDM one

This commit splits tx_sop_type into vdm_sop_type and soft_reset_sop_type so
that VDM transmissions and Soft_Reset messages do not overwrite each other's
SOP* target.

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index bb90211660cae..8c5be904d7725 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
[ ... ]
> @@ -6220,7 +6225,8 @@ static void run_state_machine(struct tcpm_port *por=
t)
>  		 * A Soft_Reset Message Shall be targeted at a specific entity
>  		 * depending on the type of SOP* packet used.
>  		 */
> -		if (port->tx_sop_type =3D=3D TCPC_TX_SOP_PRIME) {
> +		if (port->soft_reset_sop_type =3D=3D TCPC_TX_SOP_PRIME) {
> +			port->soft_reset_sop_type =3D TCPC_TX_SOP;
>  			port->message_id_prime =3D 0;
>  			port->rx_msgid_prime =3D -1;
>  			tcpm_pd_send_control(port, PD_CTRL_SOFT_RESET, TCPC_TX_SOP_PRIME);
> @@ -6439,7 +6445,7 @@ static void run_state_machine(struct tcpm_port *por=
t)
>  	case VCONN_SWAP_SEND_SOFT_RESET:
>  		tcpm_swap_complete(port, port->swap_status);
>  		if (tcpm_can_communicate_sop_prime(port)) {
> -			port->tx_sop_type =3D TCPC_TX_SOP_PRIME;
> +			port->soft_reset_sop_type =3D TCPC_TX_SOP_PRIME;
>  			port->upcoming_state =3D SOFT_RESET_SEND;
>  			tcpm_ams_start(port, SOFT_RESET_AMS);
>  		} else {

[Severity: Medium]
When port->pwr_role is TYPEC_SOURCE, can resetting port->soft_reset_sop_type
to TCPC_TX_SOP in SOFT_RESET_SEND cause an unintended SOP Soft_Reset to be
sent to the port partner right after the SOP' Soft_Reset finishes?

In VCONN_SWAP_SEND_SOFT_RESET, port->upcoming_state is set to
SOFT_RESET_SEND before calling tcpm_ams_start(port, SOFT_RESET_AMS).  When
port->pwr_role =3D=3D TYPEC_SOURCE, tcpm_ams_start() transitions directly to
SOFT_RESET_SEND without going through AMS_START, leaving
port->upcoming_state set to SOFT_RESET_SEND:

drivers/usb/typec/tcpm/tcpm.c:tcpm_ams_start() {
    ...
		} else if (ams =3D=3D SOFT_RESET_AMS) {
			if (!port->explicit_contract)
				tcpm_set_cc(port, tcpm_rp_cc(port));
			tcpm_set_state(port, SOFT_RESET_SEND, 0);
			return ret;
		}
    ...
}

Once the SOP' Soft_Reset completes and the state machine returns to
SRC_READY, SRC_READY consumes the leftover port->upcoming_state and
re-enters SOFT_RESET_SEND:

drivers/usb/typec/tcpm/tcpm.c:run_state_machine() {
    ...
		if (port->upcoming_state !=3D INVALID_STATE) {
			upcoming_state =3D port->upcoming_state;
			port->upcoming_state =3D INVALID_STATE;
			tcpm_set_state(port, upcoming_state, 0);
			break;
		}
    ...
}

Because the first pass through SOFT_RESET_SEND already reset
port->soft_reset_sop_type to TCPC_TX_SOP, the second pass takes the else
branch, clears the partner source capabilities and SOP message IDs, and
sends an unintended PD_CTRL_SOFT_RESET on TCPC_TX_SOP to the port partner,
forcing a full contract renegotiation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-tcpm-soft-=
reset-sop-v1-0-c7e1543828c0@flipper.net?part=3D1
