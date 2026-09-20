Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966AA3E8C78
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916325; cv=none; b=h8JLD+jHNkDNcB+FSnZPzl+l56wQnfVXlNZR68AXYsaokgt4SiHRXWpC8S6hHX07r64YkU81DqvJk3YY7QE/uyD7uF/iOnOnA7TwMsZUVF5M2RA9bWPEAX7jJswAh7a62UPYpFfj+WsbWm6W9Mc653Aiq+2HB12gTO97e2RKsYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916325; c=relaxed/simple;
	bh=sMXdGX9RxfabOA/eVS7zI3jGxKSS+cU6GRE4LoWaHOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmaNjRFnLk+EEg4WX7f8BHO36BD+Ed1PkTnzbAwjlWPlOMzQkqWRE0GCA7v9RWScB1YcFgy2+1KJdpvAWVkX5glzny056Kz1QB0eAcq7M8kDwQziEZoU5FqbQlz8pWKSWUsLyvYko4Ri38abHC/s3pWMetkLFMo2lQjOx59suBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Jh5vihi3; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Jh5vihi3"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9104649a5dcso20620556d6.3
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 07:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789916319; x=1790521119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hUpgTeZnt88Do5baS9Dydj6Vz4scTE2/FKUaIQsLI88=;
        b=Jh5vihi3I+4Gj9QkqIWeKG8BzLlLEqplmwnCuUtWGMoJkRuFMReXXg7WRpbjbktSj8
         /qCZ5DUA+MLBVkkJmaMkOZIBIkD1gzxjhqsZo9MmT3R7hRVPxYdw8L2daSJ7KXJ/L0J7
         igKi9I7GlAhH8Qb01xiSLIhefXpRtvdGFBvGszer/FGs0Jji/Rfxzgosmc3wnL9XfPG8
         Yke7LWiJU0J6B8Bjm266pAhCQmY9nJJ9Y48OFlC1KmBKyoZQuBXh3LqJJ76rS18EROx4
         RRLJrd0RgdJ0BYIm4ysp1Ut+SSjfKr9gTZUj6gyBqvyMyEthsYGBUIxvB5e0SP9dNMpS
         Va9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916319; x=1790521119;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUpgTeZnt88Do5baS9Dydj6Vz4scTE2/FKUaIQsLI88=;
        b=Q5TZjT9SvIZklNulwPHWWC1cxH1Hc3MoPcywIfSDcOypgnjk+9S8eQ61tK7LLHb08g
         XV966BuEUdL/Fs/KBcPOLY1bykszu977G6iDq1IVtbYawHWBXZvgSPXQOMgFOzxPXIFV
         VLhEEQno1O8B8r9tH8sAsV1okGPiSvsX96NZPDeTFKt93mk7Jpe3tPqZ+Wvnd/vS8chK
         bvCRDrmlRP6VOwILpIXLo1VXYD2s+mzfo3qS6zTFz/K6MILVgzuyB7vz3no2vhpAtSR/
         HgNLuJI2Jew3Ks0bkEiaEVZPC5nH2QQKq6Zjrwylc4hizfpCvpCsB+gaTAQR25FYzt/m
         Vxzg==
X-Gm-Message-State: AFuF++lU2L3BeY7Ucf3203LX0L5Bzty+Dqz2Qvh3l/geNJnsVdSZWr8b
	A5Um5kCHaP0V2ehQjPdpmofHRwbo/O9hMQKKelY+xzrjtgtzxMgD6r3UkOU4QYipvvFLyknwgCx
	vPkemmw==
X-Gm-Gg: AYBFou169J+RFM6NGLe/7U8o6VJj7+dlNUaJSyk2iPsc9mI4ERU/+EKFkon8SunAWjV
	4eMtmU0kr6IiZArL1gEhRp5/apfUBKjrHH/gvz/INR/LXbm+O+GITZEHawAKCIQvbRWO08EUEgt
	QBd1Za4LpVL0Y6BlgQbyqpHawYQClmhO2Oyh8gxg+QOWLG2uMuFcwUeWRkZN1Osa5RrqkOGA8pq
	DW3jnSgiiFt+VuAXSjKD3AZHNf1HZkG6LY28sk51DareSVPEMi+R/Iv/5WC28b4zuhqSqKCqe8y
	wHmh5rEIcywj+VnyOGamy8LvCOCIHEboMBGC95jGgGBmUUo22TNR6+YQJ1WiOoKma5BdkMRPIs+
	I4KuhztAQK+4xi3hMOdPIAmPhc/5SjOFg7txFz69rNZ7PvTTHNiVDaTMyrgrWuB097/Q+bpGA1+
	xPPlnEEexN0vxRz1mC0iucs5Bp/VShtTcb3JNjeWhGr3k5GKwU9LvGLkk+Hni/ARCFPtlrqyQ=
X-Received: by 2002:a05:6214:27ea:b0:910:44be:42b8 with SMTP id 6a1803df08f44-9129c75e191mr65450306d6.6.1789916319131;
        Sun, 20 Sep 2026 07:58:39 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a61570sm46255746d6.23.2026.09.20.07.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 07:58:38 -0700 (PDT)
Date: Sun, 20 Sep 2026 10:58:35 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Fabien Sanglard <sanglardf@google.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: Missing uevents after successful USBDEVFS_RESET
Message-ID: <b7c2f7d1-40fd-4d83-8ced-5fc27e3be051@rowland.harvard.edu>
References: <CAA92w6k-LA4tVXyX1mFNOR3e+_mC43F_BXqhXeWqQyFx2D4_Mg@mail.gmail.com>
 <a0934cb4-82f2-42bf-abd8-95a0016fb0e4@rowland.harvard.edu>
 <CAA92w6my-P4Srfb_AmOm_NjXM6CqaA0Q_Dc_9kgUtM_wCGkHNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA92w6my-P4Srfb_AmOm_NjXM6CqaA0Q_Dc_9kgUtM_wCGkHNg@mail.gmail.com>

On Sat, Sep 19, 2026 at 11:00:22PM -0700, Fabien Sanglard wrote:
> Hi Alan,
> 
> > You would have to think carefully about the conditions under which
> > it should be sent.
> 
> We only want to emit KOBJ_CHANGE on an interface when:
> 1. A driver was bound before reset and forcibly unbound.
> 2. The reset succeeded in-place.
> 3. No driver matched on re-probe, which happens for `usbfs`.
> 
> It looks like these three conditions are all met in `usb_rebind_intf()`.
> 
> I tested it with an Android device/ `adb_reset`/`udevadm monitor
> --kernel --subsystem-match=usb`. When the in-place reset succeeds, I
> now see `UNBIND` followed by `CHANGE`.

All right.

> WDYT?

The patch was corrupted by your email client.  Please fix this.

> ---
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 7f33fe5ba03b..ec4762d260df 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -1182,8 +1182,23 @@ static void usb_rebind_intf(struct usb_interface *intf)
>   if (!intf->dev.power.is_prepared) {
>   intf->needs_binding = 0;
>   rc = device_attach(&intf->dev);
> - if (rc < 0 && rc != -EPROBE_DEFER)
> + if (rc < 0 && rc != -EPROBE_DEFER) {
>   dev_warn(&intf->dev, "rebind failed: %d\n", rc);
> + } else if (rc == 0) {
> + /*
> + * Emit KOBJ_CHANGE to notify user space that the
> + * interface without driver is ready to be re-claimed.
> + * 1. A driver was bound and forcibly unbound (this
> + *    function usb_rebind_intf() is called in this
> + *    case only).
> + * 2. The reset succeeded in-place (this function is
> + *    called from
> + *    usb_unbind_and_rebind_marked_interfaces()).
> + * 3. No kernel driver matched on re-probe
> + *    (device_attach() returned 0).
> + */

Much too verbose.  (Are people learning how to write patches by 
imitating what LLMs do?)  Something like that would be appropriate for 
the patch description, but not for a code comment.  It should be more 
like this:

	/*
	 * Emit KOBJ_CHANGED uevent to notify userspace that the
	 * interface could not be rebound.
	 */

> + kobject_uevent(&intf->dev.kobj, KOBJ_CHANGE);
> + }
>   }
>  }

Otherwise this seems okay.

Alan Stern
