Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308214;
	b=MfA3E3sU6OSJN+IQ/0xZAIkK29BH+y3TmdRyaHqJwChLEpICAJ1MMiw7MJnPW+Ob9OhQ
	 DTUQt8Hb0daoPJmo4zYKCgsawu5DLyexv5lrgnOlTajH+zeFOZX81BwSxMVCsIt4hQLSX
	 HMolww7A+cV3gmHk1uFbyKjWI2pBgTrmaFkOwiS8qBW5X1zDGjtFxeUOevCSzI4VwJ/sO
	 LrlioTo6YiS9egSJAdnEisvMf32Wr4ao2K/y7nlgCrzf2/29GcBr4ucK48pjkX8eqr/Dk
	 Kb/1HPbuPa5qE096nAz6WxmFB/Fy6yYvYoJ3vCUA6XsKrF9RHJcC/VIToox6neoIR/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308214;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wI0FBdowjVPutbokNzhGMtOg0J+zuZaZ8zzk8StJIfY=;
	b=k/X8RT/VrmcGIMxKYlZSmaYV0Su3hhh9x0Ef4kQu96t2RqQb8gUc6n77nmrcO0r5XBgp
	 MDTAB/HUWkndiJK6T0g+9/EQ0eiBsABy3i/SfWJ83Hx+HvDBdAQSxtDowxYVNM8RkPF/i
	 r91BxFqYnHxr7ULmxSq6sdTnp7IAbnApj0sSI5beEuDi744El50B69EH1iOnZ49SnH69P
	 GnDiyncODb5WmToxsAMjcpCR4uup69GNwucC9myNhsIyDF8wqIzizllpT7l4+GaFhuphl
	 DU0cVqlYZiDVTxf0GBaKwLpAbT4aCUqRWZ8RyGIX/aPvRa9j6OCp/0lb2Xv+Xgk14Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d+dHQ9Ip;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC5D606A330;
	Tue, 10 Nov 2026 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d+dHQ9Ip
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692641F0089F;
	Tue, 10 Nov 2026 10:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794308213;
	bh=wI0FBdowjVPutbokNzhGMtOg0J+zuZaZ8zzk8StJIfY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d+dHQ9Ip4RsKJSXkCwydwZwmnvTduDaw/6k/C8/mWq4Z55jfr18JfMv7D/LQWYE7x
	 +r4cu1vnh8epvoTYnyXF2MrFnctZKIZ9U/5jOizgX2RKK4ggbC4j6WfF3k+vIopg4S
	 nGHX7ove7FdCoL6nNZkEMgqXBlWxEWa7/zIOVM/lDeFbH45Bcf43Unn8u/H+T/eDA0
	 zMeCjd+jiWml0qMS8UOw1akhBvLfvL7nyHa96gH6Ix90QK7vs26JHMvyCiC3YAqBWZ
	 UxkJVaJDGlnJ8iWI3MLy0mkQgqGTA1rdyViBgcg4kQEIU+tLyaICsWIbxaW5Y5gEvW
	 B2prnDiV6W3TA==
Message-ID: <sashiko-outbox-206907@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] usb: typec: fusb302: Toggle with the default Rp
 current
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-tcpm-attach-reboot-v1-2-7657cc1e2dca@gmail.com>
References: <20261110-tcpm-attach-reboot-v1-0-7657cc1e2dca@gmail.com>
 <20261110-tcpm-attach-reboot-v1-2-7657cc1e2dca@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 10:56:52 +0000
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
- [Medium] usb: typec: fusb302: default Rp kept after attach in
  tcpm_start_toggling()
- [Low] usb: typec: fusb302: missing Fixes trailer for
  tcpm_start_toggling() fix
--

commit acebede2c4487a9e19e13abaaf64491fba2fe4e2
Author: Arun Iyengar <aiyengar1990@gmail.com>

> usb: typec: fusb302: Toggle with the default Rp current
>
> tcpm_start_toggling() programs the Rp current that tcpm asks for, which
> is the current of the source PDO (Rp 3.0A on boards that can source
> 3A) when the port starts toggling from Unattached.SRC, and the default
> current when it starts from Unattached.SNK after a detach.
>
> A Genesys Logic based USB-C to DisplayPort cable connected to the
> Orange Pi 5 is often not detected after a warm reboot: the FUSB302
> toggle state machine raises no interrupt with it while it drives the
> high Rp current, but finds it within seconds once toggling restarts
> with the default current after another device was detached.
>
> Unattached sources may advertise any Rp level, and tcpm sets the
> configured level through set_cc() once the port is attached, so always
> toggle with the default current.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

[Severity: Low]
Since this fixes sink detection when toggling starts from Unattached.SRC,
should this include a Fixes tag?

  Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip drive=
r")

> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fu=
sb302.c
> index 3319f6a2b0c9b..53c5671fe45b1 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -942,10 +942,19 @@ static int tcpm_start_toggling(struct tcpc_dev *dev,
>  	}
> =20
>  	mutex_lock(&chip->lock);
> -	ret =3D fusb302_set_src_current(chip, cc_src_current[cc]);
> +	/*
> +	 * Look for a partner with the default USB current advertisement.
> +	 * Some sinks (seen with a Genesys Logic based USB-C to DisplayPort
> +	 * cable) present an Rd that the FUSB302 toggle state machine does
> +	 * not detect while it drives the high (3.0 A) Rp current, so they
> +	 * are only found when toggling starts from the sink side. Unattached
> +	 * sources may advertise any Rp level, and tcpm sets the configured
> +	 * level through set_cc() once the port is attached.
> +	 */
> +	ret =3D fusb302_set_src_current(chip, SRC_CURRENT_DEFAULT);
>  	if (ret < 0) {
>  		fusb302_log(chip, "unable to set src current %s, ret=3D%d",
> -			    typec_cc_status_name[cc], ret);
> +			    typec_cc_status_name[TYPEC_CC_RP_DEF], ret);
>  		goto done;
>  	}

[Severity: Medium]
Can this leave the FUSB302 advertising SRC_CURRENT_DEFAULT on the CC line
after a sink attaches, even when the port is configured for 1.5A or 3.0A?

When toggling finishes as source, fusb302_handle_togdone_src() enables the
CC pull-up without changing chip->src_current_status or FUSB_REG_CONTROL0.
On attach, tcpm_src_attach() does not call tcpm_set_cc().  In SRC_STARTUP,
non-PD ports (!port->pd_supported) jump directly to SRC_READY with
port->ams =3D=3D NONE_AMS, so neither tcpm_ams_start() nor tcpm_ams_finish()
ever calls tcpm_set_cc(), leaving the hardware stuck at default Rp for the
entire connection while typec_set_pwr_opmode() reports 1.5A or 3.0A:

drivers/usb/typec/tcpm/tcpm.c:run_state_machine() {
    ...
	case SRC_STARTUP:
		opmode =3D  tcpm_get_pwr_opmode(tcpm_rp_cc(port));
		typec_set_pwr_opmode(port->typec_port, opmode);
    ...
		if (!port->pd_supported) {
			tcpm_set_state(port, SRC_READY, 0);
			break;
		}
		tcpm_ams_start(port, POWER_NEGOTIATION);
    ...
}

Similarly, debug and audio accessory attach paths (tcpm_acc_attach())
never call tcpm_set_cc(), and on PD 2.0 ports (port->negotiated_rev <
PD_REV30) connected to a non-PD sink, tcpm_ams_start() skips
tcpm_set_cc(port, SINK_TX_NG) so default Rp remains advertised throughout
all SRC_SEND_CAPABILITIES retries until SRC_READY calls tcpm_ams_finish().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-tcpm-attac=
h-reboot-v1-0-7657cc1e2dca@gmail.com?part=3D2
