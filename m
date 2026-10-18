Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78F24D4873
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 16:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341031; cv=none; b=JtjiZJH7ud4j7OeKkVfy3ioIQUmwG6/i/31u8e8vMyGSn+QXBiQer8tWyVSJ0h5HmD9C7WAEKIyAiVrdbYvx7sAhdjVLZhaccIqoK4311ml21HOjEmueSqZnkByLxQGwWoKNF5Vlxwbv8i5wA+zpUT+Cf9c2uPWTEDH4STVfb08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341031; c=relaxed/simple;
	bh=WJI+el3RNaVXsf97bEgHm2gpuVfvG9vmIT3l8YoGryw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrMaAmz0BorDHWTsqPmIND8P60pLczz4yTnIiqtEyLjHSArn3X+grM4LsMaDl8HWZAYbOfte95kO/3q6DAzWqwsq2/gKrMFGD6ksccA6O6l68dXw+UDe7upkhh+msjMjwQKUUvHoupzRXf4nav2eqVYKBI/sISOfS+eMzJ3z3B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=eoxkb4n1; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="eoxkb4n1"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91befe703c4so4506056d6.1
        for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 09:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792341029; x=1792945829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lpc/HjPXQ1o6Bmo1wBPk17GA4f7HWx9cPObbqCwHu80=;
        b=eoxkb4n1exz72LI7u/5lUhOyozvvPvkNwXvDcmUnIDCSn8KEEvaC2qsEfJpLuXJmhD
         qhpYDG4nhtTtKg7gULOuT1gL/k9uO0C2G4qv95Q9MZTjXxkywhcQqp5mJWWlIccaSiaO
         9WWmBV/KUXc2WeD6VnvVezla7IR2CgUUBwvpjKO0qWkVFgFvO9jiQJndDgvLZ3iz4e8Z
         5mP7G5m/Xbbx+4+GzxSHLXfqepAK/QqcJbd4VFKzopqiHDANb1a/VC2YhJADuxzvqpO/
         34UIROzv2e6tvGRQJOL3qAoF9Sy17NAorFqHCYO4nmIQhjvgQlgWUZB8rYL/YtxbXt8u
         CFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341029; x=1792945829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lpc/HjPXQ1o6Bmo1wBPk17GA4f7HWx9cPObbqCwHu80=;
        b=0Al1ZizKMHkhjJe8A8pzif3pSny0FK3xYOkg94XQ+LxbU4xynKNWe2qQUNxleXHs7I
         gBhfDCMCyMDJawWXakBBYolahlDPtbYN/+Ce7QU5Yz1mvg2CtpggzGEOAsT0qGwZEkIQ
         UTh3TkH0fLE3GEpesPILp6wtOIG0jmIsOLR3Ojc7aGVcdt1P4tz1EO9yq+yJJYt3RTtb
         bDhXvR4HnsSKJZz6Jyyjn1gzf6GVbT8TmKJZn3byreT9yL3VB/+5U+woPtCF59FD1VTy
         sC7w5CHmYfdw73Y4QbfNzeZQ1MRV0pVu0zW3cMk8UbQ15eKk/gYyjY9cm3yqhIMVT9Rt
         t0Rg==
X-Forwarded-Encrypted: i=1; AKwUvBx7JllUOVNV48hxo6aoSJeVrdJEx5HtZxHRgXQEatkhP2JEu1sYvAfUHuMVFUWpyTfR3LafQTUY0yU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqN/VoxyD7n3kj+hWHiCQvmo0xCAdfyzi36W17HHwa8koJYEc1
	P/+ha6/J8hYorM4mKsM4GSzmcHduSlDLFc2ucFSAq5C/PWvWYxXv857eEgQMWp6GiTRRCVI639Y
	mdTVd8A==
X-Gm-Gg: AYBFou2K/PXXnoxJfRrFL8ujiCDKU2+9ZJ/znk+FzYjwNm0spKfhyNVQeZd7PA4iPwa
	o099j0qBX6pBECP+hVtB7SE8LnOnF1P4RyBAN5yCTdP6UkEREmA7cipcpRnc1P5ickn8WAFEBry
	hIEA47fBr0VX41I82Dzoi2BvcRrGtaK0iX7+0O9rz4V9aPvDP2copZWufiPFJfgHKUYKQvCcSCw
	Zvrhm7Bn5vigT3RqzP8aBF5kQIFMXcDWcTl677zwuYNQ2XZ1mDL09Q6rV5GkagluoEb017FgP7p
	dVlbQUbClXCmcHH/htulL08CLkrOt4NLFj7WCqhtZxR73A6+CjhjrbsNdCffIrj+XXU15CoeWEy
	+glXac0728EzqxTWWpLDdTrG7ZKP3PTxjNj7PMisK0EZr3erEVeEuoUn4Y+MbtEMJZajx8HLS7s
	2XcerwtmHCDTkhKQsRUP/vTgEsIkpUNq9MfSY5iCC7u9fuNVoviKuo3XZaBC5TfrGK2DFbVAQ=
X-Received: by 2002:a05:6214:f0f:b0:914:4511:9273 with SMTP id 6a1803df08f44-91bdf16380amr97674406d6.31.1792341028356;
        Sun, 18 Oct 2026 09:30:28 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbaae645sm76275706d6.21.2026.10.18.09.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:30:27 -0700 (PDT)
Date: Sun, 18 Oct 2026 12:30:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+ed3ada41c4eb1c4ab78e@syzkaller.appspotmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-i2c@vger.kernel.org
Subject: Re: [syzbot] [usb?] WARNING in ec168_ctrl_msg/usb_submit_urb
Message-ID: <0a758fb7-6c71-4e59-a9df-0d2a71649f1e@rowland.harvard.edu>
References: <6ad4f154.a6d1a155.34a93f.00b5.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ad4f154.a6d1a155.34a93f.00b5.GAE@google.com>

On Sun, Oct 18, 2026 at 09:18:28AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    4056b3c9d3c9 Merge tag 'nios2_update_for_v7.4' of git://gi..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=11370ce1580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7d1b274ca9837366
> dashboard link: https://syzkaller.appspot.com/bug?extid=ed3ada41c4eb1c4ab78e
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=114faaea580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=154faaea580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-4056b3c9.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/811a43c89106/vmlinux-4056b3c9.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/2bb4f3abea76/bzImage-4056b3c9.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+ed3ada41c4eb1c4ab78e@syzkaller.appspotmail.com

This looks like another example of a 0-length I2C-over-USB read.  It 
would be nice if we could rule out these things at all at once, instead 
of going after them piecemeal.

Alternatively, this WARN() in the USB core could be reduced to something 
less severe in the case of length-0 control reads.  We haven't been 
seeing very many instances of it apart from I2C, and those have only 
occurred during fuzzing.

Alan Stern

> ------------[ cut here ]------------
> usb 5-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
> WARNING: drivers/usb/core/urb.c:413 at usb_submit_urb+0x1057/0x18b0 drivers/usb/core/urb.c:411, CPU#0: syz.0.17/5521
> Modules linked in:
> CPU: 0 UID: 0 PID: 5521 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> RIP: 0010:usb_submit_urb+0x1100/0x18b0 drivers/usb/core/urb.c:411
> Code: b8 00 00 00 00 00 fc ff df 41 0f b6 04 04 84 c0 0f 85 b2 05 00 00 45 0f b6 45 00 48 8b 3c 24 48 8b 74 24 18 4c 89 f2 44 89 f9 <67> 48 0f b9 3a 48 bd 00 00 00 00 00 fc ff df e9 ba f2 ff ff 44 89
> RSP: 0000:ffffc9000228f8d8 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff888044085800 RCX: 0000000080000280
> RDX: ffff88801317fa20 RSI: ffffffff8cc57b40 RDI: ffffffff91885110
> RBP: dffffc0000000000 R08: 00000000000000c0 R09: 0000000000000000
> R10: ffffc9000228f9c0 R11: fffff52000451f44 R12: 1ffff11003c397d4
> R13: ffff88801e1cbea0 R14: ffff88801317fa20 R15: 0000000080000280
> FS:  0000555560660500(0000) GS:ffff88808b0b4000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f1c3f68e000 CR3: 00000000440b1000 CR4: 0000000000352ef0
> Call Trace:
>  <TASK>
>  usb_start_wait_urb+0x13f/0x5b0 drivers/usb/core/message.c:62
>  usb_internal_control_msg drivers/usb/core/message.c:117 [inline]
>  usb_control_msg+0x234/0x3e0 drivers/usb/core/message.c:167
>  ec168_ctrl_msg+0x308/0x7c0 drivers/media/usb/dvb-usb-v2/ec168.c:73
>  ec168_i2c_xfer+0x10e/0x630 drivers/media/usb/dvb-usb-v2/ec168.c:127
>  __i2c_transfer+0x7bf/0x1fe0 drivers/i2c/i2c-core-base.c:-1
>  i2c_transfer+0x1cb/0x2d0 drivers/i2c/i2c-core-base.c:2350
>  i2cdev_ioctl_rdwr+0x460/0x740 drivers/i2c/i2c-dev.c:306
>  i2cdev_ioctl+0x6a5/0x880 drivers/i2c/i2c-dev.c:467
>  vfs_ioctl fs/ioctl.c:51 [inline]
