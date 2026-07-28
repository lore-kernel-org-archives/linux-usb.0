Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B43E43C7B7
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 13:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246085; cv=none; b=r/KPOoClCAlkfroF2zgVPqHNV0/gfLCFSJMXlvwZbm/kfz0chcA4x5XG25Ca7/9nVNVaB49WtcuM+9KljjoDehGnVf4p64aMTVfbTXcUoaD+6/kEIRvsgunIRK1PJJ+nMu8Df9rVl22WqBB2fIOX1C6Jxz7TOp6Itt5MiBMNGYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246085; c=relaxed/simple;
	bh=8nHuwxTs39eOlAsoshj/QCS7uHHirHt5lnEByEm0S7k=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=dHE5XsxjClHc0McmhdtO6EJLZG48hs+oihgpItChFID/66933f/ACAVZHqxx8MYikX/Rx6OX/zcf2cKuInxGmj1K3xrd5fQhleb9wLniz24X7KrSaxQ8tWRRqxbjFYoaMBtM9anEB2wjXdZxAysuysfZDROWe0D1zb2TBlJBot8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-485ebc5706cso1348778b6e.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 06:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246082; x=1785850882;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voM1cnIwa/lCBFYyvOhkLI9BXpPgX1F0cjWm8w5AR6c=;
        b=FoLdMRQ9w0qlsC1AqdYBjSGzX35yxNyzDs7TrpQC4d0FyiLw6n/urIWuOGMCrrmx49
         tIAHXGtc/eqtC5UDaOKEW8BLaDrxK1qshHy9S6zN15KMqdN2Zg+xqIL4kT3qq3eUcBQL
         tU5+tNA8JMbg+LpAtub41jZXZKTo0Y9FBvm6ZeJCi+30Ue1RuzVAdIp36ER7+Bs1KpEH
         DYG/1Wa8m8dQKVAF08wDfhF1Ao8EoW77I8zOlhLTy+GnusJn2EEWcOtgQCoqqEDOkbOZ
         8RR0OAiPAeZWbkGSvkvqYDUJmhU1U76C6CeJTt0LAWWBbRcDjsNN8uRiLCrTTguJcWun
         FceA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4kpBciuS/XMvgjNltw0nYc7PGuf5/uXf6m0YjsAHlJic7TSJGmYaTPaxWEBmuS1KH6i2fBsACvkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHTyo8Ias1zCgxHuHEBr7AF2p3ChZLI1O+cmFj6vkZkbB/IA3O
	RZOF6yixK0oPIzv36Ldehu6V8yhSl+CPaZYDcNamfppfObh7uWrrNIRWCR6dyjoPeWY4ukFjeH/
	qMoX7nz9q6uaNLyj9HMwHrlgJTWS6nSRPPEctza9lsMsRA2N8tLmZ25M+p20=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:118d:b0:485:7c46:b866 with SMTP id
 5614622812f47-4ad5b9c218amr1388038b6e.16.1785246082322; Tue, 28 Jul 2026
 06:41:22 -0700 (PDT)
Date: Tue, 28 Jul 2026 06:41:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a68b182.4c659fcc.19cd90.0021.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: global-out-of-bounds Read in usb_copy_descriptors
From: syzbot <syzbot+debc5c305403f180c01c@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f5098b6bae76 Linux 7.2-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14d167b1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b7079b368dcec295
dashboard link: https://syzkaller.appspot.com/bug?extid=debc5c305403f180c01c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b18067cdf26c/disk-f5098b6b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2b364c33a0f2/vmlinux-f5098b6b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2dfce6f90a4d/bzImage-f5098b6b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+debc5c305403f180c01c@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: global-out-of-bounds in usb_copy_descriptors+0x18d/0x320 drivers/usb/gadget/config.c:94
Read of size 160 at addr ffffffff9ba43a60 by task syz.4.708/8762

CPU: 0 UID: 0 PID: 8762 Comm: syz.4.708 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:186 [inline]
 kasan_check_range+0x10f/0x1e0 mm/kasan/generic.c:200
 __asan_memcpy+0x23/0x60 mm/kasan/shadow.c:105
 usb_copy_descriptors+0x18d/0x320 drivers/usb/gadget/config.c:94
 usb_assign_descriptors+0xd2/0x470 drivers/usb/gadget/config.c:131
 f_audio_bind+0x243a/0x3950 drivers/usb/gadget/function/f_uac1.c:1443
 usb_add_function+0x219/0x890 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xd83/0x1960 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x28c/0xbf0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __driver_attach+0x21f/0x5b0 drivers/base/dd.c:1292
 bus_for_each_dev+0x13e/0x1d0 drivers/base/bus.c:383
 bus_add_driver+0x305/0x5b0 drivers/base/bus.c:763
 driver_register+0x1e2/0x360 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0x132/0x210 drivers/usb/gadget/udc/core.c:1752
 gadget_dev_desc_UDC_store+0x1b0/0x2e0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6dd8b9de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f6dd9aa7028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f6dd8e26090 RCX: 00007f6dd8b9de99
RDX: 000000000000000c RSI: 0000200000001f00 RDI: 0000000000000004
RBP: 00007f6dd8c33eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f6dd8e26128 R14: 00007f6dd8e26090 R15: 00007ffc9bbd9888
 </TASK>

The buggy address belongs to the variable:
 ac_header_desc+0x0/0x40

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1ba43
flags: 0xfff00000002000(reserved|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000002000 ffffea00006e90c8 ffffea00006e90c8 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner info is not present (never set?)

Memory state around the buggy address:
 ffffffff9ba43900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffffff9ba43980: 00 00 00 00 00 00 00 00 f9 f9 f9 f9 00 f9 f9 f9
>ffffffff9ba43a00: f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9 00 f9 f9 f9
                                                          ^
 ffffffff9ba43a80: f9 f9 f9 f9 00 00 f9 f9 f9 f9 f9 f9 00 00 f9 f9
 ffffffff9ba43b00: f9 f9 f9 f9 00 00 f9 f9 f9 f9 f9 f9 00 00 f9 f9
==================================================================
==================================================================
BUG: KASAN: global-out-of-bounds in usb_copy_descriptors+0x18d/0x320 drivers/usb/gadget/config.c:94
Read of size 160 at addr ffffffff9ba43a60 by task syz.4.708/8762

CPU: 0 UID: 0 PID: 8762 Comm: syz.4.708 Tainted: G    B        L      syzkaller #0 PREEMPT(full) 
Tainted: [B]=BAD_PAGE, [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:186 [inline]
 kasan_check_range+0x10f/0x1e0 mm/kasan/generic.c:200
 __asan_memcpy+0x23/0x60 mm/kasan/shadow.c:105
 usb_copy_descriptors+0x18d/0x320 drivers/usb/gadget/config.c:94
 usb_assign_descriptors+0x185/0x470 drivers/usb/gadget/config.c:136
 f_audio_bind+0x243a/0x3950 drivers/usb/gadget/function/f_uac1.c:1443
 usb_add_function+0x219/0x890 drivers/usb/gadget/composite.c:333
 configfs_composite_bind+0xd83/0x1960 drivers/usb/gadget/configfs.c:1802
 gadget_bind_driver+0x28c/0xbf0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __driver_attach+0x21f/0x5b0 drivers/base/dd.c:1292
 bus_for_each_dev+0x13e/0x1d0 drivers/base/bus.c:383
 bus_add_driver+0x305/0x5b0 drivers/base/bus.c:763
 driver_register+0x1e2/0x360 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0x132/0x210 drivers/usb/gadget/udc/core.c:1752
 gadget_dev_desc_UDC_store+0x1b0/0x2e0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6dd8b9de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f6dd9aa7028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f6dd8e26090 RCX: 00007f6dd8b9de99
RDX: 000000000000000c RSI: 0000200000001f00 RDI: 0000000000000004
RBP: 00007f6dd8c33eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f6dd8e26128 R14: 00007f6dd8e26090 R15: 00007ffc9bbd9888
 </TASK>

The buggy address belongs to the variable:
 ac_header_desc+0x0/0x40

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1ba43
flags: 0xfff00000002000(reserved|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000002000 ffffea00006e90c8 ffffea00006e90c8 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner info is not present (never set?)

Memory state around the buggy address:
 ffffffff9ba43900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffffff9ba43980: 00 00 00 00 00 00 00 00 f9 f9 f9 f9 00 f9 f9 f9
>ffffffff9ba43a00: f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9 00 f9 f9 f9
                                                          ^
 ffffffff9ba43a80: f9 f9 f9 f9 00 00 f9 f9 f9 f9 f9 f9 00 00 f9 f9
 ffffffff9ba43b00: f9 f9 f9 f9 00 00 f9 f9 f9 f9 f9 f9 00 00 f9 f9
==================================================================


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
