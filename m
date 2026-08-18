Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7EE46C82A
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 15:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068789; cv=none; b=dJ0JQcu/zzOA41AjqBDOsJ/OJPZajBPie5ZpY1f5q2LkQ0kXQm7nAXlnRxyYd3APojq6MZKxRXlCUle6pCvQt0SGwKJ1ImKmoYi0StxCAvXlmKrl/vAXluddNksS9SuIIuVUsigErSttJA3copctqHPM0ADfjXDAB1+jAzfg0i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068789; c=relaxed/simple;
	bh=lVXDNJkWGF2Ydi7So6FnKajkXb6/q5NeGUQY8BOmulY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTl1NALq+R8OwN+u/OLp/xJ8xBFu3plEEaMzaB+orIjetzKcQ5KOOeOnoHWh0y1jgSgqCglgOcPGRUT34e9TS3jDiYwYoRsuUNzpbADwN6jsScciiEuoFhR9Bkv2BK7r2nmrSHGTIm7qPKLmmai8ZWmBvRfMCYUVlu20DI3Zsks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=bumqRksM; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="bumqRksM"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e85499ffbso4745685a.0
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 08:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787068787; x=1787673587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uxYxH/7HzEDjlFU2mzmA8K0o8o4GrlI50HpnOIkwdkk=;
        b=bumqRksMRRO1OkmIQMDiNkaQthHmPwQoCMkvvhZnNoh2pLyLWfMoU7WYMGAgM7AqVa
         F8Ek9vEe/rYDghypjMTCTMPw5mxmIK3NMScUmPSVaLdPHUixpmf97VaFGB+dn+eJgd0u
         LTiM1o4Tcgx05OVDWcYwzxmzmYvHzrLpFh63S6UnwFIt+NpUqoshnNxebVDRBpHBINaX
         E7Ub/Kn/Xo/8wXhCHpyP7eAqlGjmVzLaQPXQNLTG5MfqFJsQENzNviussB+Y3Thq8s3U
         1jiv+Zl6A1RHKZmYm/1PUuboLq8mCmYZSaLD1lGSaW4hbYg/1OeOvAzSQBz2hyLwiug1
         WRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787068787; x=1787673587;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxYxH/7HzEDjlFU2mzmA8K0o8o4GrlI50HpnOIkwdkk=;
        b=nRVK3iz92dRIQMhMn3I2gxXNrPznKbtAeh9XD04m62oRArjqR+xzWpwdo+1gPRltq0
         GZYSMb2gqUzsmROZIFy3ApZ9U6RtDbNsf2tM3iOtkP+xqgiZEXlkNCgW//s+DJBlXkqQ
         mO3dkHsmJnLxFx5UwudDhmexSgUkbh9ViUaNB4lKWNWW6veaEedVGuBNu/20bQZxqw+y
         ArYRqu1nDTP/8GUpgkn4AsynaDBF82UR47hYdijODlQNuHCtDxVA60fMToG+CHNCwDLy
         rg7/HyamiC7c1nQ+XXq9N1X3TnRGiSlCj6jPqpBD/iozwHBKeYFM+hREL30qW38jZP3j
         aLwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZfBTdeVlPZAffmVfyXWgGdJwixNtlZsqf3LDOZi2qV62bT/dzUaHq6qoZGWJy6nUWy4sNfR7iuho=@vger.kernel.org
X-Gm-Message-State: AOJu0YysQAc3v+ckT1dv4704P2sPa69WsCUrBVouulpLDxD+VlSdEYdP
	xwFEDheR8Yy8vkuUM8WNNlqf+m7YNQLSjPvcgwZS2kVSdn2SAahV0DuLb7lgiC/5nQ==
X-Gm-Gg: AR+sD12kLE1JVm4WfZEF2TQ570hSaGJCWHnFwB304wA8lSuOUb8h7z6hBuamGHElTjD
	ZBH1QgOl3ppxsIBMbqPPt3sAbHd5IqUmCMHdHXP8frOF9GWySQCGFdfOfGqOWFSGRJFVkiR/bYA
	8ZoLKLwKkm1sxokRlaEYNclsYarnZMKy57grFTa4tzUSgQiOj2uFxLYrbanmGbLMvTJYPIfF6SJ
	aQkSVa58bZ+3cuYEuRsPreZacwPijnEvOj9zEbnW2eedHnfK/x/veU6zjARDPiw0Ig3WNdTpmJ2
	GR815XVtlzY6VaPc0bD5/WMRcedFkQ/kPYAF70KDi4AxAuTmWPtUXAJaEeipKmp+dOXGTYU5q2g
	ylv7CyBNCD3+aXjTs95BRUHDagCRAszpyJn0RrhHYcuJPt3G0jHjeKlEkbdqGbBPBrGZAKuDDOw
	5Gvq62SJwgucOpa+fXXirQekPM+63cNQHTh+9p58O+MKmTpQ4D+UfH6/agweWZ+Q==
X-Received: by 2002:a05:620a:3f9c:b0:930:771e:e8d0 with SMTP id af79cd13be357-936d22cf265mr2826435485a.25.1787068786893;
        Tue, 18 Aug 2026 08:59:46 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937010240absm364999385a.0.2026.08.18.08.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:59:46 -0700 (PDT)
Date: Tue, 18 Aug 2026 11:59:44 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jeffin Philip <jeffinphilip14@gmail.com>
Cc: gregkh@linuxfoundation.org, christophe.jaillet@wanadoo.fr,
	festevam@gmail.com, eeodqql09@gmail.com, kees@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+791be35f1fbcc85d06d7@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_mass_storage: fix null pointer
 dereference in fsg_common_set_num_buffers()
Message-ID: <536a46fc-beaf-470e-959d-0ca5062ce541@rowland.harvard.edu>
References: <20260818035904.10324-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818035904.10324-1-jeffinphilip14@gmail.com>

On Tue, Aug 18, 2026 at 09:29:04AM +0530, Jeffin Philip wrote:
> Previously fsg_num_buffers_validate() was removed as it was not
> necessary due to Kconfig setting the limits for n from 2 to 256 with
> default as 2. However, setting the page content in such a way that
> kstrtou8() reflects n value as either 0 or 1 bypasses these
> restrictions leading to a null pointer dereference if n is 0. Fix
> this by adding a check for n < 2 and returning -EINVAL if n is
> either 0 or 1 consistent with Kconfig logic.
> 
> Reported-by: syzbot+791be35f1fbcc85d06d7@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=791be35f1fbcc85d06d7
> Fixes: fe5a6c48fd95 ("usb: gadget: storage: get rid of fsg_num_buffers_validate()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> ---
> Changes in v2:
>  - Change check from n = 0 to n < 2 consistent with Kconfig logic
> ---
>  drivers/usb/gadget/function/f_mass_storage.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index a50743caf083..4e743be220cc 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -2747,6 +2747,9 @@ int fsg_common_set_num_buffers(struct fsg_common *common, unsigned int n)
>  	struct fsg_buffhd *bh, *buffhds;
>  	int i;
>  
> +	if (n < 2)
> +		return -EINVAL;
> +
>  	buffhds = kzalloc_objs(*buffhds, n);
>  	if (!buffhds)
>  		return -ENOMEM;
> -- 
> 2.55.0
> 
> 
