Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E648D1474CC
	for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2026 09:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781429963; cv=none; b=M4n04uOR0ZhFdwhlcFHSZKCGoXZJyHDnJrE2+RxL5FlDukjGu06gLaYAjMlINVn0KQTauh3S52lq16EXSQ2PA2OkGeG4hxNkhPFAkVFXib/0rX1xfXIZPiLF/KGtg6n6SDsJrLxNQIfwR23FTIX56p/XIG9z6XxiIIrnGwOLxVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781429963; c=relaxed/simple;
	bh=O9s0IrzsjKQ/LNa7b0yoRHuwrqZMaQCgnSO4j/Cq3dU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cNjlw06IxhTiqwMc0SY0KpcKC8TLV41GfD/GTPdh3SjOcQEzHwnXzmzbbCgvrw4LbyqseLOkWWU4J5d+5Q2NOKQgeFbhHHesdOdjXQCDPZG7WM5mbAgpor+rFaExG6AAcfvcXmKw+zsRkA+Pe0DmNXPqPbGBNk4V4EO0UPKDnac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=GIzgiOQS; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="GIzgiOQS"
DKIM-Signature: a=rsa-sha256; b=GIzgiOQS7GacxD3gIJDpj4Jcr5rR8iyLKQsPA9VL7V9vMTCNG2waCnaKshSLk15IdyDzbpMxZqm7T9nb6C3p3vNsAO/z+GwCG16hT4r+5HJlcCpusvwVMuZ2oiv4cVu2yqab3CZoY+0Mtb43AZSqFvs0OFfItk+CFV1fnBnGwD8KukPK+3azy7Dol8+04Ub4/Z2XLIS9RxUcZrVaBm5XAh2T7EaiGSFw8GgxlGOE+rhxqHR+MwiMYYv3+9yhkQoN/WW9x4yopfFyZwbubNZcnYg8PGIZOzBxlVwK7K8BBOUGQgRSZWBTCetLc55+yknVre+D/172mNBQD2KPkO+DXg==; s=purelymail3; d=purelymail.com; v=1; bh=O9s0IrzsjKQ/LNa7b0yoRHuwrqZMaQCgnSO4j/Cq3dU=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-usb@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 468940127;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 14 Jun 2026 09:39:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1wYhIy-0000000FR4J-3fVR;
	Sun, 14 Jun 2026 11:39:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: linux-usb@vger.kernel.org, a0yami@mailbox.org
Cc: julian@jusst.de,  gregkh@linuxfoundation.org,  Pavel Hofman
 <pavel.hofman@ivitera.com>,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: gadget: f_uac2: fix memory leak in
 UAC2_RATE_ATTRIBUTE store
In-Reply-To: <20260609091957.2716984-1-peter@korsgaard.com> (Peter Korsgaard's
	message of "Tue, 9 Jun 2026 11:19:55 +0200")
References: <20260609091957.2716984-1-peter@korsgaard.com>
Date: Sun, 14 Jun 2026 11:39:00 +0200
Message-ID: <87zf0xmpfv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > strsep() clobbers the passed pointer, so we need a separate variable to be
 > able to correctly kfree() the memory at the end.

 > Detected by kmemleak:
 > unreferenced object 0xffffff80038f9098 (size 8):
 >   comm "audio.hook", pid 323, jiffies 4294896085
 >   hex dump (first 8 bytes):
 >     34 38 30 30 30 0a 00 cc                          48000...
 >   backtrace (crc 503efa75):
 >     kmemleak_alloc+0x30/0x40
 >     __kmalloc_node_track_caller_noprof+0x240/0x3d0
 >     kstrdup+0x44/0x90
 >     f_uac2_opts_c_srate_store+0x13c/0x200
 >     configfs_write_iter+0x238/0x360
 >     vfs_write+0x4a4/0xd00
 >     ksys_write+0xf4/0x1e0
 >     __arm64_sys_write+0x68/0xa0
 >     invoke_syscall.constprop.0+0xa4/0x260
 >     do_el0_svc+0xc0/0x1c0
 >     el0_svc+0x20/0x60
 >     el0t_64_sync_handler+0x118/0x130
 >     el0t_64_sync+0x14c/0x150

 > Fixes: a7339e4f5788 ("usb: gadget: f_uac2: Support multiple sampling rates")
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

FYI, I see the same issue is also fixed in the recently proposed
"[PATCH] usb: gadget: uac: validate rate list length before storing"

https://lore.kernel.org/linux-usb/20260519143319.147494-1-a0yami@mailbox.org/


> ---
 >  drivers/usb/gadget/function/f_uac2.c | 6 +++---
 >  1 file changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
 > index 897787d0803c1..0c2a8afccbb69 100644
 > --- a/drivers/usb/gadget/function/f_uac2.c
 > +++ b/drivers/usb/gadget/function/f_uac2.c
 > @@ -2012,7 +2012,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 >  					  const char *page, size_t len)	\
 >  {									\
 >  	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
 > -	char *split_page = NULL;					\
 > +	char *p, *split_page = NULL;					\
 >  	int ret = -EINVAL;						\
 >  	char *token;							\
 >  	u32 num;							\
 > @@ -2026,8 +2026,8 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 >  									\
 >  	i = 0;								\
 >  	memset(opts->name##s, 0x00, sizeof(opts->name##s));		\
 > -	split_page = kstrdup(page, GFP_KERNEL);				\
 > -	while ((token = strsep(&split_page, ",")) != NULL) {		\
 > +	split_page = p = kstrdup(page, GFP_KERNEL);			\
 > +	while ((token = strsep(&p, ",")) != NULL) {			\
 >  		ret = kstrtou32(token, 0, &num);			\
 >  		if (ret)						\
 >  			goto end;					\
 > -- 

 > 2.47.3



-- 
Bye, Peter Korsgaard
