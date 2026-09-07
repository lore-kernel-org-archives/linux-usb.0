Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EC7448CED
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 09:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773226; cv=pass; b=sK2ha9/E/yFNz1sJukfYCkU7Gd6Z+/znUJty7/ug4au6pAqV4T1EyAscDVPOFFcTspq4M4T/NS8jzg9qZ/1h2+q58i8nszlaG6+LRU9H6yG6QYqU9xzY/iczaPVXgTTPKATVqtWBYWTbzAlxVrCSA6xDWvRgqwjhHv4m1RVxkPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773226; c=relaxed/simple;
	bh=mC7a5EDBcGcXdf9xexehW6myji1JDZp7MQ5JYum/W90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNs/3fSXBESBiqdjVzKNjgqPXx7kG4H7fL5zM73T5dod7WbbZYxT9OUSEa9x2IrutPZP3DGZD61eIaz4RsbXe7n07MLraNKkXFucgHfeAt3Qm9nrES2gsi8Q1sLhLylVxkQem6XBA1b8hXHYmJQPpKIBxFUrDwvZyqppjK2ACzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZUi54MdW; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZUi54MdW"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7f4ea388ba6so3225755a34.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 02:26:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788773216; cv=none;
        d=google.com; s=arc-20260327;
        b=QIVpNXKk/5y1l/Dw12KYMM2AXUecNq8NaP4QUlSMwNYyOkI2/mAQeBUJIHBVpi7Lj+
         8HGpN97O1G8cj7g7Tl7z/J2mexD/CBc2RrUaXELhtTwWIJqlRsQ1TqkBOjA3iotEEeQY
         tkPJJLLhHpqPSP0hTly7auDPsJ1xg7DrueOngS/Hh3CbdfoChPCpqYh7cphtpIYVLAF3
         WuUWZmzP/0rea9W/UfG4ZDBQP0gJlMFwv/Hc8i3kgK75EnbfLirEW73pkz27hoZ9VAFC
         ph60q5Z1NBr/f6Q2AVgszTn2G4ynLmMvuifPUT9Qb6bwvFL31LqvvLvJIbNfexblgOi2
         YXeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FTIEx2PBsIhrJN7ThYqtCRgr3dToQNVBzH3sot1AzYA=;
        fh=sfm+Cx79QDCXiYAuD+v3qjIbapIHgY1WNqSBjwAhhZ4=;
        b=fNI9phgxlQNz5zhKpOd+nfahcMVwO8wF93mwgbIYMq58eAG7dngY2ODVp8tYj1Esvt
         LnMdNWOwhcTJL4s1pgxbjJIdRPPZUR4bYib6XBOLoZqJdWQtlbj/gZqpNVxKx2RPhuRC
         z3wkF3BinQORJvT3XA4xMhcRLRJRmccCpUqQ3L/X1y0laJuHYxuOBlPcEOdQ8levwedw
         d4A5Oesak8QJStTMbqEbycK3VPV9hiG5BsuXFfor1wYo5ygSOMMEIG1Q5HV+CGLxyET3
         HIpwC2KHF3HpFfgaXYQMXJDFtizTqZQddYFJSUKxbi6uFp2LIDYJJ08BMrL/ND9x/QK8
         DjIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788773216; x=1789378016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FTIEx2PBsIhrJN7ThYqtCRgr3dToQNVBzH3sot1AzYA=;
        b=ZUi54MdWmfAwukVsbMvj+tU5Zw90gwAIbml1wKMXv7usagqwAPX49Hu94mj7rtqbIJ
         uj205TbXFopuZLDM8V3OCXb0oErUPK4NiwcTBPmDtEmRLn7Qpye46C6NJjYmWBydzXTj
         G/hoUIS5b0GOqwLVXHKy2bdFvqCWzYdvolg0mB4eMObCWkEK+MlrygATibpr8KA29B77
         ZikrU599/xW3KSOEwNGutuj7Go8ahiZzTV8XTUmgKc7dSeEaiANO+b+zVuHPYSGY13eI
         JQQTVnsfdNxa3sdl9AqsINuzCN6W8eY/qkbG94KYzoVuoX/O+KrT7t9D24ynGZH6LFml
         7gYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773216; x=1789378016;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTIEx2PBsIhrJN7ThYqtCRgr3dToQNVBzH3sot1AzYA=;
        b=ks6TqD09wdUHxWNjeAvORespwnDxwnmh6RZrecRZpS5zYYtwj4rGAd/PZ6bJ8Po4HS
         xAcqh2txSOgmYBhjN54wTfztNF80jyPQNbYOWqQTnfOZfVyJtxsQScH4AwkZjn8L3DoK
         VDW//YyNraDrfq2Ve9Fg4qfy1rdx+fO5cM1ywbAYGv6dpO1kV3VieWbIj4CP3i7pFf3N
         7QP8VN/8TPlIaycxR9X7By9sKrjLP/V+ITJ9ilRig5iN9FQcLf7QQ7MSX570uBVIEo28
         i+DVAKFZzn2dFSJtGs0zfv6CaKWod5u5wKwDhs3GuLf4QPlinFHiWgzKY6sd/tvXf/qm
         5LrA==
X-Forwarded-Encrypted: i=1; AKwUvBwnn/1iHSvF0GXpA6XnF8pB4o1jRZRx/1hCqI1o+ZTudzeQToRh1OK/pnINVzlhOJp1itwuZQrxb94=@vger.kernel.org
X-Gm-Message-State: AFuF++mUjW46Goj+9Yy+II1DRjtjyZrORUUPUTSp+zwmmDODiXCvaIbf
	dVPTUQh9PAn0YVByid9tyzk5qIswaFjiYGNasGTuHibP+Ucgxdutblq2ZyQUYXL4twFcz4BsT8E
	naL09WMKK1roz+6mYzyLDIfwBjnj7bZRs0vW02o0t
X-Gm-Gg: AYBFou0qw246qxbOvdzzzoAZA0xy9HdclnpvNpUwHwzlBWgcJONBntjqCwg+0InpirR
	nfWkpNaUEWMdrEh5yi7+/LHIk4hH4hkcnW1Xav7IaimnXst+L2+r4J4SvyRNguqdjRLBd8GXDlX
	V3PpMKgRvSDTGY3bhNPWLHYJPJOG6cK8FpJ/zpqt2PDUnx/FzeKmuF8QqBGp+K+/g9QpOH4Q+Vl
	SSDP+vPmv2biEIA2LENCiBtB+cAhFNit2bPmrxgtpq9lbZY+N0BwE5S0E+4G/Bx2VHvxxeJ6mkF
	Pugg76lrufsprpq4UiOKjFZyC4jqv+v002svjMb21Av6MXi9vPNIfc7FoEDAeMKBKJ9EHVmzgfM
	uJxxUOsEGnbY0/Xnla/TarmSDXqBatKN65bZUOSEjxx1B6HYI5ZXgpYp/C1NEi0BzhuxSN8x8fj
	jX1td/pBXN3gnE
X-Received: by 2002:a05:6830:2313:b0:7e6:ef1d:4aeb with SMTP id
 46e09a7af769-7fa2028a499mr14947945a34.15.1788773215463; Mon, 07 Sep 2026
 02:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a7b1b45.9c11d2ce.289b96.0106.GAE@google.com>
In-Reply-To: <6a7b1b45.9c11d2ce.289b96.0106.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 7 Sep 2026 11:26:43 +0200
X-Gm-Features: AcwNN1XlkmrBQb_P1WaFP0eOqF2F7x2h8zDblIKnt3seP9IGn4Tc-x4GIlFCsAE
Message-ID: <CANp29Y5-qrUc9JB0w09598QNxAyE+U1ftayNj7tgnen==L7xLQ@mail.gmail.com>
Subject: Re: [syzbot] [usb?] WARNING: kobject bug in pch_udc_remove
To: syzbot <syzbot+3e2e533aa1b2a75525e7@syzkaller.appspotmail.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz invalid

See the discussion at
https://lore.kernel.org/all/6a88012e.dbb3a75c.13dd47.0007.GAE@google.com/T/

On Tue, Aug 11, 2026 at 2:53=E2=80=AFPM syzbot
<syzbot+3e2e533aa1b2a75525e7@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    d58772d8520c Merge tag 'regmap-fix-v7.2-rc7' of git://git=
...
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1099614958000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dc44651ea7dd2f=
307
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D3e2e533aa1b2a75=
525e7
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D=
ebian) 2.44
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D17bc2a9e580=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1729313258000=
0
>
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d=
900f083ada3/non_bootable_disk-d58772d8.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/caffbd0a7ec1/vmlinu=
x-d58772d8.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/686d959b6f96/b=
zImage-d58772d8.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+3e2e533aa1b2a75525e7@syzkaller.appspotmail.com
>
> pch_udc 0000:00:03.0: pch_udc_probe: request_irq(23) fail
> ------------[ cut here ]------------
> kobject: '(null)' (ffff888035ce0110): is not initialized, yet kobject_put=
() is being called.
> WARNING: lib/kobject.c:734 at kobject_put+0x252/0x640 lib/kobject.c:734, =
CPU#0: syz.0.17/5908
> Modules linked in:
> CPU: 0 UID: 0 PID: 5908 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(f=
ull)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.=
16.3-2 04/01/2014
> RIP: 0010:kobject_put+0x258/0x640 lib/kobject.c:734
> Code: 59 f6 48 89 da 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 0=
0 0f 85 5e 03 00 00 48 8d 3d de 47 83 05 48 8b 33 48 89 da <67> 48 0f b9 3a=
 e9 0b fe ff ff e8 b9 a8 59 f6 be 03 00 00 00 4c 89
> RSP: 0018:ffffc900035b7918 EFLAGS: 00010246
> RAX: dffffc0000000000 RBX: ffff888035ce0110 RCX: ffffffff8bb0c8c4
> RDX: ffff888035ce0110 RSI: 0000000000000000 RDI: ffffffff91341290
> RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: ffff888035ce014c
> R13: dffffc0000000000 R14: ffff888035ce1978 R15: ffff888035ce0608
> FS:  000055558de32500(0000) GS:ffff8880d5dec000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000557c252125d8 CR3: 0000000040736000 CR4: 0000000000352ef0
> Call Trace:
>  <TASK>
>  put_device+0x1f/0x30 drivers/base/core.c:3880
>  pch_udc_remove+0x47/0x510 drivers/usb/gadget/udc/pch_udc.c:2986
>  pch_udc_probe+0xcc6/0x1130 drivers/usb/gadget/udc/pch_udc.c:3109
>  local_pci_probe+0xdd/0x1b0 drivers/pci/pci-driver.c:332
>  pci_call_probe+0x176/0x800 drivers/pci/pci-driver.c:394
>  __pci_device_probe drivers/pci/pci-driver.c:455 [inline]
>  pci_device_probe+0x1cd/0x370 drivers/pci/pci-driver.c:489
>  call_driver_probe drivers/base/dd.c:628 [inline]
>  really_probe+0x241/0xa60 drivers/base/dd.c:706
>  __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
>  device_driver_attach+0xd1/0x220 drivers/base/dd.c:1203
>  bind_store+0xf4/0x190 drivers/base/bus.c:267
>  drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
>  sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
>  kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x6ac/0x1050 fs/read_write.c:687
>  ksys_write+0x12a/0x250 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f60b4b9e0d9
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffdce022f28 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> RAX: ffffffffffffffda RBX: 00007f60b4e25fa0 RCX: 00007f60b4b9e0d9
> RDX: 000000000000000d RSI: 0000200000000240 RDI: 0000000000000005
> RBP: 00007ffdce022f90 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
> R13: 00007f60b4e25fac R14: 00007f60b4e25fa0 R15: 00007f60b4e25fa0
>  </TASK>
> ----------------
> Code disassembly (best guess):
>    0:   59                      pop    %rcx
>    1:   f6 48 89 da             testb  $0xda,-0x77(%rax)
>    5:   48 b8 00 00 00 00 00    movabs $0xdffffc0000000000,%rax
>    c:   fc ff df
>    f:   48 c1 ea 03             shr    $0x3,%rdx
>   13:   80 3c 02 00             cmpb   $0x0,(%rdx,%rax,1)
>   17:   0f 85 5e 03 00 00       jne    0x37b
>   1d:   48 8d 3d de 47 83 05    lea    0x58347de(%rip),%rdi        # 0x58=
34802
>   24:   48 8b 33                mov    (%rbx),%rsi
>   27:   48 89 da                mov    %rbx,%rdx
> * 2a:   67 48 0f b9 3a          ud1    (%edx),%rdi <-- trapping instructi=
on
>   2f:   e9 0b fe ff ff          jmp    0xfffffe3f
>   34:   e8 b9 a8 59 f6          call   0xf659a8f2
>   39:   be 03 00 00 00          mov    $0x3,%esi
>   3e:   4c                      rex.WR
>   3f:   89                      .byte 0x89
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/6a7b1b45.9c11d2ce.289b96.0106.GAE%40google.com.
