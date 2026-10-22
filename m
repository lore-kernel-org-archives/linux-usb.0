Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709559;
	b=pRjXbHh5ohfsNd/cu+tFq49dMYnwM1RLlIpqRXFJfHs/PpKszORgtgo7uakRZUiTvUHu
	 3aSdiBF5QrhryGvvF+weo3QQFoGxyznop9TDlAkzztFMG7o4AmPfN2ypJQZZhSACPDuGj
	 DpQMZ27EdDNzK/aFuKWfb4+34/gopJMXbqcjfWRy13jWYUlFiS9XLBsXxmnf9usnA8qJG
	 bCdZ+VJpitLA+SbRpm3mZlC2ETAXo8RHtUgAJaYn4a3rIHUVbKu5aFxcx69J+UQ09qEWy
	 ZRSfqQXEAGTLSgMA6gAkcM11R4uiLTfgwKz6C+PkfR3CWtFLBkoAUHgwTexU4ySHq9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709559;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TmMVPnRYLdcCw5wTcXgScOfw2XdxeZtEvDQI9S1NZb4=;
	b=AZpajYyF6nFtiSRb2QcpbhKBMkw0yteGcpTYjWhu+7qgLuUjsNqyWYqo1tc89GIwC1U/
	 l4aCsx/wLYQGUisb7EIcZ2CFypmcAMQ+yeBfVNIYEfXXoufRKbfcXfDaSrO/NQxojujjP
	 IZxmhM3KF0+tkQAH0aZ8l8MLmlfYE3PvLsy6nhe2nRJDrOP8TBPE99DVelqClJUgHcsue
	 OMHJjrfJOMZmfuWTmYf13GKDH5R9mwNFzLy5p+AeRHE2cSIZ6TyVK8UeKV/x8pUe3DRzQ
	 809BQxu3Cu5ZQ/t3MzCvkWcRyqOSLdvG9DSnbGWNzCfBRRcCT2K4t3T3fYJ0BaIk0FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzFqm2JT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA00606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 22:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzFqm2JT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC4D1F01825;
	Thu, 22 Oct 2026 22:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792709559;
	bh=TmMVPnRYLdcCw5wTcXgScOfw2XdxeZtEvDQI9S1NZb4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TzFqm2JTl/Cqozf08hhrzJgbWiWZhDfOXFG84vaNLRhFIU24lM9huN/mjIWTZkN5V
	 DjZD25QYUQvtZAgzNy+Mkvub1Rnmj+zBXT/zXW0WiL36MEc03+qRsP8yVuPxxyrjCN
	 w4iSSuHVCO7aaSxIQbGl0E9yPhZjK/SBBfXhOvt8fbIeO0gi0SQ9F5G2DgHff7KO7N
	 FlNXTQIhiWE5wDR/oJqCVUtcVhxIKrUk/KCoMwgCMmYwzT8Xej+XIHSeEKNX+FuZUS
	 P9YpF5SdgMOwwZWEFS0tcYYgpDJtLKX4RAxtnrbMk5CCK0nrZglPeCp1VaIXdtIu5B
	 6zJTDda8bA2LA==
Message-ID: <sashiko-outbox-182136@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: dwc3: qcom: Defer VBUS override update during
 system suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladyslav Tymoshchuk" <tvlad744@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261022224220.480-1-tvlad744@gmail.com>
References: <20261022224220.480-1-tvlad744@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 22:52:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> dwc3_qcom_set_role_notifier() updates the VBUS override in QSCRATCH
> synchronously, from the context of the usb_role_switch_set_role()
> caller. The glue assumes that role switches only happen from a
> freezable workqueue, but that holds for the dwc3 core's mode switch,
> not for this notifier: the UCSI connector work, for one, runs on the
> non-freezable system workqueue.
>=20
> On SM8750, when the USB cable is unplugged while the system is in
> s2idle, the UCSI connector work for the change runs before the devices
> have resumed. It switches the role to USB_ROLE_NONE, and the notifier
> accesses QSCRATCH while the glue clocks are still off, before
> dwc3_qcom_pm_resume() turns them back on. The access does not complete
> and the SoC resets. pm_runtime_resume_and_get() does not prevent this:
> runtime PM is disabled at that point and the device is still marked
> active, so it returns success without resuming anything.
>=20
> While the glue is suspended for system sleep, only record the VBUS
> override update and apply it from dwc3_qcom_pm_resume() once the
> clocks are on. Apply it after the core has resumed, since resuming the
> gadget enables the override and the role switch is the more recent
> event. Serialize the notifier against the system suspend and resume
> callbacks with a mutex, so that a role switch can't run while the
> core or the glue is being suspended or resumed.
>=20
> Fixes: 21188e8d6d75 ("usb: dwc3: qcom: Implement glue callbacks to facili=
tate runtime suspend")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022224220.480-=
1-tvlad744@gmail.com?part=3D1

