Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEBA3793A9
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 03:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022773; cv=none; b=pTp84Rw1ZaYM3ehS1jw6Jjal2/3IAszFGqYz7bW3cjc9h5gKsBueVlCAfe6pUXdDr0Mq5lopxaKigckV1ZTrCZEW7MAUoTzAqVWM/uNBFotC4xaVVDLvEEw/76546NIs869nnqwQAfOpRNdtd5ydkbsuXVOFciYWAwhUlZRH1no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022773; c=relaxed/simple;
	bh=pRlDpVHZI8Qf3SAFb2Px7DVIDVztCoVZcH2Wos7qzjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdfhChftea4UlhdpxrSSt5JC/smDxQe9gCFDig5PXnGltd8MZFp4Wsqqi3nTj8woZ3Wc4k3T0BjUVehC/pyXTm63702sT7A4M+aCqHGFz79o7hJqdjbx/aqs44k2ZxY+2cLZfv1tQvumnbxOChZ/O+c1KhsBb7kifKVbrUJ5zgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BR7tPP/z; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BR7tPP/z"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92edb12cdf2so342010185a.3
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 20:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787022764; x=1787627564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hMP8Ja3+ZNELH3tfUgGHoK2S1Rf6V+67czaj+c/eO7A=;
        b=BR7tPP/z+ztFXylxmlVTeQeQuAN/mPWaytN4looUpb/IQeNHFZfWyQ74aXBDHQDEUn
         2LTWbTQMMdkDi8tkyPBTBxRZEDzojmu2zchiOczcKR78iWuadHz1cSQSGUNxKPhxjf/b
         DR40ruJOZ5LYFNz51LzGs04rIjzsFTq/cW8NXuas7GBa9QfPwzKCeVBc8sA9n9+7Kj50
         /jRCZIuX3mSDtg4/kmt8Qhm6f7xSieQ8ThaGZ2emXI66P9dj902oUD5GxbM/YsOUTyyX
         msrUYEe7B1V9kij8R8OoI7m9TtPeKE88FaXKlyvhHHI0WcCWNZww5kQiUK9H4xegNyC8
         8EHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787022764; x=1787627564;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMP8Ja3+ZNELH3tfUgGHoK2S1Rf6V+67czaj+c/eO7A=;
        b=TS6mMerpTlEI9048IB6AJj2P0bLemjRW0QH+bPGjv7Yzn+tuieTtrUKvJf9HJkMKHW
         lvgKtLpl98hUb2jD5NEq7kY2HQLCZ+Smo37TjEd1FLQ3QHSRqgX9dkizRsN8ds0SGx1C
         Zl858HG7cNcN4IpdZ9KsD/3wRXiTDr3H9uSl0jHwsj0UzzYqyJPU+X4S9P6Pm1OJzOjh
         ddESlkfyYnmyELUAiOaHxWaRp7Oh7Sx8xuDtLpHtYS3QnY8cEX2WzGvn0xTuj686qUdx
         8jNpIPHF9uFA5ZcRuFLEVwNpzXW5yW8ZwbToeUzhcqQ9sWrMzhiXbyy8Pssxy1DgnCA5
         dKJg==
X-Forwarded-Encrypted: i=1; AHgh+RrriomBFnThqyM8mcssFkw0VVuzZm1pfVLt7lsSR2N68b7ON8PZzu4A9siD754XHprD/HVxQqNENSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG6g2+ccgJwPSCGadbXnIDd9P6RAory3RFQEwIiWL4z8v3eZqR
	+uBvuWpKlygNufePjVpobs7eqemryz3ak6zckzY+PJqVC27kO6a3U7J6yrlfHH5yMQ==
X-Gm-Gg: AR+sD11qDBcWi8PkTZvt+QhaL53fBPlnUqiar7fl4rr02evsV2k98GdW1gY/gd8nUn9
	BbVfPzxUc+V7CMXPXQL/ufU043eoD3IohuwpmEv+KH3urFd+2AQqgu38Tv+X0XGn5xAO5TUlG5R
	MBwC4RSbvVQ7S09IO3GSj5OZuQk0Et1XtdgF+YotinqgTfL0AwLS5ZZS/Lyw1lDafjRUM8Eddjg
	3BM8GzUeq8GUcqcSU82XitUFCvrUni0d1FklBe1pp8Jx5oSoAAChEj+jREpfbLZ81nJ++wHYg97
	2CHd32zy74dUljirazkX362eaYNTs4eNbvs5xYhP9GSYy78OE3pI+r9KaXDf6+KeTAgmhFo0Yn8
	GFF9Oyvb7Z75l4qXA9QUOMTA8BeulVv9Vt4HxIJowFlyi+Fp2f6jYb8Q1CCaDaxX1MGONuqooGe
	vJEU/SgVa2FWffsTLDPTxE1HN2MUN47Hqo4Rbv2j9TNLawyNqs/MJPTXR/ZJJ73w==
X-Received: by 2002:a05:620a:a1d4:b0:936:9db3:b82 with SMTP id af79cd13be357-936d22e9eafmr2865871585a.31.1787022763675;
        Mon, 17 Aug 2026 20:12:43 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937033cf47asm191170785a.26.2026.08.17.20.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:12:43 -0700 (PDT)
Date: Mon, 17 Aug 2026 23:12:39 -0400
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
Message-ID: <15b086cc-7f10-4766-9b0c-88c3302e7398@rowland.harvard.edu>
References: <9787b33b-b30e-4c5e-a0ee-7f14515c7166@rowland.harvard.edu>
 <DKQU9SQUIKDR.2KEZZPONJ1IJ7@nvidia.com>
 <20260816194213.0e813ed338144ebc81ed4050@linux-foundation.org>
 <472add4b-f16a-4b87-bbc3-98c8aa385cf5@rowland.harvard.edu>
 <EDCC14FA-F7D8-4F72-B780-37D09E26D16C@nvidia.com>
 <EECC6FB3-7559-4D22-B9DA-33E30E5EC181@nvidia.com>
 <7deabd9c-04d5-4a45-8b8a-39929c046152@rowland.harvard.edu>
 <A2BA0883-6B5D-4AB1-A7CF-6B9BDF27F439@nvidia.com>
 <2bf01548-723c-465d-8368-247a814f61eb@rowland.harvard.edu>
 <6FC11E12-9428-4975-B135-E24805C2D9BF@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6FC11E12-9428-4975-B135-E24805C2D9BF@nvidia.com>

On Mon, Aug 17, 2026 at 02:45:19PM -0400, Zi Yan wrote:
> On 17 Aug 2026, at 11:37, Alan Stern wrote:
> >>> Regardless, if it is important to let kernel developers know that their
> >>> code is doing something wrong, why not make the WARN conditional on
> >>> CONFIG_EXPERT or something similar?  In other words, prevent it from
> >>> crashing production systems.
> >
> > You didn't respond to this.
> 
> I do not get your argument here. Why does this WARN need to be conditional
> on CONFIG_EXPERT? What makes it special? Or you mean you want all WARNs
> to be conditional CONFIG_EXPERT?

This may be a moot point now, but I'll answer the questions anyway.

This WARN should be conditional on something indicating that the kernel 
is meant for testing rather than production (not necessarily 
CONFIG_EXPERT but something like it) because it does not indicate that 
an operation has failed badly enough to leave the kernel in a 
dangerously unstable state.  Rather, it indicates that a programmer has 
tried to do something that can't possibly succeed.  The result should 
not be dangerous because the caller should always check kmalloc()'s 
return value.  If the caller is unable to recover from a memory 
allocation failure then it is the caller's responsibility to WARN, not 
kmalloc()'s.

The same is true for all other WARN statements.  If they merely indicate 
a programming infelicity and not a dangerous failure then they should 
not fire in production kernels.

Alan Stern
