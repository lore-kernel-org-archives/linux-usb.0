Received: from mail-oa2-f11.google.com (mail-oa2-f11.google.com [74.125.231.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6963B0AD8
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787298104; cv=none; b=h+7aV0uBraEzdbisnNcoS4J6hQ11656d0KdPIhSdHaXf+xGmZewL66wMx1SwQK2MupNDkIILTELaNWr3ZPJwr0E0QJwoBObUfnmWFIwAxxRQQ08ZxKWS7pF6sqxBV5BpOIuB+A4sTbVp14na3Q8Bi2jbi8eAYclxxwzk0jzfCvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787298104; c=relaxed/simple;
	bh=upFNT08/KvumhanhYzb8tOUyUcA6jb8mtLTXrb2VMQE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=dGM6qdNOuVP5gximyXOCut+BHo+Ja00ff965fzxy2FluZjI1S+QjxSAe1/7gmjB/TQ45PO62NnrOmQhYtt+s3FsgcRlA2ltfsrPD8u9lmBi6fufrViDcPRegqHS15lHtFU/EmNkQ9VkBm9Nq0luZ2bYOOcf9qxoBW0aRLt4236w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa2-f11.google.com with SMTP id 586e51a60fabf-463014ab602so307633fac.0
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 00:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787298094; x=1787902894;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0wTArJ0RuImaijed9XXkJ2TvYRGsZQmI52BwYG23Tw=;
        b=DNIPXl7UB8UhoIx3UeRSSjei7asMrF5yXBobj8qNzMLM0N4+F9b1thIAsKoetMFyCt
         58A8x3kihyOdSgn0CEfudX0hBQrqAKSUpdowLiotRcYYiu+vBUtdDo1DfN0RUiTTwIqW
         MSc2ihcCZGUS2F2kVPo4KECpbZlg0tImBYxM4WRx3Q4RQ5BVyuAi5C/OfogTKexql28w
         sOA8N5VmXQ5zNwEkJmWtsNDeWtikZHRz+1OrdFQyijF/Mla4pCIfv5G4tNBFLFUnRnpM
         13+AGoWYn4BoBpMCEfUYg8lHEDNSO71atzbRpZ/hJijAt0gb7yzPweL0DxTSIM1qW+cY
         3YQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rplo8AO4GzTGGplvw0mLXluRuroMBK8OkSZSNTuOPBBAnqAR7xlUrnFGDfAt9/c8AkwXwCNwSbTIeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFwWwoc371+g4Oln3H6n0v8BHqSF6sFUjXnzsM7vXMsVnK36eS
	ox6fyQzhwtH3wlKXg1EmjxOGBsMOAKr36Hqm2IqzHBhgnVnSRfenBnYsz+chyn6IXFsts3XlHVT
	PSVZon1vQjKnUeAs3MAAISHhoRuBBRZ/Z9FJeN/YV7iRZSu6/Kznq6rf9bCM=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e045:0:b0:6ae:9e00:c8ef with SMTP id
 006d021491bc7-6b15928be08mr3791695eaf.14.1787298094491; Fri, 21 Aug 2026
 00:41:34 -0700 (PDT)
Date: Fri, 21 Aug 2026 00:41:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a88012e.dbb3a75c.13dd47.0007.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in wcove_typec_probe
From: syzbot <syzbot+1a01783ea233350598b5@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8d3ae59288f1 Linux 7.2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14ea0679580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a0fdc3b566746377
dashboard link: https://syzkaller.appspot.com/bug?extid=1a01783ea233350598b5
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/571b2fa98290/disk-8d3ae592.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5758aecc42aa/vmlinux-8d3ae592.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f9306cccc3b8/bzImage-8d3ae592.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1a01783ea233350598b5@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
CPU: 0 UID: 0 PID: 6187 Comm: syz.5.107 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:wcove_typec_probe+0xdb/0x780 drivers/usb/typec/tcpm/wcove.c:621
Code: 48 c1 ea 03 80 3c 02 00 0f 85 af 05 00 00 48 8d 7d 08 4d 89 af 88 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 7f 05 00 00 49 8d bf 90 00 00 00 48 8b 6d 08 48
RSP: 0018:ffffc9000594fb18 EFLAGS: 00010212
RAX: dffffc0000000000 RBX: ffff88801e371000 RCX: 0000000000000000
RDX: 0000000000000001 RSI: 0000000000000001 RDI: 0000000000000008
RBP: 0000000000000000 R08: 0000000000000004 R09: 0000000000000000
R10: ffff888035b4d483 R11: 0000000000000000 R12: ffffffff90281e28
R13: ffff88801e371010 R14: ffff888035b4d4c0 R15: ffff888035b4d438
FS:  00007f3b03bde6c0(0000) GS:ffff888123de1000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c3be387 CR3: 0000000013036000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 platform_probe+0x106/0x1d0 drivers/base/platform.c:1439
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 device_driver_attach+0xd1/0x220 drivers/base/dd.c:1203
 bind_store+0xf4/0x190 drivers/base/bus.c:267
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3b02d9e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f3b03bde028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f3b03025fa0 RCX: 00007f3b02d9e0d9
RDX: 0000000000000007 RSI: 0000200000000200 RDI: 0000000000000004
RBP: 00007f3b02e35024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f3b03026038 R14: 00007f3b03025fa0 R15: 00007ffd49d97768
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:wcove_typec_probe+0xdb/0x780 drivers/usb/typec/tcpm/wcove.c:621
Code: 48 c1 ea 03 80 3c 02 00 0f 85 af 05 00 00 48 8d 7d 08 4d 89 af 88 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 7f 05 00 00 49 8d bf 90 00 00 00 48 8b 6d 08 48
RSP: 0018:ffffc9000594fb18 EFLAGS: 00010212
RAX: dffffc0000000000 RBX: ffff88801e371000 RCX: 0000000000000000
RDX: 0000000000000001 RSI: 0000000000000001 RDI: 0000000000000008
RBP: 0000000000000000 R08: 0000000000000004 R09: 0000000000000000
R10: ffff888035b4d483 R11: 0000000000000000 R12: ffffffff90281e28
R13: ffff88801e371010 R14: ffff888035b4d4c0 R15: ffff888035b4d438
FS:  00007f3b03bde6c0(0000) GS:ffff888123ee1000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000562bed817760 CR3: 0000000013036000 CR4: 0000000000350ef0
----------------
Code disassembly (best guess):
   0:	48 c1 ea 03          	shr    $0x3,%rdx
   4:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   8:	0f 85 af 05 00 00    	jne    0x5bd
   e:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
  12:	4d 89 af 88 00 00 00 	mov    %r13,0x88(%r15)
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 7f 05 00 00    	jne    0x5b3
  34:	49 8d bf 90 00 00 00 	lea    0x90(%r15),%rdi
  3b:	48 8b 6d 08          	mov    0x8(%rbp),%rbp
  3f:	48                   	rex.W


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
