Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F3C4CA291
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 15:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787325196; cv=none; b=j5JuBdNutjy0KTh0qLxq9O85AKbigkSYHkEVMrvzPz85PfOZYmoD1cDZ6m4e1FlYu902jaGxFfb6W8wSBITYc8M8NlfNI/HKstyaV5jDp2bPX5kp5K1h7kKJm5eGzOGxjqX+9Firp6TLaNCaWY0dNzTzZOfvxlOFP+GTyJ7Q3+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787325196; c=relaxed/simple;
	bh=uIOylIHpYjvxJqaiphpiVhBroctbf/Z75sLexbG5d/E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nQ0foRurbS5vlvf1tL2l/WcAvZiMUF1GjFyacdiPeT5H2SZAZ2fZUa2VUp5GNV7JokAGpXBDS1PvYTjFnlWHJqSC+hDHhyUDm6dT65aWeBS55uXoXEgFnfSla5utSzIk9lmkL1kq2Obp/fCDKbV/Y8YWAWhdaArVTVlUh5q+7Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuo+dmCQ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuo+dmCQ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49978908b35so7289235e9.0
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 08:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787325193; x=1787929993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQVfUZyrHFxSk6Ytf8Px1CPoPWnrAzt+d/q0DUGzeh0=;
        b=fuo+dmCQgiThiR3hgZ2kTtgfv2msLDrF2BI5C6rqx5fIFsUU8OQ5rey+k9q7L4LCF7
         c/q2V2hFIu/wWKjTRZRLnLemQKy8X6xQhs4iOMusijTwndsBXKoYTsfNYeyx8f6yxmaG
         mEES9tK/vSOgavU8HgMKdqhTRzd6cptrkirIbiOEN36LvHdxk9CKnD7Invyr4gKqWbCr
         ZbatGm7NWXkGBsadhS92cZi83luGltYET62PFLewn8/kdee1alcMqrNTWcP1kfjLSQRo
         37N8CusZKWtazQj1X3z6BuT0rlQFTYgW4fFwaY91sOmLTPf1UVWmQqnptF0HSUII2msg
         m9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787325193; x=1787929993;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQVfUZyrHFxSk6Ytf8Px1CPoPWnrAzt+d/q0DUGzeh0=;
        b=C+HBqrGxOH2VagceMeomRIp9CxqiNPxqs0pfNLoNH9Y4QxONl1Ems1il+kBDWVIqWb
         MCBrSPOXkqCVZGbnGHm5sKlXHJ+/DGA3G/xyiplulaK0XfhRIRNqK3h616SiZuldx8oD
         4ebNSgDyxUMYv+yHA3F95BvcZ/MqBRK8aoAC5wODTbxcfjhcPfSpOW5dfyjr5odm1qCI
         7ntHMLU+TWMAarcUAHYvZdP6Q8MsY6bWWIif48zQdptXCCc3BdkOJLrJhMAOQ+5DGzLE
         k4LaL5DjbEN85kWFuQ+C111WDco2EaIvPFK785+mVzWzYMgrAcUKdMT72Om7FMIl/kL0
         pPWA==
X-Forwarded-Encrypted: i=1; AHgh+RqJs3EyYCNOLdEviru4T8++j+Q9Pf4niqqtU+7vnMYTRr2Xl1VsQqVVpkQWq0h0tGCQtQKLTlvzQjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2dN3WbrrgetdoOXniTQtzQPrfOrCM0M8xihGPWDvTjjhv4+ce
	rXJNreBNmWcTcLyKbkkbgk2GYPPrQ2jqs4mqByECsWvphbPuicjjwkjd
X-Gm-Gg: AR+sD122oMwpfFB7eHRWAV0wYQqJnY7r1BdIE2jeKppn2bL7h0Qr+HgXieNB62EesQI
	G3nfWqNLytvu7+z2oYJBJigwiM7n2K61AU0B4o8/cVbOW2c/S9T80VxSkG151aTvyypvO2F6VGb
	Oxd1+Y+84RR8eQMH14LzQLi7zzHM4ij0+nVDDpseaq+Hv7uL8o9Gm5gU2wgM9hphUO2c9XmOkJl
	bzzEGAqQ61EYaHjl5fxdZhS6GSPwhBwhMwsxy0AaVCWit7uNMWU/kUZdasa78n0cgJ8XlEuIgvu
	ndD/sfGBknkf8Mb1UPfXYYJ0zvBH9Ms/xvxXbHrsJdg2SBeFhflqGlSFt/VPW0r3U1qq7MC6aSb
	X3TUW1lG0Ugz7uvOzwm78o1LgHCjdJRxlyigDq51Y3Rbddqwh2NuRnx7u75mcwUxkgTkND0N4fZ
	1YlRXKAmxl6Zg1+VBFfRo97Zoc1gUtgUcJgL7UjZLsLQY4xKh1RMb7XAntuxrMSaKuqYJf52B31
	dZKa0i5O1RdPlIhAA/4jJGlThMkcjF+Fsce
X-Received: by 2002:a05:600c:3b08:b0:499:b402:6c0 with SMTP id 5b1f17b1804b1-499b830d671mr93768145e9.3.1787325192330;
        Fri, 21 Aug 2026 08:13:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b90e3170sm36283225e9.5.2026.08.21.08.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:13:12 -0700 (PDT)
Date: Fri, 21 Aug 2026 16:13:10 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Zi Yan" <ziy@nvidia.com>
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "syzbot"
 <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com>,
 <apopple@nvidia.com>, <byungchul@sk.com>, <david@kernel.org>,
 <gourry@gourry.net>, <joshua.hahnjy@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <matthew.brost@intel.com>, <rakie.kim@sk.com>,
 <syzkaller-bugs@googlegroups.com>, <ying.huang@linux.alibaba.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
Message-ID: <20260821161310.28255793@pumpkin>
In-Reply-To: <DKUOVAQ3T03S.14GFWAHY0I6HO@nvidia.com>
References: <6a820ebc.9ebadd4d.20b15e.001b.GAE@google.com>
	<20260816135201.98590b17b526dda8c4ec9105@linux-foundation.org>
	<20260821093039.04538795@pumpkin>
	<DKUOVAQ3T03S.14GFWAHY0I6HO@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Aug 2026 10:24:36 -0400
"Zi Yan" <ziy@nvidia.com> wrote:

> On Fri Aug 21, 2026 at 4:30 AM EDT, David Laight wrote:
> > On Sun, 16 Aug 2026 13:52:01 -0700
> > Andrew Morton <akpm@linux-foundation.org> wrote:
> >  
> >> On Sun, 16 Aug 2026 12:25:48 -0700 syzbot <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com> wrote:
> >>   
> >> > Hello,
> >> > 
> >> > syzbot found the following issue on:
> >> > 
> >> > HEAD commit:    3d6d817622b0 Merge tag 'scsi-fixes' of git://git.kernel.or..
> >> > git tree:       upstream
> >> > console output: https://syzkaller.appspot.com/x/log.txt?x=15927479580000
> >> > kernel config:  https://syzkaller.appspot.com/x/.config?x=a59830cba91a1981
> >> > dashboard link: https://syzkaller.appspot.com/bug?extid=805630f1453e490427fa
> >> > compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> >> > 
> >> > Unfortunately, I don't have any reproducer for this issue yet.
> >> > 
> >> > Downloadable assets:
> >> > disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-3d6d8176.raw.xz
> >> > vmlinux: https://storage.googleapis.com/syzbot-assets/d19e0514c02a/vmlinux-3d6d8176.xz
> >> > kernel image: https://storage.googleapis.com/syzbot-assets/f6da706811f4/bzImage-3d6d8176.xz
> >> > 
> >> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> >> > Reported-by: syzbot+805630f1453e490427fa@syzkaller.appspotmail.com
> >> > 
> >> > gadgetfs: bound to dummy_udc driver
> >> > ------------[ cut here ]------------
> >> > 1
> >> > WARNING: mm/page_alloc.c:5280 at __alloc_frozen_pages_noprof+0x2ce/0x380 mm/page_alloc.c:5280, CPU#0: syz.0.0/5319    
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
> > Should there be a separate flags for 'request too large' and
> > 'no memory available' ?  
> 
> What flags? Are you suggesting kmalloc should return an ERR_PTR to
> distinguish different error types?

That would break to much...
I was thinking of a GFP_NOWARN_TOOBIG.

That isn't enough to change the errno though.
But a smaller sanity limit may make sense anyway.

David

> 
> >
> > Although the errno for 'len too big' should probably be EINVAL
> > not ENOMEM.
> >
> > David
> >  
> >> 
> >>   
> >> > Modules linked in:
> >> > CPU: 0 UID: 0 PID: 5319 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
> >> > Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> >> > RIP: 0010:__alloc_frozen_pages_noprof+0x2ce/0x380 mm/page_alloc.c:5280
> >> > Code: 74 10 4c 89 e7 89 54 24 0c e8 0e 2c 0e 00 8b 54 24 0c 49 83 3c 24 00 0f 85 ab fe ff ff e9 ac fe ff ff c6 05 95 d2 18 0e 01 90 <0f> 0b 90 e9 17 ff ff ff a9 00 00 08 00 48 8b 4c 24 10 4c 8d 44 24
> >> > RSP: 0018:ffffc9000e13fa20 EFLAGS: 00010246
> >> > RAX: ffffc9000e13fa00 RBX: 0000000000000013 RCX: 0000000000000000
> >> > RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc9000e13fa88
> >> > RBP: ffffc9000e13fb08 R08: ffffc9000e13fa87 R09: 0000000000000000
> >> > R10: ffffc9000e13fa60 R11: fffff52001c27f51 R12: 0000000000000000
> >> > R13: 1ffff92001c27f48 R14: 0000000000040cc0 R15: dffffc0000000000
> >> > FS:  00007f6f4a58c6c0(0000) GS:ffff88808c549000(0000) knlGS:0000000000000000
> >> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> > CR2: 00002000000010a0 CR3: 000000004323d000 CR4: 0000000000352ef0
> >> > Call Trace:
> >> >  <TASK>
> >> >  alloc_pages_mpol+0x212/0x380 mm/mempolicy.c:2490
> >> >  ___kmalloc_large_node+0x4c/0x120 mm/slub.c:5274
> >> >  __kmalloc_large_node_noprof+0x18/0x90 mm/slub.c:5305
> >> >  __do_kmalloc_node mm/slub.c:5322 [inline]
> >> >  __kmalloc_noprof+0x405/0x720 mm/slub.c:5359
> >> >  _kmalloc_noprof include/linux/slab.h:992 [inline]
> >> >  ep_write_iter+0x1bc/0x500 drivers/usb/gadget/legacy/inode.c:669
> >> >  new_sync_write fs/read_write.c:595 [inline]
> >> >  vfs_write+0x612/0xba0 fs/read_write.c:687
> >> >  ksys_write+0x150/0x270 fs/read_write.c:739
> >> >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> >> >  do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
> >> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >> > RIP: 0033:0x7f6f4979e0d9
> >> > Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
> >> > RSP: 002b:00007f6f4a58bfe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> >> > RAX: ffffffffffffffda RBX: 00007f6f49a25fa0 RCX: 00007f6f4979e0d9
> >> > RDX: 00000000ffffffb9 RSI: 0000000000000000 RDI: 0000000000000004
> >> > RBP: 00007f6f49835024 R08: 0000000000000000 R09: 0000000000000000
> >> > R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> >> > R13: 00007f6f49a26038 R14: 00007f6f49a25fa0 R15: 00007ffc6cf49328
> >> >  </TASK>
> >> >     
> >> 
> >>   
> 
> 
> 
> 

