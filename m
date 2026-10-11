Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A409C21D00A
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 02:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791684692; cv=none; b=J7g4zCHh33tHW5K8qbjpfPAkbA8Ikt5wFNfCoUjXqxPpinVPrpHB9HYBXZqArOwvwWBFh3ssh9+9sWbYZTnxDpWhPZAlBBWbZGgMa/x2dqdMcC2225n5C8l8v91cn9oUXLfJPU9j3292v/eZyUPMFZwiu868+dXLxhpTR+A2e5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791684692; c=relaxed/simple;
	bh=MSEH45Zh3bRkDphRXJVCTswtKaTWR+XuyPWFzU2Hulg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFDdysCnZUUkOFEORMrirDhFlVboJk3lqCdr4vhwZsJVJWaD6XoVqSJ2CPfzoxCU7NGWAoh6sc+aB8hthqehGqTcGJD03+U22KW2FnpYnnnsILu84jrQDG37nrsQd/Trb3OKZXkkX25AQH12m1hQKQYNIXFWzjnmV7WNZFktK7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ol244k/H; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ol244k/H"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5339733feb9so8689321cf.0
        for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 19:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791684689; x=1792289489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bhHMfVW5gaUAkUE2JwhBYDwqeeYb6dFzaqnjxCjt1h8=;
        b=ol244k/He6p0ILWfRrNcjVuxKmyLsn12dZRDb2XZw9Y9jnh2t3KFTfkSy57FAFa8Ok
         ApT8Wa9nRtUSzbu7bOlaiNEnPITqSPIEncLU4nujs2MY7QOSY1PF+ZrDLP+iV/fyOij0
         xrI2uwqte8lo7otUJUvDQ4ubZW1OqfxXYIBO3GOGZSBZadI6FIsTI2lVg8iNI/bsCbxm
         oY9lg/pZmXMYtPqwiowNXt339xAaKBoQlFwryLfWfLPR8TMVY4WdLSZRmx7JU0RO6dHO
         Kaj9gTebtOqfdseUb3Am5nvs7+rS3YfCmJ8GRyKEZnTYIoybiXZ8dqm7RUyinZwC5sn6
         AubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791684689; x=1792289489;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bhHMfVW5gaUAkUE2JwhBYDwqeeYb6dFzaqnjxCjt1h8=;
        b=XyN1D90onJIdUfOCBQQYdqCuAi8iYuvofhvt370DE4PJSNFpj8PAZfg4iGAKxzTIOf
         cduMbP2TtWmR35x8OkkHd3gTTgeU5PF/Fbze215RTjj6LusFGtUPkVusjB22GEZ5XGRJ
         Y9HAQ83vM3/1WwaL1yYqFqvloWEklqD1DHVcqL55D444ucOVnispqw4RdA3FS1UDorLW
         xewPoJgKcJluEm+uckpwykYFonjyT35mb9gmSIAPcw8TKcHU5ypyX079BJ6D8IoQDC36
         k1CXleASYT/V1p8Hpkeoa+CA3J/ryF5TFB+tyoWhxnJNHqPF6YvI4O6t5+VpgXIz3kgd
         SMaA==
X-Forwarded-Encrypted: i=1; AKwUvBxQ6nlhMzBv81hzC0cgCqeApntaSFOsBOqCcqJYdiN49KPKlTvg2Qt/WQ6qf8ciKHcWBQBZvbSDI+A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaDQSGs/stLKXn/YaQxoPsUshU6A3je6BVKxXIjhUlpxlFe8O9
	Dyiij7aXLLMiWXe5h4SEfd2f4Powm1ve83ZQqx70x5O5rA7ud1NlUDs97ImU3S7SJw==
X-Gm-Gg: AYBFou1nwH++RqkTFH3hdroWh4a2u6fKkK2A9sgw2N0dDJVwiYzF32jypFPV+VCAnqt
	pCD+j1stwVdEvLXGxRS/FXBn5QNKvxPDdJu4eUCMWjEbKmoywoIvqDjhRlSZtmAkusKEHfiawpL
	GxneLFIbOTcdPj+FFO4PbycPZmOoaASE169qNgitC0C2JReIl89BTPpTlBRfdfqWsWszcMBpCM5
	6FPj3DOK0gc3SVvioTLhlIlBOp7pJ/91PyShtVNWc0pNiShXR8IXJzMcZ+QOggPml8vbAbmzzjK
	iQerWbfjq9h3iSkfQXAqWu7TQo3aN4k3gVNz7CHbRe4yYvFSJm0VVXiPYX3Q+HOlliFe4mGCgp7
	bfIATEsp/pa4fhhC5EnR24Bh8XIpYX06KZxmJpO09rStuOsO6y1a8jrS61PpFCtWpg48sEFg+fn
	jiLjC2sgfEb5bQEvPk5U22G39FjcldBqCQsMNzAaNbK6cHh37JlcvNb4GF/QA/BiH2ITJRSEQ=
X-Received: by 2002:a05:622a:c03:b0:535:1b50:48a6 with SMTP id d75a77b69052e-5359f494cacmr104890521cf.6.1791684689277;
        Sat, 10 Oct 2026 19:11:29 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::1b7d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7b2e97sm50112991cf.24.2026.10.10.19.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 19:11:28 -0700 (PDT)
Date: Sat, 10 Oct 2026 22:11:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: joe@sudmix.de
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: sysfs: show product, manufacturer and serial
 without the device lock
Message-ID: <fedea68a-a905-4ed9-9a6a-05afdfab07d6@rowland.harvard.edu>
References: <20261011-usb-string-attrs-v1-1-81c01b035237@sudmix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011-usb-string-attrs-v1-1-81c01b035237@sudmix.de>

On Sun, Oct 11, 2026 at 01:15:38AM +0200, Joe Finzel via B4 Relay wrote:
> From: Joe Finzel <joe@sudmix.de>
> 
> Reading the product, manufacturer or serial attribute of a USB device
> takes the device lock. A hub holds its lock in hub_event() while it
> enumerates all of its ports, including the debounce and reset delays of
> every child, so a reader of the hub's strings waits until the last port
> is done -- seconds on a hub with several devices.
> 
> udev reads these strings for every USB device (the usb_id builtin, run
> from 50-udev-default.rules). Its worker blocks SIGTERM, so when systemd
> stops udevd in the initrd before switching root, it waits for that
> worker. On a desktop with a few hubs this delays every boot:
> 
>   i7-13700K, ASUS ROG STRIX Z790-F, four hubs with HID devices behind
>   them: udevd took 1.7 s to stop, while the hubs were still enumerating.
> 
>   QEMU, qemu-xhci with 8 usb-hubs of 8 HID devices each, second boot,
>   three runs: udevd stops in 2.55-2.58 s (switch-root at 5.56-5.59 s);
>   with this patch in 11-12 ms (switch-root at 3.02 s). Without usb_id in
>   the udev rules, it stops in 9 ms as well.
> 
>   -device qemu-xhci,id=xhci,p2=8,p3=8
>   -device usb-hub,bus=xhci.0,port=N       (N = 1..8)
>   -device usb-kbd,bus=xhci.0,port=N.M   (M = 1..8; also mouse, tablet)
> 
> The lock is not needed: usb_enumerate_device() sets the strings once,
> before device_add() makes the attributes visible, and usb_release_dev()
> frees them only after the attributes are gone. Nothing changes them in
> between: authorizing or deauthorizing a device no longer touches them
> since Wireless USB, for which they could appear and disappear, was
> removed. dev_string_attrs_are_visible() already reads them unlocked.

No; it reads the pointers to but not the contents of the strings.  
However, this is a minor point.

> Andy Whitcroft reported the same boot stall in 2010 ("khubd -- switch
> USB product/manufacturer/serial handling to RCU"); back then the strings
> could still change under Wireless USB.
> 
> Signed-off-by: Joe Finzel <joe@sudmix.de>
> ---
> Found while looking into a 1.7 s stall at the end of the initrd on a
> desktop with several USB hubs; reproducible in QEMU (see the commit
> message). Tested on 7.2.9 with the QEMU reproduction; applies to
> usb-next.
> ---

You could submit v2 of this patch with the claim above removed (and also 
removed from the comment below).  When you do, you may add:

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

>  drivers/usb/core/sysfs.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
> index d22dc7845..52e0a227c 100644
> --- a/drivers/usb/core/sysfs.c
> +++ b/drivers/usb/core/sysfs.c
> @@ -120,21 +120,20 @@ static ssize_t devspec_show(struct device *dev, struct device_attribute *attr,
>  static DEVICE_ATTR_RO(devspec);
>  #endif
>  
> -/* String fields */
> +/*
> + * String fields. usb_enumerate_device() reads them once, before the device
> + * is added, and they are freed only when it is released, so showing them
> + * needs no lock -- dev_string_attrs_are_visible() reads them unlocked, too.
> + * The device lock would make readers wait while a hub holds it to enumerate
> + * all of its ports.
> + */
>  #define usb_string_attr(name)						\
>  static ssize_t  name##_show(struct device *dev,				\
>  		struct device_attribute *attr, char *buf)		\
>  {									\
> -	struct usb_device *udev;					\
> -	int retval;							\
> +	struct usb_device *udev = to_usb_device(dev);			\
>  									\
> -	udev = to_usb_device(dev);					\
> -	retval = usb_lock_device_interruptible(udev);			\
> -	if (retval < 0)							\
> -		return -EINTR;						\
> -	retval = sysfs_emit(buf, "%s\n", udev->name);			\
> -	usb_unlock_device(udev);					\
> -	return retval;							\
> +	return sysfs_emit(buf, "%s\n", udev->name);			\
>  }									\
>  static DEVICE_ATTR_RO(name)
>  
> 
> ---
> base-commit: 42bcac323cc3b16566fed8c5b250318ad02a0de0
> change-id: 20261011-usb-string-attrs-74abcc8b0195
> 
> Best regards,
> -- 
> Joe Finzel <joe@sudmix.de>
