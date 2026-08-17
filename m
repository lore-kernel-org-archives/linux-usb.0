Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768583A961E;
	Mon, 17 Aug 2026 15:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982128; cv=none; b=T9UqlPzJjQTMH8hxjNHiOp9R9iEjRsnaCLdHCkkUoNFzIyzbKufS16DR/CVN5wqxjxbGgvcZQlqGRdio4SPDM1Za+xoKLZDpWDQkvRo3coARY21txMFEMS5E7mDHuiqwML620QSEQZ32aM17ZTUV0z2MBcr4Cjl/DcoEUtkvwII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982128; c=relaxed/simple;
	bh=p32xiKrDtW8F/Gbiux8EJFaxUwldiTxSt+RYtRmg8E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRJwe0JnE6r9QKcnUscxckGwoJtqZybeCAOKKY6OlJKh5E2/W2QP4RLYKYqdjv8R2ChZ2cfau+hOeCpnlpPXwPvqFhYu6UEdsMlLWaHtDc0aUsmAGeRgWCF1sPlHah1YDKPk2dWm+S5B56DlWCSNs1pHPZbQauW1I0r8iYXGv9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ri+cHTNf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ri+cHTNf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F2F1F000E9;
	Mon, 17 Aug 2026 15:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786982127;
	bh=48TIkL8sUSQum4wB/ysMBVLF/EysIA6sIeFfAUMacVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ri+cHTNf8pTkaYcu8jGgme42oh1ywbHOIQl3X9aABqkYRkrf9HMT5pIRLwUApQcR6
	 vNND6mO3wBrwnghWLHdvMfK9SOQbrAhy9TZ0LFGau0B9QDnO7wDvUhr1I7HKpOxqKY
	 3Y9NQwUxiwwqdV+E74TPz5Nr4/3npBUTt7Qj67t8=
Date: Mon, 17 Aug 2026 17:55:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	syzbot <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com>,
	apopple@nvidia.com, byungchul@sk.com, david@kernel.org,
	gourry@gourry.net, joshua.hahnjy@gmail.com,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	matthew.brost@intel.com, rakie.kim@sk.com,
	syzkaller-bugs@googlegroups.com, ying.huang@linux.alibaba.com,
	linux-usb@vger.kernel.org
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
Message-ID: <2026081732-unaltered-regime-f91f@gregkh>
References: <DKQP5QC9XTDJ.3MI016NP0NPFY@nvidia.com>
 <02c2e5c7-0d78-4763-90ff-75fa87105fcb@rowland.harvard.edu>
 <DKQS9ADYVLN1.246LJPQ9QQYVP@nvidia.com>
 <9787b33b-b30e-4c5e-a0ee-7f14515c7166@rowland.harvard.edu>
 <DKQU9SQUIKDR.2KEZZPONJ1IJ7@nvidia.com>
 <20260816194213.0e813ed338144ebc81ed4050@linux-foundation.org>
 <472add4b-f16a-4b87-bbc3-98c8aa385cf5@rowland.harvard.edu>
 <EDCC14FA-F7D8-4F72-B780-37D09E26D16C@nvidia.com>
 <2026081745-unshaken-retread-d744@gregkh>
 <1ED81A86-22F2-415A-8CC0-7E9B4A4446C2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ED81A86-22F2-415A-8CC0-7E9B4A4446C2@nvidia.com>

On Mon, Aug 17, 2026 at 11:19:23AM -0400, Zi Yan wrote:
> On 17 Aug 2026, at 11:06, Greg Kroah-Hartman wrote:
> 
> > On Mon, Aug 17, 2026 at 10:34:26AM -0400, Zi Yan wrote:
> >> On 17 Aug 2026, at 9:55, Alan Stern wrote:
> >>
> >>> On Sun, Aug 16, 2026 at 07:42:13PM -0700, Andrew Morton wrote:
> >>>> On Sun, 16 Aug 2026 21:47:58 -0400 "Zi Yan" <ziy@nvidia.com> wrote:
> >>>>
> >>>>>>
> >>>>>>>> I prefer Andrew's first suggestion.  If the user asks the kernel to copy
> >>>>>>>> too much data, just fail -- with no warning.
> >>>>>>>
> >>>>>>> __GFP_WARN gets rid of all other warnings, even if user asks for a
> >>>>>>> reasonable size. Why use such a big hammer?
> >>>>>>
> >>>>>> Because on many systems, WARN causes the kernel to crash.  You don't
> >>>>>> want the entire system to crash just because the user asked for more
> >>>>>> memory than was available.
> >>>>>
> >>>>> User asking for more memory that what is available is pretty common and
> >>>>> should not trigger a WARN or crash, unless you have panic_on_oom set.
> >>>>
> >>>> I assume Alan is referring to panic_on_warn.
> >>>
> >>> Yes.
> >>
> >> Right. That is why I said “unless you have panic_on_oom set”. So panic_on_warn
> >> will not crash the kernel if user asks for more memory than what is available.
> >
> > Are you sure?  It kicks off syzbot, what prevents the oops from
> > happening if panic_on_warn is enabled and a warning like this happens?
> > Am I missing some code somewhere?
> 
> usb’s inode.c uses kmalloc to allocate > order 10 memory, namely >4MB. This
> caused the warning.
> 
> kmalloc’s doc says:
> 
> kmalloc is the normal method of allocating memory
> for objects smaller than page size in the kernel.
> 
> Shouldn’t usb inode.c use a proper memory allocation API?

Normally this function will be making >4MB allocations, as that's what
USB devices do.  But if a malicious userspace were to ask for more,
well, that's what we are now discussing.

This isn't the "normal" case, it's a "bad user, so what do we do to fix
it" case.

We can bound it by some magic value, or we can let the allocation fail
like normal but just not cause a WARN message.  That's the two potential
solutions here.

thanks,

greg k-h
