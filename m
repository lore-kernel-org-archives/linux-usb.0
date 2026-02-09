Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF5837AA71
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770648262; cv=none; b=C6PQhT6sIHYFYUCMUdMy06K7KTudLMYdeV0pEO0W6l99ykr5DS1ncL2T/hPUHwSPbDS+RF5q7LT9Bw1O6dartwQz8UiGCzFNMLX3mPuIRRfeMdOtpHH6HiIF3tuq1b1D75Z3IFeuanHyja6IBaq4DK1DHZ2H7mtidKtdCsc/mYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770648262; c=relaxed/simple;
	bh=pZ+8FB+IjLFAihqEUidXHot0YKCS4BDgFYqi1yTrTac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BA5VGU48dv54Qb9Tg5Wja4hutnShnJ8zgb/bzmeintvH5K/4Dgh0X5JUf5F+al7Kf0zCziQ4Gktlu7ECSxAYtx7mQJaOq/6+UuXtG9Cn8H6Y3Rwz+QSV/wxxmV5OT0OSWizmeUnKRZalpPVJbRicN4LHoNE+2UVYqMd8GGsmXMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wl8NmUp3; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wl8NmUp3"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50145d27b4cso52723681cf.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 06:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770648260; x=1771253060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=32CqNrnc3wLMXG4xQkQyEJL6NUeoNBpNTze23tzrWQk=;
        b=wl8NmUp3IeVtxfwTBaWhsLELrTQajFQjeAPzTZTh9ctRhZALmoQ1nHgo1e4FNg/m2J
         UrsySz/lHxdXaSqJTw2Y+Zd9akXnVapUgpSCJM3q//X/4PG51qr9KYWfxi2NKpvPxJU1
         X0ZMPh7VOo5Uuj0HGzpLTUOpYeZ7bYz0FUFIacq+sjRAECKuWAuvv+ugi2EeeicgSBoB
         abF9ZvRHG+DMAaWETMQyR/oX9R+eqK7Ha2emVW7uLw3cEHFxUcVJjhnpnXW9BK58D+mS
         Iz9CGyNjF5FLiridkZ4Jrb9tpRHe8R5uHCXktUgmzoo6D3J81VapBVgLm/gKgcSVIA2K
         WtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770648260; x=1771253060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32CqNrnc3wLMXG4xQkQyEJL6NUeoNBpNTze23tzrWQk=;
        b=omD5RGvCXVaA5YReGQwI/l4RW3WoXWEguSBHCml3LXxG8PlvV1K0b7/BB6uoaCZfaw
         sLmdyZ60ct6t+yMqrh8hlgtqRgX0ispAYJAcHNWidcecHtPe/9m5UHISEgQXguYfe9Rt
         orr8DCl8pbujnXeBEu/WAE11sH/QVovAThDnyn7ShhzswrFNoFHw8g0VkAY6S0YNSMEv
         7grRfwYOiXaNm7/4BUY7nwkvYDiu6OJ+etv2t8hVvRFpzbG6bj6J0yX6FBCTx8PFwTHf
         DUgumd4e3wi5QV+D4kbkcFphIwZ/rjzoaYafK80f7Qm9MuPvf8wSIs6f83eyfsOfGWt9
         JWEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl8XKnmfuzq2iIAqEaGxmufiiYGzpe3+4Rajkom0P3poMJq0pngJYuV4pNfzWwV/lVKvZX8oW/EXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWeZU83lVt168QSYLmVEtthugMIbLYF0Ikff/8UHaCfmEEE7Op
	HzftCkWyW/rCbhMT2zJRJ50Wg1d/1tH5pxw6THoETLjKLeXXrxw4R1cg5TDsnuueSA==
X-Gm-Gg: AZuq6aJpLTLghJUpX6gobBpFct/fwWzdHoJkK6Bzh2RobpMUOxMxzzQbmAwPkHGvl41
	xvjnkEe21wDJQGQJvR9mqrjoQvmlk/gfSLAobVr2zJ7az6EN+jmVHG9+n/41xcbQGNClof8yogR
	MNBqC/kRWmm20jSe+qK7teMjBDc04Vg7QdhKc4fLTvinEkIFsTtgkuwOJpxScxBY4Eutz/Iu7eW
	CNlaNEblX8N6/XNWtEtDX52c+NU4ebtjG9QdR/zDJpIlQpAWov5xsCqj1epyOOCu8uvgycrEl6I
	pYYRCPPtKI3r0nUc75UYAjBnw+En2Qmg0J5eF2d0Hu2DXGVDQsNihfrXEzZg8/h4KPwyc2U3Pe5
	BezZP/gKjEla31Nm+pEv2PLeaFGyww+naQNP8Gf5OxOF6yU0gc+4rckwT0spYnPbzh+/Gud7Npc
	KGcX1Ag5ntVdpIy4L99mXPXRbcH5vTWg==
X-Received: by 2002:ac8:7f0e:0:b0:501:4ca3:7420 with SMTP id d75a77b69052e-506398e9765mr152846981cf.36.1770648260051;
        Mon, 09 Feb 2026 06:44:20 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50640c60b30sm65404341cf.10.2026.02.09.06.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:44:19 -0800 (PST)
Date: Mon, 9 Feb 2026 09:44:17 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: image: mdc800: kill download URB on timeout
Message-ID: <63677ac4-76ba-4ed4-87cc-b2d3171f26cc@rowland.harvard.edu>
References: <20260209060113.1731338-1-n7l8m4@u.northwestern.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209060113.1731338-1-n7l8m4@u.northwestern.edu>

On Mon, Feb 09, 2026 at 06:01:13AM +0000, Ziyi Guo wrote:
> mdc800_device_read() submits download_urb and waits for completion.
> If the timeout fires and the device has not responded, the function
> returns without killing the URB, leaving it active.
> 
> A subsequent read() resubmits the same URB while it is still
> in-flight, triggering the WARN in usb_submit_urb():
> 
>   "URB submitted while active"
> 
> Add usb_kill_urb() on the download timeout error path, mirroring
> how the write path in the same driver already handles its URB
> timeout (line 863).
> 
> Similar to
> - commit 372c93131998 ("USB: yurex: fix control-URB timeout handling")
> - commit b98d5000c505 ("media: rc: iguanair: handle timeouts")
> 
> Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
> ---
>  drivers/usb/image/mdc800.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/image/mdc800.c b/drivers/usb/image/mdc800.c
> index 7b7e1554ea20..c4df637b2a03 100644
> --- a/drivers/usb/image/mdc800.c
> +++ b/drivers/usb/image/mdc800.c
> @@ -736,6 +736,7 @@ static ssize_t mdc800_device_read (struct file *file, char __user *buf, size_t l
>  				mdc800->downloaded = 0;
>  				if (mdc800->download_urb->status != 0)
>  				{
> +					usb_kill_urb(mdc800->download_urb);
>  					dev_err(&mdc800->dev->dev,
>  						"request download-bytes fails "
>  						"(status=%i)\n",

This code is not correct because it doesn't check to see whether the URB 
completed normally or timed out.  The usb_kill_urb() call should not be 
issued if the URB completed normally.

Also, the code should not access mdc800->download_urb->status until 
after the URB completes.  The code should be structured like this:

			retval = wait_event_timeout(mdc800->download_wait,
				    mdc800->downloaded,
				    msecs_to_jiffies(TO_DOWNLOAD_GET_READY));
			if (!retval)
				usb_kill_urb(mdc800->download_urb);
			mdc800->downloaded = 0;
			if (mdc800->download_urb->status != 0) {
				...

Alan Stern
