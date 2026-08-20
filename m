Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7CA476CC1
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 14:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236038; cv=none; b=YH+T30oGuSH12l8RAkHrR7vWEzc/O9uYmYCwodcFxSS67I0f2K9oUdQaqwVM+AdZ+0No7nEaKDTftf+3E9EH+TGtubVtq++uVEqlDU+9WgKnkuzkl3unEQ+TGWlcOGqHSvgLCOWTIbhbAoRyMxQTRlRISLWmZidYq6fDaI1apfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236038; c=relaxed/simple;
	bh=hDuzax798lLAoTw00xmbPO8biQL3Bx7FRwV7mv4L0A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUFIkIKzXzSV1zNshcuve4pCItCTeTMLKKb0lM/W1SI9r6GeQGps0qhMgxnMlrIeyovyBttFQpQ7SzpCyrrvZoA/WtYC8T52EyhIebemWiKr+YuBbvHzIeUa1CjpssrB1y/lDTMZpldiH+p3anNBSLz4rzuHTmGDRjAe4gDIneM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=mBZZXjV7; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="mBZZXjV7"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-930f4e5eed1so154174485a.2
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787236035; x=1787840835; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6WtOwLAxWd9JV0xL4eCgYozrhrxTZBTtuL9Rwu2zTYA=;
        b=mBZZXjV7Wf9Gx4nDUKqUSBQqtziCaU3Rs71sF39xxOYVPkTveJCZ2hDRBzuSrQpwtG
         EDEIdu1d4+grjttv+g7ZP+CLTNkTqTmW3XvpfqwufGN4jqF94IbeB+o9A6w5EG26LY6k
         PJfHX43LYR9BWN7Uek9i3ng/LVMCeGOYY9s6GRPng9BnEu8UVVFim4RsQhnIS3AQMOdx
         qL/I9PZKu7t2i/b24G3uNTvAhWn47YufJusnz27YTAgIggpP8p9iqV2Q1MJaiGcdAQ/f
         nyuB3NNFuUR43x+q5cSu4LSjjnNLhGhnWsv599P+RjwOOjfsJeZR4Ww6+lOwmzcpOvoa
         oXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236035; x=1787840835;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6WtOwLAxWd9JV0xL4eCgYozrhrxTZBTtuL9Rwu2zTYA=;
        b=o4wRShAoKEkH1wny+/2oIvGZj3YbYoOvzePGnu7DwqHJ3OkxLMy8mAaThO/W+vWo2M
         /Q9ND1GZruyrzLyLvZNzCYuFkkmWiABiJ7R/VMgVFTXSw+Q69fQxT5ZYbIgiDm53Vl0o
         cfds8G+o9I63+8XlGaBmj8bMnbKJxoITBQAPz3Ujj3Mg0on6aC1NHsZBZoXRsZxq538/
         wqu1YLuzqYO3QGm/5x0cCGnckZymPHpqDXkwq+5iAcM5LTRpdzDS6KnBzVLPT0hX7Erh
         q1go/cq+QDiSbzX46RATI7hnHTB9ZEx8G5ovyKWxSAP6cEc1Jlq76C64dIOZGZnXS00y
         /9oA==
X-Forwarded-Encrypted: i=1; AHgh+RpH+QBGZ6vrMvvm4tlzQJXcRlWOdxx6rgiWeWRdAXfaqKFH/hUMOo0oTWPg0zSCjNDwVugeNJfVm3s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv2ET6nZx2ERmO6wQVcaW5jEnBWW2qvFBdOobe5E2V9q6aicT5
	GJ9h8DqZDG4dRd2k1iSwZOU+EysDuOPjt1+R9HikGaULrs2kXpJvZAjfC0eYO75jrA==
X-Gm-Gg: AR+sD11vMw0F6wZsLqehYwE1rCQYtDZOD8W1gS9TaLKBu7PBzK4bGhylwq/e+0tFJhF
	68ylYzYUcXdCc1LIigWOrfs1PDeLsPB3XG2oBAtV0XGFafTiUKQOqUtjCvTTCOny2RWNm9UhiGw
	C2hKo3XUsKyBDz8SdjaJUbH5WcfA/xrH48wPyqYJPNvbHnOFHsHC/Wg8BZUBV7IOv5GOkXHFZXH
	z8vu8TxYFDT0B59j66CzbHXY230yBCSIn1FEjtSz3naCCskA0VkIBfYTV8scC4LlTomrLqBvOCZ
	XbGcEZnSbLpsIhv/nakQXMzVk7juR4bmRT9WIVxGuG0fYO1Sb5u7lYTHmYTTPqr/n/QvmrEy0t1
	eo4PVUKReMhrvn0CL/Rggav9sXMZlN8CW8OOh6JiNtfx4OA692sS5KON7A90wJdx5SnO8sRVG5e
	QwX4HsHG9RQyhwxgX4ECdpwiUWoepz0jRwPl6rQwcc0xOU1U6lrmuDeMktW7vJdy69pwea7ERWa
	Cto1R8=
X-Received: by 2002:a05:620a:458d:b0:92e:9d63:a700 with SMTP id af79cd13be357-9371e20500amr925016585a.9.1787236035215;
        Thu, 20 Aug 2026 07:27:15 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93720595cddsm382561785a.41.2026.08.20.07.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:27:14 -0700 (PDT)
Date: Thu, 20 Aug 2026 10:27:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	syzbot <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com>,
	Vlastimil Babka <vbabka@kernel.org>, apopple@nvidia.com,
	byungchul@sk.com, david@kernel.org, gourry@gourry.net,
	joshua.hahnjy@gmail.com, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, matthew.brost@intel.com, rakie.kim@sk.com,
	syzkaller-bugs@googlegroups.com, ying.huang@linux.alibaba.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
Message-ID: <ffd191a0-17c1-4d23-a072-cdc6c9f7b4e2@rowland.harvard.edu>
References: <6a820ebc.9ebadd4d.20b15e.001b.GAE@google.com>
 <20260816135201.98590b17b526dda8c4ec9105@linux-foundation.org>
 <DKTTMAS94IMH.2C6ERY0ZIVWVZ@nvidia.com>
 <DKTTPHY9SMDO.3R1VBEGOKR95N@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DKTTPHY9SMDO.3R1VBEGOKR95N@nvidia.com>

On Thu, Aug 20, 2026 at 09:59:27AM -0400, Zi Yan wrote:
> +Vlastimil
> 
> On Thu Aug 20, 2026 at 9:55 AM EDT, Zi Yan wrote:
> > On Sun Aug 16, 2026 at 4:52 PM EDT, Andrew Morton wrote:
> >> On Sun, 16 Aug 2026 12:25:48 -0700 syzbot <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com> wrote:
> >>
> >>> Hello,
> >>> 
> >>> syzbot found the following issue on:
> >>> 
> >>> HEAD commit:    3d6d817622b0 Merge tag 'scsi-fixes' of git://git.kernel.or..
> >>> git tree:       upstream
> >>> console output: https://syzkaller.appspot.com/x/log.txt?x=15927479580000
> >>> kernel config:  https://syzkaller.appspot.com/x/.config?x=a59830cba91a1981
> >>> dashboard link: https://syzkaller.appspot.com/bug?extid=805630f1453e490427fa
> >>> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> >>> 
> >>> Unfortunately, I don't have any reproducer for this issue yet.
> >>> 
> >>> Downloadable assets:
> >>> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-3d6d8176.raw.xz
> >>> vmlinux: https://storage.googleapis.com/syzbot-assets/d19e0514c02a/vmlinux-3d6d8176.xz
> >>> kernel image: https://storage.googleapis.com/syzbot-assets/f6da706811f4/bzImage-3d6d8176.xz
> >>> 
> >>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> >>> Reported-by: syzbot+805630f1453e490427fa@syzkaller.appspotmail.com
> >>> 
> >>> gadgetfs: bound to dummy_udc driver
> >>> ------------[ cut here ]------------
> >>> 1
> >>> WARNING: mm/page_alloc.c:5280 at __alloc_frozen_pages_noprof+0x2ce/0x380 mm/page_alloc.c:5280, CPU#0: syz.0.0/5319
> >>
> >> Thanks.  drivers/usb/gadget is the offender.
> >>
> >> Gemini sums it up well.  "ep_write_iter() needs a bounds check prior to
> >> memory allocation".  https://share.gemini.google/5NzjyttO0ULc
> >>
> >> I expect an easy fix would be
> >>
> >> --- a/drivers/usb/gadget/legacy/inode.c~a
> >> +++ a/drivers/usb/gadget/legacy/inode.c
> >> @@ -666,7 +666,7 @@ ep_write_iter(struct kiocb *iocb, struct
> >>  		return -EBADMSG;
> >>  	}
> >>  
> >> -	buf = kmalloc(len, GFP_KERNEL);
> >> +	buf = kmalloc(len, GFP_KERNEL|__GFP_NOWARN);
> >>  	if (unlikely(!buf)) {
> >>  		mutex_unlock(&epdata->lock);
> >>  		return -ENOMEM;
> >>
> >> or do what Gemini said.  Me, I'll add some cc's and run away.
> >
> > Let’s do this instead of suppressing kmalloc WARNs. Since a similar WARN[1]
> > showed up yesterday and that WARN is better handled by a bound check,
> > I do not think we want to lose the WARN from kmalloc/the page allocator.
> >
> > [1] https://lore.kernel.org/all/6a863306.ae6ddae5.3da009.0013.GAE@google.com/

Fair enough.

> > Like the patch below:
> >
> > From 732ea7074854ac3495bbceb274cdd01966118e57 Mon Sep 17 00:00:00 2001
> > From: Zi Yan <ziy@nvidia.com>
> > Date: Thu, 20 Aug 2026 09:19:12 -0400
> > Subject: [PATCH] USB: gadgetfs: do not WARN about excessively large memory
> >  allocations
> >
> > GadgetFS passes an excessively large user input len to kmalloc and kmalloc
> > gives a WARN (see below for details). Suppress it by passing __GFP_NOWARN
> > to kmalloc used by both ep_write_iter() and ep_read_iter(). Follow the same
> > method as commit 4f2629ea67e72 ("USB: usbfs: Don't WARN about excessively
> > large memory allocations").
> >
> > kmalloc is used to allocate physically contiguous memory for kernel
> > allocations. For requests larger than KMALLOC_MAX_CACHE_SIZE, kmalloc uses
> > the page allocator and can only support up to KMALLOC_MAX_SIZE. For request
> > sizes bigger than KMALLOC_MAX_SIZE, the page allocator can emit a WARN
> > because kmalloc allocates an order greater than MAX_PAGE_ORDER.
> >
> > Fixes: b3c466ce5129 ("page allocator: do not sanity check order in the fast path")
> > Reported-by: syzbot+805630f1453e490427fa@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/all/6a820ebc.9ebadd4d.20b15e.001b.GAE@google.com/
> > Tested-by: syzbot+805630f1453e490427fa@syzkaller.appspotmail.com
> > Signed-off-by: Zi Yan <ziy@nvidia.com>
> > Cc: stable@vger.kernel.org
> > ---
> >  drivers/usb/gadget/legacy/inode.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> > index d87a8ab515107..278a0a2b39f4c 100644
> > --- a/drivers/usb/gadget/legacy/inode.c
> > +++ b/drivers/usb/gadget/legacy/inode.c
> > @@ -604,7 +604,7 @@ ep_read_iter(struct kiocb *iocb, struct iov_iter *to)
> >  		return -EBADMSG;
> >  	}
> >  
> > -	buf = kmalloc(len, GFP_KERNEL);
> > +	buf = kmalloc(len, GFP_KERNEL | __GFP_NOWARN);
> >  	if (unlikely(!buf)) {
> >  		mutex_unlock(&epdata->lock);
> >  		return -ENOMEM;
> > @@ -666,7 +666,7 @@ ep_write_iter(struct kiocb *iocb, struct iov_iter *from)
> >  		return -EBADMSG;
> >  	}
> >  
> > -	buf = kmalloc(len, GFP_KERNEL);
> > +	buf = kmalloc(len, GFP_KERNEL | __GFP_NOWARN);
> >  	if (unlikely(!buf)) {
> >  		mutex_unlock(&epdata->lock);
> >  		return -ENOMEM;

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
