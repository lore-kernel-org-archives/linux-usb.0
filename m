Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F8049EC54
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 12:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353136; cv=none; b=SMEiyN7E0b4Kucg7Hcv+hRG7IbWDOqQHsYHH8kTpOXv0LRpHCRMIT50+1aMdMAlLmTOC5Tc3DQDieMxsWCLmml84qBweYs90pGuTV1UQlkWEwzoG/nF0IGfMXfbz6GrZLC8sDnBelc5z+1Xah/OWVmu6Rhvio7MIMCwZ3iVY4ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353136; c=relaxed/simple;
	bh=1RkVpXTuvN00hVTfOPbAO8SA0RlYc7Ah+87TmP9k+Cw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=spmAg0R4uFAI3Enk7jbptlPy9/lhea9o2ZRvgVluPUQ5jVfd2IyF3ZFDz43kjcz1XFXvDJarRNv6oQlAB6b0xLIhtTGLCh0lrt2BQJ5NmuGCi3ltOfljJqJRZgMvhj+bnALFWE2A9lNvEZxXUHqNmMEKqVgkasFmAN6i34qury8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6ClIiER; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6ClIiER"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b965570d7so8049955e9.0
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 05:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788353133; x=1788957933; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GDhxO7UEhIJumDD+5T88921tLRM35g/4fjzdk7MMonY=;
        b=p6ClIiER0h/zvK2lnn9Dg/i/VIjRrF0Z1OQvgle1VX9633l3ZZ5n3iNA2G+bWVTIos
         EfbFgf/OQXIKiO24QhX5mv0ST1qtejrpJMRW0pOraBAk7Pa9kTMfQoNXTYcZfMrzALTi
         XsRn5WERfzfSERfvp/cP/5Et1lUIAisq7Bt8bIlJgD9HnVUevNRinM1DPa4xCYhtq2fz
         BVqpTWAHqasHZyIE8H2FRbWIuqiPkmvn1JhrqdfJVMqD/ipGDVZoTF+JMHIE2EPflWVe
         Mk+EXhZ7R+f6Nvz6aTb5xZ8ZSCx5LYAH2vwWRwsfS8ZzAI0FYypPfdCMc/8MotfdmDKn
         zzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353133; x=1788957933;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDhxO7UEhIJumDD+5T88921tLRM35g/4fjzdk7MMonY=;
        b=l5QBK0Ntuqs3q0Wt338MavXEzDNDGoAetXcYT3/5QGl6wFWjt3bA4S4FmXC9VhZT1Z
         IKpDKmx7MS8KCZT9W9ABDEtWPe6wxX2MsN01mTL267ilntyp/YsrSMXV4YPcyGyP5u/k
         rVqfDmspmyrg5rTKx3+VqwK2Rsh8Xu3x041fHIVU4eCGKo14sCltZMgwxctg1VE3s23J
         YpggwKP4VF98cfTPFw4I3X5a0MI9T8nOUaYnT84uanbNGTlfkW+HYDrY5PhrGDiRqfq4
         ks0IsQPo9Vdve4dE/ctqetmp/XyswYAytHXuwnWCn8H30RVMSV0vAl5Vlpl/gSB0EUKC
         25rw==
X-Forwarded-Encrypted: i=1; AHgh+RqbT10AxeRvgXElu5a34mwUOs+4xFqp+Y9z/2nUNh24UMSgGZavRy2aCRxs4Q5+gqYh53ldJPSSs9I=@vger.kernel.org
X-Gm-Message-State: AFuF++nZtiP9RN5I449AFRjBeTZPq/bhu/mcfSz147bu6MGTF7MjCoqU
	tOafpwc6pvw458o3GkJqjCsqjK/FMoR/BnqiSlWnHZ5h3zqW8wIf10p3
X-Gm-Gg: AR+sD134MPmdd9XXfQM2pjb1VZkTVhFlpj9lFUhVLaIVZmeU/zS+xWiA9b5aqxOuNRP
	YCNltp+lFJcP5qQockAHod51K1qZUTz+A4gAy7cLCqpndiH6lHIbmb5nhqHuR5FgZeWmGkjvaB9
	CKr9HMSuufWNbpI6fk8BAdl7hIjqhcgJryDla7dhU2fJ//uv9XTvYzaV8QNzQBHp80SE2Nr52nd
	HLAPDunkwChYFAqF8YBoBms/ZMFva2h+yq1yPUCRPmaoju82ciHy1tAIX80yAteSonh3UjoqV2y
	DIYQRAQUruxl0Xb3uS7ZDmRbWkqKTZRU4IpZ+mXi1dWvTe+6rwcbLaO0stInwPwBqCDgI3HYIEh
	3eghGoBtdtjn5qF/K3FN+7u3wJ88zTMutldvSZJsv8pTZnuU1iyyYPKS0Z7buZ7LkINLJWAmyYA
	+HsL8uQxL4wormZNJvJsqXN/fHNdzh2SjjiI7PYL22rGqk5RJXL160xUeXUwuljg+yUjoRfvECU
	8HxJkctICdk8ItOSAQEIbmywBQut+2paGk/rHBU4hMTq5LKbVGaUrV8mgm0k2DlA0bCQxFG0A==
X-Received: by 2002:a7b:ca42:0:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49ce55fbdbemr55794365e9.4.1788353132487;
        Wed, 02 Sep 2026 05:45:32 -0700 (PDT)
Received: from valmpani.valmpani (athedsl-11462.home.otenet.gr. [87.202.45.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce164bcsm142344175e9.7.2026.09.02.05.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ihex: Fix 16 bit truncation in ihex_binrec_size()
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vasileios Almpanis <vasilisalmpanis@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 David Woodhouse <dwmw2@infradead.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <2026090223-napped-nerd-790e@gregkh>
References: <20260902-ihex-v1-1-67fdbf8d97ff@gmail.com>
 <2026090223-napped-nerd-790e@gregkh>
Date: Wed, 02 Sep 2026 14:45:29 +0200
Message-Id: <178835312958.943169.5134885168571622868.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788353130; l=3230;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=1RkVpXTuvN00hVTfOPbAO8SA0RlYc7Ah+87TmP9k+Cw=;
 b=dSws55juFQur0gReXYfBRM4D80D3F8hpaE1I7NIARXEJjy6UyWmj8SzwlEWMxsBMJJEbBy0P1
 PR4csZ0YiB4Bf1ky+9QWYh9LJkdGiQd+wLP+xY4Rrw1c3WZ/3moq+Gl
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

On 2026-09-02 13:06:27+02:00, Greg Kroah-Hartman wrote:
> On Wed, Sep 02, 2026 at 12:21:19PM +0200, Vasileios Almpanis wrote:
> 
> > ihex_binrec_size() returns uint16_t while computing be16_to_cpu(p->len) +
> > sizeof(struct ihex_binrec), so record lengths of 65530 and above wrap.
> > __ihex_next_binrec() uses the result as the offset to the next record. A
> > length of 65530 gives an advance of zero, so ihex_validate_fw() spins on
> > the same record forever. Lengths of 65531 to 65535 advance by 4 or 8
> > instead of 65544, so a 14 byte image passes validation while its first
> > record claims 65535 bytes of payload. emi26_load_firmware() passes it to
> > emi26_writememory(), which kmemdup()s 65535 bytes out of a 14 byte buffer
> > producing the following splat:
> > 
> >   BUG: KASAN: vmalloc-out-of-bounds in kmemdup_noprof+0x3b/0x50
> >   Read of size 65535 at addr ffffc90000075006 by task kworker/11:1/174
> >   Workqueue: usb_hub_wq hub_event
> >   Call Trace:
> >    <TASK>
> >    kasan_check_range+0x10f/0x1e0
> >    __asan_memcpy+0x23/0x60
> >    kmemdup_noprof+0x3b/0x50
> >    emi26_writememory+0x29/0xd0
> >    emi26_probe+0x2d1/0xb64
> 
> Is this a real firmware image being sent?  Or a fake one?
> 

I used fake images. 14 bytes long for the out-of-bounds bug and 6 bytes
for the infinite loop. I passed them through the sysfs fallback loader.

Out-Of-Bounds bug image:
00 00 00 00 ff ff 00 00 00 00 00 00 00 00

Infinite-loop image:
00 00 00 00 ff fa

> And root triggers this, right?

Yes its root only. The attributes are accessible only through root
and it also needs raw-gadget.

> 
> > Return size_t so neither the addition nor the following ALIGN() can wrap.
> > 
> > Fixes: 9fb4ab4d3dd6 ("ihex: Simplify next record offset calculation")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
> > ---
> >  include/linux/ihex.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/ihex.h b/include/linux/ihex.h
> > index b824877e6d1b..0da1c4e3e693 100644
> > --- a/include/linux/ihex.h
> > +++ b/include/linux/ihex.h
> > @@ -21,7 +21,7 @@ struct ihex_binrec {
> >  	uint8_t data[];
> >  } __attribute__((packed));
> >  
> > -static inline uint16_t ihex_binrec_size(const struct ihex_binrec *p)
> > +static inline size_t ihex_binrec_size(const struct ihex_binrec *p)
> 
> but size_t changes depending on the platform, right?  Why not make it
> u32 instead?

It does, but the value tops out at 65535 + 6 = 65541, so 17 bits, and
size_t is at least 32 bits. I chose size_t because sizeof(*p) is already
size_t. If you don't like it I can send v2 with u32.

> 
> And if this hasn't shown a problem yet, in the 8 years since that commit
> happened, is this really a bug?
> 
> What changed to suddenly cause this to show up?
> 

Actually nothing changed, I was just looking into
https://syzkaller.appspot.com/bug?extid=baf3cbba7dd980984f0d and ended
up reading ihex_validate_fw. There I noticed the 16 bit return value.
Both cases are reproduceable (infinite worker loop and out-of-bounds read).

> thanks,
> 
> greg k-h

Kind regards,

