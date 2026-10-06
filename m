Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EE03BB689
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 16:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304388; cv=none; b=iHKAMwCWoIY/lc7XCRwkn+1bOam06z4LFUi7LB1XlHB1GQUl6AFPvBRye4g9P+F/r7MlpkZAzWDoFRtJSxn3GQrsJiusbSMsg0bS/Zob1bgKAb5MczPs0lsYujFeZxcUhgVfrLcAp/EnqwhZ61SRBQPQU84ojt/BIMl4L6dI1wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304388; c=relaxed/simple;
	bh=+U1ITo7XAGZ49zGQAaSteWlasCyPnueY53J9ojB0D1A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ilvPpzRoXnH1BaKACw55v4kGq+hl9hEaoduPwWbo5o/U7HInFtgsiigv0OtsznHIoE1t/BHrFHgSNcCOkn+a0szjiRNmIg2xvxzY5r8G0voMlx/FJCdxFdSs15trNqrq6dPa1nghkRtefpVZB0vv710FjQWMWfBxcdP3KS5VLdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J486gm4g; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J486gm4g"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4d870d54so641377f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 06 Oct 2026 09:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791304385; x=1791909185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pmGKhGmqIThKYVp+YnneYEP5sa+IfDHt1/Idk0fozj8=;
        b=J486gm4gvI9AEMXik7JpMaP1rWTQVX/xUALFCd2gWgjg0CqmsZYHtuGq+gRVaYUAqT
         yp2jqNTGBf2MzMwat+NOEKdXyC57STZBxRdl1bk1zKZGcZUQJ/dpnq/oTMbKH4UlodDT
         nd42m5ohKJxZWuFRCEFZ4s2wPNrBwJg3Gh6fY/lp8W2WFUmrktRXtQeYyqIpfOxIis54
         p4uDRfvbFOPycZruv/ngLjNAhUmin5WJEhItm2mVkVEnCmYCzWKJi8H5gEN9MZc8/Suf
         zl+Zrg5cUQDGc2GbzKfNoV46peJ7CBthluJdtfgtI6Mv95WKrvD/gm1sNH8WG7scSO5T
         s3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304385; x=1791909185;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmGKhGmqIThKYVp+YnneYEP5sa+IfDHt1/Idk0fozj8=;
        b=LUFXA1mUOJOcnKwnVQl/b9NiWpzP6j/2Qm0l1W1K/CcHRmg6d9r0MQ/uZxv03yrmsx
         ukM+dLjFoNPe9Eq5FEIiHYk2NDhfVIceNU94XngUDefw5EsaIjyO6lk1u4syEiCeO1qN
         mxYZI0un/DA8PX3UQ5ZOweAqy9lU4okLDBmlgpinHAF9uxwTucgPFsbE+od7hcRJURCr
         wF24WLU7aSR6gSFMOvpvyp+8Tj5adIUsNH3F91pdzTxkvSV4Itqp1oh4u7VomH1YUhH2
         ZhIrv3mBpjXBHyZvh1RWQ/iHBGUryIqBpMb8o/qZEyAZlAJD8Ig62NkS+oRhhSdO2ZYj
         Z2FA==
X-Forwarded-Encrypted: i=1; AKwUvBxUErfTeQ0mevrUGxpc4CHDWJPSV9Gk/12sHwQhWZWpi0jNplnVxCPd+5nUKcrIAsEiYf6hrZae+Ms=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHA+wym03/AMoNa21jiNAeyAGOr8qm+y1ZZ7pgDlmpxCfBa7Tw
	8vOTLsKMYPAxNIPCZa9qdWCuh6VSnsssE0f8ewdY8wohlhJfbumlZshG
X-Gm-Gg: AYBFou3gbzH+0D76k703wWcgZ2qmnAg1sLolENTC93bzMWg0OEBwIyRMF45jE0/8jkp
	bEPZrbvxZddUsyWInloWxGAyttEA4Mj+wwriCb5qExpCf8kO/KBF6JsNnGaGrjcHJ1uVAG45MR6
	Y1qNCt0ioM3jiQfukxbLBbjNlZPs87FVLe8ximfQ0svzUuHdrIlF01M4vPfCeWyUVkNObQ/7fBu
	tIZZ6RzZObxhflNWeqUgMOdzjnr6qTWTpwR3lLbV8K3jjzgJ8PQRz4+h3a92RkN5Q+JrIsVQZL2
	JwJV4m1RkB2r5b9QWRbDDiDbXq5djx5qBfud/1zOUOPx/xC9Y9nkmdNssjTwzI0oZeBK6Qb4ULQ
	htE/yHneoPxwm7zTNHeJ6xejf4bOPgXUGJWW4hdAAcFyelKscyGTVGSTibWpPNvJ1jjSS5pf9pY
	Uq6gi/kRNn8PUw44OdayC+RwliuErVvjdOFZzHLC5mjocYuY968vcgGNuec3ErzECosA115h4vO
	XzIf6bpwqfaE3VxnBIv
X-Received: by 2002:a05:6000:4819:b0:488:80d0:873a with SMTP id ffacd0b85a97d-48c726f19d8mr58695f8f.5.1791304384596;
        Tue, 06 Oct 2026 09:33:04 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1ffd2sm499105f8f.34.2026.10.06.09.33.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 06 Oct 2026 09:33:04 -0700 (PDT)
Date: Tue, 6 Oct 2026 18:33:01 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/5] usb: xhci: correct num_active_eps accounting on
 allocation failure
Message-ID: <20261006183301.7a1875c3.michal.pecio@gmail.com>
In-Reply-To: <20261006152427.3735383-3-niklas.neronin@linux.intel.com>
References: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
	<20261006152427.3735383-3-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  6 Oct 2026 17:24:24 +0200, Niklas Neronin wrote:
> Some host controllers have a global endpoint limit across all slots,
> tracked by 'xhci->num_active_eps' when XHCI_EP_LIMIT_QUIRK is set.
> 
> During device allocation, EP0 resources are reserved before
> xhci_alloc_virt_device() is called, and 'num_active_eps' is incremented
> accordingly. If xhci_alloc_virt_device() subsequently fails, the slot is
> disabled but the reserved endpoint resource is not released, leaving
> 'num_active_eps' permanently increased.
> 
> Decreasing 'num_active_eps' happens in xhci_handle_cmd_disable_slot(),
> which is called upon a Disable Slot completion command.

Why is 'num_active_eps' not decremented if the slot is disabled and
Disable Slot completion handler is supposed to decrement it?

Does this bug really exist? Can you reproduce it by forcing the quirk
with module parameter and simulating vdev allocation failure here?

And it makes sense that Disable Slot should be queued, because this
code only seems to run after successful Enable Slot and we don't want
to leak the HW slot on allocation error.

> This causes the driver to gradually lose available endpoint resources
> after allocation failures and may eventually prevent new endpoints from
> being allocated.
>
> Fix this by decrementing 'num_active_eps' when virtual device allocation
> fails.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 4708fabba84a..ca56e0b69415 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -4279,6 +4279,11 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
>  	 */
>  	if (!xhci_alloc_virt_device(xhci, slot_id, udev, GFP_NOIO)) {
>  		xhci_warn(xhci, "Could not allocate xHCI USB device data structures\n");
> +		if (xhci->quirks & XHCI_EP_LIMIT_QUIRK) {
> +			spin_lock_irqsave(&xhci->lock, flags);
> +			xhci->num_active_eps -= 1;
> +			spin_unlock_irqrestore(&xhci->lock, flags);
> +		}
>  		goto disable_slot;
>  	}
>  	vdev = xhci->devs[slot_id];
> -- 
> 2.50.1
> 
