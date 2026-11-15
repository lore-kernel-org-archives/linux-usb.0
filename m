Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750039;
	b=NtFTQLkOGnwr4yUHkzwxjSjM+3abdbekrJW45J/j/A6J4T/VLpceuVegsx3VPsMgFR/J
	 mdk8Sgl+18h7PoK0eF5zuEBMEwa/eUJuYSwxNJsCZULmq0Gm07s8LkY7HXB0b9PtcsQnz
	 c3MgM6RtPWMl034YAzcP0BS9XpBuGUcN4fa9Pv9dSdEfqaYkoGaZ3nnbh5clZb8FkXsXP
	 R1WbuFA0G7BqqCCU/UJhxZImt0P3014Yyt1borhL2q8WN/CARdQbVSrAhnJ6A10M+Ya+5
	 nPr0B+vXKRVJMg8niOet+/dgwZHZTQonr9QcwRrWIj7n+D9PJ74U9uPcO9ZeXFgHbCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L9Z2e0KuO6yFLSMGIY9LHrayXw4tNQJoHgaVpcSQaXQ=;
	b=yz0Gr96Cq8TiAwAV/G2tOwk4oi82xWLwxx2GSvo9ERWghNetvkCQFoiEHBIuQvD8YGLy
	 9EFUQaSixSa0Ws3fiNg7uWmkEsr1QQWVDfGEygRf4XIHHw/ssHsMazJwawsnCn+wM9va5
	 liE9ab5jcyRmT8j3YKKa/ZPtw/XVFM6pCEd7lrP3zr261Cg2x0LM8pnJ66RhjCST3EHnl
	 RtNRgCPk9ja9DRV4YVrueYkItW48RxI2optfJws/IDAmG+8X3P56m4/8PcqH9V2Edyc6X
	 f12uzubc+tVJ/cyJyPEziCi9vY5+KlE7fMALwLRQK30Pkl+b1l3f0qTfxM1veJCS8XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NgWsEksX;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08BC606A31E
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 13:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B08BC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NgWsEksX
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so15142795e9.3
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 05:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794750037; x=1795354837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L9Z2e0KuO6yFLSMGIY9LHrayXw4tNQJoHgaVpcSQaXQ=;
        b=NgWsEksX/0sYm1633PJw++fnv/VFkAE9SBWZqgL49Z0r6u+NlQ8FKbl7D3VIBcWqcI
         17ANU0aAU5L8z0DEl4dWWrE+iFUqCt2LpQHVfSGlnx0TEXaDTW91gqH0Ja3e4sSWKF94
         PEgTtvnyxibKHo4BaCAIzAhIJH3o1i794DsXmXz0Odb7OxsOCdigBl7xuF9+VCHtoPHI
         MNo+vsC8o8p5vxBdtu0bCkH/oxq9k2DuuRIvmzmRvU9gdR0kaRIH42tF4W9Qn1xnFzFn
         CWehJF1YalfdmSNCFW4ZPuJY9Zztj9GsCkL7G84FEt49LEA9Wp3wxToKi5ojth00zYxz
         iQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794750037; x=1795354837;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9Z2e0KuO6yFLSMGIY9LHrayXw4tNQJoHgaVpcSQaXQ=;
        b=qz0uo0D2cInT/zx1CxJWcc1KTcZMB+JfoiWPnq/R6VKKpVDDWQqQ1JMsnxasrHqRAR
         KPBiHD0WKFtDOFdGltfNGhqyn0FCUWh3DK6wDVU2+s+DfisD2bvvBFWnxIfE7WlWVQZ/
         3yRLqt+qBWTc9IsJRS6UcihrIe5TIRUOsDaUgkQdzjpXdPM662V/9J6HyzMyF6JVOdqn
         FqzIwkLWx6RFW61MAYVD8hL6ddQ9V96Hj5r7DkwM1vLQeGfJ+JcYoyen9cB6KCISqI7/
         dLZt6D0ZyxUvU5R6lJ8XE3JBC4MsCua3+YxJ1KSD21dItemlXgmeKZEF1XmbbWGL/U9t
         rQ5w==
X-Forwarded-Encrypted: i=1; AL+hErHHCkBOk1vYjAYbOAp2J16n7ZI74aaaYGvQTkazT6e3CL269L8D2yzRLUCB3RyDYnSsuVe0mgwLXRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JIsO+v5bjgJSG0F0w2cTgM9S3GRxDH3f+7buF1i1wYBjQyaBg
	3hJjjN7hK6TKeADPcKdlUC6Bb0V7661ydADokkMURyLajo8bi83KuVZ6
X-Gm-Gg: AYBFou3v+PAhNHzwM1q4ZEktGdd/c/NPL45hsmh1JSHaSjxHHQvGN9Pqx/qcWCFV4Hz
	NScmB7WOGe6kFCBqDK8T9Lf9GOP/90xdPMrBHtrb862ByIJj+mq3C3e1ReoLOeancykt1NI2GhP
	+HQpraRDqPtOhuv3QBzPsEnToMPMqWUHoFjIXu40J5ENR8kakUH6xk+JE8v92dHWdRuALsuVdIq
	z3efLTCt1aI0GdZRpr64ewx10Hg8x7TQ7LNAjendgeIhpswYS06tBcmMEN3GBYl2hWRDojyDbdh
	mXK/IVTXOl8WEMT3XYHJjqBF9r4oK/fV4n/IKWav6/bWUylsgcH7VakoXufCWPd4K42W7HZ4I/J
	ToUb/BFl7xkWeI9abOK+mI/h2xpOsGqci028xJkix2b3baDiUnIzbvM1wYOX00yTngJmbwE2rSH
	Nd1fzWRNPSqXD95O3DOWPbXpJLr8F7voC0p8FrM2xtu2fLwbKZ2dfjuDTgONmQHhv7jcBdZkePk
	FTdku6Ko3i4rf5KiXELpzywLOqU1sNwnnpPHpEMBtOmEIdQ0yBtR0uKAGegb9ntMUt4J/eWUUd8
	J3WNTql+DON7ds1bEv5O5O+2r77V6uR/DB7Qb64q2XJT0nHEYq0djw6KIgbQ+56SRA==
X-Received: by 2002:a05:600c:4f93:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb55ab36famr171020575e9.27.1794750036927;
        Sun, 15 Nov 2026 05:40:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55a0ffcdsm195768565e9.0.2026.11.15.05.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:40:36 -0800 (PST)
Date: Sun, 15 Nov 2026 13:40:34 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
Cc: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Woojung Huh
 <woojung.huh@microchip.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Jie Law
 <98lawweijie@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v5 1/2] net: usb: lan78xx: do not update
 statistics after a failed read
Message-ID: <20261115134034.042486ca@pumpkin>
In-Reply-To: <20261111013454.34542-2-law.wei.jie@gt.tech.gov.sg>
References: <20261111013454.34542-1-law.wei.jie@gt.tech.gov.sg>
	<20261111013454.34542-2-law.wei.jie@gt.tech.gov.sg>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 09:34:53 +0800
Wei Jie Law <law.wei.jie@gt.tech.gov.sg> wrote:

> lan78xx_update_stats() reads the hardware counters into an on-stack
> struct lan78xx_statstage. If lan78xx_read_stats() fails, only the
> rollover check is skipped: the counters are still recomputed from the
> uninitialized stack buffer and stored in dev->stats.curr_stat, which is
> then reported to user space by ethtool -S.
> 
> Keep the previous values when the read fails.
> 
> Found by code review with LLM assistance. Tested together with the next
> patch, which makes short reads fail: with an emulated device, ethtool -S
> then keeps reporting the previous counters.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
> ---
>  drivers/net/usb/lan78xx.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
> index d73002b2c21a..76c2d98b49df 100644
> --- a/drivers/net/usb/lan78xx.c
> +++ b/drivers/net/usb/lan78xx.c
> @@ -789,11 +789,13 @@ static void lan78xx_update_stats(struct lan78xx_net *dev)
>  
>  	mutex_lock(&dev->stats.access_lock);
>  
> -	if (lan78xx_read_stats(dev, &lan78xx_stats) > 0)
> +	if (lan78xx_read_stats(dev, &lan78xx_stats) > 0) {
>  		lan78xx_check_stat_rollover(dev, &lan78xx_stats);
>  
> -	for (i = 0; i < (sizeof(lan78xx_stats) / (sizeof(u32))); i++)
> -		data[i] = (u64)p[i] + ((u64)count[i] * ((u64)max[i] + 1));
> +		for (i = 0; i < (sizeof(lan78xx_stats) / (sizeof(u32))); i++)
> +			data[i] = (u64)p[i] +
> +				  ((u64)count[i] * ((u64)max[i] + 1));

You only need to promote one of the values to u64.
Even just changing the 1 to 1uLL will do.

That made be look at the related code.

This function has a large on-stack buffer (about 800 bytes from a quick
count). But lan78xx_read_stats() (now) calls kmalloc() - probably because
it cant use an on-stack buffer for the usb transfer.
If you need to call kmalloc() it might as well be for the larger structure.

There are a lot of stats, and two structures (one u32 and on u64) that have
to match, not only that but a lot (but not all) the code ends up treating
the structures as arrays.
It is probably worth just changing them to arrays and using an enum for
the indexes.

Oh - glad to see you fixed (finally) the massive 'truesize' bug.
When I was testing this driver (may years ago, and the product that would
have used it got cancelled) I found a bug with one of the usb3 host
controllers that it only processed one request from one of the control
rings for each 'doorbell' write. The setup code could send them too fast
and it all got very confusing - don't know if that got fixed.
I've actually got the host that failed, but I don't think I've got the
usb ethernet device.

David



> +	}
>  
>  	mutex_unlock(&dev->stats.access_lock);
>  

