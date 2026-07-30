Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E4338644D
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 03:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785383610; cv=none; b=L2aytBBh3ZDxbMmmo+cGEs+ot98QKo/zPtGAFt4ZFDlHhUPaXNEi+v0P1h338DYvrOtwCt+cX4Nz4S89GVPhmVmjhbT6mD0Hq4W4iXKI/cSnWo859/3YoEEYOskpOaM8eAK2uvBNp+XTCFSVISl3dvLSO6nfZbqGlKAfwWlVh+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785383610; c=relaxed/simple;
	bh=LDllLnwV3aV0GH0096mzjFHWD3/UzzDoFM6Aw5xU8pI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Jyz3ai19MMZwkZp7Hjvti65chtjRXtzFZNeWd/M2gepIx4BbPiKgiNtch+8mpXYG+9dRYntU6NWGe4fKC3y0X4u1lxuBcg1ldeW411CGK+NLJ3r86ZIERBqCzVG778h/uE16syn+wCVf7jYeAI7l8LZ/vkGtoNgw4NZvu+tvkDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4959c49e054so864411b6e.3
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 20:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785383608; x=1785988408;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aCrqphRAOSvkdGDubkfWCnE/lEdeAKpBQgzJgZ6bcpk=;
        b=N+d6pHDj/ytImkhI3GSteLjb64ahxnZL7xcmuKzuB18GNxqkXqjAjCcigyNPhtTYWF
         WLxqCuXBaQ4hAxf2DsgaG9nWn6pXeJ0B3vih7NzG8ZlJ+rCHa5qjR0bTWe1KIuU5LEjK
         GsDEepHjKfZxVRGyjGPNmXIW5zxNAL+ARPPCitD0RREDIADekpoev/Mj1W4/pHgnMUNv
         f+o3d6YY2eqiI2fT3z+1vnIiShOqIyIqTfVYU5+3Fex0JhDCvSi1vq3vgh+tEQ/prGCu
         6ugK9RCoaneHFlGJbhBXPtO09Qm13GaewXyYZfKmyKIAkuKZFIjDVmfBSn46xcvkbvJ8
         3aKw==
X-Forwarded-Encrypted: i=1; AHgh+RrJZCaCT0/QEo6Jl0zqK9tIzEHbpK8YUK3qqarcYMjxZgo+z75yu6HGSah561HKtLRW50fLNLaWOLo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya3BAV7offama3NSwpDMhhzm66u5DqGHaIhawWe02F/f6+YVjE
	0fTIZgHIGzSEHf5YCaUfgRZlIo4SFbNaDxbMaWupxCojZx0igdcqgrG98JY4yHif5PrgB3wqy2T
	jf7va60RwF9Z0ggf8V2k1r4cDJ5v/rGBOlPlZ9rSr9uFn0+LEcSyfd4G4aX0=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:220f:b0:49f:a87e:2316 with SMTP id
 5614622812f47-4ad8792b9f5mr679115b6e.31.1785383608172; Wed, 29 Jul 2026
 20:53:28 -0700 (PDT)
Date: Wed, 29 Jul 2026 20:53:28 -0700
In-Reply-To: <6a68b458.4c659fcc.19cd90.0023.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6acab8.57649fcc.360844.000f.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in f_midi2_free_ep
From: syzbot <syzbot+3451bfda4264c512ef27@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    fc46aed51f62 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=142cd9b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=3451bfda4264c512ef27
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12ab248e580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=118ab8c6580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/955cec68f017/disk-fc46aed5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a9cb903c7039/vmlinux-fc46aed5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/54a5b24a2b25/bzImage-fc46aed5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3451bfda4264c512ef27@syzkaller.appspotmail.com

Oops: gen[   99.553665][ T5620] Oops: general protection fault, probably for non-canonical address 0xdffffc00000000ee: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000770-0x0000000000000777]
CPU: 0 UID: 0 PID: 5620 Comm: syz-executor121 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:f_midi2_free_ep_reqs drivers/usb/gadget/function/f_midi2.c:1166 [inline]
RIP: 0010:f_midi2_free_ep+0x52/0x2f0 drivers/usb/gadget/function/f_midi2.c:1208
Code: 4c 89 f0 48 c1 e8 03 80 3c 28 00 74 08 4c 89 f7 e8 23 9d e7 fa 41 bc 70 07 00 00 4d 03 26 4c 89 e0 48 c1 e8 03 48 89 44 24 30 <0f> b6 04 28 84 c0 0f 85 5d 02 00 00 41 8b 1c 24 31 ff 89 de e8 d5
RSP: 0018:ffffc900040df978 EFLAGS: 00010206
RAX: 00000000000000ee RBX: ffff8880446f4000 RCX: ffff888038dcdd00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: dffffc0000000000 R08: ffffffff8faf9837 R09: 1ffffffff1f5f306
R10: dffffc0000000000 R11: fffffbfff1f5f307 R12: 0000000000000770
R13: dffffc0000000000 R14: ffff8880446f4128 R15: dffffc0000000000
FS:  000055558593b400(0000) GS:ffff888125c41000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005653470e07a0 CR3: 0000000042ae2000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 f_midi2_unbind+0x9b/0x340 drivers/usb/gadget/function/f_midi2.c:2066
 purge_configs_funcs+0x248/0x3d0 drivers/usb/gadget/configfs.c:1600
 configfs_composite_unbind+0xa0/0x1b0 drivers/usb/gadget/configfs.c:1846
 gadget_unbind_driver+0x1cb/0x410 drivers/usb/gadget/udc/core.c:1724
 device_remove drivers/base/dd.c:616 [inline]
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x48b/0x880 drivers/base/dd.c:1372
 driver_detach+0x1f3/0x2d0 drivers/base/dd.c:1435
 bus_remove_driver+0x229/0x320 drivers/base/bus.c:832
 usb_gadget_unregister_driver+0x4e/0x70 drivers/usb/gadget/udc/core.c:1784
 unregister_gadget drivers/usb/gadget/configfs.c:263 [inline]
 gadget_dev_desc_UDC_store+0x17a/0x2f0 drivers/usb/gadget/configfs.c:290
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x33a/0x430 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd367807789
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd35b431c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 6769666e6f632f2e RCX: 00007fd367807789
RDX: 0000000000000001 RSI: 00002000000004c0 RDI: 0000000000000004
RBP: 6e6f635f796d2f2e R08: 0000000000000006 R09: 0000000000000006
R10: 0000000000000006 R11: 0000000000000246 R12: 00007ffd35b43338
R13: 431bde82d7b634db R14: 00007fd36789ac40 R15: 0000000000000002
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f_midi2_free_ep_reqs drivers/usb/gadget/function/f_midi2.c:1166 [inline]
RIP: 0010:f_midi2_free_ep+0x52/0x2f0 drivers/usb/gadget/function/f_midi2.c:1208
Code: 4c 89 f0 48 c1 e8 03 80 3c 28 00 74 08 4c 89 f7 e8 23 9d e7 fa 41 bc 70 07 00 00 4d 03 26 4c 89 e0 48 c1 e8 03 48 89 44 24 30 <0f> b6 04 28 84 c0 0f 85 5d 02 00 00 41 8b 1c 24 31 ff 89 de e8 d5
RSP: 0018:ffffc900040df978 EFLAGS: 00010206
RAX: 00000000000000ee RBX: ffff8880446f4000 RCX: ffff888038dcdd00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: dffffc0000000000 R08: ffffffff8faf9837 R09: 1ffffffff1f5f306
R10: dffffc0000000000 R11: fffffbfff1f5f307 R12: 0000000000000770
R13: dffffc0000000000 R14: ffff8880446f4128 R15: dffffc0000000000
FS:  000055558593b400(0000) GS:ffff888125c41000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005653470e07a0 CR3: 0000000042ae2000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	4c 89 f0             	mov    %r14,%rax
   3:	48 c1 e8 03          	shr    $0x3,%rax
   7:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
   b:	74 08                	je     0x15
   d:	4c 89 f7             	mov    %r14,%rdi
  10:	e8 23 9d e7 fa       	call   0xfae79d38
  15:	41 bc 70 07 00 00    	mov    $0x770,%r12d
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
  3f:	d5                   	.byte 0xd5


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
