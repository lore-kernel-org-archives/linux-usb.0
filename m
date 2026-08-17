Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A7C3BFE5D
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 08:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786954048; cv=none; b=f+RAj2iDa2vI0WYDxDA63ybaq1k9ssa/LQS+x3fA/DIepdrPPktAVNvHH0TKBioPv43zC85fW+fFMBmXhsACNBgou7S3Yq9RbAzEznd5cww0WsIAbHPHeiaohhwAtSP6cEAT3v+8MNGFvk8uKaDihvcd4AU93pbYvOXT33AqZKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786954048; c=relaxed/simple;
	bh=BXpxuULzoqr2DQeVbqMv/+OAmzA+4AGu4R66vGV4NoY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fpJ6+npUahc10KBT3Kq6/4okrcwN7F8uTkVsIwi3S/qnqcPOE93aW0FWjkEpKVrm8ybfSqK41Q0V9n8BSNCPoBUVX3eR9M+NOLq7BfmPvlvNTx/yy3hsQZ1MBMJdvMsG3pXjei0E32PbhwaAU285w+aieIJ1vbNPXJc8jKOyElY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-6b1000e2b5eso772971eaf.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 01:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954046; x=1787558846;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bSKxZLOz0guAeyUpbIz4eEX6fohl3KsYbdqFXKq8QbU=;
        b=r/VrGu6FWHzD0W/Vhm5CEBrUikk4TgFZlB9qFNKDEICULUDIoWiTavAKDseWve5wJG
         k4IvgydNyCWtKt1h+W0lv7mGi8y51aGP3rL5c9+wCp44eKPAiYZKEeO3s+KF3zMew/IC
         M2t7ifPaRuppGJDWjbLjAvSxXUeeNL08EirsKhWCECqmCBOgQO26A7YhSB0fw8RNkk3A
         FicdkglWKrQsRHGuauWDOXZnDWvD2XGKR0FtpxVMz5qHLUD1pF5wWgbDFgOBcmerTngw
         Fv+yBBK6+xAgX/WvIk4fQqoqdfQBrQZI2IMi3idhFjZZpHijbKFhGMMawWQydh2MJxWC
         NS5g==
X-Forwarded-Encrypted: i=1; AHgh+Ro26H+NFMzni/jK+sXnaf6np8tgD7snUH5g7i1Dd8SyvAWcDtyk/cEQRu/4AMdeQOe5sZydFOce6gg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO2XsQbdfcT5YwOmVkBChDNUdcXjukcv1CFkJG3KNHMz2tjLYu
	oKtF/lM3vFvPCQbUHrudok63qjQWCwRZgMd1Ap6a52mTY1o0wy9X/XdadpB1xXnPCOisb3Lsrll
	4ZSJ+zF7eWHb2hvFa15YafS8ZjNtT2IkV8zh/JJfWUN2MJjk3Vz5IHXnWH78=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:160a:b0:6a3:6f5d:4d6c with SMTP id
 006d021491bc7-6b0c5a91240mr18382545eaf.6.1786954046138; Mon, 17 Aug 2026
 01:07:26 -0700 (PDT)
Date: Mon, 17 Aug 2026 01:07:26 -0700
In-Reply-To: <6a82baac.10853dc7.22f513.001a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a82c13e.f7a79266.2f965f.0022.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in fsg_common_set_num_buffers
From: syzbot <syzbot+791be35f1fbcc85d06d7@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    dcb68831eac7 Merge tag 'block-7.2-20260815' of git://git.k..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12aad6c6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d67342c314f228d
dashboard link: https://syzkaller.appspot.com/bug?extid=791be35f1fbcc85d06d7
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1033fa79580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=105cd949580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/616b82a1afb9/disk-dcb68831.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4b1958ef02ef/vmlinux-dcb68831.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8138e3edc5b6/bzImage-dcb68831.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+791be35f1fbcc85d06d7@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
CPU: 1 UID: 0 PID: 5606 Comm: syz-executor407 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
RIP: 0010:fsg_common_set_num_buffers+0xad/0x340 drivers/usb/gadget/function/f_mass_storage.c:2763
Code: 42 80 3c 30 00 0f 85 52 02 00 00 48 89 6d e0 e8 99 48 2c fa be c0 0c 00 00 bf 00 40 00 00 e8 ca 6c 90 fa 48 89 ea 48 c1 ea 03 <42> 80 3c 32 00 0f 85 04 02 00 00 48 89 45 00 48 85 c0 75 95 e8 6a
RSP: 0018:ffffc9000333fbc0 EFLAGS: 00010202
RAX: ffff88807ec24000 RBX: 0000000000000000 RCX: 0000000000004000
RDX: 0000000000000002 RSI: ffffffff8c600300 RDI: ffffffff8e674928
RBP: 0000000000000010 R08: 0000000000000cc0 R09: 00000000ffffffff
R10: ffffed100fd85000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000010 R14: dffffc0000000000 R15: ffff88807c0b4000
FS:  000055556964e400(0000) GS:ffff888123cde000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000056020ff0f000 CR3: 00000000772e6000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 fsg_opts_num_buffers_store+0x168/0x1b0 drivers/usb/gadget/function/f_mass_storage.c:3452
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x302/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb82a557cb9
Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc1e17d488 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000200000000000 RCX: 00007fb82a557cb9
RDX: 0000000000000002 RSI: 0000200000000000 RDI: 0000000000000003
RBP: 6769666e6f632f2e R08: 0000000000000000 R09: 00007ffc1e17d5c8
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffc1e17d5b8
R13: 0000000000000002 R14: 0000200000000008 R15: 0000000000000002
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:fsg_common_set_num_buffers+0xad/0x340 drivers/usb/gadget/function/f_mass_storage.c:2763
Code: 42 80 3c 30 00 0f 85 52 02 00 00 48 89 6d e0 e8 99 48 2c fa be c0 0c 00 00 bf 00 40 00 00 e8 ca 6c 90 fa 48 89 ea 48 c1 ea 03 <42> 80 3c 32 00 0f 85 04 02 00 00 48 89 45 00 48 85 c0 75 95 e8 6a
RSP: 0018:ffffc9000333fbc0 EFLAGS: 00010202
RAX: ffff88807ec24000 RBX: 0000000000000000 RCX: 0000000000004000
RDX: 0000000000000002 RSI: ffffffff8c600300 RDI: ffffffff8e674928
RBP: 0000000000000010 R08: 0000000000000cc0 R09: 00000000ffffffff
R10: ffffed100fd85000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000010 R14: dffffc0000000000 R15: ffff88807c0b4000
FS:  000055556964e400(0000) GS:ffff888123cde000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000056020ff0f000 CR3: 00000000772e6000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
   5:	0f 85 52 02 00 00    	jne    0x25d
   b:	48 89 6d e0          	mov    %rbp,-0x20(%rbp)
   f:	e8 99 48 2c fa       	call   0xfa2c48ad
  14:	be c0 0c 00 00       	mov    $0xcc0,%esi
  19:	bf 00 40 00 00       	mov    $0x4000,%edi
  1e:	e8 ca 6c 90 fa       	call   0xfa906ced
  23:	48 89 ea             	mov    %rbp,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	42 80 3c 32 00       	cmpb   $0x0,(%rdx,%r14,1) <-- trapping instruction
  2f:	0f 85 04 02 00 00    	jne    0x239
  35:	48 89 45 00          	mov    %rax,0x0(%rbp)
  39:	48 85 c0             	test   %rax,%rax
  3c:	75 95                	jne    0xffffffd3
  3e:	e8                   	.byte 0xe8
  3f:	6a                   	.byte 0x6a


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
