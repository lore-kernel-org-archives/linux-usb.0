Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802E0125A0
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 01:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786929330; cv=none; b=pH3zrhGjIV4WZxAZ1/vLralrWx3vR9QqBA32KWG+ehHNU8c96U3AALhSC3P6CV28AIDIKotdkEXEMdxO7gnx8TuOYG0U55GAL1tPSY75b1O1Bm5QJCuDGIVjzsPcQVkVrUr1o76B6x4WpZT4pC7UgMvxYLYDBxOF25Y3vwCDPNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786929330; c=relaxed/simple;
	bh=R6w1glOWZgCbdpz7MSUZH3mTY+lPtpUUBL/R23VWvo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvUIB6AHQmn9Ovv4Z92Pzxrrinhk5dFgZ7FZj+pMTRPYWHoYlg7NyYHdd9eZy3qG/YYDJuhcpGo3rCrZksrpad8xU7Mb3ZknAprSKFeH+3hXHJ91sh3G7a+JPULd3xC8JnSBW5Ux00wqL1aTb7E+RdbNDRjdW7r65dS6r8lqvT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ku1C/KlV; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ku1C/KlV"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5218927884fso28325681cf.3
        for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 18:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786929327; x=1787534127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uTaJ6cDDsOKdUS9+/FHpIpAVWqmJlzOEFqIUeHlYwtQ=;
        b=ku1C/KlVEN6I5cNFpQ7ci+OikwhkCn0V6OKFNXhhgjrSO7a4K2+3mDqiskJGvuIXQJ
         emr91xoFZ3BNlDNiUJLT1+0I9IaOxDV8QaZfmar2wzrdwn1FTgDzJXSCLJeG6pUBTbz/
         yNzCGEO3mTu7QNAbc0Foz8Z+j8LOxWkjGXx4IcfdqWD19h62JmVnPZw3HElsS8l0GI5h
         Ve9Q/8XrLEp+AddTkqcRtkubRyGn0cB5ZDTqyXgwkpwzo19Mc5+mVtYGwBjOQ1pWC/8D
         AfyxVi22GZmlZ5vByGV3z1gvPG5v4t5jcH4f45EKYH/9ZKbJPpp82VnaT1sf18Smv9WY
         SwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786929327; x=1787534127;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTaJ6cDDsOKdUS9+/FHpIpAVWqmJlzOEFqIUeHlYwtQ=;
        b=DMW2vZ/YoEXcModA3qIGdEao7lQKbxkcWFSBbR1HvLlR74mz3b18iuXTMjhfW6IUMr
         dJ1kvr77CQ3hg83joxFnxMzdu4UQfdSvf+EqGiAphoGmNciT8Qjzbr9SE0g2npRsJV81
         p+hg5fH0TFHNyOPtIf6+AZaAuBfs87JYnIz00FVOkLeNE04dgwmGs3/WASx5GLaGwwZJ
         Yw5hvwG42oN3AupSU9HjzzblmtpkIXgPkW42oX3geDeZWdrfMvTlzMvMOdZ11sRuP7J6
         6a1cUdUNz01jz2wE/D6+erPc5oe06AqzDdV8fC2Wlc8h2SbP6aviJ64k3ATUH544S0Jt
         suHg==
X-Forwarded-Encrypted: i=1; AHgh+RpPumawWxA2MeE4VV/BIzUqvGAS+yO1Vfk8CKLbspDGUeJVQKMuXCiaTzZPiWEo9PEiFq1bWvIUhhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRCSHf6qCP8wK0JmTGxfQZggR0Jzgzzkk3j8AJWfwyMWrvlrF2
	Ug6LvSecji7P73wKaOzsnc4saDLlN/VI2gK2TPzvi4r9cBcYiy6LruV606UjFPUwSqq7QHl2VLW
	iZ9QOIQ==
X-Gm-Gg: AR+sD13Uvh1cEovfq3XsNLhKIfCI0DNSUISIzRb6/MXPXJqwyb6sCO06lXalFIil47I
	L9LRrYsc3SBpV5qePKlM1rc4OXmL8qHPI7NAvKsG3h1WacmvOQRss2AwJtOfqh5REfEtLBOYUDH
	kqFtpV6MVrTXHDHl+/eOJitMszVxy49m/WPs00LaHu12D7HqRean1spibwGQsSuaoZJSpqK522T
	sT7YZQNdvQ9UYi0xutYODdr2He3jfcnl7o8m8tISy8pJbPfldjypL1jem1T/PNDwixuAWaHYLG0
	nfTAEIXY54QYXQVI+gsrYYZZ0pzQtoN4X4y8a6aHAS13wW9QyQSQ6LOoMcMgFw2bYcyM4ZOpZ7J
	V3oV8G93PEWPFtaSH4eX16rlyE5ZbJdeYI4VbNueoRS0sWj3SO+eoCsrqfMrQQ7+mGAi5A78CuK
	ehvH/C+mcHAWEgO58/ugSm07RB2Co+CM4kIBs9aTtqdd4Eqgxr5KXdJ8WYYBBW3w==
X-Received: by 2002:a05:622a:8f:b0:51c:f8f:13e with SMTP id d75a77b69052e-52d854ed352mr222577631cf.40.1786929327326;
        Sun, 16 Aug 2026 18:15:27 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db623aed9sm1662031cf.23.2026.08.16.18.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 18:15:26 -0700 (PDT)
Date: Sun, 16 Aug 2026 21:15:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	syzbot <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com>,
	apopple@nvidia.com, byungchul@sk.com, david@kernel.org,
	gourry@gourry.net, joshua.hahnjy@gmail.com,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	matthew.brost@intel.com, rakie.kim@sk.com,
	syzkaller-bugs@googlegroups.com, ying.huang@linux.alibaba.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
Message-ID: <9787b33b-b30e-4c5e-a0ee-7f14515c7166@rowland.harvard.edu>
References: <6a820ebc.9ebadd4d.20b15e.001b.GAE@google.com>
 <20260816135201.98590b17b526dda8c4ec9105@linux-foundation.org>
 <DKQP5QC9XTDJ.3MI016NP0NPFY@nvidia.com>
 <02c2e5c7-0d78-4763-90ff-75fa87105fcb@rowland.harvard.edu>
 <DKQS9ADYVLN1.246LJPQ9QQYVP@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKQS9ADYVLN1.246LJPQ9QQYVP@nvidia.com>

On Sun, Aug 16, 2026 at 08:13:16PM -0400, Zi Yan wrote:
> On Sun Aug 16, 2026 at 7:32 PM EDT, Alan Stern wrote:
> > On Sun, Aug 16, 2026 at 05:47:34PM -0400, Zi Yan wrote:
> >> On Sun Aug 16, 2026 at 4:52 PM EDT, Andrew Morton wrote:
> >> > On Sun, 16 Aug 2026 12:25:48 -0700 syzbot <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com> wrote:
> >> >
> >> >> Hello,
> >> >> 
> >> >> syzbot found the following issue on:
> >> >> 
> >> >> HEAD commit:    3d6d817622b0 Merge tag 'scsi-fixes' of git://git.kernel.or..
> >> >> git tree:       upstream
> >> >> console output: https://syzkaller.appspot.com/x/log.txt?x=15927479580000
> >> >> kernel config:  https://syzkaller.appspot.com/x/.config?x=a59830cba91a1981
> >> >> dashboard link: https://syzkaller.appspot.com/bug?extid=805630f1453e490427fa
> >> >> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> >> >> 
> >> >> Unfortunately, I don't have any reproducer for this issue yet.
> >> >> 
> >> >> Downloadable assets:
> >> >> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-3d6d8176.raw.xz
> >> >> vmlinux: https://storage.googleapis.com/syzbot-assets/d19e0514c02a/vmlinux-3d6d8176.xz
> >> >> kernel image: https://storage.googleapis.com/syzbot-assets/f6da706811f4/bzImage-3d6d8176.xz
> >> >> 
> >> >> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> >> >> Reported-by: syzbot+805630f1453e490427fa@syzkaller.appspotmail.com
> >> >> 
> >> >> gadgetfs: bound to dummy_udc driver
> >> >> ------------[ cut here ]------------
> >> >> 1
> >> >> WARNING: mm/page_alloc.c:5280 at __alloc_frozen_pages_noprof+0x2ce/0x380 mm/page_alloc.c:5280, CPU#0: syz.0.0/5319
> >> >
> >> > Thanks.  drivers/usb/gadget is the offender.
> >> >
> >> > Gemini sums it up well.  "ep_write_iter() needs a bounds check prior to
> >> > memory allocation".  https://share.gemini.google/5NzjyttO0ULc
> >> >
> >> > I expect an easy fix would be
> >> 
> >> Maybe it is better to stop asking kmalloc for unreasonable len:
> >> 
> >> 
> >> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> >> index d87a8ab515107..20905f254968f 100644
> >> --- a/drivers/usb/gadget/legacy/inode.c
> >> +++ b/drivers/usb/gadget/legacy/inode.c
> >> @@ -645,6 +645,9 @@ ep_write_iter(struct kiocb *iocb, struct iov_iter *from)
> >>  	ssize_t value;
> >>  	char *buf;
> >>  
> >> +	if (len > KMALLOC_MAX_SIZE)
> >> +		return -EINVAL;
> >
> > Is there any reason to think that KMALLOC_MAX_SIZE is a good limit?  The 
> > allocation could still fail, and you'd still get a WARNing.
> 
> KMALLOC_MAX_SIZE uses MAX_PAGE_ORDER, anything bigger than that will be
> rejected by page allocator. This warning comes out because of it. This
> if solves the exact issue here.

Are you saying that if len < KMALLOC_MAX_SIZE and the allocation fails, 
the kernel won't WARN?

> > I prefer Andrew's first suggestion.  If the user asks the kernel to copy 
> > too much data, just fail -- with no warning.
> 
> __GFP_WARN gets rid of all other warnings, even if user asks for a
> reasonable size. Why use such a big hammer?

Because on many systems, WARN causes the kernel to crash.  You don't 
want the entire system to crash just because the user asked for more 
memory than was available.

Alan Stern
