Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794464249;
	b=Dscc+OiFiow9NjnIlnN7xsbYOb+JghrShcVq+C5MCrnB4TuJJauIZzusPBRHJ5ZQPIM9
	 VWXEY1msi5wj/3+sPqpGraFrklTnNO4ToJpsI8qYg7qKxYj6YUYvXu+gg+I0Jah9A2xg8
	 ETt5V3lpfELVUXGbuWwinqjn4R67K6xIm1PhjX0lO2MBu+PP/E0y6j1YjxiZBRc7M1HqI
	 FQtHMnexzxeVX7QluM/XzvyqrjjkK93Viv2+ZMs+J5yP8B9n8+MDQkI4mudcmX2qsWsMo
	 AstEd1wfHgbPNIkliSRvZ6y3gtlxJ5SJILM6YYYwnIAdIjNwSFRK/g+/AuVYIr8mxPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LBkvWiELYKcawLYZyUR8viHzi3N0cQ25eaouxLSJFuI=;
	b=djPB+Y6cFHiuDLHY32QOXpC7MYjFXcCG9qgvrLnsIpQyig4CyzsVscnVi92scIB6YOTo
	 7T/HjeEYvtFC+Z63fjfwLN2R0CksIuqFEvYc1TZSgNdFe8eDH2+ksSzDcE+mHow9AgBpc
	 uOo8TxGPBsI30bHmkVUnJFnQpM6AADEyh0lMyU6icWd7NVKdU+hp4obFgOib7Nf6wG0XY
	 LRyxXsok8e8aUrrUvbE02XY+1kEAi05X15GBi3NALVKvMxfRrIBfcw/E+dcFY4B5WBTSJ
	 jq8Jld9whF2I0z3ACMusmXB68PrVa6p9tqCZD6qNXXrmlD9Evu0xB+GFKQNnvsf2Hrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BEvEvhBA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC61606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 06:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DC61606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BEvEvhBA
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c169ae1cb26so84556366b.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 22:17:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794464247; cv=none;
        d=google.com; s=arc-20260327;
        b=eDkdPzUozBkFBfnoF/3QjY0MZnQf2eAzlpMK4J+jDfXjribh/amPtC/+aDwAUn6to3
         Y1uJb4DML0EcnpgpXubt8Xcc6alsAeCvrVZhn+Th0xxAgkFr29C5ij2lFQFRrdDpO9G9
         TBCcOD8Er2pJp3XLip7iyhM58CdfXbrEtMv8k3aFDVOYpumGpNJ96d92gCCjdwVBE/IO
         Zh0PjmDTp5IeBl/elN2r8mNv7PighSIUNOTTICmAj166NowughucZ2ctfXIYgSV3ay1L
         Y6zQhSRCAdtTzp9iOJG7TB+h/cjFTYbMHOn8O65hMqS2FLNVPX/EoZiVHUuEdWNtLQu3
         mKQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LBkvWiELYKcawLYZyUR8viHzi3N0cQ25eaouxLSJFuI=;
        fh=nJqubhMzP8qr0XuhpwjlEhU6g9yneq6z6AIwa0dEbYk=;
        b=AOjZ/Cz/jxezZAD40jTDFfYpyqtMTghubTmuKJAHWbLLPxeRwlmI9r4FyaRM53LLN6
         iXDI+mEIUX29c3WT5EOgffZ8Ry+OM0zBn+Ghxr3pcILLdGtTaebTYxWw51RLgQtAPTdV
         k7ldJ/6jq0nKtbIJ8BkkQgVvH+Wrq3ixfGazzcVxne9Xe4qWkkvwNag3PR7WmrnFs+9l
         gpVM3qN+u4MUYHpQ9+4HvGSYL6HCbV9OSXBehStMFM2CnpZojVuazI+8oa9IcXZ2/XXU
         4KYOM608l3VL7wQLgjbGFBjrMNNutcXuyd3+MM7QVG5XI7xmW6HGTKGYi11GRCt8Yeuo
         iZ7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464247; x=1795069047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LBkvWiELYKcawLYZyUR8viHzi3N0cQ25eaouxLSJFuI=;
        b=BEvEvhBAped+W5UE0YDULfJk/MUxg512y1lESWE230SPAvsBVXdB3keD/zpqDobK0u
         7COYueevNkjlf0zFKBFHoXcBzhi4QEIEfN5Kg4heVi/9xtJ2zZNL7w3fXYlRamv43NdM
         eCGXRU3y4VqWzSfkmvdr1pzQXmm4r+ToFh5kGf6hEraJnfOKZV+8mCkSZNy/rzNuDxJr
         fa8j5QyIbKMMLqTEBTuEQfN5vlbbRpqk+SRZqVtOoRN0vwOpRyevhlHlrg96k8o83YiX
         QO6x6FbUgpXUgzY3Bu4Si7EFbB3bi8mBaFssTI2UeO07Df3kl1nvqGp3+e4/Ly3z/l2B
         2idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464247; x=1795069047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBkvWiELYKcawLYZyUR8viHzi3N0cQ25eaouxLSJFuI=;
        b=lAPgC5NZKRqY+oN2IDBNsb1rzXwZE6NtbFCU+RNDzqTp4oDWtRaIfr/PjFPT/2+tLD
         TZwqnAvcIP1PJEgS0kFecfJwbWRYCoKJIabSeIhIeFqJZjCz/skxvDajEcVDnJIpLgDB
         AoUgi6q+aAmXZ3FtDI/k7ivIDUJ1yVT50GQR1Ixnl+f4MbZ+BOhH/XKhNC0ie5CGPysQ
         XKEL5QSv8TWkZNslBjY9whBiNCPdBuc4vf3pdMBX75JGV5anGiO4s5igUbhptQqf/KlO
         kreuIEO1RMInIScR5PDNzy2N6liD6rtjlcDVWfHetIW8CBfmRxIerdOZ/DzxUZfkIFpi
         1CSg==
X-Forwarded-Encrypted: i=1; AL+hErF2oMzPMxhALkM5NGxzVcwonFyVikVqmQe1bmYG0SzNRMOCw5ppoT6lJeKELx0oCbxVhcTE9GehceE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MvypnNOQOTrQogXan3qn7R88hl1sFUdoRKGGKbENbFhBCp3de
	6ewBEqkjQLxHPZBMaWX4tutoJthnkDSw1068XxHspnQZkqtaOrLqOtqEsls0iY8FfoA1+CtLl1X
	QQx8cur7FC061EXcY7yus8XIVn8lFOzVyRqo=
X-Gm-Gg: AYBFou2Mr1Gp8QN7l06QrslKZGSvvVSQWaEaZz3Lgu08ShWMtmHvScHOP6SsCaGKoBB
	+YeYmtm2dR9M4z7hijUylvop4gj2eD53m/VF1HniCrrWz77FdEcjG7PCpDwk4vbaPwiF2LJn7Yb
	O9gSPR6j4EaT6n3gXUZaDeBKszfgx+4Zpv6GciRCmEDOcq3ySxrBXhBHyX8V4e62ybCNd0j1I1m
	fU/+sc1yHeBMEXmis5Q0YZDFRlNN1v++xOjs+hTKW0bA3LlVTJ7JlU8oKX2KX+Fs+r0xpaGOp0n
	+GR/0K4UJ0F6dN6vrc5cTjKefm3iDJAaalckS2Oq6rk2nrl3E5vuq7TL9VwQZZAswKXMR7plU+k
	ql0exNC0c0dUB6jwvH+f+ZovQCA4EqSVa1u/7tXGP4xeiI7TqoGUiYypseqzFEnci4+eOhxZd5n
	CeU9qVEYozuSYBgKMyKnhfjZHi9Umn4tHLfIE9yYUz1qcvMWVj+QzOkNhnTT4gY7GqiqBj
X-Received: by 2002:a17:906:d54e:b0:c50:8612:d441 with SMTP id
 a640c23a62f3a-c508612d6e1mr32110666b.21.1794464246673; Wed, 11 Nov 2026
 22:17:26 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110043016.56986-1-mhun512@gmail.com> <179445789040.2199510.7426210198945271595@kernel.org>
In-Reply-To: <179445789040.2199510.7426210198945271595@kernel.org>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 12 Nov 2026 01:17:14 -0500
X-Gm-Features: AclHuK_N4Kjnino_xgsBrqlpbKR-zvn6NbL5YTvL81RB09JJGEvG7Ht4_NlvG2c
Message-ID: <CAGEsz8Gocd4J8-K0sngFmF6NwQqNQh5KtCMp8GrM8fusCNaF5A@mail.gmail.com>
Subject: Re: [PATCH net] net: usb: rtl8150: fix rx tasklet use-after-free on disconnect
To: netdev-bot+sashiko@kernel.org
Cc: petkan@nucleusys.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

Thanks for reviewing the patch and preparing the additional fix.
Please go ahead and submit it. I appreciate your help with addressing
the URB resubmission issue.

Thanks,
Myeonghun

2026=EB=85=84 11=EC=9B=94 11=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 11:31,=
 <netdev-bot+sashiko@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 (2) =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The patch's new tasklet_kill() calls in rtl8150_disconnect()
>   cannot reliably stop rx_fixup() when it keeps rescheduling itself, and=
=E2=80=A6
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the stale
>   dev->rx_skb pointer can lead to a double free or a device DMA into=E2=
=80=A6
> - [High] This problem wasn't introduced by this patch, but pegasus.c, the
>   driver rtl8150 was derived from, has the same late-completion tasklet=
=E2=80=A6
>
> --
>
> net: usb: rtl8150: fix rx tasklet use-after-free on disconnect
>
> This adds a second tasklet_kill() in rtl8150_disconnect(), placed after
> unlink_all_urbs(). It is meant to drain an RX tasklet that a late
> read_bulk_callback() could have scheduled after the first kill, before th=
e
> driver data is freed.
>
> > diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> > index d51e43170e033..98c36c3779564 100644
> > --- a/drivers/net/usb/rtl8150.c
> > +++ b/drivers/net/usb/rtl8150.c
> > @@ -971,6 +971,8 @@ static void rtl8150_disconnect(struct usb_interface=
 *intf)
> >               tasklet_kill(&dev->tl);
> >               unregister_netdev(dev->netdev);
> >               unlink_all_urbs(dev);
> > +             /* A completion may have scheduled it after the first kil=
l. */
> > +             tasklet_kill(&dev->tl);
>
> [Severity: Medium]
> Can this tasklet_kill() actually end the rx_fixup() reschedule loop that =
the
> commit message describes?
>
> The commit message says "disabled endpoints make RX resubmissions fail, s=
o
> rx_fixup() can keep rescheduling itself". It then says "tasklet_kill()
> drains any late tasklet and prevents self-rescheduling".
>
> rtl8150_driver has no soft_unbind, so usb_unbind_interface() disables the
> endpoints before calling ->disconnect(). The device is still attached, so
> usb_submit_urb() passes its -ENODEV check. usb_hcd_link_urb_to_ep() then
> returns -ENOENT, or -EPERM while usb_kill_urb() is in progress:
>
> drivers/usb/core/hcd.c:usb_hcd_link_urb_to_ep() {
>     ...
>         if (unlikely(!urb->ep->enabled)) {
>                 rc =3D -ENOENT;
>                 goto done;
>         }
>     ...
> }
>
> In rx_fixup(), -ENODEV is the only error that skips the reschedule, and
> nothing checks RTL8150_UNPLUG:
>
> drivers/net/usb/rtl8150.c:rx_fixup() {
>     ...
> try_again:
>         status =3D usb_submit_urb(dev->rx_urb, GFP_ATOMIC);
>         if (status =3D=3D -ENODEV) {
>                 netif_device_detach(dev->netdev);
>         } else if (status) {
>                 set_bit(RX_URB_FAIL, &dev->flags);
>                 goto tlsched;
>         }
>     ...
> tlsched:
>         tasklet_schedule(&dev->tl);
> }
>
> tasklet_kill() only returns once the waiter sets TASKLET_STATE_SCHED
> itself:
>
>         wait_on_bit_lock(&t->state, TASKLET_STATE_SCHED, TASK_UNINTERRUPT=
IBLE);
>
> tasklet_action_common() clears TASKLET_STATE_SCHED and wakes the waiter
> just before it calls t->callback(t). rx_fixup() then sets the bit again
> before it returns. All of this runs in non-preemptible softirq context.
>
> On a CONFIG_SMP=3Dn non-RT kernel, or when the waiter runs on the same CP=
U as
> the tasklet, process context would only ever see TASKLET_STATE_SCHED set.
> Wouldn't rtl8150_disconnect() then sleep in TASK_UNINTERRUPTIBLE forever
> while ksoftirqd keeps running rx_fixup()?
>
> The first tasklet_kill() already had this limitation. The new call relies
> on the same assumption to close the use-after-free.
>
> For tasklet_kill() to be reliable here, would rx_fixup() and the resched
> path in read_bulk_callback() need to stop resubmitting and rescheduling
> once RTL8150_UNPLUG is set?
>
> >               free_all_urbs(dev);
> >               free_skb_pool(dev);
> >               dev_kfree_skb(dev->rx_skb);
>
> [Severity: High]
> This is a pre-existing issue, but can dev->rx_skb still be stale when it =
is
> freed here?
>
> read_bulk_callback() passes dev->rx_skb to the stack, and if the pool is
> empty it leaves the pointer unchanged:
>
>         netif_rx(dev->rx_skb);
>         ...
>         skb =3D pull_skb(dev);
>         spin_unlock_irqrestore(&dev->rx_pool_lock, flags);
>         if (!skb)
>                 goto resched;
>
>         dev->rx_skb =3D skb;
>
> The pool has only RX_SKB_POOL_SIZE (4) entries, and only rx_fixup() refil=
ls
> it. rx_fixup() is also the only place that replaces the pointer. If every
> GFP_ATOMIC allocation in fill_skb_pool() fails, it just reschedules:
>
>         skb =3D pull_skb(dev);
>         spin_unlock_irq(&dev->rx_pool_lock);
>         if (skb =3D=3D NULL)
>                 goto tlsched;
>         dev->rx_skb =3D skb;
>
> Suppose rtl8150_disconnect() runs in that state. The tasklet_kill() calls
> stop the loop but leave the pointer as it is. Would dev_kfree_skb(dev->rx=
_skb)
> then double free an skb that the network stack already consumed?
>
> Something similar looks possible across close and open. rtl8150_close()
> does not kill the tasklet or clear rx_skb. rtl8150_open() then reuses a
> non-NULL rx_skb as the bulk-in buffer:
>
>         if (dev->rx_skb =3D=3D NULL)
>                 dev->rx_skb =3D pull_skb(dev);
>         ...
>         usb_fill_bulk_urb(dev->rx_urb, dev->udev, usb_rcvbulkpipe(dev->ud=
ev, 1),
>                       dev->rx_skb->data, RTL8150_MTU, read_bulk_callback,=
 dev);
>
> Could the device then DMA packet data into freed memory?
>
> [Severity: High]
> This isn't a bug introduced by this patch, but pegasus.c, which rtl8150 w=
as
> derived from, seems to have the same late-completion tasklet problem. Thi=
s
> patch doesn't change it.
>
> In pegasus read_bulk_callback(), when the resubmit fails, rx_tl is schedu=
led
> without checking PEGASUS_UNPLUG again:
>
>         else if (rx_status) {
>                 pegasus->flags |=3D PEGASUS_RX_URB_FAIL;
>                 goto tl_sched;
>         }
>         ...
> tl_sched:
>         tasklet_schedule(&pegasus->rx_tl);
>
> During unbind the endpoints are already disabled, so the resubmit fails w=
ith
> -ENOENT. It fails with -EPERM once usb_kill_urb() has set urb->reject.
>
> The only tasklet_kill() is in pegasus_close(), and it runs before the URB=
s
> are killed:
>
>         tasklet_kill(&pegasus->rx_tl);
>         unlink_all_urbs(pegasus);
>
> pegasus_disconnect() then goes from unlink_all_urbs() to free_netdev()
> without draining the tasklet:
>
>         unregister_netdev(pegasus->net);
>         unlink_all_urbs(pegasus);
>         free_all_urbs(pegasus);
>         ...
>         free_netdev(pegasus->net);
>
> Consider a completion that passes the netif_running() check before
> __dev_close_many() clears __LINK_STATE_START. If it reaches
> tasklet_schedule() after the tasklet_kill() in pegasus_close(), rx_tl is
> left pending with no later kill.
>
> rx_fixup() returns early on PEGASUS_UNPLUG, so there is no endless loop.
> It still reads pegasus->flags, though, and tasklet_action_common() touche=
s
> the tasklet_struct inside netdev_priv(). Could either of those run after
> free_netdev()?
>
> Does pegasus_disconnect() need a tasklet_kill(&pegasus->rx_tl) after
> unlink_all_urbs() too?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261110043016.56986-1-mhun512%40gmail.com
