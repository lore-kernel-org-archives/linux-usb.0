Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676123;
	b=g4uQL4PzPsHktJTzckx2DmPqvbcmYBmcK/2RTteyHSb5AxDAxsPemILl81WGlcN1af7/
	 GH9RhkoL1vhW6t/l4ZSxweAB+8tZMxKA+C3p0+25ZZF9I0c9L9RT9GS+OZxtRpKRyqlm1
	 qN2xLmI7D+k2YgiRdIKBQnHaoWJ+J5MUB0fZcGZE2O/HL8T/pwasSAHkf4dvug4p/pmQ6
	 k5YYyz0CRYmFyplB+JgWricH8f0hRrQ8+e/2uWqFPUASmi+QyCRKnENelWnHgJ8PdMor7
	 0s5cHl8GHxidFFfAfmqAU+QCJK0nBDsyA7/ampaiNY2ou29OUZJrBx7xnoBZ84XCFpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676123;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PlLBVTPI7eZpeRaDmVkEiCpkiEZhzAXhcueo3GF4oYY=;
	b=oP8CcXGG2xMlirAaOQ9OaqU3t/ozT7E67Q6BBWz9k6NoAI4neEt47xBsFxf5esce0u3t
	 uDFXhxNK2z+nzmEY+boCdBxwExG8IsVEaVvMc5T1bX+v7PC5LgQnHYmaY8eyd6BZL6mKc
	 rAzQqVRaNaNM+JBQ+/WxkTAAavI0c/MfePz9pLZAc8yojc/jERpqFANFfuyeKpP/+rLs3
	 Ut5qBba6psCKhqA3QiZYHUkYTig+OWRH5SDkpmjwAFaPTEWs2/h+aESRrW1YwA1G1nhrT
	 FxYtTDBPjxKy7/WzmeM6/AFYiCZYhdehMVyf2/G8HGsKUiQCnLO2GBTAQhnQUPUrQqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VoylnmEN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207A6606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VoylnmEN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532D61F000C7;
	Thu, 22 Oct 2026 13:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792676122;
	bh=PlLBVTPI7eZpeRaDmVkEiCpkiEZhzAXhcueo3GF4oYY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VoylnmEN3jSLZ2B+1hKBAGmav+2Aoy4D7B1edUtItSmEaNhplhLoiX/maHXguwL13
	 wJFbnanOSM2eoKenoXausGL9ftaW1z8WuARShfCOPIfYjaZ/K4f6mP688LL8saW279
	 DPA2nHhStBHFmNDO/hfjSh/h1j/bkn/+BsgoxC5QGEF4WMdTA0JcLFC/b1K/tuEkWW
	 VZ9M0S1MyAUFI947CY2Cy1ntjH0+3zcrbBMmsWICmTAEIYWZ/DMOEf5fs30W/k6Grd
	 VjQ1dMyjKglEdy4yWhVgoNzEED1AhLmI+uLc4egKxWMQBbMQYPnpET4SINQz5++dhQ
	 07tvdvpsdBwUA==
Message-ID: <sashiko-outbox-181548@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/9] drm/msm: dp: handle the IRQ_HPD events reported
 by USB-C
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261022-hpd-irq-events-v6-7-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
 <20261022-hpd-irq-events-v6-7-337ea3ddaa62@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 13:35:21 +0000
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
- [High] drm/msm/dp: missing closing brace in msm_dp_bridge_hpd_notify()
--

commit 42034f570d120654d6aa4e06b9c582eb06cb2f5f
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

drm/msm: dp: handle the IRQ_HPD events reported by USB-C

This commit updates msm_dp_bridge_hpd_notify() to handle out-of-band
DRM_CONNECTOR_DP_IRQ_HPD events in addition to ISR_IRQ_HPD_PULSE_COUNT
link status pulses.

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
Is a closing brace missing for the new if statement in
msm_dp_bridge_hpd_notify() in drivers/gpu/drm/msm/dp/dp_display.c?

The check for ISR_IRQ_HPD_PULSE_COUNT or DRM_CONNECTOR_DP_IRQ_HPD opens a
block with a brace before calling msm_dp_irq_hpd_handle(dp), but does not
close it before the following else branch:

	if (status =3D=3D connector_status_connected) {
		...
		if (hpd_link_status =3D=3D ISR_IRQ_HPD_PULSE_COUNT ||
		    event =3D=3D DRM_CONNECTOR_DP_IRQ_HPD) {
			msm_dp_irq_hpd_handle(dp);
	} else {
		msm_dp_hpd_unplug_handle(dp);
	}

Because the block is not closed, the else branch pairs with the inner
if statement instead of the outer status =3D=3D connector_status_connected =
check,
and the function body of msm_dp_bridge_hpd_notify() remains unclosed at the
end of the file, causing a build failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-hpd-irq-ev=
ents-v6-0-337ea3ddaa62@oss.qualcomm.com?part=3D7
