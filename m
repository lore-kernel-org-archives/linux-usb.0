Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4B33C81B6
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 07:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717642; cv=none; b=CWbUJCLXbYjIVJYBkv5SB60P/GwCw8l3/lCpdWKsJDt0mPcQMwz36SQjSRAb/8cxRgSyjY8VW4I8003iiNBkb4WhPlakVp2E6S1EpwuQpP9Zm5FZRob9k9y9rFU+xVdkn2wctvchbMzmeUd+gEuXV/Ovy2xzRr9/wwjrO4Sq8OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717642; c=relaxed/simple;
	bh=M12UWYnEzdYXr503Rui7pKm062AJX8vC728B50jiC7s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lE+MNrBt1Vrz5fAOZ/zwKwnZ6OcRqOeqEa8oU8lK2WKhe+Z+4gYhoViLvBjJF2TApcDwH0Dtk6Asxtazq1oRdeQhQL2xNtvgm8twAvEi2zeJgdS686bh6QB3mwkgdk7uW2kZuGGyDFh9ljbDV1AUHRpI8MYHVzUXrb2pk9amECI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mn2xdmTS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mn2xdmTS"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47231f1f8f3so1881392f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 00:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782717638; x=1783322438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ega7ohzS6r6GgV/ue9UrgO9PLazVFbtWrIRnE4VyLbg=;
        b=mn2xdmTShptxI5vM3SKW3f+mapAxdZhFCU0OnlpcRLPfCXo15g+50LsOMwNt/OtA+g
         7e7sEe/85Tm139Of0YdWWAUXsCtnHVL01w4ZztdhmHgsGjso+TT90FtP8HFLGPI+VaJU
         X+1j0F42O5IBh/YXaRIJ7ixahH6WaGyGukptazJTw5/NTIQ7NNERn0fJtAA8K6kGCReO
         xcXFx2BGe/5B5ClhSBz1VojLtGCT7nVZkIYP8FCd32cCfIAqXFTPmj8zblayqGVGb59p
         jqeH4EKCumvaBhev7ia76uf57eVjnf/iY/64Z60f5eMA/gxypyU8BN4U/J+ttBsvC+C3
         t9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782717638; x=1783322438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ega7ohzS6r6GgV/ue9UrgO9PLazVFbtWrIRnE4VyLbg=;
        b=H8hExFm8IQf/7UI9bKZTZQD5wbnltGXZyBs1XYNAxR8jVcC5xngClNrf23oYrYhvGF
         5L7jFIQO+4nbtx3r2YatxuOYIjyDK1i5zBdKKSgHsqzMyr0h/eX+ihHhFK/g8Fx3Mg4A
         TMWxPc7p8/w0UtlszRn2+Pe5SXy02m6IF7qGbHjGHIR0+1piwS0GQnufkfKjnozZqBtS
         ICHIobLtkg5Jfr0oFGXSOL1DsL7QmwRNcaTHGmGR6PISm+BthblSTvVW9sM/kezUikPH
         fjR00DfxtHhMwi2qc49Okzjxj+W6KD4Q6NYrS67Rk47I9iClCZiL3OA4UYZxmvlYf17s
         vFjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpsdqbjWiGcP1ARsWFENoXH+LwFkEh177qS0M6iFtifuczJI8TDt11iPBVcjTrAa8gDmQiSusum7GU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnEdwOuEhi5xI+PUyJ48sP91fSHM1cy+pK8D5hOgTwGA6QkoDk
	m8ev3a/LjOrtMKfYKJ6l3QkZ8uDlXmciLg8nMP96iUu1l1XROy1jI33z
X-Gm-Gg: AfdE7cmGwCLrYhWxkVwOQ8On0LGmHU7oknRqBACnopvmXkJOwrpwB6pAJgLfMixyW9s
	3dbkC7yDfVaZ8+ZpcVh5c8iY6rVdxmBJ2uRKlyI8gzvpffGqfbIoVlZroWzyRVJ+7A4zCy46KrS
	lg3xGu9xbrtHe2+xecgTRcR4c/91NK9fH2asqfBMgzVax3P8qLohLifPnExhpj7n+xhpw+IOK9O
	Kpwdjv9/M/bQok5AJ1hkJFQTwg/7NurFWeeA9/T/h7gh8hUELrO0Q9UqxZNGDNT6U+UC3NfUP36
	JSYO19eXLV5PI7+MtdQQTVTwMjQr8NNY+2slqOO3+W5owf+impbu73zCanttLzojptFt6pEGYP6
	iFZs/Gut+gxSH5HhDyBASgUrCXrAl05fCAOfhkbdVfFMuwVkTT2AD+bEi+BlPFum5qfhMQf2n4c
	rX/X17ERXDCJOGekkHlURkBIil
X-Received: by 2002:a05:6000:706:b0:46f:558:a43f with SMTP id ffacd0b85a97d-46f0558a904mr17320972f8f.4.1782717637738;
        Mon, 29 Jun 2026 00:20:37 -0700 (PDT)
Received: from foxbook (bgu190.neoplus.adsl.tpnet.pl. [83.28.84.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm49368953f8f.9.2026.06.29.00.20.36
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 29 Jun 2026 00:20:37 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:20:33 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: sanan.hasanou@gmail.com, vbabka@suse.cz, akpm@linux-foundation.org,
 cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev,
 harry.yoo@oracle.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 syzkaller@googlegroups.com, contact@pgazz.com, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Mauro Carvalho
 Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, Dinghao Liu
 <dinghao.liu@zju.edu.cn>
Subject: Re: WARNING in usb_free_urb
Message-ID: <20260629092033.4a83e91b.michal.pecio@gmail.com>
In-Reply-To: <85cf5045-b52b-4aaa-a038-ca1b856b55f9@kernel.org>
References: <6a3eeead.7fb353d3.354599.b0b0@mx.google.com>
	<85cf5045-b52b-4aaa-a038-ca1b856b55f9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Jun 2026 08:27:48 +0200, Vlastimil Babka (SUSE) wrote:
> On 6/26/26 23:27, sanan.hasanou@gmail.com wrote:
> > Good day, dear maintainers,
> > 
> > We found a bug using a modified version of syzkaller.  
> 
> Subject says "usb_free_urb" but you only CC'd slab maintainers, where slab
> slab is most likely a victim here of e.g. double kfree() or a kfree() of
> otherwise broken pointer.
> 
> Ccing USB and EM28XX maintainers. But they can feel free to ignore this per
> the next point.
> 
> > Kernel Branch: 7.0-rc1  
> 
> Why use such a version for fuzzing? rc1 will have many bugs that are
> already fixed in 7.0 final. And it's not even latest, 7.1 was
> released 2 weeks ago too.

To be fair, em28xx had no changes since 2024 until 7.1-rc1, so the bug
must be present in various stable releases and likely in mainline too.

> > WARNING: mm/slub.c:6352 at free_large_kmalloc+0xb3/0x160 mm/slub.c:6352, CPU#1: kworker/1:4/12317  
> 
> A kfree() was attempted on a pointer that's neither from a slab page nor a
> large kmalloc page. Might be double free or corrupted.
> 
> > Call Trace:
> >  <TASK>
> >  kfree+0xae/0x630 mm/slub.c:6437
> >  urb_destroy drivers/usb/core/urb.c:25 [inline]  
> 
> static void urb_destroy(struct kref *kref)
> {
>         struct urb *urb = to_urb(kref);
> 
>         if (urb->transfer_flags & URB_FREE_BUFFER)
>                 kfree(urb->transfer_buffer);  <--- this one
> 
>         kfree(urb);
> }
> 
> >  kref_put include/linux/kref.h:65 [inline]
> >  usb_free_urb+0xd1/0x120 drivers/usb/core/urb.c:96  
> 
> USB layer itself is likely also not the root cause.
> 
> >  em28xx_uninit_usb_xfer+0x165/0x310 drivers/media/usb/em28xx/em28xx-core.c:833
> >  em28xx_alloc_urbs+0xf2a/0x1130 drivers/media/usb/em28xx/em28xx-core.c:-1
> >  em28xx_dvb_init+0x2b0/0x4a20 drivers/media/usb/em28xx/em28xx-dvb.c:-1
> >  em28xx_init_extension+0x121/0x1d0 drivers/media/usb/em28xx/em28xx-core.c:1117  
> 
> So it might be this driver doing something wrong?

Yes, it is. 

        /* allocate urbs and transfer buffers */
        for (i = 0; i < usb_bufs->num_bufs; i++) {
                urb = usb_alloc_urb(usb_bufs->num_packets, GFP_KERNEL);
                if (!urb) {
                        em28xx_uninit_usb_xfer(dev, mode);
                        return -ENOMEM;
                }
                usb_bufs->urb[i] = urb;

                usb_bufs->buf[i] = kzalloc(sb_size, GFP_KERNEL);
                if (!usb_bufs->buf[i]) {
                        for (i--; i >= 0; i--)
                                kfree(usb_bufs->buf[i]);

                        em28xx_uninit_usb_xfer(dev, mode);
                        return -ENOMEM;
                }

                urb->transfer_flags = URB_FREE_BUFFER;

If buf[i] allocation fails, all previous buffers are freed and then all
previous URBs are destroyed. But they already have the URB_FREE_BUFFER
flag set, which causes a double free as shown above.

The free(buf[i]) loop should simply be removed. It was mistakenly added
by d571b592c6206, then a26efd1961a18 recognized the double free but
attempted to fix it only by changing the order of freeing. Sent from
.edu domain, so probably an automatic static analyzer fix...

Regards,
Michal
