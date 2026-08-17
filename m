Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2883C3B05BC
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975301; cv=none; b=nPWW2PoiGgje4/4CkzlWZvS/6CTM+uc+Q6MnERZtdyTC9Mh4rRJ6woUiJ4Pl30xXsd8UuoB2S/ey6m8EmE3tAjkT0ENPYovdUcxhyusAplmPqNViN65GhiP3wZ84nQdxX7avh8UxMIUGc88dbPuGzyqveiaAAsEbteWpgrrIOYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975301; c=relaxed/simple;
	bh=Nz7WLagweYcsHnwgsirP2pm3D+368zL+4idFN9qy0Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VcYGxnczeJD7lFgEZ07+fiUGLHBDsV6OjQW28jRWhm9ZAME+V34JBOlRTAbYYAM9S5R5fyJUvHVJ/S6kEiSnVLk2J7AgT436wdQ/jmXaSIp3gBI5g0/Nd1D3b0Nfg+Ej2qWjioBKC5FHcDJ56fijRi2tAKr9mht71PQo6m729mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=eboCDWbJ; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="eboCDWbJ"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-936cda0e3fbso287251885a.3
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 07:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786975299; x=1787580099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r5iv3a0Q+hWK6jjkQP2327M84DXDyYow9v5uLkF6NPo=;
        b=eboCDWbJGE8+P7JEbZIijeX5HFG7qoCm1Cxo6HM4LpAj3PUkz3/VkNG1/zHol+KukV
         4Q5l+UOjSJhKxdqzMBbLbQjNvsqOyjhNoXPqvkHNgRQ7opj/WbvWmbj+tSc+qotATCUI
         pro2CXj58lySzKY2lhCjnn9RDWIvEShqw6KWRqVQ+tZzZmbGkI0Z+PH4G4Isz5VAb289
         9HwOutp5JwP8tr78n6sqB3AXlbHv8PK/Uf0G6VVMiOIqrlu0qTv54nmxqQj1SyAzy1bF
         NUotSJCnteyGHQ4N78GT6rCI9jRos3c7yYozfZZis4H3UBUf1Gl1XR4rTSUrDJf+4/+M
         M30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786975299; x=1787580099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5iv3a0Q+hWK6jjkQP2327M84DXDyYow9v5uLkF6NPo=;
        b=ifef5/GUUn7dl8hFT/O/l5Jry482Hv3w0XFoHAKTSsHxBdLQzWGEIWZP3rQ1UX6x6i
         5BK2OGUZ3+G4SRS0YrywELRbRZyWri8Yziuu0+aLvmblcRdSxLcIOa+nex01aHuSLH/v
         2wzgTRasPmpb9U7KNxy3ByEYBXEsasEja+AgmX6ZkzPDz6PD5NP1z94RmhPBIJUG+3+4
         5V6aVDKtx9QnbEIM8cEjr++Q7Ay2ILrV3dscMHhOEJMBq1NaJpF8+xd5iCyXMFpDTYwf
         mdehRGpQs98W3Y+m2eCEHUDlj4iz1DoFaragJBY6BAxvQlqlqeX+9zz2ZmFymAZKzIUV
         YEZg==
X-Forwarded-Encrypted: i=1; AHgh+RruLEyTZvMYsMw/UBHZkKcfNtc3oAwWqvJTcH6qQiNT0sOd1jovPosywSQsHilCVKMg4enAs+dQpME=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw75d4at0Z1/efIFmKMKfFiHcU1tTzxEaIyTTDpAYLWHnTZmD/8
	NV9iNj1E/aIlwK3XR1bfxGml3mlxOJBKBB94ofJigS4bjtXlan2P4BGgTBCWS53GTQ==
X-Gm-Gg: AR+sD10NFGv2I49+WIN+guRVNUfi3qW91NMdDjOvXVTcZ62xN+gLOSjXvFz4NerEn3b
	CxcMxl6aDsvmWYN+BDkh4cF+Bb420XRYMnxgNKf5PI9fNr9rtLbU1e3VFI416RY8upA6SKZE/3N
	pD0Wll366Mj0StWdUEhCbxwttwmxlH0JKYSG9NDU6eCNmacf7tE2UOUPXVVWuB+PhuOUWvPnGt5
	BrwDUfoTKhtuf3BLU8BOZy/kxwUklsVTJQXBwDvxexwzfeds+01dOwbFrM9Ld/0XVND/iMk/GvS
	d123+CnSOz+PTuiOMW08hencqOfilIJGKdoaKRK2CqURBV5faOqQOAvyg4fKIIqep4ZCjsv00Ql
	wlCY3u+ssn8BLpbjKwnNCfn0ap+WpG5d3gDahRlciUVpdNO2dP3llCBsHPb/UsTPfbYHWzWts5S
	Nm9cxm+a42J5/0h8FhnKFNk0nV8JbiuY6gpNWiiatSQ8oQPkJI999kS/a3CnyCACeI/39vXJl4+
	YNGOLk=
X-Received: by 2002:a05:620a:4506:b0:936:eeab:307e with SMTP id af79cd13be357-936eeab311bmr1271697885a.9.1786975299020;
        Mon, 17 Aug 2026 07:01:39 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937033fb9d9sm52544485a.38.2026.08.17.07.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 07:01:38 -0700 (PDT)
Date: Mon, 17 Aug 2026 10:01:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jeffin Philip <jeffinphilip14@gmail.com>
Cc: gregkh@linuxfoundation.org, felipe.balbi@linux.intel.com,
	christophe.jaillet@wanadoo.fr, kees@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+791be35f1fbcc85d06d7@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_mass_storage: fix null pointer
 dereference in fsg_common_set_num_buffers()
Message-ID: <e52c5913-9210-47cd-9a97-ab00547f53c4@rowland.harvard.edu>
References: <20260817110839.8201-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817110839.8201-1-jeffinphilip14@gmail.com>

On Mon, Aug 17, 2026 at 04:38:39PM +0530, Jeffin Philip wrote:
> In fsg_common_set_num_buffers(), n can be 0 as conversion to u8
> using kstrtou8() in fsg_opts_num_buffers_store() can return
> values from _0_ to 255. When passing 0 as "n" value to kzalloc_objs,
> it can return a ZERO_SIZE_PTR, which passes the null check for
> buffhds. This leads to a null pointer dereference later in bh->next
> in the do while loop. Fix this by adding a check for n = 0 case and
> returning -EINVAL if n is 0.
> 
> Reported-by: syzbot+791be35f1fbcc85d06d7@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=791be35f1fbcc85d06d7
> Fixes: fe5a6c48fd95 ("usb: gadget: storage: get rid of fsg_num_buffers_validate()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>

In fe5a6c48fd95 ("usb: gadget: storage: get rid of 
fsg_num_buffers_validate()"), the code that was changed originally 
required the number to lie between 2 and 32.  Even 1 was not acceptable.

Alan Stern

> ---
>  drivers/usb/gadget/function/f_mass_storage.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index a50743caf083..640d3bcb7bf0 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -2747,6 +2747,9 @@ int fsg_common_set_num_buffers(struct fsg_common *common, unsigned int n)
>  	struct fsg_buffhd *bh, *buffhds;
>  	int i;
>  
> +	if (!n)
> +		return -EINVAL;
> +
>  	buffhds = kzalloc_objs(*buffhds, n);
>  	if (!buffhds)
>  		return -ENOMEM;
> -- 
> 2.55.0
> 
> 
