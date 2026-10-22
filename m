Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641530;
	b=3wnZIPtqgy4jbPatkN/b+8mEUOdPepaXnHtLbWb+VKastEQR+QQHe7DIHMIi6gJtiE8q
	 72ywct/ycs3ucqzJIMMUk67MNO99pJ93kzLjUISlm35+GAgu9PLES8cxIBT41ghdtX17i
	 vXWhFwy051lhEPoOUaLyIIdVKUScUuFs8KFqGzFk7G6hoaUzW9vMq7VXle1e6CLaUvDMo
	 GXR0R/PIXTJRZ5SKMRZIwKySOg+xfQbZJsyFGfBX2QPPCKGEvck5vUvVNfCGv2OGdmMD4
	 cvN/2DBRAo/nguoVSXc0YBN44GlTWd26qcx74UqfE2bzdOO4hCdq8QuI12YNB9blTxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641530;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BRnKL6P7aAoDUAVBNVi1q5ByG37CtQ4tWhm3AIhZ3pY=;
	b=DNFte41YeoEis7euZ3XjT5exTLSdZVgnu8TqjZbNn8Mn7bzHrxsgLWsrRAnhf+XNMmlx
	 hMgEIXgpSiaOgb5BK5ZuBaxu9Guo85/1+zwfYpoMM9ehVJfY+JAHWSoRZB+iSqIRc9Y/f
	 sjbxrRc1+8UQbYKUT59IJXZmJCUKKIL7SBLHNW0hQaiFAbDBpcXKYYGPf4mvr3xFxJCyl
	 cyyx7uwT2lU3NTYT7/lpIIZuv7tWv7EKKkFZlXZ01d3yArttoUITrP5kD0dzfNMHIV6Ci
	 n9CYjyT6rXfIjLjFAdREXVyimLMcXbcicuSYehtARju4Kt51FquIp34lHxdxr4Wiidw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FApZ+90p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D340B606A31B
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 03:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FApZ+90p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C43B1F000C1;
	Thu, 22 Oct 2026 03:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792641529;
	bh=BRnKL6P7aAoDUAVBNVi1q5ByG37CtQ4tWhm3AIhZ3pY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FApZ+90pOEZmxkOvlYnkKQebBDs2STUtmePsddreOzasPuwqoACwpa2ggHr7t/zx5
	 +oCT4ipCbTw8YoIMD6nj/t6ttxP5D6+ViwSG+FKNWxOPcQW+KaV2lv/ik49bNqH9CF
	 pdIUO0PLjE+Q/Zt8NkXxmy+TYwTTi3Ww5ktQI3y3psDfXcyUGZXDqiS/Bkue9ySfUg
	 Tpcn8FGSnsbMNlElEIvjshgIIWvzI4RFPuO0fISawsO8lt0HQcfHDGyhslG4tJffWk
	 1yeL7X6/XjiQad8uftzLm1w/2AJ/oIQ7UP802S6+oa0KxGclFn63C0gNHR0EX+jKRR
	 n2tVe3hF08yeg==
Message-ID: <sashiko-outbox-180987@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] usb: core: Close anchor capture-to-increment race
 in URB giveback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyu Xie" <xiehongyu1@kylinos.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179264121348.17277.2207660107714201051@kylinos.cn>
References: <179264120148.17277.68253767316647311@kylinos.cn>
 <179264121348.17277.2207660107714201051@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 03:58:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> __usb_hcd_giveback_urb() captures urb->anchor into a local variable at
> the top of the function, but increments the anchor's suspend_wakeups
> counter only after unmapping the URB for DMA and running the usbmon
> hooks.  Nothing pins the anchor during that window.  If the URB is
> concurrently unanchored by another thread -- a driver calling
> usb_unanchor_urb() on its own in-flight URB, or usb_get_from_anchor()
> or usb_scuttle_anchored_urbs() taking it -- the anchor list can become
> empty while suspend_wakeups is still zero.  A
> usb_wait_anchor_empty_timeout() waiter then observes the wait condition
> true, returns, and the driver may free the anchor (anchors are
> typically embedded in driver-private structures); the giveback's
> atomic_inc() on the captured pointer, and the later decrement and
> wake_up() in usb_anchor_resume_wakeups(), operate on freed memory.
>=20
> The previous fix ("usb: core: Fix use-after-free in anchor wakeup
> [ ... ]
> Cc: stable@vger.kernel.org
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Oliver Neukum <oliver@neukum.org>
> Cc: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179264120148.17277.=
68253767316647311@kylinos.cn?part=3D2

