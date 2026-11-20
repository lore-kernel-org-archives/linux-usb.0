Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169679;
	b=xMG1N5FI+c+HaUPZFpEy5o7JIK2BhUAh38TNkmIKXDvmNLCXJwWpbe0p3JZWQXoqYDLp
	 T98Rz1LVcJ0X2Rd3de39SLb6l8jZSuDABeYspG1IKsrKH6QooHSHJ2Csuahb+gDOkM45M
	 Z+dEn4MplSm33JgyxXZwyEYrkht2gHVSD77jIXPyZY6LiRfs+5N0VeYl31c0p6sEPApuf
	 kAKW5y5ZkVaNgcIJsseV2geTN7nQCzCBpeiSeJ6TpxfMY4QMdPzR1xC3u8ptOYBIY0Uw8
	 Dlc9VMvhKYt7ntcTd5H6/s5ZlUu+nAvWcDyDiTYBruHeCTzAPfbHFBxMH/qYZmXSgoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169679;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WgDhO08N0tXHirPoKP5pomS2Q1z8FN+3rwYdaFdiVkw=;
	b=wMLPRHBaAlsSKrdCaMeLksENc3cmOv6gMgFIFMv6q+ei8MF3sCasPDi3BQvPuQJ8RkST
	 chojlV6UqnmFDBrylWovM+FA7K+zDME8x9uqbVU6PUgLBeOwO86Fjc3L7FN42k/hlTtoL
	 oBtnSNQisR2L8nzWMPdQnikC28wM3p66xXm6ZXz2CJIjqRJ4zGOmxjLi2PpBo1C5JIMk3
	 RBJfbaly9aZhwJlmlhOuO3b5LJxxkY03GILdghuKlsuZ5y2FBxOi9gz0pCTBdwA9r5aeu
	 bzati1fMejr+u+k+vMTNEBtx2S+68BdjUe7gC0CsldEEfOE8nyyZNFWpkbC/2Vy/ulw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jzdo+tlf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FDC606A325
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 10:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jzdo+tlf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED461F000CF;
	Fri, 20 Nov 2026 10:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795169678;
	bh=WgDhO08N0tXHirPoKP5pomS2Q1z8FN+3rwYdaFdiVkw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jzdo+tlfEZaVDMsM/t2oUwtWsJBR5cgmcLrpqFJVxst3noq1mm9YPdu6V8bMC2TJM
	 Rf6eLw4AbYuhO/G9MMCQ+zFnolChghAdO55gYQYS1HfJY8sgm667wb5lMtkSTAwsAn
	 +956etgk+C1vlhRZCEFz0wOxMVxhqCY9YwM+VFRUhQiBnXxN0Fi0OKRORqqjKn6Fu1
	 8hNPkOxi8YcTqc227M/ilpJ38AAYKeXK69x/3YObW1fErb3u4Kim6pO5T1708dGy1W
	 Ps+SO9pyupn4SHXRsJhkSJhR/N7Pesa/WdMAFQBi454+cvnxSsH6h6H8UrlslBOk1G
	 vTAz1mW+WpoBw==
Message-ID: <sashiko-outbox-224915@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] usb: typec: tcpm: unregister partner altmodes
 before re-discovery
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120-topic-tcpm-core-fixes-v1-1-c753d1d286bb@linaro.org>
References: <20261120-topic-tcpm-core-fixes-v1-0-c753d1d286bb@linaro.org>
 <20261120-topic-tcpm-core-fixes-v1-1-c753d1d286bb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 10:14:37 +0000
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

commit cc703948c4765e30249455553c02522ac441936b
Author: Neil Armstrong <neil.armstrong@linaro.org>

usb: typec: tcpm: unregister partner altmodes before re-discovery

This commit unregisters existing partner alternate modes in
svdm_consume_identity() before clearing port->mode_data on re-discovery,
sharing a new tcpm_unregister_partner_altmodes() helper with
tcpm_unregister_altmodes().

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index bb90211660cae..1d007e59a2bf9 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -2060,6 +2060,17 @@ static int tcpm_queue_vdm_unlocked(struct tcpm_por=
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
> @@ -2068,6 +2079,7 @@ static void svdm_consume_identity(struct tcpm_port =
*port, const u32 *p, int cnt)
>  	if (cnt <=3D VDO_INDEX_PRODUCT)
>  		return;
> =20
> +	tcpm_unregister_partner_altmodes(port);
>  	memset(&port->mode_data, 0, sizeof(port->mode_data));

[Severity: High]
Should svdm_consume_identity() call tcpm_unregister_altmodes(port) so that
port->plug_prime_altmode[] is unregistered and port->mode_data_prime is
cleared as well?

When tcpm_cable_vdm_supported(port) is true, completing SOP Discover Modes
in tcpm_handle_discover_mode() automatically chains into SOP' Discover
SVIDs and Discover Modes and then calls tcpm_register_plug_altmodes(),
which appends to stale port->mode_data_prime counts and overwrites
port->plug_prime_altmode[] without unregistering the previous plug altmode
devices.

In addition, partner altmode drivers such as dp_altmode_probe() allocate
their private struct with devm_kzalloc_obj(&alt->dev, *dp) on the partner
altmode device and attach it to the plug altmode via
typec_altmode_set_drvdata(plug, dp) and plug->cable_ops.  Unregistering
only port->partner_altmode[] frees that driver data while leaving
port->plug_prime_altmode[] registered with a dangling drvdata pointer
until re-discovery finishes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-topic-tcpm=
-core-fixes-v1-0-c753d1d286bb@linaro.org?part=3D1
