Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C2851DDED
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 16:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910117; cv=pass; b=ueFzJ04SGHOtFjtq/r+2cqQ8nn0iV9KP2C3//iBcHrz07+geAN7i1LEhG0lqG17G9zVcFwc38tZ0bGYi+KeGyDPNBtDs0lhki5neg6qKNwWnDwrWblAjDTtEUI2Y7pPrMCBb01e66c5aOWF77lfWDupRK0YJy9n6/Bd3wdhwcJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910117; c=relaxed/simple;
	bh=oNTVqVeErgSHUZj7WSVylb4NA02UV267PrLj1Ev9+JA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukRpKrbixjtK2USH5flj5HBA+g5CK6LoGN5F7LoMLGohk2/XTxm4EryVsBKm2DZRmB7PEdXsMhID2kQcM89FhKXtvPJFOGIBhlvdUYbqmmhQQoqAMjRdRW+YjtCnOADHpy4nyoVpV4KmDUI0SZNgqkF20a9PkvIHHan183LqM6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SoX6Uq/n; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SoX6Uq/n"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so22515e87.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 09:48:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791910113; cv=none;
        d=google.com; s=arc-20260327;
        b=F6DSSQ/n+2ipexoWhBJfOjXG50w94HUFmCYl+R3w9itSC/PwmsQpsyhFYgnK6g5mOC
         tWJ1JDfQWomsVfl6WbxxvhrQyStiW6oNPJZCqQtw8iTH+WZxvhA7hFj4v3xcENGbAfwe
         OCnfpIt8UmE0LB0xSCFtPSeQwmHKdBtkZ5n8JFoX6U9XPBqp6RBkbiP0zB86GYx8CKP9
         iLL4ZC2QR6k7SHbmFxrdP6AQSeX91dUQW2t/0JmhXSINW5s1z21grmxPWnuWm7mN5y/e
         HBE9aXSqcShzDvY6dafJKW/XSKfXS0x/0uf5i3QPVwqC+JSJc0ILB0clegoDemKqcXwt
         bMLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Srdy0h2xVrgJc+qNyo08IpLYsropKiqDQUfCZ0IZtLs=;
        fh=+LNrkieYa12G7ERmU3LNBaS0yFjQDPVKKIEx2I4RKoc=;
        b=aRA7kUl0Gz1U7WEJV/xciCLWWBM8YcBjdDTsVN1YG3CUHFaj8RsclneNE0TaPybspo
         ignL23ZkHP8U4LkaE+qd133SX2r1+2ijbKEOh3zQKxOhRbyPTmdjaKpXdvd9xT8vemtc
         mKMqL8g1mEs1+okbNR9B0ks0F97m29npB3NJOraNhC24ikAJd1/WkkgAvqSqWzZmrTdf
         wnKxo/AqPTn3DTdKuV0HgGkzJ4AfrFkHyWydVH2TjbYoWHbZ73yrsABa8we2kz8DTFBd
         uYMsvs44KtoAovQVIPgJJR9IeLeecrLagmpVo0mqbsVSUAikSlMSx+dH69AL7akxozKq
         07vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791910113; x=1792514913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Srdy0h2xVrgJc+qNyo08IpLYsropKiqDQUfCZ0IZtLs=;
        b=SoX6Uq/n1FNhma9qtPeekrjzVla8vSVsrhNziO9Qtbu/p1YHiCL4uf7mVk5EUU8qNE
         aDlftxZdWlOTZ4DD7knj2bKd4jk6UuCRSXs85hjCedWzKVBIspsHbqFCMEtRKu2XfwYA
         TEXHlXqBZ8HRVGqLrSH5oKvxBAKCEoovGWFu2RBePLxhTgzn3Uj4JlMN/GMwaU6D/RUn
         /lq/5NAK55C8trAnmPsOpSrQHSid+uTw3zfager8dJbu/KIp4IX+ZSbYO5/v8Kx+6tE2
         vr+4QuPFgZow79Eoo7Gy9/GaxFO7mcZ1h89n8n+WazM8frkcP7vH7HP+pypb7QdNuTeV
         bO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910113; x=1792514913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Srdy0h2xVrgJc+qNyo08IpLYsropKiqDQUfCZ0IZtLs=;
        b=L9b8ct59F3gOs/sOUeB9MiVBrv7Au8Nz0VEAmk/iThxvzN2pClAOqBg7GYVLSNtTm3
         yg5AGVAjcxjxGnAociFTJ/cx/5gL1FttgRgdKz+3aTqsT+EPO7xW6AjJMdWjdDEmdLfq
         N+vf8e01TfjrpI2c3FmEv/kpX9YlZp9lkuUyA3mUGH/z6Lg2T8tASlDx1BW1fkCMvIs8
         7N3fnykX0Ceoc8t3VZEUG6O8cbTSb08ENDNqWAxD7Us7s/+Ee+r5XulpSFRnHmmtUcnb
         N/AA41zGqBfWCb4hLs4sNEkxtIHAD4io61bpvFj/+AEMXSHFlnsEIRL5tZc5hoPz62my
         N90g==
X-Forwarded-Encrypted: i=1; AKwUvBx5MmhAolHkPyscjMc7waBbc5DMrS1HSm7agRamEXGqg7/dF6RXvzk43oPWOEApxj5/LyGS0zK6JxY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzrWpcvL6Z3S4ojm87z5qfCTl8buHKF60Vx9m87wjprS+PDxA1
	S1ZIgCVfg3/RjKM/iSXEhfDSnSV4tjFPz/5LwZ0+WOInOsCg07GznJFAAK1KCW/lRKf7scmbWM8
	MmMLvy+krFj17J4F3njuHRX8H759aAM8EehduXNRj
X-Gm-Gg: AYBFou1LQ1k9xv3i/IKbzQ3e0jBbDdZeJUQy3nXVUeizlTzCIvc5CHlOfPCjUtgAbTp
	oFJO/BKt66lO3GqCiWbTy9Zw5P4+iWh2Z3aJHOCB6sOIwhgwyagY8Njxxm0jFjls9FMC7r3tWcc
	v3cIHeaEkZrH7pZ0L4TB0TPX3hBWZfrfQC+oCV7D23eO786jaC4WQSmRhA3XJDCb0fLVc5k4NbO
	DziZ2poVhC9ICu8/0T9Z6Fy2v9t1XLM1OHw3lwNb3P/9LQkdmtQKPojJD4IK9PXBgtBRlzexHNP
	PB7Vy10M9S9C3b89OwG/DTRkiWeK/MTmCuytVA6iZ+RxJG+Amd5TJv79NoMoWO/c9HXhYUd+Tfx
	oAa7CWDifw8dpi4LvGRHga/n448Z2NxinbkfxpGvVXQ==
X-Received: by 2002:ac2:4c50:0:b0:5bc:fbf6:2352 with SMTP id
 2adb3069b0e04-5bcfbf62537mr260722e87.9.1791910112814; Tue, 13 Oct 2026
 09:48:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b7c2f7d1-40fd-4d83-8ced-5fc27e3be051@rowland.harvard.edu>
 <20261012171609.88273-1-sanglardf@google.com> <b819ff38-6916-40e0-b2f3-1b19876971bd@suse.com>
In-Reply-To: <b819ff38-6916-40e0-b2f3-1b19876971bd@suse.com>
From: Fabien Sanglard <sanglardf@google.com>
Date: Tue, 13 Oct 2026 09:48:21 -0700
X-Gm-Features: AclHuK9FA7yWhRGCICaPBsKXGhTVaayndv9XDXdeDu_su-lMXIp0-gBcubArVJQ
Message-ID: <CAA92w6=OhNYXF_kQFV4tPKa19xdWRkdQbFXaqhdxfqW4N9zMVg@mail.gmail.com>
Subject: Re: [PATCH] usb: core: Emit KOBJ_CHANGE on unbound interface
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My original patch focuses on fixing the silent failure for usbfs
drivers (like ADB). Since other drivers survive a reset without issues
from a user space perspective, I wanted to avoid being disruptive to
unaffected systems.

That said, unifying the behavior upon reset would be elegant. My main
concern is whether some existing udev rules or netlink listeners in
user space might break if we generalize this behavior and start
emitting unexpected CHANGE events for interfaces that successfully
rebound (which already emit UNBIND -> BIND).

But it might be worth "trying". I am unsure what the kernel team
philosophy is in this regard. If you all agree, we could trigger the
KOBJ_CHANGE event unconditionally inside rebind_marked_interfaces()
instead of conditionally inside usb_rebind_intf().

Fab

On Tue, Oct 13, 2026 at 2:35=E2=80=AFAM Oliver Neukum <oneukum@suse.com> wr=
ote:
>
> On 12.10.26 19:16, Fabien Sanglard wrote:
>
> > As a result, userspace clients like adb only see UNBIND and must poll
> > /dev/bus/usb to detect when the interface is ready again. Emit a
> > KOBJ_CHANGE uevent when device_attach() finds no matching driver so
> > userspace is notified that the interface can be reclaimed.
>
> Hi,
>
> why do you want to limit this to that specific case?
> Why not not always tell user space tat a device has
> been reset?
>
>         Regards
>                 Oliver
>
