Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094404;
	b=dNIyQICGZ0GVQBbccsZlvAH91ZnYJiaP2aQoyPdZrK9z+tgEFIi5InQ29O7MOAMUTXE2
	 ikYTD8oQGj8yty4xVAHBHYybGa4rj9qIb6fVl07piY/1D1jqDnAYOFNFhsmxBME0HadAf
	 S6oMvHn/khUV2uf40MZwJTLatibs4AHfdzhmviPq6EBgJ7iQjvRdjokzEUM0Et3VNmHUe
	 yMDs6Zl+EIvfzJ0vhq7JzQxFajQNm2jIHn2eaxf0pDxBgSgst35i4EOKxB68IhmookQNu
	 6FiRi5eqMZKkxomiYg159DLHAi04vOR2cra1DcCGOZgWQVqVj9e9sEwHiWmlbua5GVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=uny0r6hCq3qe4nIhgg26vhi2MvVOok40ekvov7+HjGs=;
	b=mllVc+VBrVgz848+cxZ7ZQgX4pvbvVpDOm/TGK2eowcju4902Mc7OtOeoxDMZZie1lmL
	 NgnOH8k1bWHft+nePVu1nlCKMiNEa1kb+N56rlHsZP36hLchrOLPYpbgPRumDBHnNepre
	 poVslFwsw7bjSHZN0ruG6BFN/NKmkE7NB/OkMJNDpt1nBr4t0lgtlifV5KgwaW2hz3bms
	 WQ8NHuHFGPs2XEhldxRfwzSzNTDjzLFEhapBJxaWTfH80TH34ZmKhDZRqtZozwwojaMKZ
	 mDgA+YMXsNdGrJl4n7hXvDzoEQx3cJXrfIhTOzLIHd7beyrcbkrlayORTELJFhWrdng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zby4UAdz;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4023A606A33E
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 13:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4023A606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zby4UAdz
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so1968427f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 05:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795094402; x=1795699202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uny0r6hCq3qe4nIhgg26vhi2MvVOok40ekvov7+HjGs=;
        b=zby4UAdzmhxZdr/bAyuWfJ2SNu+0nJp3ZNIS6OucsRacuO3m8N3xB1EyaHq9Bm44CK
         p5EVPmTizagQhAuYKcotrE2QplLp0vSRFdiA2IQZZjzIfKtUKYHNJS/wocV9B6xEXAbg
         trfDvOGEWGiqq9oyw6LGayd1+YFUflfvjLiYKdWlh6fOALXyoIP4tuC/ghgEiVBTl3wd
         X/SeYhK6v4fnKJBN/CAg5oDb102sX1rEibd4z6ZopuJD4fFPvyCIRgcI/Deo9iy91hJ5
         mzPj40hW7xkbbQ5WOVJTzwx2XQ0i8hC/cBlAZnaiSh3ONicC7uNQLFRB5s6KHWHNaiD1
         +1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094402; x=1795699202;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uny0r6hCq3qe4nIhgg26vhi2MvVOok40ekvov7+HjGs=;
        b=j+hHIC89IwcAtPPoQK5twvMf1xEa6kmIapqpRJJXZ1ZyCnvyL9qcedYxzaqZRgF8RZ
         ZzfVNAkawpdFEV54b7KedDfdjKif56/P+62GaSsmkJ3ThBZdBFIw3ZBSpqi7hIAaB8LJ
         hRSJdaVb2/SsLT8mkCUNECRlDC4tPL0PpNURQUOL/7DS8stVbiDCahg9+wsookscNqgn
         ZC1XCMZfpaODOe+RLWrKw0sqo//Q0jedvoAE8362bXRSRLrIaaIfNrNZH1+kW+LZHIxy
         CMgg3nLadJAeIgoPf5niXzmu29W3X5lQ7GTa2fOFlh3oBcvedajluH02J004h92jpthp
         vdNA==
X-Forwarded-Encrypted: i=1; AL+hErHgK5FzGtYVG4DsuQ/Ycy3sbk4jLQV1D5WwglRd+DU+VJ1it2NWKhhWmrKvg22cMafBZrenZkZFiAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NnXAZfQKCc2wG9NWZJQJ4VOfAsVtgtvaBlEC89ylaxAJXBCx1
	nKitrr/zYoE7aXbAlcRvD3b0MxcysvCuzbvAtw6W+cbXChH9vcW0eAefYSe2rA==
X-Gm-Gg: AZFdTZePP6Vog3+gS3lrj/zmRTy5v+lwgUV8ERVUiKJa0JxOXb1MBQE+577FAVSsu8I
	fqypFAjxx0iZG89PV1M82fc+cQOge8GIVF8CkHZb4Fv5Dc8ua/6t1NW2/8G37mbl1a9ZLMTzbxu
	rPhPLVf26G6pczLBDQH066WL0nwgtFIIY1YU46EGum4DYQ1fhJo5q6S1ZZVocbjQkmF0adEQQrP
	oIRA2rsyztoQgBqPMWQbOsDo7xKB6pvh1kUBDqqzm88FjRqfw9irWwmz3+zf1iS27IekuI5J2oJ
	/oB3lKI+qjcbOf9i9c5v3ChBLwP5jm5SxC2wGP7U73zH0+ruZ3yE8xDk4B8IptQ5a1+5Iw6Wnkq
	qJRLTwubGonVTxp56jsO8/rNt+QZhZgxd/WAyCNXgYlRlp/Af1JoJ5t8hGaFHzMU+eOESeAR0Yg
	l1h7MsJPtTUC33xknw7fMTBIh+udxeL0/RtuKpxtF1LDcmFS5AHkplQwE86C3kCKm1qZ4CC9JO5
	PSVvu1b0vPQQlLlo9VRshHHqCXhhAP/CmPegyc66KEdmlWHFJ6BklpEEub0VwBS6xzcF5FXO13x
	mPLI8y9Bcg/MjLPx/7Kg03HrQaBQLgKOyG8eYfI=
X-Received: by 2002:a05:6000:4b17:b0:4a7:f82a:7f6d with SMTP id ffacd0b85a97d-4a7f82a8286mr9060323f8f.6.1795094402014;
        Thu, 19 Nov 2026 05:20:02 -0800 (PST)
Received: from foxbook (bgu85.neoplus.adsl.tpnet.pl. [83.28.84.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm10793007f8f.36.2026.11.19.05.20.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 19 Nov 2026 05:20:01 -0800 (PST)
Date: Thu, 19 Nov 2026 14:19:56 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: hi@yasunobu.dev, linux-media@vger.kernel.org, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mathias Nyman
 <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Batch StreamCam unlinks on ASUS
 ASM2142
Message-ID: <20261119141956.2f320b1e.michal.pecio@gmail.com>
In-Reply-To: <CANiDSCsdaokL_2u_74b3ADT+U8TXskK53+k+hVA8D+PtttYEZQ@mail.gmail.com>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Nov 2026 13:06:50 +0100, Ricardo Ribalda wrote:
> On Thu, 19 Nov 2026 at 12:47, Yasunobu Sakashita via B4 Relay
> <devnull+hi.yasunobu.dev@kernel.org> wrote:
> >
> > From: Yasunobu Sakashita <hi@yasunobu.dev>
> >
> > Stopping a SuperSpeed StreamCam can halt xHCI on the ASUS PRIME
> > Z270-A. The fifth Stop Endpoint command timed out after an invalid
> > type 15 event.
> >
> > For the affected StreamCam and ASM2142, block URB resubmission.
> > Queue all unlinks before waiting so xHCI can coalesce them.

Hi Yasunobu,

I'm curious what's your general experience with SuperSpeed isochronous
cameras on ASM2142 (or ASM3142 - same IDs, not sure what difference).

Does it work, including in high resolution uncompressed video modes?
In my experience with one no-name USB3 camera, ASMedia contrellers
worked poorly in general, which is why I haven't bothered upstreaming
this compatibility hack.

Could you post "lsusb -v" of this camera?
Preferably with usbutils v019 or newer.

> >
> > The stock driver reproduced the halt on Ubuntu 6.8.0-149-generic.
> > Three FFmpeg 720p MJPEG and audio capture cycles passed with the
> > patch.
> >
> > I used Codex to help analyze traces and draft the patch and
> > changelog.
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

This shouldn't be unnecessary, the alternative unlinking logic is
unlikely to cause compatibility issues with any hardware.

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

For the record, the objective of this ugly code was to hopefully
preserve the same guarantees to the UVC driver as the original, while
avoiding repeatedly stopping and restarting the xHCI endpoint, which
occurs because usb_poison_urb() forces unlink of urb N to complete
before unlink of urb N+1 can begin.

I don't claim that this is the best or the only solution.

> > +       } else {
> > +               for_each_uvc_urb(uvc_urb, stream)
> > +                       usb_poison_urb(uvc_urb->urb);
> > +       }
> >  
> 
> Michal proposed something very similar not so long ago:
> 
> https://lore.kernel.org/linux-media/20261115110132.2b0bda47.michal.pecio@gmail.com/

Yes, LLMs got pretty good at stealing test patches from maling lists.

> He also mentioned that those crashes were solved in 7.3. Could you
> check if your device works fine on 7.3, or if it still crashes?
> (Note that even if a workaround is still needed, we probably wouldn't
> want to match host-controller PCI IDs inside uvcvideo.)

To be exact, 7.3 solved interrupt endpoint crashes on ASMedia and
isochronous endpoint crashes on VIA. I haven't tested isochronous on
ASMedia, but now I will, subject to the limitation that my camera
barely works with those controllers at all.

> Michal, would you recommend applying something like what you proposed
> in your email, or would you rather fix this at the USB level?

Other than bloat, the UVC change should be harmless and it makes
unlinking multiple URBs somewhat wore efficient and faster.

But it does make the code longer and weirder. If there is a need,
perhaps USB core could provide a new usb_nuke_endpoint() call.

I'm also curious to hear whether the 7.3 changes or this patch
affect the Intel+Razer case (linked above).

Regards,
Michal
