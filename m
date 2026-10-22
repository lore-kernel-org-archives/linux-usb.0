Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676326;
	b=FYIIPzJO69tgyOobfvH0miZZezKmPFflpLD79/LDL+2BrJGLAGWmhls35PiAHeMp++s0
	 REtFa2ozlF29AG52KpvlGxg+Sv4Q/AVB418a8dWh6evttrjOzMfYBcVwal3cW/mJvh74C
	 zOkkCPNtklExtu1x6P31z3h/0+7ob22TtlD4yFvr6AObddAam7vZ7RUePDdgxGI0SpW64
	 a6eY5l4+QTPegiSGRZzQAgEB1U6puuHfHWTjpwXVUuRNooSWfalEs3ZEsUm+DSts6rqI0
	 ZdOazpfZJhUrERVeiOqplQA6NjJmc5nrjuZTWYhUa7KC50Mlbrn5pBAY6Vsp0LFSjXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676326;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ULYZ/55QiRddvfDhSSFtUGP38N9/fKV9BspCQGFIXXY=;
	b=Um1PnU+UKqe+NfEIlt6JZsGfn362YRgYjvnjJvyQL/26FmgSpKfRou8yKrvhyikQYNAd
	 9ZTvCUdGTanr7fT9xslnRtf1yj79PeiKSgsll447f5eHVXqFP0z1lgSjNH0rL8oB/oP7O
	 aQGx3XVJop0olW3LFG8TocI0SWgwCp84ak7zHxl9nsgp82vlj9xJNioALrFMUhmX73kTi
	 2M+rypS/Qnn03gbPCBzn+QM2qoEdwbEIuC4EkjAjseJ0rZwC5w44cXTTpbyDka5tVspJz
	 //V1aVXAP2ttAl4BNP+yb9uU1ItMcyU4APOW5qvdXyqzMnmmb/pnBTbmei46WhT0Beg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ilKJeme/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4A0606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ilKJeme/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535AE1F000C1;
	Thu, 22 Oct 2026 13:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792676325;
	bh=ULYZ/55QiRddvfDhSSFtUGP38N9/fKV9BspCQGFIXXY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ilKJeme/HkOCKSlSoyh0+0sFTsIhd0temS8j1xbMB9yw9gFqB4SKz27idnxkALOWj
	 Y6W9a4l1Qz//YiB4jKEiK5Rb97nxmRu7G6DR/b0EA5C3TN/p9PjALEPAfnreVP0vyf
	 DnzR3ubExHV8met34jnepcdCRVJCM1TuX2G1hgS0ShBd8JMEsHiEbEg/uH19f21+Eq
	 QDiC8b4s+EPMsCIrq1tXzD1FfuwHefifCDPtg8ZAy3MSPAX5SloC3r9AQc/RlhaZsm
	 erm2j/FwJtSQyWWKeGNLxazVt4hpSj0FVNufGG8u8R4S1mMzZB/LKwUIiN3OxlP4M5
	 1+NFtnLXCc9sg==
Message-ID: <sashiko-outbox-181556@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/9] drm/bridge: pass extra events to the HPD
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261022-hpd-irq-events-v6-4-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
 <20261022-hpd-irq-events-v6-4-337ea3ddaa62@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 13:38:44 +0000
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
- [Low] drm/bridge: misplaced hdmi5_bridge_hpd_notify() hunk breaks bisecta=
bility
--

commit c6cd0e6e9f3efd88f40aba30dc7463e072351c53
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

drm/bridge: pass extra events to the HPD callback

This commit adds drm_bridge_hpd_notify_extra() and updates the HPD callback
signature registered via drm_bridge_hpd_enable() to pass extra sink events
such as DisplayPort IRQ_HPD to underlying drivers.

[ ... ]

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
In drivers/gpu/drm/omapdrm/dss/hdmi5.c, hdmi5_bridge_hpd_notify() is assign=
ed
to struct drm_bridge_funcs.hpd_notify rather than registered via
drm_bridge_hpd_enable():

static const struct drm_bridge_funcs hdmi5_bridge_funcs =3D {
	...
	.hpd_notify =3D hdmi5_bridge_hpd_notify,
	.edid_read =3D hdmi5_bridge_edid_read,
};

The hpd_notify callback signature in struct drm_bridge_funcs (in
include/drm/drm_bridge.h) and the other in-tree implementations (including
hdmi4_bridge_hpd_notify() in drivers/gpu/drm/omapdrm/dss/hdmi4.c) were
updated in parent commit 9cf55ff0f96b ("drm/bridge: pass down IRQ_HPD to the
drivers").

Because the hdmi5_bridge_hpd_notify() update landed in this patch instead,
building the kernel at commit 9cf55ff0f96b with CONFIG_DRM_OMAP and
CONFIG_OMAP5_DSS_HDMI enabled fails with an incompatible function pointer t=
ype
error when initializing hdmi5_bridge_funcs.hpd_notify.

Should this hunk be moved into commit 9cf55ff0f96b ("drm/bridge: pass down
IRQ_HPD to the drivers") to preserve bisectability?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-hpd-irq-ev=
ents-v6-0-337ea3ddaa62@oss.qualcomm.com?part=3D4
