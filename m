Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7E1279DB1;
	Mon, 17 Aug 2026 02:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786934536; cv=none; b=Lq8H06ITAQ1+EQwdIcm5cgqNz39st3tf2E8A9Ln7Lh0lSRadgxi2Wd2AS3cTfWk2Lct3l/h9kxcXiiSLgEtFBKCnZs+etFVn8A2LUI+GKLR8yib23DRMl3LEz0XUpyUJ+Zd7OnT9Mb8U0Cm9bsmEkLpwjAkGV0qdNgHoOHZme2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786934536; c=relaxed/simple;
	bh=aODx9rqiWbXnfWc75C41GNt16u+fkKJXzUegh59lttY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kGmBf/bKlUJmMM7yHR9mTHCg9zrwVDQtXwOw0ngteAGD/zS8OZTyvXv/PXOO5RWajOonXPV08TPLz0OIQVudzkxOiulOPbR0ZzloZiJEEiBqfXFxfYPEqz3sxgXsZ2D/CZYJ7Oa0FETb8e6nv/P2lgryBVSe/LvB5wwJKSx543w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CQShMVjj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CQShMVjj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077DF1F000E9;
	Mon, 17 Aug 2026 02:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1786934534;
	bh=HZTCYCleUiU3YRCHIU5xkcgU6TcXz2UCAgTFRMqwvL4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CQShMVjjnI1IlYUmO0zNpP6fs6jQvF4hvVXe70zPGDgsR0gi4FCJ5g92ymEGRk1jU
	 tQ9aG6fAGeNMW7tH6ndqVegbvFRz1q1s3RIBPl/NJ/a3hr5b6Ma83WTqLgkqxodOoa
	 AffLXdw4vbc8OcrDBSACUUNAK7u42AlPD8C8uBPo=
Date: Sun, 16 Aug 2026 19:42:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Zi Yan" <ziy@nvidia.com>
Cc: "Alan Stern" <stern@rowland.harvard.edu>, "syzbot"
 <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com>,
 <apopple@nvidia.com>, <byungchul@sk.com>, <david@kernel.org>,
 <gourry@gourry.net>, <joshua.hahnjy@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <matthew.brost@intel.com>, <rakie.kim@sk.com>,
 <syzkaller-bugs@googlegroups.com>, <ying.huang@linux.alibaba.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-usb@vger.kernel.org>
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
Message-Id: <20260816194213.0e813ed338144ebc81ed4050@linux-foundation.org>
In-Reply-To: <DKQU9SQUIKDR.2KEZZPONJ1IJ7@nvidia.com>
References: <6a820ebc.9ebadd4d.20b15e.001b.GAE@google.com>
	<20260816135201.98590b17b526dda8c4ec9105@linux-foundation.org>
	<DKQP5QC9XTDJ.3MI016NP0NPFY@nvidia.com>
	<02c2e5c7-0d78-4763-90ff-75fa87105fcb@rowland.harvard.edu>
	<DKQS9ADYVLN1.246LJPQ9QQYVP@nvidia.com>
	<9787b33b-b30e-4c5e-a0ee-7f14515c7166@rowland.harvard.edu>
	<DKQU9SQUIKDR.2KEZZPONJ1IJ7@nvidia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 16 Aug 2026 21:47:58 -0400 "Zi Yan" <ziy@nvidia.com> wrote:

> >
> >> > I prefer Andrew's first suggestion.  If the user asks the kernel to copy 
> >> > too much data, just fail -- with no warning.
> >> 
> >> __GFP_WARN gets rid of all other warnings, even if user asks for a
> >> reasonable size. Why use such a big hammer?
> >
> > Because on many systems, WARN causes the kernel to crash.  You don't 
> > want the entire system to crash just because the user asked for more 
> > memory than was available.
> 
> User asking for more memory that what is available is pretty common and
> should not trigger a WARN or crash, unless you have panic_on_oom set.

I assume Alan is referring to panic_on_warn.

Heaven knows how common panic_on_warn usage is.  Gemini tells me "There
is no exact global headcount or precise user metric for how many people
use panic_on_warn.  However, the setting is widely enabled across a few
billion Android devices and many cloud/server provider host kernels
where automated failover makes a full reboot preferable to running with
an unknown warning state".

So I do think that WARNs are more serious than we (mm developers) tend
to assume.

So we just shouldn't permit userspace to trivially trigger a
page-allocation WARN.  Especially if the caller is perfectly capable of
handling an ENOMEM allocation failure, as appears to be the case with
usb-gadget.

(Does usb-gadget actually get used by Android?  Surely not by cloud
providers!)

(Can this WARN be triggered by unprivileged userspace?  I didn't look,
this matters a lot).

> You can mmap a virtual address range bigger than your physical memory
> size plus your swap space and try to fault all pages in. That would
> cause OOM and the system should not crash.

Right.  As long as it doesn't trigger a WARN!




Perhaps we should revisit this.

Why are we emitting a WARN if an allocation fails, given that this will
often panic the kernel?  Should we on the core MM side dial that back
to a pr_warn() and a helpful backtrace?

