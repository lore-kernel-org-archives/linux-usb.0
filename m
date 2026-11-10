Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794281348;
	b=l9kWf8XtDJvY+Rosxxu/AwBIJM1UFQxCs5cRJw1Izx1t7InwqbjE/RcvZCE5qoJr3rVD
	 1k+++HpW31DMR8FZ6HQu058O26Plg5JCE5dkN0VGrTxR8Bn+lZk6A67CZ5DEobNHZtgpF
	 O4bP9BwhhcecDYpmLEoOTkSYwoMa7Za3rswJjd3KCjqp3H1SPrx8KfDGKZomsE3RqDvVJ
	 l9GvmUsAYR0KgbBXqgBHz7Oq3DPa2Y0MUSMxGfrQ01Q+omonHQIogwauC9qhoIEAu8BGd
	 lSGpp1Bq+/tp3SWmfA8nIdqIXbQKRPv+Wuk0G1Ax7165pUMq6kQoFdJ3E6fLI8vYh4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794281348;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dhPtgnH28emxIkd3Cfandn0cSfoyzvmL2ASLY3fT6n4=;
	b=5U0PSYpE2nFwah+dxGOpv7Gsl95m2mxJ1Z/tuJTZyPFHvlUAE10f2xxIyDZX0XiqZ0RZ
	 50UzMVa5zxZvyycYhIs4fSkBjYPvA8X9v1Vpr8YAfkN2OTu2Wib664mF37zyK/F2FBPWw
	 gjh87ZLkrtUK4gd3I6l98XwEyheQuuxuV4XKFaH+mK/CN7cYwAaJARad2PrZxfEhMw+RX
	 vwsNhV2D65Ku9dFVWcdqKV4VSiAiM4WNU54/rs11qg82loKsXmKz/HSOhMT4t+WUci00b
	 4iDcwQITwyo391Wk/wrVjSlkHLeIlEVMK58u8n7wrYiZ7YbfIeJa71GgDyYCwSJ3GHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=En84xvOe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8067606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 03:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=En84xvOe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D141F0089F;
	Tue, 10 Nov 2026 03:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794281347;
	bh=dhPtgnH28emxIkd3Cfandn0cSfoyzvmL2ASLY3fT6n4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=En84xvOerc95P2zv6fBYGVIYkmY1dCAsurh87DQuFyoFBa3Ctq03g4mQF7PkB04D/
	 eVJddcM5vNGSIP+53hAk39DirqTcqljmSAnjytBwaZuu5cFAxhVZ6pOLTSV2GB6Fju
	 xVrCBqC+Pubx4TDuOy9MtYi8J55ZUwhQu0OsPD/UBWjoXNkZeVOcdEce7eOtbhlL+J
	 ygCVRPn+CUzAzfW5fCtxHAi+v25kX+/6n+vpWid9LQXRZGIQCK+k8HAS70vSRGfIxx
	 eHUhIOxwzEct1cK0AmZjxUc5YI9RP574ZrLHrRNate6GHabjq8huZXYmKqJfB0JJVY
	 M4y92grepxXDQ==
Message-ID: <sashiko-outbox-206117@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_printer: Fix fsync waiting for active
 transfers
Reply-To: sashiko-reviews@lists.linux.dev
To: raoxu <raoxu@uniontech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <09D38BF2C904A309+20261110031832.219431-1-raoxu@uniontech.com>
References: <09D38BF2C904A309+20261110031832.219431-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 03:29:06 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] usb: gadget: f_printer: missing lock on error path in
  printer_write() [1]
--

commit 0f81a8331b5725aa0fef1a2421c8f88ca088bb9f
Author: Xu Rao <raoxu@uniontech.com>

usb: gadget: f_printer: Fix fsync waiting for active transfers

This commit updates printer_fsync() to check dev->tx_reqs_active instead
of dev->tx_reqs before waiting for pending TX transfers to complete.

> diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget=
/function/f_printer.c
> index 1857d786110b4..a2437c8e668da 100644
> --- a/drivers/usb/gadget/function/f_printer.c
> +++ b/drivers/usb/gadget/function/f_printer.c
> @@ -736,7 +736,7 @@ printer_fsync(struct file *fd, loff_t start, loff_t e=
nd, int datasync)
>  		return -ENODEV;
>  	}
> =20
> -	tx_list_empty =3D (likely(list_empty(&dev->tx_reqs)));
> +	tx_list_empty =3D (likely(list_empty(&dev->tx_reqs_active)));
>  	spin_unlock_irqrestore(&dev->lock, flags);
> =20
>  	if (!tx_list_empty) {

[Severity: Critical]
This problem wasn't introduced by this patch, but can printer_write()
corrupt dev->tx_reqs [1] when copy_from_user() fails?

drivers/usb/gadget/function/f_printer.c:printer_write() {
	...
		/* Don't leave irqs off while doing memory copies */
		spin_unlock_irqrestore(&dev->lock, flags);

		if (copy_from_user(req->buf, buf, size)) {
			list_add(&req->list, &dev->tx_reqs);
			mutex_unlock(&dev->lock_printer_io);
			return bytes_copied;
		}
	...
}

printer_write() drops dev->lock before copy_from_user() and adds req back
to dev->tx_reqs on the error path without re-acquiring dev->lock, racing
with TX completion handlers that also modify dev->tx_reqs.

[1] https://sashiko.dev/#/bug/linux-76584f8a-a4f9-490d-8c0c-3cdb1c0cb7cb

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/09D38BF2C904A309+20=
261110031832.219431-1-raoxu@uniontech.com?part=3D1
