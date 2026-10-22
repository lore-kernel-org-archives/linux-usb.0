Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676515;
	b=FI1BRp9uu+SbFIIReQGjjGDnMupekduZgpuiDDP3ip3Xhe6rAM6XWb1iJ5EDseW2j7pE
	 2TXsuWPuRDkI6KKUDKoGLFKRCCODHqg7C6QGemFjZuAQ4bn9arZC1Cr305+xIXMRYzky0
	 wrnBMrzEU7/dm0Q/bKLPwbjLoHM9vJIbK4DJq4bmL9bGZnDavS+mvdFjvAC+isyLcOHPZ
	 8DApvwVWj7iLdp8xIbV8kkl2ktQvcN3y9XcwgBKt4KaS/sMbCC868kjIqIFD4/xligSI2
	 /3bnTKIlYmkB5ZLVhecZufSN+4XlCWOrxrt0IJ/1KIN+2nj7VKdb3cHhBywnIMYlYQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676515;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=byINeMt3A+PO89GiAsGNR3UuXwrnKL5MmsK2RAyTqss=;
	b=dcgSvhFuBk9LRqGzqQqdI109MY/6Lon6bTL8n+6ShDyTTvwvQurY4aY2GiwQBTTfd2zS
	 /T3OO4PUCfUeHRTpXUXKc1DSNHU2/lnhg265fMXGECjYMzzC8Ph7LE7iVSVCpgZnlldVW
	 zG+NaE7mnQbA6M0sGG5EHpJwPS+4l2Y30n/8xeQL/qqEf8WNmjskEqzPvA6mv0I80IZDz
	 7kx5ZDni7FKmG7/IwCDV3FVrZVWdImzk6tq/+zP/ignQdgYmDSBGyd03/7V4luouHp7Ud
	 hGL1WnesWCrmIk1thE2wkxIta5fjiqCXt1gBSLEUmRs3W3ZaShQeD2NFibsL+3JSZ2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xkx1gM5d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC9E60A2605
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xkx1gM5d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191431F000C2;
	Thu, 22 Oct 2026 13:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792676514;
	bh=byINeMt3A+PO89GiAsGNR3UuXwrnKL5MmsK2RAyTqss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xkx1gM5duvKz40/m53Ukc1GNlUzzoFwrOxlH6ts1Bqoq+jPI9Sm6Z/Q2bOPj5SVlB
	 UD6DWvw6ZraJho+Y69Pk1iCQCzCcXYAHr+Mvjr6C3o5Uoh2bEzjM8Z38vFRZrZceSX
	 iHvzKgtjT3QaG1npKKrPXNDBk9rc30szzMTAhdM1nAcBBiLKEHaKGl+PK6hhXKzIhE
	 t0pkRIBlvLjzOjXr0szzj4Ks/aYRZqbvSW+FKzuXymb7D9/zkZFYy2PMwATGxQ0u/G
	 EqhrIVw7gce1nlXhhzI1gRjeDQurjAt1QgqnmQbpoLWGUh5smbhDa9VhwHYW14IdGp
	 lQF4MqKbo51dA==
Message-ID: <sashiko-outbox-181561@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 9/9] usb: typec: ucsi: huawei-gaokun: pass down
 HPD_IRQ events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261022-hpd-irq-events-v6-9-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
 <20261022-hpd-irq-events-v6-9-337ea3ddaa62@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 13:41:53 +0000
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
- [High] drm/msm/dp: missing closing brace in msm_dp_bridge_hpd_notify()
- [High] drm/msm/dp: msm_dp_hpd_plug_handle() skips HPD high processing aft=
er detect
--

commit 42034f570d120654d6aa4e06b9c582eb06cb2f5f
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

drm/msm: dp: handle the IRQ_HPD events reported by USB-C

This commit updates msm_dp_bridge_hpd_notify() in the msm DisplayPort driver
to handle DRM_CONNECTOR_DP_IRQ_HPD events reported via out-of-band
notifications.

> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
> index ce919a26fba28..6a8b3b8e1fe7f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1566,11 +1566,13 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *=
bridge,
>  		if (hpd_link_status =3D=3D ISR_HPD_REPLUG_COUNT) {
>  			msm_dp_hpd_unplug_handle(dp);
>  			msm_dp_hpd_plug_handle(dp);
> -		} else if (hpd_link_status =3D=3D ISR_IRQ_HPD_PULSE_COUNT) {
> -			msm_dp_irq_hpd_handle(dp);
>  		} else {
>  			msm_dp_hpd_plug_handle(dp);
>  		}
> +
> +		if (hpd_link_status =3D=3D ISR_IRQ_HPD_PULSE_COUNT ||
> +		    event =3D=3D DRM_CONNECTOR_DP_IRQ_HPD) {
> +			msm_dp_irq_hpd_handle(dp);
>  	} else {
>  		msm_dp_hpd_unplug_handle(dp);
>  	}

[Severity: High]
Is there a missing closing brace for the inner if statement in
msm_dp_bridge_hpd_notify() in drivers/gpu/drm/msm/dp/dp_display.c?

The opening brace after checking ISR_IRQ_HPD_PULSE_COUNT and
DRM_CONNECTOR_DP_IRQ_HPD is never closed before the else branch:

	if (status =3D=3D connector_status_connected) {
		...
		if (hpd_link_status =3D=3D ISR_IRQ_HPD_PULSE_COUNT ||
		    event =3D=3D DRM_CONNECTOR_DP_IRQ_HPD) {
			msm_dp_irq_hpd_handle(dp);
	} else {
		msm_dp_hpd_unplug_handle(dp);
	}

This leaves the outer if block unclosed, causing a build failure at the end
of drivers/gpu/drm/msm/dp/dp_display.c as well as pairing the
msm_dp_hpd_unplug_handle(dp) else branch with the inner check instead of
status =3D=3D connector_status_connected.


commit 1182d7f2f2e876c63dd6756de1f85227702b93b4
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

drm/msm/dp: don't take extra references on multiple plug events

This commit adds an early return in msm_dp_hpd_plug_handle() when
dp->plugged is already set so sequential plug events do not take extra
runtime power management references.

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
> +
>  	ret =3D pm_runtime_resume_and_get(&pdev->dev);
>  	if (ret) {
>  		DRM_ERROR("failed to pm_runtime_resume\n");

[Severity: High]
Will returning early when dp->plugged is true in msm_dp_hpd_plug_handle()
cause msm_dp_display_process_hpd_high() to be skipped after connector
detection?

During connector probing in
drivers/gpu/drm/display/drm_bridge_connector.c:drm_bridge_connector_detect_=
ctx(),
detect->funcs->detect() is called before drm_bridge_connector_hpd_notify():

	if (detect) {
		status =3D detect->funcs->detect(detect, connector);
		...
		drm_bridge_connector_hpd_notify(connector, status,
						DRM_CONNECTOR_NO_EXTRA_STATUS);
	}

When detect->funcs->detect() runs msm_dp_bridge_detect() in
drivers/gpu/drm/msm/dp/dp_display.c, it reads the receiver capabilities and
sets priv->plugged =3D true without calling msm_dp_display_process_hpd_high=
():

	ret =3D drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
	if (ret) {
		DRM_DEBUG_DP("failed to read desc\n");
		priv->plugged =3D false;
		goto end;
	}

	status =3D connector_status_connected;
	priv->plugged =3D true;

When drm_bridge_connector_hpd_notify() -> msm_dp_bridge_hpd_notify() ->
msm_dp_hpd_plug_handle() then runs (or when a subsequent plug notification
arrives), dp->plugged is already true, so msm_dp_hpd_plug_handle() returns 0
immediately without calling msm_dp_display_process_hpd_high().

Without msm_dp_display_process_hpd_high(), drm_edid_connector_update() is
not called, dp->panel link parameters remain uninitialized, and
dp->link->sink_count stays 0, causing link preparation to fail with
-ENOTCONN.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-hpd-irq-ev=
ents-v6-0-337ea3ddaa62@oss.qualcomm.com?part=3D9
