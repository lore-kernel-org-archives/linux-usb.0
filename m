Received: from mail-oa1-f79.google.com (mail-oa1-f79.google.com [209.85.160.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071C8415F01
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 07:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787298754; cv=none; b=SYLrVOAwHHhH3iKohxYUl7V6u1NYZDMNQ5KO6s1LpKswR0VlCpoZ/FMa56zd8d7ICErZf5SkmTPCAj9ghV/KCjsfpIJ6YOL3PQ8WQ9BsquhS2I+qrU4BeI26sSh/tjlnSG50qiXja0KHIQ4acUd9XeyX1nsj7hnflUG3iZUwWjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787298754; c=relaxed/simple;
	bh=kXZgYJuhp0K1lzjlbZl73RhSI7DUSmgEY9y7FtbPQQ4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Z/uYGNg0fDH1rvndNwss/5cIVCULjTrPdFjMOcn7kzvPGsffVoMounL59ei02GkzJ+0f8UIOf23Pfvo7wfivGo6NQaLb3JoEQD3b2QFHvNzuctc0k5/ioU6vdHBuTx9A9HthGfdXzozLZd2sZ8AiDcjPPtsGBWmcsSWi1O9o3PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f79.google.com with SMTP id 586e51a60fabf-4519ef1babeso442415fac.2
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 00:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787298752; x=1787903552;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DtPUu/mKBkZtZ1hvNng7tva+n5QQI7MFVw182SEJfug=;
        b=JpWn4p+1N26yz0y2y0BI1uhG3q5j1yLIh8qVkbIgNRafeEL7ES0qcepCLAcaydf5PA
         cXkaBlLqWt2i/DTgqfw/Aw8oEDXSbfU6wpG1Pr3zmkuUQk+gHMDBxjLYzhcv850CRjxK
         Y/LkUpYcZCNg8vBuqAhdg24qBp91kXkW3u+P09j9xXrmhOomww13jMvsSxlnM6T61QDJ
         1HeYBAebFB9LFIAH+9cGDXcJAwTlS028X2Gd0dpsDTCnVpMWWDiIGFF7mmMdjvHdPifD
         o4SraAFBq8R71b8KSV4QjnOahphRpiDkmlbyLT9UO1vhx/67I7E+GGcIPz54Kuy5UC+R
         +iIg==
X-Forwarded-Encrypted: i=1; AHgh+RoGKquE25PNuFM+7SdjNnpNIKsZEp+oC83TbYvwZvVfK2ja2w1AKNU8y9FZEJbgF/W2gmzedBouHmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR6lq07UZaro+VkU/rQWmnJOU4b/EN/EF+AGseXc+o90ilvLuX
	MY48Sng980Ui9zeQ63vPiXoZ7P0YGrPNeyqdHb/8MYU/ScfFyXePvoyBVa9XnJunZjo0qgFDXwM
	J7l4JD1+HJ9GUnGXOcGtsyXICbRYBRGDP05Xfpa1vG0WOIjabiKBTZfeOfLU=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3287:b0:6ac:a0db:1a78 with SMTP id
 006d021491bc7-6b159270f05mr4407579eaf.5.1787298751955; Fri, 21 Aug 2026
 00:52:31 -0700 (PDT)
Date: Fri, 21 Aug 2026 00:52:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8803bf.dbb3a75c.13dd47.000a.GAE@google.com>
Subject: [syzbot] [usb?] BUG: unable to handle kernel paging request in xhci_halt
From: syzbot <syzbot+c90273bf9017ef1462af@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, mathias.nyman@intel.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    21d6ac051080 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1366d949580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d1128bc53f2ef7f3
dashboard link: https://syzkaller.appspot.com/bug?extid=c90273bf9017ef1462af
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1741d6c6580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11d03a79580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/88380e2ddcb9/disk-21d6ac05.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5dba5c2896b7/vmlinux-21d6ac05.xz
kernel image: https://storage.googleapis.com/syzbot-assets/52ac739e37e0/Image-21d6ac05.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c90273bf9017ef1462af@syzkaller.appspotmail.com

EXT4-fs (nvme0n1p2): shut down requested (2)
Aborting journal on device nvme0n1p2-8.
xhci_hcd 0000:00:02.0: xHCI Host Controller
xhci_hcd 0000:00:02.0: new USB bus registered, assigned bus number 34
Unable to handle kernel paging request at virtual address ffff8000936e40ff
KASAN: probably user-memory-access in range [0x000000049b7207f8-0x000000049b7207ff]
Mem abort info:
  ESR = 0x0000000096000021
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x21: alignment fault
Data abort info:
  ISV = 0, ISS = 0x00000021, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0
swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000021b049000
[ffff8000936e40ff] pgd=0000000000000000, p4d=1000000221341003, pud=1000000221342003, pmd=1000000106b4b403, pte=0068010000000713
Internal error: Oops: 0000000096000021 [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 4935 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/07/2026
pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : __raw_readl arch/arm64/include/asm/io.h:84 [inline]
pc : readl include/asm-generic/io.h:231 [inline]
pc : xhci_quiesce drivers/usb/host/xhci.c:107 [inline]
pc : xhci_halt+0x64/0x1ec drivers/usb/host/xhci.c:125
lr : xhci_halt+0x40/0x1ec drivers/usb/host/xhci.c:124
sp : ffff8000963773c0
x29: ffff8000963773c0 x28: ffff0000d23fa000 x27: dfff800000000000
x26: ffff0000d23fa418 x25: 0000000000000f01 x24: ffff0000d23fa6e8
x23: ffff0000c2f4a0d0 x22: ffff0000d23fa418 x21: dfff800000000000
x20: 1fffe0001a47f483 x19: ffff0000d23fa400 x18: 00000000ffffffff
x17: ffff80008a7d6000 x16: 0000000000000005 x15: ffff80008a35fda0
x14: ffff80008a5d5e28 x13: 0000000000000004 x12: 0000000000000000
x11: ffff8000963772e0 x10: 00000000fffffbf2 x9 : 2afdbc7a43e86800
x8 : ffff8000936e40ff x7 : 0000000000000000 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff8000833104ec
x2 : 0000000000000002 x1 : ffff0000c4ec57c0 x0 : 0000000000000000
Call trace:
 __raw_readl arch/arm64/include/asm/io.h:84 [inline] (P)
 readl include/asm-generic/io.h:231 [inline] (P)
 xhci_quiesce drivers/usb/host/xhci.c:107 [inline] (P)
 xhci_halt+0x64/0x1ec drivers/usb/host/xhci.c:125 (P)
 xhci_gen_setup+0x5d8/0x111c drivers/usb/host/xhci.c:5496
 xhci_pci_setup+0x110/0x44c drivers/usb/host/xhci-pci.c:579
 usb_add_hcd+0x5c4/0xdec drivers/usb/core/hcd.c:2935
 usb_hcd_pci_probe+0x63c/0xaa4 drivers/usb/core/hcd-pci.c:267
 xhci_pci_common_probe+0x90/0x760 drivers/usb/host/xhci-pci.c:633
 xhci_pci_probe+0x44/0xdc drivers/usb/host/xhci-pci.c:717
 local_pci_probe+0xc8/0x158 drivers/pci/pci-driver.c:332
 pci_call_probe drivers/pci/pci-driver.c:394 [inline]
 __pci_device_probe drivers/pci/pci-driver.c:455 [inline]
 pci_device_probe+0x460/0x8d4 drivers/pci/pci-driver.c:489
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x29c/0x800 drivers/base/dd.c:706
 __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
 device_driver_attach+0x58/0xac drivers/base/dd.c:1203
 bind_store+0xf4/0x14c drivers/base/bus.c:267
 drv_attr_store+0x80/0xa4 drivers/base/bus.c:125
 sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x260/0x3b8 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x51c/0xa0c fs/read_write.c:687
 ksys_write+0x12c/0x228 fs/read_write.c:739
 __do_sys_write fs/read_write.c:750 [inline]
 __se_sys_write fs/read_write.c:747 [inline]
 __arm64_sys_write+0x84/0x98 fs/read_write.c:747
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590
Code: 9762248f f94002c8 128081aa d503201f (b9400108) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	9762248f 	bl	0xfffffffffd88923c
   4:	f94002c8 	ldr	x8, [x22]
   8:	128081aa 	mov	w10, #0xfffffbf2            	// #-1038
   c:	d503201f 	nop
* 10:	b9400108 	ldr	w8, [x8] <-- trapping instruction


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
