Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF21B331EB7;
	Thu,  6 Aug 2026 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024524; cv=none; b=RGkKsZPn84tfwPUB0Inuo9xiWTB6bIWrDHOx6i1ECUtufd0M0m9W8lCeMAZuG3jiSmhMkBFxoKoYGCAXo4OEXXKSnYvYcjx9CuIyxwkVnx6AdmZxVEvGNP7YAf7xqg0Db0K5uwM7VgmcSpVULsTFC/XR6ZN/mNCH6FXUSbxzyBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024524; c=relaxed/simple;
	bh=6Rqrtyq/EyRlzaeJKl/RyZeVB2GdC05tNn3OVzdBEAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PF1q0WIxq+zA0PRwdGfYJflT1tO4HvgpPWmSQ3O0qi6eJcQFT8cEy1EKBIlIbPW3+Tq4avUTOf1/Ualkw8+g2MmSd7uNaHaVIzj09u8Iufjum4Kc580gcFckPpFk8uTN8+1QeKKliRU7t72/AtfGsooE71bw2zXW5lLFBgPmQHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENqCf0Sj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENqCf0Sj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38061F000E9;
	Thu,  6 Aug 2026 13:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786024522;
	bh=4iEm4LhrXw5VLs2LLD/czi1LJ1PKdrv8Fyos3lhy6e4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ENqCf0SjbmzdPb/c8BXIC42PBs6kI+hIQDXKedri3N7Q6agC87bkkZk5B3YLu27I/
	 Rl5FOqwKr33VF2u/Ke6WOTfWoEbMsA4qkcmZglenyfyksAGT5AUwgxhQkvRyvCUJ2p
	 F3A1Sr7IqUxGId9R6Pl/q09dGS4okray2yeYBwJYt1pxlgMcl+r9YT4wql5W4p0ngb
	 jW6ok4b80xmSEwCBR+7PJrMROgxm3DOklB4EAWxWZyUqQJd/6TzdrzRc7R2T0ncW9z
	 Yy3NjMMIQRD27I34Jm9CzGUfsVp7zrthQz7DYSgI1My8X1ukoz0FXnsmB1bLFD0tYC
	 XR3WU1ntqOCng==
Received: from johan by theta with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1wryZ6-00000000Xln-0Xyj;
	Thu, 06 Aug 2026 15:55:20 +0200
Date: Thu, 6 Aug 2026 15:55:20 +0200
From: Johan Hovold <johan@kernel.org>
To: syzbot <syzbot+3b514b87202742f22c44@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] WARNING in spcp8x5_get_msr
Message-ID: <anSSSMPyY4TsdD0k@hovoldconsulting.com>
References: <6a73cea2.01d0871a.3a0d52.000d.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a73cea2.01d0871a.3a0d52.000d.GAE@google.com>

On Wed, Aug 05, 2026 at 05:00:34PM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=17602cc6580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
> dashboard link: https://syzkaller.appspot.com/bug?extid=3b514b87202742f22c44
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12193e32580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1224e3b9580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-848acc8f.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/6fb497cc0c8d/vmlinux-848acc8f.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/663ccee34982/bzImage-848acc8f.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+3b514b87202742f22c44@syzkaller.appspotmail.com
> 
> SPCP8x5 ttyUSB0: failed to set control lines: -32
> ------------[ cut here ]------------
> do not call blocking ops when !TASK_RUNNING; state=1 set at [<ffffffff81e258b8>] prepare_to_wait+0x98/0x380 kernel/sched/wait.c:256
> WARNING: kernel/sched/core.c:9120 at __might_sleep+0x94/0xc0 kernel/sched/core.c:9120, CPU#0: syz.0.17/5924
> Modules linked in:
> CPU: 0 UID: 0 PID: 5924 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> RIP: 0010:__might_sleep+0x97/0xc0 kernel/sched/core.c:9120
> Code: 8b 94 24 70 18 00 00 48 85 d2 75 14 48 83 c4 08 89 ee 48 89 df 31 d2 5b 5d 41 5c e9 33 fc ff ff 48 8d 3d 0c 27 50 0f 48 89 d1 <67> 48 0f b9 3a eb db e8 9d 3a a5 00 eb 9f 89 74 24 04 e8 c2 3a a5
> RSP: 0018:ffffc90003a27558 EFLAGS: 00010286
> RAX: dffffc0000000000 RBX: ffffffff8e193c49 RCX: ffffffff81e258b8
> RDX: ffffffff81e258b8 RSI: 0000000000000001 RDI: ffffffff9125db30
> RBP: 0000000000000143 R08: 0000000000000001 R09: 000000000000015a
> R10: 0000000000000200 R11: 0000000000000000 R12: ffff8880255fa540
> R13: 0000000000000001 R14: ffffffff87b453a0 R15: dffffc0000000000
> FS:  00007fcdef59c6c0(0000) GS:ffff8880d5dd8000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fcdeddfed58 CR3: 000000002b0b3000 CR4: 0000000000352ef0
> Call Trace:
>  <TASK>
>  might_alloc include/linux/sched/mm.h:323 [inline]
>  slab_pre_alloc_hook mm/slub.c:4537 [inline]
>  slab_alloc_node mm/slub.c:4897 [inline]
>  __kmalloc_cache_noprof+0x3fd/0x6c0 mm/slub.c:5485
>  _kmalloc_noprof include/linux/slab.h:988 [inline]
>  _kzalloc_noprof include/linux/slab.h:1309 [inline]
>  spcp8x5_get_msr+0xe9/0x2d0 drivers/usb/serial/spcp8x5.c:197
>  spcp8x5_carrier_raised+0x75/0xe0 drivers/usb/serial/spcp8x5.c:243
>  serial_port_carrier_raised+0x8f/0xd0 drivers/usb/serial/usb-serial.c:757
>  tty_port_carrier_raised drivers/tty/tty_port.c:441 [inline]
>  tty_port_block_til_ready+0x43f/0x910 drivers/tty/tty_port.c:559
>  tty_port_open+0x19c/0x1f0 drivers/tty/tty_port.c:775
>  tty_open+0x3dd/0xfa0 drivers/tty/tty_io.c:2137

Just sent a fix here:

	https://lore.kernel.org/all/20260806135248.129482-1-johan@kernel.org/

Johan
