Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566766;
	b=tSNEonVPaIGJvA3hXpFoGVeZwRbl6McEDDmqfVRlRpSJRBieGPviPmhW30jLQ9c7Iuxn
	 URPU/ay3QEE9HisBAcO07QpCJnj9cqDx1CwY0e5quzljlFTmODKAYfP66wcXVHDyfWaMm
	 4hwvm74Z565ZTagvsJe+DrzBz59ubDefsDHBmrxxDdDOV0+fednc2lidMzEKQJh3wglG+
	 +S7ZVQ7BElkQXdkaWFxWctJrt9SBynQ0/6oM8rDMZMUVflEfaCMm0ZbVoBbhDLa3RKYCc
	 5oEDP9a/UfLAiHz7Ir6a4R7J27e9b8skg9zPXVbATAPHwkxfyrNwLJjU1TZpA1iYrmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566766;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VwbC906RMUgi4n+dNhYH/xg1k4Q+JgMD/Lcsl7UIIlg=;
	b=IxPnUoUsfhfMKx9UtJYD9TXVw/jACeqzi41Iy5F1F4xAVbwxye9vgFgTz3DiiqX06abX
	 OcgxxuwKxfPCo0yxAq3mumJcbgQv7nrUaOmnKuaW1KaRZpMWkcAXQUgf6XHK8uwrqIEgj
	 0/AbbN5O5/HMTDHicUoh9C5aU3cFSNCtF7SyMSveShzSEgr9Y9TT92Cg/RbOx+H07yqgE
	 449fJDbVG2td49+V3u17MG5HFVD+UA7Uebu53m2gETNQLfwGuwJphiQCMdd65EatEOfIH
	 ZWvzpARjlmPWe1k7xnInNePHQP/05myflI6Ugx0SK5LI+HKrnyaeAMdp1Z6JKRFa5Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hgIc3gny;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E174606A321
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 10:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hgIc3gny
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD961F000C4;
	Fri, 13 Nov 2026 10:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794566766;
	bh=VwbC906RMUgi4n+dNhYH/xg1k4Q+JgMD/Lcsl7UIIlg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=hgIc3gny5DlelGxgF282oUuMvYjcBg/kkpaPYWCUxoAIIdaw5gcL+2dtM+Cmu5E3H
	 g6ZEezjwYfdNDrIK1giM7RmtwOtjsezVvH/F7vjiPZnuLmvxSxpzotgc6qXrdIWu8V
	 gqDkjFIQiP0ebsWulQ59cx7rUSeOZYZsEDoh0SUvmHCqQRJhRCSBpZvxQKbvjH2BC6
	 tfiUpAAJJYCnRz4sqyceC5or5WNBxskT5KIsU41flHdsh3Il+EL8V2w9iFDrvbmDXz
	 rSHSuBME0BccEgSSbES/qeNARTEfQkjS/LH1xr6kpzNTqoHFZoaeA1uh9D1q8GznON
	 WOwiP9V87cPaw==
Message-ID: <sashiko-outbox-212634@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 1/1] net: usb: rtl8150: break cycle between tasklet
 and URB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oliver Neukum" <oneukum@suse.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261112104548.693456-1-oneukum@suse.com>
References: <20261112104548.693456-1-oneukum@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 10:46:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] net: usb: rtl8150: infinite tasklet loop on -EPERM in
  rx_fixup()
- [High] net: usb: rtl8150: double free of dev->rx_skb on unplug in
  read_bulk_callback()
- [Medium] net: usb: rtl8150: false dev_err() on res =3D=3D 0 in
  intr_callback()
- [Medium] net: usb: rtl8150: unbalanced URB reject count on error in
  rtl8150_open()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] net: usb: rtl8150: dangling rx_skb pointer in
  read_bulk_callback() [1]
--

commit bed5b8274af4c5f050a94925def40d4d88f1a
Author: Oliver Neukum <oneukum@suse.com>

net: usb: rtl8150: break cycle between tasklet and URB

This commit replaces usb_kill_urb() with usb_poison_urb() in
unlink_all_urbs(), blocks URBs at allocation time and unpoisons them on
open, and checks RTL8150_UNPLUG in read_bulk_callback() to break the
resubmission cycle between dev->rx_urb and dev->tl on disconnect.

> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> index d51e43170e033..846e6329d571c 100644
> --- a/drivers/net/usb/rtl8150.c
> +++ b/drivers/net/usb/rtl8150.c
> @@ -343,6 +343,13 @@ static int alloc_all_urbs(rtl8150_t * dev)
>  		return 0;
>  	}
> =20
> +	/*
> +	 * They need to be blocked so that open()
> +	 * can unblock them
> +	 */
> +	usb_block_urb(dev->rx_urb);
> +	usb_block_urb(dev->tx_urb);
> +	usb_block_urb(dev->intr_urb);
>  	return 1;
>  }
> =20
> @@ -353,11 +360,18 @@ static void free_all_urbs(rtl8150_t * dev)
>  	usb_free_urb(dev->intr_urb);
>  }
> =20
> +static void reenable_all_urbs(rtl8150_t *dev)
> +{
> +	usb_unpoison_urb(dev->rx_urb);
> +	usb_unpoison_urb(dev->tx_urb);
> +	usb_unpoison_urb(dev->intr_urb);
> +}
> +
>  static void unlink_all_urbs(rtl8150_t * dev)
>  {
> -	usb_kill_urb(dev->rx_urb);
> -	usb_kill_urb(dev->tx_urb);
> -	usb_kill_urb(dev->intr_urb);
> +	usb_poison_urb(dev->rx_urb);
> +	usb_poison_urb(dev->tx_urb);
> +	usb_poison_urb(dev->intr_urb);
>  }

[Severity: High]
Can poisoning dev->rx_urb cause rx_fixup() to spin in an infinite tasklet
loop on -EPERM?

Once unlink_all_urbs() poisons dev->rx_urb in rtl8150_close() or
rtl8150_disconnect(), usb_submit_urb(dev->rx_urb, GFP_ATOMIC) returns -EPER=
M.
Neither read_bulk_callback() nor rx_fixup() ignores -EPERM, and rx_fixup()
never checks RTL8150_UNPLUG:

drivers/net/usb/rtl8150.c:rx_fixup() {
    ...
	if (test_bit(RX_URB_FAIL, &dev->flags))
		if (dev->rx_skb)
			goto try_again;
    ...
try_again:
	status =3D usb_submit_urb(dev->rx_urb, GFP_ATOMIC);
	if (status =3D=3D -ENODEV) {
		netif_device_detach(dev->netdev);
	} else if (status) {
		set_bit(RX_URB_FAIL, &dev->flags);
		goto tlsched;
	}
    ...
tlsched:
	tasklet_schedule(&dev->tl);
}

If dev->tl is scheduled when unlink_all_urbs() poisons dev->rx_urb (or if
read_bulk_callback() hits -EPERM at goon: during rtl8150_close() where
RTL8150_UNPLUG is not set), rx_fixup() sets RX_URB_FAIL and reschedules
dev->tl in a tight softirq loop, locking up softirq processing on Close and
hanging tasklet_kill(&dev->tl) in rtl8150_disconnect().

> @@ -425,6 +439,11 @@ static void read_bulk_callback(struct urb *urb)
>  	netdev->stats.rx_bytes +=3D pkt_len;
> =20
>  	spin_lock_irqsave(&dev->rx_pool_lock, flags);
> +	/* prevent an eteral loop */
> +	if (test_bit(RTL8150_UNPLUG, &dev->flags)) {
> +		spin_unlock_irqrestore(&dev->rx_pool_lock, flags);
> +		return;
> +	}
>  	skb =3D pull_skb(dev);
>  	spin_unlock_irqrestore(&dev->rx_pool_lock, flags);
>  	if (!skb)

[Severity: High]
Does returning here when RTL8150_UNPLUG is set cause a double free of
dev->rx_skb?

Just before taking dev->rx_pool_lock, read_bulk_callback() passes
dev->rx_skb to netif_rx().  Returning without clearing dev->rx_skb to NULL
leaves the consumed skb pointer in dev->rx_skb, which rtl8150_disconnect()
then frees a second time via dev_kfree_skb(dev->rx_skb).

[Severity: High]
This problem wasn't introduced by this patch, but read_bulk_callback() also
leaves [1] dev->rx_skb holding a dangling pointer to the skb handed to
netif_rx() whenever pull_skb() returns NULL and jumps to resched:.  If the
device is disconnected before rx_fixup() replaces dev->rx_skb,
rtl8150_disconnect() double frees dev->rx_skb, and if the device is closed
and reopened or suspended and resumed in that state, rtl8150_open() or
rtl8150_resume() resubmits dev->rx_urb using the freed skb buffer.

> @@ -518,7 +537,7 @@ static void intr_callback(struct urb *urb)
>  	res =3D usb_submit_urb (urb, GFP_ATOMIC);
>  	if (res =3D=3D -ENODEV)
>  		netif_device_detach(dev->netdev);
> -	else if (res)
> +	else if (res !=3D -EPERM)
>  		dev_err(&dev->udev->dev,
>  			"can't resubmit intr, %s-%s/input0, status %d\n",
>  			dev->udev->bus->bus_name, dev->udev->devpath, res);

[Severity: Medium]
Doesn't "else if (res !=3D -EPERM)" evaluate to true when usb_submit_urb()
succeeds with res =3D=3D 0?  That logs a false dev_err() on every interrupt=
 URB
completion unless the check is "else if (res && res !=3D -EPERM)".

> @@ -751,6 +770,7 @@ static int rtl8150_open(struct net_device *netdev)
>  	if (!dev->rx_skb)
>  		return -ENOMEM;
> =20
> +	reenable_all_urbs(dev);
>  	set_registers(dev, IDR, 6, netdev->dev_addr);
> =20
>  	usb_fill_bulk_urb(dev->rx_urb, dev->udev, usb_rcvbulkpipe(dev->udev, 1),

[Severity: Medium]
What happens to the URB reject count if usb_submit_urb() fails in
rtl8150_open()?

reenable_all_urbs() decrements urb->reject from 1 to 0 on all three URBs,
and the error paths in rtl8150_open() return without calling
unlink_all_urbs() to re-poison them (only calling usb_kill_urb(dev->rx_urb)
when dev->intr_urb submission fails):

drivers/net/usb/rtl8150.c:rtl8150_open() {
    ...
	if ((res =3D usb_submit_urb(dev->rx_urb, GFP_KERNEL))) {
		if (res =3D=3D -ENODEV)
			netif_device_detach(dev->netdev);
		dev_warn(&netdev->dev, "rx_urb submit failed: %d\n", res);
		return res;
	}
    ...
	if ((res =3D usb_submit_urb(dev->intr_urb, GFP_KERNEL))) {
		if (res =3D=3D -ENODEV)
			netif_device_detach(dev->netdev);
		dev_warn(&netdev->dev, "intr_urb submit failed: %d\n", res);
		usb_kill_urb(dev->rx_urb);
		return res;
	}
    ...
}

Because rtl8150_close() is not called when rtl8150_open() fails, the next
rtl8150_open() call decrements urb->reject from 0 to -1, causing all
subsequent usb_submit_urb() calls to fail with -EPERM and causing a later
unlink_all_urbs() to increment urb->reject back to 0 instead of poisoning
the URBs.

[1] https://sashiko.dev/#/bug/linux-361a8ebc-4be5-4126-a2d9-b88d108064a9

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112104548.6934=
56-1-oneukum@suse.com?part=3D1
