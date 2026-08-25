Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500EA3E16A9
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 11:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656044; cv=none; b=HcVkEBQnMChp09h2K6Iz5XWK0e7QyUm5s7XDVJ5fuiIn0otSog4lHE39m4eETl5r5rQ0ZeaVx7NmZ9wsTz4K8wEtQwfqBMYpzylmWGlQ3NlJs9kKFFMxmZoT8sjeMu0b61CV96PCF/uCPr6+BeCy6c0NDHNE2IgWThNA+8SpFbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656044; c=relaxed/simple;
	bh=FbsJrNLWRnA5FZelNcQumZAVr9SQGildHFWErfp7iE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpgLk8Zt2N4/rtAf5Owkuh4LzadkGXHSo3J1xe62xCeYqy05Y3BJL+2DNuSXVYU+3mjNgpoHRI7oybvDio6kWlHnNniCwsjPTbYQqH+cOlnEgCVGTrEIhh0w9m2stcJXi2L16URd5uCj7lmg+pvOe1/YWCA8/I6bj+1TX3iyIOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uq6ZO6My; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uq6ZO6My"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so4160319a91.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 04:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787656043; x=1788260843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ygSmQPvZ/Nd116NGGtGNonu+zeK52756mGmLYMo4WT0=;
        b=Uq6ZO6My62FnBKE7nPkf5mwsA9naTz0tJPh9eaoazG5ZLko1o/HI/H6LzTDaHWpY0M
         heou2eemSfYbu5qUMgCWZsrXBZg5eUjkhnC6bVCg3H8TfDNcPX6gN8a0PgvkKIBpweWx
         0pShRP8GfFtFF9kPhowYheCgRJ1/DNR6T1pFvkURafpAeiQgIaa5VuuO7mAduZLbSxRY
         7HmMbTK84EB4z+w1xOGmAlyRrehCVqqMJyue0d/CljLGVNNJ+SrQe7Bg4TVIUr6qrTtm
         /WmJimHNGfblbd+2ZBndzXCGM3GQCV2TVs5nsKT0/mKtbMf9OmIkCnyiOaPSDlUQrUEn
         LBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787656043; x=1788260843;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ygSmQPvZ/Nd116NGGtGNonu+zeK52756mGmLYMo4WT0=;
        b=d/Eb9xgMAoOu8dlGw+bvEZy/fT4kj+XF2QDYeJdOpNulfoCV27s+bTMIENAcyGUvLh
         NSqVE1CJ9T5vCpJGNY05g2CWBJjIrcqVi06B8zR9ETdssEbbYUXZgngScs93UqYcQFq1
         bAtz+OSDV/UTiU5dtPumk5hP/iTpvF5uao4LLeO7pworjb9rptL1od6bi1FUcWWJnNSK
         BhjO5MX2u+aTYRa6wypiH2lWC2Qj8gGPX8a5PnDFfZdr+xIGDntboT4CMz1glUtgL5Jw
         z4un7MzJyqKvE6RT5Mr90A6nykhXGKIB1/1SndkQVhZG35hZAdAFY1+ek5qRzjJFgyVh
         5czg==
X-Forwarded-Encrypted: i=1; AHgh+RrMQojJkkEssjLyVKjWyLLjjg1uN8D5cqMPEkyPg+UwIjb97TZbFB6UBrpbayNsoNA/xtoj3TA+0yY=@vger.kernel.org
X-Gm-Message-State: AFuF++mfCpxPMio6SMWLS5SckBXHQ0+RjmRdGq7S4AwXSufPBlDT+w7o
	GN7EvLr7LrdNWEU//PP7sTgtOnKhaj1/hbTSYe0MbgGEfbDDZx5/4biP
X-Gm-Gg: AR+sD112I/Mv93tt1lrxpRQOO/XtEaAUHJsVm/6EzcRbR6xSK7+TuEz5vxoMxoAKYrV
	Tq8hxcNGiP8lDGERiqBuqulgio/Q67GfIXT7wWdZuLz05XZPUNuUQj+KrnQctsIQhV6rX8+qPzB
	jQwrQNoDuUg9YwihNQ9Ikp56Y7vTv+BBlXYXqyRi8Cu50hK1qgOAVLHdkWXmc4Jv/SutbiH8Vcn
	aBFNKrefXxtvCUhkGldqJOi8+0JxE4Am1AFTX/iz67Fyuobiv7UtcGzfNWYxTB6GDokTNBC3Q6w
	Vp26HrKOS63bWliDIsI1+ZXUoFNjf0bmp8Oun2fzo68OYRTxbSWI7nhr8D0iac4QAcs4a+IbuF0
	YlC4PjMuyxNh7M+Ll+uqW+kNo8iyi8VWVt7A+ryu5SBa86XOq4CuCW26LJICSFaEvrCxfxUI7R/
	gvn5jF5P2QqIFcbUC1Da6wisn6rFggVj2JTLT+oF5hHn8sSxCwmBqkP66WNww2dXn+hfLnJc5da
	Nu0S8VLPoNKj3Kaxjx7GdlQFnhrF5QzxKe5IBmsLuuS
X-Received: by 2002:a17:90b:2685:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-396465587c5mr11510630a91.14.1787656042512;
        Tue, 25 Aug 2026 04:07:22 -0700 (PDT)
Received: from localhost ([2409:40c4:101c:e5a9:a28f:e499:1b07:43b3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d36f9sm54570232eec.16.2026.08.25.04.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 04:07:21 -0700 (PDT)
Date: Tue, 25 Aug 2026 16:37:15 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: jjy600901@snu.ac.kr
Cc: brauner@kernel.org, eulgyukim@snu.ac.kr, gregkh@linuxfoundation.org, 
	jack@suse.cz, kees@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, mjguzik@gmail.com, stern@rowland.harvard.edu, 
	viro@zeniv.linux.org.uk, stable@vger.kernel.org
Subject: Re: [PATCH] USB: gadget: fix NULL pointer dereference in
 gadget_dev_ioctl()
Message-ID: <ao128wxaVmFhhohL@eggarch>
References: <20260824113510.1141236-1-jjy600901@snu.ac.kr>
 <20260825105801.319997-1-lovekeshsolanki00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825105801.319997-1-lovekeshsolanki00@gmail.com>

On Tue, Aug 25, 2026 at 04:28:01PM +0530, Lovekesh Solanki wrote:
> gadget_dev_ioctl() reads dev->gadget outside the dev->lock, while
> gadgetfs_bind() writes it without holding the lock. A concurrent
> bind can update dev->gadget and dev->state under the lock while the
> ioctl thread holds a stale NULL copy, causing a NULL pointer
> dereference at offset 0x28 (gadget->ops->ioctl).
> 
> Read dev->gadget inside the locked region, before the state check,
> so the state and gadget pointer are always consistent.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Eulgyu Kim <eulgyukim@snu.ac.kr>
> Link: https://lore.kernel.org/all/20260824160022.2378192-1-jjy600901@snu.ac.kr/
> Reported-by: Jaeyoung Chung <jjy600901@snu.ac.kr>
> Link: https://lore.kernel.org/all/20260824160022.2378192-1-jjy600901@snu.ac.kr/
> Signed-off-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
> ---
>  drivers/usb/gadget/legacy/inode.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index d87a8ab51510..e9f7d7c1a6a3 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -1251,14 +1251,15 @@ ep0_poll (struct file *fd, poll_table *wait)
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
> -	} else if (gadget->ops->ioctl) {
> +	} else if (gadget && gadget->ops->ioctl) {
>  		++dev->udc_usage;
>  		spin_unlock_irq(&dev->lock);
>  
> -- 
> 2.55.0

Apologies, the Link tag is wrong, correct one is
https://lore.kernel.org/all/20260824113510.1141236-1-jjy600901@snu.ac.kr/
Should I send a v2 with fixed tag?

Regards,
Lovekesh
