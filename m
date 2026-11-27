Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787464;
	b=HR4vGpNS1hxvx0wcw0CqUhpGYwfgX2GLnM5RKS2Wlce8bJa+ebqo10wytf8wo8OFoeS1
	 lXhco1PhXaOAijg6ArMrT4F52dkgSnB28FVwqPS08PAbkUXQbPthNEve9NIO2D5iTVek4
	 WkA5cq8o+gf3xmGocf452IWWTJY9xuMBXHw7Tgr+GMku11H+UIusGFC8qlfIUYKFebGaJ
	 17H2moinbnHDKbxayC3lf9IX38+7Xk+/PCzWRA+F+A1+l6K4AePkcJz0MPjO/ML1Y4Ghe
	 9i0UYSg/jRFfBzyHtttUmHzrS03z14jDufQke7MfhRWUzdUxzsoIF0b3UX6QbhYlLdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787464;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=03eCvW9+ev8ENDXQ4CtomVxcDuhsagb1O/n46GPJxcg=;
	b=jb4zYkbd/EvLZQs1EqsA4ODXI2Mif6JmrEMIsJntdk7PtBgMsXO5r7rUD2/p6YRgKD9N
	 GqqzzU4+NUyprTy/e/HaNC2RA4wa/f+g2B/fRYyU/boYmqoNtQKvUM+/eLxSYhorRUw0H
	 aCYl6rSGf4ZL6F2Joscg3MkzrTVTDu5lzOnb+ZM9vMhEjwW5nNyNk5HZPuJy4ZFTwddrv
	 nujr1MvdyCKoitrGaTfEVqkprNr3VDrtd+Bq7nN32MJZmQBXHLST5sg0eyMFfs7r5F8ZS
	 mdQOBpxCUQTQEynNVV+hfjnjID9VQcdmZE39SboZMvw5/OOBAGSrCIG60jLckhADZgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eRobhHZL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA67606A31C;
	Fri, 27 Nov 2026 13:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eRobhHZL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E85F1F00893;
	Fri, 27 Nov 2026 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795787464;
	bh=03eCvW9+ev8ENDXQ4CtomVxcDuhsagb1O/n46GPJxcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eRobhHZLb/n5hc6ahmnD1+ge4LAo2mpMAnfPZ86edwhZfYUgDv2HviO8jrWU3VyvN
	 M47dGQzDW4HPBlyqgGmt3d8zCrLx9+huwdiDqsko4KrCT0VgnFCDr3LzD/pfc5LRJo
	 uKuaQDctFJgv5gbyC4aK5F9ZVHQQs34b6CJDeUEMDBPbf1GazC+FsLNcQV/T9GVgYO
	 W1tGg//XWYmZpZWe8Zoz6aLB7VqZJ1nOjwjSez3GP1SMY4k5Dedc7znWSenYPYP7HS
	 ucatlGJ+WkFpAtLzInXMWhRSb/Rxg7QbYmDXOPCSsz8goSps42MU9B7lJ30pYZEM96
	 cExgxKb48yWAQ==
Received: from johan by xi.lan with local (Exim 4.100.2)
	(envelope-from <johan@kernel.org>)
	id 1xWwLt-00000002Cdv-2rcV;
	Fri, 27 Nov 2026 14:51:01 +0100
Date: Fri, 27 Nov 2026 14:51:01 +0100
From: Johan Hovold <johan@kernel.org>
To: Rondreis <linhaoguo86@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: KASAN: use-after-free Write in keyspan_close
Message-ID: <awmKxTowTqXjPr_D@hovoldconsulting.com>
References: <CAB7eexKhQeqgpMaZoT=JD2EMwn=qTw4sWzF7hdU9XDFVsz3ooA@mail.gmail.com>
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
In-Reply-To: <CAB7eexKhQeqgpMaZoT=JD2EMwn=qTw4sWzF7hdU9XDFVsz3ooA@mail.gmail.com>

On Tue, Sep 20, 2022 at 10:47:37PM +0800, Rondreis wrote:

> When fuzzing the Linux kernel driver v6.0-rc6, the following crash was
> triggered.
> 
> HEAD commit: 521a547ced6477c54b4b0cc206000406c221b4d6
> git tree: upstream
> 
> kernel config: https://pastebin.com/raw/hekxU61F
> console output: https://pastebin.com/raw/gvADdA0t
> 
> Sorry for failing to extract the reproducer. But on other versions of
> Linux, I also triggered this crash.
> 
> I would appreciate it if you have any idea how to solve this bug.
> 
> The crash report is as follows:
> ==================================================================
> BUG: KASAN: use-after-free in keyspan_close+0x240/0x260
> drivers/usb/serial/keyspan.c:1589
> Write of size 4 at addr ffff88805a1e7104 by task syz-executor.5/27414
> 
> CPU: 1 PID: 27414 Comm: syz-executor.5 Not tainted 6.0.0-rc4+ #20
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> 1.13.0-1ubuntu1.1 04/01/2014
> Call Trace:
> <TASK>
> __dump_stack lib/dump_stack.c:88 [inline]
> dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
> print_address_description mm/kasan/report.c:317 [inline]
> print_report.cold+0xe5/0x66d mm/kasan/report.c:433
> kasan_report+0x8a/0x1b0 mm/kasan/report.c:495
> keyspan_close+0x240/0x260 drivers/usb/serial/keyspan.c:1589
> serial_port_shutdown+0x89/0x110 drivers/usb/serial/usb-serial.c:309
> tty_port_shutdown+0x1ec/0x270 drivers/tty/tty_port.c:379
> tty_port_hangup+0x103/0x170 drivers/tty/tty_port.c:407
> __tty_hangup.part.0+0x65b/0x770 drivers/tty/tty_io.c:660
> __tty_hangup drivers/tty/tty_io.c:592 [inline]
> tty_vhangup drivers/tty/tty_io.c:707 [inline]
> tty_ioctl+0x956/0x1430 drivers/tty/tty_io.c:2718

I apparently still had this report in my queue.

syzbot also reported this a few months back and it has now been fixed
by:

	b48820de8c1a ("tty: port: fix tty_port_tty_vhangup() race")

Johan
