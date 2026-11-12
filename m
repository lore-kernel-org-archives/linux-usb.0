Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463000;
	b=jG/NRYSdNPOlvnbWTHG5cI+Jh2vXGK3f4CekS8AHrY4TnixaEacqLGQ2lVQRq/OsZewc
	 61zvpCWkyUe1ukAclQPTmoLvKhTglpPwpF52I3HbimntcaDIGfvA8vGu4Rb24pPUwh2GZ
	 4kDwTOGaUnny0HnkqzYJQQgGhVsI5Z31JY4wFbfwwXhL5SyfMLo+Xs3fX+sBHj3UC1dF2
	 Rek0PVYXEKni49f7w69Or5VRQn53c85ZIPPMqdFUpjKbu7modanzSO9R60jtQcVcECPI+
	 p0euuI9STqbtQDRYkzdvuH+lFu35sKe9NAgQSx0fbsUAzGWmHNoPtWCHrOKEhM6uW5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463000;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=uQf/9IZU6uSCTx/IYygHhrSWPp7hzih38smhNOg2mec=;
	b=VSeivOIq/Ybo8rKMuCSJEkPJ3ay9wu7hXGSi9C3g3CdSVK/1f59ktzAO9heUj9m9NTkf
	 T4NvEbno69lLsfuq67wJXkdWywcK3mgqL3HZMxWN9NC/ioYKQNwpuz7h8oskJo0PPt2g8
	 M7Ben6328PxBh8BXR38y5bWFj9gLlxEgI9q0OTj8esWYcN7ji86lvvKEURsE8DL/kzjaG
	 Pmy+ahHlaSgDmwhHdxe8kRVid3+P2qg2hKCccxILMNmB6hSpxoz938E68Y05CbYyN/Xfc
	 01mMy0GtNHhxZpzygDR2IeMuFqCEnggznpfw14Cv10rEUcIpQWIAMiHGkyL3Sade0Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504EA606A32D
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 05:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 504EA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab8b4887d4so2789325b6e.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 21:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794462999; x=1795067799;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQf/9IZU6uSCTx/IYygHhrSWPp7hzih38smhNOg2mec=;
        b=lq7XV6LH7HspETvDnTKlprsrAYz5hXTIJcwz+FHbOaA4woBAVa2NAgl8VpXn+LdrTN
         y9U8/PS2payo67PH01jrIpVwgNnEGe+pEOd/fKMXwc83EJ3KDqDpVoe1gcsrwLsFd306
         ce/QdUkr7EF+2dJcFvbBUTwz+nPzkNdCZ6Y6or/PDSJ7vPcHpARLjOPt1biQGkPFfuAB
         CkkI7MGU5zt3XqZivQaVRaDehYxmbRATPRKYtn8AfQyG2eOmReLJQ//+VCTnoCO34JTV
         0Nhn885bJh1nnhjm33AE7e5wbIa5ClmBkDDd7GcsrXrk/wxtmNb1SG/DLnOEd/DBsS0e
         xDHw==
X-Forwarded-Encrypted: i=1; AL+hErG7GTE6JHrc1FUBp92C2JTPKrML02HLSOfD6JoW0HbeY+oenUlsmGWJOb3eYRdFkcLwbMgrnZ/He3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LfDtYAxtC+mvo05jt1SLi5EKUZJg3fh5iLrR8UB7qez/I44+f
	S2oCRA4jNAhrtZ0zj2kMZnhSgRSsN2YDF/LMUbCBVcekNPfx61jL7zz+T5Yx3E04la26lls+VmS
	0ePQo3xRB45ztU32pXPozXCk7ebYYDcLOEBEf201SjG5AW5h4rDBO9J2WdVw=
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:30a6:b0:53e:8376:dfbf with SMTP id
 5614622812f47-56b97307e39mr4405554b6e.40.1794462999296; Wed, 11 Nov 2026
 21:56:39 -0800 (PST)
Date: Wed, 11 Nov 2026 21:56:39 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af55517.a0c627da.5d811.0010.GAE@google.com>
Subject: [syzbot] [greybus?] [usb?] KASAN: slab-out-of-bounds Read in gb_operation_work
From: syzbot <syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com>
To: elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
	johan@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6628e7d4c6b2 Linux 7.4-rc1
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=109ac1a1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f9bf69220d319004
dashboard link: https://syzkaller.appspot.com/bug?extid=0b456664585fa81a47f6
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=149ac1a1580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=150c9f8d580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d415be35d54e/disk-6628e7d4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/69e49385122b/vmlinux-6628e7d4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/51be81fff25f/bzImage-6628e7d4.xz

AI-generated root cause summary:
In gb_connection_recv() (drivers/greybus/operation.c), the kernel verifies that
the incoming buffer length is at least sizeof(struct gb_operation_msg_hdr), but
fails to validate that the message header's claimed size (header.size, parsed as
msg_size) is also at least sizeof(struct gb_operation_msg_hdr). When msg_size <
sizeof(struct gb_operation_msg_hdr), gb_operation_create_incoming() subtracts
the header size from msg_size, causing an unsigned integer underflow when
calculating request_size. In gb_operation_message_alloc(), the payload size and
header size wrap back around and kzalloc(msg_size) allocates an undersized
buffer smaller than the header, leading to out-of-bounds reads when reading
request_header->operation_id or a ZERO_SIZE_PTR dereference panic when msg_size
is zero.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=0b456664585fa81a47f6

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com

greybus 1-svc: unexpected request 0x7f received (state 0)
==================================================================
BUG: KASAN: slab-out-of-bounds in gb_operation_response_alloc drivers/greybus/operation.c:490 [inline]
BUG: KASAN: slab-out-of-bounds in gb_operation_response_send drivers/greybus/operation.c:832 [inline]
BUG: KASAN: slab-out-of-bounds in gb_operation_request_handle drivers/greybus/operation.c:252 [inline]
BUG: KASAN: slab-out-of-bounds in gb_operation_work+0x8be/0x990 drivers/greybus/operation.c:280
Read of size 2 at addr ffff888105f0a642 by task kworker/u8:2/38

CPU: 1 UID: 0 PID: 38 Comm: kworker/u8:2 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/15/2026
Workqueue: greybus1:0 gb_operation_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 gb_operation_response_alloc drivers/greybus/operation.c:490 [inline]
 gb_operation_response_send drivers/greybus/operation.c:832 [inline]
 gb_operation_request_handle drivers/greybus/operation.c:252 [inline]
 gb_operation_work+0x8be/0x990 drivers/greybus/operation.c:280
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3495
 process_scheduled_works kernel/workqueue.c:3578 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x69f/0xc90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 28:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5531 [inline]
 __kmalloc_noprof+0x315/0x7e0 mm/slub.c:5556
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 gb_operation_message_alloc+0x9b/0x2c0 drivers/greybus/operation.c:380
 gb_operation_create_common+0x9f/0x710 drivers/greybus/operation.c:532
 gb_operation_create_incoming drivers/greybus/operation.c:644 [inline]
 gb_connection_recv_request drivers/greybus/operation.c:926 [inline]
 gb_connection_recv+0x1dc/0x1050 drivers/greybus/operation.c:1063
 greybus_data_rcvd+0x244/0x600 drivers/greybus/connection.c:89
 cport_in_callback+0x1fb/0x280 drivers/greybus/es2.c:840
 __usb_hcd_giveback_urb+0x38e/0x610 drivers/usb/core/hcd.c:1657
 usb_hcd_giveback_urb+0x3ca/0x4a0 drivers/usb/core/hcd.c:1741
 dummy_timer+0xdb5/0x3840 drivers/usb/gadget/udc/dummy_hcd.c:2051
 __run_hrtimer kernel/time/hrtimer.c:2079 [inline]
 __hrtimer_run_queues+0x448/0x9a0 kernel/time/hrtimer.c:2136
 hrtimer_run_softirq+0x1ca/0x360 kernel/time/hrtimer.c:2153
 handle_softirqs+0x209/0xa00 kernel/softirq.c:669
 __do_softirq kernel/softirq.c:703 [inline]
 invoke_softirq kernel/softirq.c:542 [inline]
 __irq_exit_rcu+0x17a/0x220 kernel/softirq.c:786
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:809
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0x8f/0xb0 arch/x86/kernel/apic/apic.c:1062
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674

The buggy address belongs to the object at ffff888105f0a640
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 2 bytes inside of
 allocated 3-byte region [ffff888105f0a640, ffff888105f0a643)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x105f0a
flags: 0x200000000000000(node=0|zone=2)
page_type: f5(slab)
raw: 0200000000000000 ffff888100041500 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000800080 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2c00(GFP_NOIO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 6490716744
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1856
 prep_new_page mm/page_alloc.c:1864 [inline]
 get_page_from_freelist+0xf4b/0x3440 mm/page_alloc.c:3935
 __alloc_frozen_pages_noprof+0x299/0x2d50 mm/page_alloc.c:5444
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab mm/slub.c:3499 [inline]
 new_slab+0xb1/0x6d0 mm/slub.c:3550
 refill_objects+0xe3/0x410 mm/slub.c:7539
 refill_sheaf mm/slub.c:2917 [inline]
 __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 __do_kmalloc_node mm/slub.c:5530 [inline]
 __kmalloc_node_noprof+0x634/0x820 mm/slub.c:5543
 _kmalloc_array_node_noprof include/linux/slab.h:1297 [inline]
 __blk_mq_realloc_hw_ctxs+0x579/0x820 block/blk-mq.c:4588
 blk_mq_realloc_hw_ctxs block/blk-mq.c:4652 [inline]
 blk_mq_init_allocated_queue+0x36c/0x1500 block/blk-mq.c:4694
 blk_mq_alloc_queue+0x1bd/0x290 block/blk-mq.c:4464
 scsi_alloc_sdev+0x972/0xe90 drivers/scsi/scsi_scan.c:339
 scsi_probe_and_add_lun+0x523/0x720 drivers/scsi/scsi_scan.c:1227
 __scsi_scan_target+0x188/0x420 drivers/scsi/scsi_scan.c:1803
 scsi_scan_channel drivers/scsi/scsi_scan.c:1893 [inline]
 scsi_scan_channel+0x142/0x1e0 drivers/scsi/scsi_scan.c:1868
 scsi_scan_host_selected+0x2b3/0x380 drivers/scsi/scsi_scan.c:1922
 do_scsi_scan_host+0x1f4/0x270 drivers/scsi/scsi_scan.c:2055
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888105f0a500: 06 fc fc fc 00 fc fc fc 00 fc fc fc 00 fc fc fc
 ffff888105f0a580: fa fc fc fc 06 fc fc fc 06 fc fc fc 06 fc fc fc
>ffff888105f0a600: 06 fc fc fc 00 fc fc fc 03 fc fc fc fa fc fc fc
                                           ^
 ffff888105f0a680: fa fc fc fc 00 fc fc fc fa fc fc fc 00 fc fc fc
 ffff888105f0a700: fa fc fc fc 05 fc fc fc 05 fc fc fc 05 fc fc fc
==================================================================


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
