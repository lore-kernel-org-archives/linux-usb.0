Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293362;
	b=TPHw0R5Xp795UGudmMEon/X0pSZXLazighDb8fu0WqWEwFOqjvbPodO28iXYrQK1F6AA
	 kpq5sE/uMb5t24WUKIZuZWZCtRrimxYqtxAt7NZbtFBA/b827G6rK1vpAxGThvuX+qCXH
	 4Npg0Ga3BO6OsHXOF1Is+WVBXpAFw8VkLJaRJkL98r/NuAJ+2JlagzEfQPvKdZF3Fsvvu
	 HyNewbNybQwQFX/E7dWVXtK8bmyJ6KQ5DGuSkleA19DdByytiR2XbigomYfN/LUO14AxL
	 Tu0aBw4g303FUlB5XsKL9sRy6xWjrt7Iy6JkU4PCd8n1622+zKHEmmLIt4OIYJB7G+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293362;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+shFParTKpAcgNRu/wnNMqsWciTYmgOft7VQdtJObWA=;
	b=eI4ik1NLejXJWmwwRaAOyJHlDJ3BTuubwoD23hOxYAUplpRsLpHA/zJF5SXVT5VeeiXP
	 5DReEa+oUSZh4w1vsMS5wyCKfNO6biagPBD57nDyqNy4VskE7zEa2yEA60POO89A3zWUY
	 /pdHyCMRX2KTGHkv7VUgtCB9Hun7qB048k6NSs0by7XeCAx2dtRWjAsDHad1FnvyEYI5f
	 uvrvFFb2TehqooXh6/Cxttnq/vtqbb3zNM/3l4fH7qUv5JsiiGobsAO7L521gcq3g1Nhp
	 cjrtir5dYk1ozh6LTWDAu+5dMURpoRaVUdr7uJBLqcs34T0WDEUFw1BtAy50lNLCK6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+93Iamc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708D3606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+93Iamc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07CE31F0089F;
	Tue, 10 Nov 2026 06:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293362;
	bh=+shFParTKpAcgNRu/wnNMqsWciTYmgOft7VQdtJObWA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e+93Iamc7InSZyWWnpx9tecM5dvocokxhYMOLMEiymGToCBUwpeK27a4NlkRaq69j
	 0/zIEoTc5AXjoj59wYU2H6uQ5ktRpLCmCWi1CJjYt7BY57Orf759kZmEJUMBDuY2lO
	 dEtDkoEQHwc/Vjaxf276jq+sTWENgLTVl3xpOYGsRezyY3OEBGdchufB9ea0GfjjLh
	 uNK1bkfhaU5XDXdm35eVOXHgP4n0sLae+fOLFtIQWSWuysSPwatRrJxESo3gsTnxpU
	 PJdhu+gPwP41LIIVZjCiQ7fyHk0f0I1QLLoion8FUC/cBYS+1quvcoZsiyyENx2/4N
	 CyzsnsDp9gobw==
Message-ID: <sashiko-outbox-206449@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/22] usb: gadget: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-11-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-11-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:49:21 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 2 related pre-existing issues it does not
introduce:
- [Critical] usb: gadget: f_hid: concurrent DMA buffer modification in
  f_hidg_get_report() [1]
- [High] usb: gadget: f_printer: hang in printer_read() on soft reset or
  disconnect [2]
--

commit 8f8dba8a29efc1fdd5e1c811223c191a86a07a95
Author: Shunbo Shi <shishunbo@cmss.chinamobile.com>

usb: gadget: fix a few spelling mistakes in comments

This commit fixes spelling mistakes in comments across the USB gadget
drivers.

[ ... ]

> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/fun=
ction/f_hid.c
> index 3c6b43d06a6d1..cf54704b7655b 100644
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c
> @@ -618,7 +618,7 @@ static void get_report_workqueue_handler(struct work_=
struct *work)
>  			 */
>  			req->buf =3D ptr->report_data.data;
>  		} else {
> -			/* If there are no prevoiusly sent reports send empty report */
> +			/* If there are no previously sent reports send empty report */
>  			req->buf =3D hidg->get_report.data;
>  			memset(req->buf, 0x0, req->length);
>  		}

[Severity: Critical]
This problem wasn't introduced by this patch, but can f_hidg_get_report()
overwrite ptr->report_data.data while it is queued for DMA [1]?

CPU0                              CPU1
get_report_workqueue_handler()
  spin_lock_irqsave(&hidg->get_report_spinlock, ...)
  req->buf =3D ptr->report_data.data;
  usb_ep_queue(cdev->gadget->ep0, req, ...)
  spin_unlock_irqrestore(&hidg->get_report_spinlock, ...)
                                  f_hidg_get_report()
                                    spin_lock_irqsave(&hidg->get_report_spi=
nlock, ...)
                                    ptr =3D f_hidg_search_for_report(...)
                                    copy_from_user(&ptr->report_data, ...)
                                      <-- sleeps in atomic & overwrites DMA=
 buffer

When a host GET_REPORT request races with a GADGET_HID_WRITE_GET_REPORT
ioctl, f_hidg_get_report() calls copy_from_user() into ptr->report_data
while the buffer is still in flight on ep0, corrupting the transmitted data
and violating DMA coherency.  Calling copy_from_user() under
hidg->get_report_spinlock also sleeps in atomic context.

[ ... ]

> diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget=
/function/f_printer.c
> index 1857d786110b4..3f25d99be34d8 100644
> --- a/drivers/usb/gadget/function/f_printer.c
> +++ b/drivers/usb/gadget/function/f_printer.c
> @@ -557,7 +557,7 @@ printer_read(struct file *fd, char __user *buf, size_=
t len, loff_t *ptr)
> =20
>  		/* If we not returning all the data left in this RX request
>  		 * buffer then adjust the amount of data left in the buffer.
> -		 * Othewise if we are done with this RX request buffer then
> +		 * Otherwise if we are done with this RX request buffer then
>  		 * requeue it to get any incoming data from the USB host.
>  		 */
>  		if (size < current_rx_bytes) {

[Severity: High]
This problem wasn't introduced by this patch, but can printer_read() hang
forever on dev->rx_wait when a soft reset or disconnect occurs [2]?

drivers/usb/gadget/function/f_printer.c:printer_read() {
	...
	if ((current_rx_bytes =3D=3D 0) &&
			(likely(list_empty(&dev->rx_buffers)))) {
		...
		wait_event_interruptible(dev->rx_wait,
				(likely(!list_empty(&dev->rx_buffers))));
		spin_lock_irqsave(&dev->lock, flags);
		if (dev->interface < 0)
			goto out_disabled;
	}
	...
}

printer_soft_reset() and printer_func_disable() move all entries from
dev->rx_buffers to dev->rx_reqs, set dev->reset_printer =3D 1 or
dev->interface =3D -1, and wake dev->rx_wait.  Because the wait condition
only checks !list_empty(&dev->rx_buffers), printer_read() goes back to
sleep while holding dev->lock_printer_io, deadlocking subsequent I/O on the
gadget.

[1] https://sashiko.dev/#/bug/linux-59b5d9cb-e0c6-4190-8add-226d731d01e5
[2] https://sashiko.dev/#/bug/linux-05ce2087-0db6-45a4-8d55-98d851217360

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110064105.2033=
5-1-shishunbo@cmss.chinamobile.com?part=3D10
