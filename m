Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763357;
	b=DCYMjCwX41rw2zBEAUOGlhte6HbGEI+V2GCD9/vV4fh+CVGNi85r64HPaa9Dglsm4nqF
	 IbNXd+DoxkCiCf+phsIEiw6mSSuCOchadOylqVZTZ3YS66p6SwfcqhQk6PWJnDd+YnwDj
	 ZyeAv8VmctiZXN36ypHjvZsRyweYGN7TPplJaSLZiMMHuLoueJxilQr+N8bFaQEBypRUM
	 A2MR1lwOiY5doclokdvAYPZZzLFl8Oz7HGwteOjZR1NPdapqaxOMegeyn9pDD/7xHAeLe
	 KfMJrwJnug9DYDegIlr07rNBDGds6lFP8c3uincG9Ct30VYPnOFXEe4LRoMJDXGKwQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763357;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=J5jLfRgfnru1f4M7HoIviw9jPxy8kFRXF0YNC8/6MY0=;
	b=0yHq+wyyL4jplNecvqbKAf4q/KMqxob10cFW9FLeewVFrcuk6Tg3oIdxzSjou87y3nTF
	 txoT3NIR1JpB5OyuH9L2xZSK1pYggF1cwpzdMQiOBlP9k0ViO13rsP28iwoQ3npBUz+L/
	 sUJAZCf7+ssNK7/TaBsCQRQcNmDPBaCEeVDJcAnTvepM+dyCggWLUaX/CQDLDBcOvboIk
	 id+UOi9rrJHchCJQk/Oj/bupV5qC/szbAN/m+fgRid4SX9KRs90erUgQeaO7xfcAnLOct
	 0jf51jZcsi67KehkeRClXFhAWoR2kQz9G6wqIbqj+wjulPpiXSzUHV/Ka3RxJzbgc/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSLYybxi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5936F606A31E
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSLYybxi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03D11F01828;
	Fri, 23 Oct 2026 13:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792763357;
	bh=J5jLfRgfnru1f4M7HoIviw9jPxy8kFRXF0YNC8/6MY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PSLYybxiSnX2XIw1BFiB6WDnlAN5VaCR9EuyW/3jTSvjvew/o7UuLgHMxkxzqaNvx
	 nne7wobIlNsoiXs6RC22errueIbEOJCOhO51HLdXHXJ9CooqLXGX5tOCiLR7uSlKal
	 w5t7iH4+proFiBY8sVJxJaV9jd6F8xp2OVxG+K/fEku8q7Jom+tFKfrLUAA+Vgakfe
	 MnSmIQ0lZCfz1QcCWNrzzcDxGLsdzQvr9fNq4U4r3IMhE2UjIUNbAtREivaQv6ucEk
	 b42JRIFmPdNu7CWbG0Iml2dfk1vYiyKbPpfqvT9e79ucw8k7N4kGCiahmwS7Rv9czp
	 TNEIHTuDREyuQ==
Message-ID: <sashiko-outbox-182853@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/9] drm/bridge: pass extra events to the HPD
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261023-hpd-irq-events-v7-4-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
 <20261023-hpd-irq-events-v7-4-57a3aea3f09e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 13:49:16 +0000
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
- [Low] drm/bridge: misplaced hdmi5_bridge_hpd_notify() hunk breaks bisecti=
on
--

commit c49a65530348caef1493cae37ceadb5599e2733e
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

drm/bridge: pass extra events to the HPD callback

This commit introduces drm_bridge_hpd_notify_extra() and updates the HPD
callback signature registered via drm_bridge_hpd_enable() to pass extra
DisplayPort sink events to underlying drivers.

> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdr=
m/dss/hdmi5.c
> index c542ba6ce7d32..a21f9355594cc 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> @@ -427,7 +427,8 @@ static void hdmi5_bridge_disable(struct drm_bridge *b=
ridge,
> =20
>  static void hdmi5_bridge_hpd_notify(struct drm_bridge *bridge,
>  				    struct drm_connector *connector,
> -				    enum drm_connector_status status)
> +				    enum drm_connector_status status,
> +				    enum drm_connector_dp_event event)
>  {
>  	struct omap_hdmi *hdmi =3D drm_bridge_to_hdmi(bridge);
> =20

[Severity: Low]
Should this change to hdmi5_bridge_hpd_notify() in
drivers/gpu/drm/omapdrm/dss/hdmi5.c be squashed into the preceding commit
8fdca4f38003 ("drm/bridge: pass down IRQ_HPD to the drivers") instead?

hdmi5_bridge_hpd_notify() is assigned to struct drm_bridge_funcs.hpd_notify
in hdmi5_bridge_funcs rather than passed to drm_bridge_hpd_enable():

drivers/gpu/drm/omapdrm/dss/hdmi5.c:
static const struct drm_bridge_funcs hdmi5_bridge_funcs =3D {
	...
	.hpd_notify =3D hdmi5_bridge_hpd_notify,
};

Because struct drm_bridge_funcs.hpd_notify in include/drm/drm_bridge.h was
updated to take the enum drm_connector_dp_event parameter in commit
8fdca4f38003 (alongside hdmi4_bridge_hpd_notify()), leaving the
hdmi5_bridge_hpd_notify() update until this commit causes an incompatible
function pointer type build failure at commit 8fdca4f38003 when building
drivers/gpu/drm/omapdrm/dss/hdmi5.c, breaking bisection.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-hpd-irq-ev=
ents-v7-0-57a3aea3f09e@oss.qualcomm.com?part=3D4
