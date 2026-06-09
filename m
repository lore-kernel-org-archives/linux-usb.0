Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CF0357A4A
	for <linux-usb@vger.kernel.org>; Tue,  9 Jun 2026 16:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781020896; cv=none; b=JRzW4jpbOeb9a95eFwk56/1Hn4PV/6Xz2VGVWaPnNG7pTqRfDKsIoajybyfGW/Uow2XdtYvad51wtmIqQZcKr4ehcCTVzw1rzE6sjAnulPoJTTacsbUyjgh4eRx1WXQp+CQsjGI+I9efEGQNn7h30KEASrneZTR/CyF3EH3OuH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781020896; c=relaxed/simple;
	bh=AHsIE3Mf0v+BtXwYQr0ZF+LTuN1HanlCwhxJURYpu0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMyrsIMYg2c7bAQ8a/3r1atZ61S10AJX+tyu0b59dWnwd9wO4x5wdz/CUzTK4AgYWdTggCdn/JIhpMXgci3ftz74CK6dqVpIvw1r8hAZTRTZJ68/yIbs0PGNyuzfwnkk50uv63SHKC7Uq4doFUJYnYuuo41yfgi67SSO06wRwzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6iUo6Il; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6iUo6Il"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so20666685e9.1
        for <linux-usb@vger.kernel.org>; Tue, 09 Jun 2026 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781020893; x=1781625693; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZVnaveXVwMZjOVOXk+BfC9BsJLogm3/Wh5ng9U3F8JY=;
        b=i6iUo6IlS15tpVn1C7LS+Rdo+APhqsEAwbglD2wLVCX7zBpt863+DL0RRGxAltZkfG
         TS1S7KSzhYUqgR7FULrQJIYn8jBku64NGOv/wF503Y9rq7TKr4y5uN5JLobMkzAfGiWr
         AMnwefmDfK016hcraOiYtZnPpsl/4oIvgUhZwuj2TyVI1HjjwnOCAzBa0D88wsUv4OY6
         kR+H7zz/QXn7PvwqDKq1zkw6OI6c1pPG/dHwQh/TaTRR7h6+df5CJRxaanuCu4Jqp+hF
         277dtkZFBQMr0/F8Zn4M9Bf0PMhDtzn4mUz+QvfGEY9lmFYSTKHbZvU9zfRFj+hWn31/
         miaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781020893; x=1781625693;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVnaveXVwMZjOVOXk+BfC9BsJLogm3/Wh5ng9U3F8JY=;
        b=QYsOyYCa+Nl+5fTm7q1MlciSoVmZXnz3IbsbWBpcvpPmDJ3tdLDM03fpVhzWjKeJmL
         E6HdDwX+23AF3kCRzwhTzpr5bFdjUbn6iYCQUNvg0UqgvAQeCp3a2CrFwAHZGaqAGKcJ
         LE+ktY7X7xi8OYBhXnAYvOGk6uY3whDfY1qnc/AAqyAS4cBIWnIeWPAy/tWNxnFRwp6g
         FQE1+R2g7QZZ15qFkyFYWM4ilV7gtW35DVBAJ7peoUWFpKkfmDdf/UY+q+7jmvd5c5Px
         jfdMjXxVPGKt1+L+rfxmKYAOmjgcrHL33GA5dJVW9z7gdkCBN+LLyXizpo4Q2hdAx8aY
         Ll4Q==
X-Forwarded-Encrypted: i=1; AFNElJ97klyNug0cHXu/Ktap1cC98SS28e1v7sMxC8eOALapXiWsr0nAKBgNoLUM0STL2zbcMMOKjXU7Fu0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2XRvlhp0NnJc1S54Bwy6iWk+Q9cbbfx6DUJ2g9LIB9WtwszpU
	Ah/qUZviUo/QmYMibl4/CvelAHd4QExCIlvobN+Wlt/EiqM9fGN36b8H
X-Gm-Gg: Acq92OEPmrecNXM/KBm61xMnaVoyKLAr/piqtCSY/yARoXQ/jjkoAlHfopx55CInLJZ
	PbxaHiTLV0Zt9PnIbbBtjdROvchmHVQTfxpAQ/YzhxZoG+ijlf5XIZBmKhb7ZhO9VFECMGNb/mJ
	uqRpMVgz0Q4Yy2ApHjxcIjy4Uu+6jA0sB52N/eHoQo4WWa7a7X+pOG5Grbj+mj6pux3vTgDMuou
	738VSkgaDAL1RCvh+4GHrbBGSKUdfeuE0r+e0W2mghw8s1FeuLvjao94OpUNZxL5B9TG3oOkwcN
	USz8YIoXAJMQ7IUjKnFdMOACdy1Z/B9+9mgOzP7X8U1L0rD5DslhZ4sITP2z+qh2I7rXudhmYdO
	HPKnjqykM3EmjGkuBQD1Mgms/PGK0YXrQqX5Ntv4gfvrsDTIfNyXbiRnWNSFCl7dv5SkRIJgv8H
	TIUvvL9y7dOad0ULZk4xtmeGQ+PbTDmT3sQLmW
X-Received: by 2002:a05:600c:45d1:b0:490:bf13:a1b with SMTP id 5b1f17b1804b1-490c260567bmr319243365e9.26.1781020892932;
        Tue, 09 Jun 2026 09:01:32 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm433068545e9.4.2026.06.09.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:01:32 -0700 (PDT)
Date: Tue, 9 Jun 2026 17:02:32 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: Fix DMA fence leak
Message-ID: <aig48OoC1vkdRMYL@nsa>
References: <20260609152905.729328-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609152905.729328-1-paul@crapouillou.net>

On Tue, Jun 09, 2026 at 05:29:05PM +0200, Paul Cercueil wrote:
> In ffs_dmabuf_transfer(), a ffs_dma_fence object is kmalloc'd, with the
> underlying dma_fence later initialized by dma_fence_init(), which sets
> its kref counter to 1. Then, dma_resv_add_fence() gets a second
> reference, and a pointer to the ffs_dma_fence is passed as the
> usb_request's "context" field.
> 
> The dma-resv mechanism will manage the second reference, but the first
> reference is never properly released; the ffs_dmabuf_cleanup() function
> decreases the reference count, but only to balance with the reference
> grab in ffs_dmabuf_signal_done().
> 
> The code will then slowly leak memory as more ffs_dma_fence objects are
> created without being ever freed.
> 
> Address this issue by transferring ownership of the fence to the DMA
> reservation object, by calling dma_fence_put() right after
> dma_resv_add_fence(). The ffs_dma_fence then gets properly discarded
> after being signalled.
> 
> Fixes: 7b07a2a7ca02 ("usb: gadget: functionfs: Add DMABUF import interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Tested-by: Nuno Sá <nuno.sa@analog.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>

>  drivers/usb/gadget/function/f_fs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 75912ce6ab55..7cc446502980 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1704,6 +1704,7 @@ static int ffs_dmabuf_transfer(struct file *file,
>  	resv_dir = epfile->in ? DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE;
>  
>  	dma_resv_add_fence(dmabuf->resv, &fence->base, resv_dir);
> +	dma_fence_put(&fence->base);
>  	dma_resv_unlock(dmabuf->resv);
>  
>  	/* Now that the dma_fence is in place, queue the transfer. */
> -- 
> 2.53.0
> 
