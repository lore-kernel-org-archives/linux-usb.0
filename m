Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3DF31E840
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 18:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787681815; cv=none; b=Mv9gw04OZSUyPJTPBGCYq821egGqMpDCOvHIIZiU/55Bneza+0t/I0RU9xG8O6KrTTByPJKDReAs/BFv86deDkM4g2FChVfxw8exDgKL4u7sdVTu+gG9QRbFuFoye+ZmuyI28Hl4lBn7PcygVRqs9FbDWZm7Kwja5cOFzB1gDb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787681815; c=relaxed/simple;
	bh=prJxKKLTb4OJxv6UKEnT0NjRxLM+dLDHfdbUjkT4Y4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXmL1lNiyl+ydhsPEC06Y2Z1bCuzCFneIlq4+qWZ2MLGUBhYdtgD41IzweL7xgvsAUAxkKNr9KksMQrvR8DovKvveY5vvOmhH28eRl4oG0W2rYltrpOoy3ksj4FXkmjLhQpPT05+bfB9LUaPoojofSyA6rAwNqYWzomDjEM+Pl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=aZtQRSsg; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="aZtQRSsg"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-90cabe38a61so1479286d6.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 11:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787681813; x=1788286613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sFZRjz2wLY/AkBicQAOs86n2bj66y9AJ0vIklW2hwqM=;
        b=aZtQRSsgY0iINVMiZdpCmnWDAjfSibsDNh3y90FuOdIPxCk0weOdUZkEHIyIaYA+Nz
         lgRYi/J56VHlCxGeSJ/f4c/pHFp7RUJV30L4HN73ZOAc9tqrDd/0dS9cFtwYurXWMCSS
         /wXA2jSBdGJPkOjZZTHBFkvJntvXpHg/1g45ZB3wApRjrONV6r462tzRRlKJreXS6Tje
         IF2MqDtNZKX9eY0oVmjTGxGSBk1rTqvt+kNvAFS9NpR5Pa3hZ8RMYBWKR5jDbbw5mSi9
         /qU6ImPARGqLscyMP8JzPR3n5tZOcQWQub0H+OSx4eNhYRcrIP+1POlkvEMn4jceTiMx
         +lnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787681813; x=1788286613;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sFZRjz2wLY/AkBicQAOs86n2bj66y9AJ0vIklW2hwqM=;
        b=g63TsHiaGVrjMDHQkwkYy/Mase5NCZDasJr46oByzPcs3+HWvGFXdIHYvapHh64j/j
         mRmNBJGYnDlAqHkGQ/6TKBr14KnQLmEHD3kVqAfIGJIyE46aC+5mIngCiboaJc8iXt+f
         WbbQuJUnAYgvvr2lzXoZBNbBEs/ZLbsDIKfik2OwqjRK+i91++dv9IuxCuyvUF/WrrSs
         MHinJt3k5mRkrjW4ta5hKBODj9QR5Ea2tgggtE7sPylVP1dBE1JAIBrp2EFnXRvIyzlZ
         2MOs2L4JOFjhdG34y9oaJ9ZwzplqZUT1AxD7YbvnES+I85FcV1NtRZf1CZCBIh7fEBeK
         Zq/g==
X-Forwarded-Encrypted: i=1; AHgh+Rrr31Rj3KarDrsUCyurAnsbOJ7KC0Mo56LZTxlRIST+S0DcEM0ZgZNpR2i1XlKrz7AX+LgCIjnH/Dc=@vger.kernel.org
X-Gm-Message-State: AFuF++kAvM5do7bEFceYfKSFBizzNfnfFUWZ8PW9SRgUfBmezH/+BnYg
	6tKNquPrS4UcfgZZEvV/pYS+ixOzgSueIdCylFSbitkfvd24uD27mrcGdRyUyySzPQ==
X-Gm-Gg: AR+sD12xFmZXqzkbv0wkt/+Te5zj/8QMp2CbJhP2IRHKRoEbJMYeUsJRbnmBII2jyCy
	9DsYJyxeeLMxiBwidAU5mwatrZXkytv30IUg4DGcfXMoDdvf2RkHxRd7Pfl23aFdWhjMpt9Ufbw
	B7duLNEDhZV21722kGmMhtHeODebBt+SgTe7HB7ye6d+r/95Wpq3FMeSQ+NkWRNfblTuFslHnOR
	pvISUXLx9DE7ge8uhHyq7u1CChHxsq8GeEj1FIgLl/DZbPHDhR+phARUwY61su9y3BmIp2UbhVZ
	FnGPlAvM56cg+fP3SoLBSET7Cblb/FvYjACFNRtITixb8xspEhIoJq6WvWKBrgyATe1Y4EXVX7r
	9NKCWv9iiNBpQ4D/JzfU3zI7xDNPu9/wXXhJ/d4AyqLjUWu9uFbuq1oxR6U7mabk8oIxKOTuVQI
	CMODYU/g5qjQv1dVYGH1SWt2IUHB0MI76T662aAbvaAAfUA1locZMUIT/uKLWhGQ==
X-Received: by 2002:a05:620a:2981:b0:923:8612:f15 with SMTP id af79cd13be357-9378016ef19mr43282685a.18.1787681813128;
        Tue, 25 Aug 2026 11:16:53 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e6c2eefsm31617285a.46.2026.08.25.11.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:16:52 -0700 (PDT)
Date: Tue, 25 Aug 2026 14:16:49 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: jjy600901@snu.ac.kr, brauner@kernel.org, eulgyukim@snu.ac.kr,
	gregkh@linuxfoundation.org, jack@suse.cz, kees@kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	mjguzik@gmail.com, viro@zeniv.linux.org.uk, stable@vger.kernel.org
Subject: Re: [PATCH v2] USB: gadget: fix NULL pointer dereference in
 gadget_dev_ioctl()
Message-ID: <f25ef64e-0197-4d23-ab2d-9568bfd3711e@rowland.harvard.edu>
References: <20260825171343.459630-1-lovekeshsolanki00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825171343.459630-1-lovekeshsolanki00@gmail.com>

On Tue, Aug 25, 2026 at 10:43:43PM +0530, Lovekesh Solanki wrote:
> gadget_dev_ioctl() reads dev->gadget before acquiring dev->lock, but
> dev->state is checked after acquiring the lock. Therefore a concurrent
> bind can change the device state between these operations, which can
> leave ioctl with a stale NULL gadget pointer and causing a NULL pointer 
> dereference at gadget->ops->ioctl.
> 
> Read dev->gadget while holding dev->lock so that the gadget pointer
> and device state are sampled consistently.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Eulgyu Kim <eulgyukim@snu.ac.kr>
> Link: https://lore.kernel.org/all/20260824113510.1141236-1-jjy600901@snu.ac.kr/
> Reported-by: Jaeyoung Chung <jjy600901@snu.ac.kr>
> Link: https://lore.kernel.org/all/20260824113510.1141236-1-jjy600901@snu.ac.kr/
> Signed-off-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
> ---
> Changes in v2:
> - Fix Link tag pointing to wrong bug report.
> - Remove the unnecessary NULL check.
> - Reword commit message as per Alan's review.

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/legacy/inode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index d87a8ab51510..12819e8c265d 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -1251,10 +1251,11 @@ ep0_poll (struct file *fd, poll_table *wait)
>  static long gadget_dev_ioctl (struct file *fd, unsigned code, unsigned long value)
>  {
>  	struct dev_data		*dev = fd->private_data;
> -	struct usb_gadget	*gadget = dev->gadget;
> +	struct usb_gadget	*gadget;
>  	long ret = -ENOTTY;
>  
>  	spin_lock_irq(&dev->lock);
> +	gadget = dev->gadget;
>  	if (dev->state == STATE_DEV_OPENED ||
>  			dev->state == STATE_DEV_UNBOUND) {
>  		/* Not bound to a UDC */
> -- 
> 2.55.0
