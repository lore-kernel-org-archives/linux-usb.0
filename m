Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091788;
	b=guWMVQtazFU36LUM/I4EBD37VRlpzrubPAds3ySt3Nei4nNeCgNuVJSsh7BxW9XUAUAO
	 98xsFfI9tl/Wk1VOnYV00pNjiDSHJKk12g8qPOmU98RvUVx076REbel6gc/AS5ml6UPx8
	 8efi+1brWGQc7WjfjIqzXQbWL7xZZEy7l+foSmAvcyKypTxzxBh/5iYvyB3k1xJqJV7jL
	 4Uht0L51Mq2HVu4f7/LSrGPys0avVzXyKWTwZfmXQZQVCMVnDIj1B0fehanRzU6H5VXrq
	 rdEs1M92jIRdRaNxRhhoOShMgwkefjsxi6fFBb2NuoD3WFSV1rfWHHPOQf9K4yp7HqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091788;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=M1mTSfwwdGSMglj1LDUXMqLX6+NTQ2gXR80UmxF01aE=;
	b=tvOT6tDvtiv9XuiWDOfUA4PDDnjuu3pGle7q0BdGfJgMhpMXaArjCZmuIWUniOJM5c1o
	 5QhLWy9V3PGIDdwVdukO3DdOrIJcKYNrjPHMVXaTKwEEnanmv4/6SN+ClcO3whW9rkFf1
	 vGE/KbO6KAf4WDI+b+6j0MByaho7sE2M8sYvEtTZgjBus1W/IhcN4LHaa4s85qufVCYsz
	 L+/YIOTUtj48U86VXG2PyeQdfujbAUDLa+wlJmupjJI0CYdJbL/3A8KoJ3En56oRGauGo
	 XPfSiobO/6Elx7vUoVkm1sK94+SL9q6h/kgyRABVjsCT9JfPPERQsjWVWtIQE/dlFjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=naDr7DUG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD0D606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 12:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=naDr7DUG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F294C1F000C5;
	Thu, 19 Nov 2026 12:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795091788;
	bh=M1mTSfwwdGSMglj1LDUXMqLX6+NTQ2gXR80UmxF01aE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=naDr7DUG5kZm09qhoTpJYgUOQ7iwAZAXaJHjEPrAjk4sgS/wjdW1RSU06fpvMpJY8
	 MbBlwyXRLfw9O40QZbd4KrKHA2AzNMV2N+Y4wkaGwYjzajk3rJAWBhysFTwJ65btO0
	 uAWCrxL1gFetLt5tQV1W3qwjny6FFtE1uO1tySsGusFkmJrnDIe/qEH8OYk0mQGFyn
	 V4jDP3qgDkiSFFCFnS+JG7/D+UyJ9pYb6GVGVeD76xNUl+5H1GohFma2pNNwa49RM5
	 4bmGWFXris6iiD25bkkdXa/P0K707RF+qus5f0ZtJWeF01rzQU6spNMd/LKVDrLiji
	 vKREuM3vYiKgg==
Message-ID: <sashiko-outbox-223095@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: cdc-acm: restore the line coding after a
 reset-resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Piotr Kubik" <piotr@kubik.pl>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119122842.3611681-1-piotr@kubik.pl>
References: <20261119122842.3611681-1-piotr@kubik.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 12:36:27 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> A device that loses power during system suspend comes back at its
> power-on line coding. With USB persist, the USB core then resets the
> device and calls acm_reset_resume(), but acm->line still holds the line
> coding that the driver sent last. acm_tty_set_termios() sends
> SET_LINE_CODING only when the termios differ from acm->line, so an open
> with the same settings sends nothing. The port then runs at the wrong
> rate until the termios change or the device is probed again.
>=20
> Send the cached line coding from acm_reset_resume(). Send it only for
> the control interface, because the USB core calls reset_resume for the
> data interface too. Use the variant without the autopm reference,
> because reset_resume also runs in a runtime resume of the device, where
> usb_autopm_get_interface() would wait for that same resume and never
> return. Ignore the result, as acm_probe() does, because a device without
> USB_CDC_CAP_LINE need not support the request.
>=20
> I saw the fault on my workstation while using serial consoles.
> Claude Code agent (Opus 5.5) traced the cause to the cached
> acm->line and wrote the first draft of this patch and this commit message.
> It also wrote and ran the test: a QEMU guest with the adapter passed
> through, and a USB power cut while the guest was in S3.
> Two other Claude instances reviewed the patch, the message and the test
> record. I reviewed the patch and I understand the change.
>=20
> Fixes: a91b0c502285 ("cdc_acm: add reset_resume method")
> Cc: stable@vger.kernel.org
> Signed-off-by: Piotr Kubik <piotr@kubik.pl>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119122842.3611=
681-1-piotr@kubik.pl?part=3D1

