Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792803743;
	b=PwdxnMYPA98KCUmL+6pXb/BBY6pFR1s4fywGVcIb5W2fXQogFyOnyPtcOaLJcu8WBEVm
	 /X8+jJaNEcPd1aqu07aelCwUf5R3T8Cu6jxkAUIZxcvkhCqGqTsb+ps1TwhcloAuMLWzm
	 36AhMgGHxMNrZkw8l1dQVsEhjpIXtzh1+HPq0O3SnPN4oQpsmZhDb2485wwy2YV3DZoYx
	 n4Ywsrtf/Yyn4eRJUaXTD71sMMYjDBhBWQYLyc40K4iLAYRRUt5zdP48mNdYB459ANvfZ
	 0G6fn7uu6N0NvCAdgXnZhjJ6g4Gjfz//ydYQkbvTgeWqom4Dk3Lx7bUDo2FVN1dZHPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803743;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UwjE+gl620La07uAsA8wn+kUBNJ7JNgAYLdqzEZ1xMI=;
	b=Vrvbl9t6LSJTlCS/d/ytQ6wDlCvRYfTulR8whha34uI/3wmbUtMcbNm7sHJ4NccJM7Dr
	 1KslFB1nN80S/vAAAlqqiOX6mid73Bdx/zKI0GDUm7tLMUHBw/5Qc42xw/W8rc06ZIWAL
	 NqCV4HPZoSITdl2Xjt22yoNiYqad1ExB0v6ccMTGN6mLSLCENeg1E9iR2crujZT9Ehv8X
	 eamdlNnS1Jw+lMNIpdIPCjC5+9GWqsdX3cj9bo0QeKgfmMQBx4haNH7mHf923efnu6DMJ
	 bYNjflCA8aEEeoPoPZuTRqeE3ARU469xqwFm6SINto0OkQCEmTzlDDaucyqloMO5tTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gxzt2ExI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8DA606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 01:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gxzt2ExI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35761F01825;
	Sat, 24 Oct 2026 01:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792803742;
	bh=UwjE+gl620La07uAsA8wn+kUBNJ7JNgAYLdqzEZ1xMI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gxzt2ExIm4oPRVsKZwW5ynw3PkG22F1/BAV88wEPjRyZWZq+Z+AlzubFmc1WmRrC0
	 WNiGqhyD1/TbsqkmZgNDEm2Ejh3Pi6cASmI5+tG4kkdcx1dthoWhdqoo1k3VBfhxB6
	 X4qT/C9i5tcm4cD8BgG4tjaIlhjUS+kshN/otA1T4ZeN1662zZE9yNLfZL6yZ00z3S
	 2hD8ehlr1ivk2vqnP+7WkxcmdJvIXnmQ3hIo+TOfFa4rnS6jfmg1wZ3Tl9VyePRsvY
	 RIJSanZtn2m+K6tZFdqJ3jM4DALHCvCuu+JWkglw8LIbMjdVQcGC9sT5/lE3mc00Er
	 8JxpU9JrVRpYg==
Message-ID: <sashiko-outbox-183480@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 7/9] drm/msm/dp: handle the IRQ_HPD events reported
 by USB-C
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261024-hpd-irq-events-v8-7-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-7-6ee949e7a384@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 01:02:21 +0000
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
- [High] drm/msm/dp: msm_dp_bridge_hpd_notify() runs irq_hpd on plug and wh=
en powered off
--

commit 975cd993397b923350a403b7275ed9d5223bb6a9
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

drm/msm/dp: handle the IRQ_HPD events reported by USB-C

This commit updates msm_dp_bridge_hpd_notify() to handle out-of-band
DRM_CONNECTOR_DP_IRQ_HPD events reported by USB-C AltMode handlers.

> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
> index ce919a26fba28..771c8b0744aee 100644
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
> +		    event =3D=3D DRM_CONNECTOR_DP_IRQ_HPD)
> +			msm_dp_irq_hpd_handle(dp);

[Severity: High]
Could running msm_dp_hpd_plug_handle() and msm_dp_irq_hpd_handle()
sequentially here trigger link maintenance while the display and link clocks
are still powered off, or attempt AUX transactions while the PHY is exited?

When status is connector_status_connected and either event is
DRM_CONNECTOR_DP_IRQ_HPD or hpd_link_status is ISR_IRQ_HPD_PULSE_COUNT,
msm_dp_bridge_hpd_notify() now executes msm_dp_hpd_plug_handle(dp) followed
unconditionally by msm_dp_irq_hpd_handle(dp).

If dp->plugged is false when this runs (for example, when an AltMode driver
reports both HPD state and HPD IRQ on initial connect, or when a monitor is
plugged into a USB-C dock after msm_dp_hpd_unplug_handle() set dp->plugged
to false on sink_count =3D=3D 0), msm_dp_hpd_plug_handle() initializes the =
PHY
and calls msm_dp_display_process_hpd_high():

drivers/gpu/drm/msm/dp/dp_display.c:msm_dp_display_process_hpd_high() {
	...
	msm_dp_link_process_request(dp->link);
	...
}

That first call to msm_dp_link_process_request() updates
link->prev_sink_count to match link->msm_dp_link.sink_count. However,
drm_kms_helper_connector_hotplug_event() and msm_dp_display_atomic_enable()
have not enabled the stream yet, so dp->msm_dp_display.power_on is false,
ctrl->link_clks_on is false, and the mainlink is untrained.

Immediately afterward, msm_dp_irq_hpd_handle() calls
msm_dp_link_process_request() a second time:

drivers/gpu/drm/msm/dp/dp_display.c:msm_dp_irq_hpd_handle() {
	...
	rc =3D msm_dp_link_process_request(dp->link);
	if (!rc) {
		sink_request =3D dp->link->sink_request;
		drm_dbg_dp(dp->drm_dev, "sink_request=3D%d\n", sink_request);
		if (sink_request & DS_PORT_STATUS_CHANGED)
			rc =3D msm_dp_display_process_hpd_high(dp);
		else
			rc =3D msm_dp_display_handle_irq_hpd(dp);
	}
	...
}

Because link->prev_sink_count already equals sink_count, if
DP_DOWNSTREAM_PORT_STATUS_CHANGED is no longer set in
DP_LANE_ALIGN_STATUS_UPDATED, msm_dp_link_process_request() falls through to
msm_dp_link_process_link_status_update():

drivers/gpu/drm/msm/dp/dp_link.c:msm_dp_link_process_request() {
	...
	} else {
		ret =3D msm_dp_link_process_link_status_update(link);
		if (!ret) {
			msm_dp_link->sink_request |=3D DP_LINK_STATUS_UPDATED;
		}
	}
	...
}

Since the link has not been trained yet (or if an out-of-band
DRM_CONNECTOR_DP_IRQ_HPD arrives while dp->plugged is true before
msm_dp_display_atomic_enable() turns the display on), drm_dp_channel_eq_ok()
is false and DP_LINK_STATUS_UPDATED is flagged. That causes
msm_dp_display_handle_irq_hpd() -> msm_dp_ctrl_handle_sink_request() ->
msm_dp_ctrl_link_maintenance() to program DP_STATE_CTRL_PUSH_IDLE, mainlink
setup, and DP_STATE_CTRL_SEND_VIDEO into dp_link registers while
dp->msm_dp_display.power_on and ctrl->link_clks_on are false.

In addition, if the display was disabled via
msm_dp_display_atomic_post_disable() -> msm_dp_display_disable() while a
sink remained connected (sink_count !=3D 0):

drivers/gpu/drm/msm/dp/dp_display.c:msm_dp_display_disable() {
	...
	if (dp->link->sink_count =3D=3D 0)
		/* re-init the PHY so that we can listen to Dongle disconnect */
		msm_dp_ctrl_reinit_phy(dp->ctrl);
	else
		msm_dp_display_host_phy_exit(dp);

	msm_dp_display->power_on =3D false;
	...
}

dp->phy_initialized is false while dp->plugged stays true. If an out-of-band
DRM_CONNECTOR_DP_IRQ_HPD arrives in this state, msm_dp_hpd_plug_handle()
returns early because dp->plugged is true, and msm_dp_irq_hpd_handle() then
attempts AUX reads while the PHY is powered down.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hpd-irq-ev=
ents-v8-0-6ee949e7a384@oss.qualcomm.com?part=3D7
