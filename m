Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EFF4322E6
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 12:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374934; cv=none; b=spsdkHJvOtPYUrCZP3VtXLhMv0b+RfSlhnKxbhA2pMIJ32F8/hgC0WDWSyVggqHGiKww9yaswjI8ik+f8Kgi3AcQ/K4fwb9DqnpV6wxmmlR1bP3baqfoH1WbEO9WVu6WgI2bhOF/KlPlankhk5/2h1DJgiWTB54EAQOoSPXkhs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374934; c=relaxed/simple;
	bh=xhTcIDDMmwTiZsfdgGhr9KBnYcOGCHEpbGAxAtvJFNc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ojDdQ1heJd4IoXg07rY0LpV+JCvhbx316LrJ8JljW6H3DmBKRkBMsD5PvdUAecSfXN7yfuKVBv7N3L7Dig4LnuqcAfW6/nAKidmZ7I9eXHbx6JXCDbNxtmUUhLC8pZlJg1fMpiNSCmEX8s4ExSBsbDunEY9CcRUSXf2GfzSCo3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8lAQHK3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8lAQHK3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01FE1F0089B;
	Wed,  7 Oct 2026 12:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791374926;
	bh=KvQsRGoCcF6GMA+G6e/v7yZPfArCoKQyf2wGI3BNEoU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V8lAQHK3u3ttJfzGNPhMiQpN1DZAM+ucCaZ0UxgT+y2+WwGzzQyYFACyDjN2p37/N
	 AuetotNvAVgqByF1HVx7+Wau8TI/h8lC5GneyaP9aAYBtNGvxS1AfxTag8jWeQQvFg
	 kWYp6VkPTJLnEq+Hz4Ow5f37pyA0jdnFgkuTDjNl2sp1WLIr7WOA7S20fv5i5b1lKH
	 q+eGC8qybvhw/gQwXb8O+ImCEF42GYXmfR/eoSu5zrJ1saURL3d5l9xo3OliOrcEB2
	 gzsiCyc+dlVC5dc5v1gY9hi3w1BxNBhhMsC9//HwJ8pjNqyE1tf30nOTe8lAX3ZYN2
	 j60o9zdmiyrhg==
Message-ID: <sashiko-outbox-162975@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2] usbnet: fix EVENT_RX_PAUSED race in
 usbnet_skb_return()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?w5ZtZXIgTWV0ZSBLYXlh?= <omermetekaya0@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006120825.342164-1-omermetekaya0@gmail.com>
References: <20261006120825.342164-1-omermetekaya0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 12:08:45 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usbnet: missing BH disable in usbnet_resume_rx() corrupts per-CPU =
stats
--

commit 36ab26ed669164df5f63bb5c4faccea95151ecd0
Author: =C3=96mer Mete Kaya <omermetekaya0@gmail.com>

usbnet: fix EVENT_RX_PAUSED race in usbnet_skb_return()

This patch fixes a race condition where usbnet_skb_return() could pass the
EVENT_RX_PAUSED check while usbnet_resume_rx() clears the flag and drains t=
he
queue. The fix implements a double-check pattern under the rxq_pause.lock on
the slow path to prevent skbs from being stranded.

> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
> index a19ecf718f36a..dc340ea248c6b 100644
> --- a/drivers/net/usb/usbnet.c
> +++ b/drivers/net/usb/usbnet.c
[ ... ]
> @@ -699,8 +704,9 @@ void usbnet_resume_rx(struct usbnet *dev)
>  	struct sk_buff *skb;
>  	int num =3D 0;
> =20
> -	local_bh_disable();
> +	spin_lock_bh(&dev->rxq_pause.lock);
>  	clear_bit(EVENT_RX_PAUSED, &dev->flags);
> +	spin_unlock_bh(&dev->rxq_pause.lock);
> =20
>  	while ((skb =3D skb_dequeue(&dev->rxq_pause)) !=3D NULL) {
>  		usbnet_skb_return(dev, skb);
> @@ -708,7 +714,6 @@ void usbnet_resume_rx(struct usbnet *dev)
>  	}
> =20
>  	queue_work(system_bh_wq, &dev->bh_work);
> -	local_bh_enable();

[Severity: High]
Does removing local_bh_disable() cause usbnet_skb_return() to execute with
preemption enabled here?

usbnet_resume_rx() is invoked by usbnet_change_mtu() during an MTU change,
which runs in process context with preemption enabled (holding the RTNL loc=
k).
By removing the local_bh_disable() wrapper, usbnet_skb_return() is now call=
ed
with preemption enabled.

This leads to issues inside usbnet_skb_return(), such as evaluating a per-C=
PU
pointer in preemptible context, which triggers a kernel warning:

	struct pcpu_sw_netstats *stats64 =3D this_cpu_ptr(dev->net->tstats);

Additionally, on 64-bit systems, u64_stats_update_begin_irqsave() is a no-op
regarding preemption/interrupts. Without BH disabled, the update lacks mutu=
al
exclusion against the network softirq on the same CPU, causing data races a=
nd
lost statistic increments:

	flags =3D u64_stats_update_begin_irqsave(&stats64->syncp);
	u64_stats_inc(&stats64->rx_packets);
	u64_stats_add(&stats64->rx_bytes, skb->len);
	u64_stats_update_end_irqrestore(&stats64->syncp, flags);

On 32-bit systems, if the thread migrates to another CPU after this_cpu_ptr=
()
but before taking the IRQ lock, it will concurrently modify a different CPU=
's
stats while that CPU processes softirqs. This race can corrupt the syncp
seqcount, causing stat readers (like ndo_get_stats64) to spin infinitely and
lock up the system.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006120825.3421=
64-1-omermetekaya0@gmail.com?part=3D1
