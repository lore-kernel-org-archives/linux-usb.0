Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604230;
	b=RPJP0w6sj3vZcAt6LsVXgjEdzHr0p3B2woMeJAt0zLrAECSKWHMWuqQfznXP9Eed0Z69
	 HYeLRpiP5l9Po+o6C7IRcTl1pXszdae6Eh6L8pWwRoudsXm4zm3wAyilNtIxk9hL5uJau
	 AcfTbakFbI+8s6uxFwxtPxVnWu0hvXqmFhfHsGbT9Qowk7yCRo4MgrQVWPSlW6+OvmqcT
	 4U8P9LqycDV6753ge3zPWKLdS/B4+MrSi3B5Ocl/Kt0UgwjVSqBAN6+Q8dsSgimZoAVqr
	 Y0/qGwGviCKmBq0/l2c8qWSPzfXkv5m8qRYjyZrs7r1cwc0LbiiPML2iu9Dnz6z5hOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604230;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PWiFRPl03d923DsfM52Y5JXih19mCZ5IC2FJIGyjGiQ=;
	b=rx3p3f0r4ukyKaqp3Qz8xjxd0qdWKIvgAMpp1hAlbNHOUsb00/UHSkCZLX2AW806EjEs
	 KDFI6T4etZFFuxQSujFXryZxtHsAtl0QAQBtfGzwIoGvAad6UnmOffgdb/kmOqRxfkCZR
	 z0LoYqIgVvhH1hpZ+0aKxHWJGj3IgZXa92Mv+Sd8w4PGWQ4/lSLkq2fa5zYgtNuVU4XxP
	 TK6lCUlWUUxoj+jaw96uaalpoYuF3P0xwe+RGJR2bPX49gPhzYxGPB/OAerttK6r/Q9WJ
	 cDnk6I+M6bvPMcJ6RhCqBy4yZQSNpC38hcX1Yhfd3w+504sPJSC8x9l1vlYcI3VxE1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=khCSdhBr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A35A606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 10:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=khCSdhBr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EDE1F000C0;
	Wed, 25 Nov 2026 10:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795604229;
	bh=PWiFRPl03d923DsfM52Y5JXih19mCZ5IC2FJIGyjGiQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=khCSdhBrVPlx2KYRQ6T2z8kpSHaUXEdqS1REObCE/LJA/BxylqbkyYJkpOpAogWV2
	 MPa4El1h8Qt9USu4TR3N1BRJhWnLZHKlS+TSqJogsSTZS2A6p13f0qiRXOovNqUfAm
	 2TfqXKA7lRlDE9BXTMvgEq8US4Mq9zIEjfjnAxg32u8NTAI0oQqfZPM3vTwkpIWJLs
	 XbAS14Ftr5s/RD6CE75gP2h4B0CPOGgZYidDflRGn9YkLspJnNkvCYOo8U0TfT315t
	 keghhivl3zOaRDb/v8L8UTwEaPeIDW8PeahzTpKsWx82Z6+gefU8iCuyKhzQfiUqyv
	 210eDPjG83oYg==
Message-ID: <sashiko-outbox-233177@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] usb: typec: tcpm: unregister partner altmodes
 before re-discovery
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125-topic-tcpm-core-fixes-v2-1-aede2a3471f4@linaro.org>
References: <20261125-topic-tcpm-core-fixes-v2-0-aede2a3471f4@linaro.org>
 <20261125-topic-tcpm-core-fixes-v2-1-aede2a3471f4@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 10:57:09 +0000
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
- [High] usb: typec: tcpm: plug_prime_altmode leak and UAF in
  svdm_consume_identity()
--

commit e6d007de8d361cfdd76de81da17f0dc6714fe900
Author: Neil Armstrong <neil.armstrong@linaro.org>

usb: typec: tcpm: unregister partner altmodes before re-discovery

This commit adds a helper to unregister partner alternate modes before
svdm_consume_identity() clears port->mode_data, and reuses it in
tcpm_unregister_altmodes().

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index ca38e05f831a7..20e18bca649eb 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -2068,6 +2068,17 @@ static int tcpm_queue_vdm_unlocked(struct tcpm_por=
t *port, const u32 header,
>  	return ret;
>  }
> =20
> +static void tcpm_unregister_partner_altmodes(struct tcpm_port *port)
> +{
> +	struct pd_mode_data *modep =3D &port->mode_data;
> +	int i;
> +
> +	for (i =3D 0; i < modep->altmodes && i < ALTMODE_DISCOVERY_MAX; i++) {
> +		typec_unregister_altmode(port->partner_altmode[i]);
> +		port->partner_altmode[i] =3D NULL;
> +	}
> +}
> +
>  static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, =
int cnt)
>  {
>  	u32 vdo =3D p[VDO_INDEX_IDH];
> @@ -2076,6 +2087,7 @@ static void svdm_consume_identity(struct tcpm_port =
*port, const u32 *p, int cnt)
>  	if (cnt <=3D VDO_INDEX_PRODUCT)
>  		return;
> =20
> +	tcpm_unregister_partner_altmodes(port);
>  	memset(&port->mode_data, 0, sizeof(port->mode_data));

[Severity: High]
Should svdm_consume_identity() call tcpm_unregister_altmodes(port) instead
so that port->plug_prime_altmode[] and port->mode_data_prime are also
cleaned up before re-discovery?

When tcpm_cable_vdm_supported(port) is true, partner altmode drivers such
as dp_altmode_probe() allocate their private state with
devm_kzalloc_obj(&alt->dev, *dp) on the partner altmode device and attach
it to the plug altmode via typec_altmode_set_drvdata(plug, dp) and
plug->cable_ops.  Unregistering only port->partner_altmode[] frees that
devm state while leaving port->plug_prime_altmode[] registered and
reachable through typec_cable_altmode_vdm(), causing a use-after-free.

Once SOP Discover Modes finishes, tcpm_handle_discover_mode() also chains
into SOP' CMD_DISCOVER_SVID and CMD_DISCOVER_MODES whenever
tcpm_cable_vdm_supported(port) is true:

drivers/usb/typec/tcpm/tcpm.c:tcpm_handle_discover_mode() {
	...
		if (tcpm_cable_vdm_supported(port)) {
			*response_tx_sop_type =3D TCPC_TX_SOP_PRIME;
			response[0] =3D VDO(USB_SID_PD, 1,
					  typec_get_cable_svdm_version(typec),
					  CMD_DISCOVER_SVID);
			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_PARTNER_MODES);
			return 1;
		}
	...
		tcpm_register_plug_altmodes(port);
		tcpm_register_partner_altmodes(port);
	...
}

Because port->mode_data_prime was not zeroed and
port->plug_prime_altmode[] was not unregistered, SOP' discovery appends to
stale mode_data_prime counts and tcpm_register_plug_altmodes() overwrites
port->plug_prime_altmode[], leaking the previous plug altmode devices.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-topic-tcpm=
-core-fixes-v2-0-aede2a3471f4@linaro.org?part=3D1
