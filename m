Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500B544A72C
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 14:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457965; cv=none; b=jsSX0GFMKYYCEIGmxioXGaj+N7Fa2jLGQWzTrly4VMMWHMM342+VgAd6H88DdDLH8WmWvXqWZm86QjalEHa2Fl7EWjtZZukmd1rPsY7VQmY1IH5hhzdxzcY0dEaN0ecyGCvN/wfA1uTR8Qohlb8KhTuIrY0ACo21Uq8GwbNtozs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457965; c=relaxed/simple;
	bh=p7sNJwyBf9c/7NWjyBdVUTEqi5b1dqsQK6yRu+CHG3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HE0UeATezT0J+Grdxc41Pr2QTZaCT3r6iQlceUI+LjfpiAFlp45rqoLy/iBMdUHmSMVyhZ5L4tZffZJRALDgl7PslCKkRnfdD3QtfsQRmjctLQ1M2bH1W+8VKGyCxfCVjCpfMNhlBuAz+ecEe0zw93ucr00NNRs/dqvg9WaFSMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Evi4mX6S; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Evi4mX6S"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92e50979c71so292474385a.3
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 07:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786457963; x=1787062763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uf29YAQbQH70Jc9IOQNy71qHW0UCpxkEZ+y1iZYDeWI=;
        b=Evi4mX6Svz+xFfdiyoqyb+M/MA8VFaPl48FRO7F1zUi06q+YqVCf9syZPKTKF0Vzk9
         61qsihUPaVMejlJwzn+DK9CyETQZnCwcJkHjoSSgmvMI+9dzl3GhD4oPkargtLuqw64Q
         ZwV5fL3ACeNoNu+2LcRJJbrZstMAql89fYlNp1B8pdmO5LAyxVQO5YaoA33+PEKqYLZD
         caCSgCEcNWAFinQtHb4o5l53igj4PjiKz1lrSOeexNmTIUg+Whm6vxv/DrjxccqUoQjO
         G0ejwK6Jl78pPxsxpvo/v+z7zAjXyCDPqu8IlszIdJklAQJ+1pmd0NnaTYIzSNun710K
         SyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457963; x=1787062763;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uf29YAQbQH70Jc9IOQNy71qHW0UCpxkEZ+y1iZYDeWI=;
        b=LtVl/PbIeM0KUBVvUz23n9aooqMymo+YFOwiT7+gFdq86CvP4nG+1MqqXCtFveEAjW
         f+HZzA2UbPtG4WfBjW0avcDLYAxIU2hw8mkPWj5Y80FpxNzF9/kMpBw4onMy4fPTfpfD
         oTlgWTjYFD9NwyQbLO84O57HfJe4HkswROQGAQ21c9nsOie4iXcpDwRDAGr3eyt65jZo
         LL0NyreuBgjlDl/H4+dyss5Tyoe35XjEGZACsHFPYfzF4ixJrwaMv9jPFSL40atyVsNM
         lQalx3MLmE1Q/8iLZXUUak9Tc3Wd7RnNKoXi/Vszdum8gjT0BVA8hxvHXcnsOvGg99Zo
         sDbA==
X-Forwarded-Encrypted: i=1; AHgh+Rpu+UPTD9izgJHsiEqUEb3dlcA0ZwlrC2f0LXhK26k2Zuy8GN4OqS7Uwd7rOtw/bEKfr8+9YdJxSrY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6YZ/c9iAb3RFujyTnLc/au6l8Eqdb5WYxMCTOnJgacIml6LVP
	DICnZ6//gRhMREqYtEzmrNt2j4WyISnZuhJhK3jb+y2iY9r8psm2zdz4l8pvpNSMIQ==
X-Gm-Gg: AR+sD13mNFHPjDnvf4+uVBaHQXPGQRekK2BFL6H+6rdTIqduz3ZvYchJN2M1jk3TwIc
	1DvZCJ61UDn3Mzn9lgdN1g0qDHUzRL7klx6GkzhpoRveRy28p+MNocQUGlJT3lCOz3lL1pM7t5O
	sp1H6w2vC1KA9uB+FJ5GADE2jGLP1CYL6iXcEe+vaQQlZb/3bUrVtLh4HuGPyjYrhXTJ7DK/T7p
	pv4UuyZieQ5vtYYMeOX3u90obIcmicLO3l7+zLi8kD1tnQXvCm8aYvZx99jYrN6CIAY78ZDlNRr
	9qIuMWGM4l+2Vicb944n3X2f1AkTdpqTVBYUXZvJfwqLj6CLBiyt3x+VA1ahEtn/sXHeFjIwQov
	aExmFaTdVqF4MrsTlURgYlzvXbv1nb1mz34PuNBn+9RB7wQ7w3M0hToifhlpLR3ab+uv+WkSiyQ
	2uvbzb9zoX0eedH7TCOhGez58Bob/ckiOn6rpW3VAQ7/yGcUQz3VPFviA4XHLYfA==
X-Received: by 2002:a05:620a:268c:b0:934:99f9:87cf with SMTP id af79cd13be357-936a8ecf046mr321600485a.21.1786457963014;
        Tue, 11 Aug 2026 07:19:23 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936a86078c5sm119056485a.44.2026.08.11.07.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:19:22 -0700 (PDT)
Date: Tue, 11 Aug 2026 10:19:20 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+8496ab5e117502750445@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: fix refcount underflow in gadgetfs_bind()
 error path
Message-ID: <54a35c1f-46ca-4a37-be88-c7691a3b8409@rowland.harvard.edu>
References: <20260811060810.295666-1-khiemtranzo532001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811060810.295666-1-khiemtranzo532001@gmail.com>

On Tue, Aug 11, 2026 at 02:08:10PM +0800, Nguyen Quang Le Kien wrote:
> gadgetfs_bind() calls get_dev() only on the success path, but
> gadgetfs_unbind() called from the enomem error label unconditionally
> calls put_dev().  When bind fails (e.g. ENOMEM), put_dev() fires
> without a matching get_dev(), leaving the refcount unbalanced.
> 
> A subsequent close of the ep0 file descriptor calls dev_release() ->
> put_dev() which hits zero and frees the object; then gadgetfs_kill_sb()
> calls put_dev(the_device) again on the already-freed pointer, triggering
> a refcount underflow and use-after-free.
> 
> Fix by calling get_dev() at the start of gadgetfs_bind(), before any
> error path that invokes gadgetfs_unbind(), so the reference is always
> balanced regardless of whether bind succeeds or fails.
> 
> Reported-by: syzbot+8496ab5e117502750445@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=8496ab5e117502750445
> Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/legacy/inode.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index d87a8ab51..d6551a4ce 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -1682,6 +1682,8 @@ static int gadgetfs_bind(struct usb_gadget *gadget,
>  	dev->gadget = gadget;
>  	gadget->ep0->driver_data = dev;
>  
> +	get_dev (dev);
> +
>  	/* preallocate control response and buffer */
>  	dev->req = usb_ep_alloc_request (gadget->ep0, GFP_KERNEL);
>  	if (!dev->req)
> @@ -1696,7 +1698,6 @@ static int gadgetfs_bind(struct usb_gadget *gadget,
>  	spin_lock_irq(&dev->lock);
>  	dev->state = STATE_DEV_UNCONNECTED;
>  	spin_unlock_irq(&dev->lock);
> -	get_dev (dev);
>  	return 0;
>  
>  enomem:
> -- 
> 2.34.1
> 
> 
