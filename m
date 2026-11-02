Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629117;
	b=CnZh8t5DwJi9kimO4bSXLrLLWWccUmecDdlhuSuchOam2Sj75uXPXabZ63hGbRwa9FtC
	 CXNb2vgOVhCUdnbvxERSVfBQ8n3TFmTUv+0dQWnqFr236SfxWFBM7KjHTZjL5AlIKccMA
	 b5T5fp6dByCUQ0UFvkfuFz26BD7hPEPfYt5/xopUfIlDXX/9Lj1MWNEMhOEKp/yTSUvbo
	 gymbNKwyD9dsWR1iQxe2TMdE8Gh9DsOkfpZX2uwJtqKl3aJj+usXTUMugkLlgfXc1/T4u
	 N4eETb1OatmpYw7gkPc/41548S63Q+Q3+WHhmFLV1ko+3t+Xkhj+bXBUY9aK4IXaFBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629117;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=boh2d+4RmCfH4PSNQ8XCl8nERIzDKa384odqP8sDJsM=;
	b=OXFtQbRNJX0iqgdMjBVllpfFGtfIh3q4JjHjGWtSeuTycTS1rzcB4apcfea2Mrhpgt/6
	 x4uFPvNz1+M9LrppKeZKXkRbtuhvNYsqez1KusxJOfyXFXwkNl0Gg03kQcCJiwlYuHvmR
	 kEp1JbruxQNO1i6SI1XXzDDzU0zSx7bBmSCmQLGrLmtBghgcd260z6ITTzpPmzI2H8Jbg
	 lpV6lmQ4XWcJ8rgG2oyUBkL1FhAfOSe/uhoQ5W9DRCB7D5EiO/Ym0z5nDhZu792riB5vu
	 S8vZv6Go0lbAfDroKNi/oplGzH9dsr1RoKDZXpynJ/G3X+425tF0R4MXGKv6BckSl1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GpK/rU/Y";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623B3606A327
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 14:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GpK/rU/Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26751F00A16;
	Mon,  2 Nov 2026 14:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629117;
	bh=boh2d+4RmCfH4PSNQ8XCl8nERIzDKa384odqP8sDJsM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GpK/rU/YxMl6tPx4aAtA3AaEr2j72yiQ9Z8Wx55CAK35q3JOYW9sTFgUst5XE7U/1
	 bT9GxgsEgtSPqWVW+A8K67yZ8csimsN2AlHBcCfQnM0AiuA9ThCcMocxCXPNt2349J
	 ZTto/RoWjPXpVYq1KUyypch9HjYi0OC0yJx6NYWn3szjX5G3+Z2yJ5mFPwTIExoLH9
	 TkWzTmowLVrDjJ4Wu3AUKejW6AKlledlzavo8JjP8ZiUhTrw/THmhPpyYxAwp0qhVx
	 4d/CnZRA77kzxjdashjYUf4kjnLKsvqIISdSHSVLO2e0lwdD0K3APsfK9pm3yaY1wC
	 BnhS23ZI4Y48Q==
Message-ID: <sashiko-outbox-193554@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: Complete discovery when the partner
 lacks SVDM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261102-tcpm-discovery-no-svdm-v1-1-54bb9b613065@flipper.net>
References: <20261102-tcpm-discovery-no-svdm-v1-1-54bb9b613065@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 14:18:36 +0000
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
- [Medium] usb: typec: tcpm: SOP' Not_Supported in tcpm_pd_ctrl_request() h=
alts discovery
--

commit f5763c417e2367d11a45635b9af7ac9ca073d24a
Author: Alexey Charkov <alchark@flipper.net>

usb: typec: tcpm: Complete discovery when the partner lacks SVDM support

This commit marks VDM discovery complete when a port partner responds to
Discover Identity or Discover SVIDs over SOP with PD_CTRL_NOT_SUPP,
avoiding an infinite loop of discovery requests.

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index d721baef52104..e21fe544b2d4b 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -3908,6 +3908,17 @@ static void tcpm_pd_ctrl_request(struct tcpm_port =
*port,
>  		case SNK_READY:
>  			if (port->vdm_state > VDM_STATE_READY) {
>  				port->vdm_state =3D VDM_STATE_DONE;
> +				/*
> +				 * A partner without Structured VDM support answers
> +				 * discovery with Not_Supported: there is nothing left
> +				 * to discover, just as after a NAK.
> +				 */
> +				if (type =3D=3D PD_CTRL_NOT_SUPP &&
> +				    rx_sop_type =3D=3D TCPC_TX_SOP &&
> +				    (port->ams =3D=3D DISCOVER_IDENTITY ||
> +				     port->ams =3D=3D DISCOVER_SVIDS))
> +					tcpm_update_vdm_discovery_state(port,
> +									VDM_DISCOVERY_COMPLETE);

[Severity: Medium]
The commit message notes that a Not_Supported reply from the cable plug is
left alone so that it cannot cut short discovery of the partner. However, i=
f a
cable plug replies with PD_CTRL_NOT_SUPP (rx_sop_type =3D=3D TCPC_TX_SOP_PR=
IME) in
tcpm_pd_ctrl_request(), doesn't leaving port->vdm_discovery_state unchanged
still stall partner discovery and repeatedly re-send the SOP' request?

Specifically, after the partner ACKs SOP CMD_DISCOVER_IDENT, tcpm_pd_svdm()
sets port->vdm_discovery_state to VDM_DISCOVERY_PARTNER_IDENT and probes SO=
P'
before discovering the partner's SVIDs:

drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_svdm() {
    ...
	tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_PARTNER_IDENT);
    ...
	if (IS_ERR_OR_NULL(port->cable) &&
	    tcpm_can_communicate_sop_prime(port)) {
		*response_tx_sop_type =3D TCPC_TX_SOP_PRIME;
		response[0] =3D VDO(USB_SID_PD, 1,
				  typec_get_negotiated_svdm_version(typec),
				  CMD_DISCOVER_IDENT);
		rlen =3D 1;
	} else {
		*response_tx_sop_type =3D TCPC_TX_SOP;
		response[0] =3D VDO(USB_SID_PD, 1,
				  typec_get_negotiated_svdm_version(typec),
				  CMD_DISCOVER_SVID);
		rlen =3D 1;
	}
}

If the cable plug replies to SOP' CMD_DISCOVER_IDENT with PD_CTRL_NOT_SUPP,
tcpm_pd_ctrl_request() finishes the AMS without advancing
port->vdm_discovery_state or queueing SOP CMD_DISCOVER_SVID. Because
port->cable is still NULL, every subsequent run of tcpm_vdm_discovery_work()
will re-send SOP' CMD_DISCOVER_IDENT instead of moving on to partner SVID
discovery:

drivers/usb/typec/tcpm/tcpm.c:tcpm_vdm_discovery_work() {
    ...
	case VDM_DISCOVERY_PARTNER_IDENT:
		if (tcpm_can_communicate_sop_prime(port) && !port->cable) {
			tx_sop_type =3D TCPC_TX_SOP_PRIME;
			msg[0] =3D VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_IDENT);
		} else {
			if (tcpm_can_communicate_sop_prime(port))
				tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_CABLE_IDENT);
			msg[0] =3D VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_SVID);
		}
		break;
}

Similarly, when tcpm_handle_discover_mode() finishes discovering partner mo=
des
and sends SOP' CMD_DISCOVER_SVID in VDM_DISCOVERY_PARTNER_MODES, a
PD_CTRL_NOT_SUPP on SOP' leaves port->vdm_discovery_state in
VDM_DISCOVERY_PARTNER_MODES without calling tcpm_register_partner_altmodes(=
),
causing tcpm_vdm_discovery_work() to repeatedly re-send SOP'
CMD_DISCOVER_SVID.

Should a PD_CTRL_NOT_SUPP on TCPC_TX_SOP_PRIME fall back to SOP discovery in
the same way vdm_run_state_machine() handles SOP' transmission failures in
VDM_STATE_ERR_SEND (advancing to VDM_DISCOVERY_CABLE_IDENT and queueing SOP
CMD_DISCOVER_SVID on DISCOVER_IDENTITY, or calling
tcpm_register_partner_altmodes() and marking VDM_DISCOVERY_COMPLETE on
DISCOVER_SVIDS and DISCOVER_MODES)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-tcpm-disco=
very-no-svdm-v1-1-54bb9b613065@flipper.net?part=3D1
