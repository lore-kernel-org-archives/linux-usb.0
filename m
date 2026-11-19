Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090028;
	b=mQMrsHe0UnZFmB1UZiP4wLub0KF734u0UJsexJeHj7s5OI0mzd9SyIoWFn2NlbGRJHWj
	 GGr+Jo/OG2esrKmkuhxlPHOouiUzkEcqFBuPfsrgNB5hvnJXnD5EpwpO+pIMHpkzHHHHz
	 DlqbnBspTJ7Dz4gsy6XXD3jGd+tg5SgUJIMrjfXsE/gKzoT8HmVAykMhrKqB0yn0xD656
	 O+AjnaWJ40DsJ/E1dEx52Pbh20Z8W9AYW8q/z45ZWpRWtxZprF8m9V7hoYsRZqulxUYuQ
	 40apZjSbaxnImYg+Y2c8ReKkv5AJQX72sh+w5jEFQxv5hTHDXnINGpiC9MCXkEP59bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=24q4cmEurzIe18amc7z0k3Uuq3pJyF0XxrOE02jUc9M=;
	b=bsBkf1KXmdY71Y7sh/poywS0Bg6FZmEcOcpsYpip4m3kWI2uUomz2r9wvaKSAf1vYtpP
	 ukz/308pjQGDhI/X8dPuMG/g/uR7AJ4FiSQSyOkCbQxOz8uv/WvsCdjm0rAEfc2vS465i
	 uOfWo/UgO/8hQm4M2ngjmf4eCj528zSATf/gz+BpwDRVHkone4wXR3dxnP/W5iV7e1gXy
	 LNfRcq2/+lrMHOVI6bEe4NGMFgqp/fnfUZrtshQJHB9pS1P2+J1tulZZLwbLWoSMISyro
	 YMoae4ll5Fw7tAvm7Xe29a6H32tHi4/xKOChpMdHVvNSHnDqMaqZpHbNY8nuheV4mBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JOa0uRWQ;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E59606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 12:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95E59606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JOa0uRWQ
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so313657a91.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 04:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795090027; x=1795694827; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24q4cmEurzIe18amc7z0k3Uuq3pJyF0XxrOE02jUc9M=;
        b=JOa0uRWQIhHTnf9wAj3ddpMSrwDNiiAIRKYiEGHQ+ogia2BSlresjGWBqiXLTa6nSB
         fHrDLr9CvNJ7YC8inJvjVrIrrmKlnASHfzzX6xAS0e+1aHq4SQadjv0m4ZhcncR0DW+A
         NAqsxZMe4a/eL6BC1v/GFdvJr3D5182mSEs3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090027; x=1795694827;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=24q4cmEurzIe18amc7z0k3Uuq3pJyF0XxrOE02jUc9M=;
        b=D0nAtrVh9o43A+aBQWYwYmBvDtTSZBJqJZvovDKy8BiSA8+vS6HC5SMuC14FUyzp8l
         C3QRdVH+nOk+gVQu+J5EsiHYMqoP1EfqSE4DlySTu3hdIymsoakUAkVJUgONvqb33XoD
         ujhwNJ7whdGAtwsWSjNXqWsCtcmra+Zkpinlj6TR3u5ty36KJYM8mr14Zm2Ka/XvP8yh
         fQf67PLdElFP2Yb33UjZmm3QLSmquluoWms3fOYrOMZK2OvtKzK1L4Z3pyrZuCXB94iU
         VMVOTn0cPFwaJNvvmixOuk7T7Kwc1iheAHPIQhCS8JWjp345ZhMjenGFwAu7bk+Cjeky
         XB/A==
X-Forwarded-Encrypted: i=1; AL+hErG+Gz6CIwJNa6MCfxx69rplY3H89hz4PI5wxpWrHadAbZjKzW3PQI1ZuUZ+uCWq89SrqiXbmzMufzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lzOdNW3FsJB6UmtRSqXoNQlbJViQtcl1SWoJH0IPrgWzjkrqr
	UYk9mMsMdKu4I9aucAiujo+5kiPP39HgR9C3KpPHat7OOkULpnBm5KFPWbemTuiB4S95bd2FsTk
	sdy7STw==
X-Gm-Gg: AZFdTZcLUv5OvDj1d8HtdsE/rkYRhp3rZzzy4OJafJzYs33+RdzbRx2hKcpQ6Uc9jgz
	C6hy7E5M4mMF7OiKEviUN69ebMYrKLcxAnXamy0+WhRsAHJzdUOfgKRtHXd9Oh4VV4ONgjTJV+q
	+Ahz5yBAaxw6Ecthdasu6jqv3Grd0GERbrbNqHV/fmUmmOYu2w5b4ZQ+yb8CgXGFyTPBwWhdAS2
	0/CmJbhFUGEXSfeVNs0fRXuop2G8ylWOkw7XNJ6hYurSs8+6WzjGDN8NgSNlYjXt/mf5IY9yiv+
	B5U0RKFrS6UgUTcCRo90zUzqdEob8oewEQslYjDGqP1WZCZFdKOCVrxxbo1R7P0czegoTJC4acT
	WPRbQ6ub+w+Ph5mExVoXV6qxklsGGQocn8j0lW2RTlYVoxwNbhImAXlRbGDNVR9vd8m6HGBAEb/
	DeoVnL4DVzKyEk9B6W2wytqXIv9ZnNXHD+9EEdtyYau/cbESL2Yihsu1v9lzIEMieuehR+Oz7Cn
	axf1NdZZpjsEt0Zb+xrDXwZEI3oNVKuG9T8J493udUHyyjRzBuP3DOpS8rADi0IN17hMA/gX/zm
	UpivzcK0fufgphaYyCib7cuaBSb0lpkNhyvdH8V16A9Is+Giba7CJM0xnd42/RTzTQ==
X-Received: by 2002:a17:90b:1a8e:b0:3b4:22d:e066 with SMTP id 98e67ed59e1d1-3b4022de7e6mr1582409a91.5.1795090026747;
        Thu, 19 Nov 2026 04:07:06 -0800 (PST)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com. [74.125.82.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm2575067a91.5.2026.11.19.04.07.06
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 04:07:06 -0800 (PST)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1890310c88.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 04:07:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFNHH9ZhquHkIlAI3BdWLgiAPvoLxoGVGAZ8WQUtmR23cmIZ/o/SLKPdDMUEqxiM1V0SvA908OP9Bs=@vger.kernel.org
X-Received: by 2002:a05:701a:cc82:10b0:1b5:22fb:848d with SMTP id
 a92af1059eb24-1b543cb3e8fmr5039059c88.16.1795090024686; Thu, 19 Nov 2026
 04:07:04 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-streamcam-batched-unlink-v1-1-076bc02866c1@yasunobu.dev>
In-Reply-To: <20261119-streamcam-batched-unlink-v1-1-076bc02866c1@yasunobu.dev>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 19 Nov 2026 13:06:50 +0100
X-Gmail-Original-Message-ID: <CANiDSCsdaokL_2u_74b3ADT+U8TXskK53+k+hVA8D+PtttYEZQ@mail.gmail.com>
X-Gm-Features: AclHuK_6-kx4dLzWCqgcpOPpfIaOLcQS812PG4RzKdcZVof6cGBPVfLtVtNaR98
Message-ID: <CANiDSCsdaokL_2u_74b3ADT+U8TXskK53+k+hVA8D+PtttYEZQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Batch StreamCam unlinks on ASUS ASM2142
To: hi@yasunobu.dev, Michal Pecio <michal.pecio@gmail.com>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Yasunobu

Thanks for your patch

On Thu, 19 Nov 2026 at 12:47, Yasunobu Sakashita via B4 Relay
<devnull+hi.yasunobu.dev@kernel.org> wrote:
>
> From: Yasunobu Sakashita <hi@yasunobu.dev>
>
> Stopping a SuperSpeed StreamCam can halt xHCI on the ASUS PRIME Z270-A.
> The fifth Stop Endpoint command timed out after an invalid type 15 event.
>
> For the affected StreamCam and ASM2142, block URB resubmission.
> Queue all unlinks before waiting so xHCI can coalesce them.
>
> The stock driver reproduced the halt on Ubuntu 6.8.0-149-generic.
> Three FFmpeg 720p MJPEG and audio capture cycles passed with the patch.
>
> I used Codex to help analyze traces and draft the patch and changelog.
>
> Signed-off-by: Yasunobu Sakashita <hi@yasunobu.dev>
> ---
> Built uvc_video.o on media-committers/next with and without CONFIG_PCI.
> ---
>  drivers/media/usb/uvc/uvc_video.c | 43 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index a92a986ab..0ee5a7d17 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
> +#include <linux/pci.h>
>  #include <linux/slab.h>
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
> @@ -1885,6 +1886,26 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
>         return 0;
>  }
>
> +static bool uvc_streamcam_batch_unlink(const struct uvc_streaming *stream)
> +{
> +       const struct usb_device *udev = stream->dev->udev;
> +       struct device *controller = udev->bus->controller;
> +       const struct pci_dev *pdev;
> +
> +       if (stream->frozen || udev->state != USB_STATE_CONFIGURED ||
> +           udev->speed != USB_SPEED_SUPER ||
> +           le16_to_cpu(udev->descriptor.idVendor) != 0x046d ||
> +           le16_to_cpu(udev->descriptor.idProduct) != 0x0893 ||
> +           !controller || !dev_is_pci(controller))
> +               return false;
> +
> +       pdev = to_pci_dev(controller);
> +       return pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
> +              pdev->device == 0x2142 &&
> +              pdev->subsystem_vendor == PCI_VENDOR_ID_ASUSTEK &&
> +              pdev->subsystem_device == 0x8732 && pdev->revision == 0;
> +}
> +
>  /*
>   * Uninitialize isochronous/bulk URBs and free transfer buffers.
>   */
> @@ -1896,12 +1917,24 @@ static void uvc_video_stop_transfer(struct uvc_streaming *stream,
>         uvc_video_stats_stop(stream);
>
>         /*
> -        * We must poison the URBs rather than kill them to ensure that even
> -        * after the completion handler returns, any asynchronous workqueues
> -        * will be prevented from resubmitting the URBs.
> +        * URBs must stay blocked until the workqueue has been flushed.
> +        * A completion handler can leave work that tries to resubmit an URB.
>          */
> -       for_each_uvc_urb(uvc_urb, stream)
> -               usb_poison_urb(uvc_urb->urb);
> +       if (uvc_streamcam_batch_unlink(stream)) {
> +               /*
> +                * usb_block_urb() keeps URBs blocked after usb_kill_urb().
> +                * Queue unlinks together so xHCI can coalesce them.
> +                */
> +               for_each_uvc_urb(uvc_urb, stream)
> +                       usb_block_urb(uvc_urb->urb);
> +               for_each_uvc_urb(uvc_urb, stream)
> +                       usb_unlink_urb(uvc_urb->urb);
> +               for_each_uvc_urb(uvc_urb, stream)
> +                       usb_kill_urb(uvc_urb->urb);
> +       } else {
> +               for_each_uvc_urb(uvc_urb, stream)
> +                       usb_poison_urb(uvc_urb->urb);
> +       }
>

Michal proposed something very similar not so long ago:

https://lore.kernel.org/linux-media/20261115110132.2b0bda47.michal.pecio@gmail.com/

He also mentioned that those crashes were solved in 7.3. Could you check if your
device works fine on 7.3, or if it still crashes?
(Note that even if a workaround is still needed, we probably wouldn't
want to match
host-controller PCI IDs inside uvcvideo.)

Michal, would you recommend applying something like what you proposed in your
email, or would you rather fix this at the USB level?


Thanks!

>         flush_workqueue(stream->async_wq);
>
>
> ---
> base-commit: aa0f4c41d4870a18e65772a1817af16427200371
> change-id: 20261119-streamcam-batched-unlink-fb4a6e39626e
>
> Best regards,
> --
> Yasunobu Sakashita <hi@yasunobu.dev>
>
>
>


-- 
Ricardo Ribalda
