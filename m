Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB6136895D
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 02:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600319; cv=none; b=hEgRn6jI0VnmD47dd7d83hPWlN6Zp5yWvz/tUVJSrx/rveUkcfbS31IxTCTAK6ND9oUbkkmrVeN9UZfKps5/vHVk3IZ+/9sNYUxk4zgMeJVqCklav0n2W7XEcpBneLHtN1fvRu1hwM/haiIHiD85c6Xq8aoPOgtv5qqBTAkHuXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600319; c=relaxed/simple;
	bh=QTOu5CSizizSoj5iz/k7HdxTrtBvF7bfxYpiFgYurHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESYOI4/5hu7P/GJ3czs/AWKRvsJlSssrafbmNcGnSYXCSW4+JOHO8SoogsdtE0+QaNx292LVYq+6SF0mNx6xrVg12MOBsyHcEUi5VU/dTJW3XNj+lUX/2JkIHDU9/RiQojaolm/d1R4HfUpYQd5R1TGWcSHN0b2oySgUEPG78Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=t8PLJJ2G; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="t8PLJJ2G"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e5d6f35c1so946023785a.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 19:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784600317; x=1785205117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D8k4ujQWkbP7sTnAVKUtdfzksJQNiMG5COn766xXXn4=;
        b=t8PLJJ2GdQVnURmpCMtr40Nkr8Lrs+4AhG/YJK80tCpxdyBi/S9NjiMxjiSIv2+qgc
         Cjy1xteJfhB443wIVhEbDEY6OmK0+NKDeQ4Mzhxisq32KVTlIofokM+1IKTUuDGvbTQz
         Wb4hZIZl1OJRmp8WD8kZBStCjzsu2bML+4BDtdcpfs6hi7+5MnoYdQYM5427VmO1f4nZ
         RmcbzfMpsQCBcjTPR1eIJRHIxAyTz3zuyue8w5r83Bsu5wrQH6QduW99VjsOMN1lhG5x
         u2UeAK7TVKtzaDikTCzlFHDhLbcNqHAXOQytp39ykLSfA8bcXt/CLwAproq4Wum4DFVR
         h5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600317; x=1785205117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8k4ujQWkbP7sTnAVKUtdfzksJQNiMG5COn766xXXn4=;
        b=Nle4rJ7FffMtjFnn7ZkbFuQDw4NNri+19+PZUhf2Lv9Wh4UO8nlZhYLyVYS3vkmMk6
         85kvUkrZofO2EZ0oTjhuzi8TchZkyCorku4QcF1nTBmrVW2kMruCA/hnRTF/oXU16YPb
         tMDsK9ZJAc4p6tILbXFSelvfpBgBi9svqnCbn3UcFmZDBRG3aztHtlOkCehaa4+F7++r
         6wZ7cbzxh/wYkiDDkBXV6uLCksAqTyVGiNCOg3U8kwtnNhMmkuMLas/I1h5WR27nAYzr
         HjO+4ssLSWaUWqdFlvJzs2BB7QckLLWvsK0CJsjZLmnjKVLjngM7M4FpfSevCeyrbUd3
         LV+g==
X-Forwarded-Encrypted: i=1; AHgh+RoOPC+Mol2IDjfa5zQOAvUWrpH9Jwlv+BNzYWj1Bdz45l3b/xX7IHFiY60mNZavl/UdB/SRp7JG268=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV9Noi94oiq77lGRcbeg4Gb/LlVjZzTcrRH2gEueDJXx5zCJ58
	fA7Wfof+QuMe7/jSS0SghsX02G537mkgh/sy1W6ofp8bXlzO2eEqWfhxTbcTJy1yog==
X-Gm-Gg: AfdE7cn8bot07ZbcgQhKy5rFbkW952zG0ArGmudQCwRLGGfFvCQwVmKZMGTOBc7Me8K
	iFF1x+d+Q4wQ0ka23AqLqEz8TinJilzZY23EgwHY2hn5vAA9TUb34CHveq9f2vfQHpQ400HpE5t
	xnqp1VoT0XWPVrSV/+TsTcPhbiSp8o78acTSrGbyrV9nLeltTjbILSbDOGRsmVX/5R1kwvdOJuM
	qBzCYvyAov/yHnfaBTh8S2zzioSfEN25Ks1UPSE9a6WVGFTW7spa5+44uftaHxqM62V21/OERSp
	eRVN0AxpLVDNNDc+7wN5fNlM1qXfe1DGj7aYY2n5gWOXFMwjchWzBRW5exErhNculTJimCdBMGi
	X7YyMd0lglbzQX4Z17excO7WpHG2X7Q1K8PlWPl5Lfqz0mQ8PrC4m8ZPHWr+1DI0iAXTf/UY/SF
	2wRnM=
X-Received: by 2002:a05:620a:2305:20b0:915:efa6:d718 with SMTP id af79cd13be357-930b431be97mr1213727185a.47.1784600316964;
        Mon, 20 Jul 2026 19:18:36 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b5494cf0sm1019636985a.46.2026.07.20.19.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:18:36 -0700 (PDT)
Date: Mon, 20 Jul 2026 22:18:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <887e75d3-dd11-4d98-b6e6-5f6a2c3a6ae8@rowland.harvard.edu>
References: <CAFmvuTWc880R=mw7=kixfx3Yb8u9thLHPA7D=rm6a8p9dYBBDA@mail.gmail.com>
 <2d4a91dc-037f-4c31-8ce1-7bc840d42b0b@rowland.harvard.edu>
 <CAFmvuTWq7TKZaj6R9JJzWhwe1WB1FanZ17T1-TFL1g2wsUBZ4w@mail.gmail.com>
 <8067503d-1c0d-4319-adbd-225a03e16ea3@rowland.harvard.edu>
 <CAFmvuTUEg8fr8pY91WpEk=CxHuackJfr0c2c4jxexNy9wkiS0A@mail.gmail.com>
 <a5e0e32a-7e49-4112-bcbc-92da449eb303@rowland.harvard.edu>
 <CAFmvuTXQbqbt3qxqUXitzboZhiMxAC7aaOqAtyZXs+QtJvAjBg@mail.gmail.com>
 <a7f9d958-7f9d-40eb-89ea-56094f60c075@rowland.harvard.edu>
 <CAFmvuTXx6bOEEusjf=bw5c-RDVu-bzRLbd_RVnhn2tLe4n4upQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTXx6bOEEusjf=bw5c-RDVu-bzRLbd_RVnhn2tLe4n4upQ@mail.gmail.com>

On Mon, Jul 20, 2026 at 05:59:19AM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> Thank you for the revised patch and for your kind feedback on my
> analysis. I applied the patch to upstream v7.2-rc1, commit
> dc59e4fea9d83f03bad6bddf3fa2e52491777482.
> 
> Regarding cancellation before ep_aio() returns, the reproducer I used
> for that test has separate submit and cancel threads. After
> kiocb_set_cancel_fn() links the corresponding aio_kiocb into
> ctx->active_reqs and releases ctx->ctx_lock, the cancel thread can find
> it and call ep_aio_cancel() before the submit thread returns from
> ep_aio(). The synchronous reference retained by the submission path is
> not dropped by io_submit_one() until after ep_aio() returns, so the
> aio_kiocb remains alive during this interval.
> 
> With the revised patch, I did not observe the earlier setup-time
> null-ptr-deref or the original ep_aio_cancel() null-ptr-deref and UAF
> signatures.
> 
> However, with kiocb_set_cancel_fn() moved after usb_ep_queue(), I
> observed a different UAF:
> 
>   BUG: KASAN: slab-use-after-free in kiocb_set_cancel_fn
>   Write of size 8 in list_add_tail() at fs/aio.c:658
> 
> After the request is queued by usb_ep_queue(), its completion callback
> can run before the iocb is added to active_reqs. In that ordering,
> aio_complete_rw() sees an empty ki_list, skips aio_remove_iocb(), and
> drops the asynchronous reference. ep_aio() subsequently links the
> completed iocb into active_reqs. When io_submit_one() drops the
> synchronous reference, the aio_kiocb can be freed while still linked. A
> later active-list operation can then access the stale entry; the first
> KASAN-detected invalid access occurred in list_add_tail() during a
> subsequent kiocb_set_cancel_fn() call.
> 
> This UAF was repeatedly observed with the revised patch and was not
> observed in matched runs on the unpatched kernel using the same
> reproducer, workload, and timing settings.

I've got some ideas on how to fix these problems, but we should discuss 
a few things first.

The real problem is that I don't have a clear idea of how the kernel's 
aio implementation is meant to work, and it isn't documented at all.  So 
there are a lot of questions about how the cancel function is supposed 
to interact with the normal I/O pathways.

For instance, what is the cancel function supposed to do if it is called 
before the submission function (ep_aio() in this case) has returned, and 
the submission function eventually returns something other than 
-EIOCBQUEUED (i.e., submission failed and no I/O was started)?  Or if it 
is called before the submission function has started the actual I/O 
operation, so there isn't anything to cancel yet?

What is the cancel function supposed to do if it is called after the I/O 
has completed?  Should it return an error code?

What is supposed to happen if the I/O is cancelled and then completes 
with no errors?

How does the system handle a partial transfer, where the I/O was 
cancelled part way through?  How does the user learn how much data was 
transferred before the I/O was cancelled?

I can program very defensively, to handle any possible interleaving of 
the submission, completion, and cancellation paths, but I don't always 
know what is the right thing to do in each case.  I'd appreciate any 
suggestions you can give.

Alan Stern
