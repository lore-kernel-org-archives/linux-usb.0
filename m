Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792567563;
	b=zALWEnPRTFRtjc9npBh7dDkmELo6rexFOQbbLAzZybZ0D6pQ15d8e+ub1OuCMAyMaC7/
	 KtTF1Hef37ve6es33di35pj8DqWo2v/dOUzOui57vIJrwjNGKlMXHPy+7E9f+1hkITeyO
	 QKSvvqpRryRM4vuWb8qbsS5HDyWLViV8XHjH3ibyTdXUGJJ4iZYkJUzX/RiYzCTB/+QeH
	 6evWQfhSzK53QSngM7QbO9d3qFMaWpsvsU7ssLeCnM6jHgWjpzP08bdFvv/hbDP2hJCya
	 PK7XPlQsjoxtYaf4uyoP0eyStkGIaIITLVPBvUJqqFuIgdPf0TKSA0WR19eNzvkhb1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792567563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6NK+Pu6Mo2Qewcl8SZlZRwKFnzkox4FNAGBJWGVjKm4=;
	b=3I/uN8TM6zjvaLejdYfMC5jmzq3GpP42ZImQWfIBblnedg2dkUWrVG1Inw7NsG1I1Nnx
	 r/mlK1ZcTo4FOge/14bgremOfzfCNA3jmHA0AwHCyj5QIUo96+Rw+BcACqrFzEl6RF+O9
	 ygkkSm7IW7NUuIInZqy5++iLJgwTx0AStOKo8mbfHPCygaP6A7AeSJ+RHEmMSKwhEmPTd
	 VJ0JBofq+miszfeiMKzcgIhV0KcpTpm12FdOptv9qiR3S91QR0K2lTaDCMDXgCSHivUFC
	 qmxmnqPhdy0/8ZXKuIckVAYhtANeU27n1EVZrtTZzJndfKKX24idt7GgzIVERktiUOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Im59a3l4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4E3606A31A
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 07:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F4E3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Im59a3l4
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so194287f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 00:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792567562; cv=none;
        d=google.com; s=arc-20260327;
        b=sWaby4QO980Iqxl22fVV1ngIW3RZu2ShmBDQKz2Qv6jv2gQbHlYQDbgcJKVkOtB1oN
         aX9qiiE1/3CpTrvNniIgHQ/UTY/xDwwmWjmgPVqpQsplPwwhrgI7ROY2sIL/aQhtKqRp
         ipTj7sCtsDWhB6yMXVB1Yt3SjaffNXETEY889KNFX3kFQHVtVyvZ2YXNi+e5ptFvWcQ5
         wb2rNsGL8D8INjg1ItzhSfd02PLSSzlXEEUr7bHhtdTqZ2EHmNSPGBiz1/X3vMY589fG
         x0QTX4PwSWBez5iaY5mgjVREEBX4vEyeKgyFydNX5dcba+Eah3eeJ/xdUK+yKPCJdPVq
         Fq7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6NK+Pu6Mo2Qewcl8SZlZRwKFnzkox4FNAGBJWGVjKm4=;
        fh=I3xnWZXwLXuML2xPU755jMCR11b3iK+cj8kJ5bRMTJs=;
        b=AGeiIIEyog3KRUK02zSKJ2KioduNcchG3EDoYckMEJdswg4ifBP/SScPRC2DxrCISW
         EVA4Yo5zgGqv9pDnlLP440whbcRovWIaktm/mEeC9m3hjb23R/stQLp3dNqmcwYrf7Fd
         D2MpIO/47a7pb6fJkfWKW3W2XyWtv7P72RnuCkDDqVLKIlW8xfNbQTnpwCEz1TeFJUl6
         nOPfwQXfsHB3X4klIBJroyivEKnZInrTJI7Dv5q2GVG9w06UrCw5cLx1P1KW9GA6cLcv
         iiXH60UxjRsHbG5JhfzTTq09cui76MHgFt0DI4yfr8gYlahxHiNRqujh4gw5RXz+rR53
         GWLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792567562; x=1793172362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6NK+Pu6Mo2Qewcl8SZlZRwKFnzkox4FNAGBJWGVjKm4=;
        b=Im59a3l4DJYrtkXUTuv+8s3bZ0QE4tY64ScU4JwS5igTlyja2GRz5l1EcfbJkYSLXY
         UJlVmHV8nLZyNz+Y8Q30sN8LHCsAnQ211G3rTFBjSqbHxg4FMhC9EB8J3Imsb2013Yjj
         VW4se7FTDsZb9JTmvFxaDEhHv6KH3B0KfDmcgx3cb4YUHQHk2l7D/C5uPzp4eZdRC9wZ
         7XoM9Rc57XS2V42yXc3NCuQ9rAo2L1f10vM91wn7eH7UBnbYQ88k390aL8Yb9NvQBMkK
         XzovV9wnCg8UOIGVykobsEGexO1Qn9+Kb4AkuQM5KKlIBfuFnYkvx8VdylsQ0SVDFl08
         lGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792567562; x=1793172362;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6NK+Pu6Mo2Qewcl8SZlZRwKFnzkox4FNAGBJWGVjKm4=;
        b=rPU7jZHguxl/+GVWlL9eCnvmyOgFEhqyEfA/w4oDLPPN1/X/yHET/9fsXk1OpUNf3I
         FmU0B5HWcHegKxg0uUVgZhtWr4RYbEuBgOlK4/v0spjA6iR33KlDMVR6TuOvXOmmdtAM
         08qlxG1FtnoM6FaNPhBbKtWRSqpoCw/8WEM4fUZuQb9tUE3tA7XspKSRBmz9XLEz2BYa
         KuQ1lkFaHooRnCJjALpeedZO3nUTrIOGrlS4MZV9r24K9XEYUZDFIjon2eUxqrDVHIlo
         MrUEYzl19Mh0gqr85XYGNO6RsAlFyPDsmKS5i4kbr7XYDg9kNQjK5I+m5H4wS+vftx3m
         O6gA==
X-Forwarded-Encrypted: i=1; AKwUvBxjeuydcjqFE53lrCYsMatBPYzKyAsFenjaHpb2/Qr2NSlzrgrOLh2yz3hJ9Pu9UtBOndjQ4ghojdQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ66+3ZFifXetHrgY1cG0J8F5SuKP4OHnNCvvOGmZXu/fTAJhLX
	qMDue1pEAjG52vx19OcpV8vh21+8/POirsLxe6k7YlZB7hpTmTR6YZ01Q2hJyoTd6gz9apqJMJh
	W9T3v6FrBNzw3ffNXXyt7owlFxDJrqJw=
X-Gm-Gg: AYBFou05BKQCN0TDLtVUCMqPguRkwUPOl1LTybrtMuljra/HJYIbtIt9yo2kT8stAqs
	JuDrxrmXPFog9R1fu2N0HfRlacJWiHgfs6rF+qO+jpR96H1/UmO/NZ1+3geK1G3Q5kWgbpvFPO9
	4LRByoLF8m2GSfVQpgr7qmkEJa37yX6r1JQEHMDqAIcvXn+y7K29GyjP5CWwUDLHUZMnkd8mSv8
	794lfKuLUXHrRMi7vPMsaO8NVF+9gkhvqoiF6NmMbLatHvjwYChUasJ+iNA3NuV7gvnsZVgDANF
	d1A5xOZHcOJt8RySpLZTpK5OGPE0rkrmyul/SGHJn6WKLjwLvV4t+oM3O51c05rDG0QRLDbzwAj
	8riR6+nHL+BVjWvvwJzYMOblUI9JH/X+Vbvdi
X-Received: by 2002:a05:6000:2612:b0:48b:efb:4a66 with SMTP id
 ffacd0b85a97d-48e2641ddf2mr2067966f8f.6.1792567561509; Wed, 21 Oct 2026
 00:26:01 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013132033.4352-1-jun85566@gmail.com> <2026101310-crier-december-be03@gregkh>
In-Reply-To: <2026101310-crier-december-be03@gregkh>
From: Jun <jun85566@gmail.com>
Date: Wed, 21 Oct 2026 16:25:50 +0900
X-Gm-Features: AclHuK_5zzb9An2pyb1TF4wk3TZKJmT2QuQ5H9SZ4O5kutNbDUL7VIV13Fjrzho
Message-ID: <CAJ_OVWRUPXdpyGjLVp0LK9kMPRmWJKFmHAujO=S5cby5VnRv=Q@mail.gmail.com>
Subject: Re: [PATCH] usb-storage: option_ms: bound probe-time bulk transfers
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stern@rowland.harvard.edu, digidietze@draisberghof.de, 
	xiehongyu1@kylinos.cn, linux-usb@vger.kernel.org, 
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, 
	syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> So a broken device?

Yes, effectively. The reproducer emulates a USB device that completes
enumeration but does not respond to the subsequent bulk OUT transfer.
Without a timeout, the hub worker remains blocked while holding the
device mutex, preventing other operations such as usb_device_read()
from proceeding.

> That feels very long, are you sure that works well?

I've reduced the timeout to 5 seconds, using usb_modeswitch's 3
seconds timeout for similar bulk transfers as a reference, with some
additional margin.
I retested with the syzkaller reproducer under QEMU, and
initialization now proceeds after 5 seconds instead of 30.

> This should go below the --- line and is why sashiko is confused.

Thank you, I'll move the dependency note below the --- line

> No blank line above here is needed.

I'll remove the extra blank line.

Thanks for your review. I'll send v2 with these changes.

Lee Yongjun


2026=EB=85=84 10=EC=9B=94 14=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 1:18, =
Greg KH <gregkh@linuxfoundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Tue, Oct 13, 2026 at 10:20:33PM +0900, Lee Yongjun wrote:
> > The Option device initialization path issues bulk transfers
> > without a timeout. If a device does not complete a transfer,
> > the USB hub worker can remain blocked while holding the device
> > mutex, causing usb_device_read() to hang.
>
> So a broken device?
>
> > Use the timeout-aware bulk transfer helper for the transfers
> > in option_inquiry() and option_rezero(). This bounds the wait
> > for each probe-time transfer to 30 seconds.
>
> That feels very long, are you sure that works well?
>
> > Tested with the syzbot C reproducer under QEMU/KVM. The
> > patched kernel repeatedly completed USB device initialization
> > attempts after approximately 30 seconds without triggering
> > the previously observed hung-task warning.
> >
> > This patch depends on Hongyu Xie's pending v3 series:
> > https://lore.kernel.org/r/20261001123135.38831-1-xy521521@gmail.com/
>
> This should go below the --- line and is why sashiko is confused.
>
> > Fixes: 32ebbe7b6ad4 ("USB: usb-storage: add filter to "option_ms" to le=
ave unrecognized devices alone")
> > Reported-by: syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D7317196294d50d6e55c3
> > Assisted-by: LLM
> >
> > Signed-off-by: Lee Yongjun <jun85566@gmail.com>
>
> No blank line above here is needed.
>
> thanks,
>
> greg k-h
