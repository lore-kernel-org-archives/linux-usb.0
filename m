Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD66331EB8
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787505987; cv=none; b=ZpvhaqkDrQgKRf+EVqVJhVDEeB0A2vSfw3j3Njg5u1moc7tY2miCG3PlOCoHt9a48LRjQ4niSod9GNLNE3OFgnP3SPy/snFOOj/eIo6URU9paxshf5Sy+FkXK+MfdpEE2+NsdWma+E4dsAn7PXr08y1GbC+/nkGIVywFSIMOC7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787505987; c=relaxed/simple;
	bh=29YSMDq1xsvjYZSH6oU1x0SwCRi5UTfYHAlKS18g8U8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XBOJi39P11cbCfTcEINzsGMCnQQFOCoZLDKdBFk8MubvgNbmvD3Ydvo+LyI3LwpzeTeI6QdH2+n0SG7FMTthrhwwIOwTXBNegUKXGlEfJgsFfXzqYmK/n6aA6zun4gPiDD4mj4Bqmcmh306aRKhQY+aqKbE5t05tEzINOdcB7j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+bFTLx0; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+bFTLx0"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a386a34603so6457995a12.1
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 10:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787505982; x=1788110782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q+MIT6zuMA9ZcVF8p5pidNPzNcAArCU0/LLpKmnvVyI=;
        b=M+bFTLx0FcIPKd/Xsc1Mwzgipr+04X8+aEt1wKqjoH6F17ikrometJRkkGKwhleCJc
         PG6Hb7ezs1Q6bPaU6JeMwdQaxISsoDaGT/f1iQKRq8SsNmgr5IxmhxpNi1jqEWui9Vf2
         vCf9E8F4BEZcfNy9M1jABdFbgESeXtxAQKIVNk/spb7kIRYvFFrHLjmd1qgi+wapalFq
         rBizAp9PlX6/8eFBZb+CGAmrVomGDPUgolf8ObcMMiDzkujms4oZdx5ZnpuSnmjbMX3v
         EqWyWhSoWbBuahGyplOuq87ACdtFk3iTLul3lB61d0UgdEKbOJ/G8ULGuS5oYr6gBl5Y
         2WEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787505982; x=1788110782;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q+MIT6zuMA9ZcVF8p5pidNPzNcAArCU0/LLpKmnvVyI=;
        b=RoKTtBMAdwxtQxMjKeFHVcpersldA2pIziU1PlPtZK8nTXFh1uqRbCSbFJ0UOMwMBs
         w/4QUFDKhoc96KvQ7IOl8au+a9zVn658iLhc9CEvi17lxl6U5hjxotrjeJ2CZd035tcp
         AKfLbJ7jAE6YyG/4Uyi3pTxMjNb4dwK9Wqwws03OLqV+86GNtNow9N8zh4NSRYBMnKYq
         GfvnXp+y6HgDgjM2SjuDGNcSex6LAtVCkfMpKLXMsRtB74JJQIwUv+Wc7zH7jZB6Dbh/
         afekTDXUXwgt02LGxx9qiVxZ2lt0hZ+LjUBU6oQwCiFBEq7gVtRUKFe1l6rxpOhZhqUS
         k9XQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUuF95aPKto3JyvbYLX0YOo7GZWvrriv/D2al9bgGDrGAVeV23CVvLZD2vxYEvKtC+B39QD/byqvc=@vger.kernel.org
X-Gm-Message-State: AFuF++kgdIrsu+QOETEcaGK79eHc+C7JE/svetrUO8a+ePbS7wVtlbcc
	qWd7WQYq/GKBNI6Az9lsW7/RYzVZX7JlttwGvn8dkf0693iXAoZI2UL5
X-Gm-Gg: AR+sD10OwgL9fdylS25qN+zsrjdPAtdHG5Tqv9DNdGWS0Sn41VGyU54/pCG/WqozYVd
	ilbInf+PWCsYcQ1gwj3iK5THjZAng+Kl5o+udEiAn3raiz7qanI3P370lFw1jDgIFb1lBBsLDu5
	61O/X4AzD0UHLxzYsLqglyE0ExoYkhdCyr36p7+bPb6QtebT3tmUHXTiRgG5C9EM0Ua6TXuGFWQ
	AIZ8xrDNtuUAa7TG8dpD26jT2SJc1xcVLR2Lpb057mPrpN3DbKNBTyBF4ZHdc4XyzBUa5SfsoBf
	mfaHUlzs3B0hW5jK5XF3xJrknQRrNQm1P+3kkeQasxdl72grtwDF/hRTYUxj/IVJCE4us5xWOGl
	0ZVIxUMYiFvcdM+/Gv5n5p1V4TrS86N0zkwgRcYNMa5EUfF/UcqUQgxsM65LwcyW/+GOYjHFmzK
	aL9adpc5ZdLYJ975ZzcgV8rt+Mfyizr2dyPb5a2PaxNNCfkt8g9ur8amUz/rujclIxFbOBph95k
	z7F3A==
X-Received: by 2002:a05:6402:4617:b0:6a1:f3b5:f7dc with SMTP id 4fb4d7f45d1cf-6a41129a4f4mr26577169a12.4.1787505982076;
        Sun, 23 Aug 2026 10:26:22 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e001305sm4349899a12.4.2026.08.23.10.26.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 23 Aug 2026 10:26:21 -0700 (PDT)
Date: Sun, 23 Aug 2026 19:26:17 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oliver Neukum
 <oneukum@suse.com>, Ming Lei <ming.lei@canonical.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: hcd: Cancel BH giveback works on removal
Message-ID: <20260823192617.2194ac8e.michal.pecio@gmail.com>
In-Reply-To: <f107bce6-85e8-48ce-b744-7daf41cce565@rowland.harvard.edu>
References: <20260823125831.6ea35650.michal.pecio@gmail.com>
	<f107bce6-85e8-48ce-b744-7daf41cce565@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 Aug 2026 10:31:28 -0400, Alan Stern wrote:
> On Sun, Aug 23, 2026 at 12:58:31PM +0200, Michal Pecio wrote:
> > Turns out, we do actually need to flush them, because workers use the
> > 'high_prio_bh' and 'low_prio_bh' members of 'usb_hcd' for a brief time
> > after all URBs are completed to track pending completions and possibly
> > reschedule themselves, see usb_giveback_urb_bh() implementation.
> > 
> > Flushing would suffice if the works don't reschedule themselves, but
> > cancel_work_sync() is more robust against stray completions.
> > 
> > Syzbot may have found the issue due to unlucky hard IRQ timing. It can
> > be reproduced by adding udelay(3000) in the work function, disabling RH
> > autosuspend to maintain the status URB and unbinding a real HC:
> > 
> > [10818.828029] ehci-pci 0000:00:12.0: USB bus 1 deregistered
> > [10818.828077] hcd_release freeing high_prio_bh ffff88814a950978
> > [10818.829211] usb_giveback_urb_bh still running on bh ffff88814a950978
> > 
> > Reported-by: syzbot+cade843a1e4af0651f5e@syzkaller.appspotmail.com
> > Link: https://lore.kernel.org/linux-usb/6a8a5047.dbb3a75c.13dd47.003e.GAE@google.com/
> > Fixes: 94dfd7edfd5c ("USB: HCD: support giveback of URB in tasklet context")  
> 
> While that is logically correct, in fact the patch won't apply as-is to 
> any commit earlier than 8fea0c8fda30129b ("usb: core: hcd: Convert from 
> tasklet to BH workqueue").

Hmm, it's a fairly recent one, so this will only work on v6.12+.

Maybe not a big deal considering Greg's recent opinion about unbind
issues, though TBH I'm not really convinced about unbind's irrelevance
in this era where everything (including USB HCs) is hotpluggable.

I'm OK with this patch being dropped (I will maintain it for myself),
stripped of Cc:stable or limited to branches where it applies. And
I probably won't bother backporting it all they way to stone age.

Regards,
Michal
