Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529555;
	b=0Pb3JJoszMVo/JxzBe8fap+qxfbMGbAq8BrUdGBDoHKwzvqtmOqO05xPFjHmUBpaeEzQ
	 8pPuggRSgUnQb/nM1sBioVyp1fcn81EnPbY58IjgSyPzzwtpcklo5JRrk84rU5IJRHJhQ
	 WZPsqaIITuoogKP3ebcAjSeW8oAw/CuYqr96q0lZbFvlA/NiXL4npLRiSBC2HmZbJE1eR
	 X2G1NaO31YDYmp1Jr4ckI+oQDhIJa4+476yzKV2mJtEv5xHMcv79ITNP/J+NF57cbx92O
	 eCUzR9T1a0EzM792v+aHeIKmh2UZwjwCUCH2dDlOwl7+AcgkDF4ueA/kVVR62n1FVyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Ht6a9Ts55EUwl/9pAC+7DHZmdUzaMpvPagpqVmMJzTc=;
	b=20pYaJC/m2UW092cdLRK9+uB2yKndj55O9AIHhoK3Yqj/rktiZZUl25h1Ji8SRmnGnOv
	 JfIrikaa1cTHid4uclPi2acbertctXXr2jruNm3aYq00I7bi/YxtD0TI5s7p3YKEldCMm
	 XkJW2BPTcEBXPuPX6FZdzOgjkfVv8qxf+E9Ivzd/klBAdbHT5LDH0civjyETw6DCI8YdQ
	 aa6rp1w0z9MxZ4FpzfkyTkLDW5xlkprpZT9U7iHOhfSpESDeF3Zizxq3mSWtyHyVj4ilH
	 7/ldlUdT7y0UhTs0ppcBYAfv4SYnOj5c+RHVO2kck32b3/9/Ff4UhwVtMKEIvBatm8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=J1AsbAII;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CAF606A326
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 14:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6CAF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=J1AsbAII
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-92125687442so45688086d6.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 06:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795529554; x=1796134354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ht6a9Ts55EUwl/9pAC+7DHZmdUzaMpvPagpqVmMJzTc=;
        b=J1AsbAIIOj558TKrW6Xgyf3YmEpePWEh7+GZrWJJVuOTPz9fsTZTbC2jOh2lLNnp8M
         v0ePVusdqcnTvjNEhXKaB1cXvBL2oVDRvE1+9WmZ8VatU29VhD/I4nvybjwpzXCaXlkH
         Z+y1WM+tdfRV9pY1QWh/BJgvxjWIGP93gPbVrZ1EsWkC7sLAN/GhXzZkpeo/BPcg7Md7
         AKdfjNvoRLE4OCoPfB8ccgVlTkMxnXigRGMSvpMjC9D1cTRq5ooBZ1nADHPukBhLsk1K
         74NyzDv9RvdLgxh/2qLb1JeBVIRvib0jW5+YaKjM12FKEpHrQ0Yy3wEj2cRT3Mbat1K8
         QFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529554; x=1796134354;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ht6a9Ts55EUwl/9pAC+7DHZmdUzaMpvPagpqVmMJzTc=;
        b=RY6wLrqGKwA00Ml7okE0NkCWkxcoJj6kVmsO4bB6wVraNXW3Jqg8yCYErWTeaodabF
         jEitE0RCHur+yrH/LkFyUX4Ln4z3LIDrkop/rJFVckKsL9khJbZhjwW1RvOYcFcpPK5j
         g7putftTlo9jbDztgfwVw2wwqpKxTkfbAUUssz4y8FiJPbE4HREM207WZ23OA66R+qiF
         S1SJiNyn7s/dP4mM4au6X2ewTOEpUQkbD6kCm8+ONP0pTalrCAywlZmg7gEOo27nGhEz
         4RatVlnnRRHmTOpUM1Hbj9VaT4dM/hbxBzx7VMHMBmLSraIykUKStfnYIIjQdMoe7GHN
         aF6w==
X-Forwarded-Encrypted: i=1; AL+hErFQ6Rcju+h+YtlPTPNN16mY0LUcWldMlstyDXspksKY8GrkFWOE7Ur7DiKYauT4gby1mYjIqGgT7To=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B0lI8LEglm7XD4MKAgSwc8tbxXb20JYXLdlGU7jBvqsESqQyv
	gFuTuKJ7G89h8ElgkBzPCrKky56oWqC2DZoVKM0AmF1rC/D1fHHTT0+7TNEnrJecoA==
X-Gm-Gg: AZFdTZdfiG55/Nc3L+p6LdNxb0e7L9AEgPd9aY9yp/d777oatY4eY5PHOUS+lnHALIA
	HkJUaRtdXjdUE4FBJptT1HeQgVfYSjduZvNzbKlRCqi3Ntf2Nq8FwYzmA6Wxn7ctbEJLHzjxC6B
	UxxmUzG0BeHuzFF117x8ndUj+d0kituIGXBhDNYl5Z1X0oOXrAKwgesZVB+2Jt+K8TgvGItkcz4
	//YAU+WVxTcnHxMzPSEDibtSOS5LEM8yIv0uVBTEXC9883WH6KXpy4uvA4d772qCHr/iEXcXVz1
	xfxOIS/G/Vkyqnwc1Ri7Lxix4ilctiJrND72co2rWjxAfjngdYy8XnmRAq2OWJkffABVMcOVU15
	SZnrtg/koCtpH09L1VPJWhqR7TQxwioGBpi5hjVMBYdxdyGFYivYEeGet06HlT1/V0aG/WWQ60u
	ntEisQ/Xofn5vj7ldUbFh8QwDbHWrg+ID7G2aVx1AFbAuMOWs4vnUfVYopl5G11IYGSmJKJ5w6Y
	CX9WMAMvqlvJ7tnkGYNEk1HQqaTZebRDQEZH5sgbDkvGCOL5KMPAxJKA7aRyoSeXGPRsEeQe55Y
	jjm15DtY27GnSjg8qDiihG3HkMcKzw==
X-Received: by 2002:a05:6214:27e6:b0:917:af36:df30 with SMTP id 6a1803df08f44-92134a69ac9mr267449386d6.16.1795529553760;
        Tue, 24 Nov 2026 06:12:33 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::9a34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349cd592sm138586576d6.16.2026.11.24.06.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:12:33 -0800 (PST)
Date: Tue, 24 Nov 2026 09:12:30 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Adriano Cordova <adrianox@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] usb: gadget: inode: fix use-after-free of struct
 ep_data
Message-ID: <a47bfaa7-b82b-44ce-a4d7-573e212b9594@rowland.harvard.edu>
References: <20261124084144.3208824-1-adrianox@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124084144.3208824-1-adrianox@gmail.com>

On Tue, Nov 24, 2026 at 05:41:44AM -0300, Adriano Cordova wrote:
> gadgetfs_unbind() -> destroy_ep_files() frees each struct ep_data via
> put_ep(), but the inode still points at that ep_data through ->i_private
> with no reference of its own.  A concurrent openat() on an endpoint file
> can therefore reach ep_open() and dereference the freed ep_data (the
> mutex fast path), even while the inode outlives it.
> 
> Give the inode its own reference: take get_ep() when the endpoint inode
> is created and drop it again from a new gadgetfs_evict_inode(), so an
> ep_data can never be freed while any inode still points at it.  This is
> also safe against dcache pruning, since the inode reference keeps the
> count >= 1 until the endpoint is removed from dev->epfiles.
> 
> The inode now holds ep_data for its whole lifetime, so an open() racing
> with an unbind never dereferences freed ep_data.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=7bf725ed337e37307001
> Tested-by: syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Adriano Cordova <adrianox@gmail.com>
> ---
> Changes in v3:
> - Add a Fixes: tag.
> - Add Cc: stable.
> - v1: https://lore.kernel.org/all/20260904163827.216389-1-adrianox@gmail.com/

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/legacy/inode.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index cc059a6ee262..20453214e35e 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -1748,6 +1748,8 @@ static int activate_ep_files (struct dev_data *dev)
>  		if (!data->req)
>  			goto enomem1;
>  
> +		/* The inode keeps this ep_data alive via ->i_private. */
> +		get_ep(data);
>  		err = gadgetfs_create_file (dev->sb, data->name,
>  				data, &ep_io_operations);
>  		if (err)
> @@ -2138,9 +2140,20 @@ static int gadgetfs_create_file (struct super_block *sb, char const *name,
>  	return 0;
>  }
>  
> +static void gadgetfs_evict_inode(struct inode *inode)
> +{
> +	/* EP inodes hold the reference on their ep_data via ->i_private. */
> +	if (inode->i_fop == &ep_io_operations)
> +		put_ep(inode->i_private);
> +
> +	truncate_inode_pages_final(&inode->i_data);
> +	clear_inode(inode);
> +}
> +
>  static const struct super_operations gadget_fs_operations = {
>  	.statfs =	simple_statfs,
>  	.drop_inode =	inode_just_drop,
> +	.evict_inode =	gadgetfs_evict_inode,
>  };
>  
>  static int
> -- 
> 2.51.0
> 
