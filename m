Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764107;
	b=e6LJdHXuGt40m/zZp3wq1R2V6gRxfzHSXkYDqqOm59rHsuHthKks48InyRYRG1xzTnbr
	 0+6KA2mIZXmkKMfOgMGZ+mkEvHp4BiOSAGhKGf1C4lx7pNkph4aiu+PPR8ozpbq74tppL
	 9XMHIoryPBduxF4JRlvPedI+Ilk0iYRFY7VbmG8UMFI0KDhD5MzCTk48eMrQRD7nvsQHf
	 dt3OYtrBkrHaYRGTZJuWX8PcoKrEuwHUbF4SvZJ+pLspPKjGQ6PRvfhFqn82KV/1C5vnV
	 Dav2fvqO7EqXKTaLQx3Ly4gINLrks8bvP+O5ISnwP34YDc7aYWRiU5Gxd7ZibX+C/iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764107;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pMDvcJ/aH4HAGtBAeASTFzR8JI/KqXaCGla6OGwhCJw=;
	b=Lo3Xb5UPhnwHdhJah5TaA9wSOyhAupdbJ+HQGw08u3/NjTFaqXs2qC7zf3Ewe00aukws
	 v9LKqf4xBSX9WCazPNpKo3uQ/Pt4Kg3duKTPoGl5mctfhV4d8CYwbVohGRdJ82omco6WI
	 XIA83dN4+xJ0HCk5Ei8BCtryLDsCiumwMoghyfkBEMRAEARlUahFgxneoddSe7iCHl18T
	 yby4cu7uUvYbTXE7f4wRagjmIIgMrNxllqEYY533Csur51bzje/iETvUQc074Ee2OBU1F
	 kKPVebEW1ky68aPwMvLLhqjftawWXhVOrT2HNzRpEyzjl9IebSTNdS9otcEZfOdByNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S9yy8vKm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23151606A31A
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 14:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S9yy8vKm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926BE1F01828;
	Fri, 23 Oct 2026 14:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792764107;
	bh=pMDvcJ/aH4HAGtBAeASTFzR8JI/KqXaCGla6OGwhCJw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S9yy8vKmxYUAwzJGuUbnEfBnkIZlgnLL3CS6p6ZgOswB7HyNr+aZplwBTLWxJN6ED
	 kfoCuM8II0hutSNBT4Qob1yZgnLDhcgrFq+WV/99qBuvDXTjjTLV2eaUe61Fsqdzwm
	 81pYU0NZnvdEzY2vfxl2yooxSqh65Db1P9MtAPcrp8JVyTWwarv85+Baep9gpl4pA3
	 n9q7XZ8zDgQ4x/MOsozudKDcjBS03luKmxbTz9jEhV8CQJFJ9DZSTx+hK9Z92u7jog
	 sJDuST7QDGPqJnzNnz6C3NIO2hTsIYKck4z3PXR2KCtLfUgez+dTiRHo2XbMDkjDbF
	 9bGkxTImeA8gg==
Message-ID: <sashiko-outbox-182862@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/9] drm/msm/dp: don't take extra references on
 multiple plug events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261023-hpd-irq-events-v7-6-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
 <20261023-hpd-irq-events-v7-6-57a3aea3f09e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 14:01:46 +0000
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
- [High] drm/msm/dp: msm_dp_hpd_plug_handle() skips hpd_high after detect()
--

commit c63c7584ce165272a5840e2bdd5f618e2bd07d8f
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

drm/msm/dp: don't take extra references on multiple plug events

This commit skips further HPD plug events in msm_dp_hpd_plug_handle() if
dp->plugged is already set, avoiding extra runtime PM references until an
unplug event is received.

> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
> index fa8942922b533..ce919a26fba28 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -412,6 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_displ=
ay_private *dp)
> =20
>  	guard(mutex)(&dp->plugged_lock);
> =20
> +	if (dp->plugged)
> +		return 0;

[Severity: High]
Can this cause msm_dp_display_process_hpd_high() to be skipped altogether
when msm_dp_bridge_detect() runs before msm_dp_hpd_plug_handle()?

In drivers/gpu/drm/display/drm_bridge_connector.c,
drm_bridge_connector_detect_ctx() invokes the bridge detect callback
immediately before notifying HPD:

	if (detect) {
		status =3D detect->funcs->detect(detect, connector);
		...
		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA=
_STATUS);
	}

When a DisplayPort sink is connected and drm_bridge_connector_detect_ctx()
runs (for example during boot-time connector probing, resume, or
DRM_IOCTL_MODE_GETCONNECTOR before an HPD interrupt is processed),
msm_dp_bridge_detect() reads DPCD into a local buffer and sets
priv->plugged =3D true without calling msm_dp_display_process_hpd_high():

	status =3D connector_status_connected;
	priv->plugged =3D true;

When drm_bridge_connector_hpd_notify() -> msm_dp_bridge_hpd_notify() ->
msm_dp_hpd_plug_handle() then runs, or when a subsequent HPD plug event
arrives, this new check sees dp->plugged =3D=3D true and returns early.

Because msm_dp_display_process_hpd_high() is never called, LTTPR,
dp->panel->link_info, connector EDID, dp->link->sink_count, and
dp->audio_supported remain uninitialized, causing msm_dp_bridge_get_modes()
to return 0 modes, msm_dp_display_mode_valid() to reject modes with
MODE_BAD, and msm_dp_display_prepare_link() to fail with -ENOTCONN.

Also, at the end of msm_dp_hpd_plug_handle():

	ret =3D msm_dp_display_process_hpd_high(dp);
	...
	dp->plugged =3D true;

	return ret;

dp->plugged is set to true even when msm_dp_display_process_hpd_high()
fails, which with this early return prevents subsequent HPD plug events
from retrying initialization.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-hpd-irq-ev=
ents-v7-0-57a3aea3f09e@oss.qualcomm.com?part=3D6
