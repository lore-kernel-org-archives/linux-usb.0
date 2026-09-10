Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46FC3955D6
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 09:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033267; cv=pass; b=I8obR480lSEv6syr8K5dqEXGHG8XRdvPgvrltxFdQigBpN1VcTd7l8tF8cJ88icijdspOfb3zwQqbV+nysfvxbeUZrHGvym/aGhtUjQ8kDNB1WyKRRgIXZYyZbIIXyQpdb+u/WpMB4lV7Ey2yePLMO2xBxxSy/OMycaVcSMTnmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033267; c=relaxed/simple;
	bh=0ZHrtRL7bAqsF8X6KNfVbc5fsMeLdeVmsFhcXJx3bTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dn94/l0kb/nqxGZDtFr1WQWQesrws4PpP6s76h1IPpMXltxUDaUWEbY6NoZ30uurK/RG9zFDNeFh89HZXEqZVbQz0LSMc13YKQiskFy+m6xcAqM4GuyFeg6WjKgyMjcJMc5MmMEc5pHEMG0G5CwkDhDojW+VH0NNmMiV/5JLHNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kJ5c6sfr; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kJ5c6sfr"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b28d7c729fso4709629b6e.0
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 02:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789033264; cv=none;
        d=google.com; s=arc-20260327;
        b=HIwYzXuWwPfWtTANeeFmlWd1UNtJme++rr7R+rRYKECYaVKbpAm91f0MvZ/LBYl0AB
         KWOctISSj0ZXCLX7fERFsqOKbXutSZgJohW0eK2tA9QgIa30idJEgYr7Nosm1Pnwb0wJ
         IwAEQQsbFJsvP22lhYW7zpymCSNYIfSoiW/3fKTmkmyXijfs5fZRjaE8aGTXUOGx7fmu
         lgXqydL/7ELDS4z/bggP7jVYoItlrl31BF3AM4gAFpenZO7racl7MGOAmmyBMvCcZ9MH
         FRyt2faIvSq/iYlLRiE7NcAaINBkqVxe84jFuDzwBeLiKkfCmu6MVqe+/hxiMcaTgonP
         Hvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RY35ZWPwW1bPsR1CMQEBBclXXIBNd/EaLdOjMo9JA90=;
        fh=0v4rUaPwxwP88dX5a8CwOQnTHOyM65TEb4IiKmBCLKc=;
        b=THupo2LJAcdiC0+iA0IGWD92A20J1IUeVObWaO2251adOmMK6+xXwN3R6lwOc7nHmz
         CVXHilbPvqGU+0+w2ZHd1DPFw2iof5vHdxtd3B7xpRHvLfCyTD6J1w5fmQ6xrPJTc8Z/
         PeBYqdfy93RJa+3dItKYRX36vDvXpju1h//XCaqyv68Go86Qs1vH364BTih1efO/YZuw
         3vKbqqRHSMDK+cVtRovfpBwfn0nMVANumAcaNuuc14LO1nJUztUFHspzNTL8E8/NSeVg
         gfxWqeV+a4SouK5S2bNgkGmgO3lv/Jn/ek8pLyVUk+9vy0cJsf7F/eyfnK6TmzOzw8Bc
         OLFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789033264; x=1789638064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RY35ZWPwW1bPsR1CMQEBBclXXIBNd/EaLdOjMo9JA90=;
        b=kJ5c6sfr0y60pC5D86EAK2caU8hDmma5FVZhKAxm5vrYOazDtwwjDjr8GJaV91Uy4o
         WnbN1Nx83XXKMNEvi4qxNsyVeBzZzBJ4Md94LLA9MA48ZWg9h4Ul5vBKPiG9PYqHadDj
         ee5nNqH+6SI1GlBa08hATr9EYHoCw9zFkup2UF27wrWOn8CFsMCshJhPcMkI4F75Gx03
         nCRCRLbUm6BvmMbXGRvh2MlddD9aYWRyn/QaTBw4QssjsGeNA7F9l9KgEIdZFXIrYF19
         92AYGqfqSttfLAU4cwicEjnYmLQpl10kUvymoCDNgmmNOnqCzE9sC6w8D633/uzn4XdM
         b/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033264; x=1789638064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RY35ZWPwW1bPsR1CMQEBBclXXIBNd/EaLdOjMo9JA90=;
        b=oUbqqexiO/BICJLI8sldSLutsmMnyTquIWkT1H/NSVm2TEQQ3vrZqX+kxZVaf3T8Nf
         lSkqCF0Xx7TSSmX3f2SWLc8/wPO4eSYkBdVFlbtvOIGZMjxPhSfSNrBMw/hw2qRq73iw
         q7UPq6tFnKcmKEVT17PHUaTGeat9RwL56sId58dTYS7JHhsYH00Ngtuq3EWhkb4TQ+lM
         LsaKlsb4YXUo/EIIa/FqWmW6AOXGs/jQ22YXYEDDFvrGVYXsIPAgWVMmyIHMbYRsE+HW
         dXmHmxkw/OSk+AOrNXdGs+JfAcrQAAi4aMkhvnbEHyWz3Mem084SVAOaug3ebwdp7gwm
         uQvw==
X-Forwarded-Encrypted: i=1; AKwUvByHc4Efw5ECrn5p0dHDOyu0ldn3kbp27w70JwV/lLBGkiiqrleCl1mYPYMIKNs9efSwwSGicJTJaG8=@vger.kernel.org
X-Gm-Message-State: AFuF++kFPpoSKZBOTjoTzFMtI/Ejrr1eMMRQw825fPqvuXsQS7yAlRiL
	WpGfJNfYVpqomP4qAaQy0dQA7IanyEPWUY/zCyFSWfbmPkLZd2OcVP4tWaKZCWCuWLa2JX+YB6H
	P2E4uW93abcn0wvcpUntrGGAH8Gnumnm3ww0ktfPP
X-Gm-Gg: AYBFou3KAJlA9baRfyd01h5RNXyBX3NdM7O+ctc9rNhvSXsMsp87K8ShzOPmip2IoNf
	dPp9LKde6whElmKNXpDze0I2BrlkY9YjLrhVL3Pjf0kwshX2mzJMN1jnFDdUwfx2duesM5BLG1X
	utW9+9EoLEGUIvuqNZWvhQn7RcSZNULN/Z4uK1oQAhsxhJjnTMVdVQM7ys4nh3zcJ7FYpvmsEmi
	yDOb4mu6QIBFdScJwAFPaX0XRQO2CboICP35rXpFxmwtiJlFfW/C1Y0wSAyOjsFgmbEbTdISvIv
	HsnFZXZm0IsvA4G5T7Jl/30zlMVwbYuCLNmXjx+Kpfvj7v0Neuuj6v6S/LIFbp/5lyYq8TN11NN
	OScRt1S+dJjAlyCl9UPZLaNSdEnP+Igc5niHJBrz1vbsq1fYOzrcVLYxwMVxS5EJE30pBvNqa+k
	uOgsHuPoX/vSBTu2djyOYYkbI=
X-Received: by 2002:a05:6809:24d:10b0:4c0:12f3:6007 with SMTP id
 5614622812f47-4c012f36474mr5831640b6e.4.1789033263935; Thu, 10 Sep 2026
 02:41:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a73ceda.5aeeccc9.207e63.0008.GAE@google.com>
In-Reply-To: <6a73ceda.5aeeccc9.207e63.0008.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 10 Sep 2026 11:40:52 +0200
X-Gm-Features: AcwNN1V08JJmkHsRxxFOMDjkNrrQxwFVsXGUuQRj2Mfd5Wa4kPqkcdGupiMn18w
Message-ID: <CANp29Y4DDpr7-aoKH+nQ82jea4vVDsCtx6C2YYcEasbtF1E4sQ@mail.gmail.com>
Subject: Re: [syzbot] [usb?] BUG: unable to handle kernel paging request in nhi_probe
To: syzbot <syzbot+901ca72278dfd89daf58@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz invalid

See the discussion at
https://lore.kernel.org/all/6a88012e.dbb3a75c.13dd47.0007.GAE@google.com/T/

On Thu, Aug 6, 2026 at 2:01=E2=80=AFAM syzbot
<syzbot+901ca72278dfd89daf58@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    7235a3e71949 Merge branch 'for-next/core' into for-kernel=
ci
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux=
.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D11edb64958000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dccf4bea59f670=
07
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D901ca72278dfd89=
daf58
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e25=
5-1~exp1~20260613092250.77), Debian LLD 22.1.8
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D10678bb9580=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1564acc658000=
0
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/fd45635beaae/dis=
k-7235a3e7.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/d7d2e6507223/vmlinu=
x-7235a3e7.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/b5b5d8de4cea/I=
mage-7235a3e7.gz.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+901ca72278dfd89daf58@syzkaller.appspotmail.com
>
> EXT4-fs (nvme0n1p2): shut down requested (2)
> Aborting journal on device nvme0n1p2-8.
> Unable to handle kernel paging request at
> Unable to handle kernel paging request at virtual address ffff800092aad64=
0
> KASAN: probably user-memory-access in range [0x000000049556b200-0x0000000=
49556b207]
> Mem abort info:
>   ESR =3D 0x0000000096000007
>   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>   SET =3D 0, FnV =3D 0
>   EA =3D 0, S1PTW =3D 0
>   FSC =3D 0x07: level 3 translation fault
> Data abort info:
>   ISV =3D 0, ISS =3D 0x00000007, ISS2 =3D 0x00000000
>   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
>   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0
> swapper pgtable: 4k pages, 48-bit VAs, pgdp=3D000000021b01f000
> [ffff800092aad640] pgd=3D0000000000000000, p4d=3D10000002212fc003, pud=3D=
10000002212fd003, pmd=3D1000000105275403, pte=3D0000000000000000
> Internal error: Oops: 0000000096000007 [#1]  SMP
> Modules linked in:
> CPU: 0 UID: 0 PID: 4950 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 07/02/2026
> pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=3D--)
> pc : __raw_readl arch/arm64/include/asm/io.h:84 [inline]
> pc : readl include/asm-generic/io.h:231 [inline]
> pc : ioread32 include/asm-generic/io.h:906 [inline]
> pc : nhi_probe+0xc0/0x730 drivers/thunderbolt/nhi.c:1198
> lr : nhi_probe+0x34/0x730 drivers/thunderbolt/nhi.c:1187
> sp : ffff8000982375b0
> x29: ffff8000982375c0 x28: 1fffe0001a3c399a x27: ffff0000d1e1ccd0
> x26: 1fffe0001a3c3998 x25: ffff0000c2f4a0d0 x24: 1fffe0001a3c3999
> x23: dfff800000000000 x22: 1fffe0001a3c39a7 x21: ffff0000d1e1cd38
> x20: ffff0000d1e1cc80 x19: ffff0000d1e1ccc8 x18: 1fffe00035bc9e28
> x17: 0000000000000003 x16: ffff800088b07000 x15: 0000000000000000
> x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000000
> x11: ffff80008a590e28 x10: 0000000000000001 x9 : 0000000000000000
> x8 : ffff800092aad640 x7 : 0000000000000000 x6 : 0000000000000000
> x5 : 0000000000000001 x4 : 0000000000000008 x3 : ffff8000801571a8
> x2 : 0000000000000006 x1 : ffff0000c6899d40 x0 : 0000000000000000
> Call trace:
>  __raw_readl arch/arm64/include/asm/io.h:84 [inline] (P)
>  readl include/asm-generic/io.h:231 [inline] (P)
>  ioread32 include/asm-generic/io.h:906 [inline] (P)
>  nhi_probe+0xc0/0x730 drivers/thunderbolt/nhi.c:1198 (P)
>  nhi_pci_probe+0x418/0x4e4 drivers/thunderbolt/pci.c:479
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
>  el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:736
>  el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594
> Code: d343feb6 9140e508 91190108 d503201f (b9400109)
> ---[ end trace 0000000000000000 ]---
> ----------------
> Code disassembly (best guess):
>    0:   d343feb6        lsr     x22, x21, #3
>    4:   9140e508        add     x8, x8, #0x39, lsl #12
>    8:   91190108        add     x8, x8, #0x640
>    c:   d503201f        nop
> * 10:   b9400109        ldr     w9, [x8] <-- trapping instruction
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
-bugs/6a73ceda.5aeeccc9.207e63.0008.GAE%40google.com.
