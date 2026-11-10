Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293185;
	b=bs8vcg1ZyiOAHhCErI3KKK6l1al+OqAJea/aODkAJLa3tmItJkhONPk7Gu1JGbAKqHeh
	 6bShZInPAt6tSynRAK3fRdfW7xj/RSJkHfmOD6K6xDerlfNSR+vQUE8YGD5If181bmmWV
	 ds3Ns9anWxhUw/l5az2gfZZ/fCeLq8j6dSGgPD1vocWHVLidks3zFYRiT2DIhx+vFRycB
	 aRYieiENGAQ75sOCwrsPiAzaJpRlYPJAFNq/2k59Njk6HwBcxWL3y1UPSO416wj9wViH4
	 qhRYGRKWUvQmXwZkb5wK21aP2+4sf9REIFVf8VxLTN4Vky5Gyn2GFs8FtrqxoFktiyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293185;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JxnUT9NB7rci062Xo4WmXfe2fPXRrn7X6M2FDIotpH4=;
	b=oDRPERIES/yTSHBq9WHl28ZcOVOsYUkcpDns8OihPBC4ed7PJp7s5rhOsf7xq8c2pEgj
	 OlfhWPM2blF/RKEzqsJHtaBdy4LM0y/c8z2Dng+g6Yvk0dXZ1n7NhtHyylhHWLg9F8NE0
	 STJPVHK/gffhiZCDfyDTmjY3vPdzZdusEch3Mm1qQ5V8LwCyEG4hDAoOtjBzVaY+Qqw/M
	 HOPHOuxoNdIC2Br+KPqN6QLS5WTCi7fbxwD2rwqN2kjdhtVKthr5YDCVUDq2STcCDBWeK
	 o5Z29eDAnqTkcsya5lOD29ykYKVdCrgIxvpEdKvxD3YQB/ZXv+hWmWtrfk8wtHWKaaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fBj6erdy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A48606A67F
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fBj6erdy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86D71F008A1;
	Tue, 10 Nov 2026 06:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293184;
	bh=JxnUT9NB7rci062Xo4WmXfe2fPXRrn7X6M2FDIotpH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fBj6erdyGGaKdI+ECl8zGN9q6Adb8/RL0L/uoZ8ZpZk2I2QNkHcRno7/1zaINDG37
	 tPjfuNMwF84hrp13qO6LWXDz+L93eCQeW7oXg+6WwM2DA+OdZfX7bUI90LLUMA9+zr
	 ukP3BA9F5fIM/coB1h2fmxdc9bNnSfTHTAGQ3RfJLfvfDoNaDJgaUGLhpIxKhvctWz
	 OXy0SRlqDILszzl7XUYX7S5dcllq+jAmaS5a97QkK+pZ/6U0RbyCp+c0FlYXRYHYCe
	 IAhIq2B+5IpekyLekpimehD3SeyJZIhskQNoD1j2CHGHk4TGzo29waJkRdXDPwvKrF
	 +tD8lWK7PSjHA==
Message-ID: <sashiko-outbox-206445@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 22/22] usb: usbip: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-23-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-23-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:46:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usb: usbip: unintended revert of spelling fix in ftdi_sio.h
--

commit 8f14e86261ee37ed25e33a3151b95d7ca6628112
Author: Shunbo Shi <shishunbo@cmss.chinamobile.com>

usb: usbip: fix a few spelling mistakes in comments

This commit fixes a spelling mistake in a comment in
drivers/usb/usbip/stub.h and also touches drivers/usb/serial/ftdi_sio.h.

> diff --git a/drivers/usb/serial/ftdi_sio.h b/drivers/usb/serial/ftdi_sio.h
> index b053e038bda49..55ea61264f919 100644
> --- a/drivers/usb/serial/ftdi_sio.h
> +++ b/drivers/usb/serial/ftdi_sio.h
> @@ -15,7 +15,7 @@
>   * USB on the other.
>   *
>   * Thanx to FTDI (http://www.ftdichip.com) for so kindly providing detai=
ls
> - * of the protocol required to talk to the device and ongoing assistance
> + * of the protocol required to talk to the device and ongoing assistence
>   * during development.
>   *
>   * Bill Ryder - bryder@sgi.com formerly of Silicon Graphics, Inc.- wrote=
 the

[Severity: Low]
This stray hunk in an unrelated usb-serial header changes "assistance"
back to the misspelled "assistence", reverting the fix from earlier in the
series in commit "usb: serial: fix a few spelling mistakes in comments".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110064105.2033=
5-1-shishunbo@cmss.chinamobile.com?part=3D22
