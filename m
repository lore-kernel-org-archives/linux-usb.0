Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4A63B47E3
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 15:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788015930; cv=none; b=RjIfk/u2YZYwwg2YFrqEf9N7ca8moZA6FGAA0rctSz+Gdj2hXXcfljniRbSNO90IM9VbdqYPhZm4Ld76BCz0pxbDJQRmAuNyURRavQDz45vVV0OApBmbvuQriX2FqUIW4Wjn6qIloBZRaI4E2Pq27CmArFWqUXvn9n7DNUq8Q6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788015930; c=relaxed/simple;
	bh=QTFugN3XEm5Io2UG/Z7aka8kxCbDYn3ZHIkEujYiBAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bj+rvDiz0GotInp6OP25Bw/5uGNd4nMBEw2b33pvnufmbDoXJ/UjDFoQh6W8Hb5L0tDRx56p7dEHx5la/L6rkclsa4Nc6TYahWdlvEHSpjKj7gAj1M1iwbqWibrou0+tciCGO2pDcV1sJGsp3tCMEYnAe/yNQTbt1YJAsESVAtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=nswK7NuY; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="nswK7NuY"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c0c45c580so16242821cf.0
        for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 08:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788015927; x=1788620727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mmph9+pVk/2tp5+TOCdi/jGTsY2OdEHY2KXUFQ9mzGE=;
        b=nswK7NuYqzH0yShtO2hnLfONHKXPw7G7cl6NlpQLseTLfNGaTMDIxcztxeSdgo/DPX
         VlDoYvf9nqIA1KOItBtKW6fjn45xrpSgMAvPTNzi5YXf0hcjychwGPTsb9K5mDzQgTW6
         Ec1AOHxxddyn3EtaKxy4xMiORxmEder7l4jg/wK2+7gTFkKyJbXdIh+60WjUbC4jDFw4
         8WTiQxoVYnu5/dq5aTy2BrJtQ8xu20klhZfh5zKLW3ckLZNY9QLEs5W/M+9Ww8a0MdlY
         J6xzdvhsLxEPn3l92OsfECrcDM0l/Ihj+uIFxjkLSZVehESK1PtxjbD8YDrw2WFVMd8q
         uXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788015927; x=1788620727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmph9+pVk/2tp5+TOCdi/jGTsY2OdEHY2KXUFQ9mzGE=;
        b=nlL6l0wYClVMmPKlAVvoMVy+SMN8bi5g+2fEJSv4MAU6HqA6NzUJXrlytIBN98wnbA
         L5gG2CYqMJQq3JCyvK4BJOjrDkzNGRQyq1p5wFxxVx2qquGuOr/5V9R/kgp0amBqOMaH
         jZqoqEydrCZ9nGohdAbsrAhGWk9xV8NobCfgiIRPzto6uwsJ1KgOemg3xddyQH7IJ2qC
         9n21sd0RpudMWx+buBJknFlfvuR7kWbD5N57KIYrEr4DLLCcdS4v4NAV/wJHFXKmCYL9
         TF4gMOVsrChjrxKtvHgHh5l+9zKVX2dYzhLAJqHMD7tInHHJXbyw+3ezqRUTESGjZkza
         BVzQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpRODc3qb6vZSWxw7jZ6qMAMT4JuVoXJUsGsrjDt4Pe1kuhFrl2Hr5ABQ5YfAS+s6fGZ7FbNY8xKc=@vger.kernel.org
X-Gm-Message-State: AFuF++nGZg6Rdo7/ckegwfK3CunThA6g56ymBKdt/zAFAG9y3GJ5p8a4
	uEFjDUNYTv/aUwWtznbU+pzVjQb6+Et3lE+DIcA/GNhAPIpEN5OnLxpdQky15MitTg==
X-Gm-Gg: AR+sD11ku0VnJZq4rd5r6HITAuApRNMqm1reeFLMLAmnxSi4b5wBs+UeY49N+fOuDqz
	i0I1anNLSaAkLNb4AJQdxpHmHGmSxhtqHueCS8Z/CL+qQHFMqByYZ7j41HuWFqMri/uHGKbw3zj
	Ri1l5CUOVAK/SsB5UBX+/mCd9iFkZU20weAr8ABRSjpQ+fWOKxVbxha6SlJS0I+2JkwrQvSAPAa
	T7kG2prFWMb/xDjBbf/Ok2wfV3c/PWJ3cwulrVB+uYceH1EooieDxuivKU9/cozZ5iotxbNmfgZ
	y9mfdW8TBAM/u6k72Tq8zg6r0bC6xVK68eYDOjAgjR3PBdFsFvcvDkcx81SwhaJM4SxXCjXl52A
	YCwg6DNfaiNEWYlkZjpP1B4RZJfCzmst5F7ovvdB4OYcr/hpIpDGMHEaJ9K11RT1t4Mw9XWx2UV
	OxDGkR+ZKNGbYseJTNxCrMzU7nveZBOVuoagvEogs9mhebKbOsLtIRGwdbT0rKDw==
X-Received: by 2002:ac8:7c4a:0:b0:52d:7b2a:938 with SMTP id d75a77b69052e-52fb9379683mr161723911cf.6.1788015927082;
        Sat, 29 Aug 2026 08:05:27 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce87695bfsm31568456d6.12.2026.08.29.08.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:05:26 -0700 (PDT)
Date: Sat, 29 Aug 2026 11:05:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: Re: [PATCH usb-next v2] USB: gadgetfs: Fix use-after-free in
 gadgetfs_kill_sb
Message-ID: <991f3432-02af-47e7-b470-b21d36d09ac5@rowland.harvard.edu>
References: <20260829011901.325379-1-rafad900@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829011901.325379-1-rafad900@gmail.com>

On Fri, Aug 28, 2026 at 06:19:01PM -0700, Rafael Alejandro Diaz Cruz wrote:
> When gadgetfs_fill_super() fails, it's error path calls
> put_dev() which drops refcount inside the_device to 0
> and frees the objet. But the_device pointer is not
> cleared, leading to point at freed memory.
> 
> VFS will then call gadgetfs_kill_sb() after mount
> failure leading to put_dev() to be called on the
> already freed pointer.
> 
> Fix by setting the_device = NULL during error path
> before calling put_dev() inside gadgetfs_fill_super()
> so that gadgetfs_kill_sb() skips put_dev().
> 
> However, if the fault injection from syzbot failed 
> and it began the open()/write()/close()/unmount()
> sequence then close() and umount() will each trigger
> the refcount to drop once via put_dev(). This will 
> still cause UAF since refcount is only incremented 
> once on creation but decremented twice. 

I don't understand this last paragraph at all.  What fault injection 
from syzbot are you talking about?  The earlier part of the description 
doesn't mention syzbot at all.

Why do you spell "unmount" the first time with an 'n' but "umount" the 
second time without an 'n'?

Is there any reason why close and unmount shouldn't both do a 
put_dev()?  Doesn't the open increment the refcount to 2, so close 
and unmount will set it to 0, causing a deallocation but not a UAF?

Why is the refcount incremented upon creation?  Normally refcounts are 
created with an initial value of 1 so they don't need to be incremented.

> Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
> ---
>  drivers/usb/gadget/legacy/inode.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index d87a8ab51510..77efa984ce84 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -2059,6 +2059,7 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
>  	rc = gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
>  	if (rc) {
>  		put_dev(dev);
> +		the_device = NULL;
>  		goto Enomem;
>  	}
>  
> @@ -2066,6 +2067,7 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
>  	 * from binding to a controller.
>  	 */
>  	the_device = dev;
> +	get_dev(dev);

Does this have something to do with that mysterious last paragraph in 
the description?  I can't see any relation between the two.  In 
particular, that paragraph doesn't say anything about adding a 
get_dev().

Alan Stern

>  	rc = 0;
>  	goto Done;
>  
> -- 
> 2.43.0
