Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9383C46D544
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 14:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925612; cv=none; b=jL+a7JqfSov9t0lqJcMIyUPbe6BqEMopg471wOsycUHd05Epba/9zWNn16FU8aSqxLzg5gYkVCsOv2BdtumUMwQL7c0zpmE4PB+XtIxg8EmwHPFOKfu/6rdr54bBlrj2lK3tDVB7VAoMkYRzVIxdiMTRCmQMQ7PwHQhXOkIhdCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925612; c=relaxed/simple;
	bh=8HD9FV0lPZmnx5SuWJTOlDwZsVhQRXXyk7EnIJvWF54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBreISKO8QvvmJkGVXsilAbqUQvkHqdKzhwyaNum1AXkJjwlxavSxfZnXDPTPG4qOoq9K1SAzp2b2YJ0VKPQH7ZhB4y+MGo7VeGHnzsvSpSNo9ZmapsDzTfJN7aYGZlaZMVDIdK8wgul30a5PLMhwy0bEJGuzXEZuOWMPYnVYIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=aBMCiJav; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="aBMCiJav"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-52ff0eea420so3218411cf.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 07:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787925609; x=1788530409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5RW9O/btoipt/pNA5wGJbBttBme2fvSaZk+CT8WHc9o=;
        b=aBMCiJavFpFcN7+BbUwE0LsePOxsQJFJVzTjW/21Ibdh5KmdXuZtAPemXoLqhsJ5Ut
         RaCbvBG9r7BbOdEfxBEP4gwZJiBlMXVxuy88ay571BxDMRNMU7hhe603XAafAzUYTZ2f
         RwFNNralyqM6c7dF6dHNuMptlLr5g6dUrck7+rmIA3aSNtkw91xQorm5YaQx1DdAFtR0
         xpffWuGP3pDJhUvTHV6HS3aMG/bFidO6qOqUe157KdB0hFA7jugZ0Rt6yfEm5gMHcVbM
         3BHDVSDCMmSCyVRxSBzPMnHoyRzlQWMWkbMjTJtg7TkakGp0B3ViOjNWixNoxDHl/JTi
         kqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925609; x=1788530409;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RW9O/btoipt/pNA5wGJbBttBme2fvSaZk+CT8WHc9o=;
        b=pjoSrlLgS7PJN9FjXG5pXbdoPZPf0RSplCUJ19io0gKHz8ZtLAVzWl7i0UV+upWfl4
         KuX5S3nP2cRLocs0myZvg9ZnUHUbio9Zpk3xTAPNkTuHd6b0vQGzlv9BqyUTRIV8b8j4
         wZen9sqEXIj/m7VnynRYGlmi/ns59dQEJXhfMslRkAj4LX75gbehBETaEXCRRY3gTgXe
         yOYiEtFAykJJ12QcAizeZlGPbalqbCCY3gg7LsyTNxtEp5p7NArtmqCji95GRMh0IJGV
         PHwKikbGoot3AJbUbO6EP133DDXgbzqt5YJi+LmJagn905m2jIoyWkkGHsWxDS5/ApQk
         1StA==
X-Forwarded-Encrypted: i=1; AHgh+RrgfNt81EiApyJYfuZcyDlw46JmXmgcgFLFF1cylRKeqOA7SZzRwR/H3mYt1R6gsrhlPc6XZb49Ays=@vger.kernel.org
X-Gm-Message-State: AFuF++nX9A6xJMJIxqMfi+wU5oNAlo7yc3a4LDu7vzI7o0NRnrulKXmP
	vm6niD6ScJiJMbVw4tHLk8FpmmGRYTtHMPYf4YyBTkcKjmIrPTpJq9yMQY6QPqeJyQ==
X-Gm-Gg: AR+sD13XUX0fL32upvT2JQBbwbiGcR6yoEsX5K33BtmYwTC3fJDpfn86nEZO0PgW2IY
	DSdXh7m1AdHa3TtI5S2H5nlXvdZ5S9mzJop29nupJrXKmMWmnclb4Mckt/aF254oEgM2tdz4Dm3
	pTChK/afvZoXSL4wf/FWsHrDwEG3UFmfCreUgIv/p+0xEwL+hnV+fgS9/MeRldzG4D+mObwBsF7
	9rls1YezKl3pFumtrtGutpC6Mi5ncpdRlwS6darBQzJekHhFc1+ogX/Lm+d/OZCHtgkEYhISp9J
	gOZAw8YqpnTWbWPfF2X0gFkazYY88g6xpuiU9DwTkX02E8xUyCGvGG24iHdqfIZZ26nrqIYBTI1
	bhCSprGQSgoyS9Hbmbxr+pn9AZLoFA6y+qNM0SDbC4qqPBnE7yNVNk9XIf7QCJQgePlRu2eoZr2
	DnwMRlWiFvMfE/ba1dSxH2ePSrFcltNXSZ//0+eaD5wzHEjIhbEMCndERdzdOXmknRY13JuUlZO
	vJBMd4=
X-Received: by 2002:a05:622a:258d:b0:51c:4f35:81b8 with SMTP id d75a77b69052e-52ff4c8d121mr2582461cf.7.1787925608993;
        Fri, 28 Aug 2026 07:00:08 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe5a6422sm13371571cf.12.2026.08.28.07.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:00:08 -0700 (PDT)
Date: Fri, 28 Aug 2026 10:00:06 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: Re: [PATCH usb-next v1] USB: gadgetfs: Fix use-after-free in
 gadgetfs_kill_sb
Message-ID: <0e612926-f447-40a8-9bd1-da06ddcd63e0@rowland.harvard.edu>
References: <20260828061829.566256-1-rafad900@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828061829.566256-1-rafad900@gmail.com>

On Thu, Aug 27, 2026 at 11:18:29PM -0700, Rafael Alejandro Diaz Cruz wrote:
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

This is what the description says the patch will do.

>  		goto Enomem;
>  	}
>  
> @@ -2066,6 +2067,7 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
>  	 * from binding to a controller.
>  	 */
>  	the_device = dev;
> +	get_dev(dev);

So why is this here?

Alan Stern

>  	rc = 0;
>  	goto Done;
>  
> -- 
> 2.43.0
> 
> 
