Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D544D34A794
	for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 01:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787103012; cv=none; b=rGSNNx8HSqG24Hj1zay1sdiYdiOX+k7eM2ZbqwP6SubKqchFpE3TPLK+w4uXqEjFGLtqCIgK8mQe+P86E5oRFN+HS44daBJzX2yftxQtSOV8XgrN8P+3XaVDzFc2Zm8QQ1mlsbvXH7YJAJK+wFwfyoIan18QtnhyCqZHtKo8PnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787103012; c=relaxed/simple;
	bh=kIpCYSa6KIRZoVAecMSsPsTCIkgUczX3X6QWFI7vDno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T239L1hPqLmfpGak1XnHIZpbdljDIn4iivBLuC/X1U3VS+xTLSj700+p0PE+eE/MPZnKB3hWD9Tlwrpetvh+/O908VFGXHG1xMxdIkYfCakmJPPDEMWbiIbUYmRERmfGQCo4UH4TBOWkS2hMMzbCDEhzP+MN2bTd4/Ouy/RneLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=HHhZTiYT; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="HHhZTiYT"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9309d4ea213so49253385a.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 18:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787103010; x=1787707810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J+ygC0wNxl2Z31GJ1PcaOL53f5ivFqBoZjXQriFfAg0=;
        b=HHhZTiYTbzZZZj1N1/sczPHc3MxjI64wZ9UArhjyoQkP9h8jLXnsZYfrvlX9eZsmVO
         VvUzVhBETuAmlw3fd6g5FGli4Xk1g3q30joVQFUGngrdsZY8d99PbR6hQlHjRZ1GDOg7
         mzPoMHolJ1hMmjdM4cE0f8X/jSd0CnLPiMQ5chLT3r0oA/CANOaMtY1De83qXIH9GVpI
         Mg0wFOcWzSyKDnoK3d6JwDqBti+sNOdHS8+PTw1T1tBAy4sJfJIVX+bA4XdCoOSk55pb
         ujvrfwiGABoD3efC8ykaPTeklPnNQtWxZ8LhxPIGBXGleu3EA81Bl3snq35nV9xxhHwb
         CW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787103010; x=1787707810;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+ygC0wNxl2Z31GJ1PcaOL53f5ivFqBoZjXQriFfAg0=;
        b=Q3f93YIH1jFUXaMYYJKO3vh0UXBbYtdek+Ecwg1ADmCACC7XqBaDLTGEIyRVQ6nMhL
         uY0AIC660TZRhK27OqBUvGM/e1SW0G44w4DiSlSM4fKYjPvhDumKubQecCqvMzkV95p4
         xN8AIjswbD1lQ1SzPobfqgRBDJHinfPOHkOzHD1HVsTwOfge95Lc4HjC3TgHkmA8ZDYt
         U8d6C9N65E7R/C5wOJzdBhl6kq7uZ3KqOx8Eo4UO4zebWFsdrYQpqgeS1bjtKyv28yIp
         7IFWv5N697mhseUEIGCXb4TqkAVc37b2LuH68nV5g8uc+kKuE6riL9IIjVZNZKeQ17zc
         8IWA==
X-Forwarded-Encrypted: i=1; AHgh+RoI076UmVjM2q0OoTK2CwCARxXwCrpKxo9hy9vO21XBU+rbOXyuPHK1dO3XLHZfo2jDY+ZUQukKy+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw2LYZ+d7zG+Ym23D/rdvBfweEkaQuDls0jL6FtxHpdkVN/tpE
	vHINsyGBq/0zM5s0C/QNyGce4XEkOKCEd+0JV3oNz5ayB8nw8QqFL6A0b+5vwIrciQ==
X-Gm-Gg: AR+sD11Uyg8AmUmyqVKBKajxHFFyF1/Pd8FIl9qxbk0XH9bai5Q1Q1bDeDUMdEoAEBk
	2qVP7AzKg4e5IqwdvT3UZeXxV/YniMok9Oqhy/4TvxXTvzg1tGVJv1L9/Jvg+ys6VHQOrp9Uhso
	MMyLxlLbx59E0XzAhJwC7lbCrr2qJqCBkevd9zU2gdexZm3JLfK7MNNA6ieXVMNAXw2JarU0OFr
	KOqyni+r8K3lGBZP++p20dCgvu2rPH9STHNub3G8JD57+ou7Y3AuOYzJ+Ks4P/S11q5PFZJWoZl
	APplClcItN+VItHGELtV9AcPyuc2DoVWXqSDYcc8CPQfhBq9B+T0U89RzlxlkSbAotFpGVL91Fu
	I5kAuGMxeyxtIBz/ys4TowUmZgqyEGZYEBJOZ+w98zOnfjSb0Q2Rp3NGwCxrisBUoLGun4ge6UK
	KV1AmEAa0m7S1l8QxCbzpnfezbAjr113P5VeEgn3kw1H4TGmw0aoE6hwPfeb3SGQ==
X-Received: by 2002:a05:620a:4048:b0:92e:db54:a2aa with SMTP id af79cd13be357-9371e1f7a69mr163751085a.3.1787103008591;
        Tue, 18 Aug 2026 18:30:08 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93720584d5dsm25685585a.36.2026.08.18.18.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 18:30:07 -0700 (PDT)
Date: Tue, 18 Aug 2026 21:30:04 -0400
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
Message-ID: <b31f8a14-1488-4405-8196-504e82557ed6@rowland.harvard.edu>
References: <20260816194213.0e813ed338144ebc81ed4050@linux-foundation.org>
 <472add4b-f16a-4b87-bbc3-98c8aa385cf5@rowland.harvard.edu>
 <EDCC14FA-F7D8-4F72-B780-37D09E26D16C@nvidia.com>
 <EECC6FB3-7559-4D22-B9DA-33E30E5EC181@nvidia.com>
 <7deabd9c-04d5-4a45-8b8a-39929c046152@rowland.harvard.edu>
 <A2BA0883-6B5D-4AB1-A7CF-6B9BDF27F439@nvidia.com>
 <2bf01548-723c-465d-8368-247a814f61eb@rowland.harvard.edu>
 <6FC11E12-9428-4975-B135-E24805C2D9BF@nvidia.com>
 <15b086cc-7f10-4766-9b0c-88c3302e7398@rowland.harvard.edu>
 <DKSGX4MUL58E.1QQZGHROS8EPS@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKSGX4MUL58E.1QQZGHROS8EPS@nvidia.com>

On Tue, Aug 18, 2026 at 07:45:31PM -0400, Zi Yan wrote:
> On Mon Aug 17, 2026 at 11:12 PM EDT, Alan Stern wrote:
> > This WARN should be conditional on something indicating that the kernel 
> > is meant for testing rather than production (not necessarily 
> > CONFIG_EXPERT but something like it) because it does not indicate that 
> > an operation has failed badly enough to leave the kernel in a 
> > dangerously unstable state.  Rather, it indicates that a programmer has 
> > tried to do something that can't possibly succeed.  The result should 
> > not be dangerous because the caller should always check kmalloc()'s 
> > return value.  If the caller is unable to recover from a memory 
> > allocation failure then it is the caller's responsibility to WARN, not 
> > kmalloc()'s.
> 
> I agree with you that this situation, kmalloc cannot satisfy the
> too-large-to-allocate request, is not fatal and is recoverable since the
> caller handles NULL result. But without the warning, some callers have
> no way to know if they are sending an unexpected/undesirable request
> that might come from a bug in their code. With the patch, kmalloc
> returning NULL means two ambiguous things: 1. the request cannot be
> satisfied due to current memory system condition, e.g., insufficient
> free memory; 2. the request itself is unreasonable/unexpected. It could
> make debugging harder.

That's exactly why the WARN should remain enabled in testing/development 
kernels.  Just not in production kernels.

> > The same is true for all other WARN statements.  If they merely indicate 
> > a programming infelicity and not a dangerous failure then they should 
> > not fire in production kernels.
> 
> It is hard to tell whether a condition is dangerous or not. A caller
> sending a too-large-to-allocate request can come from a miscalculation
> or a wrong user input. It can also come from some data
> corruption/overwrite, clobbering the request size itself.

Certainly.  But the mm subsystem can't tell which of these is the case; 
it _has_ to leave the decision of how to handle the failure up to the 
caller.

Alan Stern
