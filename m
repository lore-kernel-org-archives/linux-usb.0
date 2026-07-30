Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED01411671
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 11:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785410876; cv=pass; b=A4ykJ/vh6PomcMdCyamY6WuBQRNLJ+i1NjXLfcgyvsxQ3nWy06nkHkNt4Rhb+Ij9UecIEqvZX5B+y19ngwYR/VBpUZOK1kl0Cc+2MkT6nG1W00usbeF8EaJd2w88b67hjgxHJxNVgMKwgDiFqSXHbultk9rhXqTkPPdwgoTN5DQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785410876; c=relaxed/simple;
	bh=VyRVO2Zh/9zaiSllqrXkNXn0fwfsLiXgx0OdgHwlH/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AnSb1CQgLEOm+rGbX0dwUTK1mNwWxCDzilc8uouou/6SfIxkTsTlIHWa67per43fK2xbvLcgeW7v0WQL0UqtEqDpxveJOcp63WjlSpQt97z6IX1yGvJlKWHDA5f7F62gCSENJISjYafKZvq2Eoc7/BZ1TvlJweq/F1ZdpA6igO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A3JDipkb; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A3JDipkb"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-497d6c2d000so1096978b6e.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 04:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785410872; cv=none;
        d=google.com; s=arc-20260327;
        b=aygp7tcaQY6NvBWd/gp+GPAs4aP1OMz8d7C1cuqTJY8e8QrhK3aRZSIdvSg3txL50X
         kAcBBJZET8PjkpzShoa3iyLoElPfraT4zjNYSRemWEa+NLsyIZbpkZoTJs54fHhItZX3
         z6cTpgXUVC1nUHh1K+cDSDznARKovWe58RO0u4lkN+WHjicbBY50tz2tB+5eL05tw6Uk
         A+O51z1aIKiuGHeSspRsDgHVaFxv5JtOEWsY2GA2/gdZmv67sb+MIZdSAIDyAXy5k6LA
         CFfkGttn2PQzsiZWIdDlTYnR7Lx/1GWVcte2R1ZhzJG6ETqyp9BlezNg2PbzeciADKqv
         dyPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MEdZbJ2RzlFNNCIRY5GvM8pklw+63zt+z3tJIQ7XRZE=;
        fh=/gRdrOhZeh4IdCerOjjRWfSfEAzzV40FQp3eayVybhw=;
        b=EyQhwpRmY9+dGiA3bqVa2C01WwyZ1OzY5FK7+V23UAAC3IUHkpSOc5yu7dpFNDVQB5
         cfHQ3mWmaIFr6TxgN+BoGS2MbxOn9i3fFI0I5qWcxc/vVCaio0oE9fm9SdEoK6fgY9Fr
         Wukti3jQiWoxZ21Ac2M6YRMqPrxaE29vzmibWJ6FKT7ws4Uk8Fh+y1wRK7TRrXAY/oj5
         MqHd7eLzsq+5LUd73PVcG67PxLBNJacU2yy5ZNNOPQbF4dKNcsAYaWdob9o44gvqt0jG
         qpMwSW+hRPcrHKGQnoRW3x3aTa1feIVnMk3bQolxnTbHjxBu7uBVsjXZczCmMYGjnMaZ
         sXUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785410872; x=1786015672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MEdZbJ2RzlFNNCIRY5GvM8pklw+63zt+z3tJIQ7XRZE=;
        b=A3JDipkbXRlMcGHTNdKmls9E5yb/u1LDj11I+rJy5nLizKxzQK3PYhB/3R9HaAcBED
         0e4YwtXDECZqwnEY4MR6z79+yjbg9zuGsPQEV9daoMK3abQj/YSPM1K8nF9Bz7KNYA8A
         dg4rm7ln8ZWUZ+A+/yynI47piu8ZtdGF5IWFNkYauRiJZ792r0uBrgLH89HI2y/hBtIU
         zH49wabFxUghf+E9C7kR2hRwuolDB29bEsrItnO4Oxjbuey+YFh/fp+ukldQ8eywkcKC
         7ogmet3bDryZF14PJo1yLKW6McfjHeTYmZEd4LBpYg0RT3vRn1n/NyGkKXnsDK1mfDR6
         BWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785410872; x=1786015672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MEdZbJ2RzlFNNCIRY5GvM8pklw+63zt+z3tJIQ7XRZE=;
        b=qDPTgl/o6JGJxkfN5nhzmh3a8ozYFg9Mc5gjHbPrVYi/mvdh7kNh+7WDkv9TGx9A/L
         dfJPpChF3EDsEDzq2Olz67wufgPb4g3teWqi5fZLCh7YCEClcpl/OZUVDql8Sc0V146e
         fqx3xUUr3igxsIop4FcIQRm6p5MZByWgIWEsDVQ74O4CBEa/J3h1FQhGGJBgmwzyhyFt
         YDl1pKxqvyc/JwiAONca8WqruP45XA/z8bcpzjJs2YP5QO/sUWPcbQZJ9Yk8w5ZV6BAt
         jXsja5d+sg+Eo/vKgkGlRfdMbhL0WGdOEYRbHySkBGgE7uUcY3uiLRqX6JX7aSK/73ZF
         Pd8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq2Jt6qFIs/OnVyE4kDajs7oPiPDKyP/IIdq0jrn6/0qY8hyvXZNKp75g9WVxFOY7scixGctWt4dO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLvAnY1QQ0Y5ZUdQbE8sPYuKEpE62t1LjLflWAcBav0qMtX1Yk
	LHINV2Q1GrAoLOGel9z9vP46BaEm0C/+tveKNJk4rVZy2i2wxOA5+VXieQA+8hjc3bAXFPogMag
	r9rb9Jseo/mawNGsNaDLzuw5cLztCU1rgIUfSdONw
X-Gm-Gg: AR+sD11SHTW747bsdvuwfUkYB/kMSy0jIbQvo1Tl8LzzBbTi86WqA87fY+qFnx8pte6
	hkzfx7JsPTG6PlXjp9tSGT2cBbiRUtufyF6wWto9LpMUSTl74VpgZLIVdCeNuAZUfRq342YtjbP
	mqwLmEO+uDawO3ua0AinSlUVYQ4MhIrXxxy2M0gftad2C7DeOpNnoCDYe7tRq4QduQaKMviBX6/
	BX2NoFcBC5wMbymCyinebPStY+I4xENZbrXmGp18FvKjAwVVF5Uu8oqnxIyadq49UJ4Ce7wwh4l
	o/XnXgFR/u6Td/s0VyCK9DpBAp5FmaASnGfQBtjPIRCzo7m4iGtG+3ACkE5g4GNQOV1aKolDa0u
	61GbOox40zziEwXqlizuIIKIBABBpdZJFMk4lnYf9l0GcAIMbYH2fB/VQA/xvphSkAAg6Z2nKVr
	2Sfgg+cMU84iFGx7SKb1TvnqtAH1JWOvXa5RE=
X-Received: by 2002:a05:6808:10c1:b0:4a0:6d4c:7cc1 with SMTP id
 5614622812f47-4ad94da0d00mr117213b6e.0.1785410871759; Thu, 30 Jul 2026
 04:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a68b458.4c659fcc.19cd90.0023.GAE@google.com> <6a6acab8.57649fcc.360844.000f.GAE@google.com>
In-Reply-To: <6a6acab8.57649fcc.360844.000f.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 30 Jul 2026 13:27:39 +0200
X-Gm-Features: AUfX_myv4YTRKCbzavree__bmKnQTvoPgrnCHiobNWjVzoplxNSUfM_jTddr7r0
Message-ID: <CANp29Y6stM3bpNWiQoh9mQnnQYKWjWoAOF=K0_cvZRxhczUyUw@mail.gmail.com>
Subject: Re: [syzbot] [usb?] general protection fault in f_midi2_free_ep
To: syzbot <syzbot+3451bfda4264c512ef27@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz dup: general protection fault in f_midi2_stop_eps

On Thu, Jul 30, 2026 at 5:53=E2=80=AFAM syzbot
<syzbot+3451bfda4264c512ef27@syzkaller.appspotmail.com> wrote:
>
> syzbot has found a reproducer for the following issue on:
>
> HEAD commit:    fc46aed51f62 Merge tag 'for-linus' of git://git.kernel.or=
g..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=3D142cd9b958000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dcb17729fb04b1=
e3a
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D3451bfda4264c51=
2ef27
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e25=
5-1~exp1~20260613092250.77), Debian LLD 22.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D12ab248e580=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D118ab8c658000=
0
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/955cec68f017/dis=
k-fc46aed5.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/a9cb903c7039/vmlinu=
x-fc46aed5.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/54a5b24a2b25/b=
zImage-fc46aed5.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+3451bfda4264c512ef27@syzkaller.appspotmail.com
>
> Oops: gen[   99.553665][ T5620] Oops: general protection fault, probably =
for non-canonical address 0xdffffc00000000ee: 0000 [#1] SMP KASAN PTI
> KASAN: null-ptr-deref in range [0x0000000000000770-0x0000000000000777]
> CPU: 0 UID: 0 PID: 5620 Comm: syz-executor121 Not tainted syzkaller #0 PR=
EEMPT_{RT,(full)}
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 07/24/2026
> RIP: 0010:f_midi2_free_ep_reqs drivers/usb/gadget/function/f_midi2.c:1166=
 [inline]
> RIP: 0010:f_midi2_free_ep+0x52/0x2f0 drivers/usb/gadget/function/f_midi2.=
c:1208
> Code: 4c 89 f0 48 c1 e8 03 80 3c 28 00 74 08 4c 89 f7 e8 23 9d e7 fa 41 b=
c 70 07 00 00 4d 03 26 4c 89 e0 48 c1 e8 03 48 89 44 24 30 <0f> b6 04 28 84=
 c0 0f 85 5d 02 00 00 41 8b 1c 24 31 ff 89 de e8 d5
> RSP: 0018:ffffc900040df978 EFLAGS: 00010206
> RAX: 00000000000000ee RBX: ffff8880446f4000 RCX: ffff888038dcdd00
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: dffffc0000000000 R08: ffffffff8faf9837 R09: 1ffffffff1f5f306
> R10: dffffc0000000000 R11: fffffbfff1f5f307 R12: 0000000000000770
> R13: dffffc0000000000 R14: ffff8880446f4128 R15: dffffc0000000000
> FS:  000055558593b400(0000) GS:ffff888125c41000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00005653470e07a0 CR3: 0000000042ae2000 CR4: 00000000003526f0
> Call Trace:
>  <TASK>
>  f_midi2_unbind+0x9b/0x340 drivers/usb/gadget/function/f_midi2.c:2066
>  purge_configs_funcs+0x248/0x3d0 drivers/usb/gadget/configfs.c:1600
>  configfs_composite_unbind+0xa0/0x1b0 drivers/usb/gadget/configfs.c:1846
>  gadget_unbind_driver+0x1cb/0x410 drivers/usb/gadget/udc/core.c:1724
>  device_remove drivers/base/dd.c:616 [inline]
>  __device_release_driver drivers/base/dd.c:1349 [inline]
>  device_release_driver_internal+0x48b/0x880 drivers/base/dd.c:1372
>  driver_detach+0x1f3/0x2d0 drivers/base/dd.c:1435
>  bus_remove_driver+0x229/0x320 drivers/base/bus.c:832
>  usb_gadget_unregister_driver+0x4e/0x70 drivers/usb/gadget/udc/core.c:178=
4
>  unregister_gadget drivers/usb/gadget/configfs.c:263 [inline]
>  gadget_dev_desc_UDC_store+0x17a/0x2f0 drivers/usb/gadget/configfs.c:290
>  flush_write_buffer fs/configfs/file.c:207 [inline]
>  configfs_write_iter+0x33a/0x430 fs/configfs/file.c:229
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x61e/0xbb0 fs/read_write.c:687
>  ksys_write+0x156/0x270 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fd367807789
> Code: c0 79 93 eb d5 48 8d 7c 1d 00 eb 99 0f 1f 44 00 00 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 d8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffd35b431c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> RAX: ffffffffffffffda RBX: 6769666e6f632f2e RCX: 00007fd367807789
> RDX: 0000000000000001 RSI: 00002000000004c0 RDI: 0000000000000004
> RBP: 6e6f635f796d2f2e R08: 0000000000000006 R09: 0000000000000006
> R10: 0000000000000006 R11: 0000000000000246 R12: 00007ffd35b43338
> R13: 431bde82d7b634db R14: 00007fd36789ac40 R15: 0000000000000002
>  </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:f_midi2_free_ep_reqs drivers/usb/gadget/function/f_midi2.c:1166=
 [inline]
> RIP: 0010:f_midi2_free_ep+0x52/0x2f0 drivers/usb/gadget/function/f_midi2.=
c:1208
> Code: 4c 89 f0 48 c1 e8 03 80 3c 28 00 74 08 4c 89 f7 e8 23 9d e7 fa 41 b=
c 70 07 00 00 4d 03 26 4c 89 e0 48 c1 e8 03 48 89 44 24 30 <0f> b6 04 28 84=
 c0 0f 85 5d 02 00 00 41 8b 1c 24 31 ff 89 de e8 d5
> RSP: 0018:ffffc900040df978 EFLAGS: 00010206
> RAX: 00000000000000ee RBX: ffff8880446f4000 RCX: ffff888038dcdd00
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: dffffc0000000000 R08: ffffffff8faf9837 R09: 1ffffffff1f5f306
> R10: dffffc0000000000 R11: fffffbfff1f5f307 R12: 0000000000000770
> R13: dffffc0000000000 R14: ffff8880446f4128 R15: dffffc0000000000
> FS:  000055558593b400(0000) GS:ffff888125c41000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00005653470e07a0 CR3: 0000000042ae2000 CR4: 00000000003526f0
> ----------------
> Code disassembly (best guess):
>    0:   4c 89 f0                mov    %r14,%rax
>    3:   48 c1 e8 03             shr    $0x3,%rax
>    7:   80 3c 28 00             cmpb   $0x0,(%rax,%rbp,1)
>    b:   74 08                   je     0x15
>    d:   4c 89 f7                mov    %r14,%rdi
>   10:   e8 23 9d e7 fa          call   0xfae79d38
>   15:   41 bc 70 07 00 00       mov    $0x770,%r12d
>   1b:   4d 03 26                add    (%r14),%r12
>   1e:   4c 89 e0                mov    %r12,%rax
>   21:   48 c1 e8 03             shr    $0x3,%rax
>   25:   48 89 44 24 30          mov    %rax,0x30(%rsp)
> * 2a:   0f b6 04 28             movzbl (%rax,%rbp,1),%eax <-- trapping in=
struction
>   2e:   84 c0                   test   %al,%al
>   30:   0f 85 5d 02 00 00       jne    0x293
>   36:   41 8b 1c 24             mov    (%r12),%ebx
>   3a:   31 ff                   xor    %edi,%edi
>   3c:   89 de                   mov    %ebx,%esi
>   3e:   e8                      .byte 0xe8
>   3f:   d5                      .byte 0xd5
>
>
> ---
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/6a6acab8.57649fcc.360844.000f.GAE%40google.com.
