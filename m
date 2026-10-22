Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676786;
	b=i+r5DUQNwSIgI5dPJF9d2pCPxKQF1u/DoOi4r5nBMY1ZgwCn5OcqukxKCKIyTG5p2Khh
	 YW+OGWhRI7SV/bVx97tCE0Y46zTdmKjeEusth773NWl6Mkxy2L1GFoSIag9IibSoYzkb3
	 vUBpUAZDaNGc9MLPdEeDP2IjbPpNnzJ+caTDQpVWwBN6NXuATqNQ0+MBL8m+/2jHDSkvy
	 5LQ1zpB0ashYxhPOkUzS8YY0E9MQhigNi3612xvN36Qvq7G2OLTSqpOFfe3JcZllB/Ae4
	 Sfvqt8kWovIhTeiGIstFRal3Tkmy/HKyUJPlOe0LadBBbdEGrprBiSfhb8k4h8dYUxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676786;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xlXgzCsk7GWchCuQqi932QWkmLMSYvgwRHNnNOUqMyk=;
	b=C1y9Fz5fpmUTQmZP+TOQWan7F2YWWa/ukoIi09DeZtHddw1WVHmZcgHNQb1I4DXusrXz
	 j0UdsESn00tGKU0qnZ3YwEmWG2z9TpFqgCv3QF/Uq4GdXrsOXbC/vnYMGVDui/gnpu2iS
	 PBMoYCwqXQox377CqnpVDsAxTUHlp26aC06B8UiAvYrvECldvf/c9cOrxuPsQV0Cq46dh
	 q7db/tADr4jGt+01c0B8MHmAHBMih/W9IAE5bMIhPfidCl8LWFvc9HzaSiH69voULH/io
	 X8bjXa1YwayxP631ZRBAJS+WPvRt3vytwAyn8mY6xfLkycOgzAZMRmyk2lIS6bvtziQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c1It2CFc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F62660A6F76
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c1It2CFc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DCE1F000C5;
	Thu, 22 Oct 2026 13:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792676785;
	bh=xlXgzCsk7GWchCuQqi932QWkmLMSYvgwRHNnNOUqMyk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c1It2CFcNVsUsxIjhOXYoGtk1vffbxX0dImWtPkqQB9u/6Se7Rv88QnpksdYGTi0y
	 1okUY76ZrahqsLYxLTaaK5dbzjg2+y381MY70LUvCzkde3qPvKZ9SjPtA43sjYihTR
	 CcBXx1EV7wkZ8JARlZVtUsbvzlmY+r6O4/I9ShbVWJLPgSAwb7SrFYXCvFGuFHUuBq
	 XkUV2sCJbOwOmyK4KiJIfuvYKbVecojiAb65dhOfmVJ5OOty0OhsBZCipyg5BiQY6G
	 GPIdZrN+hUid75bZA2lHcBqWcQzWf7izwwE/WFHdVuuoLKi2r4KS7noFePMDQfu+Ep
	 6RqFRjzVwlN7Q==
Message-ID: <sashiko-outbox-181565@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/9] drm/msm/dp: don't take extra references on
 multiple plug events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261022-hpd-irq-events-v6-6-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
 <20261022-hpd-irq-events-v6-6-337ea3ddaa62@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 13:46:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/msm/dp: skipped HPD high processing in msm_dp_hpd_plug_handle()
- [Medium] drm/msm/dp: runtime PM reference leak in msm_dp_bridge_detect()
--

commit 1182d7f2f2e876c63dd6756de1f85227702b93b4
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

drm/msm/dp: don't take extra references on multiple plug events

This commit skips subsequent HPD plug events in msm_dp_hpd_plug_handle() wh=
en
dp->plugged is already set so that extra runtime PM references are not taken
before an unplug event arrives.

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
Can returning early here when dp->plugged is true cause
msm_dp_display_process_hpd_high() to be skipped completely when a display is
connected?

In drivers/gpu/drm/display/drm_bridge_connector.c,
drm_bridge_connector_detect_ctx() invokes the bridge detect callback before
notifying HPD:

drm_bridge_connector_detect_ctx()
    detect->funcs->detect() -> msm_dp_bridge_detect()
    drm_bridge_connector_hpd_notify()
        -> msm_dp_bridge_hpd_notify()
        -> msm_dp_hpd_plug_handle()

When msm_dp_bridge_detect() in drivers/gpu/drm/msm/dp/dp_display.c runs
first (for instance at boot or resume when a monitor is already connected, =
or
during connector probing before the threaded HPD IRQ runs), it reads the DP=
CD
capabilities into a local buffer and sets priv->plugged =3D true without
calling msm_dp_display_process_hpd_high():

drivers/gpu/drm/msm/dp/dp_display.c:msm_dp_bridge_detect() {
    ...
	status =3D connector_status_connected;
	priv->plugged =3D true;
    ...
}

When msm_dp_hpd_plug_handle() is then called, it sees dp->plugged =3D=3D tr=
ue and
returns 0 immediately.

Similarly, if msm_dp_hpd_plug_handle() runs first and
msm_dp_display_process_hpd_high() returns an error (such as when a branch
device is connected with sink_count =3D=3D 0 or on a transient AUX error),
msm_dp_hpd_plug_handle() still sets dp->plugged =3D true at the end of the
function:

drivers/gpu/drm/msm/dp/dp_display.c:msm_dp_hpd_plug_handle() {
    ...
	ret =3D msm_dp_display_process_hpd_high(dp);

	drm_dbg_dp(dp->drm_dev, "After, type=3D%d sink_count=3D%d\n",
			dp->msm_dp_display.connector_type,
			dp->link->sink_count);

	dp->plugged =3D true;

	return ret;
}

Because msm_dp_display_process_hpd_high() is never completed in either case,
will dp->panel->link_info, LTTPR state, the connector EDID, and
dp->link->sink_count remain uninitialized?

[Severity: Medium]
How does this single-reference model in msm_dp_hpd_plug_handle() interact
with the runtime PM reference handling in msm_dp_bridge_detect()?

In drivers/gpu/drm/msm/dp/dp_display.c, msm_dp_bridge_detect()
unconditionally acquires a runtime PM reference on &dp->pdev->dev at entry
and only releases it at the end if !priv->plugged:

drivers/gpu/drm/msm/dp/dp_display.c:msm_dp_bridge_detect() {
	guard(mutex)(&priv->plugged_lock);
	ret =3D pm_runtime_resume_and_get(&dp->pdev->dev);
	if (ret) {
		DRM_ERROR("failed to pm_runtime_resume\n");
		return status;
	}
    ...
	status =3D connector_status_connected;
	priv->plugged =3D true;
    ...
end:
	if (!priv->plugged) {
		if (phy_deinit) {
			msm_dp_aux_enable_xfers(priv->aux, false);
			msm_dp_display_host_phy_exit(priv);
		}

		pm_runtime_put_sync(&dp->pdev->dev);
	}

	return status;
}

When a sink is connected and priv->plugged is already true, won't every call
to msm_dp_bridge_detect() leak an extra runtime PM reference on
&dp->pdev->dev because msm_dp_hpd_unplug_handle() only calls
pm_runtime_put_sync(&pdev->dev) once when transitioning dp->plugged from tr=
ue
to false?

Conversely, if priv->plugged is true (holding a reference from
msm_dp_hpd_plug_handle()) and drm_dp_read_dpcd_caps() or drm_dp_read_desc()
fails inside msm_dp_bridge_detect(), msm_dp_bridge_detect() sets
priv->plugged =3D false and only drops the reference it took at entry, caus=
ing
msm_dp_hpd_unplug_handle() to return early on !dp->plugged without releasing
the reference acquired by msm_dp_hpd_plug_handle().

> +
>  	ret =3D pm_runtime_resume_and_get(&pdev->dev);
>  	if (ret) {
>  		DRM_ERROR("failed to pm_runtime_resume\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-hpd-irq-ev=
ents-v6-0-337ea3ddaa62@oss.qualcomm.com?part=3D6
