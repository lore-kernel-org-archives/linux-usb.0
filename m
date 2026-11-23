Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420722;
	b=2qDieyle6BmUGMmi8t3XefiG2AxB3sKW01Yy8oiTVSHyMUq4fAWTnETB/kwqUAGS2OCD
	 vfzoDx0J35k4tLdGLDF01BsfqDAdxxX4MT+9SudMnpMiwSwCQS/54hc1Fwl/QgmKT4ZYH
	 /+THDgMEDzOUYukSzMNetxqLrcu0nMTwUHayBKS4X19Rg6lDY/pfz/+qU9I9KhOUAGork
	 tT5dqRNLpOjfCxCx2Q8XKIhvJa/zM1oCpyNrmP0UtY2e4RehO43QJJSyL8tKe2o5hOnuw
	 RPXyKV8AMeGBifp0yyI50NskqrqpddfEJZfrCXj/Kb+dN+FF63o1CImRl5T3tzwZtcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420722;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Nj2x6B2qr40CBtMzx44yolcJATXa1LrxrC29sIRVQEM=;
	b=GWXrz93KBeWdScTgu0pw6o2icytMqstOwG15H/N0W64+pOyewUPiv8PbkZI61eeQEjE1
	 p+AR4so8nzx4R+T4d3jpKdYWhigQ7CYK+DRvj7zkO6fMxiI/NXfzcZYfl2c8G0cINVger
	 S4U8DrWN5LfYGbyvc9CENmrgXs7eeM/Ww8kTrfanEiyoybUGoe9uLfcQEe2hJa3pAxFBZ
	 nwoCqRd60WO40kwPqzj9aljNU8Z4sYu/DZLr7SUbmlh8xNxEVASKO6OG1pqnXFaBvuWFL
	 Sy16n3soKzrLuMLVzkWyepn/FOx0qJOL1PWdB6d9YXVaE6D82qjvO1Nbt9JFqE1QOhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bME2W/ek";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6BF606A31A;
	Mon, 23 Nov 2026 07:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bME2W/ek
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4FA1F000C4;
	Mon, 23 Nov 2026 07:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420722;
	bh=Nj2x6B2qr40CBtMzx44yolcJATXa1LrxrC29sIRVQEM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bME2W/ekQtmBYAplpyneLtPXV+5hRLMbWAGQu5680uOoiXZzVBBiGGjfxOYcCwc5A
	 Go90mErmrNIbPDqMu5UIVBHZ1nB/9HKUDw6KGVBMsifZEzyNREyxtV8g6uD1Wt6100
	 A6lzDUjikfEtYrzajhTlbmuzR8YwU9DxfNLh4FjsXFEvp+fDgwImXDVRKdNEi51bQK
	 VxwfDzSnp1ndu14GFJ42p4mM2zByGTUbwGtUceD7fY7cYo+OdUHilBEOMHoa6vkAMs
	 RwOI4fCl76TVL5Qt+7Sf19S1+wS5EcPEgBtXKdSwXfWMGEVDnTxP2+W0rLD1qL1TZD
	 vUQ1iZMxCQk2w==
Message-ID: <sashiko-outbox-228861@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: typec: tcpm: advance vdm_discovery_state on
 Discover Identity Not_Supported
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261123075136.650549-1-xu.yang_2@oss.nxp.com>
References: <20261123075136.650549-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 07:58:41 +0000
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
- [Medium] usb: typec: tcpm: vdm_discovery_state stuck on DISCOVER_SVIDS
  Not_Supported
--

commit 547bf5077436d4ff437ef8c78eb36f03f1e9104c
Author: Xu Yang <xu.yang_2@nxp.com>

usb: typec: tcpm: advance vdm_discovery_state on Discover Identity Not_Supp=
orted

This commit updates port->vdm_discovery_state when PD_CTRL_NOT_SUPP is
received during a DISCOVER_IDENTITY AMS so that discovery does not loop
when communicating with a non-modal partner or cable.

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index bf7fd632d815e..b695908e410e7 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -3913,6 +3913,16 @@ static void tcpm_pd_ctrl_request(struct tcpm_port =
*port,
>  		case SRC_READY:
>  		case SNK_READY:
>  			if (port->vdm_state > VDM_STATE_READY) {
> +				if (port->ams =3D=3D DISCOVER_IDENTITY) {
> +					if (rx_sop_type =3D=3D TCPC_TX_SOP) {
> +						tcpm_update_vdm_discovery_state(port,
> +								VDM_DISCOVERY_COMPLETE);
> +					} else if (rx_sop_type =3D=3D TCPC_TX_SOP_PRIME) {
> +						tcpm_update_vdm_discovery_state(port,
> +								VDM_DISCOVERY_CABLE_IDENT);
> +						mod_vdm_discovery_delayed_work(port, 0);
> +					}
> +				}

[Severity: Medium]
Can port->vdm_discovery_state remain stuck if a partner or cable replies
with PD_CTRL_NOT_SUPP to DISCOVER_SVIDS or DISCOVER_MODES?

When a partner ACKs CMD_DISCOVER_IDENT, tcpm_pd_svdm() and
tcpm_vdm_discovery_work() advance port->vdm_discovery_state to
VDM_DISCOVERY_PARTNER_IDENT or VDM_DISCOVERY_CABLE_IDENT and send
CMD_DISCOVER_SVID (with port->ams =3D=3D DISCOVER_SVIDS) before checking
supports_modal(port).  A partner or cable that supports Discover Identity
but does not support modal operation can therefore reply with
PD_CTRL_NOT_SUPP to CMD_DISCOVER_SVID.

In tcpm_pd_svdm(), CMDT_RSP_NAK marks discovery complete for both
CMD_DISCOVER_IDENT and CMD_DISCOVER_SVID, and vdm_run_state_machine()
handles SOP' errors for CMD_DISCOVER_SVID and CMD_DISCOVER_MODES by
calling tcpm_register_partner_altmodes(port) and advancing to
VDM_DISCOVERY_COMPLETE.  Checking only port->ams =3D=3D DISCOVER_IDENTITY
here leaves port->vdm_discovery_state incomplete on PD_CTRL_NOT_SUPP for
DISCOVER_SVIDS or DISCOVER_MODES, so later entries into SRC_READY or
SNK_READY re-run tcpm_vdm_discovery_work() and deferred partner altmodes
are not registered if an active cable returns PD_CTRL_NOT_SUPP on SOP'.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123075136.6505=
49-1-xu.yang_2@oss.nxp.com?part=3D1
