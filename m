Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0D63EDAB3
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 15:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784130109; cv=none; b=rDuOzSRvWoyC0zVLtgkUS+gf1+29jdf3l9ZaQDSClLL8F7OM1BmE7LVTmgLau5U6K1gb7wRH2UeVDBOPqqaeSbfPCi3n9ovgFOqfrpUOqABD+OxNPgSBGL2zCV3WWdls73vw1y2UGO6wyz1tykWVO6uPD6qnOX7dZvCjwR6acYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784130109; c=relaxed/simple;
	bh=MdQiR5w4xWKt3PpeCrYH1wOyWEg3DhyqW1Vy6go/XNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFQxbiTf1mjsYtWAemHSJkyq4bkXNfZ4Pjxw9lOtYdGn+L728XJg99Dw1rR0IFHh0LBd/aX2fSzllTRBJm7mk630bu3huKPJ1FHEiFy0tmfmE89CH7u9AvT243i7OGg9GO35zZKbhDFPP0ioOqbQjJtPZMhgN8Et2DdovU53FS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Bas3BbmV; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Bas3BbmV"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-920f33347f5so398468085a.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 08:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784130107; x=1784734907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gKl3jS5Brn2LvnqqnNA3s0OjxElmSm5IXGc03qYOH9k=;
        b=Bas3BbmVbZSJe7ut/+WGkYDdiGn9AUpnfxg0VX2peg05OMAEf346kQo/4ba805Zmri
         zkyatiZ1b4XpkQILTO/KWzfgfC/TLGjIaeGis4AkoUMoaXmugGGewceX2Cw0usl29mjy
         T/FYYfNabIzbS2gcqItdjoUdo1YCSg6MtHvpLJjP5gV3F0l1RWTOE5SabHLXwFpTnCwd
         Xz4Px5Ik2U+S4XntM8feDYk5/abAW1QWvAH/WDOS51P6WwOKkzH9/seudSGuHBNjiHtE
         WK6XOC+ZY9OwhecjQh0qx9obweM1J+MOvIGEPFmlhrrwgRP05YtTvIQ1V+Ohcgf2AQNv
         epvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784130107; x=1784734907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKl3jS5Brn2LvnqqnNA3s0OjxElmSm5IXGc03qYOH9k=;
        b=omfRY6hSrvg2msGiM+yrapJxlMuRGeoZlLxIrpu+uGwqAnIX3sYLJV2SDg1RI5vJHc
         eA/pKBUaUtEds6FAqj/J4U7wJJFMM5HKgCooTPxQA7Ak38idbyylVRBXzPJKQzPRP29a
         y13X+eebiWacIKhdFac9AUXoxsW1F4WPSkYw15eAhBcDC5z7WML3SlVSMSC4a8DdYgRZ
         v3AoaTcpAqomMOrDaVNk3YCCwvYZNTzk0mNoAnos+tvjHdiqMMpFLQ3fvkEjDZkr5xYc
         BQosqUCJwAYcwMsY3yR/IiEcIbjDKla1lbxzoXx+73OoIPnq4HZUfyXr9L24l2XOwNDC
         8yWg==
X-Forwarded-Encrypted: i=1; AHgh+RqvxymVYWnb5hDPfWINLpg6L1Pmu79SWJb0JHFcUPB82Ir8k3t9mNd2c9ZGt31TTMrGxQQTacId/LY=@vger.kernel.org
X-Gm-Message-State: AOJu0YystB31RxNt42z2e458NLPRfwCA6vQX5uCBIXmO9RKt/Y6WSF9+
	L+rASyrogZCSkJiyVpVD0LDPgIZIMwXZYE1gwk5wflsILX38cKdnrjWroI85PPA6MCmISJYGTWI
	PgIexUA==
X-Gm-Gg: AfdE7ckL6iFuPowvKi0dfUkNOyfG+yTzXBEte9CTP0rFzKkX3nkZ50IPIS58Q8oxgtq
	MwuRjqx53QSX3xMms4xoALhvIC8qHG1dLtPa1O2THqGfZgFOib/mIdfBB5cdeDe5/xz/mj1Xs0k
	Ukc8Rr+P+ySbpKOAFqNyl+q5CfiuEozuS3E3JIplW+lFsn7WV1UHehVFPT9I+B1Qhh0rSMARFwK
	m1mL76B4887hcDZbSmiYpmkbZu0jicK6UJkGqAmGgdcudp8JVettnfvgYXHw3B916QaU9z4kody
	cyNgFHvnovAjxYJMJcPy/U3DQfQzk1ioNyr8bBgNxB2SJXQz2q2j0XJRen+nVus2XvyuR4T5ZxJ
	aq4sJ4OcVYPIP1Sm9rIz+Is0Y0zhPc/UdzFIMjoYVHVoEpeE4SMWgzLkQsBHOgMniJdltBkwmbZ
	duW3m0twxPXFFDWoE6ZkmYGmQiRyodod3ZfT2qIonMXdyn9RQC4lxPOxfP
X-Received: by 2002:a05:620a:84c1:b0:92e:fd2c:6a1b with SMTP id af79cd13be357-9309628012dmr305254385a.50.1784130106791;
        Wed, 15 Jul 2026 08:41:46 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d6dac4sm1781083285a.47.2026.07.15.08.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:41:46 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:41:43 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: sysfs: add lock to bos_descriptors_read()
Message-ID: <a75a58d6-0909-4f13-b55e-4e1411d3b5d2@rowland.harvard.edu>
References: <20260715-usb_core_patches_3-v1-1-53021f5576fd@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-usb_core_patches_3-v1-1-53021f5576fd@kroah.com>

On Wed, Jul 15, 2026 at 04:59:05PM +0200, Griffin Kroah-Hartman wrote:
> Add a lock to the function bos_descriptors_read().
> 
> This function accesses udev->bos, which could be simultaneously freed in
> usb_reset_and_verify_device(), a function that is commonly called in
> drivers all over the kernel.
> 
> Assisted-by: gkh_clanker_t1000
> Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/sysfs.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
> index a07866f1060c..d22dc78457d7 100644
> --- a/drivers/usb/core/sysfs.c
> +++ b/drivers/usb/core/sysfs.c
> @@ -899,10 +899,15 @@ bos_descriptors_read(struct file *filp, struct kobject *kobj,
>  {
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct usb_device *udev = to_usb_device(dev);
> -	struct usb_host_bos *bos = udev->bos;
> +	struct usb_host_bos *bos;
>  	struct usb_bos_descriptor *desc;
>  	size_t desclen, n = 0;
> +	int rc;
>  
> +	rc = usb_lock_device_interruptible(udev);
> +	if (rc < 0)
> +		return -EINTR;
> +	bos = udev->bos;
>  	if (bos) {
>  		desc = bos->desc;
>  		desclen = le16_to_cpu(desc->wTotalLength);
> @@ -911,6 +916,7 @@ bos_descriptors_read(struct file *filp, struct kobject *kobj,
>  			memcpy(buf, (void *) desc + off, n);
>  		}
>  	}
> +	usb_unlock_device(udev);
>  	return n;
>  }
>  static const BIN_ATTR_RO(bos_descriptors, 65535); /* max-size BOS */
> 
> ---
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> change-id: 20260715-usb_core_patches_3-a4ce9f00d92b
> 
> Best regards,
> --  
> Griffin Kroah-Hartman <griffin@kroah.com>
> 
> 
