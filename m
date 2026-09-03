Received: from smtp153-166.sina.com.cn (smtp153-166.sina.com.cn [61.135.153.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F388B411FAA
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429352; cv=none; b=jLqOfwYZtMdbkHIPZgCenTfuAPaYCvJrnJS3wG+fUmOQy1w2i7hGpW+Grwv59F+5INZbC+wQMVTlmZ9RhXmN90AcI2W38MLcfZ8Q0Ff8vo85y4HhTmcHa2hVTBhSvWcGvcQWH0uMcBTTvjUcyoZ9/peRKYcIfhpIPtvVnOZf/hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429352; c=relaxed/simple;
	bh=QnnhI5Eo9glTNAqGmsmMrT6EvfWvtEwaG72G8WhNIEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WcFNAZvqSLB7j9g1xCnglu8ruptISVMDFmjD/86oXu1ET+F39sAss9UMR1GSX4D8i2K9YG1bDh25DxIAPo5YyIHuQrUY0TrzhHZ8F8bfAkEaFa7fSXkXF+zGxo7V9OplZ7pH/S0UVGxzPENuDyUz0z+b7IGmuk74OJtCAYpmUBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=hWSWP9ed; arc=none smtp.client-ip=61.135.153.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="hWSWP9ed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1788429347;
	bh=2JORN2nrJ441vcGPDBpQZri1+/lN2DT6GNbvVKEQ6Ko=;
	h=From:Subject:Date:Message-ID;
	b=hWSWP9edzLPGa/MWN59koEvGmKX1Xma5ZmoS5zdGKizFNJWqc05TzI7m7HTilDQBP
	 pcSEdqEe/YMxGIOLLjO34sPebMJ7yOBcqiY5kKWC1t7qeaFZ+dALPy8+uijUX2d3VU
	 WpIvtoMO/3x+XPnlq7h8jKjCOdHqtM4yGD7fxLV0=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.33) with ESMTP
	id 6A994419000064C9; Thu, 3 Sep 2026 17:55:40 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 8448236685242
X-SMAIL-UIID: 8D7F7C77A2FA4BD4ACDB80B6024E9B0F-20260903-175540-1
From: Hillf Danton <hdanton@sina.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: syzbot <syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com>,
	linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com,
	Daniel Mack <zonque@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in usb_free_urb
Date: Thu,  3 Sep 2026 17:55:25 +0800
Message-ID: <20260903095527.2048-1-hdanton@sina.com>
In-Reply-To: <20260903112417.21b76017.michal.pecio@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 3 Sep 2026 11:24:17 +0200 Michal Pecio wrote:
>On Tue, 01 Sep 2026 22:09:33 -0700, syzbot wrote:
>> syzbot has found a reproducer for the following issue on:
>> 
>> HEAD commit:    786262be6048 Merge tag 'edac_updates_for_v7.3_rc2' of git:..
>> git tree:       upstream
>> console+strace: https://syzkaller.appspot.com/x/log.txt?x=12a28125580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
>> dashboard link: https://syzkaller.appspot.com/bug?extid=832ce9fa3face1b7d44d
>> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1735af79580000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=135b7f79580000
>> 
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/c3e528ebf709/disk-786262be.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/46f3418d2828/vmlinux-786262be.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/60ab8a27c4f7/bzImage-786262be.xz
>> 
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
>> 
>> usb 1-1: received EP1 urb->status = -2
>> ==================================================================
>> BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
>> BUG: KASAN: slab-use-after-free in atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
>> BUG: KASAN: slab-use-after-free in __refcount_sub_and_test include/linux/refcount.h:389 [inline]
>> BUG: KASAN: slab-use-after-free in __refcount_dec_and_test include/linux/refcount.h:432 [inline]
>> BUG: KASAN: slab-use-after-free in refcount_dec_and_test include/linux/refcount.h:450 [inline]
>> BUG: KASAN: slab-use-after-free in kref_put include/linux/kref.h:64 [inline]
>> BUG: KASAN: slab-use-after-free in usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
>> Write of size 4 at addr ffff88803cee1050 by task ktimers/1/29
>> 
>> CPU: 1 UID: 0 PID: 29 Comm: ktimers/1 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
>> Call Trace:
>>  <TASK>
>>  dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
>>  print_address_description+0x55/0x1e0 mm/kasan/report.c:378
>>  print_report+0x58/0x70 mm/kasan/report.c:482
>>  kasan_report+0x117/0x150 mm/kasan/report.c:595
>>  check_region_inline mm/kasan/generic.c:-1 [inline]
>>  kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
>>  instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
>>  atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
>>  __refcount_sub_and_test include/linux/refcount.h:389 [inline]
>>  __refcount_dec_and_test include/linux/refcount.h:432 [inline]
>>  refcount_dec_and_test include/linux/refcount.h:450 [inline]
>>  kref_put include/linux/kref.h:64 [inline]
>>  usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
>>  dummy_timer+0xaac/0x4d50 drivers/usb/gadget/udc/dummy_hcd.c:2019
>>  __run_hrtimer kernel/time/hrtimer.c:2067 [inline]
>>  __hrtimer_run_queues+0x3eb/0xaf0 kernel/time/hrtimer.c:2124
>>  hrtimer_run_softirq+0x1e1/0x2e0 kernel/time/hrtimer.c:2141
>>  handle_softirqs+0x1da/0x6d0 kernel/softirq.c:645
>>  __do_softirq kernel/softirq.c:679 [inline]
>>  run_ktimerd+0x6a/0x100 kernel/softirq.c:1183
>>  smpboot_thread_fn+0x565/0xa70 kernel/smpboot.c:160
>>  kthread+0x38b/0x470 kernel/kthread.c:436
>>  ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
>>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>>  </TASK>
>
>[Adding sound people]
>
> So what happens here is that USB core continues to use a URB after
> completion to implement things like usb_kill_urb(), so URBs are
> reference counted. Then core decrements the count - one more use.
> 
> If a driver waits for completion or even usb_kill_urb() to return
> and then proceeds to free the URB's storage, this becomes a UAF.
> This driver embeds 2 URBs in its priv and does just that.
>
Given dummy_urb_dequeue(), the dequeued urb should be tagged not to
be handled again in the dummy_timer callback instead, just my $0.02
