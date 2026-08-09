Received: from mail-oo1-f77.google.com (mail-oo1-f77.google.com [209.85.161.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D593B1EC7
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 19:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786302823; cv=none; b=Xct1o2VbNZANh7pLLWPMQzzZuiENEG2ptL2/bFEQLiHrT0KGxfV5RnoUg5WN33Ggij+zSben7XAXsvnRrQrcOtzUvm/yggD5RrARhnwE3pl3HsbSRnINsNDzTI6G+hjZEPqlRBDeLniy3lDWhrW0+icxMwtEOqegbxqiL3J6pS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786302823; c=relaxed/simple;
	bh=2b1WiZTnCcPOFsbbumIvx0wN6TuVbDd/NU+5LTA+Dl4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QijFEmixQnIPNQACT4mtaaSq7LgP+cIe8pIYd1I/UX/RSQGReAPdoGzQd9dgTwzlMIvIOFoFBcIiRiZNbSwSoTgPY0wKwQHghCco0H2cWSEZbaeBWjrk4KQi2qzIeTyZ9u6fmdVm1CuowMClIf0dc/drXRSbBtJERhpP5/LEcpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f77.google.com with SMTP id 006d021491bc7-6ae4917006eso860701eaf.2
        for <linux-usb@vger.kernel.org>; Sun, 09 Aug 2026 12:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786302816; x=1786907616;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nr9czbpiDY2aYjkJ1zIfJ1Y8AGVvSucR8vX6OAs8zKU=;
        b=G7knrwsNlWEJkAPek30DN2z8QEB2hMlR07bsecaayEFhv1QENDof51DyyMnkfKtE+a
         gu9xmrHFWeuPQNNsZ/Pj1uO0PlsF5a9209NFp47XWR9GfeWPs5Ik64hqRopz95WeUSNI
         cQw95fv2HGrQpqJOSXevyWMIoHcxhSlEYSc3ZXyV6OchpcDuO38YhD/HpUxkTVrBN92V
         poZKiQ2kx2i1zGoOoOt/5dU7dPUg32Przf90WdFtzJWKsLVPVYnlaDCwkht49cwpsSV2
         b9LPfCsapFWT1gtCrXhmnjEgRzavMuxi9uWRJ8nAzPyrPENUDBp6EdPRqSjDmC+W2oMx
         4Ptg==
X-Forwarded-Encrypted: i=1; AHgh+RpH5U89Ct5NlqFQnvgLJwFOUHIws00RfND7xCYEoNM4W17B7t4td6V7zUIBwVDINFNwKOSwn+EkGaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJkzVlKmARZ0NQvc0JDfUkIBS8uOui+ej2lMcHOqyISHVBpJxO
	AYgEaLEqvU378vbEGNu7OrSg0tmiG0yj29Huc7h6DM1quzBJT6BZP9u0LNDQLH8aHxhCmoDItWX
	sJph5qfZcEGb2F9zabXEyL7M0spzurLgSywetDgqwWCAPWZQccl0WDdINWoE=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2084:b0:6aa:a1e5:f596 with SMTP id
 006d021491bc7-6ae96c1005dmr19512692eaf.3.1786302816187; Sun, 09 Aug 2026
 12:13:36 -0700 (PDT)
Date: Sun, 09 Aug 2026 12:13:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a78d160.01d0871a.3a0d52.0090.GAE@google.com>
Subject: [syzbot] [usb?] WARNING: refcount bug in trace_suspend_resume (2)
From: syzbot <syzbot+8496ab5e117502750445@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3f008280327b Merge tag 'pinctrl-v7.2-3' of git://git.kerne..
git tree:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux master
console output: https://syzkaller.appspot.com/x/log.txt?x=16e7efb9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fa49d7bda29d9792
dashboard link: https://syzkaller.appspot.com/bug?extid=8496ab5e117502750445
compiler:       arm-linux-gnueabi-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: arm
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17013fb9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1557a132580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/98a89b9f34e4/non_bootable_disk-3f008280.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ac9e46e45e52/vmlinux-3f008280.xz
kernel image: https://storage.googleapis.com/syzbot-assets/491a8a3d010a/zImage-3f008280.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8496ab5e117502750445@syzkaller.appspotmail.com

udc dummy_udc.1: failed to start USB Gadget filesystem: -12
gadgetfs gadget.1: probe with driver gadgetfs failed with error -12
UDC core: USB Gadget filesystem: couldn't find an available UDC
------------[ cut here ]------------
WARNING: lib/refcount.c:28 at refcount_warn_saturate+0x134/0x170 lib/refcount.c:28, CPU#0: syz.2.17/4036
refcount_t: underflow; use-after-free.
Modules linked in:
Kernel panic - not syncing: kernel: panic_on_warn set ...
CPU: 0 UID: 0 PID: 4036 Comm: syz.2.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: ARM-Versatile Express
Call trace: 
[<80201998>] (dump_backtrace) from [<80201a8c>] (show_stack+0x18/0x1c arch/arm/kernel/traps.c:257)
 r7:82a20f78 r6:00000000 r5:82333190 r4:00000001
[<80201a74>] (show_stack) from [<8021e60c>] (__dump_stack lib/dump_stack.c:94 [inline])
[<80201a74>] (show_stack) from [<8021e60c>] (dump_stack_lvl+0x5c/0x70 lib/dump_stack.c:120)
[<8021e5b0>] (dump_stack_lvl) from [<8021e638>] (dump_stack+0x18/0x1c lib/dump_stack.c:129)
 r7:82a20f78 r6:00000000 r5:83e0c980 r4:82c83d40
[<8021e620>] (dump_stack) from [<80202590>] (vpanic+0x114/0x320 kernel/panic.c:651)
[<8020247c>] (vpanic) from [<802027d0>] (trace_suspend_resume+0x0/0x100 kernel/panic.c:788)
 r7:809300ec
[<8020279c>] (panic) from [<80250a80>] (check_panic_on_warn kernel/panic.c:525 [inline])
[<8020279c>] (panic) from [<80250a80>] (get_taint+0x0/0x1c kernel/panic.c:520)
 r3:82a0b144 r2:00000001 r1:82318ef4 r0:82320850
[<80250a08>] (check_panic_on_warn) from [<80250bfc>] (__warn+0x98/0x1a4 kernel/panic.c:1104)
[<80250b64>] (__warn) from [<80250ef0>] (warn_slowpath_fmt+0x1e8/0x1f4 kernel/panic.c:1144)
 r8:00000009 r7:8238cee4 r6:e0259da4 r5:83e0c980 r4:00000000
[<80250d0c>] (warn_slowpath_fmt) from [<809300ec>] (refcount_warn_saturate+0x134/0x170 lib/refcount.c:28)
 r10:8475ea00 r9:00000000 r8:838acb10 r7:8553bc80 r6:835f77f8 r5:00000000
 r4:85c7f600
[<8092ffb8>] (refcount_warn_saturate) from [<81120650>] (__refcount_sub_and_test include/linux/refcount.h:400 [inline])
[<8092ffb8>] (refcount_warn_saturate) from [<81120650>] (__refcount_dec_and_test include/linux/refcount.h:432 [inline])
[<8092ffb8>] (refcount_warn_saturate) from [<81120650>] (refcount_dec_and_test include/linux/refcount.h:450 [inline])
[<8092ffb8>] (refcount_warn_saturate) from [<81120650>] (put_dev+0x4c/0x6c drivers/usb/gadget/legacy/inode.c:165)
[<81120604>] (put_dev) from [<81120718>] (dev_release+0x48/0x6c drivers/usb/gadget/legacy/inode.c:1215)
[<811206d0>] (dev_release) from [<805a1bcc>] (__fput+0xd8/0x2f4 fs/file_table.c:512)
 r5:040f801b r4:85a2ef00
[<805a1af4>] (__fput) from [<805a1e7c>] (____fput+0x14/0x18 fs/file_table.c:540)
 r9:00000000 r8:83e0d214 r7:82c846ac r6:83e0c980 r5:83e0d1e0 r4:00000000
[<805a1e68>] (____fput) from [<8027d7c8>] (task_work_run+0x8c/0xb4 kernel/task_work.c:233)
[<8027d73c>] (task_work_run) from [<80257888>] (exit_task_work include/linux/task_work.h:40 [inline])
[<8027d73c>] (task_work_run) from [<80257888>] (do_exit+0x2ac/0xadc kernel/exit.c:1009)
 r9:00000000 r8:e0259e90 r7:83e0d210 r6:850c5d4c r5:83e0c980 r4:850c5c00
[<802575dc>] (do_exit) from [<8025828c>] (do_group_exit+0x40/0x8c kernel/exit.c:1152)
 r7:00000004
[<8025824c>] (do_group_exit) from [<80269358>] (get_signal+0xa68/0xa90 kernel/signal.c:3046)
 r7:00000004 r4:83e0c980
[<802688f0>] (get_signal) from [<8022a630>] (do_signal arch/arm/kernel/signal.c:579 [inline])
[<802688f0>] (get_signal) from [<8022a630>] (do_work_pending+0x124/0x4f0 arch/arm/kernel/signal.c:619)
 r10:00000004 r9:83e0c980 r8:0000001f r7:00000004 r6:8020029c r5:e0259fb0
 r4:83e0c980
[<8022a50c>] (do_work_pending) from [<80200088>] (slow_work_pending+0xc/0x24)
Exception stack(0xe0259fb0 to 0xe0259ff8)
9fa0:                                     0000001f 20000400 0000001f 00000000
9fc0: 00000000 00000000 00356310 00000004 003562d8 00000000 003562d8 003562e4
9fe0: 7ef7e798 7ef7e788 00018fa0 001309d0 60000010 00000003
 r10:00000004 r9:83e0c980 r8:8020029c r7:00000004 r6:00356310 r5:00000000
 r4:00000000
Rebooting in 86400 seconds..


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
