Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200194;
	b=qkA57FT+/MLo5R7k13AvLxP8GSBK7RGHXfWgXgo/pebLIq2wGWSWr37sdvryScYluzUh
	 rlNPi+Xp3vDGltZehkfncrnXP/u/AQahlx3RrCzOH0qHElT7K+Wsdf5Lfhnhx9Jt8ZPtg
	 6ripsmy+v7+0cW8yFUxKfNZIR3R+IccKaLr73lP+pq4q5nW+QkDFMJZfpL3/cGuuqBzCR
	 1YnIsrqBNuo/Ah5LbrIvbg/ym1sOCX4RkPpeBdfjLNd59OSwXctye6fQdPmMBkriOWYaZ
	 LblcMQID9X/AAU0jIqxPTm/GtFFDOzsoySi0dXCFJsIxUnjFXYJlHPwa76R5mdq6deQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200194;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ssDgyrZYVoi0gX7hYZLZO/6OxCX5dIfhH8133FIpLR4=;
	b=XY4FSk98U8/zZykuztKLfRpA8detRGleQ0Gtm7mpsK8sNaSxRsNDFjUuR9qLH/Ik7V2J
	 c2OiXfZjbgUm802wOgOGDeVTCcPYyNqcgvxzf0OoTJ3O04QCLnpvbtpZVoZtmjYw7QymM
	 RKFTX+KZrmMJ7jWKsQtMW+OL/ApiopUreZw9w5ct8WUOzLRx7z5pSlK9VN5/AqeyvbQVe
	 8CwL7QdEXOVTzX9W8qFmo02EuDP59Q5CPrAA8KCEQzRJLV38GBFfgpVJTScoK/lBpbQv7
	 hbZ5qP6VgZop4VviZTjXpUcJyYUdUfHEoQSbjMLFD9VwGkocjLHYoQIdkC3SEAuvQng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MgKmzHle;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D585606A332
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 18:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MgKmzHle
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58091F000CF;
	Fri, 20 Nov 2026 18:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795200193;
	bh=ssDgyrZYVoi0gX7hYZLZO/6OxCX5dIfhH8133FIpLR4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MgKmzHleyE3CIrHo7QerX83+swsCb23SYPHC83ie9uaw+GivH/Vh74C8E7bLIRqJ/
	 RMutHvYFj1m/bT3DEwkDNfbbMbvhlEtS0dWLqu02co4AtO74j13Sl80WxQ2alpY4J2
	 4cTWSn732b8jxZHo+WqTDcyKXaxyYUlwUpg5uXLBz3Xs/dlQmQ3qBjzINGgAMiKldu
	 8EVM1VQFb2VrMQnm5nE3a7kDC/KtdT9Oc99yGnk84gIaJ+14kfZFgN4V2M2FJihZyh
	 q6aBs6Mal5LGVEIh+eEZ357Yk/WvOcSWz0U/mHIGJmieLbh+SMDfINxCcldqCjgfei
	 t7UP1wKAMjcEw==
Message-ID: <sashiko-outbox-225863@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH usb v2] usb: typec: tcpm: align SOP' Soft Reset handling
 with SOP
Reply-To: sashiko-reviews@lists.linux.dev
To: memoriaru@foxmail.com
Cc: linux-usb@vger.kernel.org
In-Reply-To: <tencent_3C8B79F98D619AA20768761A53496A7D6E05@qq.com>
References: <tencent_443620EAE95525A375BB2D8A653406630A07@qq.com>
 <awBIRnc9lBkdVhEK@black.igk.intel.com>
 <tencent_3C8B79F98D619AA20768761A53496A7D6E05@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 18:43:07 +0000
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
- [High] usb: typec: tcpm: SOP' MessageID desync and broken SOP' reset
  in SOFT_RESET
- [Low] usb: typec: tcpm: malformed Fixes SHA, reply chatter, and wrong
  claim in log
--

commit dccd2b15acd9fd37db996886a0767a44d39c3adf
Author: Zhang Hewei <memoriaru@foxmail.com>

> usb: typec: tcpm: align SOP' Soft Reset handling with SOP
>
> Resending as plain text -- the previous two copies went out in HTML
> format and were rejected by the vger list infrastructure. Please use
> this one and disregard the duplicates.
>
> Hi Heikki,
>
> Apologies -- you are right, and thanks for catching it. The patch
> doesn't apply because I generated the diff from inside
> drivers/usb/typec/tcpm/ and shipped it with the short paths (a/tcpm.c
> instead of a/drivers/usb/typec/tcpm/tcpm.c), so git apply fails at the
> root of the tree. I had not verified it with `git apply --check` from
> the top before sending. Lesson taken.
>
> The base itself was the real tree: the index blob bb90211 in the v2
> diff is the master tcpm.c blob, and the two hunks apply cleanly and
> build with the corrected paths. I've verified v3 end to end on a fresh
> master tree: git apply --check passes at the root (forward and
> reverse), and with CONFIG_TYPEC_TCPM=3Dy the patched tcpm.c compiles
> clean (tcpm.o, zero warnings).
>
> The rebased v3 below is content-identical to v2 (same index blob
> bb90211 -- the base was the real tree, only the paths were wrong):
>
> From: Zhang Hewei <memoriaru@foxmail.com>
> Subject: [PATCH usb v3] usb: typec: tcpm: align SOP' Soft Reset handling =
with SOP
>
> The PD message duplicate-check and the SOFT_RESET state handling treat
> the SOP and SOP' channels differently:
>
> - tcpm_pd_rx_handler() exempts PD_CTRL_SOFT_RESET from the MessageID
>   duplicate check on the SOP path (USB PD spec 6.6.1.2 note: a
>   Soft_Reset message always carries MessageID zero, so the duplicate
>   check must not drop it), but the SOP' branch of the same switch has
>   no such exemption. A cable that sends a second Soft Reset over SOP'
>   (MessageID zero again) has that message silently dropped by the
>   stale rx_msgid_prime comparison, and the cable-side re-negotiation
>   stalls.
>
> - run_state_machine()'s SOFT_RESET case resets message_id/rx_msgid but
>   not message_id_prime/rx_msgid_prime, while the initiator path
>   (SOFT_RESET_SEND, SOP_PRIME branch) resets both counter pairs. After
>   a responder-side soft reset the prime counters stay stale.
>
> Reset the prime counters together with the SOP counters and exempt
> Soft Reset from the SOP' duplicate check, aligning the SOP' handling
> with the SOP path.
>
> Found by code inspection; a software TCPC stub was built for the
> responder path.
>
> Fixes: 6bd181ba60 ("usb: typec: tcpm: add control message support to sop'=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhang Hewei <memoriaru@foxmail.com>

[Severity: Low]
The mailing-list reply notes and embedded From:/Subject: headers at the top
belong below the "---" separator rather than in the commit changelog.

The Fixes tag also uses a 10-character SHA instead of at least 12
characters:

  Fixes: 6bd181ba60e1 ("usb: typec: tcpm: add control message support to so=
p'")

Also, is the description of SOFT_RESET_SEND accurate?  In
run_state_machine(), SOFT_RESET_SEND branches on port->tx_sop_type =3D=3D
TCPC_TX_SOP_PRIME and resets only message_id_prime/rx_msgid_prime for SOP'
or only message_id/rx_msgid for SOP, not both counter pairs.

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index bf7fd632d815e..0aa38f1e36bdb 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm.c
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
> @@ -6199,6 +6200,8 @@ static void run_state_machine(struct tcpm_port *por=
t)
>  	case SOFT_RESET:
>  		port->message_id =3D 0;
>  		port->rx_msgid =3D -1;
> +		port->message_id_prime =3D 0;
> +		port->rx_msgid_prime =3D -1;
>  		/* remove existing capabilities */
>  		tcpm_partner_source_caps_reset(port);
>  		tcpm_pd_send_control(port, PD_CTRL_ACCEPT, TCPC_TX_SOP);

[Severity: High]
Does unconditionally resetting port->message_id_prime and
port->rx_msgid_prime in SOFT_RESET desynchronize SOP' MessageID counters
with the cable plug during an SOP Soft Reset, while also mishandling an
incoming SOP' Soft Reset as an SOP reset?

SOP and SOP' maintain independent MessageID counters per USB PD 3.0
sections 6.3.13 and 6.7.1.  When the port partner sends an SOP
PD_CTRL_SOFT_RESET, the cable plug does not process SOP packets and keeps
its existing SOP' MessageID state.  If the port already sent one SOP' VDM
(such as CMD_DISCOVER_IDENT with MessageID 0, advancing
port->message_id_prime to 1 and leaving the cable plug's stored MessageID
at 0), resetting port->message_id_prime to 0 here causes the next SOP'
message to be sent with MessageID 0 again and dropped by the cable plug as
a duplicate.

Conversely, when PD_CTRL_SOFT_RESET arrives on TCPC_TX_SOP_PRIME,
tcpm_pd_ctrl_request() ignores rx_sop_type and enters SOFT_RESET:

drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_ctrl_request() {
    ...
	case PD_CTRL_SOFT_RESET:
		port->ams =3D SOFT_RESET_AMS;
		tcpm_set_state(port, SOFT_RESET, 0);
		break;
    ...
}

SOFT_RESET then resets the SOP counters, clears partner source capabilities
and port->explicit_contract, sends PD_CTRL_ACCEPT on TCPC_TX_SOP instead of
TCPC_TX_SOP_PRIME, and restarts SOP power negotiation rather than
acknowledging the cable plug on SOP' and returning to ready_state(port).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_3C8B79F98D6=
19AA20768761A53496A7D6E05@qq.com?part=3D1
