Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F14C296BAF
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 11:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409626; cv=none; b=T2/97gwkdxzoOo4feThA6ZWdV2jZqhW7lUrxziOj+/Msg9Vgwo/KJtvDqjOzeoOBRPHkh6XD5gIi2ZBlP0otxl70rqG2DXqUEv0/FqsVopZBjXEGxCcQP4DGOdNxB3zt00Hxe++11mHO7k1IQRbGcHCyJOLZucXPGnwkN2tPCDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409626; c=relaxed/simple;
	bh=MCvx/liH+QWYC9w9l7ScipNlkkGbuuEP1S4f1lQ/Z5g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kdT1Ore7G1DEqh5zuTSbWqY5lnxEp9yvwffWSvAvyKCwjp9wV6COlFvUR5E1mHWpQgQbafsBmBf3Sc+zT5AWk6PUsJ+P7XDhGZC09tko5IPeGIsCN3Zsf2FPcvR3q1vm/quToIojBJZyym+Tt5BwYm0QGP8jQjaPaN4RdF8NXuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q23y3ezj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q23y3ezj"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954aff6088so18279055e9.3
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 04:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785409623; x=1786014423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=02ga3YcOi+50NK/Ok8nql2Xd9RN5dYcI/fXUMAM8IMk=;
        b=q23y3ezj8d/m/8dWMhbfUAGtL/84kbuRSrvxEUWXFW4+h6xa87lD9+2dmZkoeFiwS0
         tFgOZF+1im9xVeKeqws3woh5qItX9kusVK7c3N5z+EUEfu+1HNjHdNcnlz7b7Yyh5rS1
         KR+IL3A/GQ/wbxECloNcl54/BiN2vGWOPgWTVFpPO19gF/pOIs1FPCgw7Vvw11RSaNar
         BJeYNJETpdhX8si+qg/SI4HXCYl664k54OJROX4xC6Bk9hCH6Rhwu6xgX3N4bg4zhsGX
         qHbZ+0mi2bkurL9+/SxqpHzxJJkQrnOWAjVVUP1bvk/bqEtg6kr3miInaUoWHDrmKOel
         yScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785409623; x=1786014423;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02ga3YcOi+50NK/Ok8nql2Xd9RN5dYcI/fXUMAM8IMk=;
        b=VTBnJ+ugVpHA9FzFvPi8HUVANo1iFEIqjmaHMkyMmBufMIoUIEZtVfj7grIM0HYzH4
         nGZALd2tegOBX1PbfZM0mq85zqmb8Y0qir3qZ/LaJBQIA7nw+DQN12yKjRrn2PW47A11
         Xq4+15HjnsW4di9BLUBZW9elv+42zUIWm4cmnGvg7lENoQ5HoTTBJTbXPsHKI4aoBNKI
         BVj5efHmu375gkHMs19OlGyf0f3gQ9eSbAfMLWXLwhvN9FaQbgrJ8wi/1Xdab+roxgNB
         UaDKHiQQkkVpEWJDNTg1lLp0q3LADSFnB0Lf8EKQrUFAthlHKb3ampTsHXeywAqPvhYM
         6mIg==
X-Gm-Message-State: AOJu0YyE0qM7dnBFHxqRCk8KLTFXhguaVvjKUSy48PPyHE4Ln5ipKqFs
	iK6UMLmS6HDIEaF87hlzBj5tcT2vrXCuNggn7jbb6Tb7J7nA5+qEpvr1
X-Gm-Gg: AR+sD13YIIFDHCYajX9J+2o6d88xfSjIQ6ZzK91XcQoYudqA9oGtgeh4nD/YjbvVvoe
	YXP9F6VkJwq5AVNGyxHRzg0hpW9Pejdeu93VsISfESPB2u9oE56PEB10+/+pFOnUAMlPspNJ7KM
	HB1iv8hZDKzhnO2CIXZmxR1kVVLDwCBddMr2mB3aNFzu94zMSsYQBz1a79pXjlO5cjfhJFlVv/C
	agx2cJOtHU0EQ1/U91oncdvinoLZ0ZppQruHLYp+qB8082EqnNjpDfdBluT+aaEOzwBCNE4NSyX
	9sOZQKPnj6lUOHshckv8JBd82BxZatUjeRSn5fvy8xpey+p8hUnOublVhfk7BjtjxeLe38/ycU/
	6mULfb2QdGVc4mTM9zUmTae2goI7yLuoQr22kjRGhrVHSyapYg5+1vsy/LRwew7K0ZJZEk6nbiX
	jd24doWGAgY5vGv8vJ4pr3pSfAksazAZwoZfMpfPRuVUMkiXJLdIyZAvTlXnACO+13+btgfA==
X-Received: by 2002:a05:600c:4e46:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-49800e6d495mr30201745e9.2.1785409622422;
        Thu, 30 Jul 2026 04:07:02 -0700 (PDT)
Received: from foxbook (bey56.neoplus.adsl.tpnet.pl. [83.28.36.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010aaceasm52531145e9.12.2026.07.30.04.07.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 30 Jul 2026 04:07:02 -0700 (PDT)
Date: Thu, 30 Jul 2026 13:08:14 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Bart Nagel <bart@tremby.net>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <20260730130814.65f7891c.michal.pecio@gmail.com>
In-Reply-To: <ampPGn-3C9PSEZQz@spiral>
References: <20260723081440.0228c59e.michal.pecio@gmail.com>
	<20260723081440.0228c59e.michal.pecio@gmail.com>
	<amJ9jAtK8rNWDO7V@spiral>
	<amKUdIRBrsFiDTiV@spiral>
	<20260725115956.321185a1.michal.pecio@gmail.com>
	<ame6T_LjiJBeJ2W3@spiral>
	<20260728003131.085171ee.michal.pecio@gmail.com>
	<ampPGn-3C9PSEZQz@spiral>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Jul 2026 12:37:01 -0700, Bart Nagel wrote:
> I didn't seem to have the "before" blobs your patch indicates in my
> repo and it didn't want to apply where I was (at the first failing
> commit) so I went to 6.18.28 and applied your patch there.

Sorry, forgot to say that the patch was made for 6.15, but if it works
on 6.18 then fine. The alien blob IDs are other (unrelated) patches.

>     [  340.443735] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 10aea6260 td_dma 10aea6270, set skip flag
>     [  340.443740] xhci_hcd 0000:00:14.0: Event 23 for old TD end DMA 10aea6260 after 7us
>     [  340.443743] xhci_hcd 0000:00:14.0: BAILING OUT
>     [  340.443858] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea6270, set skip flag
>     [  340.443861] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea6270, set skip flag
>     [  340.444110] xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 7 ep 2.

As expected, ep_trb_dma points one entry before the first pending TD.
The driver would throw out all TDs searching for the one which doesn't
exist anymore, but we prevented it and later recovered normally after
getting some event (not logged) which pointed to a valid TD.

So the fix works, maybe with exception of one edge case (see below).
We could potentially use it, or revert the bisected patch (it was only
an optimization, maybe nobody will notice), or add a quirk for this
particular chipset to ignore ep_trb_dma in Missed Service Errors.

Long term solution would be improving detection of events pointing to
completed TDs and/or not skipping when we don't have a sensible TRB
pointer. But we also need a "trivial" fix for stable kernels like 6.18.

> Missed service interval messages do not always lead to a "bailing out"
> message, like this example:

These examples are not interesting because ep_trb_dma is zero. But we
know that it can be non-zero and the driver still works (sometimes).

I'm slightly curious what exactly happens there (probably MSE after
Short Packet on a single-TRB TD), and whether Missed Service Error may
point at a Link TRB, because the current fix wouldn't handle that and
the stream could still hang. So your failure rate may actually be
reduced to 1/255 of what it was, but still not zero.

If possible, please boot the patched kernel again and run it for
a little longer. If it fails, post dmesg starting from the "Miss
service interval error" line which is followed by "All TDs skipped".

And while that is running, also collect another log:

cd /sys/kernel/tracing/
echo 1 > events/xhci-hcd/xhci_handle_event/enable
echo 1 > tracing_on
grep -B5 Missed trace_pipe | tee /tmp/trace

This is supposed to log 6 lines for every Missed Service Error, so it
will grow, but not terribly fast.

Regards,
Michal
