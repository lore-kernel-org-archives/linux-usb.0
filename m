Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794544025;
	b=07EhFOgzwNbliOYRWo6wX+/h4RNnJKhK0nWJlmZzQElrHELm7yd8Y+0yzH0IcC+GJfbV
	 jLJJmI93Z0O6xc7vFLtvN5TCGUzsy/0UrZPdfNiA4nj5qgmLQIJ0ZKRDZCbe79xi0IUPu
	 +3Pvql4zw3aDqimdvXGQ0g4f7gKb02tyYeprGtBPm4H5ZaXgkSdWrGv9jz6jotCeD/n60
	 xBy5QfF35FbYdXs/4PVsjO3pd9BHV/Pip+tUdpOzA2IiFAedOaJRyBFB+xOwQe75nVrZS
	 jHVtkFrYomnUJ/xVsrHBC8yXeCDhig7WArV3WVO2cQttcZ3FEg48NcYQkNlmVM6GVwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544025;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+YZakwN8aWlZF7Tz515MWe8LxLuHqgkizjgmsLc6dIU=;
	b=mpmIS/usFhA1C0A20IjkpNoAHtZdbCrtK6FEXyZJsGGZY4OBGexGuJi6peKX2YKyE3kO
	 D2xsgl0HIY9pCP/kTMZtGlclXbI2YrUQIR8h7CT7Uht8cGrlIBG1WQAqYMtdRKwyWIHss
	 paPTf1Un2Fh2caSKaLymm8qbAYzuxtjHFBkq8Jm/G322/fohG8gLveeSACjz1A86UHaov
	 CRnie1GMbEXdZ4jL2xujDlww1goQQ3Nh3ApDboOB0DP7+8CRYINgvxjQxWF3dSORUYqJ1
	 1hTS+aMxhSXnjqXvSGqkzXFWLbS/vCRC0wD2zTHvTZRmXWo0gxqW47uS/9q5jjAv2qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=brbQpsgs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E356E606A31C
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 04:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=brbQpsgs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BC01F000C4;
	Fri, 13 Nov 2026 04:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794544024;
	bh=+YZakwN8aWlZF7Tz515MWe8LxLuHqgkizjgmsLc6dIU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=brbQpsgsvOV9F9TMAr3Sziga6VAVQY0A3zqYqGKj+Y2SZC6oXWqiFMPHXHHullWZX
	 6o0i3qCv2jPPgTO+wLwAXmxpS0KrM+bGxkp1gXxi5xBJQhphrQ59AWkMlDDfW6pBMU
	 rIiVlTFTgasTuK9LIF/KvWV31dBxAvgFX8tR9Q+vBJ0tBXETzdxPTEkwSZ4PrO1z3D
	 o0yOZxFr98x+eMTj+KiVCk0ADecLD8k+Eogar+l9xKNj5SNqESjS9SMbe9X4u3/O+W
	 J75Cc+DQL8w8PIDCghZH+3wsBimvUXGy7UHWlyMDkXeutkolhANEGy7SD4BIucDNn0
	 wIF9aoOIzXDzg==
Message-ID: <sashiko-outbox-212167@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] usb: core: hcd: Disable IRQs when taking bh->lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chien Kun Niu" <rickyniu@google.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113041948.1280304-2-rickyniu@google.com>
References: <20261113041948.1280304-1-rickyniu@google.com>
 <20261113041948.1280304-2-rickyniu@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 04:27:03 +0000
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
- [Critical] usb: core: hcd: missing BH work cancellation on error path
  in usb_add_hcd() [1]
--

commit 4dc28efe0885658abc7f649ad1d1ba25793691d1
Author: Chien Kun Niu <rickyniu@google.com>

usb: core: hcd: Disable IRQs when taking bh->lock

This commit switches usb_hcd_giveback_urb() from spin_lock() to
spin_lock_irqsave() when acquiring bh->lock to prevent same-CPU hardirq and
softirq deadlocks.

> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 8e8a5f59b319b..7bb25e7c447d4 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -1731,6 +1731,7 @@ static void usb_giveback_urb_bh(struct work_struct =
*work)
>  void usb_hcd_giveback_urb(struct usb_hcd *hcd, struct urb *urb, int stat=
us)
>  {
>  	struct giveback_urb_bh *bh;
> +	unsigned long flags;
>  	bool running;
> =20
>  	/* pass status to BH via unlinked */
> @@ -1747,10 +1748,10 @@ void usb_hcd_giveback_urb(struct usb_hcd *hcd, st=
ruct urb *urb, int status)
>  	else
>  		bh =3D &hcd->low_prio_bh;
> =20
> -	spin_lock(&bh->lock);
> +	spin_lock_irqsave(&bh->lock, flags);
>  	list_add_tail(&urb->urb_list, &bh->head);
>  	running =3D bh->running;
> -	spin_unlock(&bh->lock);
> +	spin_unlock_irqrestore(&bh->lock, flags);

[Severity: Critical]
This problem wasn't introduced by this patch, but can usb_giveback_urb_bh()
access a freed struct usb_hcd [1] if register_root_hub() fails in
usb_add_hcd()?

During register_root_hub(), root-hub URBs have is_root_hub(urb->dev) set, so
usb_hcd_giveback_urb() queues them on hcd->low_prio_bh.bh or
hcd->high_prio_bh.bh.  In usb_giveback_urb_bh(), __usb_hcd_giveback_urb()
invokes urb->complete() and wakes the waiting task before finishing its own
bookkeeping on struct giveback_urb_bh:

CPU0                                CPU1
usb_add_hcd()
  register_root_hub()
    ...
      usb_hcd_giveback_urb()
        queue_work(..., &bh->bh)
                                    usb_giveback_urb_bh()
                                      __usb_hcd_giveback_urb()
                                        urb->complete()
    // fails and returns error
  goto err_register_root_hub;
usb_put_hcd(hcd)                    // frees hcd
                                      bh->completing_ep =3D NULL;
                                      spin_lock_irq(&bh->lock);  <-- use-af=
ter-free

Neither the err_register_root_hub error path in usb_add_hcd() nor
usb_stop_hcd() cancels hcd->high_prio_bh.bh and hcd->low_prio_bh.bh before
the caller drops the last reference to hcd.

[1] https://sashiko.dev/#/bug/linux-6f3b1df1-c32a-430a-a126-7f20495af396

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113041948.1280=
304-1-rickyniu@google.com?part=3D1
