Received: from mail-ot1-f77.google.com (mail-ot1-f77.google.com [209.85.210.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C5846DFF2
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 15:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030002; cv=none; b=X193iP01q3uiRHyGsr5Mn2jodBa/JizT0IC6AwrsSiDRvvNeTjncrAU6ftLaiyB28/2rHgMUxCCcxPySLJoG0Nv7TN9lvfTKUWpZ4Ve/Mw/Rk8/IfpARTrWc74nwrhfic2U7oPsctxjKPP7QDS0ZvW/S0QUYkMdcPpdLvOsOYgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030002; c=relaxed/simple;
	bh=Mx20es11yShFAbgQsC0TkgYGRSMejod8m12OHDLWiK8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=SumzyqZ9YzAOcUNOwG+QKgiAH1C05WNsD03Rd/Ccx5dZ3yTfAgCchjCIR6JBYx6Z3+1+0RCOTjvMTbWBxZ5SqCiV8DxZayi9Gk9f+dM1dV4TM9u/CpOW2bCJ0FOWKJr9waXJDG0m6jNm+jdX8fr6nYdlskQYx6GfMglklJOCrzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f77.google.com with SMTP id 46e09a7af769-7ec54966bedso1106108a34.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 08:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786029999; x=1786634799;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmw7Utge2LY0gxUDH8p3KlOzwiiqHuF+FUsdl64nTmQ=;
        b=i6pEseSItTbZ2QkFQPsejv4eaALxxc7rDrnzAI1pEg4bl8h8L/ClJXvzr2ABDsY/9Z
         GD3gLrmGycogRtVooSibAW5X+M/0MOYALOjsV9MWM6LMCfWvnpENASJ+Sf0vdXJ3BgCC
         OdGcd1v8aNQOWtCNOyPGqTfGaFR3H8w9IhoLrp3EI+AmqIEwD3Wc3AglHYFktloKMTn8
         gIqY6ETXuZLFBL+A9SdNOm3/UYMynsLJkAOjKKsR3Yim9Yg8zNtq4EN6QRWgD2uSxBZo
         cOHTBchFA92i3ygQK5mcARPV84/E/cD4NN1ZO+uZIuk8NoJHXmzYer0+FAreVXINPVMG
         W6jg==
X-Forwarded-Encrypted: i=1; AHgh+RpPLJCkUFbuA1EemgNc8s+YOk9qW5qCZHuO8soFeZJgf4m3fQYozz6lktZ/vgBg0A8gKVA61Xq9VYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6axE7v51azW6o6D1H8W5PzashpcDZhH3EBV/zfwAKBG0kFsx/
	sEdXWbTSjStpTOr7df16U4yOUvguSb5aY/Da9sGN6NNucDHbnT24JhYpbQbPTepshkWCRfufbp7
	5nLoZ9x7/tBq6EL4ZJyseWClNplgU3rPaS/a4oZ5TQcocn/B84FZlWsQD5G0=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2d0c:b0:6aa:1bc8:ae0d with SMTP id
 006d021491bc7-6aeaba25683mr4168351eaf.4.1786029999079; Thu, 06 Aug 2026
 08:26:39 -0700 (PDT)
Date: Thu, 06 Aug 2026 08:26:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a74a7af.01d0871a.3a0d52.0020.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in trace_suspend_resume/usb_submit_urb (2)
From: syzbot <syzbot+2bb585d2cfddda02795c@syzkaller.appspotmail.com>
To: david@ixit.cz, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	oe-linux-nfc@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux master
console output: https://syzkaller.appspot.com/x/log.txt?x=11e47649580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db7ba9edb9755fc1
dashboard link: https://syzkaller.appspot.com/bug?extid=2bb585d2cfddda02795c
compiler:       arm-linux-gnueabi-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: arm

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/98a89b9f34e4/non_bootable_disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ed18b055a7ce/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d9e1502ff007/zImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2bb585d2cfddda02795c@syzkaller.appspotmail.com

usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 2-1: Product: syz
usb 2-1: Manufacturer: syz
usb 2-1: SerialNumber: syz
------------[ cut here ]------------
WARNING: drivers/usb/core/urb.c:379 at usb_submit_urb+0x62c/0x63c drivers/usb/core/urb.c:379, CPU#1: kworker/1:10/3926
URB 864e79c0 submitted while active
Modules linked in:
Kernel panic - not syncing: kernel: panic_on_warn set ...
CPU: 1 UID: 0 PID: 3926 Comm: kworker/1:10 Not tainted syzkaller #0 PREEMPT 
Hardware name: ARM-Versatile Express
Workqueue: usb_hub_wq hub_event
Call trace: 
[<80201998>] (dump_backtrace) from [<80201a8c>] (show_stack+0x18/0x1c arch/arm/kernel/traps.c:257)
 r7:82a20f78 r6:00000000 r5:8233307c r4:00000001
[<80201a74>] (show_stack) from [<8021e5fc>] (__dump_stack lib/dump_stack.c:94 [inline])
[<80201a74>] (show_stack) from [<8021e5fc>] (dump_stack_lvl+0x5c/0x70 lib/dump_stack.c:120)
[<8021e5a0>] (dump_stack_lvl) from [<8021e628>] (dump_stack+0x18/0x1c lib/dump_stack.c:129)
 r7:82a20f78 r6:00000000 r5:84edee40 r4:82c83d40
[<8021e610>] (dump_stack) from [<80202590>] (vpanic+0x114/0x320 kernel/panic.c:651)
[<8020247c>] (vpanic) from [<802027d0>] (trace_suspend_resume+0x0/0x100 kernel/panic.c:788)
 r7:80f4c394
[<8020279c>] (panic) from [<80250a80>] (check_panic_on_warn kernel/panic.c:525 [inline])
[<8020279c>] (panic) from [<80250a80>] (get_taint+0x0/0x1c kernel/panic.c:520)
 r3:82a0b144 r2:00000001 r1:82318de0 r0:8232073c
[<80250a08>] (check_panic_on_warn) from [<80250bfc>] (__warn+0x98/0x1a4 kernel/panic.c:1104)
[<80250b64>] (__warn) from [<80250ef0>] (warn_slowpath_fmt+0x1e8/0x1f4 kernel/panic.c:1144)
 r8:00000009 r7:82425828 r6:e0195884 r5:84edee40 r4:00000000
[<80250d0c>] (warn_slowpath_fmt) from [<80f4c394>] (usb_submit_urb+0x62c/0x63c drivers/usb/core/urb.c:379)
 r10:00000001 r9:864e7adc r8:8384a600 r7:865b7a40 r6:83848f00 r5:864e7ac0
 r4:864e79c0
[<80f4bd68>] (usb_submit_urb) from [<80c37954>] (port100_send_frame_async drivers/nfc/port100.c:783 [inline])
[<80f4bd68>] (usb_submit_urb) from [<80c37954>] (port100_send_cmd_async+0x18c/0x2a4 drivers/nfc/port100.c:879)
 r10:00000001 r9:864e7adc r8:8384a600 r7:865b7a40 r6:83848f00 r5:864e7ac0
 r4:00000000
[<80c377c8>] (port100_send_cmd_async) from [<80c385a0>] (port100_send_cmd_sync drivers/nfc/port100.c:919 [inline])
[<80c377c8>] (port100_send_cmd_async) from [<80c385a0>] (port100_set_command_type drivers/nfc/port100.c:990 [inline])
[<80c377c8>] (port100_send_cmd_async) from [<80c385a0>] (port100_probe+0x33c/0x580 drivers/nfc/port100.c:1555)
 r10:82425d00 r9:82b66084 r8:83848f00 r7:e0195960 r6:86357c30 r5:00000001
 r4:864e7ac0
[<80c38264>] (port100_probe) from [<80f5122c>] (usb_probe_interface+0x148/0x380 drivers/usb/core/driver.c:396)
 r8:86361888 r7:00000001 r6:81d65a44 r5:86357c30 r4:ffffffed
[<80f510e4>] (usb_probe_interface) from [<80bd5054>] (call_driver_probe drivers/base/dd.c:628 [inline])
[<80f510e4>] (usb_probe_interface) from [<80bd5054>] (really_probe+0xd8/0x40c drivers/base/dd.c:706)
 r10:82425d00 r9:82b618bc r8:00000043 r7:00000000 r6:82b66084 r5:00000000
 r4:86357c30
[<80bd4f7c>] (really_probe) from [<80bd5428>] (__driver_probe_device+0xa0/0x21c drivers/base/dd.c:868)
 r8:00000043 r7:86357c30 r6:e0195ab4 r5:82b66084 r4:86357c30
[<80bd5388>] (__driver_probe_device) from [<80bd5684>] (driver_probe_device+0x3c/0xc0 drivers/base/dd.c:898)
 r9:82b618bc r8:00000043 r7:86357c30 r6:e0195ab4 r5:82d250b4 r4:82d250a4
[<80bd5648>] (driver_probe_device) from [<80bd57a8>] (__device_attach_driver+0xa0/0x138 drivers/base/dd.c:1026)
 r9:82b618bc r8:833f7940 r7:86357c30 r6:e0195ab4 r5:82b66084 r4:00000001
[<80bd5708>] (__device_attach_driver) from [<80bd2c60>] (bus_for_each_drv+0x98/0xec drivers/base/bus.c:500)
 r7:833f7900 r6:80bd5708 r5:e0195ab4 r4:00000000
[<80bd2bc8>] (bus_for_each_drv) from [<80bd5bc4>] (__device_attach+0xb0/0x1e4 drivers/base/dd.c:1098)
 r7:833f7900 r6:86357c7c r5:00000001 r4:86357c30
[<80bd5b14>] (__device_attach) from [<80bd5ebc>] (device_initial_probe+0x44/0x48 drivers/base/dd.c:1153)
 r6:833f7900 r5:86357c30 r4:833f7900
[<80bd5e78>] (device_initial_probe) from [<80bd3d28>] (bus_probe_device+0x30/0x84 drivers/base/bus.c:620)
 r5:86357c30 r4:86357c30
[<80bd3cf8>] (bus_probe_device) from [<80bd0f54>] (device_add+0x610/0x834 drivers/base/core.c:3772)
 r9:82b618bc r8:81da8f84 r7:86361888 r6:86357c7c r5:00000000 r4:86357c30
[<80bd0944>] (device_add) from [<80f4f304>] (usb_set_configuration+0x5d8/0x938 drivers/usb/core/message.c:2268)
 r10:82425d00 r9:82c35298 r8:86361888 r7:83e08e50 r6:00000001 r5:83e08e50
 r4:86357c00
[<80f4ed2c>] (usb_set_configuration) from [<80f5c4fc>] (usb_generic_driver_probe+0x48/0x84 drivers/usb/core/generic.c:250)
 r10:8415a128 r9:82b618bc r8:00000043 r7:86361800 r6:82b88da0 r5:00000001
 r4:86361800
[<80f5c4b4>] (usb_generic_driver_probe) from [<80f506ac>] (usb_probe_device+0x44/0x14c drivers/usb/core/driver.c:291)
 r5:00000001 r4:86361888
[<80f50668>] (usb_probe_device) from [<80bd5054>] (call_driver_probe drivers/base/dd.c:628 [inline])
[<80f50668>] (usb_probe_device) from [<80bd5054>] (really_probe+0xd8/0x40c drivers/base/dd.c:706)
 r7:00000000 r6:82b88da0 r5:00000000 r4:86361888
[<80bd4f7c>] (really_probe) from [<80bd5428>] (__driver_probe_device+0xa0/0x21c drivers/base/dd.c:868)
 r8:00000043 r7:86361888 r6:e0195d1c r5:82b88da0 r4:86361888
[<80bd5388>] (__driver_probe_device) from [<80bd5684>] (driver_probe_device+0x3c/0xc0 drivers/base/dd.c:898)
 r9:82b618bc r8:00000043 r7:86361888 r6:e0195d1c r5:82d250b4 r4:82d250a4
[<80bd5648>] (driver_probe_device) from [<80bd57a8>] (__device_attach_driver+0xa0/0x138 drivers/base/dd.c:1026)
 r9:82b618bc r8:833f7940 r7:86361888 r6:e0195d1c r5:82b88da0 r4:00000001
[<80bd5708>] (__device_attach_driver) from [<80bd2c60>] (bus_for_each_drv+0x98/0xec drivers/base/bus.c:500)
 r7:833f7900 r6:80bd5708 r5:e0195d1c r4:00000000
[<80bd2bc8>] (bus_for_each_drv) from [<80bd5bc4>] (__device_attach+0xb0/0x1e4 drivers/base/dd.c:1098)
 r7:833f7900 r6:863618d4 r5:00000001 r4:86361888
[<80bd5b14>] (__device_attach) from [<80bd5ebc>] (device_initial_probe+0x44/0x48 drivers/base/dd.c:1153)
 r6:833f7900 r5:86361888 r4:833f7900
[<80bd5e78>] (device_initial_probe) from [<80bd3d28>] (bus_probe_device+0x30/0x84 drivers/base/bus.c:620)
 r5:86361888 r4:86361888
[<80bd3cf8>] (bus_probe_device) from [<80bd0f54>] (device_add+0x610/0x834 drivers/base/core.c:3772)
 r9:82b618bc r8:00000000 r7:83e1a088 r6:863618d4 r5:00000000 r4:86361888
[<80bd0944>] (device_add) from [<80f4329c>] (usb_new_device+0x28c/0x6b8 drivers/usb/core/hub.c:2695)
 r10:8415a128 r9:00000003 r8:ffffffff r7:00000001 r6:9113d800 r5:86361888
 r4:86361800
[<80f43010>] (usb_new_device) from [<80f45b50>] (hub_port_connect drivers/usb/core/hub.c:5567 [inline])
[<80f43010>] (usb_new_device) from [<80f45b50>] (hub_port_connect_change drivers/usb/core/hub.c:5707 [inline])
[<80f43010>] (usb_new_device) from [<80f45b50>] (port_event drivers/usb/core/hub.c:5871 [inline])
[<80f43010>] (usb_new_device) from [<80f45b50>] (hub_event+0x11ec/0x1b80 drivers/usb/core/hub.c:5953)
 r10:8415a128 r9:86361800 r8:83e1a000 r7:00000001 r6:8437ca00 r5:00000000
 r4:00000003
[<80f44964>] (hub_event) from [<802761e8>] (process_one_work+0x1c8/0x580 kernel/workqueue.c:3322)
 r10:83132405 r9:84edee40 r8:01800000 r7:ddde4f00 r6:83132400 r5:8415a128
 r4:86545400
[<80276020>] (process_one_work) from [<80276e94>] (process_scheduled_works kernel/workqueue.c:3405 [inline])
[<80276020>] (process_one_work) from [<80276e94>] (worker_thread+0x16c/0x318 kernel/workqueue.c:3486)
 r10:00000000 r9:86545430 r8:84edee40 r7:82a03d80 r6:ddde4f20 r5:ddde4f00
 r4:86545400
[<80276d28>] (worker_thread) from [<80281710>] (kthread+0x11c/0x154 kernel/kthread.c:436)
 r10:00000000 r9:e4441e88 r8:86544e80 r7:86545400 r6:80276d28 r5:84edee40
 r4:86532080
[<802815f4>] (kthread) from [<80200114>] (ret_from_fork+0x14/0x20 arch/arm/kernel/entry-common.S:137)
Exception stack(0xe0195fb0 to 0xe0195ff8)
5fa0:                                     00000000 00000000 00000000 00000000
5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:802815f4 r4:86532080
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
