Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676134;
	b=Orwi8yIkSJ2KdiHv4S5eprwnWyMFAn+WCX2oPGxuUVKe2TzAVxdRl42s52pS8rKIFRD6
	 j9SjOz6fiY7PqJFpSGZyhAZMV7dd8c8H0/ZYqCLMi3cCVD4z2l3Cpz+JxC0ZQwvQbmJlL
	 UsccHIkkB4bY8t0F/L5qxvbV7Jtx0NiHXiaEd+EA4vYzqQGmaWt2/HsTjzp/yDltef10c
	 3RIY+OYCwDHLli3h0z1W7jBCy44jVfurVVtjqSklnJwBDoL/+CHSbLlpS5zqSziFptIta
	 Ow0ORT11MMPq/sxClF52q6vg3qgm884m3oEX4a2/IU30c9uyMJSa/ztixrUf2rxmvcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676134;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8msTlnzVM9G6d7FDjt5gVAJzZzx4wSTr7tyRKNMn/As=;
	b=u/fxUm1zsA0r0bf1zt4drkIxPR2TbaJx82gShQVBCqjH/JAB0hkpNeYUYwKa3I0w98RS
	 fO2cGudVYHFiPZkFvXgPxZw9LuXd/FQ1G8vfp4XwiqNr+qF/XafzI6vCDmjIhrOSzFNQp
	 eKyiWasP6nxeOMBOV6KzodCTRY4RCqqgKkYMMP3HN4uddvB9z2geCL+wLy3N3l/6KjHQC
	 9ai9DvHVZRn1HaKHbQLHtl8Ves1+qxu2LI44gcUAtryaYlRjCcLXoQ260XiIKudkuOoX6
	 +Qs5J6sV3AtyYjv31SjTYUigd1s3J6AnXR+IemhAsslTFmLSVoEOBafpj2tkj+1b1Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MpUVWD8T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285ED606A31F
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MpUVWD8T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1011F000C1;
	Thu, 22 Oct 2026 13:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792676133;
	bh=8msTlnzVM9G6d7FDjt5gVAJzZzx4wSTr7tyRKNMn/As=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MpUVWD8TCtRQF6PSOlcjRgt46ubid+GXo6rs7JQfPTDNf7+cd99vWlXHplSOnwcL1
	 Tc9nOsltAFnuZfLQQBF/5FC8WjXT/6h04GLlEl2T3z6tknuR2mniSF0IMr0rUPu0XD
	 DM8RA8g2cP0jdbFTX7S5eMu1x4XnVMkuJA2lgjSe2DZSaZHwHJVKKVhMdBclGUrrz3
	 HPS9Fv0IzP2M15ccHBivPno6VeVbfTxicLA+lG7M2vJXdiKr7y14xiRCvE9TniViv4
	 N/dIuPnY5tvZWvtPsf0/BAOSccGdfB18CawjKHYQiNz1jHs6OyL5kH4p5GDMrar/r2
	 C4ad3lMclnNQg==
Message-ID: <sashiko-outbox-181549@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/9] drm/bridge: pass down IRQ_HPD to the drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261022-hpd-irq-events-v6-3-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
 <20261022-hpd-irq-events-v6-3-337ea3ddaa62@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 13:35:32 +0000
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
- [Low] drm/omap: unupdated hpd_notify() signature in hdmi5_bridge_hpd_noti=
fy()
--

commit 9cf55ff0f96b440ba05665e3db9e82c5372fd640
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

drm/bridge: pass down IRQ_HPD to the drivers

This commit adds an enum drm_connector_dp_event parameter to the
drm_bridge_funcs.hpd_notify callback and updates its callers and bridge
implementations so DisplayPort bridges can handle IRQ_HPD events.

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
> =20
>  	/**
>  	 * @hpd_enable:

[Severity: Low]
While hdmi4_bridge_hpd_notify() in drivers/gpu/drm/omapdrm/dss/hdmi4.c is
updated here, it looks like hdmi5_bridge_hpd_notify() in
drivers/gpu/drm/omapdrm/dss/hdmi5.c still has the old 3-argument signature:

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

Should hdmi5_bridge_hpd_notify() also be updated to accept enum
drm_connector_dp_event event so that builds with CONFIG_OMAP5_DSS_HDMI
enabled do not fail with an incompatible function pointer type error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-hpd-irq-ev=
ents-v6-0-337ea3ddaa62@oss.qualcomm.com?part=3D3
