Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9A2444713
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 21:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786137315; cv=none; b=mtk984+KMrSUOZL/G7SMUimY6AeW8rHpALw8B47lmLnjbcnRRHgEwkOreSKJXuuo/0o2aTGtFbe21J0zscIPAbUvWG5CUXXgISbpOcsaiZeM9l94JxkSlXOqhOpM5nwPMQGujoIhNyv6WlRLiLCI03/OoSzKFZfuGyxmnd2tbpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786137315; c=relaxed/simple;
	bh=N2USNh/aI7kLLcy8fipWsAOXKv6wWsT6BM0mjT/XjWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HrMIRfyZ9oRl3IomuSV2ZnzqeWtYBUMvjDitBGxtGTTUHC3bukU6C00EvANkCMXhWftOnA5gSEVT7CbthRw240m5UrpBKzvunawr8r55TGbzdKmYXa61+bJA1Lhsg0rzRt0HF9PIihbYjISF4GIq2JRFySO3OR/mVLX9/qBguRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ntpLNdPa; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ntpLNdPa"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ef7b7651ecso17679836d6.1
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 14:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786137312; x=1786742112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HUtsIuFtKLKY7tCSUn+/ZGoa4YEihl/fI8I7Wnw6wm0=;
        b=ntpLNdPaRg0v7F64RY7LuvoqquBSryMr2iB3oNfTBGgkp2Upmn6PAxUMpxUkSqS3yi
         Mli1ump42UvDdVKZnRBTH/p3jUOYhszTsSDJVrbVEOvPCUKK17bLJXkARsiKmqorYcAg
         mPMoZAshBHg2nelJD0tvR6eiyZ8iUCCCaeKEbUgAydZa1u9aBsWZHMRYRSqtV/JySL2m
         DyKJAs1KTcaddl0/LaVvuoJ4kXoZMINPY8qULjyUpmZVDgb8bHNnvMCU/cmiT4NLFNfu
         uPFRa8bq7ahJ3j+6OW6WKTEqU8T2XgHofBjTLfFG7YcMCOtqqbcn+b013DTK4ZTjn9yw
         SBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786137312; x=1786742112;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUtsIuFtKLKY7tCSUn+/ZGoa4YEihl/fI8I7Wnw6wm0=;
        b=CIbclyCpSwlZIxvmLOW0WpxP0IlUf9NCsG4k3aaLXk3qFo2nco2dKXHCMSOLHoqopD
         cH+yoKJwSU+miCx6wzLAXjupMESPYyGElQqDjK9aREByfo7StKFYTLvdLXnNLpuzSgCB
         f6NCndWGg9MTmRhgpRc3zB85B7jsUUzBySE1dnKsGe+QcxU10KgXb4tRwQqt+VxfKNdM
         rcFiAdxhuIGJjU1DB3Tp5J/POqXDApBTF5lc4D3N442Fh0SJzi+FHfJdF4CvcfOxc6oZ
         rXtgv760V9jrIiJGpARNLPMxUCXpUxH/STmApktQoZ2CYdh2VRAE7TJGJG/0QdXtD7sh
         QFyg==
X-Forwarded-Encrypted: i=1; AHgh+RrLZ88dbVTypdWQEpTfvkCLN8vpiyqfsb2ZI7CavDr0yxM8LFyHtXBGVZP2gXiIK4iXKRO6tq4q4sU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Mz9/wPsSzkzdqkT7Bk0lIBSFaXqmwSAEXp/7t+XSFwamNrL6
	g5IoohAoHD3r9EVkV+fBtsWZvKk9I/zT7gKCmRrHaqIZX4b8qCcGUE0235w78jK/3w==
X-Gm-Gg: AR+sD11pH/cZI/fUdCKbvZTWsV9MpN32RTb8j0YlYVnvQZf1qpNXp2Se2Cu4LMw+oc2
	TYSQkWgLe+tbYxg2MFmpb91K4lwF01N0fvxWZJ+DNDkzVC7wdh/T1x4ToaefJIWD6yiZeBsUNSa
	BpgOLQvr1L2wCBuCQwpksHjzdh+gz/NNCbigH91gYsfAq/smBJu9HGuIpRDy8tUBDg1JM8+o1b0
	LAMBfxaN6o9C6wKqqH8vdeBymZGfUMuxRddlJrvjdJasgoldHDMNOzQOWmxgv11005XRMXodu7F
	mXnWwnC6ebLVrSQF0RvqENLt+sHdzOtQ6jxhhgk5XPTl5i9bzjwEqYttgjNKLt7W1K+tln7jQLk
	+qMaPiikuhOq2Cbgssz+GjYwfe/OR9rAONf/BRRLeS/KQwub5KGaJpHFVgNBqhaBaoP2NuqUsun
	Ap0mGBskqOmFkZqxqpeuzTtYZcIH52C39CKAqAd+UJl3JyDjEzmKcHuAao6YdQkcvBGUDxun4Hl
	A==
X-Received: by 2002:ad4:4eee:0:b0:8f1:74b0:a4ec with SMTP id 6a1803df08f44-90a366ab412mr19948676d6.4.1786137312157;
        Fri, 07 Aug 2026 14:15:12 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a92fed5dsm17370886d6.29.2026.08.07.14.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 14:15:11 -0700 (PDT)
Date: Fri, 7 Aug 2026 17:15:08 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@ti.com>,
	Tatyana Brokhman <tlinder@codeaurora.org>,
	Kees Cook <kees@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Sebastian Urban <surban@surban.net>,
	Seungjin Bae <eeodqql09@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] usb: gadget: dummy_hcd: fix SuperSpeed ep0 maxpacket
Message-ID: <8a7c3921-3881-41be-96be-7ac28c065ca2@rowland.harvard.edu>
References: <20260807075438.5566-1-igor.skalkin@oss.qualcomm.com>
 <20260807075438.5566-2-igor.skalkin@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807075438.5566-2-igor.skalkin@oss.qualcomm.com>

On Fri, Aug 07, 2026 at 09:54:35AM +0200, Igor Skalkin wrote:
> For USB_SPEED_SUPER, dummy_hcd sets ep0 maxpacket to 9.
> That is incorrect for SuperSpeed ep0 and breaks short packet handling
> in control transfer tests.
> 
> Set ep0 maxpacket to 512 for SuperSpeed.
> 
> Fixes: 1cd8fd2887e1 ("usb: gadget: dummy_hcd: add SuperSpeed support")
> Signed-off-by: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/udc/dummy_hcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index f47903461ed5..29f671c7b319 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -896,7 +896,7 @@ static int dummy_set_selfpowered(struct usb_gadget *_gadget, int value)
>  static void dummy_udc_update_ep0(struct dummy *dum)
>  {
>  	if (dum->gadget.speed == USB_SPEED_SUPER)
> -		dum->ep[0].ep.maxpacket = 9;
> +		dum->ep[0].ep.maxpacket = 512;
>  	else
>  		dum->ep[0].ep.maxpacket = 64;
>  }
> -- 
> 2.49.0
> 
