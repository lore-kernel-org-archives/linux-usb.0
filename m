Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763332;
	b=cTIKfIbt3oyOV9b1VrV8pWLGZFf0MJNNFJW/cMl3DqLijFUmozPZ9fzwwoW90n0Bwlkf
	 gXVKEawzI4SHzMyvzJu2qGSWIh639BChsewMglp06Xn4ApbuWrZ5KAQq8qEue2oL4Uz0i
	 U6LB23HARPToFE6+CnelKXZLzIWa8LCSkTk91mUjcYnLCCreG2g+nXiMvFWKGUPqpSmnL
	 EqAKdBt+zilw3LlSgiu6dldge/dDkI+BGbHNBvrf/5qX0xdUcUXvcqOAMZGA3aSzXNAza
	 AosWVStvkcAufyGR60gf4YeQvMAWzHmpnFFurOnwXvQ/JfmSKDA36u2HF0/FONxk0GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763332;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MQWn9R/Sdm3duYbyKyFhG1I7K4uNuiysT7qdpbhR5Ss=;
	b=G61ppcV6G65NQExxQgo/GLShR/SMLy34nChVTksiKvcRn8Kp9mCWh17+IhaFkAhdC5+Y
	 nvFIzcxGrHar1tR2Y3puSLJAgS0KCDBOzg+3Y06CE4Plwcedn3uhtrLOnGS5lXgdGpikX
	 VVrz4BfhEk35T01gFbSBGiZpMIvkr6sDAnutUSLlK7EjrboLtPHYstaCiTk6nTObd8Wme
	 IS9nkFyqYDO8K4j3BcAqGNp2qDityXDLY4m+YqtiDKH2p65USk0S9eGI91cUhsFZkKoqA
	 aZh7+0p5OJ4/KFCb8maKsj8YDb4ZxaT8sXShCwFdedUbcHBYp146DVJk6aSXHSHYcuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jzuAhy+/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D66606A31A
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jzuAhy+/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56951F01825;
	Fri, 23 Oct 2026 13:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792763331;
	bh=MQWn9R/Sdm3duYbyKyFhG1I7K4uNuiysT7qdpbhR5Ss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jzuAhy+/LdhVme5k+4ElEyE3+af0LcLSkSe0Ym0GA1n6rPqgtftNmI6Atnut0tFBT
	 nkDzNIkbXo/yn0dwcmOlmITxJqrKILt33epzd7M9Aiat0IYApoXbot/5FzJlbzC73X
	 wRCWSevgUmjn4miJcU3xaGq8jiYL0CA8cmL+I2ERd3KdC6enPr1wpZJcYvj4m0yBzW
	 swIVSSCC22v/p5FFaK47YMIY16y4fEdWmon6yZKOhYtb/gaOC/DJLs3cwqsT+6q4rb
	 3zP+ukqGVbOYQ5ytdr6anm+Ecx47Bw3wiVB75DGaJiVMqhJMWcZLB7V7Pkl+wcIPKY
	 M6AzllWsghiIA==
Message-ID: <sashiko-outbox-182852@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/9] drm/bridge: pass down IRQ_HPD to the drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261023-hpd-irq-events-v7-3-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
 <20261023-hpd-irq-events-v7-3-57a3aea3f09e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 13:48:50 +0000
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
- [Low] drm/omap: missing event arg in hdmi5_bridge_hpd_notify() breaks bui=
ld
--

commit 8fdca4f38003a51e3d398ac403cb300b423a0ffc
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

drm/bridge: pass down IRQ_HPD to the drivers

This commit adds the enum drm_connector_dp_event parameter to the
drm_bridge_funcs.hpd_notify callback so that DisplayPort IRQ_HPD events can
be passed down to bridge drivers.

[ ... ]

> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdr=
m/dss/hdmi4.c
> index bd6c4d2dcdc86..72972a6fe989b 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> @@ -429,7 +429,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *b=
ridge,
> =20
>  static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
>  				    struct drm_connector *connector,
> -				    enum drm_connector_status status)
> +				    enum drm_connector_status status,
> +				    enum drm_connector_dp_event event)
>  {
>  	struct omap_hdmi *hdmi =3D drm_bridge_to_hdmi(bridge);
> =20
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 1981d24a700d2..6382ef5f1ea28 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -509,7 +509,8 @@ struct drm_bridge_funcs {
>  	 */
>  	void (*hpd_notify)(struct drm_bridge *bridge,
>  			   struct drm_connector *connector,
> -			   enum drm_connector_status status);
> +			   enum drm_connector_status status,
> +			   enum drm_connector_dp_event event);

[Severity: Low]
Does this break compilation when CONFIG_OMAP5_DSS_HDMI is enabled?

While hdmi4_bridge_hpd_notify() in drivers/gpu/drm/omapdrm/dss/hdmi4.c is
updated here, hdmi5_bridge_hpd_notify() in drivers/gpu/drm/omapdrm/dss/hdmi=
5.c
still retains the old 3-argument signature:

drivers/gpu/drm/omapdrm/dss/hdmi5.c:
static void hdmi5_bridge_hpd_notify(struct drm_bridge *bridge,
				    struct drm_connector *connector,
				    enum drm_connector_status status)
{
	struct omap_hdmi *hdmi =3D drm_bridge_to_hdmi(bridge);

	hdmi_audio_hpd_notify(hdmi, status);
}
...
static const struct drm_bridge_funcs hdmi5_bridge_funcs =3D {
	...
	.hpd_notify =3D hdmi5_bridge_hpd_notify,
	.edid_read =3D hdmi5_bridge_edid_read,
};

Assigning hdmi5_bridge_hpd_notify to hdmi5_bridge_funcs.hpd_notify causes an
incompatible pointer type error during compilation when CONFIG_OMAP5_DSS_HD=
MI
is enabled, and also results in a function signature mismatch when
drm_bridge_connector_hpd_notify() invokes bridge->funcs->hpd_notify().

It looks like the hunk updating hdmi5_bridge_hpd_notify() ended up in the
subsequent commit c49a65530348 ("drm/bridge: pass extra events to the HPD
callback"). Should that change be moved into this commit so that the tree
remains bisectable?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-hpd-irq-ev=
ents-v7-0-57a3aea3f09e@oss.qualcomm.com?part=3D3
