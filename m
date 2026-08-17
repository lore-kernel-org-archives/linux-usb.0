Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A58E2F1FDF
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786981059; cv=none; b=t+0vhzTQhkSNkgcZEPWu43LRpHQQIJbYSHzlVBHeOuEAUbQdvIhl1pBv2nTVz1xi+HYNPzPbFSW3CnSN7zh8gcBKCQjxjz957A0ehH3x4LtPKE0pwIg9Ui0qoO2Rup6OgJIBFF1FLbkAFvcoGi8oXYAaz1Fn8Ki5onrNEUzZzj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786981059; c=relaxed/simple;
	bh=y00OH/k6isPu7S1CKVMJFjc4kiKrBk4/wIFrAzstCDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laII0BC4Xi8NAjuFQeOkcZgseIzNfs8afqc6lR9lBNggNpS+dBqPRIzx+9onwLI4DKmUA5/HYdvGRrV8L5Je0XAxYhBMXBoGwpatt9G5B7KFNgPwl+O6+LpEgMPz7EkwHWwZMwq5W1dleWLslBWUkxP7xfUUBh0rKIdtLUw/obY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=GkjzwRMl; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="GkjzwRMl"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e65e18969so861785a.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 08:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786981057; x=1787585857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zvtwet2mmperbd15jKuLJ2cEJWb4hiwaUW/F5C2XVJA=;
        b=GkjzwRMlKcjAQFlQOW5fM1WlKrsVYfral+7bRQf8yD+0Vvymo8IoFug7lX79TUnMud
         PbXamhAnlkKpeAE47y0kQe1Tk4L7P87A+1rom+kY+xnit3SFNsHw4a+MUmdrd/a92KKK
         HBFzYDlH/QrVFK0nOGmufqN8Aq/9J6QlhQD4n4KHGDfp1unQRXaCeq+/6Qr3a9j7mqUS
         mLzCf8cisFmOXK2Gbloo3tE45GJNp7LwVePRp7iv7jEMnvqjFDM9XxJlAsE1O/5K7Z+d
         MFbIGKaMDjljzD0w59ai8saJDlYCkGshgus6QFJtuJTLTwWWQWYprgTj/Wpw0KpFGr61
         5fUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786981057; x=1787585857;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zvtwet2mmperbd15jKuLJ2cEJWb4hiwaUW/F5C2XVJA=;
        b=JYJA+snDTWWWOgkDAAv1hwDW4XgTj1pC1YC0dPH2wPrmiBtBdIKDWT/IqcW/4B5IOp
         trQ7Ey7HbcwlV5TWGlHtlltP4J3CkvlJXcd4MXqOZlVTEKfiBbajEImhf87MnEMuKwBf
         0G6V5o3HTCTfCBi/RUkpD9NSXRCv89R9/8bHcyVfENPLm11EdtZXb5weMw2zLyda5Ygw
         MjOCYPDZf8LZhaCZwFNjAYBkrIs3bwfnDspsloHwyjXK7IuCOHgjcmCMM/RFYLuaCHj8
         XDE52rc04wITMlo9URocJkP9+2jrxrPps768ZBb2dhrFXMzn5lGSaXm5xIMEBOcBPpQJ
         Bivw==
X-Forwarded-Encrypted: i=1; AHgh+RorP5JJBY1u1ExDJ0QU/1TltwnpoUattZQlBOahEz1UWAZAyO27IB1zue8nb4+PRxOR/napo7RvRE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfSuTTywyT6CCdRabS/G0OKfZIsI2v6sZa4zyUSOFj7KXuSvJe
	7Hnr2pfAXKOEb5tYyIC6JDuMZI2TjHyb8xyt6dSrklb7Ny1KW07yyVGux8YQZxpeYQ==
X-Gm-Gg: AR+sD13se5Ja/ZdjAmNgdUwb4Q7WE6i/QlNeslqlOWmDLw9eqooRqCFdgrzlUp6/anV
	TquQEgJW2qF0vQ2hbFxymbZKD+2JHcfN7souyQ/qHdMV9NBXQlD9sWFh6tbqnmRxBJBF6m6PN2I
	UCkveYpDnUEXmBw5Ju5Vr+47ywx4RsoqY9lBRHImD1ZLCVgadvvowgRIHR40i2RYIx7jCMQVzgi
	mgJSrLiZLIujUnLTBrUHRHRXgwGausMUZvDwZoRINoY7zfGMEA+xtTunuJ7Qorm3yW7GUeD+UjF
	1K0iK1Cmf6J0RfFqW1yfWqBuwS/6AyKgkHzVhgJ6p9gJxvvRrHrmkCMG17GZdu4pmTuQc7ITr3E
	+ld1rLf2W1LiQ6WX6Dj8BWGssCEtrk87T40LYXndLBx3DWU+Dgnqaatllq8K9vw/YBiDshcx+tc
	2/SAKDmHtFRxem3yJESvJSf9vz+cjQMhsrjD2YXJ17M5fYU/PKWB+GN3LfZ5dzWrt+c4S6Vmhu0
	toMipYjgahXG5UOqzxi898chnsOR0nz
X-Received: by 2002:a05:620a:8084:b0:929:f78f:6bf9 with SMTP id af79cd13be357-93706624b9cmr2264085a.16.1786981057302;
        Mon, 17 Aug 2026 08:37:37 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937010c3304sm111069285a.5.2026.08.17.08.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:37:36 -0700 (PDT)
Date: Mon, 17 Aug 2026 11:37:34 -0400
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
	linux-usb@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
Message-ID: <2bf01548-723c-465d-8368-247a814f61eb@rowland.harvard.edu>
References: <02c2e5c7-0d78-4763-90ff-75fa87105fcb@rowland.harvard.edu>
 <DKQS9ADYVLN1.246LJPQ9QQYVP@nvidia.com>
 <9787b33b-b30e-4c5e-a0ee-7f14515c7166@rowland.harvard.edu>
 <DKQU9SQUIKDR.2KEZZPONJ1IJ7@nvidia.com>
 <20260816194213.0e813ed338144ebc81ed4050@linux-foundation.org>
 <472add4b-f16a-4b87-bbc3-98c8aa385cf5@rowland.harvard.edu>
 <EDCC14FA-F7D8-4F72-B780-37D09E26D16C@nvidia.com>
 <EECC6FB3-7559-4D22-B9DA-33E30E5EC181@nvidia.com>
 <7deabd9c-04d5-4a45-8b8a-39929c046152@rowland.harvard.edu>
 <A2BA0883-6B5D-4AB1-A7CF-6B9BDF27F439@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A2BA0883-6B5D-4AB1-A7CF-6B9BDF27F439@nvidia.com>

On Mon, Aug 17, 2026 at 11:22:47AM -0400, Zi Yan wrote:
> > Again, I disagree with some of the details of this argument in this
> > context.  For instance, if all kernel developers are supposed to know
> > that they shouldn't ask kmalloc() for more than MAX_PAGE_ORDER at the
> > risk of provoking a WARN, if this is such an important restriction, then
> > shouldn't this requirement be mentioned in the kerneldoc for kmalloc()?
> 
> 
> kmalloc is the normal method of allocating memory
> for objects smaller than page size in the kernel.

This means when you are allocating small objects, kmalloc is the normal 
way to do it.  It says nothing about what you should do when allocating 
large objects.

In particular, it doesn't say that if you ask kmalloc for more than 4 MB 
of memory, your system is likely to crash.

> See https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/slab.h?h=v7.2#n1001
> 
> In this case, kmalloc is used to request > 4MB memory.
> 
> >
> > Regardless, if it is important to let kernel developers know that their
> > code is doing something wrong, why not make the WARN conditional on
> > CONFIG_EXPERT or something similar?  In other words, prevent it from
> > crashing production systems.

You didn't respond to this.

Alan Stern
