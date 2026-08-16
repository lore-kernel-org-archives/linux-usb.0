Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC37036A35C
	for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 23:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786923140; cv=none; b=FLAaS9bBWsGJ/tnkb2xulTFn3SvpslwuKRrIK7m/ePe6IhcMORiSCMOoEUaYnu6ktfEtYGrvqVxX65z+w9AdJ8Fg446M3gqwImJ8s82XNObE36rLR8SokP5EtY0yJsoEcrMzoMOBchbA750BLby6Zg2HqIBz/x1BvOQFU3aH7lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786923140; c=relaxed/simple;
	bh=reTFMbdkq+lZ/iEzv6ZNkxXctSdjmsEoiDTX0+6ssZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8YhtEk6vXkssg6UY2pyRBrSy46gxwFZeZIpHFtRtIxCbyvZ/SG8cOw3VXredSGKewuKHRYZ92GhsF9a0KZvIrZUTgc+U7f0+NpasLLP2UrUT33/sqUiY2TYDieoCmRBseym4J0kfwzTmd6UaZR9Moa4wuNmztZyum6GmyGjA5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=TEQ2zm7r; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="TEQ2zm7r"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c2a76536bso27820331cf.1
        for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 16:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786923136; x=1787527936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BioqsUd1GnS7GvqtNJ5JnjYlksYkVofgrlCf+OKGs8k=;
        b=TEQ2zm7rD1gNZOd8Mb40y4c+T4H1DJE07tRBCBv/A/sgEw+4DwVYmbBqrRgSyWMAfA
         LcmNnwDVMmOTinA1E3UJ6XOEWiE3bRRGqrLOvlDkkRe+QAVLXusYuHOR6YtvnicjTr0D
         SloQsHwsuXTjychZDunyMSU1YTICxVaMcKkkvwaRS7PjA9HpNTKh3DUB5aA0jy4WEmMl
         QQBK4pTnZRjBlBfcJ+tIt3emjbM1vC8PTRiAWHou9FlK9qPdbl4hT/yZQS+RTtxyZJ+p
         7tTYIgVdidkup8YGh8oYvTK0rLgufje6gR7AiyfPqkx1xZS60acc1BG9BCzQUtEg/pCz
         Htkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786923136; x=1787527936;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BioqsUd1GnS7GvqtNJ5JnjYlksYkVofgrlCf+OKGs8k=;
        b=hxPR3MbQ9To9Pu6NUijcLVEjs6GCGosrRFcNun025HZcYbYmtqftQ2R34S0IDM2Qbw
         Tp+/WVYNPpkFlt8aBTz7cVXlmsBxfKbQe4mGBoBjLjNis2z6NgmeiDXwQkLrY4lizHG2
         7lB//wRs6utXb41S6YKjZ/mqeGavZ+dZXh4oxnAuPK/NOFaoF3nRZypP6H8DgEJA79mZ
         MEpMQtCXTcO7eH8LN9AUpNWZKX2X8RgrsjFAJxKlOMHcjBYWYYMx0zmHPbDVkuRbOWcm
         7/Fn7S/4NRB0BDChLDv/U+AfBySMfNB4uCOjecJSb/dNuoQlr2DBeFbboYcvabpNGCUW
         87eQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEPIELpMt9rt74yy8Ms9VJTFgkkweNsdbKV4HFJQCIrYDnntLetOFiO6W2w3vI+uFtAvO96x4HCv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRFGbkedojhSraDw532TgelB4QUcYlsgunWrKY6R6QMPYKg+gq
	GUL1Qcp9/JbB1vyQPBUqWkVtyXlmP4/bGWlQZD2zXEiGJKth5BDFRLiknie3YccZoA==
X-Gm-Gg: AR+sD12cl0GXcz9GhEOtgI+OyAYoOlD7+BMF3pzFfF2BW5/I5peJpC2BiI3j0UBZOx4
	1yld/mVL+LQhGXurma5ryLJnn43nSn0KVjWfK+ogqBn/oOg+wjkYHxCk33iDOfa486Vz5O+U0En
	G+HWqMZ3qDVBtFXj52vF6sUxFfPsDjmYuEunjyD6SkxR/kEz55iD2ns78a/YWO9v/zG1iWcjZkK
	5t795paI8xEImQ9Ef+Me2IbSOydeRMe2Cvt4vl3NTN8W/xcCSJeVIR/Xg92PWI4inmuA3LhQ+Yj
	8ERF8YRxXHs7F74z9lVgfnF5zo3cjpCt1BgB4V9QX13Sv607laJJosq3MbqGRkRwC5pV+4o5y21
	aKB6ILhx7E/ImtzF9jbYv92lAD4p+lC+FQVmOBPPyv84cXzJ0AaTDgF9qhfLTOr9UhdOLibYase
	ej/STSWyKoc32YSR06x7OeTcSKDEWbBWe1kPd+KedZjjjgKCnCDoe8eTv9e3iZlg==
X-Received: by 2002:a05:622a:292:b0:517:6d82:ceff with SMTP id d75a77b69052e-52d853cbab0mr225176651cf.13.1786923135671;
        Sun, 16 Aug 2026 16:32:15 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a9350678esm68674476d6.26.2026.08.16.16.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 16:32:15 -0700 (PDT)
Date: Sun, 16 Aug 2026 19:32:12 -0400
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
Message-ID: <02c2e5c7-0d78-4763-90ff-75fa87105fcb@rowland.harvard.edu>
References: <6a820ebc.9ebadd4d.20b15e.001b.GAE@google.com>
 <20260816135201.98590b17b526dda8c4ec9105@linux-foundation.org>
 <DKQP5QC9XTDJ.3MI016NP0NPFY@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKQP5QC9XTDJ.3MI016NP0NPFY@nvidia.com>

On Sun, Aug 16, 2026 at 05:47:34PM -0400, Zi Yan wrote:
> On Sun Aug 16, 2026 at 4:52 PM EDT, Andrew Morton wrote:
> > On Sun, 16 Aug 2026 12:25:48 -0700 syzbot <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com> wrote:
> >
> >> Hello,
> >> 
> >> syzbot found the following issue on:
> >> 
> >> HEAD commit:    3d6d817622b0 Merge tag 'scsi-fixes' of git://git.kernel.or..
> >> git tree:       upstream
> >> console output: https://syzkaller.appspot.com/x/log.txt?x=15927479580000
> >> kernel config:  https://syzkaller.appspot.com/x/.config?x=a59830cba91a1981
> >> dashboard link: https://syzkaller.appspot.com/bug?extid=805630f1453e490427fa
> >> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> >> 
> >> Unfortunately, I don't have any reproducer for this issue yet.
> >> 
> >> Downloadable assets:
> >> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-3d6d8176.raw.xz
> >> vmlinux: https://storage.googleapis.com/syzbot-assets/d19e0514c02a/vmlinux-3d6d8176.xz
> >> kernel image: https://storage.googleapis.com/syzbot-assets/f6da706811f4/bzImage-3d6d8176.xz
> >> 
> >> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> >> Reported-by: syzbot+805630f1453e490427fa@syzkaller.appspotmail.com
> >> 
> >> gadgetfs: bound to dummy_udc driver
> >> ------------[ cut here ]------------
> >> 1
> >> WARNING: mm/page_alloc.c:5280 at __alloc_frozen_pages_noprof+0x2ce/0x380 mm/page_alloc.c:5280, CPU#0: syz.0.0/5319
> >
> > Thanks.  drivers/usb/gadget is the offender.
> >
> > Gemini sums it up well.  "ep_write_iter() needs a bounds check prior to
> > memory allocation".  https://share.gemini.google/5NzjyttO0ULc
> >
> > I expect an easy fix would be
> 
> Maybe it is better to stop asking kmalloc for unreasonable len:
> 
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index d87a8ab515107..20905f254968f 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -645,6 +645,9 @@ ep_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  	ssize_t value;
>  	char *buf;
>  
> +	if (len > KMALLOC_MAX_SIZE)
> +		return -EINVAL;

Is there any reason to think that KMALLOC_MAX_SIZE is a good limit?  The 
allocation could still fail, and you'd still get a WARNing.

I prefer Andrew's first suggestion.  If the user asks the kernel to copy 
too much data, just fail -- with no warning.

Alan Stern
