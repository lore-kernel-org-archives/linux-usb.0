Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CA74D2EC0
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 15:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787324750; cv=none; b=j6/fVkSmGsLfomhXMwJ6ro5t0UTwB47eGx8pW/ZZOjAnAq9YqliG94cv34ai/cOCryxhTzemU9fJH/+31FG4Bg18gU/ztTWwCzAP2JH0iVFlKfta5ynMOiNMom93gjgdNNl8MQrLMxf5LVHYf79m+rvqGpdzgutBejZGrfITjXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787324750; c=relaxed/simple;
	bh=IJO7e3BUUXXk2X8x5asAdFzP1TVG7K7ADECgWHQtHSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atkIv3/6MRojl5OjCkHJKvapYRbOZcuNQtcQwp1epm0JhlGjMb6iRoH30pdtvUtT9mv39PDelJWDEOn+fs8RZ9GS1HN9BPx3F6NL9mfaxa3mMn2nobHCSmyPw4LHLTbvStaEiVFtFNB7c0Yil7CcggiAwfpPJrKPZTqBeT0gsZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=mSdcBYtk; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="mSdcBYtk"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c05dcdf49so10158941cf.0
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 08:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787324747; x=1787929547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6xOjJA9AnDpbJMMo1ZBVsTgPFwmJ8WQdOBFfTxGpPA=;
        b=mSdcBYtkG9BFEohYiEWnZiLBaanZH2R3JXNhyTZCTgT84x3wLmakgPeuSktWbrRSvl
         Sz7ART1iHVc+rXZPIyhkFw+jaIqqNfNaCwevEHAYJWicSpg+ro15YoOfU9GT3eoZAEM0
         IkOGh0gzmLZPAMZQ44IldzqLpuKMdwKalRml3dc7ZsIq9X2hTm8RPldWFvTg+RfjuKWj
         8GxB9Mc20FLL5tERVCISBU4LEKuxrZ0Zeyztpw1GkG/oq+k68P8/Isufph2nPXHhkcsm
         TdZFJAo+Wy2cr7YG3KOGWOfFd5Pm4tFLg1iIg1e+nWsfLwbZVzPibjpDsKOsn/OzvIj0
         dEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787324747; x=1787929547;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6xOjJA9AnDpbJMMo1ZBVsTgPFwmJ8WQdOBFfTxGpPA=;
        b=YeLeHfs7GVPOBZ9fCF/On93LBF9CoKfBIaz3SYMXWa5eJuxkPtOwPl4ohK+qXFLqRN
         6g9hF1QjhJvLtbBEAO2dmpx6qoC8X7DD2aZd8emSEkmexyCdQjWaWmihYoreDxYOjKCj
         F2Ks/097dCzjIHA5YLTpq9shFckHYUQKnSmauDqIzWZmJicXoCfSzQR9LrHlKUNwMzRU
         WvyVdbkeNRFOsztTel9dbYQ5meDnsE651AcqslH6oF3WcoFhdAcf94ADqE4kP2Ge3bk9
         0iRE2+XkFfLi/pvcfPIbma4KmS3fKQ/PpRpJony1c/wAdL9APeN5usviDjiy29G8DMD4
         ibcg==
X-Forwarded-Encrypted: i=1; AHgh+RpfZnkV1PRRe0JsEVZ8MRMCCdqWo/PdhdJsalyGGOEZtAvmAKZMgEcr0CCFMLXOwAXBKiKCzAtWHyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBkVSAqNA7MFJQoEJnNeS7Wu5Y+zk/5VxUZHT6RArRGEyp1Xet
	0f7Kks3INtUABnN67T/T6LvZ1yf8h1E77ykyGl+5jF4nmaE608lKMuY3eGoNR7TK2A==
X-Gm-Gg: AR+sD10LFX3anGh/KWO7CnYhZWL5X1YFkjtTH8eFmtn94Y/ic1YjT2m9riaXIhczAtp
	68QJiXEZxkqVn1dkGG4MhpYDaQ8EQs/uzYNerem1qUGrH5ztNg0ZZbRonC/zVbwpqfYhvPA3g+t
	v9ebgMlB470Zpu/s9b6Ms26Il30PLvOuIPR1tTPME6ZfzNCOBTxnf2SVJH9g9Ke9dLu5d8NBHw2
	SfEbpfhF0b1Af0S8OGfnY4FTE0NcQ5xJi8nNp0SiyWyoJ46rxym3p4Tq9mJZINLb+0KD3n9HNmj
	zl9CzJ7yrO/8ILtNN/xYBFAStfNWRtMdSAa17UbWGjGpIOqy6wp0/BmvgS2Ml+7MPBLkjuq97ii
	MMbQJfbUpVQRUkwPd2fH9O5RwX1CsqW9Q4eU7Aj9lWAxYScw10f69Tax+zSZHQXJKVZrSxdNN11
	+Hd9c/Or3S6jN7Zbno1uMpD/r9ACWCXJ/upy/7MbrlRwc3CYCwBKyzdCs3//xqbw==
X-Received: by 2002:a05:622a:5a17:b0:51c:1c73:5945 with SMTP id d75a77b69052e-52df59fbc11mr66957991cf.24.1787324746706;
        Fri, 21 Aug 2026 08:05:46 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2b8164sm64682506d6.48.2026.08.21.08.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:05:46 -0700 (PDT)
Date: Fri, 21 Aug 2026 11:05:43 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: gregkh@linuxfoundation.org, kees@kernel.org, lgs201920130244@gmail.com,
	balbi@ti.com, ribalda@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+2ec7fc1793a63864d9d6@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: net2280: fix NULL pointer deref in
 usb_reinit_338x()
Message-ID: <08266cf6-fb65-43ff-bcd8-d8c367c756db@rowland.harvard.edu>
References: <20260821121220.13006-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821121220.13006-1-kartikey406@gmail.com>

On Fri, Aug 21, 2026 at 05:42:20PM +0530, Deepanshu Kartikey wrote:
> net2280_probe() only maps dev->llregs when the PLX_PCIE quirk bit is
> set. usb_reinit() dispatches to usb_reinit_338x() for any device that
> doesn't have PLX_LEGACY set, assuming such a device must have
> PLX_PCIE set (and thus llregs mapped). That assumption holds for
> every entry in the driver's pci_device_id table, but a forced driver
> bind (e.g. via sysfs bind/driver_override) can invoke probe() with
> quirks that have neither bit set, leaving llregs NULL and crashing
> in usb_reinit_338x() on the first readl().
> 
> Reject probe() early when quirks has neither PLX_LEGACY nor
> PLX_PCIE set, instead of proceeding into a reinit path that assumes
> one of them is always present.
> 
> Fixes: adc82f77bee3 ("usb: gadget: net2280: Add support for PLX USB338X")
> Reported-by: syzbot+2ec7fc1793a63864d9d6@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=2ec7fc1793a63864d9d6
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/usb/gadget/udc/net2280.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
> index 7c5f30cfd24d..02d12c2ad58b 100644
> --- a/drivers/usb/gadget/udc/net2280.c
> +++ b/drivers/usb/gadget/udc/net2280.c
> @@ -3708,6 +3708,17 @@ static int net2280_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		writel(0, &dev->usb->usbctl);
>  	}
>  
> +	/* usb_reinit() dispatches on PLX_LEGACY vs PLX_PCIE and assumes
> +	 * every non-legacy chip has llregs mapped (PLX_PCIE branch above).
> +	 * A forced/mismatched driver bind can hand us quirks that satisfy
> +	 * neither, so refuse to proceed rather than dereference NULL.
> +	 */

This is a rather verbose comment (it sounds almost like it was written 
by an AI).  You could just say:

	/* If neither PLX_LEGACY nor PLX_PCIE is set, usb_reinit() will fail */

> +	if (!(dev->quirks & (PLX_LEGACY | PLX_PCIE))) {
> +		ep_err(dev, "unsupported device (quirks=%#lx)\n", dev->quirks);

People generally don't use the # modifier in kernel log messages.

> +		retval = -ENODEV;
> +		goto done;
> +	}
> +
>  	usb_reset(dev);
>  	usb_reinit(dev);
>  
> -- 
> 2.43.0
> 
