Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092216;
	b=UvUCeiaIiLtXrJDjy1YF3w1xydWT553Lm77/bQfoJiB4zX3csAQAIxVyhOqkGl0flpWE
	 /JuXRTVjyHLqDwKbo4Vi9Yhaps5R9kx6BbbvC9/C4RN16ywjFwGFRUYMb49M5tWZDox7P
	 NBFdUkkrXvt8xh6cs54z/c2WtEa//Uz/R85AoodeHJ8KMmqWZkyohhorGGXRYP6I+c02G
	 FoYu8Gejw4T6XVh6wJahFF845gslSHQNk/kRFQFwsW94G0K4N76l6R9Ozkma+u4PeVpA/
	 dYr4pcz/a+xf3y3m5EQZQjbO4GmQK3GUKYQDurlk7Z7tZlXaXBnicvm0S5lQsqXJCug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092216;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=5rXYCKnUUybKKjjheKTrH7VbW46ic6GhZvzt7+Gjy/M=;
	b=0srxZ+SMOURzu9BVLpfdbU1RiWuGQprxGUwM6KBFAGDWmWt1PjqIUKizSAP2k+yYReaL
	 Awkw9O7te6Q7lRyboL2bZ66OACE26BFOMgt99dEQEH5TLCw7RKeZKmP8UWgP/drgzzisE
	 lUmtD9I7rV5fJ0r0PY3ObKSYMIanuERtf3kT75YcPcN98wRrkx7Dm1wksVyVBpI2aGCOc
	 BOdoeO6udlCFYyERY8nxcZOvJSA4zTtFSS6Y9Xpi7v2XNj8HT545rdpzX7H4l7IysPtTs
	 Vn48siS6pXmD+6h/fUvtI/xD+/m3UU2L8pUwizeIK2JwJx98Eb+BM/Z1eef0llhizaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=o2K3cwvJ;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C75606A320;
	Thu, 19 Nov 2026 12:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7C75606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=o2K3cwvJ
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DE77B1A;
	Thu, 19 Nov 2026 13:41:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795092063;
	bh=NzZPVWwZ1PT3NObGqTHbmbBwItAGeQPY0AQTWuXom70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o2K3cwvJxhZv7QVYX29BEQkcK5iH1Kng7iv9MycBoy4l7DIJfaWlyi3g77QZqDFge
	 crPczyItjl50cn0iT0EFmP1M6B9K5fR79/vA1LptV1h7DZWrSr+1Utivxzlco65MqE
	 PAPEgcDM88pq3E6VYTsn7/iuoFknq04C7gUMFLRw=
Date: Thu, 19 Nov 2026 14:43:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: hi@yasunobu.dev, Michal Pecio <michal.pecio@gmail.com>,
	linux-media@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Batch StreamCam unlinks on ASUS ASM2142
Message-ID: <20261119124331.GR1923307@killaraus.ideasonboard.com>
References: <20261119-streamcam-batched-unlink-v1-1-076bc02866c1@yasunobu.dev>
 <CANiDSCsdaokL_2u_74b3ADT+U8TXskK53+k+hVA8D+PtttYEZQ@mail.gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsdaokL_2u_74b3ADT+U8TXskK53+k+hVA8D+PtttYEZQ@mail.gmail.com>

On Thu, Nov 19, 2026 at 01:06:50PM +0100, Ricardo Ribalda wrote:
> On Thu, 19 Nov 2026 at 12:47, Yasunobu Sakashita via B4 Relay wrote:
> >
> > From: Yasunobu Sakashita <hi@yasunobu.dev>
> >
> > Stopping a SuperSpeed StreamCam can halt xHCI on the ASUS PRIME Z270-A.
> > The fifth Stop Endpoint command timed out after an invalid type 15 event.
> >
> > For the affected StreamCam and ASM2142, block URB resubmission.
> > Queue all unlinks before waiting so xHCI can coalesce them.
> >
> > The stock driver reproduced the halt on Ubuntu 6.8.0-149-generic.
> > Three FFmpeg 720p MJPEG and audio capture cycles passed with the patch.
> >
> > I used Codex to help analyze traces and draft the patch and changelog.
> >
> > Signed-off-by: Yasunobu Sakashita <hi@yasunobu.dev>
> > ---
> > Built uvc_video.o on media-committers/next with and without CONFIG_PCI.
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 43 ++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 38 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index a92a986ab..0ee5a7d17 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/list.h>
> >  #include <linux/module.h>
> > +#include <linux/pci.h>
> >  #include <linux/slab.h>
> >  #include <linux/usb.h>
> >  #include <linux/usb/hcd.h>
> > @@ -1885,6 +1886,26 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
> >         return 0;
> >  }
> >
> > +static bool uvc_streamcam_batch_unlink(const struct uvc_streaming *stream)
> > +{
> > +       const struct usb_device *udev = stream->dev->udev;
> > +       struct device *controller = udev->bus->controller;
> > +       const struct pci_dev *pdev;
> > +
> > +       if (stream->frozen || udev->state != USB_STATE_CONFIGURED ||
> > +           udev->speed != USB_SPEED_SUPER ||
> > +           le16_to_cpu(udev->descriptor.idVendor) != 0x046d ||
> > +           le16_to_cpu(udev->descriptor.idProduct) != 0x0893 ||
> > +           !controller || !dev_is_pci(controller))
> > +               return false;
> > +
> > +       pdev = to_pci_dev(controller);
> > +       return pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
> > +              pdev->device == 0x2142 &&
> > +              pdev->subsystem_vendor == PCI_VENDOR_ID_ASUSTEK &&
> > +              pdev->subsystem_device == 0x8732 && pdev->revision == 0;
> > +}
> > +
> >  /*
> >   * Uninitialize isochronous/bulk URBs and free transfer buffers.
> >   */
> > @@ -1896,12 +1917,24 @@ static void uvc_video_stop_transfer(struct uvc_streaming *stream,
> >         uvc_video_stats_stop(stream);
> >
> >         /*
> > -        * We must poison the URBs rather than kill them to ensure that even
> > -        * after the completion handler returns, any asynchronous workqueues
> > -        * will be prevented from resubmitting the URBs.
> > +        * URBs must stay blocked until the workqueue has been flushed.
> > +        * A completion handler can leave work that tries to resubmit an URB.
> >          */
> > -       for_each_uvc_urb(uvc_urb, stream)
> > -               usb_poison_urb(uvc_urb->urb);
> > +       if (uvc_streamcam_batch_unlink(stream)) {
> > +               /*
> > +                * usb_block_urb() keeps URBs blocked after usb_kill_urb().
> > +                * Queue unlinks together so xHCI can coalesce them.
> > +                */
> > +               for_each_uvc_urb(uvc_urb, stream)
> > +                       usb_block_urb(uvc_urb->urb);
> > +               for_each_uvc_urb(uvc_urb, stream)
> > +                       usb_unlink_urb(uvc_urb->urb);
> > +               for_each_uvc_urb(uvc_urb, stream)
> > +                       usb_kill_urb(uvc_urb->urb);
> > +       } else {
> > +               for_each_uvc_urb(uvc_urb, stream)
> > +                       usb_poison_urb(uvc_urb->urb);
> > +       }
> >
> 
> Michal proposed something very similar not so long ago:
> 
> https://lore.kernel.org/linux-media/20261115110132.2b0bda47.michal.pecio@gmail.com/
> 
> He also mentioned that those crashes were solved in 7.3. Could you check if your
> device works fine on 7.3, or if it still crashes?
> (Note that even if a workaround is still needed, we probably wouldn't
> want to match
> host-controller PCI IDs inside uvcvideo.)
> 
> Michal, would you recommend applying something like what you proposed in your
> email, or would you rather fix this at the USB level?

This looks like something that should be fixed at the USB level, unless
proven impossible.

> >         flush_workqueue(stream->async_wq);
> >
> >
> > ---
> > base-commit: aa0f4c41d4870a18e65772a1817af16427200371
> > change-id: 20261119-streamcam-batched-unlink-fb4a6e39626e

-- 
Regards,

Laurent Pinchart
