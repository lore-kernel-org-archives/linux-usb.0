Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179820;
	b=a7rySFJhnmddizDwXWs1tkqdzRFoT+3GCylC+JXms2yKXQ/T7zuamxBsoFt16kDmE6+j
	 WxkV77MPkhWrOB3s/FzO8Pu6W+m0TUTHHlaAH91XIo5a8WnDHJkJrtWLIgVnplE4CGtBB
	 Pg/wVuaE46kN9oZaHnmD1AqEOdk5mHVB8aFLSHoO1EZNgIiUjae3RjcMvpQ75ECKHigSB
	 w1QuQjNJ99vOZiPUcCqdXiYT3kU5+92/jC5Q8ffVgCgZxzaImAty0ZlvrEOmEn7xV7Zlr
	 sUqxSGPDsR/H04Ibm3+JQfqlgvhDyR27USkT5txAajHHESeyNvXinI7RZcpIwbUh8hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179820;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=smQxb2mwKCwsuVuIPq/uxgN1HgzI96lehFm8ztfcx1I=;
	b=Y8CU0imz0UVW2DRvgRXcAugRQ+iEJxKiOtGpJK/Au0J2PWWVTEFi72X3nH4bTKywGDhB
	 uTRy20SHpPwnSAnzBKZqlnVfwbKQrZ/yuGkNxJtm3yHwRulU9E4G/B4w9gkgDDj9qT4aW
	 Zf4uhX9YpzDd90dBq2aan5h7KOZrIC9IU1Xq+kt4PAsMmTKswgOm/Ob/fFBlyoNKn36mW
	 DSVrgJkA5McKGqLuWzXZl63y5ApsOhFxR6h6dmMGtcErDHOg4DykIrgApNN9MLgrVdXNY
	 MjI6W8jZiuhFRa1Ord+6Z3sSWoW2Mj3Q0Gr1TggL2HDUXqAmfBDy37/Pp09haWvfVAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tv2tRS34;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8724606A320;
	Fri, 20 Nov 2026 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tv2tRS34
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DAD1F000C0;
	Fri, 20 Nov 2026 13:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795179819;
	bh=smQxb2mwKCwsuVuIPq/uxgN1HgzI96lehFm8ztfcx1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tv2tRS34tLhDBUeubUVIb7VUyCGvZaDqc33iXpr/5+TwgmLTfoDEqmTD4cqpVy0v3
	 0cuvYTukYpknpf4HwWx93+72JaXHjfEQ7sNF4M6eVa/AtAGim6Rk49JomBwTuWYQ2G
	 B+yLNcxTJ7vOPQvGCp7FwrEUhg+TeK+NcQKvT2ME=
Date: Fri, 20 Nov 2026 14:03:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+596b59aea1a9deaaab67@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v2] usb: raw-gadget: fix UAF in raw_process_ep_io
Message-ID: <2026112024-doorframe-tapering-1508@gregkh>
References: <20260926113213.1469-1-drifabdelmalekmohamedsaid@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926113213.1469-1-drifabdelmalekmohamedsaid@gmail.com>

On Sat, Sep 26, 2026 at 12:32:12PM +0100, Drif Abdelmalek Mohamed Said wrote:
> syzbot reported
> 
> BUG: KASAN: slab-use-after-free in string_nocheck lib/vsprintf.c:648 [inline]
> BUG: KASAN: slab-use-after-free in string+0x471/0x4d0 lib/vsprintf.c:730
> Read of size 1 at addr ffff88802c217340 by task syz-executor384/5947
> 
> CPU: 1 UID: 0 PID: 5947 Comm: syz-executor384 Not tainted syzkaller #0 PREEMPT(full)
> Hardware name: Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
> Call Trace:
> <TASK>
> __dump_stack lib/dump_stack.c:94 [inline]
> dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
> print_address_description mm/kasan/report.c:378 [inline]
> print_report+0x13d/0x4b0 mm/kasan/report.c:482
> kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
> string_nocheck lib/vsprintf.c:648 [inline]
> string+0x471/0x4d0 lib/vsprintf.c:730
> vsnprintf+0x422/0x1300 lib/vsprintf.c:2945
> snprintf+0xc7/0x100 lib/vsprintf.c:3043
> set_dev_info drivers/base/core.c:4984 [inline]
> dev_vprintk_emit+0x375/0x3e0 drivers/base/core.c:4994
> dev_printk_emit+0xd2/0x10d drivers/base/core.c:5007
> __dev_printk+0xcb/0x100 drivers/base/core.c:5019
> _dev_err+0xef/0x127 drivers/base/core.c:5062
> raw_process_ep_io.cold+0x43/0x83 drivers/usb/gadget/legacy/raw_gadget.c:1116
> raw_ioctl_ep_write drivers/usb/gadget/legacy/raw_gadget.c:1153 [inline]
> raw_ioctl+0x25a/0x2b80 drivers/usb/gadget/legacy/raw_gadget.c:1325
> vfs_ioctl fs/ioctl.c:51 [inline]
> __do_sys_ioctl fs/ioctl.c:597 [inline]
> __se_sys_ioctl fs/ioctl.c:583 [inline]
> __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
> do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
> entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fc86effa5eb
> Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48
> Code: 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05
> Code: <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00
> RSP: 002b:00007ffcab99fea0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fc86effa5eb
> RDX: 00007ffcab99ff14 RSI: 0000000040085507 RDI: 0000000000000003
> RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
> R10: 00007ffcab99fec0 R11: 0000000000000246 R12: 0000000000000003
> R13: 00007ffcab99ff08 R14: 00007fc86f07dcc0 R15: 0000000000000002
> </TASK>
> 
> Allocated by task 1:
> kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
> kasan_save_track+0x14/0x30 mm/kasan/common.c:78
> poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
> __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
> kasan_kmalloc include/linux/kasan.h:263 [inline]
> __do_kmalloc_node mm/slub.c:5334 [inline]
> __kmalloc_node_track_caller_noprof+0x331/0x830 mm/slub.c:5471
> kvasprintf+0xbc/0x150 lib/kasprintf.c:25
> kvasprintf_const+0x66/0x1a0 lib/kasprintf.c:49
> kobject_set_name_vargs+0x5a/0x140 lib/kobject.c:274
> dev_set_name+0xc7/0x100 drivers/base/core.c:3560
> usb_add_gadget+0x520/0x920 drivers/usb/gadget/udc/core.c:1459
> usb_add_gadget_udc_release drivers/usb/gadget/udc/core.c:1517 [inline]
> usb_add_gadget_udc+0x26/0x70 drivers/usb/gadget/udc/core.c:1564
> dummy_udc_probe+0x69e/0x960 drivers/usb/gadget/udc/dummy_hcd.c:1121
> platform_probe+0x106/0x1d0 drivers/base/platform.c:1439
> call_driver_probe drivers/base/dd.c:628 [inline]
> really_probe+0x241/0xa60 drivers/base/dd.c:706
> __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
> driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
> __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
> bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
> __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
> device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
> bus_probe_device+0x64/0x160 drivers/base/bus.c:620
> device_add+0x121d/0x1970 drivers/base/core.c:3772
> platform_device_add+0x35a/0x800 drivers/base/platform.c:762
> dummy_hcd_init+0x803/xc00 drivers/usb/gadget/udc/dummy_hcd.c:2894
> do_one_initcall+0x11d/0x700 init/main.c:1347
> do_initcall_level init/main.c:1409 [inline]
> do_initcalls init/main.c:1425 [inline]
> do_basic_setup init/main.c:1445 [inline]
> kernel_init_freeable+0x6ea/0x7b0 init/main.c:1658
> kernel_init+0x1f/0x1e0 init/main.c:1548
> ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
> ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> 
> Freed by task 5947:
> kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
> kasan_save_track+0x14/0x30 mm/kasan/common.c:78
> kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
> poison_slab_object mm/kasan/common.c:253 [inline]
> __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
> kasan_slab_free include/linux/kasan.h:235 [inline]
> slab_free_hook mm/slub.c:2677 [inline]
> slab_free mm/slub.c:6377 [inline]
> kfree+0x22b/0x6c0 mm/slub.c:6692
> kfree_const+0x5a/0x70 mm/util.c:46
> kobject_cleanup lib/kobject.c:695 [inline]
> kobject_release lib/kobject.c:720 [inline]
> kref_put include/linux/kref.h:65 [inline]
> kobject_put+0x218/0x640 lib/kobject.c:737
> put_device+0x1f/0x30 drivers/base/core.c:3880
> platform_remove+0x5f/0x80 drivers/base/platform.c:1456
> device_remove+0xcb/0x180 drivers/base/dd.c:616
> __device_release_driver drivers/base/dd.c:1349 [inline]
> device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
> unbind_store+0xf8/0x110 drivers/base/bus.c:244
> drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
> sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
> kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
> new_sync_write fs/read_write.c:595 [inline]
> vfs_write+0x6ac/0x1050 fs/read_write.c:687
> ksys_write+0x12a/0x250 fs/read_write.c:739
> do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
> entry_SYSCALL_64_after_hwframe+0x77/0x7f

All of that doesn't need to be here :(
