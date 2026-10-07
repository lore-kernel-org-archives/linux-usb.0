Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7BE448B89
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 17:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791395713; cv=none; b=BZcUfMy56Gdh/FKVglIBu6W3XZe6L6XrCq8mIJDMcaTc6dctkHcfU/a+AgUmreTq6yAoIUkjNpSlUaEnsV2KL2EzKhLxVhCxyGpymKHAJpMIO5v5QsWkcD36mZP1Tkq4ifOQFRFGM1F/JY6L+8Kj7YFscJz0M1roWgEU2WOqHkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791395713; c=relaxed/simple;
	bh=ke688EiZv7Hz5A3yoyZYE6WoFX7dc/lqhTa8W6a13dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C29NFB7CQiOMzcj83yIvqIBQD+J2/WwzV8ykZpfKY4r84RopYLenmWOLSlhz4GoCFXQLetiRmewSpq+mdBjo6lenVQN6DUx7vEyZL221npwKrYF8Fo3YJqC7agK8fHQhWuasUrKuXCG2W366LYeLWTvj24dXMJML1fHhOs7UthI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=en7MgX5J; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="en7MgX5J"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e76469b93so232094385a.0
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2026 10:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791395711; x=1792000511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UngZ8k3YNt3VJyCBdJrwK5aCUhaIZau8MCEL0x/UbHY=;
        b=en7MgX5JdzfWnY4lbrbnRDKoNvkk5EScS8Zlw89NuHjP4ePEayP9LogDgY4VrsGUVp
         q5LLdyePhpgKRo62Qwgz9iDEdrDsjJnIU9NGOkBevsamWzf3r31r7fRaa866ta+eMGX2
         QUJLhTYGpzEqUkW535/KGBjclJJf698ZCRCmUKRf+ZiSriRRtP+EuPzePhvbTf+8+oaK
         RZkHCdH6qoRI3lM8wUezHP6wIQHK0VolROAKgTEqmNvDDEaPSdLmpYiK40ec13rXECJh
         lFRbkk/ILKsYxsCKOa4JIiMVRggUc7C7LJyZV7DXf+N3ebqkhh1d1UGmLHqliG3hTahM
         4+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791395711; x=1792000511;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UngZ8k3YNt3VJyCBdJrwK5aCUhaIZau8MCEL0x/UbHY=;
        b=BjC5dVaVUOaADQdLhAJw1uXbyZLap2QQsy7Pd6jUydS820+fA5JGZkKBjUZFF0qSaw
         lyA2bT7uslTk4Wezj+xevScieK5gJjcMfeP72zBNhpahWuOnmJDr/Qy8Lp1RxzC7eYqL
         5RUp6P1AxJ4dQeC5g58GNPlazzwuTh5ibd+YLsrIZh1BGDTrKhY9sM37Ud0f++Sd2nfs
         47ycHG1OT58pzSb0i/hHu9RpvZjavQgbR4KurpeYKwT6nyWM0pb3C1ycLDMNNcPkd7k7
         Ydu7IYCg0q4Qe65+mLFoODwrgPMce0931vorVyboWerB8XAtFL+EbtHoeuUc0Yejs6ZA
         o1vw==
X-Gm-Message-State: AFuF++m8YBsOS9jeIrTmsnJowdubJB9Kos2yYu4GEa2RjvGs/J3YqEJY
	w3AWGgID4Nw77shLNzs7xvLQOB9BTA19oO1kkz6g/zQthPFx78Q3rTdBXcRrmNQyCg==
X-Gm-Gg: AYBFou1hrb3f34ZbN9L8Ou1DkWH2oHWdz+zAXDZxf5dfM12q1VxlNHabAVkoRU4zELM
	c5QaAVc2hR5YqGCGgdPqBYDldBc5CmNIs2MfhHPzPEyVbWPYW3qLDopj2ipVXszT5FSDHZIWXEw
	muhCGK0aWWpDHxm1bi2pwxEJQGD5zDr3SNzEWrmQgC432AJmkLtEWatBc5atZimwvHD1Soxb8ir
	cMUs8TaIqc4BsdGJaIftzYw4B0m9owGdS59DSPsuihj1TiwLbtcgX6lM/XhjWXw/CtiG2QyPwtd
	9xjAH+fxSLYJkK77+v1bJ/Yq9wA0Vd3eaKOzo8wZBBt+jetsj3SHr5jBGAejAcjspZ5dkwZMbk4
	zG/RpxK4JTTJt/6VN2oeFT0SXdyb7tVUyDMC9ywUBYlURJNXKpIYxrplP9Syvl8xskjrWDU0dnh
	V7sI673IlO9CkqReBikDxcszJQyrcWbieYto3jKdNTVKFc8zGi6TlNHwDvvd7J3+W7pD5HTWVY+
	xCaR6aSAUnyR2UPQXH7kLnalUYTD9ktrYWj3Hi4bg==
X-Received: by 2002:a05:620a:4081:b0:93c:66da:ee08 with SMTP id af79cd13be357-93e9b76c7bamr579983785a.14.1791395710620;
        Wed, 07 Oct 2026 10:55:10 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e99160036sm274186885a.25.2026.10.07.10.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:55:09 -0700 (PDT)
Date: Wed, 7 Oct 2026 13:55:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Giuseppe Piscitelli <ooonea@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: [RFC PATCH] USB: core: emit a device-level modalias
Message-ID: <afcecb34-0024-460f-bc21-a7f2b1754d23@rowland.harvard.edu>
References: <20261007161721.60593-1-ooonea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007161721.60593-1-ooonea@gmail.com>

On Wed, Oct 07, 2026 at 06:17:21PM +0200, Giuseppe Piscitelli wrote:
> USB device drivers can load from interface modaliases after a userspace
> client has already configured the device. Loading apple-mfi-fastcharge
> then reprobes the generic binding and interrupts usbmuxd transfers.

This description is very confusing for anyone who doesn't already know 
what you're talking about.  Are you referring to some particular type of 
device?  If not, why mention apple-mfi-fastcharge and usbmuxd?  If yes, 
you should say what type of device and why apple-mfi-fastcharge and 
usbmuxd would get loaded in the first place.

> Emit a modalias on the device event, with unknown interface fields left
> as wildcards.

Why?  What does this accomplish?  How does it prevent 
apple-mfi-fastcharge from interrupting usbmuxd transfers?

>  The existing udev module loader can load matching modules
> before consumers receive the processed device event.

Why do you say "_existing_ udev module loader"?  Are you trying to 
reassure people who might think there was a _nonexistent_ udev module 
loader?

What processed device event?  Is this the uevent added by the patch or 
is it something else?  In what way does it get "processed"?

Sure, the udev module loader _can_ load matching modules before 
consumers receive the processed device event.  But udev might run slowly 
and not get around to loading matching modules until later.  What will 
happen then?

Alan Stern

>  Keep interface
> modaliases and the driver teardown paths unchanged.
> 
> Signed-off-by: Giuseppe Piscitelli <ooonea@gmail.com>
> Assisted-by: OpenAI Codex
> ---
> Tested on x86_64 with Linux 7.2.9 and an iPhone (05ac:12a8). With no
> Apple module preload, the first insertion after boot loads the module,
> keeps configuration 4 and works with iLoader without restarting usbmuxd.
> The current usb_uevent function also passes 18 source-extracted cases.
> 
>  drivers/usb/core/driver.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 3c3bbaf89..29d1acba9 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -954,6 +954,17 @@ static int usb_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  			   usb_dev->descriptor.bDeviceProtocol))
>  		return -ENOMEM;
>  
> +	if (is_usb_device(dev) &&
> +	    add_uevent_var(env,
> +			   "MODALIAS=usb:v%04Xp%04Xd%04Xdc%02Xdsc%02Xdp%02Xic*isc*ip*in*",
> +			   le16_to_cpu(usb_dev->descriptor.idVendor),
> +			   le16_to_cpu(usb_dev->descriptor.idProduct),
> +			   le16_to_cpu(usb_dev->descriptor.bcdDevice),
> +			   usb_dev->descriptor.bDeviceClass,
> +			   usb_dev->descriptor.bDeviceSubClass,
> +			   usb_dev->descriptor.bDeviceProtocol))
> +		return -ENOMEM;
> +
>  	return 0;
>  }
>  
> 
> base-commit: 42bcac323cc3b16566fed8c5b250318ad02a0de0
> 
