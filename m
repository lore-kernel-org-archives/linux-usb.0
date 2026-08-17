Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE3232D0E3
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 09:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786958074; cv=none; b=FchvRiBddr6ess43A9EEyvMPNdNhNYAkTsdfqAlxyc+R0TfO7bzBtRvOIIvnCW469oUyv2fy42I20Yidoggd3xTIxS6mZL4wwauUjWZAOFyhNnDnd2xfcgDfy6AdwCEl711OIe3GbqXjPunrqvONIQ8Vp0NAi2NK6uGZE2rqJl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786958074; c=relaxed/simple;
	bh=CVpTGZhFHmUfN5ANVL8C/TJw9Le2zioUZ7nwTD0lJOk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IszYopn8Fvrwl6Y4Y33GR64cgP8U4hf5KTxiWWB61TrF4aXAj9On05S69TOZ94FFmrHlDRjaTs3fR4pjzZffU4JZiPaqZ/YNFnawcop5o6UmisnlpRv+Z4Cg9BaL0wxuiXsQyPLRh587sDDXEWXwBdv0QC+fixNiEwaF0ZIPc8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6ae4917006eso2964194eaf.2
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 02:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786958071; x=1787562871;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0YnkKb4Fet8hxhNIWn1tISjKYbWQvuS7wogHoFnXdVU=;
        b=VjfpmHZcMDAldsocuiTQDhP4IG1kQptRHWmCx2SD6BIhiJZ1S3gosAOwQ/j/UymiEw
         9dwUryyYiix1pvGv0nociT02/xDVV3Ms34ddn2Uxa9gySWWwAbp0R8xaej3n6idb8cjl
         9dpTX+gQjE2H+MVJrhFZpzUltO50jevazwoXSXYP3WYfvAwIa1nGBUvtZY0+dh3BO5em
         N7hVgwL8uw0+bBqNJbBzbhnI3cQ7mm3oH3dVpD04+XHr2Y+tgiROz6pwTy6t8qh4X41u
         jcb+gFaviZOkxAzf4brrfKJY4vRofuIXfWLl2xJNuyLPDrk/qCoBkvN8foRU4RumzzfH
         d8sg==
X-Forwarded-Encrypted: i=1; AHgh+Ro15667Pp2uI4tgDwY59qr2b9/JYgR/cSWt2iVJ0wxyED/3l+FAFlLh/n3oAt/CFdwGakoKPHMgR0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnXLH8Ieff2Lj6RSFxt5c+vad7XUNRMMF+vV+3DcEuC3QyArjL
	Wz/zlbKkR9/aqRsEb2Yex69ybeFviEvY5Ln01OXZSBZPdVSL9pWCcbkyoFcQO1+ZCU/OdLU0iT8
	ai4toViheia5tpSZ+RIjKZYH60FBdNh1NJdhXffgj0dERjgSzS87KzonIca4=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1ca2:b0:6aa:f0fd:3f0a with SMTP id
 006d021491bc7-6b0d68ebd55mr19778363eaf.30.1786958071630; Mon, 17 Aug 2026
 02:14:31 -0700 (PDT)
Date: Mon, 17 Aug 2026 02:14:31 -0700
In-Reply-To: <6a820ebc.9ebadd4d.20b15e.001b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a82d0f7.dbb3a75c.20434b.004d.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
From: syzbot <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, apopple@nvidia.com, byungchul@sk.com, 
	david@kernel.org, gourry@gourry.net, gregkh@linuxfoundation.org, 
	joshua.hahnjy@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-usb@vger.kernel.org, matthew.brost@intel.com, rakie.kim@sk.com, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com, 
	ying.huang@linux.alibaba.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    8d3ae59288f1 Linux 7.2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13bad949580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d67342c314f228d
dashboard link: https://syzkaller.appspot.com/bug?extid=805630f1453e490427fa
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1637ea25580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+805630f1453e490427fa@syzkaller.appspotmail.com

gadgetfs: bound to dummy_udc driver
------------[ cut here ]------------
1
WARNING: mm/page_alloc.c:5280 at __alloc_frozen_pages_noprof+0x2427/0x2dc0 mm/page_alloc.c:5280, CPU#2: syz-executor421/6034
Modules linked in:
CPU: 2 UID: 0 PID: 6034 Comm: syz-executor421 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:__alloc_frozen_pages_noprof+0x2427/0x2dc0 mm/page_alloc.c:5280
Code: e9 8d fb ff ff 31 d2 be 28 12 00 00 48 c7 c7 a0 74 01 8c e8 7b 95 68 ff 2e 2e 2e 31 c0 e9 02 ed ff ff c6 05 85 90 bc 0e 01 90 <0f> 0b 90 e9 6f df ff ff 48 c7 c7 80 be f3 8e 45 89 f7 44 8b 74 24
RSP: 0018:ffffc900048c7810 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 1ffff92000918f1c RDI: 0000000000040cc0
RBP: 0000000000000013 R08: 0000000000000005 R09: 0000000000000009
R10: 0000000000000013 R11: 0000000000000000 R12: 0000000000040cc0
R13: 1ffff92000918f5a R14: ffffffff9b95c444 R15: 0000000000000001
FS:  00005555738a6400(0000) GS:ffff8880d5dde000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffd5f5d6fe8 CR3: 0000000020943000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 alloc_pages_mpol+0x1fb/0x540 mm/mempolicy.c:2490
 ___kmalloc_large_node+0xe5/0x120 mm/slub.c:5274
 __kmalloc_large_node_noprof+0x1c/0x70 mm/slub.c:5305
 __do_kmalloc_node mm/slub.c:5322 [inline]
 __kmalloc_noprof+0x5a1/0x820 mm/slub.c:5359
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 ep_write_iter+0x180/0xbc0 drivers/usb/gadget/legacy/inode.c:669
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7cc18b5cb7
Code: 48 89 fa 4c 89 df e8 98 1d 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffd5f5d76e0 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00005555738a6400 RCX: 00007f7cc18b5cb7
RDX: 000000007fffffff RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00007ffd5f5d7730 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffd5f5d7930
R13: 00007f7cc18ea039 R14: 00007ffd5f5d7b30 R15: 0000000000000002
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
