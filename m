Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B3150F158
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 14:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419106; cv=none; b=E2S5QPdq7lbZ67dcYG0csc053MMho5EPWQuPB7nffiv4l2RCq2I/xvmG+zG54hnNIy9FRRLN6ClhuXRoaJd4LOK9/JVuGcDksbE6g5hafWWgGdD574UAKnVtQE7Hp2x6lpozoiXU0eiQVUCU8N+TUbKbVSBMJHOb1qqXxrCxaDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419106; c=relaxed/simple;
	bh=3pmSZNjogDg7Ey9thVcaWwUVzv/jy+kUn+t5/GFxm9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFg5YOqlEHsSObHe+fZw9KUHDTMZg95QTgmx5TZGAKJJD42QsBz1v/iy5RrItSzM1nnBPgqUVlmN5Ic8+89qwkJU/jHfgMypA6R5tL1MuKHhX9PNkBAzh0U4DdzQNzCotu+fFnJ17GYJp6+aqGYzX9T+OltanoPwJ+Wq42d7CSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=uGn6yYiB; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="uGn6yYiB"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e64d52949so216219785a.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 07:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792419104; x=1793023904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k97+ZXzgjg5prQ8QTVjKptpH9hxSgUmIIFjzAIHNKV4=;
        b=uGn6yYiBnlxJRS1F8ckc1bm8ECtX6/wiUhM2Hq0i166OCVNwqQnFRBEuzZhI3bWyfV
         CuaAiS1sJS3nkuutN49N9b2gulckeEcTDvlx5pPLwgKZfhtTx5oL4TM6Y7XUQ0wpzSzh
         kxyDhakzVLBSIc92JCgLnrLm3S2Y+zFKhTfGoRmbHtZ5muEAUyAWtNx8jlajTxJPGgVH
         X5LEXPxj1I1ExRcW3VzyQRLokbDwvdJxRa5VPWLlmyRUIgv8Nqey7G9hqusOIuK8+3Kb
         eEmy4y2rVTl74/yxDYgXy1eCmlp/oeFLS5KQN6xYrm0AHJwpkdiOnk8Z+OvsX/gGLb67
         6CIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419104; x=1793023904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k97+ZXzgjg5prQ8QTVjKptpH9hxSgUmIIFjzAIHNKV4=;
        b=rd9VIPuMfRW4HXOla69DY56jQIprZjWpZ4ulWRPC9m5pR+/FCvHayj3l5TTEDDK3gp
         KTwCDKqTpRmnMG47ib+jD0FkfDiEWNuJ0GSJuxzYijsaS/8l7BCtx7Tdl7HGhedrg21F
         zxFcFWx9sB2TECp8HtHjaBU0bS4J0Xj0xAaex4ojjLwV92Z2SpHzJ4EyMfOWq6sDZL4Q
         Vrzpww1jNZ8RN6VJvFgzGIDyAJv60OGFrF7TUElJdeQhLmXjdU97NIahBLYwJmD63Q3T
         J9Z2979zOohQrzJH6iqBAHbtPdRyDMq3FxEKGAc+c8gKeuq2YNp86/J5jcBdQuvE2Cxw
         po4w==
X-Forwarded-Encrypted: i=1; AKwUvBwd3p++JmvUFfRGkGzNp2Ay6B/J0i0ctVMD6OnZewNjsyCf2KB1rDnu0uyUo0HfChhk5loarCAYPaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7iknHQEDxE9IvGK05y75rL68NPou1xcwP9z7E0AqvvvcWa6fQ
	vlam/RcDaEJtubP+qWBSbPnjjVw9IEplhe0/hgO4En5wKPHyYYnM+qeUAcZrv549Rg==
X-Gm-Gg: AYBFou2e8zB8O5/U1S5ZKY3ODqLwYPoJcq8arfIydHvjudQv4KenxtQkTnnHFhtnyC5
	pYSiBJ+FTiTRaHzJhzaoLeLTYW2xjqS65bwKfZx7I2xzSvzO9N80lo50bMYLFSsS8plf1Q4rz2m
	GeOqT9XEXZptzBE7G40zThutIvh5IST3QPyiN5EI1+7noUcXZpBsfj0rPPRU3HILfbBakrwu6Qx
	Jd6DmkeyO2IMd9H47zdlryUCg/bAeJO7XKC8D7C5iOA+AM22Y+So+dsqfxh+7eRME2vXvxn66CH
	oTb8dTHT5iTPAXiw+AXKKKvcw4gQokUmaEK5ZOVsTyowMz0MNomqGQPuGXbdMWMHW5QAwNhks0y
	qsRwsKr1DjADox63zNyM5XtOB1RWHbn7xEfYGHXP/NewLzVD8cJizhlT6kvUZaEvtoq08LFrw4c
	axy7WMjjY9I6ChY5OeMK4SKP3PSF9BcH0atni31KMVqfhx1SsbJcv5/mzfbswGDbtEUd9QAxSPr
	yQIsw1xCefdaP+g
X-Received: by 2002:a05:620a:3715:b0:93f:1823:308f with SMTP id af79cd13be357-93f29dabcdemr1233148985a.81.1792419103824;
        Mon, 19 Oct 2026 07:11:43 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba3d5a1sm97847996d6.8.2026.10.19.07.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:11:42 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:11:40 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: liuc63 <liuc63@xiaopeng.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Weibin Liu <liuwb@xiaopeng.com>, linux-usb@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: net2280: fix out-of-bounds read of short
 packet in write_fifo
Message-ID: <c0ba00f7-822d-437f-a3e1-3a4c0e3d9776@rowland.harvard.edu>
References: <20261019075651.2093625-1-liuc63@xiaopeng.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019075651.2093625-1-liuc63@xiaopeng.com>

On Mon, Oct 19, 2026 at 03:56:49PM +0800, liuc63 wrote:
> From: Liu Chao <liuc63@xiaopeng.com>
> 
> write_fifo() handles the trailing short word of an IN transfer by
> reading a full 32-bit word from req->buf even when only 1..3 bytes
> remain. get_unaligned((u32 *)buf) therefore reads up to three bytes
> past the end of the request buffer, which KASAN reports as a
> slab-out-of-bounds read.
> 
> The over-read bytes are not sent to the host: set_fifo_bytecount()
> limits the FIFO to count & 0x03 bytes, so this is an out-of-bounds read
> rather than an information leak.
> 
> Copy the remaining 1..3 bytes into a zero-padded word and feed that to
> the existing get_unaligned()/cpu_to_le32s() sequence, so the trailing
> word is built only from data that belongs to the request. The full-word
> path above is unchanged, and reusing get_unaligned()/cpu_to_le32s()
> keeps the byte order identical on both little- and big-endian hosts.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Reviewed-by: Weibin Liu <liuwb@xiaopeng.com>
> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
> ---
>  drivers/usb/gadget/udc/net2280.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
> index 7c5f30cfd24d..a1f5d11f82d2 100644
> --- a/drivers/usb/gadget/udc/net2280.c
> +++ b/drivers/usb/gadget/udc/net2280.c
> @@ -649,7 +649,18 @@ static void write_fifo(struct net2280_ep *ep, struct usb_request *req)
>  	 * when maxpacket is not a multiple of 4 bytes.
>  	 */
>  	if (count || total < ep->ep.maxpacket) {
> -		tmp = count ? get_unaligned((u32 *)buf) : count;
> +		/*
> +		 * Don't read past the end of the request buffer: a short
> +		 * trailing packet has only count & 0x03 valid bytes. Copy
> +		 * them into a zero-padded word and reuse the same
> +		 * get_unaligned()/cpu_to_le32s() sequence as the full-word
> +		 * path above, so the byte order on the wire is unchanged.
> +		 */
> +		u8 tail[4] = {};
> +
> +		if (count)
> +			memcpy(tail, buf, count & 0x03);
> +		tmp = get_unaligned((u32 *)tail);
>  		cpu_to_le32s(&tmp);

Wouldn't it be simpler to do the memcpy() directly into tmp?  Then the 
get_unaligned() call wouldn't be needed at all.  Also, the big comment 
would be unnecessary.

Alan Stern

>  		set_fifo_bytecount(ep, count & 0x03);
>  		writel(tmp, &regs->ep_data);
> -- 
> 2.50.1
> 
> 
