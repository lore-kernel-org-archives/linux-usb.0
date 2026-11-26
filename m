Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676605;
	b=k33H+vxRQ31j2/1yN8U1IxM4QH78l7CLqKRUAjgn+3VkYmC5CYfki/tH88tv1uwjyjov
	 fzwcKGubvSWFW+qAuVUjDwWp1hQFHsBbCRAV0NnZx4roGEIxUbaXgCsHBGynMoe+4c+g4
	 DVOrWA0NGAMZGEgzXI1wMyRnv/likndA2cfuoi/8tbXDYQ0abULfz8Kq0kDXuA5L3piK9
	 mbySe3cRUwhdm5t2gGnsvU2hDklrZhr/b8RHSFNg/I0eVgBlWkddOI1n4OOwlT9Vh0y3w
	 b6p5in+21bdaEpuR8b2kIdA0KHjpKuyICH8O1tsd/GqdezjanXHdwI4f/nbslJ4aNuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676605;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=I6J/U9n+gIuKJ5uXcvgT1URRa9YYmsP7Dcg1YRw+D7U=;
	b=2++IdyGH3tjLkH+DEc/CDNTPOIJqaS83nbG2c1HRpPfCr1ncK4zJugMMPPkuBU240dkG
	 7Tj76Sp2xT7GB83ZdF4KhQX4kVUCGMMyDPVcOiprssumw6WhHXmS4hc8fEi6q+88XTAyl
	 X6X3NYdlmI7Jw47UHi4280cn5PwdkzH2ZlgRcUIlQVWyD0EK8PtLDOU5cwecrml4G01ne
	 zhgGInEe2sDS6XMKX4pGf5pwTiY9W4TdkWB47ATz71BUVqdMOTrI6T1nVsdMbhc6YBYWY
	 6S1CdVxS8M5fJB7Ym5NgybVFJL2etSBnkEt90METoT3Ul5uyre61vFZhJ4FdZC330FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mPuY4hED;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA63E606A326
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 07:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mPuY4hED
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B281D1F000C4;
	Thu, 26 Nov 2026 07:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795676604;
	bh=I6J/U9n+gIuKJ5uXcvgT1URRa9YYmsP7Dcg1YRw+D7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mPuY4hEDG/cVC2FvgFxHL2qHHW2Vnjo/I3vlytN1oNh/jKL2TDDfO3XF63wcKGadJ
	 rS+s2m8/pkn5WxGarczKZA/rB0BnDDOZPzGBvqtEkS/u5CLkhAA+yQ6QrYujdSDi8V
	 Y5uU6YzUsWBrt86Nf3/gEPa6VrTkz1hqLqZ2y45rRlmetl/IXbeS5zhyRa1Mz3XFZs
	 RRoENs9HRalTz1XvQzh1AMd+U+/xIqhwYuJj1bz2ZCv96YKiQAP/z2AmFfbKKaaR52
	 2azJGVmSwBY7fho2tLYKV+4wM1cJPtXBOXbevefT3kFgF1Qzwhy1VhwuFiZhy4ZOCT
	 cGwNfvzoOxsqg==
Message-ID: <sashiko-outbox-234927@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: fix UAF read in INTERFACE_REVMAP
 ioctl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jaegyun Lee" <dreams200260@g.skku.edu>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126-ffs-revmap-v1-1-e1322f6fa290@g.skku.edu>
References: <20261126-ffs-revmap-v1-1-e1322f6fa290@g.skku.edu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 07:03:24 +0000
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
- [Medium] usb: gadget: f_fs: UAF and stale ffs->func in
  ffs_func_unbind() after unbind
--

commit 54f606e52beb80500efc1407df54d86b84f48d2a
Author: Jaegyun Lee <dreams200260@g.skku.edu>

usb: gadget: f_fs: fix UAF read in INTERFACE_REVMAP ioctl

This commit protects FUNCTIONFS_INTERFACE_REVMAP and the teardown of
ffs->func and func->eps in ffs_func_unbind() with ffs->eps_lock.

> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/func=
tion/f_fs.c
> index c64a268e98a43..c824d1d5ce571 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
[ ... ]
> @@ -4203,10 +4208,8 @@ static void ffs_func_unbind(struct usb_configurati=
on *c,
>  	unsigned count =3D ffs->eps_count;
>  	unsigned long flags;
> =20
> -	if (ffs->func =3D=3D func) {
> +	if (ffs->func =3D=3D func)
>  		ffs_func_eps_disable(func);
> -		ffs->func =3D NULL;
> -	}
> =20
>  	/* Drain any pending AIO completions */
>  	drain_workqueue(ffs->io_completion_wq);
> @@ -4217,13 +4220,14 @@ static void ffs_func_unbind(struct usb_configurat=
ion *c,
> =20
>  	/* cleanup after autoconfig */
>  	spin_lock_irqsave(&func->ffs->eps_lock, flags);
> +	if (ffs->func =3D=3D func)
> +		ffs->func =3D NULL;

[Severity: Medium]
Can moving ffs->func =3D NULL after functionfs_unbind(ffs) cause a
use-after-free on ffs or an out-of-bounds read in ffs_func_revmap_intf()?

functionfs_unbind() clears FFS_FL_BOUND and drops the gadget's reference
with ffs_data_put(ffs).  Once FFS_FL_BOUND is clear, ffs_closed() skips
unregister_gadget_item() and no longer serializes on gi->lock against the
running unbind, so a concurrent unmount in ffs_fs_kill_sb() can drop the
superblock reference and free ffs before ffs_func_unbind() takes
func->ffs->eps_lock:

CPU0                                  CPU1
ffs_func_unbind()
  ffs_event_add(..., FUNCTIONFS_UNBIND)
  functionfs_unbind(ffs)
    clear_bit(FFS_FL_BOUND, &ffs->flags)
    ffs_data_put(ffs)
                                      ffs_fs_kill_sb()
                                        ffs_data_reset(ffs)
                                          ...
                                            ffs_closed()
                                              /* FFS_FL_BOUND is clear */
                                        ffs_data_put(ffs)  <-- frees ffs
  spin_lock_irqsave(&func->ffs->eps_lock)  <-- use-after-free
  if (ffs->func =3D=3D func)
    ffs->func =3D NULL;

In addition, leaving ffs->func set across functionfs_unbind() means
ffs_data_reset() can reset ffs->state to FFS_READ_DESCRIPTORS while
ffs->func still points to the old function.  If userspace writes new
descriptors with a larger ffs->interfaces_count and calls
FUNCTIONFS_INTERFACE_REVMAP before ffs_func_unbind() acquires eps_lock,
ffs_func_revmap_intf() walks the old func->interfaces_nums array using
the new count.

Performing the eps_lock cleanup block (clearing ffs->func, freeing
ep->req, and freeing func->eps) before ffs_event_add() and
functionfs_unbind() would keep ffs pinned and FFS_FL_BOUND set until
func teardown is complete.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-ffs-revmap=
-v1-1-e1322f6fa290@g.skku.edu?part=3D1
