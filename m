Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009A73B19A5
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 19:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786302822; cv=none; b=s9kZuqjqo8sKk05VgxUaILobUrYGZ+lYbFct3b1wZmJ7HVZJp9NqqWASpFG2EN9Jo+izyzkbpT712iHlj1iiobNxP8Y+M4jXc4nNzocjQie9WkqTLuoj+LxXeShMk9dqzTu1soLAYgaSOSUd+DEy1YYL9KB/H9UG/LzycOQ3DcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786302822; c=relaxed/simple;
	bh=YlUozqL+pNCTPZjh0WOpVKZ09K4EJPn8LY5CZInsdS4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ln9aEyJbWeoU9tJXrOM5vI3agyy7ooIY7WvcPWWgc7tsIeWAxsEpFfBYdXESA6iR7BVbfLfJCS8OdbJCBlhH2DE0bcHNq5gwXpu72e3StcMNF0mIvAfQa2a17HuFBod9SRXbX0VnQpO2wLdlMMLyNWsn7SLz/yQiOKc2ER3Td7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-6a0f261aeb6so1398772eaf.3
        for <linux-usb@vger.kernel.org>; Sun, 09 Aug 2026 12:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786302816; x=1786907616;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DxYcKDooR4FwgKlCxuoRI/oVR2/Ow72rmZBy2HjH1s=;
        b=F51jC2CHvwf4ogWZtOP2yGvO5EY8osABhtiF8OlnyNFdgsIyb0gsv0aCXUSgZjhmzi
         BUKN7mOiM5C0nVo5ABfL/nFu2PuwoqwA1IqRjysczJmSFGd1nOZFE/wF82KNdHkjD3hP
         KkxXOC6JQ2eod0xymR14O6gWH9LmIzvYSM27FSR//QXNiPLTFjPmeKYpt+1xCKAkfA+Q
         +proCiRoYoJCQ5Zmb2pckQqcIpDECqDDa2odA9kOUp5ct72n3+5ZQaQKn6VghM4zmhRB
         hpf57xm3EKznUOdPrbDp4nf2xgy8tKIJGZofi/1hI+vCN/Oo7iFTWkIGH1PNFq19QZ+8
         CIDQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEgN1JlMefVSTqfv//gvujtE9zsRpxJGMsjPzWc2+KD+TxnV+riZZN+FpHwJu+VnfuyX4Ug7/UMxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGa/MaHZQkCe+AtDDxptlx5y6ZiBmceMzKNQamlxF6Tp5GCssN
	oRNeL88G+G2mTDVhPZctLJrNRscb+0kUnDpUsxNM21p3nLq4XtE80gscNSRvY/0Ua4sS0cqBdHU
	VWQi+Bza209tUd3fL7ZT2gLRrS4jHl1KsvoRSkvMhzxY2bRIET6eQEDdlvm4=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:188e:b0:6ae:4767:a503 with SMTP id
 006d021491bc7-6b035405ca2mr9166107eaf.34.1786302816602; Sun, 09 Aug 2026
 12:13:36 -0700 (PDT)
Date: Sun, 09 Aug 2026 12:13:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a78d160.01d0871a.3a0d52.0092.GAE@google.com>
Subject: [syzbot] [media?] [usb?] WARNING in ttusb_dec_start_feed
From: syzbot <syzbot+e1dbaae5eefaa2dfbc35@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ba5cc80fd326 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1702bfb9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccf4bea59f67007
dashboard link: https://syzkaller.appspot.com/bug?extid=e1dbaae5eefaa2dfbc35
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13af6fb9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15c56132580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/959ad5f4e730/disk-ba5cc80f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0787d25f251e/vmlinux-ba5cc80f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2e85c36fabac/Image-ba5cc80f.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e1dbaae5eefaa2dfbc35@syzkaller.appspotmail.com

usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
------------[ cut here ]------------
memcpy: detected buffer overflow: 75 byte read of buffer size 60
WARNING: lib/string_helpers.c:1037 at __fortify_report+0xa0/0xb8 lib/string_helpers.c:1036, CPU#1: kworker/1:3/4388
Modules linked in:
CPU: 1 UID: 0 PID: 4388 Comm: kworker/1:3 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/02/2026
Workqueue: usb_hub_wq hub_event
pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : __fortify_report+0xa0/0xb8 lib/string_helpers.c:1036
lr : __fortify_report+0xa0/0xb8 lib/string_helpers.c:1036
sp : ffff800094c46d20
x29: ffff800094c46d20 x28: dfff800000000000 x27: ffff700012988db0
x26: 0000000000000000 x25: ffff0000d18d4983 x24: ffff800094c46ea0
x23: 000000000000004b x22: ffff800086cec898 x21: 0000000000000000
x20: 000000000000004b x19: 000000000000003c x18: 1fffe00034bbbe28
x17: 0000000000000003 x16: ffff800088b27000 x15: ffff8000824ebed4
x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000000 x10: 0000000000000002 x9 : 96b32e65f1701e00
x8 : 96b32e65f1701e00 x7 : ffff80008048e8f8 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff8000802f8870
x2 : 0000000100000000 x1 : ffff0000c70e1d40 x0 : 0000000000000000
Call trace:
 __fortify_report+0xa0/0xb8 lib/string_helpers.c:1036 (P)
 __fortify_panic+0x10/0x14 lib/string_helpers.c:1043
 fortify_memcpy_chk include/linux/fortify-string.h:549 [inline]
 ttusb_dec_start_feed+0x0/0x10ac drivers/media/usb/ttusb-dec/ttusb_dec.c:372
 ttusb_dec_get_stb_state drivers/media/usb/ttusb-dec/ttusb_dec.c:392 [inline]
 ttusb_dec_init_stb drivers/media/usb/ttusb-dec/ttusb_dec.c:1413 [inline]
 ttusb_dec_probe+0x724/0x1aa0 drivers/media/usb/ttusb-dec/ttusb_dec.c:1671
 usb_probe_interface+0x308/0x788 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x29c/0x800 drivers/base/dd.c:706
 __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
 driver_probe_device+0x6c/0x19c drivers/base/dd.c:898
 __device_attach_driver+0x198/0x2f8 drivers/base/dd.c:1026
 bus_for_each_drv+0x144/0x1dc drivers/base/bus.c:500
 __device_attach+0x248/0x390 drivers/base/dd.c:1098
 device_initial_probe+0x90/0xc8 drivers/base/dd.c:1153
 bus_probe_device+0x58/0x120 drivers/base/bus.c:620
 device_add+0x6cc/0x9e0 drivers/base/core.c:3772
 usb_set_configuration+0x1184/0x158c drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0x8c/0x148 drivers/usb/core/generic.c:250
 usb_probe_device+0x114/0x2b0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x29c/0x800 drivers/base/dd.c:706
 __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
 driver_probe_device+0x6c/0x19c drivers/base/dd.c:898
 __device_attach_driver+0x198/0x2f8 drivers/base/dd.c:1026
 bus_for_each_drv+0x144/0x1dc drivers/base/bus.c:500
 __device_attach+0x248/0x390 drivers/base/dd.c:1098
 device_initial_probe+0x90/0xc8 drivers/base/dd.c:1153
 bus_probe_device+0x58/0x120 drivers/base/bus.c:620
 device_add+0x6cc/0x9e0 drivers/base/core.c:3772
 usb_new_device+0x9bc/0x11f0 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x1ef0/0x39fc drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0x788/0x10b8 kernel/workqueue.c:3405
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3486
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:838
irq event stamp: 7958
hardirqs last  enabled at (7957): [<ffff8000868f4e64>] irqentry_exit_to_kernel_mode_after_preempt include/linux/irq-entry-common.h:507 [inline]
hardirqs last  enabled at (7957): [<ffff8000868f4e64>] arm64_exit_to_kernel_mode+0x80/0x94 arch/arm64/kernel/entry-common.c:62
hardirqs last disabled at (7958): [<ffff8000868f0d88>] el1_brk64+0x20/0x54 arch/arm64/kernel/entry-common.c:425
softirqs last  enabled at (7892): [<ffff800080310744>] softirq_handle_end kernel/softirq.c:468 [inline]
softirqs last  enabled at (7892): [<ffff800080310744>] handle_softirqs+0xc28/0xd98 kernel/softirq.c:650
softirqs last disabled at (7883): [<ffff8000800204c0>] __do_softirq+0x14/0x20 kernel/softirq.c:656
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
kernel BUG at lib/string_helpers.c:1044!
Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 4388 Comm: kworker/1:3 Tainted: G        W           syzkaller #0 PREEMPT 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/02/2026
Workqueue: usb_hub_wq hub_event
pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : __fortify_panic+0x10/0x14 lib/string_helpers.c:1043
lr : __fortify_panic+0x10/0x14 lib/string_helpers.c:1043
sp : ffff800094c46d50
x29: ffff800094c46d50 x28: dfff800000000000 x27: ffff700012988db0
x26: 0000000000000000 x25: ffff0000d18d4983 x24: ffff800094c46ea0
x23: 000000000000004b x22: 000000000000004b x21: ffff0000d18d4980
x20: 1fffe0001a31a930 x19: ffff0000dd4bc000 x18: 1fffe00034bbbe28
x17: 0000000000000003 x16: ffff800088b27000 x15: ffff8000824ebed4
x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000000 x10: 0000000000000002 x9 : 96b32e65f1701e00
x8 : 96b32e65f1701e00 x7 : ffff80008048e8f8 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff8000802f8870
x2 : 0000000100000000 x1 : ffff0000c70e1d40 x0 : 0000000000000000
Call trace:
 __fortify_panic+0x10/0x14 lib/string_helpers.c:1043 (P)
 fortify_memcpy_chk include/linux/fortify-string.h:549 [inline]
 ttusb_dec_start_feed+0x0/0x10ac drivers/media/usb/ttusb-dec/ttusb_dec.c:372
 ttusb_dec_get_stb_state drivers/media/usb/ttusb-dec/ttusb_dec.c:392 [inline]
 ttusb_dec_init_stb drivers/media/usb/ttusb-dec/ttusb_dec.c:1413 [inline]
 ttusb_dec_probe+0x724/0x1aa0 drivers/media/usb/ttusb-dec/ttusb_dec.c:1671
 usb_probe_interface+0x308/0x788 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x29c/0x800 drivers/base/dd.c:706
 __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
 driver_probe_device+0x6c/0x19c drivers/base/dd.c:898
 __device_attach_driver+0x198/0x2f8 drivers/base/dd.c:1026
 bus_for_each_drv+0x144/0x1dc drivers/base/bus.c:500
 __device_attach+0x248/0x390 drivers/base/dd.c:1098
 device_initial_probe+0x90/0xc8 drivers/base/dd.c:1153
 bus_probe_device+0x58/0x120 drivers/base/bus.c:620
 device_add+0x6cc/0x9e0 drivers/base/core.c:3772
 usb_set_configuration+0x1184/0x158c drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0x8c/0x148 drivers/usb/core/generic.c:250
 usb_probe_device+0x114/0x2b0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x29c/0x800 drivers/base/dd.c:706
 __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
 driver_probe_device+0x6c/0x19c drivers/base/dd.c:898
 __device_attach_driver+0x198/0x2f8 drivers/base/dd.c:1026
 bus_for_each_drv+0x144/0x1dc drivers/base/bus.c:500
 __device_attach+0x248/0x390 drivers/base/dd.c:1098
 device_initial_probe+0x90/0xc8 drivers/base/dd.c:1153
 bus_probe_device+0x58/0x120 drivers/base/bus.c:620
 device_add+0x6cc/0x9e0 drivers/base/core.c:3772
 usb_new_device+0x9bc/0x11f0 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x1ef0/0x39fc drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0x788/0x10b8 kernel/workqueue.c:3405
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3486
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:838
Code: d503233f a9bf7bfd 910003fd 94619c95 (d4210000) 
---[ end trace 0000000000000000 ]---


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
