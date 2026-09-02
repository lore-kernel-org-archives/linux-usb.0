Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923474A2071
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360032; cv=none; b=GLmDjUdUkzbjfRIu4Wq8U5Agj2GgiqyResKn5dBG0Ac4Y8yz1TtyDPBafUNBi4O0OeGkGFlj0GHLGFvGkHz+wWzNCyVmhTt4MfRjsGPzwGIzYqq6MYYWARTMjGShkKSoJ/gnddH9s0iECmkILjQ8swxoq1edYArDSlD250nGZLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360032; c=relaxed/simple;
	bh=PGPV8PnvETwJ8x5UFE1NNCMMuNSjJwtF9qxgAEozccI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5baFAp9BSB4pm/VyDYsVdWC5o/jjbLN0FijCGXjTSMnl7TMnaP8PEgvWtqKPyhEWVZXuDWYqt3vi78FLFoJjUMPBn7eG6tOSphPp4TekQYijSEeUzkuVWzRyZiFjJIXOd/jO3vzNpvqri/ir2MH0fA2J4uBs72FdwECfCfrGsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qXdvV+N0; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qXdvV+N0"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-90cd43bd740so12247976d6.1
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 07:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788360029; x=1788964829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xp8kJNejkxTEYeNjUZC5PeSk6vljIo0WGI5C64Q9RE8=;
        b=qXdvV+N0Zebmgb1J6+T9QrwO6Xg3Kt9lQCEn8zTu5P8tYLA7Tab+f7aSYFsGtY9Vg+
         tlMdXwTaPWB2MVtBU+KlkpkK+zZF5RYYrHMSfJM2rrNxy7ZksLvePYXHNQtTw4Rdk6+u
         zNmHxiQFefRGyRiTlRYLSzqn1kwZPuo4a7uXPAHykQ8XEbtR2qSuHW119IpqM2xZfcX7
         PbbwYAVGCuV0MCHaYMH8rLZRYMy6oZZGnb2h7U/nOrTLCqidGwhVSeU7R46WEEJ4EblN
         I3k8M/+SL2/uqhF4h221e0rCZYrmXXBq4mqNXswIdCtz9Z3BDa0WVDv6EU0ao5d4vqKK
         NueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360029; x=1788964829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xp8kJNejkxTEYeNjUZC5PeSk6vljIo0WGI5C64Q9RE8=;
        b=G7R9Nvi6q1bwg/DCkOt+2uIDiWsR/l12QU8/dnmO4cboeoc3plYIaYwmRB5fS4p7QT
         wxRlT0cfoaC4Sc8WhXz+yB9XULhylfexOryd7WzDvKij//Z5v3UfdWamDs/BD9NReE8s
         XBquxYDGAq0wE68zy2xgvQVsjYqMd66aOCPkn/B6wZLCjeA/J1eH4gjxKBqOIu39iA/l
         Q53nTzqV/BytKemfvJjYvQgJiODQZmSYy1p7HRJyTa0JrgcOBHnOLloUIeOW+mEfJ7qH
         v3Mfc2ZQSUdDG8UcIFuOxWVowdXrblug5p/5FKSPJGvBl8UftXS9XJUERuQzrbauzjx7
         FgNQ==
X-Forwarded-Encrypted: i=1; AKwUvBySsH+0Ovfj2dr3BWT74zGX7lP+2El5YGyVlhtyyLCk1bPRK7LHeDp4jokmyen8CCRudtajRPCdcgU=@vger.kernel.org
X-Gm-Message-State: AFuF++l9eht/QRCHozuszv8Pm76JDje6sqZCgN7CPwlWO7iHSJ+Os5bs
	QESx9TyS2VURUMiMoZ5GsEINdSboKy3yOtqFP96KD6LSzpECaprxqrbR4rTRfjD3tQ==
X-Gm-Gg: AYBFou2DgaL8SXEdQOT8Nwc0X/pJYGieF/dvB+DZFdhi+FOK0HOju3QtHAwxp2B4TQZ
	J9Y3qBlMDoB8aGkA8o7QKXGH2wsfyJP1ujG4Zjads8CT41PbdUCiKn+0xNqDTVCcQ5GvoPxrxCF
	09pxhEB5siBUonL7meHjnLJF+x2eNPl8P9OtG8ab3eWbwNtsENnU/1aGHTe8KcXhu6CKV6tOxkd
	ABI5WeI6X1WREIbF/08Y5MXdqTrJV1tvxF5c5cu37wOP2xtxNg5cWvRC8F9iqjWKO5v02oQ5CcT
	Ax2zSZbYLW8aASwi/CY2ckvSqUQjcFCN2JtG+uy0fauOroThWNXsXiJbcjgjWyzkmadxii0YWrC
	XFbTd/sXpgmFoGTivqvzPv+wwe1kFu/gHOLDKfI4xnh9ZOAP7cCb1zmRR6UjC6JkG7fzZpCl32K
	sGRZs7so5ENHOETkI+eOSN51Xx76DK8BqnZBRUqr1ctj5TB1vyqoVrqKrnA8/oOAZe0DLDzC3IA
	0+ej4E=
X-Received: by 2002:a05:6214:4909:b0:90e:8f4b:df24 with SMTP id 6a1803df08f44-90eb529e08cmr81307666d6.14.1788360029094;
        Wed, 02 Sep 2026 07:40:29 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9f0d998dsm19026046d6.9.2026.09.02.07.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:40:28 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:40:26 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: Re: [PATCH usb-next v1] USB: gadget: Fix UAF on refcount inside
 gadgetfs_bind()
Message-ID: <319c395e-ba10-4fa3-ad3a-716a97cda27b@rowland.harvard.edu>
References: <20260902052137.3824591-1-rafad900@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902052137.3824591-1-rafad900@gmail.com>

On Tue, Sep 01, 2026 at 10:21:37PM -0700, Rafael Alejandro Diaz Cruz wrote:
> The UAF is triggered by the syzkaller reproducer which
> forces kmalloc failure inside of usb_ep_alloc_request().
> 
> This will cause the following error path to execute:
> 
> if (!dev->req)
>         goto enomem;
> // ...
> 
> enomem:
> 	gadgetfs_unbind (gadget);
> 	return -ENOMEM;
> 
> In normal case, get_dev() will be called to increment
> refcounter from gadget->dev->count but in error case,
> this increment is skipped and gadgetfs_unbind() will
> decrement it via put_dev().
> 
> Going down the error path leads to a refcount imbalance
> which will cause UAF in close()/umount() operations
> due to refcount dropping below 0.
> 
> Fix this by moving get_dev() above the error paths so
> that refcounter is incremented before the put_dev()
> call.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
> Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

But same comments as for the first patch.

Alan Stern

>  drivers/usb/gadget/legacy/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index 3e2bce7543d4..181b19e7fc2f 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -1679,6 +1679,7 @@ static int gadgetfs_bind(struct usb_gadget *gadget,
>  	}
>  
>  	set_gadget_data (gadget, dev);
> +	get_dev(dev);
>  	dev->gadget = gadget;
>  	gadget->ep0->driver_data = dev;
>  
> @@ -1696,7 +1697,6 @@ static int gadgetfs_bind(struct usb_gadget *gadget,
>  	spin_lock_irq(&dev->lock);
>  	dev->state = STATE_DEV_UNCONNECTED;
>  	spin_unlock_irq(&dev->lock);
> -	get_dev (dev);
>  	return 0;
>  
>  enomem:
> -- 
> 2.43.0
> 
> 
