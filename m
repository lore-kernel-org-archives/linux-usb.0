Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174920;
	b=PC1g8Yr5ZyCubo6D4KLYqFJCKXO/+4hpPq0C7ps4gNRhsW8xG6UQa5raTaU5t/ejfPbU
	 kP5Fxv+lW8blMi7j+2L4Amfld5Q2XBmA25Lp+pLaKTpd11pIn4y3a63CS7Q9MGcKglg9U
	 1mvtTcI/QGTCH0a8DBIUC9isJjXd8ORa5epjsmCUndhKphSx4DTRM+HHCW7jvd9IcZ6fY
	 B5+kQEQh2O7EoTXD6R65uOuYQALUT3XfnVFlnbVHm5m0czUecTFyAYdvtQ4g6hosRf6ac
	 S3yTVxLgWuHh6fBLwgFwTEHM5fgrWlHxruxmVgcE5koeGCfBonpdJs8X6woItdLqOQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174920;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Kjkpv7+kdy5HQMKEXDMpyYQv6ROXdmu/Zx/GFXnn8Ws=;
	b=j/Wla9k2FXcZHCOROUtTzt8CgQ11dkfVcUcj65exdqfxpGE3xBhqrqAOQlt2jcvPhECZ
	 0kkrlLFNx+gEVjkN0AqzDanClDkRetH1fwbGWaiY/tF5M5KAfOETcOZPnXs01OvsdJP3N
	 AvThd2pO5wPsbepWqWdGvtsWTdUSgVSy9RMSaLgwXHu9EPQLxVs7kZ49YtSh92ZO24W/m
	 UT7ILbFbU23R/3HwEC0FoMWuaL3ACltxuCj5lZHt4T75pXD2v4X0e+Vh7nlv1eGGTykfT
	 Hn9Cw/AFIBNKqvfmW7cnFrDxeQaJeY1PmtpT8h3aMYJkY8tLtZVPQELjxn6KwHR7sxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=IkbDIgQY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5069D606A320;
	Fri, 20 Nov 2026 11:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=IkbDIgQY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE3C1F000CA;
	Fri, 20 Nov 2026 11:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795174919;
	bh=Kjkpv7+kdy5HQMKEXDMpyYQv6ROXdmu/Zx/GFXnn8Ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IkbDIgQYNDOPpHk78cvUK8JxGuf18TP3UHvIZa0v3dBO9+kBaIooCVvHpj5nnIWwa
	 OAgSH6mrOVHjtWnFZpnwHjMW6wMll6IfBwJdau9oPYs4GC9tE5DdDmzmU4WpkjOiOi
	 q/kwVFx6y7YSPlcDLEVKQsPw38xCu45p/LkBSxps=
Date: Fri, 20 Nov 2026 12:41:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Herman Semenoff <germanaizek0@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb-storage: add US_FL_MAX_SECTORS_2048 and quirk for
 USB Disk 2.0 (346d:5678)
Message-ID: <2026112039-dribble-crushable-8692@gregkh>
References: <CAMnMt5ZQe6HvLBWuc4fcF=pcatqUD4bZff6QSj2FxaKjpGWXiQ@mail.gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMnMt5ZQe6HvLBWuc4fcF=pcatqUD4bZff6QSj2FxaKjpGWXiQ@mail.gmail.com>

On Tue, Nov 03, 2026 at 06:07:31AM +0300, Herman Semenoff wrote:
> In drivers/usb/storage/scsiglue.c, the host template sets
> .max_sectors = 240 (120 KB) for USB Mass Storage devices. While USB3
> devices are granted up to 2048 sectors (1024 KB), USB 2.0 devices
> unconditionally inherit the conservative 240 sectors limit dating back
> to early IDE bridge quirks.
> 
> For modern high-speed USB 2.0 flash drives such as 346d:5678
> (USB Disk 2.0), this 120 KB ceiling unnecessarily fragments I/O
> requests. For example, a 1 MB sequential transfer is broken into 9
> separate SCSI commands and URBs, incurring excessive interrupt overhead
> and preventing flash controllers from utilizing larger erase/page write
> buffers.
> 
> Introduce the US_FL_MAX_SECTORS_2048 quirk flag (and quirk character 'z')
> which allows setting max_hw_sectors to 2048 (1024 KB) on verified
> capable devices. Add an unusual_devs entry for ID 346d:5678.
> 
> Non-quirked USB 2.0 devices continue to use their default 240 sectors
> limit, and USB 3.0 devices continue to receive 2048 sectors via their
> speed check, ensuring no performance impact or regression on other
> devices.
> 
> Im tested on very common cheap USB 2.0 128GB (chipset FC2279 BA7 - price 4$)
> 
> Benchmark fio results on actual device (346d:5678) on Linux kernel:
> - Sequential write (1M bs): 10.2 MiB/s -> 13.2 MiB/s (+29.4% improvement)
> - Sequential read  (1M bs): 24.4 MiB/s -> 26.4 MiB/s (+8.2% improvement)
> - Average write latency:    97.8 ms   -> 75.9 ms   (-22.4% reduction)
> - I/O requests / interrupts: 556       -> 60        (~89% reduction)
> - 4K random read / write:   unaffected, zero regression
> 
> Signed-off-by: Herman Semenoff <GermanAizek@aizekgroup.ru>
> Signed-off-by: Herman Semenoff <GermanAizek@yandex.ru>
> ---
>  drivers/usb/storage/scsiglue.c     | 6 ++++--
>  drivers/usb/storage/unusual_devs.h | 7 +++++++
>  drivers/usb/storage/usb.c          | 6 +++++-
>  include/linux/usb_usual.h          | 2 ++
>  4 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
> index 97de28e85562..2a732e6354e5 100644
> --- a/drivers/usb/storage/scsiglue.c
> +++ b/drivers/usb/storage/scsiglue.c
> @@ -111,10 +111,12 @@ static int sdev_configure(struct scsi_device
> *sdev, struct queue_limits *lim)
>   * let the queue segment size sort out the real limit.
>   */
>   lim->max_hw_sectors = 0x7FFFFF;
> - } else if (us->pusb_dev->speed >= USB_SPEED_SUPER) {
> + } else if (us->pusb_dev->speed >= USB_SPEED_SUPER ||
> +   (us->fflags & US_FL_MAX_SECTORS_2048)) {
>   /*
>   * USB3 devices will be limited to 2048 sectors. This gives us
> - * better throughput on most devices.
> + * better throughput on most devices. High-speed devices with
> + * the MAX_SECTORS_2048 quirk also use 2048 sectors.
>   */
>   lim->max_hw_sectors = 2048;
>   }
> diff --git a/drivers/usb/storage/unusual_devs.h
> b/drivers/usb/storage/unusual_devs.h
> index ac22fa318734..b3ff758d4e9c 100644
> --- a/drivers/usb/storage/unusual_devs.h
> +++ b/drivers/usb/storage/unusual_devs.h
> @@ -2418,6 +2418,13 @@ UNUSUAL_DEV(  0x3340, 0xffff, 0x0000, 0x0000,
>   USB_SC_DEVICE,USB_PR_DEVICE,NULL,
>   US_FL_MAX_SECTORS_64 ),
> 
> +/* Reported by Herman Semenoff <GermanAizek@aizekgroup.ru>
> <GermanAizek@yandex.ru> */
> +UNUSUAL_DEV(0x346d, 0x5678, 0x0000, 0x9999,
> + "USB",
> + "Disk 2.0",
> + USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> + US_FL_MAX_SECTORS_2048),
> +
>  /* Reported by Cyril Roelandt <tipecaml@gmail.com> */
>  UNUSUAL_DEV(  0x357d, 0x7788, 0x0114, 0x0114,
>   "JMicron",
> diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
> index 823a4b2e9033..2577db523208 100644
> --- a/drivers/usb/storage/usb.c
> +++ b/drivers/usb/storage/usb.c
> @@ -570,7 +570,8 @@ void usb_stor_adjust_quirks(struct usb_device
> *udev, u64 *fflags)
>   US_FL_INITIAL_READ10 | US_FL_WRITE_CACHE |
>   US_FL_NO_ATA_1X | US_FL_NO_REPORT_OPCODES |
>   US_FL_MAX_SECTORS_240 | US_FL_NO_REPORT_LUNS |
> - US_FL_ALWAYS_SYNC | US_FL_NO_SAME);
> + US_FL_ALWAYS_SYNC | US_FL_NO_SAME |
> + US_FL_MAX_SECTORS_2048);
> 
>   p = quirks;
>   while (*p) {
> @@ -659,6 +660,9 @@ void usb_stor_adjust_quirks(struct usb_device
> *udev, u64 *fflags)
>   case 'y':
>   f |= US_FL_ALWAYS_SYNC;
>   break;
> + case 'z':
> + f |= US_FL_MAX_SECTORS_2048;
> + break;
>   /* Ignore unrecognized flag characters */
>   }
>   }
> diff --git a/include/linux/usb_usual.h b/include/linux/usb_usual.h
> index 712363c7a2e8..cd246a42e603 100644
> --- a/include/linux/usb_usual.h
> +++ b/include/linux/usb_usual.h
> @@ -88,6 +88,8 @@
>   /* Cannot handle WRITE_SAME */ \
>   US_FLAG(SENSE_AFTER_SYNC, 0x80000000) \
>   /* Do REQUEST_SENSE after SYNCHRONIZE_CACHE */ \
> + US_FLAG(MAX_SECTORS_2048, 0x0000000100000000ULL) \
> + /* Sets max_sectors to 2048 */ \
> 
>  #define US_FLAG(name, value) US_FL_##name = value ,
>  enum { US_DO_ALL_FLAGS };
> -- 
> 2.55.0
> 
> base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
> 


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
