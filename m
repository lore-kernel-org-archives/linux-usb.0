Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB6F4052D1
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339087; cv=none; b=HRNlKi2nqDZ09qv+Es8vhsjMAVLJ1R6pNQw+bnHBG8YRGttGHdbZ23nEkeI2o0nyHIaO386gn0SgIim0GAW0aEVI96k39+GCefCKg73aQE6EldtuClJfo+LwSrKUdH7TAlCGuPOWUsBuCj+115TZYGFS7Hb6ub3ahh+0UwEP8zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339087; c=relaxed/simple;
	bh=ZXezEhoC4TLTbCvEtxxlDNLW+oEa0b8yR401U9Hce28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpQvJUd5+n9l2P4ufEgi949RFPE50bYpEYQM9+jbHDdWBXd5wb4K47cuNvE+XI6Dzwh1Tsh5+lb41fhy2mZvKvzlBvFZwL3mzm1geHV0cBv+TVdMS6LniEYAta2qADfWILJ8088Q4jYrnuUZBZGQ+WGKI6YvfGiQLdCMfm3huc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=NqkGwYH5; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="NqkGwYH5"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ff20870ac7so7076176d6.1
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 08:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785339085; x=1785943885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AfJS1nhtFV2QPLpuvHiiE++fnou4jpJsirVC9U1y0ks=;
        b=NqkGwYH5pA65OidafRrA9tOA/WDdGBakbR/JX+L0Vus7DTV3ELMTbCcDmuwDF7OO74
         BdgDZBz1bHWEaAE8EXQ+pXAkngeWsUwjqv7WXxaUOK00YyuVHXiSqdNz2DOxSNu+rsNk
         oWMCihkcuDzjstuCKLJ2+bSz1wlo25/66fmamLFNScjwGepsw+eUwFHXxdT2WQs0cxlv
         ig+w3kMhRUx8P5vbJkFguocBGD7yApuK+yzBMgbm4fx970XPRqaOPkb8dDjf1uRlqw//
         rCyYh7ArA/k86FyGo3Tj3LxT0F8iH+UUVYEScq0mk6FhMWYHPnHdnkK7L7DHvEAY+Uuj
         cN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339085; x=1785943885;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AfJS1nhtFV2QPLpuvHiiE++fnou4jpJsirVC9U1y0ks=;
        b=Lwk3QIPk7VqTimyqFm7in42LhTExfAEiFccoQfOimbD30BhJ64TJrPY3F4y3N1C8jJ
         Ra49P+xwSAaFYpDJCEHqdmkaUCvHQJmvkDGWHEw6kW53E2zc7Ca8xQOyKuOxEmd5XC58
         6tBpOWsgT1gCnAULkK2d45OOx9lXErhe5V8bYr9O77yQjb4yfmEIZfltiDPNnvAk5xYG
         c+cNpum1+eLk+zEV1IF3GIHlOl03G4RmBJN9mr3vPJSnuTmgWK1gRNC/U/E5XM67HJ43
         xqjo+D71QtqRl+Zzqx5BF+xU/2sFUGxvq1LpGKFNz1MiqJtsLL9EIwCe+cJQ725I7GXm
         sPSg==
X-Forwarded-Encrypted: i=1; AHgh+RqQk3ZkJG9ahxZlTUNgQnTjIpseDP1mbLHaa4XV1ZvSvml4lKRkfTFOf+0rXy14UzvLkgAcL/obx8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhmRLGKNk5RoF90cNmPm5lqROO7KTA92pvoh10UD0IROTWKV7x
	rlKaAMIOOkipsnjeU1Az+2Z0HCQTglDCu96pzVmSfGaWwwmN8el3nN4kyl8G33eFMQ==
X-Gm-Gg: AR+sD13v4G4wb7uW04yzzfC06HTx10L1rewylmWbnKgI57ByHMi9vHOAp/oNCpb4DsF
	K0V2m/yTfxtNJWCZj7eUkllbHMQ9MDOjHdpV7oZy7DxcqPirTDXixPB/gBHcSKx87skiFmZzsfv
	Zd5sxaZqr1tfuPixKeB3XD/o+yjpFvrzCmk2G8z8Sv/jaogB4j5O4/krg2kJfmGDsT6Pom8RTE4
	FCryAzUqlhjRRHVNmNroTMHir9UNVEfrv97rOZ7BspboAzjj4OgmI4Oi/iRi+R1gExae7zmTa+E
	NhxwZl1F1OGbpVE1gWOcu65x1fV+9AafK++9CW5S0ds7OiQY3Nx6oVTKIsDRI383I8Ok9nY6O3n
	Lu4sel4pydXEsVU9agdBT43pJtsDkDHGRieRSBnUg7Y3HEAWXG+OsVI5vrgWRJJs+hLVJu0DZS8
	BCM9RVI9vhiX17hrZxfntqZMrHVWApc5QwSS8imvxXZ2C5tvvanK8vfEG2ULz68Nk1Xi6fd2dqN
	htkoh+aXUb8vDlzWkM+o7EUbYneW290
X-Received: by 2002:a05:6214:4017:b0:8f0:dff8:9889 with SMTP id 6a1803df08f44-90817043257mr79354036d6.16.1785339085155;
        Wed, 29 Jul 2026 08:31:25 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:a008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dc831fcsm26873406d6.16.2026.07.29.08.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:31:24 -0700 (PDT)
Date: Wed, 29 Jul 2026 11:31:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <e05c6ba1-48f9-49e7-9d56-25db41e70f6e@rowland.harvard.edu>
References: <CAFmvuTWc880R=mw7=kixfx3Yb8u9thLHPA7D=rm6a8p9dYBBDA@mail.gmail.com>
 <2d4a91dc-037f-4c31-8ce1-7bc840d42b0b@rowland.harvard.edu>
 <CAFmvuTWq7TKZaj6R9JJzWhwe1WB1FanZ17T1-TFL1g2wsUBZ4w@mail.gmail.com>
 <8067503d-1c0d-4319-adbd-225a03e16ea3@rowland.harvard.edu>
 <CAFmvuTUEg8fr8pY91WpEk=CxHuackJfr0c2c4jxexNy9wkiS0A@mail.gmail.com>
 <a5e0e32a-7e49-4112-bcbc-92da449eb303@rowland.harvard.edu>
 <CAFmvuTXQbqbt3qxqUXitzboZhiMxAC7aaOqAtyZXs+QtJvAjBg@mail.gmail.com>
 <a7f9d958-7f9d-40eb-89ea-56094f60c075@rowland.harvard.edu>
 <CAFmvuTXx6bOEEusjf=bw5c-RDVu-bzRLbd_RVnhn2tLe4n4upQ@mail.gmail.com>
 <887e75d3-dd11-4d98-b6e6-5f6a2c3a6ae8@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <887e75d3-dd11-4d98-b6e6-5f6a2c3a6ae8@rowland.harvard.edu>

On Mon, Jul 20, 2026 at 10:18:33PM -0400, Alan Stern wrote:
> I've got some ideas on how to fix these problems, but we should discuss 
> a few things first.

Minseo, any responses to these questions?

> The real problem is that I don't have a clear idea of how the kernel's 
> aio implementation is meant to work, and it isn't documented at all.  So 
> there are a lot of questions about how the cancel function is supposed 
> to interact with the normal I/O pathways.
> 
> For instance, what is the cancel function supposed to do if it is called 
> before the submission function (ep_aio() in this case) has returned, and 
> the submission function eventually returns something other than 
> -EIOCBQUEUED (i.e., submission failed and no I/O was started)?  Or if it 
> is called before the submission function has started the actual I/O 
> operation, so there isn't anything to cancel yet?

Never mind this question; I can avoid the issue by not calling 
kiocb_set_cancel_fn() until after the request has been sucessfully 
submitted.

> What is the cancel function supposed to do if it is called after the I/O 
> has completed?  Should it return an error code?
> 
> What is supposed to happen if the I/O is cancelled and then completes 
> with no errors?

Presumably nothing special should happen in this case.  It should look 
more or less the same as in the previous question.

> How does the system handle a partial transfer, where the I/O was 
> cancelled part way through?  How does the user learn how much data was 
> transferred before the I/O was cancelled?

Presumably the second argument to ki_complete() contains this 
information.

This leaves only one question for you to answer.  :-)

Alan Stern
