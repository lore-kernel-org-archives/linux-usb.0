Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABEE304BB3;
	Mon, 17 Aug 2026 15:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979190; cv=none; b=MJC8lM+vkPzrKyOZvZh8nJiM9oYBjOdnMuLu6pzdWmc5k5/0Ev3sEC8dmyvKU3SCYgLIOzTgoJPn8C6iMDqCoCpnR3W71xnD6qCZobXR/ogLFNT4MMrGV/rA1XbZ40qWqYUawsgMDo04m9SuN0aB/UyFWbYPEiJdW3yb7mHXJqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979190; c=relaxed/simple;
	bh=FKvPb0JO0LovZDou7yakBIMA6w52AzNRAX4cT5ulIoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VABe0u/lPnB0PR7X8SJpMIwYJR//Bce3Up+J4zQWgtNVee5vX8o8oU+BS/VygfJcmrJjgnfoQumB67ZKnOwHjOBLxlLlNQZkgN7sRh4fih9LZMVJqA3odSIXPCzyqwg6WNrMOsesU0uZ8veMLNAY/g8WJor1GimIroZDleal9aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=isZd5Nbo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="isZd5Nbo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9CC1F000E9;
	Mon, 17 Aug 2026 15:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786979189;
	bh=htBZK+/e+FmhBk0msQ5WNa9+9hWof0l6pn5iLqOk5Ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=isZd5NboYbWJoU3x/9sedVKgBjPitdEST8EQDu3relYKPFz72YZ23AAREzTURngEU
	 2yUEefMYB99kQD2X9oNzrUxkmYoP9ffzYLGnGms/VE3OtHJHyp8bR6Bfv6jtzyVdd6
	 FL3NDlxl2Sc+ti1WdM4iWxfWleAvFFjcpH9U+jYo=
Date: Mon, 17 Aug 2026 17:06:25 +0200
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
Message-ID: <2026081745-unshaken-retread-d744@gregkh>
References: <6a820ebc.9ebadd4d.20b15e.001b.GAE@google.com>
 <20260816135201.98590b17b526dda8c4ec9105@linux-foundation.org>
 <DKQP5QC9XTDJ.3MI016NP0NPFY@nvidia.com>
 <02c2e5c7-0d78-4763-90ff-75fa87105fcb@rowland.harvard.edu>
 <DKQS9ADYVLN1.246LJPQ9QQYVP@nvidia.com>
 <9787b33b-b30e-4c5e-a0ee-7f14515c7166@rowland.harvard.edu>
 <DKQU9SQUIKDR.2KEZZPONJ1IJ7@nvidia.com>
 <20260816194213.0e813ed338144ebc81ed4050@linux-foundation.org>
 <472add4b-f16a-4b87-bbc3-98c8aa385cf5@rowland.harvard.edu>
 <EDCC14FA-F7D8-4F72-B780-37D09E26D16C@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <EDCC14FA-F7D8-4F72-B780-37D09E26D16C@nvidia.com>

On Mon, Aug 17, 2026 at 10:34:26AM -0400, Zi Yan wrote:
> On 17 Aug 2026, at 9:55, Alan Stern wrote:
> 
> > On Sun, Aug 16, 2026 at 07:42:13PM -0700, Andrew Morton wrote:
> >> On Sun, 16 Aug 2026 21:47:58 -0400 "Zi Yan" <ziy@nvidia.com> wrote:
> >>
> >>>>
> >>>>>> I prefer Andrew's first suggestion.  If the user asks the kernel to copy
> >>>>>> too much data, just fail -- with no warning.
> >>>>>
> >>>>> __GFP_WARN gets rid of all other warnings, even if user asks for a
> >>>>> reasonable size. Why use such a big hammer?
> >>>>
> >>>> Because on many systems, WARN causes the kernel to crash.  You don't
> >>>> want the entire system to crash just because the user asked for more
> >>>> memory than was available.
> >>>
> >>> User asking for more memory that what is available is pretty common and
> >>> should not trigger a WARN or crash, unless you have panic_on_oom set.
> >>
> >> I assume Alan is referring to panic_on_warn.
> >
> > Yes.
> 
> Right. That is why I said “unless you have panic_on_oom set”. So panic_on_warn
> will not crash the kernel if user asks for more memory than what is available.

Are you sure?  It kicks off syzbot, what prevents the oops from
happening if panic_on_warn is enabled and a warning like this happens?
Am I missing some code somewhere?

> >> Heaven knows how common panic_on_warn usage is.  Gemini tells me "There
> >> is no exact global headcount or precise user metric for how many people
> >> use panic_on_warn.  However, the setting is widely enabled across a few
> >> billion Android devices and many cloud/server provider host kernels
> >> where automated failover makes a full reboot preferable to running with
> >> an unknown warning state".
> >>
> >> So I do think that WARNs are more serious than we (mm developers) tend
> >> to assume.
> >
> > I do know that Greg KH has pretty strong feelings about this issue.
> 
> But the warning here is when kernel user wants buddy allocator to give
> what it cannot allocate, a page order > MAX_PAGE_ORDER. The warning
> tells that kernel user please ask for a reasonably sized memory.

And if panic_on_warn is enabled, like it is in billions of Linux
systems, and a user can trigger it, then you just rebooted the box,
causing a DoS and a simple way to get a CVE assigned for the problem.

> >> So we just shouldn't permit userspace to trivially trigger a
> >> page-allocation WARN.  Especially if the caller is perfectly capable of
> >> handling an ENOMEM allocation failure, as appears to be the case with
> >> usb-gadget.
> >>
> >> (Does usb-gadget actually get used by Android?  Surely not by cloud
> >> providers!)
> >>
> >> (Can this WARN be triggered by unprivileged userspace?  I didn't look,
> >> this matters a lot).
> >
> > I don't think it can.  Regardless, even privileged userspace shouldn't
> > be able to crash the whole system by doing something that ought to
> > return a harmless error.
> 
> The issue here is that the inode.c code passes the user input len without
> checking to page allocator code. Capping that is a minimal requirement
> to prevent untrusted userspace input getting into trusted kernel space code
> easily.

But why would inode.c know what the page allocation max is?  We have put
arbitrary bounds in other places where you can cause large allocations
from userspace (like in usbfs), and if that's needed here, great, we can
do that too.  But don't tie that to the mm core values as those can
change over time.


thanks,

greg k-h
