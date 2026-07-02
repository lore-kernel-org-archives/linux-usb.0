Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500B3283FDD
	for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2026 14:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783002177; cv=none; b=LVPOYDUTtI2UXZcJTtYlhf364zmzX0toLm+zAjkyWiaLgi/0LrIfYsOArZN/NBoMlma6YAWF3T/tppt5I4jDApteWsuTBlg/zXC16SsTNYN2uVWFMYaJKp2aWG3mE+fwmz68IriAy1hOC79DUaV8Rfl7jAvzw4H6TJoVStM43J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783002177; c=relaxed/simple;
	bh=6x8XBCoZtAX0mi3hXBuAlYs3Z+UMzWgqqljeQLPvSJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZ7bqbt8z5iy5KRCL5+/pP+VEyXvGLn6zGFzY+BK2GURFRjTUUPY8+clTZ4u5Fit4uobgAe4Md7AiV7QKxiHfyi3e/yJcLC3pum3xnQof5UFSWM/Nh3oFX1ubhMfsSHgl8PCCDHG8iJXm0xp1AP+bJaDoQ9MWRGkNGDuFh6O5+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=PVKPhytj; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="PVKPhytj"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8f0d6853360so12426636d6.0
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2026 07:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1783002175; x=1783606975; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aH1kENw8AT8IHqJX8Nyp51SWxYIGaV1VV7UU4K3OfVE=;
        b=PVKPhytjV941ZcP1LnmteGCm0qyuKYRvCRbRsI2CPwvvs4+5BsvAxJO25NS2/IRrEE
         x2FDWABKkJj8to+gEmfAzDO3ZOVjktQDXF1k7UzowQlrtubBq+05ToOzL0Uj2Y3vgnTV
         W8PHIrYpdMlaz1Kr0FBOS0Uq2rCxxYPDxvWeLSAcJdkc+jkmqWKuqzhzTqPH1N4lJOF0
         DvuRz0yvK5G5z/wAXITed0o5mJV7kz4CmxvK8PkmfuSHK4d9DN/tN39DZaF6qKMoLkEU
         etsUUzoob8/ZhxrXInkVsgnK5ABZxzAtOiUeBLs+zcrIDs6vPUm7u/MM1DVT8Vl89ihe
         vJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783002175; x=1783606975;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aH1kENw8AT8IHqJX8Nyp51SWxYIGaV1VV7UU4K3OfVE=;
        b=h/ONxQld/wvSeSPegK5TJI3t2J+0EkXTra53d8xT+xHNNUj244diQKrUBDBDrsfPeD
         9y1hcKRFSTKs8ZFa/OCgUE9Kvpot5J4IRMPt8rdx12Kp7qgY21jn8vxMaT1L9Z7jJlRy
         Em+ighImk+9ZEwvNld7kFWJmV5gukavjJNrDI8YJy9fU2XMmMf2b7j49W8/ho5k5iiHm
         TEu6co+E5Ts/ZlYlzQMHUhr8rc5reKwe0NAw7E+ulYocxP4retXKF8I46p2HDFiKo0vg
         mkAwZ8SoyXT3AXLLhyBYmJ0VlUEGjuCIS2dvHK8QHGF9CcnG6fLyWTDNUM+wuxJPEMC+
         NqWg==
X-Forwarded-Encrypted: i=1; AHgh+RrLapMLWGIQ1brRVV5wyLpaM9RXqw8+CStIDw6PxG6US3e2jS0rpaRilanAzG8FMaRUR3tWf34WuGM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa867ur0q1b2fIc4BkzkndqnW1CyMwZPaHQQHXqud/WbLeT/Eq
	YSr2vohhdIZBPjrrXkgVeg35mFhok8T8E5N02a0n6LTHrIkxbGJ3c6m5q1AyDeWRXQ==
X-Gm-Gg: AfdE7ckrVtEUk09AH2Bx/2qfso/HZpsIdWB8jUtUeGmV85zeLqGPZElHrxKEXJ1Njz8
	HSkV9GtceBYZ6zEeh2fHclqC0cT2bvRbsuLyFELkvxFJh1brpIebBpxB5Sxm5UY4j/RqaKu7Ojl
	mkBwfQ8CGO24Fjb20EYvGZpltQ6B7ipsralezUgwVeaygVjcB4qcaK3DwYhXXKLlutHHghWIEZC
	ZGkjP11vEiJclcdqH2CI/p5KZYojOsxTWL4TXA/N5Tee+rt+Ow8PxQJbFd2ZDd1dm+veO2979b8
	MDYQNjSJ9GDAemnM4uyegiBlBZocCyMvQpX2uAGpjO1V3bzVXqOwM/Wyf0eHqIJESRgv1O2ylH4
	kT6VilX202k1hqIsAP6xsX2WKV6EQYKUcXCHyb/liBxc7P/4Dq98ZYJE2D0nr0DwzGs50YUlfI9
	iKie+qxLrHojn2TAXVXnZUxY9kvSg2kGc=
X-Received: by 2002:ad4:5148:0:b0:8ed:a980:6b2c with SMTP id 6a1803df08f44-8f3c8546789mr60447956d6.30.1783002175174;
        Thu, 02 Jul 2026 07:22:55 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46e942af0sm28226396d6.14.2026.07.02.07.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:22:54 -0700 (PDT)
Date: Thu, 2 Jul 2026 10:22:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?B?6rmA66+87ISc?= <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <8067503d-1c0d-4319-adbd-225a03e16ea3@rowland.harvard.edu>
References: <CAFmvuTWc880R=mw7=kixfx3Yb8u9thLHPA7D=rm6a8p9dYBBDA@mail.gmail.com>
 <2d4a91dc-037f-4c31-8ce1-7bc840d42b0b@rowland.harvard.edu>
 <CAFmvuTWq7TKZaj6R9JJzWhwe1WB1FanZ17T1-TFL1g2wsUBZ4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFmvuTWq7TKZaj6R9JJzWhwe1WB1FanZ17T1-TFL1g2wsUBZ4w@mail.gmail.com>

On Thu, Jul 02, 2026 at 05:08:17PM +0900, 김민서 wrote:
> Hi Alan,
> 
> Thank you for taking a look.
> 
> I do not want to over-specify the exact fix, but my tentative view from
> the reproducer runs and code inspection is that the key invariant is that
> struct kiocb_priv should either remain valid while it can still be reached
> by ep_aio_cancel() for the same iocb, or it should be made unreachable from
> the cancel path in a synchronized way.
> 
> In the immediate completion path I am looking at, ep_aio_complete()
> appears to clear fields in priv and then free priv before iocb->private is
> set to NULL and before iocb->ki_complete() runs. Meanwhile ep_aio_cancel()
> reads iocb->private and immediately dereferences priv->epdata.
> 
> That seems to explain both symptoms I observed: a NULL-deref if
> iocb->private is already NULL, and a UAF if cancellation observes a stale
> non-NULL priv pointer.
> 
> I may be missing some ordering guarantee in the AIO core, but from the
> reproducer this is the window that seems relevant. So I think a NULL check
> in ep_aio_cancel() would likely handle the repeated NULL-deref symptom,
> but may not address the stale non-NULL case. A safer direction might be to
> ensure sufficient serialization or lifetime ordering around iocb->private /
> struct kiocb_priv, so that either priv remains valid for the cancel
> callback, or cancellation is already unreachable before priv is freed for
> that iocb.

Also, NULL checks don't fix races (cancel vs. complete).

It's hard to make lifetime ordering work when you don't know whether the 
aio transfer will ever be cancelled.  Serialization seems like the best 
solution (provided you can guarantee that it won't cause a deadlock).

However, I believe there is a valid reason why the spinlock calls in 
ep_aio_cancel() are commented out, although I don't remember what it is.  
Maybe because at that point in the code there is no way to know whether 
epdata and epdata->dev are valid pointers?

Anyway, it would be good if you could figure out a solution and write a 
patch to implement it.  Perhaps a single global spinlock to protect all 
the aio pathways (or all those for a particular gadget) would work.

Alan Stern
