Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F84A442B08
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 09:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773658; cv=pass; b=RJjp0rhtxZRA5yOwEIn4bPZPbgRAEmqfbJ++Pv74gY3dxi9OiZ/ZQQpetE79u9F7BYWHEvwMorIWlcq3E1Z36+N6aJ7PV/71BuEsWzFmWndQPv3b4llIPDPse806GhvLAHoz+SXwDfTw/0fNQmy9ws0hoQUqqXL4qEUakEHNxx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773658; c=relaxed/simple;
	bh=Vo8F0+IzNl47xU/QW/Bo2i/iy7wSLmdChvgjr3F0n/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/Gmgg5dParWoBw98RJCJQO/Q6MfHRnqyZVGrI9kd21Ux7zXyLLaAXyPME/QjRQ8RMvarNmgMKpMgzEeVKnDNIq7r5fU0f8d5SoEsy6/OzL8+Y2unHX8KEJHIYcCVsbPagyaUZioaZuYAFMNvAXR2ot/ODzJqH3FnWpuOM5eFHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eRcKo+mO; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eRcKo+mO"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso2863650a34.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 02:34:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788773655; cv=none;
        d=google.com; s=arc-20260327;
        b=n/sTz+bBWKUphfwOkXU2U0GXGjQmNyiPI/lljgFT5aUZYIwu0TZoVZCvDRxJUzqDB5
         JY4PZX3Rckox1r212SoSEeW+3BwiU/JKyDL6I5fe5ymMzgbwQ3wIrtQKu+/vb9379UmC
         NDFKFMYwEd6s0V/pUcJAPYeklGSjJNpB/+6zlwksSyfMoRO2XzURRXXXZ6SeD3VkJgKl
         KC4liMRlF5GzU1CIiOL3IipVdfYzQVQdKTpLjh4+BIhgNJWb8TC78AruEcGM4xgKDPDU
         fiGL/h+CwpWBrOm1r1hmkYmRqUQ+i+7uvvBggjFhbt+gYgioJcjwhzjEJ6DVomlCt1vF
         zaMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q/Q4BXpdTETIRshvoP5AtKBEcp4SWJppasho7/KsRpk=;
        fh=0AHGym2emsHBktr4s8P80iX/DLB4XGhiE3VqAM02gUc=;
        b=pfZPjkvLXdo5ThqHH7jaSzF0Wud3ZMoPnvs+xDfWQOR6DOdEb2Y+5bUIYfARxE3RwR
         dpJRTkoRKYd4lQoey/S/OBkfHia/LMMxIa/e8VSLxN2IKL9lZl0Zm22c7GQ2PUfLsS6z
         WMjhP6m323IPf+VVWtkF4EMyDUVCM1iwoXCch7/qrMK8/XagZP4UxrkGmF7HR6kLSNrF
         O/PPnC28BiCsD3EF6BPsphSoE20lCx95oJEIj0L4c0Iy+1eHTj7GWY2mjxnT8wdzZ0hF
         Y+0aJQutNTWouJ6+7BgbM+PHD+wwJoLUhnQkuinIa9TTW+Fh5GbXm7sEmXDGM0+Nt9ij
         No9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788773655; x=1789378455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q/Q4BXpdTETIRshvoP5AtKBEcp4SWJppasho7/KsRpk=;
        b=eRcKo+mOmdhZjUI7x4HtzeIY71tLawesvml8Ul8YT2jy7TsD3GM06t8p4ZuFKtNgcG
         eabvM06QkE/US6+v5V9611vrYIfknUnVD4hPeumwWzX7Dh8WUMiHELql+CSMHp//+EFZ
         PyAwhu9mukoKo2KdkSX8Uzxo6yeApVT85ifa4mBgg/G2Ibfpu9QcQ05TTp9TkM+LaiKC
         H2xP7a6468HJ/Apl/cCClQ6HYBr5qNZv+VKb9yu4v+2x0QVPmIDKmmlZihgX8yznYe9A
         GKLObeKsifN3Np49LXSlbCBY8fVz9cPLYf2JzrEb8GAX+d+2tlVj3PLyxmql/EVpYI4C
         82sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773655; x=1789378455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/Q4BXpdTETIRshvoP5AtKBEcp4SWJppasho7/KsRpk=;
        b=V66HopeyPOdpzwMnrd3sT7Slrd9qAM6AbR8PnVOEmXAj0tTaaNtj9hGjImK9p7fG8J
         vsxP5io6gGA2dCT3BtzlpRemXVHo+s4CA/5SSXe+z2LOH6pa+UXJj9OIZjxNq0mvXNg7
         aTHiNCq3YChcOIT92wo3BBgcL1KSpmurEIbXnZSDLylp94J9s5+q5r4+0BVyV8uAZuMn
         0V1jDuJ2z0XsVr5WSZrFLl25feU0jjefeBxoAdBu0uqRg5pzicVO8IoIqP5jkqkkREXQ
         3u7h/IGu/iYOGP3hRhbIeY3yfLdMDkTGz2M7dj/kfVxuuVtPC/SM37SRjRa4MDHd6n8W
         YsgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXTqpbc6NeCN8+Zs83W+4AZmIbdYIXAmWFQZmroJyMrHb/RgyTbWsJxy7VIEo/CSXXTtMKHJEgk/M=@vger.kernel.org
X-Gm-Message-State: AFuF++nyApw37EOPhbqY31zluj7eYGGf764FNMeN8HmdjLe+MlkACtgm
	RXCvrvDK0owRMa/cdGeHKGtKMIlMEH1X5lyhdmP+XphGIl3oIvWyai8r4+Ya3GLMr6XuVIoNgVO
	4nY1nmFXz88MLNbIxaluYY7HVxGFT50t2b7twDZHjzGuJ82KGz2krkRBQf8Q=
X-Gm-Gg: AYBFou1Stef4vQg0YMRwABAES9QW5s1H5JfNYY7bKyTlS2SqjhJqes1zuy71wMMR9e2
	eqdZg1Vk5DGSvKJy1pTh6G+WJiYPeBKiNm1FxgRRkFuFiomwXwlcfipP3p7PSGNnsT1D56Amu3p
	vY1GYTU929FuKEmtOs/UA7OtopuagJeHWaxIe6Fe/0ANx0PT1NbzFtqbs6CEbKJr3QI8fKEn5vN
	L8Um5dgvtlznkvob9xCNjoiWrX4oPrmlERxVBS7h7EVZLw0HAj2EV6c4FzyvewraZtBhVDUsitK
	K4ZjAdJhRklv1m+AbFWs6CvyhlTFalR3kWUzFwBIQZzWRbCa/2HthF2EPLEbQPBX0uXT1VEOXBS
	FEpaf8G4qqT4PR3mIJobBQIGrHNrFvdpJGBmJtnod2EynddST2hA4e3FOUgFUkotH287SJylveO
	HVrOYtHFwqgdm1
X-Received: by 2002:a4a:e916:0:b0:6a1:47c8:c86 with SMTP id
 006d021491bc7-6b6fb4e7a5fmr12942064eaf.10.1788773654620; Mon, 07 Sep 2026
 02:34:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a8803bf.dbb3a75c.13dd47.000a.GAE@google.com>
In-Reply-To: <6a8803bf.dbb3a75c.13dd47.000a.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 7 Sep 2026 11:34:02 +0200
X-Gm-Features: AcwNN1VOpOJ5vDwG_1fX2E1zdmDP-8O3A5gKwFKOlNMADI5vBMEJRKABUHRqkfA
Message-ID: <CANp29Y4BmQiNjMGNzCRNgPzFG+VQ0ZrVd9JZta62tiSb464Dng@mail.gmail.com>
Subject: Re: [syzbot] [usb?] BUG: unable to handle kernel paging request in xhci_halt
To: syzbot <syzbot+c90273bf9017ef1462af@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz invalid

See the discussion at
https://lore.kernel.org/all/6a88012e.dbb3a75c.13dd47.0007.GAE@google.com/T/

On Fri, Aug 21, 2026 at 9:52=E2=80=AFAM syzbot
<syzbot+c90273bf9017ef1462af@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    21d6ac051080 Merge branch 'for-next/core' into for-kernel=
ci
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux=
.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1366d94958000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dd1128bc53f2ef=
7f3
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc90273bf9017ef1=
462af
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e25=
5-1~exp1~20260613092250.77), Debian LLD 22.1.8
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1741d6c6580=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D11d03a7958000=
0
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/88380e2ddcb9/dis=
k-21d6ac05.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/5dba5c2896b7/vmlinu=
x-21d6ac05.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/52ac739e37e0/I=
mage-21d6ac05.gz.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+c90273bf9017ef1462af@syzkaller.appspotmail.com
>
> EXT4-fs (nvme0n1p2): shut down requested (2)
> Aborting journal on device nvme0n1p2-8.
> xhci_hcd 0000:00:02.0: xHCI Host Controller
> xhci_hcd 0000:00:02.0: new USB bus registered, assigned bus number 34
> Unable to handle kernel paging request at virtual address ffff8000936e40f=
f
> KASAN: probably user-memory-access in range [0x000000049b7207f8-0x0000000=
49b7207ff]
> Mem abort info:
>   ESR =3D 0x0000000096000021
>   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>   SET =3D 0, FnV =3D 0
>   EA =3D 0, S1PTW =3D 0
>   FSC =3D 0x21: alignment fault
> Data abort info:
>   ISV =3D 0, ISS =3D 0x00000021, ISS2 =3D 0x00000000
>   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
>   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0
> swapper pgtable: 4k pages, 48-bit VAs, pgdp=3D000000021b049000
> [ffff8000936e40ff] pgd=3D0000000000000000, p4d=3D1000000221341003, pud=3D=
1000000221342003, pmd=3D1000000106b4b403, pte=3D0068010000000713
> Internal error: Oops: 0000000096000021 [#1]  SMP
> Modules linked in:
> CPU: 1 UID: 0 PID: 4935 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 08/07/2026
> pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=3D--)
> pc : __raw_readl arch/arm64/include/asm/io.h:84 [inline]
> pc : readl include/asm-generic/io.h:231 [inline]
> pc : xhci_quiesce drivers/usb/host/xhci.c:107 [inline]
> pc : xhci_halt+0x64/0x1ec drivers/usb/host/xhci.c:125
> lr : xhci_halt+0x40/0x1ec drivers/usb/host/xhci.c:124
> sp : ffff8000963773c0
> x29: ffff8000963773c0 x28: ffff0000d23fa000 x27: dfff800000000000
> x26: ffff0000d23fa418 x25: 0000000000000f01 x24: ffff0000d23fa6e8
> x23: ffff0000c2f4a0d0 x22: ffff0000d23fa418 x21: dfff800000000000
> x20: 1fffe0001a47f483 x19: ffff0000d23fa400 x18: 00000000ffffffff
> x17: ffff80008a7d6000 x16: 0000000000000005 x15: ffff80008a35fda0
> x14: ffff80008a5d5e28 x13: 0000000000000004 x12: 0000000000000000
> x11: ffff8000963772e0 x10: 00000000fffffbf2 x9 : 2afdbc7a43e86800
> x8 : ffff8000936e40ff x7 : 0000000000000000 x6 : 0000000000000000
> x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff8000833104ec
> x2 : 0000000000000002 x1 : ffff0000c4ec57c0 x0 : 0000000000000000
> Call trace:
>  __raw_readl arch/arm64/include/asm/io.h:84 [inline] (P)
>  readl include/asm-generic/io.h:231 [inline] (P)
>  xhci_quiesce drivers/usb/host/xhci.c:107 [inline] (P)
>  xhci_halt+0x64/0x1ec drivers/usb/host/xhci.c:125 (P)
>  xhci_gen_setup+0x5d8/0x111c drivers/usb/host/xhci.c:5496
>  xhci_pci_setup+0x110/0x44c drivers/usb/host/xhci-pci.c:579
>  usb_add_hcd+0x5c4/0xdec drivers/usb/core/hcd.c:2935
>  usb_hcd_pci_probe+0x63c/0xaa4 drivers/usb/core/hcd-pci.c:267
>  xhci_pci_common_probe+0x90/0x760 drivers/usb/host/xhci-pci.c:633
>  xhci_pci_probe+0x44/0xdc drivers/usb/host/xhci-pci.c:717
>  local_pci_probe+0xc8/0x158 drivers/pci/pci-driver.c:332
>  pci_call_probe drivers/pci/pci-driver.c:394 [inline]
>  __pci_device_probe drivers/pci/pci-driver.c:455 [inline]
>  pci_device_probe+0x460/0x8d4 drivers/pci/pci-driver.c:489
>  call_driver_probe drivers/base/dd.c:-1 [inline]
>  really_probe+0x29c/0x800 drivers/base/dd.c:706
>  __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
>  device_driver_attach+0x58/0xac drivers/base/dd.c:1203
>  bind_store+0xf4/0x14c drivers/base/bus.c:267
>  drv_attr_store+0x80/0xa4 drivers/base/bus.c:125
>  sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:145
>  kernfs_fop_write_iter+0x260/0x3b8 fs/kernfs/file.c:345
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x51c/0xa0c fs/read_write.c:687
>  ksys_write+0x12c/0x228 fs/read_write.c:739
>  __do_sys_write fs/read_write.c:750 [inline]
>  __se_sys_write fs/read_write.c:747 [inline]
>  __arm64_sys_write+0x84/0x98 fs/read_write.c:747
>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>  invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
>  el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
>  do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
>  el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
>  el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590
> Code: 9762248f f94002c8 128081aa d503201f (b9400108)
> ---[ end trace 0000000000000000 ]---
> ----------------
> Code disassembly (best guess):
>    0:   9762248f        bl      0xfffffffffd88923c
>    4:   f94002c8        ldr     x8, [x22]
>    8:   128081aa        mov     w10, #0xfffffbf2                // #-1038
>    c:   d503201f        nop
> * 10:   b9400108        ldr     w8, [x8] <-- trapping instruction
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
-bugs/6a8803bf.dbb3a75c.13dd47.000a.GAE%40google.com.
