Received: from mail-ot1-f77.google.com (mail-ot1-f77.google.com [209.85.210.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD81448397
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 13:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246811; cv=none; b=AXh7Vz2WNHON/glP3xp1s4hQKfu5kQLyXwmbLDuoKtEFxNET3n7K1Y1spSKNu97cvHBZthReD7kQhhb5ZyKA3WVVZiMcOoxPC75db6w3Ria6/4fbPBgfTZY4j3zGwZfC4oPVsFqwgj+15ZYrtuoJgcXxbwGep6jhVmfcK66TNAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246811; c=relaxed/simple;
	bh=ueZhJN+ZzjyLbnj0e1O/hXBQBidFzGZAXEmPlgwglmg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=JubTGpBofWrHvrYghXTkGukIEl0Q9hbssU5lBdnnwgwdCPkYM5TrGo0k9zR1kPGAb12qpcxFVEORfqm2O7BLSI/oTUTpkId/0e6D4QM+I/TxZOBwOYElIaRA3b887v91m13aH0aLz/DL4IBKmxgXP5RzYSfVq6wpG0PGISH7H3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f77.google.com with SMTP id 46e09a7af769-7e9e54e9cf5so4670688a34.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 06:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246809; x=1785851609;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/scBBGJuxzM0Bw+7LjILC4NIaAGnSa7Rof4HQGGdVxg=;
        b=BDVMoUqTp8UFB0T8DRXEmOw5dHUy+LBMCm03Nv+0ZQ97hdoUubBguATONA8a8PtTMV
         Q6TBPKyM/eGaI+wAoVbWRn/1FS3GqVXvgeFH4jsoXcE9JC9My1FrDVcjHDHshV0gL9V0
         mK16RBudj7BnnV9sCRjMJuvCsZtPlGQepGsmNJBYC1Hf8wjNHfzzP5Tyha1ROMbPHIWU
         xdAl0jX663KfBXtiplLAnLVzu+5LpcuBDM7roltObPSLn4QN437wqWK0MSWeiqOuLP/d
         dVrt70qF+hswcgNZ4WEU/ZzKxYMoSR+4azLpmbPWOPkyh9k5aCq0/3KEC4a2qGL/Av7i
         W7ug==
X-Forwarded-Encrypted: i=1; AHgh+RqQzWppCp5AR2A2KiLtoCuUgOyJO2lLs5r9M1gc+EypTQWQikC9fJoJjlNjRAL4YJI135wZ7FT9hgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwThLrES1NhFa8cgAMIIDwkdWRJPxOhAdiCMBh2zfPuPF9i0bvT
	lDjeWB+ok6fhoD4zn1jjSzsO+J5zyKXgcziv+lCLgk+1wv/Nc0g6mFUSHdbRrd//QdM9k9W3PvK
	5iQyy55dTQIV+znHUUtKnGZCRO8H2s+QPpLEATk6nuxcv33CJS+Mb9kmthyk=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81cb:b0:6aa:e5e4:359b with SMTP id
 006d021491bc7-6ac9658f811mr1439466eaf.0.1785246808958; Tue, 28 Jul 2026
 06:53:28 -0700 (PDT)
Date: Tue, 28 Jul 2026 06:53:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a68b458.4c659fcc.19cd90.0023.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in f_midi2_free_ep
From: syzbot <syzbot+3451bfda4264c512ef27@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    62cc90241548 Merge tag 'mm-hotfixes-stable-2026-07-27-14-1..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16d79632580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e38b15c29e6a1d9
dashboard link: https://syzkaller.appspot.com/bug?extid=3451bfda4264c512ef27
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/56d8634f34de/disk-62cc9024.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9fb5d107947d/vmlinux-62cc9024.xz
kernel image: https://storage.googleapis.com/syzbot-assets/549310ac10a0/bzImage-62cc9024.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3451bfda4264c512ef27@syzkaller.appspotmail.com

configfs-gadget.g1 gadget.32: Error: no playback and capture channels
Oops: general protection fault, probably for non-canonical address 0xdffffc00000000e6: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000730-0x0000000000000737]
CPU: 0 UID: 0 PID: 30441 Comm: syz.7.6919 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:f_midi2_free_ep_reqs drivers/usb/gadget/function/f_midi2.c:1166 [inline]
RIP: 0010:f_midi2_free_ep+0x52/0x2f0 drivers/usb/gadget/function/f_midi2.c:1208
Code: 4c 89 f0 48 c1 e8 03 80 3c 28 00 74 08 4c 89 f7 e8 33 03 64 fa 41 bc 30 07 00 00 4d 03 26 4c 89 e0 48 c1 e8 03 48 89 44 24 30 <0f> b6 04 28 84 c0 0f 85 5d 02 00 00 41 8b 1c 24 31 ff 89 de e8 f5
RSP: 0018:ffffc900042c7708 EFLAGS: 00010212
RAX: 00000000000000e6 RBX: ffff888071980000 RCX: 0000000000080000
RDX: ffffc90010e61000 RSI: 0000000000028c94 RDI: 0000000000028c95
RBP: dffffc0000000000 R08: ffffffff90579137 R09: 1ffffffff20af226
R10: dffffc0000000000 R11: fffffbfff20af227 R12: 0000000000000730
R13: dffffc0000000000 R14: ffff888071980128 R15: dffffc0000000000
FS:  00007f8d469916c0(0000) GS:ffff888124f4e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f79503909c0 CR3: 00000000444c8000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 f_midi2_unbind+0x9b/0x340 drivers/usb/gadget/function/f_midi2.c:2066
 purge_configs_funcs+0x248/0x3d0 drivers/usb/gadget/configfs.c:1600
 configfs_composite_bind+0x106d/0x1410 drivers/usb/gadget/configfs.c:1824
 gadget_bind_driver+0x2ca/0x9e0 drivers/usb/gadget/udc/core.c:1662
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:898
 __driver_attach+0x339/0x600 drivers/base/dd.c:1292
 bus_for_each_dev+0x23b/0x2c0 drivers/base/bus.c:383
 bus_add_driver+0x345/0x670 drivers/base/bus.c:763
 driver_register+0x23a/0x320 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1752
 gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x337/0x430 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:687
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8d45b9de99
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f8d46991028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f8d45e25fa0 RCX: 00007f8d45b9de99
RDX: 000000000000000d RSI: 0000200000000480 RDI: 0000000000000007
RBP: 00007f8d45c33eaf R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f8d45e26038 R14: 00007f8d45e25fa0 R15: 00007ffd45bdc428
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f_midi2_free_ep_reqs drivers/usb/gadget/function/f_midi2.c:1166 [inline]
RIP: 0010:f_midi2_free_ep+0x52/0x2f0 drivers/usb/gadget/function/f_midi2.c:1208
Code: 4c 89 f0 48 c1 e8 03 80 3c 28 00 74 08 4c 89 f7 e8 33 03 64 fa 41 bc 30 07 00 00 4d 03 26 4c 89 e0 48 c1 e8 03 48 89 44 24 30 <0f> b6 04 28 84 c0 0f 85 5d 02 00 00 41 8b 1c 24 31 ff 89 de e8 f5
RSP: 0018:ffffc900042c7708 EFLAGS: 00010212
RAX: 00000000000000e6 RBX: ffff888071980000 RCX: 0000000000080000
RDX: ffffc90010e61000 RSI: 0000000000028c94 RDI: 0000000000028c95
RBP: dffffc0000000000 R08: ffffffff90579137 R09: 1ffffffff20af226
R10: dffffc0000000000 R11: fffffbfff20af227 R12: 0000000000000730
R13: dffffc0000000000 R14: ffff888071980128 R15: dffffc0000000000
FS:  00007f8d469916c0(0000) GS:ffff888124f4e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f79503909c0 CR3: 00000000444c8000 CR4: 0000000000350ef0
----------------
Code disassembly (best guess):
   0:	4c 89 f0             	mov    %r14,%rax
   3:	48 c1 e8 03          	shr    $0x3,%rax
   7:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
   b:	74 08                	je     0x15
   d:	4c 89 f7             	mov    %r14,%rdi
  10:	e8 33 03 64 fa       	call   0xfa640348
  15:	41 bc 30 07 00 00    	mov    $0x730,%r12d
  1b:	4d 03 26             	add    (%r14),%r12
  1e:	4c 89 e0             	mov    %r12,%rax
  21:	48 c1 e8 03          	shr    $0x3,%rax
  25:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
* 2a:	0f b6 04 28          	movzbl (%rax,%rbp,1),%eax <-- trapping instruction
  2e:	84 c0                	test   %al,%al
  30:	0f 85 5d 02 00 00    	jne    0x293
  36:	41 8b 1c 24          	mov    (%r12),%ebx
  3a:	31 ff                	xor    %edi,%edi
  3c:	89 de                	mov    %ebx,%esi
  3e:	e8                   	.byte 0xe8
  3f:	f5                   	cmc


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
