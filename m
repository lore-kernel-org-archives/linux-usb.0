Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765033750D6
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 07:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419772; cv=none; b=gwEkqsl7P3WyZ9xZkUspE0pIEL34DxD1jviPxGvWbIsQM5yQHh/2IfbsdN28hMlRrNfnidbVqDBVQqmj6Ts7HNBs22jbsxPCy4J248mrIVcZrkRWyjA4CsdH0sZ/breqyGyETFLACgx8PBL57rKPn4HOohvMMZPeQtF/56QPRoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419772; c=relaxed/simple;
	bh=+Nz9SwIVAxefhRScA3TiebWy1dtXtofh8ayiRLZdBXs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t8N4eqCiatro3RdZtCHEHZn6StNZGj9BCYc3hEbE0HrGJQoKS1wS8qcn4Ud0GkUwe9fWAZqYELhFmzSFJa3D/wOtUW/AMWjwQ5Wwyleku3AUmzB1gGHceRk5gPQTvSpEj6feAZDohUXkRczL1uEr5bny4jeW3nG9sPEZhCPn3D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkLYv/i0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkLYv/i0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso20901275e9.3
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 00:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788419761; x=1789024561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PUem4kEIJhyKpMYsgry4Sm+2Sj01IOIz2KgU+h6K0Dg=;
        b=BkLYv/i0+jE2/OHTbSdIgOu7fwuvrbwtMbGojGem4Oq0SRAVvShDyoGuXJyjrsraGv
         We8eZZX673TGslBqGSVIc5sbfETWqKPA/wN6RPHWyzFScGmaCM4yI4RcH+u1wxQ3Ld9G
         CjVJgeZhzeydZuz5yDAzqO7/6SzGUbsf+drJ/8T0lLVz/huvqYBMZQ9naBGbUeX52kkj
         qVXvkBpwFJXeEeJg9fmTSjwjfmRycCV+iVj9G+06GE/XnINJ2YKmGAdqNgXhHSASeykK
         7p3N0n2sRIjSEWTgeRqb31cZQSfzAaWGsLQVGCwqKB8dshIvwbe7IGLqjdiy1Xhk7zJa
         WBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419761; x=1789024561;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUem4kEIJhyKpMYsgry4Sm+2Sj01IOIz2KgU+h6K0Dg=;
        b=bS3XaylfGw3cmt0bm1nTmOJ1bU96i1x4zXpBcvyYqXvWMOZUnCNGdUCozFwkU9A8N5
         FioqLgma7PypL4lNVivZ7ufB1ZQqflkpYeHsP5XsosPGZnj3jwyfYA5F3HjTdA55WMKr
         FGmAYVfNjHw9tbF8bLRf43xeiBAJxXep5l2NnUsN0LKlWDryrQtcTP6ZK1N9epXxFI95
         Iv023yn8vSdD0QiPOy+QthrlJdp9s2oZbnoATJ18iyqc/jTdUtaArj7/lB2rDwGx7Q7o
         hgvo5ndhAQaCNs4LARispauI9PRqafScnEgTgRtiOAjs0qX2BzXSU0xvFtjDXgmwFDVx
         dqiA==
X-Forwarded-Encrypted: i=1; AKwUvBx/k0+c2/4qnvK0Hl6o7XQGEEScFiPy6OEd4VXfTQy1/+WsB8v6kyfuB6QWzncH5y1lAHnLpbY8mJc=@vger.kernel.org
X-Gm-Message-State: AFuF++mGtki9n/27aQo0VJcUWPC2x5m48UGsze3w/4Mlpsm/sHkWq6Ck
	DOayc5f6qI9peopkgMAmiubhmNovb/GtY5CsVwbAnwi0dRWmSY2+YQbJ
X-Gm-Gg: AYBFou2tgQ/zXq3v+Z6CeU2NY62V2mvCoHCJvuVjNgSTnkOBHWBIqujNzguH0r9DN1Z
	C+CGRcv6T7gEafVlz03l86kCTfS6BXt7VqcpunIfElDJ795cD2pqOHW6voaW7QG9JctT99dIbv+
	lyBLZsG4QMgYBSPU8cKa2uBmyXB1GuSjjMwqm16XM1l8ilSamhspnmSUc2yNaPiWVqjkWz3GLwZ
	D3iXeUWRtDoSAdD7lvXpOaHxN2XIFaKH/15Y3MxKzPsrrbQRtr6yCVD79VOhBxo4+u889ISzyW7
	y6KD1+zM5ZWbVctV5ZR/TjmD1byqfwiEQavFpufCZQi90FctBSa5yV4GDsTWrnAhst7zz42PaE2
	j3YCowZ2A4grED8qN2qvyfiG5LBNQiQCr94zhK2CYzGcp2R2lyMcqgNMhs1JKHex+nJ20CIMbye
	10Na6rikb8bzEam5l+ot5EPU/9tBb7Q2mT0mg6LGwkOvHZTHnIG2dBRdESjJIheQ0L98oOHA==
X-Received: by 2002:a05:600c:3e0a:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49ce5810b5dmr220393395e9.3.1788419761018;
        Thu, 03 Sep 2026 00:16:01 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7febb4sm52930715e9.14.2026.09.03.00.16.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 03 Sep 2026 00:16:00 -0700 (PDT)
Date: Thu, 3 Sep 2026 09:15:56 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
 <robin.murphy@arm.com>, iommu@lists.linux.dev, Mathias Nyman
 <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [BUG v7.3-rc1] WARNING: mm/page_alloc.c:5340 at
 __alloc_frozen_pages_noprof
Message-ID: <20260903091556.751544ce.michal.pecio@gmail.com>
In-Reply-To: <20260902143351.7b6d5e0a@gandalf.local.home>
References: <20260902143351.7b6d5e0a@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Sep 2026 14:33:51 -0400, Steven Rostedt wrote:
> I'm triggering this warning on boot:
> 
> [   32.862044] ------------[ cut here ]------------
> [   32.864573] WARNING: mm/page_alloc.c:5340 at __alloc_frozen_pages_noprof+0xd81/0x30d0, CPU#3: swapper/0/1

Apparently that's a nonsense allocation size.

> [   32.881048] Modules linked in:
> [   32.883735] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.3.0-rc1-test #510 PREEMPT(full)
> [   32.890178] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.17.0-debian-1.17.0-1 04/01/2014

Hmm, I recall hearing about QEMU recently.

Could this be the "horrible splat" mentioned by 045b5bef916d ?

Find it in usb-linus branch at
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git

> [   32.898333] RIP: 0010:__alloc_frozen_pages_noprof (mm/page_alloc.c:5340 (discriminator 12) mm/page_alloc.c:5397 (discriminator 12))
> [   32.902745] Code: 89 44 24 0c 45 89 ee e8 ad f0 ff ff 44 8b 44 24 0c e9 96 f6 ff ff 80 3d 95 5b 9b 04 00 0f 85 7c f7 ff ff c6 05 88 5b 9b 04 01 <0f> 0b e9 6e f7 ff ff f3 90 8b 05 e0 b4 29 04 a8 01 75 f4 89 84 24
> All code
> ========
>    0:	89 44 24 0c          	mov    %eax,0xc(%rsp)
>    4:	45 89 ee             	mov    %r13d,%r14d
>    7:	e8 ad f0 ff ff       	call   0xfffffffffffff0b9
>    c:	44 8b 44 24 0c       	mov    0xc(%rsp),%r8d
>   11:	e9 96 f6 ff ff       	jmp    0xfffffffffffff6ac
>   16:	80 3d 95 5b 9b 04 00 	cmpb   $0x0,0x49b5b95(%rip)        # 0x49b5bb2
>   1d:	0f 85 7c f7 ff ff    	jne    0xfffffffffffff79f
>   23:	c6 05 88 5b 9b 04 01 	movb   $0x1,0x49b5b88(%rip)        # 0x49b5bb2
>   2a:*	0f 0b                	ud2		<-- trapping instruction
>   2c:	e9 6e f7 ff ff       	jmp    0xfffffffffffff79f
>   31:	f3 90                	pause
>   33:	8b 05 e0 b4 29 04    	mov    0x429b4e0(%rip),%eax        # 0x429b519
>   39:	a8 01                	test   $0x1,%al
>   3b:	75 f4                	jne    0x31
>   3d:	89                   	.byte 0x89
>   3e:	84                   	.byte 0x84
>   3f:	24                   	.byte 0x24
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	0f 0b                	ud2
>    2:	e9 6e f7 ff ff       	jmp    0xfffffffffffff775
>    7:	f3 90                	pause
>    9:	8b 05 e0 b4 29 04    	mov    0x429b4e0(%rip),%eax        # 0x429b4ef
>    f:	a8 01                	test   $0x1,%al
>   11:	75 f4                	jne    0x7
>   13:	89                   	.byte 0x89
>   14:	84                   	.byte 0x84
>   15:	24                   	.byte 0x24
> [   32.918421] RSP: 0000:ffff888100e66f90 EFLAGS: 00010246
> [   32.924467] RAX: 0000000000000000 RBX: 1ffff110201cce49 RCX: 1ffff110201cce0b
> [   32.937135] RDX: 0000000000000000 RSI: 0000000000000034 RDI: 0000000000000cc0
> [   32.948122] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000cc0
> [   32.960471] R10: 0000000000000034 R11: ffffffff85810cb8 R12: ffff8881044540d0
> [   32.971576] R13: 1ffffffff0b0004b R14: 0000000000000000 R15: ffffffffffffffff
> [   32.982619] FS:  0000000000000000(0000) GS:ffff8882b4542000(0000) knlGS:0000000000000000
> [   32.996996] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   33.005932] CR2: 0000000000000000 CR3: 00000000060ec001 CR4: 0000000000172ef0
> [   33.016941] Call Trace:
> [   33.022138]  <TASK>
> [   33.024508]  ? __lock_acquire (kernel/locking/lockdep.c:4690 kernel/locking/lockdep.c:5208)
> [   33.028510]  ? kernel_init_freeable (init/main.c:1419 (discriminator 1) init/main.c:1435 (discriminator 1) init/main.c:1455 (discriminator 1) init/main.c:1670 (discriminator 1))
> [   33.032827] ata1: SATA link down (SStatus 0 SControl 300)
> [   33.033110]  ? __pfx_stack_trace_consume_entry (usercopy_64.c:?)
> [   33.041995]  ? __pfx___alloc_frozen_pages_noprof (mm/page_alloc.c:4022)
> [   33.047459]  ? rcu_is_watching (include/linux/context_tracking.h:128 (discriminator 1) kernel/rcu/tree.c:753 (discriminator 1))
> [   33.051447] ata3: SATA link down (SStatus 0 SControl 300)
> [   33.056403] ata4: SATA link down (SStatus 0 SControl 300)
> [   33.061341]  ? trace_preempt_on (include/trace/events/preemptirq.h:53 (discriminator 30) kernel/trace/trace_preemptirq.c:120 (discriminator 30))
> [   33.061735] ata5: SATA link down (SStatus 0 SControl 300)
> [   33.069156] ata2: SATA link down (SStatus 0 SControl 300)
> [   33.073741] ata6: SATA link down (SStatus 0 SControl 300)
> [   33.079200]  ? preempt_count_sub (kernel/sched/core.c:6012 (discriminator 2) kernel/sched/core.c:6009 (discriminator 2) kernel/sched/core.c:6034 (discriminator 2))
> [   33.085087]  ? _raw_spin_unlock_irqrestore (include/linux/spinlock_api_smp.h:211 kernel/locking/spinlock.c:221)
> [   33.089973]  ? stack_depot_save_flags (lib/stackdepot.c:728)
> [   33.094674]  ? kasan_save_stack (mm/kasan/common.c:57)
> [   33.098664]  ? kasan_save_track (mm/kasan/common.c:78)
> [   33.102720]  ? __kasan_kmalloc (mm/kasan/common.c:398 mm/kasan/common.c:415)
> [   33.106722]  ? __kmalloc_cache_node_noprof (include/linux/kasan.h:263 mm/slub.c:5582)
> [   33.113247]  ? xhci_ring_alloc (include/linux/slab.h:1196 drivers/usb/host/xhci-mem.c:379)
> [   33.117224]  ? xhci_alloc_interrupter (drivers/usb/host/xhci-mem.c:2311)

This trace does look like that, or something related.

Regards,
Michal
