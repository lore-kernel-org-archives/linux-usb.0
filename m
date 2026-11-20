Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195849;
	b=YKVYF0INlklBUQtw/9Q2O321D0yLT8qTaSDA2kyjFtnjRM5Cs5th+SnlF01omDKuC1Ty
	 SkECUJ+/uSlctowFcvO8lson+uhItlo3UWy0YIaU3jox2XBy3x7Q/3yqWtEBx4bLN0prz
	 SkrlndFNUpIZkNFYsRRt79lS3CCzlfeGwVMJ8ey6AgozJaoYNENKWuXC0rb2ZUzce5Fj7
	 5rSe6WCWWbSIM8n0pUolD3EkWyznekIxKSfuhVoR6DBnjqqPPlLetwbm6gQ5YF7AQoyce
	 XrNqys6s+QFH7HS7x5mXyKj2mgGMKWcVBgUuV0Cz6/rg5MjX5r0myJ7Ekzy7RtRslHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195849;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7s+L9IeiYpvP8DNAm/tpY0qLJQz5kUoc7Ozk6j60Wb8=;
	b=bbzL2XuN/RHaKErXOXro3uAmMYCQCy89JHPwptsxHbF3LXdlCqi9pvL4qohdTh/fWVTc
	 tUcpRYCV+afmIsIzP+VUjhee3m5GP6ViqzzcvROb3V3ljuJ/xZqwdHAKn1kXkJH/uR5h/
	 ddnDR9sYAemm3yiBtK/VeWUEHkjBZN3oHEtyAqh7J8SjK3t32LFEgAkxZQTv+7T/RushP
	 U6GcdxPfXapVukOGm3xm/muiCfTXPE2u0Kjh5aooiKGb2MdGyoeJZzcxBs6Z+bQFLFV/D
	 Im9zTx1knEcK6BAzMRWTQuplX2gcr/hWYD2VN3qh9+TCaa5yNCjWPtsyIIzx0cUmOHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M9e0jgxO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8220B60A2602
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 17:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M9e0jgxO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0543A1F000D1;
	Fri, 20 Nov 2026 17:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195849;
	bh=7s+L9IeiYpvP8DNAm/tpY0qLJQz5kUoc7Ozk6j60Wb8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M9e0jgxOdG3Ava+BaxlIhG6gUZI7nyPxfbdhQOhhmNW98LMIC/j04wo3T3Hrfg2ym
	 dx+ProPSebJSeioZCD2HHUhZ6Xs0TNVzc29u1Agh6EU2l049Ge0ULxJoPYzEwRFp2F
	 CtuOrPi7ubqM6LGXsNzeH6v9/EIaG2iolHRiLUNYWrTym0LIMk0JpSzIRF8HkXAWZ0
	 Z+rky2ifdZtZ+oc2A34lkovQ0dA50va6YPetv7RMzS1Afqp5Xno6OoIwXCuGQh0Lrd
	 6OYEX7SkcUfM5CI67kjCmbBvCAk4D9sHAiKGsz65bYj4yAlQRrFrNW+/4vMYk4izWz
	 sq8UlbwhKirtw==
Message-ID: <sashiko-outbox-225667@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] USB: cdc-acm: restore the line coding after a
 reset-resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Piotr Kubik" <piotr@kubik.pl>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120171809.1494779-1-piotr@kubik.pl>
References: <20261120171809.1494779-1-piotr@kubik.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 17:30:48 +0000
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
> Send the cached line coding from acm_reset_resume() of the last
> interface to resume, which acm->susp_count shows, before acm_resume()
> restarts the URBs. The USB core calls reset_resume for each interface in
> the order of the configuration descriptor, so the control interface is
> not always the last one. Use the variant without the autopm reference,
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120171809.1494=
779-1-piotr@kubik.pl?part=3D1

