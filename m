Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2DC43F0BC
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 13:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785245500; cv=none; b=B576dPYGkcGlHB0zAz/3Qf8QV3/JO35QIKUONNBPJL9rbdCvRejtL5EyZR7g1I1YUJYq0NwiaAFpr793zWUjTUUxzDEGSBR0ktG1/6mgFVIfN6sNGq+zaBEKRd4J754EIN7zl1d1hd/75rVPna98MZxUSmZUIlhtYqI6CMrcREE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785245500; c=relaxed/simple;
	bh=N8murcwrzzDuOEXDT31IGQPYYYDfS2HWUC/xlDZ/Efk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=lrJsqnWznSpoEea7khVQlZPtICfHjEHoeT6OhbarYTjPls/Pg3GiROIQfPngkaOAkN4mLUdm5uY5hdyjxrgdmSbhXfDERSaZvQUUAyh3oTxL17QOWnj8bROaSFwD9AVx12tyS4UvTYGBAlhEwcFtOUERqnck8mVIsTJBcUhdpH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-4a4a7d0362eso4458617b6e.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 06:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785245489; x=1785850289;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BcItoRZsm4FGQfGvK79yI//8WQjIHvk6Nfh6Hvg2Bqs=;
        b=LEr0Cyru8KeA4giKDsafMcSgEvgzdYvLSDsgT+dBzXG0TdLVd6P1wQJQG8kOXbdCkS
         upJYSCiT8AeAz6lymeGJwL9FNUV0BDbYB23zoR0592gfZ+PTtCcIglsuL77pGbQ67o8m
         VvQmQCtlaN30sTCN8eY+j07zYO/ViYqkKMt8SfD1b2bpdEU+IXmRoykr0mquxYhyPC0P
         KqAte7HNpDFs/fWgWT2JX0E/tzhDj5q4xOE18zi1OKSAgHxs4tXzq4BOJaMxWz6TfgLK
         GeFUv86brWv55l1gvLdDythbhe53YW/E38hlZoG1UBitJhK/5SWltMTO+S1/43gqzqgo
         037A==
X-Forwarded-Encrypted: i=1; AHgh+RoO3JPOdzN5eAT0YxeKn72l8HvwaJ3M7w5MnTAayresxv9wnjtVwYbRbvw0XABnZp5vQfb9ClEGrFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ3blbDpC0FVDzPy9JsrbvRJUxlR+GD57bHvu1mPK8PN2+adV1
	B58cLRtD5lM65yP2dYFnnpscWg6NvnpU3BHGxHXt0dOreEySPiDwPYIsqS7bs4wAi3VIwAcRnkG
	nvxRcoi3NBJqtoJFBoi9gpY3yCPRrOQCEZpxRpaWXjBxiB1mt8FgHgZxGHL8=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c40d:b0:495:f104:d895 with SMTP id
 5614622812f47-4ad5b88751cmr1577943b6e.31.1785245489676; Tue, 28 Jul 2026
 06:31:29 -0700 (PDT)
Date: Tue, 28 Jul 2026 06:31:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a68af31.073198cf.94f0f.0049.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in uvcg_video_init
From: syzbot <syzbot+8dcac923582c28505fd7@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    62cc90241548 Merge tag 'mm-hotfixes-stable-2026-07-27-14-1..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=175316b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=8dcac923582c28505fd7
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/824c8ce85a0f/disk-62cc9024.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a1e6cc0e8f11/vmlinux-62cc9024.xz
kernel image: https://storage.googleapis.com/syzbot-assets/807679f73b90/bzImage-62cc9024.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8dcac923582c28505fd7@syzkaller.appspotmail.com

configfs-gadget.g1 gadget.32: uvc: uvc_function_bind()
Oops: general protection fault, probably for non-canonical address 0xdffffc00000000ec: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000760-0x0000000000000767]
CPU: 1 UID: 0 PID: 8101 Comm: syz.4.604 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:uvcg_video_init.cold+0x5f/0x135 drivers/usb/gadget/function/uvc_video.c:824
Code: e0 2a 80 3c 02 00 74 08 48 89 df e8 6a bd 25 01 48 8b 2b b8 ff ff 37 00 48 c1 e0 2a 48 8d bd 60 07 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 b1 00 00 00 48 8d bd 90 07 00 00 b8 ff ff 37 00
RSP: 0000:ffffc9000d2d7878 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff888055368840 RCX: ffffc900065b2000
RDX: 00000000000000ec RSI: ffffffff81552b56 RDI: 0000000000000760
RBP: 0000000000000000 R08: 0000000000000007 R09: fffffffffffff000
R10: fffffffffffffffc R11: ffffffff8bba81c5 R12: ffff8880553688a0
R13: 0000000000000003 R14: ffff8880553686a0 R15: ffff88804c7c6528
FS:  00007f59706d16c0(0000) GS:ffff888123edc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c379612 CR3: 0000000022a85000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 uvc_function_bind+0x136e/0x1939 drivers/usb/gadget/function/f_uvc.c:874
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
RIP: 0033:0x7f596f79de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f59706d1028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f596fa25fa0 RCX: 00007f596f79de99
RDX: 000000000000000c RSI: 0000200000001f00 RDI: 0000000000000004
RBP: 00007f596f833eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f596fa26038 R14: 00007f596fa25fa0 R15: 00007ffed2857f28
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:uvcg_video_init.cold+0x5f/0x135 drivers/usb/gadget/function/uvc_video.c:824
Code: e0 2a 80 3c 02 00 74 08 48 89 df e8 6a bd 25 01 48 8b 2b b8 ff ff 37 00 48 c1 e0 2a 48 8d bd 60 07 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 b1 00 00 00 48 8d bd 90 07 00 00 b8 ff ff 37 00
RSP: 0000:ffffc9000d2d7878 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff888055368840 RCX: ffffc900065b2000
RDX: 00000000000000ec RSI: ffffffff81552b56 RDI: 0000000000000760
RBP: 0000000000000000 R08: 0000000000000007 R09: fffffffffffff000
R10: fffffffffffffffc R11: ffffffff8bba81c5 R12: ffff8880553688a0
R13: 0000000000000003 R14: ffff8880553686a0 R15: ffff88804c7c6528
FS:  00007f59706d16c0(0000) GS:ffff888123ddc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055558731aa48 CR3: 0000000022a85000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	e0 2a                	loopne 0x2c
   2:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   6:	74 08                	je     0x10
   8:	48 89 df             	mov    %rbx,%rdi
   b:	e8 6a bd 25 01       	call   0x125bd7a
  10:	48 8b 2b             	mov    (%rbx),%rbp
  13:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
  18:	48 c1 e0 2a          	shl    $0x2a,%rax
  1c:	48 8d bd 60 07 00 00 	lea    0x760(%rbp),%rdi
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 b1 00 00 00    	jne    0xe5
  34:	48 8d bd 90 07 00 00 	lea    0x790(%rbp),%rdi
  3b:	b8 ff ff 37 00       	mov    $0x37ffff,%eax


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
