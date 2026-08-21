Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2811641E6D9
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 08:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299437; cv=none; b=Y/UUyAGOpgHwsl32MD7k6OjOposWDVE1Qq8DkG5k5GtxbFQ3gRiTsp4hwpEexV9kR1b8isCS23neIcfEzV36JUSzRmc9NZaYuTB1hXhTSvpZemRZaObJcdQQLZFR6G1Sms43dYd+K6PfUr3ukEFVtZSHlDOSNJvWmi1fyNoZQKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299437; c=relaxed/simple;
	bh=91vcAa08fll1O/f5FXUwyWq3RYQwt8HyKXSBhXsV4TE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=EelJKWgiTrA2yQdwjb7ooJT/mSsf58WUkO/Tk2NxOmKR8zoRhO/YP2WjZxlm4fN/2PK2Owggk37kApjN+KmWae29O/RTMGvHlSYCH3Z0M+3i/avsy4P+vp8KLlm66eTP2D4tyGBP5fDGrbV9nuxG8YMDP+sPyngGLVN6k3ZWkAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f10.google.com with SMTP id 46e09a7af769-7ee41f88c50so206650a34.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 01:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299435; x=1787904235;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWXMkc0RBu4NVj6unaj3RHfaLjWqc4HZCFGHR2Tn1UQ=;
        b=SLEdIiMwXtfswOgIVP7Hw+yMNQ8IU67RYfMQ07Y7662eWKV5rWc2t2+3JdrOK6nf/B
         UAQo+ezgTRIM5Utjyf4WvncdocaEYo51h39WoifjJTnll6YGvZTDDmIcBFC215MwZvkQ
         rXjof7eSD27Tre21s1j2ehUefrK82K+u1C+lBbgmq7naa9jNwv2tjmEaUvSJwI0sEYGx
         UoZvYMwpPpHxiaEq05UYrM5RZWg9M14FEXlNE4Rb7CxTue4CSo5uO8IvfUXWax4/6GYr
         n9BthXsQyAD1cgFI1rRO098uKMVm5mkpKo2RhHYUcBgUBzxHOEBXrqJm2GXFhMcsKtAF
         7Gww==
X-Forwarded-Encrypted: i=1; AHgh+RrIWH9+12GaFx32kS/nt0ioyU+Sm5p6kwl2g3rIIigAR65DSDoIm6dpMpkzdiBgte1r//xq857EHUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE1DwBOcFkFHH6oKk4E46I/oE3fibhFaD/V73y2bFSaNC2esxv
	1EUdpkarKa/r4rhlyq7eTDtgkuiJiqMn1Xd8iwyLq6ngYhkTBPXv+aKenSsuAP5Z8jASXTrHJLc
	W1Y4OmR8WizUAymMwinGpULWBgDbz3RPOsUd1ozUOCiFIAWhlXhucKg6WREg=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:5601:b0:6ae:6f38:dac with SMTP id
 006d021491bc7-6b1592424ddmr2963325eaf.10.1787299435050; Fri, 21 Aug 2026
 01:03:55 -0700 (PDT)
Date: Fri, 21 Aug 2026 01:03:55 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a88066b.ae6ddae5.3da009.002c.GAE@google.com>
Subject: [syzbot] [usb?] BUG: unable to handle kernel NULL pointer dereference
 in usb_reinit
From: syzbot <syzbot+2ec7fc1793a63864d9d6@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    21d6ac051080 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=17603a79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d1128bc53f2ef7f3
dashboard link: https://syzkaller.appspot.com/bug?extid=2ec7fc1793a63864d9d6
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1177ea25580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10e03a79580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/88380e2ddcb9/disk-21d6ac05.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5dba5c2896b7/vmlinux-21d6ac05.xz
kernel image: https://storage.googleapis.com/syzbot-assets/52ac739e37e0/Image-21d6ac05.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2ec7fc1793a63864d9d6@syzkaller.appspotmail.com

EXT4-fs (nvme0n1p2): shut down requested (2)
Aborting journal on device nvme0n1p2-8.
Unable to handle kernel NULL poin
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000048
Mem abort info:
  ESR = 0x0000000096000006
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=00000001166e6000
[0000000000000048] pgd=080000011da38403, p4d=080000011da38403, pud=080000011da3a403, pmd=0000000000000000
Internal error: Oops: 0000000096000006 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 4939 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/07/2026
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : __raw_readl arch/arm64/include/asm/io.h:84 [inline]
pc : readl include/asm-generic/io.h:231 [inline]
pc : usb_reinit_338x drivers/usb/gadget/udc/net2280.c:2243 [inline]
pc : usb_reinit+0xbf4/0xfa0 drivers/usb/gadget/udc/net2280.c:2305
lr : usb_reinit_338x drivers/usb/gadget/udc/net2280.c:2236 [inline]
lr : usb_reinit+0xb6c/0xfa0 drivers/usb/gadget/udc/net2280.c:2305
sp : ffff800096ac75a0
x29: ffff800096ac75e0 x28: dfff800000000000 x27: ffff800087354e38
x26: ffff800087354e80 x25: 0000000000000060 x24: 1fffe0001a4fd183
x23: ffff0000d27e8c18 x22: 1fffe0001a4fd00b x21: 0000000000000011
x20: ffff0000d27e8058 x19: ffff0000d27e8000 x18: 00000000ffffffff
x17: ffff80008a7d6000 x16: 0000000000000004 x15: ffff80008a35fda0
x14: ffff80008a5d5e28 x13: 0000000000000001 x12: 0000000000000000
x11: 1fffe0001a4fd178 x10: 0000000000000003 x9 : 0000000000000000
x8 : 0000000000000048 x7 : ffff800080aa1cb8 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000001 x3 : ffff8000835bf6bc
x2 : 0000000000000000 x1 : ffff0000cd3d1d40 x0 : 0000000000000000
Call trace:
 __raw_readl arch/arm64/include/asm/io.h:84 [inline] (P)
 readl include/asm-generic/io.h:231 [inline] (P)
 usb_reinit_338x drivers/usb/gadget/udc/net2280.c:2243 [inline] (P)
 usb_reinit+0xbf4/0xfa0 drivers/usb/gadget/udc/net2280.c:2305 (P)
 net2280_probe+0x5f4/0xef0 drivers/usb/gadget/udc/net2280.c:3712
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
Code: 9757676c f94002e8 91012108 d503201f (b9400115) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	9757676c 	bl	0xfffffffffd5d9db0
   4:	f94002e8 	ldr	x8, [x23]
   8:	91012108 	add	x8, x8, #0x48
   c:	d503201f 	nop
* 10:	b9400115 	ldr	w21, [x8] <-- trapping instruction


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
