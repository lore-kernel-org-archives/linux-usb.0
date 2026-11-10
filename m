Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303311;
	b=dhke0kDQ6DEN4+YJaAHHE+BmKoQmrdK2nmciAiYrNmeUL4GwRYahszEU+tzdAaUYjM78
	 adRVHHJwUb66wr3LPNaeP8S3pEh95Lz5Rhq0qbpuCfPMbymTVNcgVC8zIY0cgjn9/AuXY
	 YpzuGb2l9nFjEQJhYu0/SUBuStTMTJdb7tgIMWOJ6TyxykXONJmlexTc3qtI00w/mb/ZJ
	 O2WjyhVq3AIdOn00Viw/i32ppbkbW8+MaG4FD0ZIY+68FP1v9nqvI3T92s++lWN+nPEKM
	 O24REPK9tQ3IpmOQmKOqspXXQq3wheGECOunpWrDARN8uQWDGSvvpRPpsHXayFP/h5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303311;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+QuxvZy0Xz42sLRgGkG+XN8ldM33I6pJAX0IrUdeBRQ=;
	b=c1sopsc/K7JkJ76WSahlr+a+Dn5/Culmfd/j72fTYKB2Koor3Ta4VpUC+lS7Udv8b54G
	 UyOqllyfEBTUrZclYBgncU4fv3LPfHu4li/HzvlmpSslyb/wX8Yp2+ZAE1a6SMW56wWv5
	 QI6lqH7z8oOYHs34Fs134cNtvTFxXzDWmTVkGPPynZ+xcerpqwvxeZAg/fzJC1Dx4JR5X
	 ASTpWjHib/YW7orVgYzki5as1IN4iBzkXiUTInDiaVc83dNnbsjN5ZL/awTevVoUnGKsc
	 KeU8tSvAAJo05MUftEVAcqopqahNUEoYkwDlqymciL7vYRe8ONyRh+0nD1Oo8EZaTTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XmyWTrqY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46A4606CFB9
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XmyWTrqY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DE81F0089F;
	Tue, 10 Nov 2026 09:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794303310;
	bh=+QuxvZy0Xz42sLRgGkG+XN8ldM33I6pJAX0IrUdeBRQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XmyWTrqYlH4mU57a3RXnQ64xokn9CR3+erpPgN9drCXYStyPhKfalpvvzj0ObrPq1
	 QNM1c0re5hg5C19IBdQLsN0ePKa3WmPjp8FHeMwPeQM87V1XNJ2RPmO/NqoXhp0EVA
	 88dAe1sNKj7CikdsTJ2NL0F8Nakmg+2/t8GgJzN7Wb45r8HORrvykMWDUVnP3lCRtp
	 9REgMqc4ljgQD+BiXwNkVpjojT3iByZ/51QIAF3LXi/yBbSdxtkXAtmOCh0nrco1RL
	 jwHa4H65ncO4CjgYgCe2NcMIgGT8K2oi60lYy0qsDmJyAlXNxphRb9QHwcQsloWGmL
	 81RyWXaoFqEHw==
Message-ID: <sashiko-outbox-206768@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] usb: dwc3: qcom: Keep wakeup option default off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter Chen" <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110092157.2989350-2-peter.chen@oss.qualcomm.com>
References: <20261110092157.2989350-1-peter.chen@oss.qualcomm.com>
 <20261110092157.2989350-2-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 09:35:09 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The "wakeup-source" property, as described in
> Documentation/devicetree/bindings/power/wakeup-source.txt, only says
> that a device is capable of waking up the system. Whether wakeup is
> actually enabled is a policy decision, and drivers use
> device_may_wakeup() to decide whether to arm the hardware wakeup logic.
>=20
> Currently dwc3-qcom calls device_init_wakeup(dev, true) when the
> property is present, so USB wakeup is enabled by default. Users who do
> not want USB activity (e.g. connect/disconnect) to wake up the system
> have to disable it through power/wakeup, otherwise unexpected wakeups
> may happen.
>=20
> Having wakeup enabled by default also costs power. In host mode, system
> suspend skips dwc3_core_exit() and keeps the PHYs and the wakeup
> detection logic powered so that the wakeup interrupts can fire, even on
> systems where USB is never used as a wakeup source and the controller
> could be fully powered off.
>=20
> Keep the wakeup option default off and only mark the device as wakeup
> capable, so that the user decides which USB controller is used as a
> system wakeup source. Users who need it can enable it with:
>=20
>   echo enabled > /sys/devices/.../<dwc3 device>/power/wakeup
>=20
> While at it, drop the local wakeup_source variable and use
> device_property_read_bool() like the other property reads in probe.
>=20
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110092157.2989=
350-1-peter.chen@oss.qualcomm.com?part=3D1

