Received: from mail-ot1-f78.google.com (mail-ot1-f78.google.com [209.85.210.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB08014BF92
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 00:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785974493; cv=none; b=NyC1lFcZ1adF8HlfJf5F59Af6Yukx0EukwY5Qddxs8J9Ff+YiIxt5Wxvpgrwtk91B4DHfC2s3y9fnJE/ANGjztXkszNzpJ6je3Z/9SLsZm+CEsqazvUvEQJnfYCi9UhR/pY5qgx4xtvuSKfte22MSE/CoXz94+GIDBCXgLQaODA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785974493; c=relaxed/simple;
	bh=0X3PrTL/RtAdUmpaffV1PstXYCpNmVtkGXTRgAqnRTI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=TX75nErwVBV8xhkxgNBvzlEXMUy3xr+pYZIuu+NmA8eh8M0brvq3i4O5LwdAk/r6/d9mRL8DM6fJycVgtbZh3HpFKks69ei+2dNmXb7Ervm4hS6OMGBy8S+2ae/LWukuRXHqmMp6cObHdkVcJky16J/Edxocahp1T7pSDb4D14I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f78.google.com with SMTP id 46e09a7af769-7f1d4de2f12so1890251a34.3
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 17:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785974490; x=1786579290;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7DBNO0ieXEkykLkzPGHu2r+BEfqVczlkS7RonUcTmg=;
        b=MbLS0esZsfBiKw6QoHGk+8HKqaasB8e4Pb3fayPIcIFpnJ5kwNhAC3N+BSWgpgwybn
         TDTXtRc1X94UpXmYN4LhbGjwZ+VBx4quZ+s+rYjc4+o9JNuvN0dQ3Gvudhmva9OCC+9V
         sbxJFvgxFpyle4yeFDlFUYf4wiz7hXkanj7g2P/fo3bWUJPhbJbldaRkeuy6nFeqiV+n
         Cz6Fv44TkxofdovX6cN5cclLionLo3pmFEFgzVxa6AGDK0WoHO4LOa5Lb0YNfQ70YyIs
         zS+/gCb7TjUQgtWi+IApRydXdcUFyNIqMYcfnmYyXS2tPBfRgtqk4FfVl21mMJKJj4i8
         oDlg==
X-Forwarded-Encrypted: i=1; AHgh+RrCNTDL3GHVOFDXIdUWC935BrJXAhbsK6wXio8G/mxM5E4xXzaxAmPkLGrho8SRjCNssQc/PrljtOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YznF49WhWul/ubWTT6ZPwKZcdbFAH3coVzIANu6hVfDkjasV336
	KV3bgapCebxW1QK4PGY373yVbTLhcoeXZc1JzphkLksZSlEbJTY2fnNPxJa85MfrBUoBR+z+pIh
	YlfkkydWf6WmxRgkftYHLQpWbS6hxaPFBgGZ6oKFTKXniJQk0gEDbkdLk5H4=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2227:b0:6ab:13:b207 with SMTP id
 006d021491bc7-6ae97025d62mr4762109eaf.27.1785974490653; Wed, 05 Aug 2026
 17:01:30 -0700 (PDT)
Date: Wed, 05 Aug 2026 17:01:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a73ceda.5aeeccc9.207e63.0008.GAE@google.com>
Subject: [syzbot] [usb?] BUG: unable to handle kernel paging request in nhi_probe
From: syzbot <syzbot+901ca72278dfd89daf58@syzkaller.appspotmail.com>
To: YehezkelShB@gmail.com, andreas.noever@gmail.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, westeri@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7235a3e71949 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=11edb649580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccf4bea59f67007
dashboard link: https://syzkaller.appspot.com/bug?extid=901ca72278dfd89daf58
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10678bb9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1564acc6580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/fd45635beaae/disk-7235a3e7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d7d2e6507223/vmlinux-7235a3e7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b5b5d8de4cea/Image-7235a3e7.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+901ca72278dfd89daf58@syzkaller.appspotmail.com

EXT4-fs (nvme0n1p2): shut down requested (2)
Aborting journal on device nvme0n1p2-8.
Unable to handle kernel paging request at 
Unable to handle kernel paging request at virtual address ffff800092aad640
KASAN: probably user-memory-access in range [0x000000049556b200-0x000000049556b207]
Mem abort info:
  ESR = 0x0000000096000007
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x07: level 3 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0
swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000021b01f000
[ffff800092aad640] pgd=0000000000000000, p4d=10000002212fc003, pud=10000002212fd003, pmd=1000000105275403, pte=0000000000000000
Internal error: Oops: 0000000096000007 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 4950 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/02/2026
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : __raw_readl arch/arm64/include/asm/io.h:84 [inline]
pc : readl include/asm-generic/io.h:231 [inline]
pc : ioread32 include/asm-generic/io.h:906 [inline]
pc : nhi_probe+0xc0/0x730 drivers/thunderbolt/nhi.c:1198
lr : nhi_probe+0x34/0x730 drivers/thunderbolt/nhi.c:1187
sp : ffff8000982375b0
x29: ffff8000982375c0 x28: 1fffe0001a3c399a x27: ffff0000d1e1ccd0
x26: 1fffe0001a3c3998 x25: ffff0000c2f4a0d0 x24: 1fffe0001a3c3999
x23: dfff800000000000 x22: 1fffe0001a3c39a7 x21: ffff0000d1e1cd38
x20: ffff0000d1e1cc80 x19: ffff0000d1e1ccc8 x18: 1fffe00035bc9e28
x17: 0000000000000003 x16: ffff800088b07000 x15: 0000000000000000
x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000000
x11: ffff80008a590e28 x10: 0000000000000001 x9 : 0000000000000000
x8 : ffff800092aad640 x7 : 0000000000000000 x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000008 x3 : ffff8000801571a8
x2 : 0000000000000006 x1 : ffff0000c6899d40 x0 : 0000000000000000
Call trace:
 __raw_readl arch/arm64/include/asm/io.h:84 [inline] (P)
 readl include/asm-generic/io.h:231 [inline] (P)
 ioread32 include/asm-generic/io.h:906 [inline] (P)
 nhi_probe+0xc0/0x730 drivers/thunderbolt/nhi.c:1198 (P)
 nhi_pci_probe+0x418/0x4e4 drivers/thunderbolt/pci.c:479
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
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:736
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594
Code: d343feb6 9140e508 91190108 d503201f (b9400109) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	d343feb6 	lsr	x22, x21, #3
   4:	9140e508 	add	x8, x8, #0x39, lsl #12
   8:	91190108 	add	x8, x8, #0x640
   c:	d503201f 	nop
* 10:	b9400109 	ldr	w9, [x8] <-- trapping instruction


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
