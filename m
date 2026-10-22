Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792628982;
	b=C3jnVAssqIE1freYma87EoOAREQCJe80N7qYGVQvgnu0FxOLpNGBUz2G906wutTnT9r8
	 qCwAsxH5Aa5lGhCD46FUqCagycFxMOLNCgKBYv3LMWuc/vY/AYjaeXc+Fl6ddmFeHQKwf
	 XLZ7DY3TpKSd85aGxe7s/DAbmvwYVJmCs6kwq6nj6NKn1tb46OnjorruGpMor6wVfEfow
	 ul/uOuaa6H80R5DNr0pAZkm0eMm0FUoTka2Gu/LWQOK8qau6g6tMzuzJVxMIKlw0cXfsk
	 l+eTFkhWDomvru5vjiwm/glEa2UVLR/d7C5yNMXL4VI79LnDshJbbROrWHPEwkm90Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792628982;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=k+7y4srSR5D7DmxodHvkZk+id2Qqh2iBWb7qay4dOfk=;
	b=XyGNprkVr+jbE3IOCmiV1VUhYIQQmzGk8WMYhCn4OeV9WKx/B3avlU8yRXggjzJVevm/
	 3Zt1yVGB9a1ZZcNUWHmpzcVebKvkGyx+HKyP9pyIWzct1f+mlI4Oh7dokQUW2hsMEygkM
	 XJf9ZdA+Ql0+YmKscMJRGUet62RSciBNHDNHc6JrhaEvvDBkGouHbs1slXCfDfsbqoaMq
	 hO9QbSpPQoQcBTdH19vqgdZfNXKWRcjNe5Gl4hoZt+FQmeswwTtkr40MefYBYs4Br69My
	 KLzlOn+suJONpLxTyLIn50zxqB1fNdwjbfhO05eMHnxYIO33t5yLVJth2M40jBMt6JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36401606A31B
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 00:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36401606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4f9b643ae53so1006252b6e.3
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 17:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792628981; x=1793233781;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+7y4srSR5D7DmxodHvkZk+id2Qqh2iBWb7qay4dOfk=;
        b=fMkj0BeVBjXp4eXIef/iBaoFe8sZGd4YjK44jyKKbr+wn2jM1z7anLESbfjBjFodpv
         IppiOVi3b9SrStHcWoTCAXzGDPfdOq2dPHy4G7RirL3DYSyUvVuYz/+xjPpW/uX4TaP6
         owjBEtpbyi7foa3QR1pcWs5amkDSioJqhp72YFU7m9Z5Raqg7jrfFYr5RaaG9EcQn8Jp
         snSMn75hZWJ7F5parMb3ZnFMnHkF3QuiuNmYQOoq4eDJDYK3GF+Ae0fWI46Rcef5N2Gq
         T2Khs8cyB/Rd0Pk6ZM3ZGSJPKa0VkPUwvYbM3+7tSH3F/CXoNS2f6xFSkaR0OHFuMMxr
         Z54w==
X-Forwarded-Encrypted: i=1; AKwUvBxaHfAP1MWkABc/CXE2uFFEuE/247qfiR75z+dwcgQ/QFLx7d9a2dCyAOUjo6MmQr5+HeubUAQgU3Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqKkHYforkn0GGqIE9vvaf5EkvvFp+hQ+KmCUku4j6zAaX6pRE
	FaAgV9dSsEuQD3hvuTNytLuMllquIdL4b2kr/xO9/lRz1qVzmfqm9Tqp5tdLjVF+eN427U5hcCP
	BPBDFnWLVoM1NfEnhGA9IUBJu5RY/FinO0V3nJ0Hjhy61UMJxBYduko3R12A=
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:152a:b0:495:feaa:9e3b with SMTP id
 5614622812f47-5534f045a50mr2187260b6e.7.1792628981209; Wed, 21 Oct 2026
 17:29:41 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:29:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad958f5.16f08417.1cb7b7.0001.GAE@google.com>
Subject: [syzbot] [media?] [usb?] kernel BUG in v4l2_device_put
From: syzbot <syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8f7df005a756 Add linux-next specific files for 20261020
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1061bb05580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9c1b9b13e3e4ce1a
dashboard link: https://syzkaller.appspot.com/bug?extid=809dfc586f33fc44b6ac
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1104258e580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=176a5481580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4ecf38da9706/disk-8f7df005.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/feab027e2efe/vmlinux-8f7df005.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ded91a573e5a/bzImage-8f7df005.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com

refcount_t: underflow; use-after-free.
------------[ cut here ]------------
kernel BUG at lib/refcount.c:37!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 7562 Comm: v4l_id Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/07/2026
RIP: 0010:refcount_warn_saturate+0x104/0x110 lib/refcount.c:37
Code: 5d ff ff ff e8 4d c1 d1 fc 48 c7 c7 00 e3 8d 8c e8 61 69 30 fc 90 0f 0b e8 39 c1 d1 fc 48 c7 c7 80 e3 8d 8c e8 4d 69 30 fc 90 <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc900065b7cc0 EFLAGS: 00010246
RAX: 0000000000000026 RBX: 0000000000000003 RCX: 86d7792bd9d84300
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff90033f40
RBP: 0000000000000000 R08: ffffffff81a6b7f0 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff237c1d8 R12: 1ffffffff1973318
R13: dffffc0000000000 R14: ffff88807cc000b0 R15: ffffffff882fcb70
FS:  00007f2b1fb76880(0000) GS:ffff8881234da000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055aef7b1964d CR3: 0000000075e40000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __refcount_sub_and_test include/linux/refcount.h:400 [inline]
 __refcount_dec_and_test include/linux/refcount.h:432 [inline]
 refcount_dec_and_test include/linux/refcount.h:450 [inline]
 kref_put include/linux/kref.h:64 [inline]
 v4l2_device_put+0xc2/0xd0 drivers/media/v4l2-core/v4l2-device.c:56
 device_release+0xc4/0x1f0 drivers/base/core.c:-1
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x222/0x550 lib/kobject.c:737
 video_put drivers/media/v4l2-core/v4l2-dev.c:173 [inline]
 v4l2_release+0x273/0x350 drivers/media/v4l2-core/v4l2-dev.c:480
 __fput+0x408/0xa40 fs/file_table.c:513
 fput_close_sync+0x11f/0x240 fs/file_table.c:619
 filp_close_sync fs/open.c:1897 [inline]
 __do_sys_close fs/open.c:2153 [inline]
 __se_sys_close+0xa2/0x160 fs/open.c:2140
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2b1f4a7407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007fffdbbfc440 EFLAGS: 00000202 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 00007f2b1fb76880 RCX: 00007f2b1f4a7407
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 00007f2b1fb766e8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000013
R13: 00007fffdbbfc670 R14: 00007f2b1fcdd000 R15: 000055aef7b1d4d8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:refcount_warn_saturate+0x104/0x110 lib/refcount.c:37
Code: 5d ff ff ff e8 4d c1 d1 fc 48 c7 c7 00 e3 8d 8c e8 61 69 30 fc 90 0f 0b e8 39 c1 d1 fc 48 c7 c7 80 e3 8d 8c e8 4d 69 30 fc 90 <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc900065b7cc0 EFLAGS: 00010246
RAX: 0000000000000026 RBX: 0000000000000003 RCX: 86d7792bd9d84300
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff90033f40
RBP: 0000000000000000 R08: ffffffff81a6b7f0 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff237c1d8 R12: 1ffffffff1973318
R13: dffffc0000000000 R14: ffff88807cc000b0 R15: ffffffff882fcb70
FS:  00007f2b1fb76880(0000) GS:ffff8881234da000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055aef7b1964d CR3: 0000000075e40000 CR4: 00000000003526f0


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
