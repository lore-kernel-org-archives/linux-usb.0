Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794181520;
	b=Ftis8c0xOJ2TfTq4L0s29pdwOVWYz7ZA5eT2xodUorJZr6+yLUzYHw+1PApolkovuYLy
	 vBOeCgrRiNladUI4kBDlMsmVbIklDdMCa+rzFlYdALWGhxnxay90ZNWZMH0QdnL98EB9H
	 fgS0sivVbrjoJdGOyfnHczpeUfRkH1IK7fFQKyTnzea3iKJjufsUPUVKugstfWtIsB+b7
	 IBXLeo4bupsqE25/WR2XRHIU4NNw/9YarqqDHLJQl4jGK8CiUpw7CliDzIekph2jG6u1Y
	 LI7BIpbQjT8juBjRmMFwCqQ+LlbMdTfcsBN9MDxdkQHk0xWZ1c4G14YDIPPEtalOmwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181520;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zb+Ig2UpZij+/Ntz5LTCrjKh6qLZGANvBXvGh5f64Iw=;
	b=Og84Qi+EmN3rPRwOitR5tcFHb6amc3yY3DLONs3oPaX6BvGZhtqoym9bsP1aVHfvXxEb
	 +717a606t727TJSGQSsuqSAfPFrrCqXkj8Q03uA9CBjbqiJDgqHOh2BVweMBs5FCdkXS6
	 VWFIg0/t6pu0z+ZWSXOL0uKX+3qC50uFL3A13VYwE+y2DjGmMdXvM8ZvTHr7HRJpjP5uv
	 9JhLqmL3srtwkiGu52jxgQJkYCF3MzPYoL32iIlZD5LKJ9VzEAtPEw6hHOycSfYYky5KD
	 qEi9cZhIlWn39FsAu1yeQmBmHpkg69+42lA573CtzV0f0f/43XhEv6RgLOCv50yOd8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aniiMCIk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8CD606A31C
	for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2026 23:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aniiMCIk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618FC1F008A1;
	Sun,  8 Nov 2026 23:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794181519;
	bh=zb+Ig2UpZij+/Ntz5LTCrjKh6qLZGANvBXvGh5f64Iw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aniiMCIkmRUz/inxU9j6bwx+mBM25pkSdx/NnrMryF68j99e9loclK8Y89qL8hV+r
	 v/FMJlw6sJBYcF6tbywmaVaZ3MDya0sz1t9JKN6Kqdrf3R5u2zh387Ja5b0908uwRM
	 Au9jiyMkrnWivhPuJ+lMo9uge4iFbPbyW4DRNd4ue6PyzuQG6DZR95BHu1uObWtPtf
	 ljWxYAyJqdv14y1dKOEXJz7gXNl6gfJGyTfEM0TbAqI3HMBy0VeESrfLhGv+G5/Ofd
	 poygtF2woTmHWqbqoz2FwVqkWRscEBHiFohXMGV+1U7udVYIvAzn72oNlMnpyhkgfJ
	 l0sKBYMad0p1g==
Message-ID: <sashiko-outbox-204170@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: storage: don't hold dev_mutex across the max_lun
 control transfer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shuai Liu" <847807867@qq.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <tencent_7682CAFD52BA8845497EA2C9047754EC6605@qq.com>
References: <tencent_7682CAFD52BA8845497EA2C9047754EC6605@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 23:45:18 +0000
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
- [High] usb: storage: DMA from stack buffer in usb_stor_Bulk_max_lun()
- [High] usb: storage: unlocked usb_stor_Bulk_max_lun() races with reset
  and I/O
- [Medium] usb: storage: uninitialized lun read in
  usb_stor_Bulk_max_lun()
- [Medium] usb: storage: wrong timeout unit in usb_stor_Bulk_max_lun()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] usb: storage: scan_dwork race with usb_stor_disconnect() causes
  hub stall [1]
--

commit 92856a6bb6e2428e581352525fb02cdea2d9e022
Author: Shuai Liu <847807867@qq.com>

usb: storage: don't hold dev_mutex across the max_lun control transfer

This commit changes usb_stor_Bulk_max_lun() to issue the GET_MAX_LUN
control transfer via usb_control_msg() using a stack variable and calls
it outside us->dev_mutex in usb_stor_scan_dwork().

> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transp=
ort.c
> index 8de3015bce050..961595a6facad 100644
> --- a/drivers/usb/storage/transport.c
> +++ b/drivers/usb/storage/transport.c
> @@ -1075,27 +1075,34 @@ EXPORT_SYMBOL_GPL(usb_stor_CB_transport);
>  /* Determine what the maximum LUN supported is */
>  int usb_stor_Bulk_max_lun(struct us_data *us)
>  {
> +	u8 lun;
>  	int result;
> =20
> -	/* issue the command */
> -	us->iobuf[0] =3D 0;
> -	result =3D usb_stor_control_msg(us, us->recv_ctrl_pipe,
> -				 US_BULK_GET_MAX_LUN,=20
> -				 USB_DIR_IN | USB_TYPE_CLASS |=20
> +	/*
> +	 * Issue the GET_MAX_LUN request using a private buffer and the
> +	 * usbcore control-message helper.  This avoids touching the shared
> +	 * per-device resources (us->iobuf, us->cr, us->current_urb) that are
> +	 * also used by the control thread and the reset path, so the caller
> +	 * does not need to hold us->dev_mutex while this (possibly sleeping)
> +	 * transfer runs.
> +	 */
> +	result =3D usb_control_msg(us->pusb_dev, us->recv_ctrl_pipe,
> +				 US_BULK_GET_MAX_LUN,
> +				 USB_DIR_IN | USB_TYPE_CLASS |
>  				 USB_RECIP_INTERFACE,
> -				 0, us->ifnum, us->iobuf, 1, 10*HZ);
> +				 0, us->ifnum, &lun, 1, 10 * HZ);

[Severity: High]
Does passing &lun to usb_control_msg() perform DMA into the kernel stack?

Unlike usb_control_msg_recv(), usb_control_msg() uses the caller's data
pointer directly as urb->transfer_buffer without copying to a heap buffer.
On DMA-capable host controllers, usb_hcd_map_urb_for_dma() rejects
stack-allocated transfer buffers with a WARN_ONCE() splat and returns
-EAGAIN, which makes usb_stor_Bulk_max_lun() fall back to 0 and breaks
multi-LUN detection.

[Severity: Medium]
Does usb_control_msg() also expect its timeout argument in milliseconds
rather than jiffies?

usb_stor_control_msg() took jiffies, whereas usb_control_msg() passes
timeout to usb_start_wait_urb() -> msecs_to_jiffies().  Passing 10 * HZ
shortens the timeout from 10 seconds to 1 second on CONFIG_HZ=3D100 kernels
(or 2.5 seconds on CONFIG_HZ=3D250), risking premature -ETIMEDOUT failures
on slow devices.

> =20
>  	usb_stor_dbg(us, "GetMaxLUN command result is %d, data is %d\n",
> -		     result, us->iobuf[0]);
> +		     result, lun);

[Severity: Medium]
Can usb_stor_dbg() read uninitialized stack memory from lun when
usb_control_msg() fails or transfers 0 bytes?

Previously us->iobuf[0] was zero-initialized before the transfer.  Here
lun is uninitialized, so when a single-LUN device stalls GET_MAX_LUN
(-EPIPE) or returns a zero-length packet, usb_stor_dbg() reads an
uninitialized value before the result > 0 check.

[ ... ]

> diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
> index 823a4b2e9033b..43d333f3ec4fe 100644
> --- a/drivers/usb/storage/usb.c
> +++ b/drivers/usb/storage/usb.c
> @@ -980,19 +980,31 @@ static void usb_stor_scan_dwork(struct work_struct =
*work)
> =20
>  	dev_dbg(dev, "starting scan\n");
> =20
> -	/* For bulk-only devices, determine the max LUN value */
> +	/*
> +	 * For bulk-only devices, determine the max LUN value.
> +	 *
> +	 * usb_stor_Bulk_max_lun() performs a synchronous control transfer and
> +	 * must NOT run while holding us->dev_mutex: the reset and suspend
> +	 * callbacks acquire us->dev_mutex (via usb_stor_pre_reset() /
> +	 * usb_stor_suspend()) while the USB core holds the device lock, and a
> +	 * concurrent scan would then deadlock against them.  The transfer now
> +	 * uses only private resources, so take the lock only to publish the
> +	 * result.
> +	 */
>  	if (us->protocol =3D=3D USB_PR_BULK &&
>  	    !(us->fflags & US_FL_SINGLE_LUN) &&
>  	    !(us->fflags & US_FL_SCM_MULT_TARG)) {
> +		int max_lun =3D usb_stor_Bulk_max_lun(us);
> +
>  		mutex_lock(&us->dev_mutex);
> -		us->max_lun =3D usb_stor_Bulk_max_lun(us);
> +		us->max_lun =3D max_lun;

[Severity: High]
Does running usb_stor_Bulk_max_lun() outside us->dev_mutex allow a
GET_MAX_LUN control transfer to run concurrently with port resets, PM
suspend, or active SCSI commands?

usb_stor_pre_reset() and usb_stor_suspend() lock us->dev_mutex specifically
to ensure no URBs are in flight or submitted during a USB reset or suspend:

drivers/usb/storage/usb.c:usb_stor_pre_reset() {
	/* Make sure no command runs during the reset */
	mutex_lock(&us->dev_mutex);
	return 0;
}

Also, because scsi_add_host() has already been called in usb_stor_probe2(),
usb_stor_control_thread() can acquire us->dev_mutex while GET_MAX_LUN is
still in flight, check srb->device->lun > us->max_lun against the stale 0
value, and issue bulk transfers or resets concurrently with GET_MAX_LUN.
Note as well that neither usb_stor_control_msg() nor usb_control_msg()
takes udev->dev.mutex.

>  		/*
>  		 * Allow proper scanning of devices that present more than 8 LUNs
>  		 * While not affecting other devices that may need the previous
>  		 * behavior
>  		 */
> -		if (us->max_lun >=3D 8)
> -			us_to_host(us)->max_lun =3D us->max_lun+1;
> +		if (max_lun >=3D 8)
> +			us_to_host(us)->max_lun =3D max_lun + 1;
>  		mutex_unlock(&us->dev_mutex);
>  	}
>  	scsi_scan_host(us_to_host(us));

[Severity: High]
This problem wasn't introduced by this patch, but can usb_stor_scan_dwork()
proceed to scsi_scan_host() on a disconnecting or failed device and stall
the USB hub workqueue [1]?

In subdrivers such as ene_ub6250_probe(), usb_stor_probe2() schedules
scan_dwork before hardware initialization completes, and on failure the
probe path calls usb_stor_disconnect():

CPU0 (probe thread)               CPU1 (scan_dwork)
-------------------               -----------------
ene_ub6250_probe()
  usb_stor_probe2()
    schedule_delayed_work(&us->scan_dwork, ...)
                                  usb_stor_scan_dwork()
  mutex_lock(&us->dev_mutex)
                                    mutex_lock(&us->dev_mutex)
  ene_get_card_type() (fails)
  mutex_unlock(&us->dev_mutex)
                                    ...
                                    mutex_unlock(&us->dev_mutex)
  usb_stor_disconnect()             scsi_scan_host()  <-- stalls on dead dev
    quiesce_and_remove_host()
      cancel_delayed_work_sync()

Because quiesce_and_remove_host() waits in cancel_delayed_work_sync()
before setting US_FLIDX_DISCONNECTING, scsi_scan_host() issues SCSI
commands that time out against the unresponsive device, blocking the USB
hub thread for over 90 seconds.

[1] https://sashiko.dev/#/bug/linux-0529026a-086b-4e39-8ee0-4a1314c92146

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_7682CAFD52B=
A8845497EA2C9047754EC6605@qq.com?part=3D1
