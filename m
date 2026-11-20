Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.181.215.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198013;
	b=hrwN6Vq1ptoZynoaeT+8qtXJNyO0XFTLrN+ojQ+pKG4AsXf51oaI9EjmOwud4pL7RDbx
	 1FoOctbCl4YbFGdkzKHakPlEhV3FiNjkfeAj21jtJTxXjZuSQsvyONebd4aGJq8taDzY0
	 UXbCaSgjDQ83HNELFYMxWvTPQv7dDkE+2GydNRaenY0M8HSQ7NYD5vS4VKSjjPoW4qyZP
	 s0OCgknj6Q5YvRCYK8vOg8vBWnUWnDcMk++1QdrZU0HJqX7TmJyq4cWR0SfRzuN3D3vpm
	 OgXPIcVaukRmhyKzVM+Sk6omqaMSCSjzLMi3ZXVRJVxndnwh+Eq5y9m+oKyfXX9Yoow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198013;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:X-My-GPG-KeyId:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=FPfKxTO3S+AD9QnBki7tyZ+tu2Ltdaqyw8pitRf7mzs=;
	b=VqWi/AoYdUN4pl/wrQlqvkJINe9rSHvx9EiP5Tb06O/aM5zOdhTzIsFgrFmesy4rlcgB
	 fHp4pUNDJYS9qaA08jKL6SegSsluKbi3lkNmmMe3UaAEx8PTpeTz81g8rETbmjJZLVw+w
	 3Vj3aEc9l7FIrCM0wH/yMlz+9S23X4DyMKnvskQ8zcD7nEEGWTHJJXlnQBR+W2JRr50s+
	 fI1C6cJ2xsb3o/H9RZ+Ogvx9/LC/2KoI35kM4n30sLzxMMI7dMXL5ig0Sev+GpM52iRXC
	 +NOlt1/MCaOVktg0WEiQ9gTuUGp7hyktZKblgMupHlqhgf8tDl57J2VDQTqXsY17cTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xff.cz;
	spf=pass smtp.mailfrom=xff.cz;
	dkim=pass header.d=xff.cz header.i=@xff.cz header.a=rsa-sha256 header.s=mail header.b=nll96AWS;
	arc=none smtp.remote-ip=195.181.215.36
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E846F606B123;
	Fri, 20 Nov 2026 18:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E846F606B123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xff.cz header.i=@xff.cz header.a=rsa-sha256 header.s=mail header.b=nll96AWS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1795198000; bh=MA55jACLXy9a3dSLzGxhQ21DV7C7AhbWi2XPW6EayrE=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=nll96AWSpqeSJ5hdMJBLpvGDRaGHnSCSP5uzenmqQLqpAMec43yl7r4KrZf536u1Z
	 +GbOMVMQuSJHrfFuGQmQyd8U9DsCLZ1o4k2llGqrbkg+ttSqcAFXkCxuwacK8HRJ6r
	 sRfyQYazXcCPvOKFBY9h+CdjakJLg81mbIo7w7Pc=
Date: Fri, 20 Nov 2026 19:06:40 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Al Viro <viro@zeniv.linux.org.uk>, Sam Day <me@samcday.com>, 
	Michael Bommarito <michael.bommarito@gmail.com>, fanggeng <fanggeng@lixiang.com>, 
	Mateusz Guzik <mjguzik@gmail.com>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] usb: gadget: f_fs: Init reset_work at alloc to avoid
 kill_sb WARN
Message-ID: <kac37o5sqtenrtsqafzc4vezhpkiyiglkh4gtp6z4yjbmnuepg@xnhuahcba3to>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Al Viro <viro@zeniv.linux.org.uk>, Sam Day <me@samcday.com>, 
	Michael Bommarito <michael.bommarito@gmail.com>, fanggeng <fanggeng@lixiang.com>, 
	Mateusz Guzik <mjguzik@gmail.com>, Kees Cook <kees@kernel.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20260725120838.2263579-1-megi@xff.cz>
 <2026112025-linguist-refusing-439b@gregkh>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026112025-linguist-refusing-439b@gregkh>

On Fri, Nov 20, 2026 at 11:21:57AM +0100, Greg Kroah-Hartman wrote:
> On Sat, Jul 25, 2026 at 02:08:34PM +0200, Ondřej Jirman wrote:
> > From: Ondrej Jirman <megi@xff.cz>
> > 
> > ffs_data is zero-allocated and reset_work is only INIT_WORK'd on the
> > FFS_DEACTIVATED path in set_alt/disable, which the normal flow never
> > takes. ffs_fs_kill_sb() then cancel_work_sync()s it unconditionally,
> > tripping the WARN_ON(!work->func) in __flush_work() with a NULL func.
> 
> How does that happen?  What triggers it?

Well it's a few months. :) IIRC it's triggered by using multiple f_fs
gadget instances at once. What I was working on at the time is having
adbd and secure card gadget impelemnted and running at the same time.

Too late to find any traces and more detailed information now.

Anyway, looking at what's left after rebase of this patch on top of 7.3, someone
else must have fixed the same issue already. This is how this commit looks like
now:


commit 947aaf37e3f4b9af8a694297cc08c71edbbca2b5
Author: Ondrej Jirman <megi@xff.cz>
Date:   Sun Jul 19 14:57:16 2026 +0200

    usb: gadget: f_fs: Init reset_work at alloc to avoid kill_sb WARN

    ffs_data is zero-allocated and reset_work is only INIT_WORK'd on the
    FFS_DEACTIVATED path in set_alt/disable, which the normal flow never
    takes. ffs_fs_kill_sb() then cancel_work_sync()s it unconditionally,
    tripping the WARN_ON(!work->func) in __flush_work() with a NULL func.

    Initialize reset_work once in ffs_data_new() and drop the redundant
    lazy INIT_WORK calls.

    Signed-off-by: Ondrej Jirman <megi@xff.cz>

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c64a268e98a4..972f424ad252 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -54,6 +54,9 @@ MODULE_IMPORT_NS("DMA_BUF");
 /* Reference counter handling */
 static void ffs_data_get(struct ffs_data *ffs);
 static void ffs_data_put(struct ffs_data *ffs);
+
+static void ffs_reset_work(struct work_struct *work);
+
 /* Creates new ffs_data object. */
 static struct ffs_data *__must_check ffs_data_new(const char *dev_name)
        __attribute__((malloc));
@@ -2291,6 +2294,8 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
        init_completion(&ffs->ep0req_completion);
        INIT_WORK(&ffs->reset_work, ffs_reset_work);

+       INIT_WORK(&ffs->reset_work, ffs_reset_work);
+
        /* XXX REVISIT need to update it in some places, or do we? */
        ffs->ev.can_stall = 1;


So I think you can ignore it.

Best regards,
	o.

> > 
> > Initialize reset_work once in ffs_data_new() and drop the redundant
> > lazy INIT_WORK calls.
> > 
> > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> 
> No fixes tag?  No cc: stable?
> 
> What found this issue?  How was it tested?
> 
> thanks,
> 
> greg k-h
