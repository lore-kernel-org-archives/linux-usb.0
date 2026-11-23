Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399346;
	b=ssxZxRR7dbp50qV9S1oF/VV8mL3P/JvxS3frxMSgcxQ93Wrli/T+cmCMK7zFHFzpQJGH
	 stPSQVALUAlCumYigkjeMgmXXFPZ5x7T5zaEetWRGvW+VfHtS67T3QogcpCVVbAmzLVVb
	 WpqjS6RRlofhe/D69G2Q2Xhthv2WYH4LaChhzztR4TtBqxJbCWfCYuF2By+Qd+VHswt6r
	 Gur7zDCPwTDuYN8g2+3X++q21hGcDSQ4xUzyiAgO9mN4vercxzq9jLNXs4c8sn5n9fXK4
	 U49cBta+fLQ00tYR269IuUugnuGVneDPz0lCt+4gZ7jDNssB+MWn0IJ/as6CvqjiLjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399346;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uJWIegD+6dKBwPsVgyf7srGo4uVwE+ndJxnKOg50x1M=;
	b=kFBxt1hWq5B9CbekI22Wh716F/SUjutiiktXWGmtUDewpOvQnu4zEkCWfsmXtVCCiv8/
	 a3/UiMwDl8KjTBt+GL28ykHp/sOwyQWsikyJD1/nBE/AsDxF6oNYxzTrM0BPboExcug88
	 wulF6ErgHrS624C+yL9MHUj0r++llJN+1iyuwIBm1YM2sEwWRGc4pZKyfZI8vWTnHMHM3
	 qTA7lAjzLKTUnvBc3D2RMw9e9tDpyByt7ejn3D/37m5SF703Lghe3B4RABt5FpoWfTjXg
	 h5WWlVMOLf0WGTFVXCLkrOci16GjIge8rg11WYtockLrEAiNJMcRnypMjaoRwVMzFLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=om89+bIx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A58606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 02:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=om89+bIx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5AE91F000CF;
	Mon, 23 Nov 2026 02:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795399346;
	bh=uJWIegD+6dKBwPsVgyf7srGo4uVwE+ndJxnKOg50x1M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=om89+bIx9T1wvIeIAHQIEfYu4xTD+YSfpN58nCREhKUOIKK+ZdS8ZNsyQHCdJGz0u
	 ZM0TVl7tJnqT7tXN0PTYRyWGd4jrxuQnjJLeDhexHg+Ljt/ngFFO3Y2n6wTxLFpvs5
	 EX0uTIBEB/F96aQhzxBTgOBY6T7IgsmhQp8YyUuaVb2Zj3tWPkhvR4TDzvF5C6l1II
	 YiyYY4RWSBerSgHsZA272xZQ9vF5BHkwI4GqD+UVkaHMVkUcgCKfYw6o52JNwy1L2S
	 AN5Ta2vbiuGv/80HvENsEZCpnB6kdsSoPFGLYZRO33Jyhkyg2p0GGDKVei+l80u5VU
	 znMespaa8NXew==
Message-ID: <sashiko-outbox-228539@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: gadget: u_serial: Free the console request
 only once it is back
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabricio Akio" <fabricioakio@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261122-u-serial-console-dequeue-v2-2-820f355827e6@gmail.com>
References: <20261122-u-serial-console-dequeue-v2-0-820f355827e6@gmail.com>
 <20261122-u-serial-console-dequeue-v2-2-820f355827e6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 02:02:25 +0000
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
- [Medium] usb: gadget: u_serial: race queuing orphaned request in
  gs_console_work()
--

commit 2ecaecd16aac6588c9af880f3745192c34097106
Author: Fabricio Akio <fabricioakio@gmail.com>

usb: gadget: u_serial: Free the console request only once it is back

This commit tracks the console USB request state with cons->busy and a
kref on struct gs_console so that requests in flight during a disconnect
are orphaned and freed upon completion or queue failure rather than
immediately after usb_ep_dequeue().

> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/=
function/u_serial.c
> index 1f0110ea7f6a5..fd511327c0831 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c

[ ... ]

> @@ -1049,21 +1087,24 @@ static void __gs_console_push(struct gs_console *=
cons)
>  	}
> =20
>  	req->length =3D size;
> +	cons->busy =3D true;
> =20
>  	spin_unlock_irq(&cons->lock);
> -	if (usb_ep_queue(ep, req, GFP_ATOMIC))
> -		req->length =3D 0;
> -	spin_lock_irq(&cons->lock);
> -}
> =20
> -static void gs_console_work(struct work_struct *work)
> -{
> -	struct gs_console *cons =3D container_of(work, struct gs_console, work);
> +	if (!usb_ep_queue(ep, req, GFP_ATOMIC))
> +		return;
> =20
>  	spin_lock_irq(&cons->lock);
> +	orphaned =3D req !=3D cons->req;
> +	if (!orphaned)
> +		cons->busy =3D false;
> +	spin_unlock_irq(&cons->lock);
> =20
> -	__gs_console_push(cons);
> +	if (orphaned)
> +		gs_console_free_orphaned(cons, ep, req);
> +	return;
> =20
> +unlock:
>  	spin_unlock_irq(&cons->lock);
>  }

[Severity: Medium]
Can gs_console_work() queue a request that was already orphaned if a
disconnect and reconnect happen after cons->lock is dropped?

During set_alt (for example in gser_set_alt()), gserial_disconnect() is
followed immediately by gserial_connect(), which disables and re-enables
the same IN endpoint:

CPU0 (kworker)                    CPU1 (gser_set_alt)
gs_console_work()
  req =3D cons->req; /* req1 */
  cons->busy =3D true;
  spin_unlock_irq(&cons->lock);
                                  gserial_disconnect()
                                    gs_console_disconnect()
                                      cons->req =3D NULL;
                                      cons->busy =3D false;
                                      kref_get(&cons->kref);
                                    usb_ep_disable(ep)
                                  gserial_connect()
                                    usb_ep_enable(ep)
                                    gs_console_connect()
                                      cons->req =3D req2;
  usb_ep_queue(ep, req1, ...)
    /* succeeds on re-enabled ep */

Because ep is re-enabled before usb_ep_queue() runs, req1 is queued
alongside the newly allocated req2 instead of failing and being freed.
Both requests can then be queued concurrently on the IN endpoint, and if
gs_console_exit() runs while req1 is still pending in the controller, it
only checks and dequeues cons->req (req2), leaving the orphaned req1
queued and pinning cons->kref.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-u-serial-c=
onsole-dequeue-v2-0-820f355827e6@gmail.com?part=3D2
