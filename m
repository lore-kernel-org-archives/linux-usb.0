Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E14E3BBFB6
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 14:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790086880; cv=none; b=PJ1Z+rH5YZb7U4JIa+5I1VkvIQBFobNtyMynI+RBbYMsd93FhmRZ+m/w9oKraEwKPI2F3VqOHPrAGx8Xx3GbJmkWWGNg6HvqlurrjFuScx5VL8gRsil4u3w7EDMj4et1zsO/esxBldXQ3exVcB9q5lS3efAoIso4Ck0QnUC48i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790086880; c=relaxed/simple;
	bh=kFdudzyOuDf+UTufRxKMg1DWZlTApoO++p+5sxjhOlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QntBi5lVkBjhg+uTMP/jro+nR2xMbFGuYqhiRb5vTlYgRGBwMopAppsVWReGi4rpVcdz2jHo1Vfgz3scp+mkJJIclqSyR+rHyL0pJPV1yWxjU4Zjmll37h/Zke153FBrjH/AxNWBHcUfb/PnVXKpNnOKFaoxrMrx7m+QcTmMRFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ZpA1yPNR; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ZpA1yPNR"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-912431d946cso7627336d6.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 07:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1790086878; x=1790691678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=umxwx0Of09KggoTYoIkuamgVjHAAANAIciEPCbA83fY=;
        b=ZpA1yPNRrthTZJgXuxUpH/UyDASp4wqHhzU5wJyEZj0ztEMEoT0cPk+wK1YqG0abOj
         quNK11WdnORP8OpyI2f0T1KBJRD/ciISxMOTxP7oL/6Uz88Q3MzV/hAbzgWO3ZDH/7KY
         mFdFQMI1jyTRHd8xSLVMKWZuVB7nI0xLWrBWki6EC/c2cEslfDpxySXzlX+cIcuAzPh4
         seT7Ukb19HcpY6Bayva/d5bJGnFQh8fVpNP07fIc1vt6wwkVBLAnr/W14kiAWYoaC19x
         2kPJBJSFT62HcscL4RrWJFbYx1CavNdu4P5qlvXmhuDRjeBaBeEbGi5QWMKA2ZcpDUsI
         Cg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790086878; x=1790691678;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=umxwx0Of09KggoTYoIkuamgVjHAAANAIciEPCbA83fY=;
        b=23yLdNDP9es9HTrYJHVjUh3KWiyUWWo2ZUeAOynUbcaqojczkq3zRa4rtSKH3jBKhA
         p33x4SAKa6JdJPJQT5mDV6ybJSDR3S9K4RmhtANURuaKq87/Kh3sxk5ipwtyr9nwvdAW
         HKbnZsC6rtfxa4OQH970jO6bNyWW6ywna9o7afTvO7jy6rgMR1DBObzUup2PwzwWZXmf
         uBDtO7mHqcVtDYatRHFwdHOj9/O7y6RvK92iAiC5pba+NXX1iBAiXyNKFolpaOHRxdMX
         XCnHjPszN43yfJmHWuASdiLipe9RBz6sBKBBIJFyCxCGuxUlVeGc+M5h4XyJvzKXO+E4
         nT5w==
X-Forwarded-Encrypted: i=1; AKwUvBzgSyB1q/rBkc3wHZAdbLaav1P2RtjN9tEkE+0v7z+zxtXohIGMg3jqPxFZE9nnOeTXTQhZebA5AHc=@vger.kernel.org
X-Gm-Message-State: AFuF++m/8falpVqxryPPS3FA/eEu/6HTtg0kD281rJAfgT6w9EW1vSQh
	aIvvIci32LGrXGtkkk9SuBX4gmXVtsd4jTqa6crUespAApVR3NTQmMEt2Y1dhwjYow==
X-Gm-Gg: AYBFou1t4m448SlyfiVSIL6KceVg5XP/idWadK1x9NXc32rjupMXYRLBpRQqNSf2xyw
	nDMckJKfbqTw2be091+Ui1uQ7CsMDA109+BmyFxBqtNcmZk7A4vzkluDmMkfvM5WbI1A1kJeOAW
	RGhSeA7Fb1yvRXRjHpOGMhGrJdKIbZhdZ5aX4TPGdXqKVPcBy8TYKhiWfmAUo1LpvgaqDymVL92
	/DFiXjWuFy2RBmf8FxQmBzocX1fG5H50RpqwLG7oCpdusAekdU/7mGcryXkNdqnwjcJCJR3m53H
	xhYUkenzE27mkSgfx0PMzH8TXpyfCJdT5deD9ut+GJ6QH/Ylx6NPOhoQmI3Oks/ihLBFtEqjUyG
	x8JgAhClU0UmvTnVMg8gO7JOw7Y6pvckTL2JhHbAvcOLPJNRGkzE+Cx9KnPQKbqvhOJwCEoAlro
	iA6eQ6VaM4U0a9rW0ZdsKTankSpSVU918AX4vkONVfjz/XBFV0ju5qYMGwmp/ejoB5/RnlxqagY
	jrs1HHQVi9Po6Tu
X-Received: by 2002:a05:6214:4008:b0:910:5bb4:8407 with SMTP id 6a1803df08f44-913fedba674mr47342836d6.0.1790086877749;
        Tue, 22 Sep 2026 07:21:17 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914024beff1sm16868596d6.25.2026.09.22.07.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:21:16 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:21:14 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: hub: Set proper message when
 usb_hub_create_port_device() fails
Message-ID: <abf721b5-c848-4b58-9c0c-a8298d03f803@rowland.harvard.edu>
References: <20260922080541.1986179-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922080541.1986179-1-wenst@chromium.org>

On Tue, Sep 22, 2026 at 04:05:41PM +0800, Chen-Yu Tsai wrote:
> Right now when usb_hub_create_port_device() fails, it prints a separate
> error message to say which port failed, but otherwise leaves 'message'
> set to the default "out of memory", which is somewhat misleading.
> 
> Allocate some memory to put the custom formatted error message in and
> use it as the error message. If the allocation fails, use a generic
> version of the error message. The allocation is explicitly freed after
> the error message is printed.
> 
> Variants of __free() were not used as it ends up mixing usage of __free()
> and goto. Also, kfree_const() won't work as it uses is_kernel_rodata(),
> which only returns true if the symbol or address is in the kernel image's
> .rodata section; it doesn't work for module .rodata. And the USB
> subsystem can be built as a module.
> 
> Assisted-by: LLM # local reviews
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Explicitly track and free the allocated custom error message instead
>   of using devm_kasprintf()
> - Link to v1:
>   https://lore.kernel.org/all/20260728100005.413868-1-wenst@chromium.org/
> 
> Sorry Andy, I ended up not using your __free(kfree_const) patch. My LLM
> was telling me that it won't work correctly if CONFIG_USB=m.
> ---
>  drivers/usb/core/hub.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 0e929a4c9fa1..398ae53cd8d7 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -1480,6 +1480,8 @@ static int hub_configure(struct usb_hub *hub,
>  	unsigned int pipe;
>  	int maxp, ret, i;
>  	char *message = "out of memory";
> +	/* Used to hold and clean up kasprintf()-ed failure message */

Comment is unnecessary.  People will see what the variable is used for 
by reading the code; it's not complicated.

> +	char *msg_alloc = NULL;
>  	unsigned unit_load;
>  	unsigned full_load;
>  	unsigned maxchild;
> @@ -1756,8 +1758,11 @@ static int hub_configure(struct usb_hub *hub,
>  	for (i = 0; i < maxchild; i++) {
>  		ret = usb_hub_create_port_device(hub, i + 1);
>  		if (ret < 0) {
> -			dev_err(hub->intfdev,
> -				"couldn't create port%d device.\n", i + 1);
> +			msg_alloc = kasprintf(GFP_KERNEL, "couldn't create port%d device", i + 1);

Why not use a fixed-size 64-byte buffer on the stack instead of 
allocating extra memory?

Alan Stern

> +			if (msg_alloc)
> +				message = msg_alloc;
> +			else
> +				message = "couldn't create port device";
>  			break;
>  		}
>  	}
> @@ -1792,6 +1797,7 @@ static int hub_configure(struct usb_hub *hub,
>  fail:
>  	dev_err(hub_dev, "config failed, %s (err %d)\n",
>  			message, ret);
> +	kfree(msg_alloc);
>  	/* hub_disconnect() frees urb and descriptor */
>  	return ret;
>  }
> -- 
> 2.55.0.1082.g2b9226bbc0-goog
> 
> 
