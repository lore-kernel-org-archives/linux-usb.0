Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F198C382383
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860554; cv=none; b=bDOLCktzGxg7Fq4UOvr0yJGCcIIl9aJ63KJ3+rVQftY1liP+vWbBgX9IFvQhzGcnPMS/jSubEDnnk8yRzql/GLpo5+87/qcnlB9IsxcEcCmaXuL6It0mmSeJtBzBdWa3ihs1ipk/yO0jGLvadJZFzAZqmV0u5WoeLfFCsSzJkr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860554; c=relaxed/simple;
	bh=VsneFWcSkus1fFMVXxx/QwSYwMQ2qDtLejzDVV/QDEU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hP0Om2wOl7zZEbc7q9jT6TPD6ogjvXH+Xs2IViUpVPUMJj07uYI8ORZsfXwRBBl+YgI/PX2w6K0pBHI9Ud/9/eHO+/vyRWT9hCzcbSgwpxo8LnVAdYgrX9SJwylj2Dn7cJFpJOmevI1FXvNc2cRqWI9AmjrnZubcVvy40YKzYBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hb6iCScz; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hb6iCScz"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-661b16ac011so7829731a12.2
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 01:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774860551; x=1775465351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJs5jyFDgqnMMoICR2ZJ7zHZjg3apfmhhwnrm6XyWRE=;
        b=Hb6iCSczFQFI+a8ZqiPDRKmFRARWWqygLwRcOIDQVbDg+wKE7gzwFpRawz1QfO/Jnp
         pAq0q1gXOrl026twoUbBOZDe2uufADPOld9gvuaZ+mcM6hmRPGQRxICQgpKzrsjtnwBD
         eKYtlzyWO/17h4Xr1/lOf/2pWkEXt3FrevR9RS6HaK6o0uoH4GPYxD3DYdlU2LtSGXWQ
         fb7ZKDEbP0pjFSPLpjl0cphiOzqXzHdWS61UOe6DWx9H9/lNW7ls0t5E+zJ3LZy0vZdk
         oWOyy1DmDWT+ibWfGrYa+YP/ad9zWpy+RZ91iKuJAQrD5cBUrNxMa17kMaCH+3sprqzG
         a6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860551; x=1775465351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UJs5jyFDgqnMMoICR2ZJ7zHZjg3apfmhhwnrm6XyWRE=;
        b=rsqcRzEdeYM1+TFLC7UoNBx4+yKcEbfNQ3qdyBpy8YZxea/MQkMOOWXyOdCU+6UemU
         LUaaInunIwFW9af4p9V+ApH/6D+pFtz8SSz0NsHLX34ALubC2Bi3bhQA/YbfSWH9SbIO
         AvHGyeTT1uxOTMAXwl8fj6k+4dx8dPuWvr2tk9E68KWP1K+mUjjvrlRlyov7n/ZfNH55
         0z+UfGnRg5UktROdfJTmjVB5VaIYBZa6wVPGpuYjNFEUeU42uTsGbRhwytZe/GYwTg8x
         dtKI8ItCBLvlWsgM5D4rw6HceFxdTS6fv6yNGqHpNBOiipR8CGljbwXeWTc3A7FljRkS
         fdwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVM8k2WY4NyP7TNfwp+twf3bgEMmFTt4eRP194o2FsjU1+134K6WFVpuKQvDfZdUkzI266Q0r5CTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ9UvxdjVfEUMK2E3PCyEC1USFbyzTJ1gCuQCZITepD3NnrHIE
	tR5n93z8fs/SdtS55Qsr5kOmQiFyI11Dp4eGz0Fui2vVXUzsAh7XOH4N
X-Gm-Gg: ATEYQzzbxlgSyXyc53brgNQ8CjOW9QaMGLAj2gXTMpHmNjC6S1d27yV02ybKoAvyePX
	gLiwGac4TlRPyUb3CM8UQEBJS7qj4FunzXGs4e7kaYC/vGIRaLb8YGdcm7PUdjIErghIIf0xSjl
	n9WyY8cLIRX24LfkhGTWsSqQdnCzoS4LdenB6ty3IZHy3R9Iu/V5ieH3I6e08dQZxu7z91TJ/PT
	WlhqP06lu1hqiWLSu85x5VgX+lZisnbFcbHuprrylkp9IsWhOaGpTT0Mw7J8W00HtY5d4SuEq7a
	LEB49DGdDqc0Rwkrg098S6iE8piW5NRFjB39PHUJcfQe3074PMGuA3lmI+jGbF5jM21Rl1V7Vht
	ElKvYzy+pVR4oiXtMPo35LRzrEycG6bIdbApW+mqbmARWPERuvRe8Hno6o1hQsgHOZFvqcnPzS0
	odvoaDiZCsCLyXd1pUCxnI1eAURvxC1AYf
X-Received: by 2002:a17:907:846:b0:b96:f6f1:e7af with SMTP id a640c23a62f3a-b9b502bea2fmr744858866b.9.1774860550945;
        Mon, 30 Mar 2026 01:49:10 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5fc9sm258902766b.36.2026.03.30.01.49.10
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 30 Mar 2026 01:49:10 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:49:07 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com
Subject: Re: [PATCH 6/9] usb: xhci: move initialization for lifetime objects
Message-ID: <20260330104907.224fd772.michal.pecio@gmail.com>
In-Reply-To: <20260327123441.806564-7-niklas.neronin@linux.intel.com>
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
	<20260327123441.806564-7-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Mar 2026 13:34:37 +0100, Niklas Neronin wrote:
> Initialize objects that exist for the lifetime of the driver only once,
> rather than repeatedly. These objects do not require re-initialization
> after events such as S4 (suspend-to-disk).
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci-mem.c |  1 -
>  drivers/usb/host/xhci.c     | 15 ++++++++-------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index ca4463eebc49..2cd6111c9707 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -2009,7 +2009,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
>  	xhci->port_caps = NULL;
>  	xhci->interrupters = NULL;
>  
> -	xhci->page_size = 0;
>  	xhci->usb2_rhub.bus_state.bus_suspended = 0;
>  	xhci->usb3_rhub.bus_state.bus_suspended = 0;
>  }
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 170615dd1e93..4e811a2668e6 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -549,13 +549,6 @@ static int xhci_init(struct usb_hcd *hcd)
>  	int retval;
>  
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
> -	spin_lock_init(&xhci->lock);
> -
> -	INIT_LIST_HEAD(&xhci->cmd_list);
> -	INIT_DELAYED_WORK(&xhci->cmd_timer, xhci_handle_command_timeout);
> -	init_completion(&xhci->cmd_ring_stop_completion);
> -	xhci_hcd_page_size(xhci);
> -	memset(xhci->devs, 0, MAX_HC_SLOTS * sizeof(*xhci->devs));
>  
>  	retval = xhci_mem_init(xhci, GFP_KERNEL);
>  	if (retval)
> @@ -5525,6 +5518,14 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
>  		dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
>  	}
>  
> +	spin_lock_init(&xhci->lock);
> +	INIT_LIST_HEAD(&xhci->cmd_list);
> +	INIT_DELAYED_WORK(&xhci->cmd_timer, xhci_handle_command_timeout);
> +	init_completion(&xhci->cmd_ring_stop_completion);
> +	xhci_hcd_page_size(xhci);
> +
> +	memset(xhci->devs, 0, MAX_HC_SLOTS * sizeof(*xhci->devs));

This seems to do nothing because we just got a freshly kzalloc'd
xhci_hcd from __usb_create_hcd(), as far as I understand.

On the other hand, doing it in xhci_init() used to cover for the
possibility of xhci_mem_cleanup() failing to fully clear xhci->dev.

So same questions:
Do we trust xhci_free_virt_devices_depth_first() to do its job?
Does it need to become more robust?

>  	xhci_dbg(xhci, "Calling HCD init\n");
>  	/* Initialize HCD and host controller data structures. */
>  	retval = xhci_init(hcd);
> -- 
> 2.50.1
> 
