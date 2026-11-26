Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795675218;
	b=iXIPdCJwR1fcbrVY33z6GI3KVuw/YeZoi7B3Nhs073v9cu4Z+gnOkpdA4omqF1bsiINx
	 tyF1rk9bWatger4FgP9XFEJcpzHxJMWFrIvE3dhFryTHM5uRVV39maxxOzI5Xnz9fmn6+
	 C8HnfxDjFddR3bcwFDGa/KE3cGrwRxBN93phmEbY81HGYsQsaX8XRHQ9f9h6jjJZwCZcr
	 A15E57W8m0tkbd0r7gMUP0xbpvyYHRZX8YgnFCWJqiNFkzV5Z/sto0UA0hF1nfvadJAHB
	 a2ZgWV+7rmd31+j/Y8uMTmMn1LeFaTQVilo8gaUpPzwa9qgOp0Alxcc02Zc8/bSjFeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=OLlhHVUzzhl/e/Uoj+6AVXD8QxJnJlUHQHiSgSprbbs=;
	b=LWKkiZZBwR2+YxgLiLk0AXMiNrEZ4IKzZNkvTYcvU5QS36eHYlqb7yF6nTrQMrVALCnB
	 02MQdtyZi+rkYrrNmAh1NTTVwyJDIRTP4ejZbRg4OWrOJd0Xtw+B1/gIhlmDps2yhB2/u
	 wcLO5RK+SYT6wk3EFNyH35bbUUhS7G6PqlszbcoCiQESCgOVOLXvqmIyowWv67UDW0yeZ
	 tYRgoMuRpUrLEAfdW76HJTpmQJT+oZCbW21XNs3lvn0xcQCYQsRC1leikQq8Mv/DT9AQt
	 /3jcLxPugQfV5kH0mupFX1BO9GBY1hkzFRDHNkpH7qnOQjmwngRA1rkDABUYleEHP6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bn6VIDmF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCDF606A327
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 06:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BCDF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bn6VIDmF
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso8387692a12.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 22:40:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795675217; cv=none;
        d=google.com; s=arc-20260327;
        b=XX163Td4BjLrxs3u3AYU1YHU321VEkwjl/P1/70fAMtflg04tUQyo7n4zc8xrFKBh7
         YR+N5/H04xK7cQ+OA9fxq3mOvrwEmDQqPZntTU3eVbYWsplKwCvjqMulpsZb0HItNBjl
         IZTd/DnjKQBy8krWcz7f0l7JzhFXRy7ULDF1PbccvaJWZKBfpeCYRdZb6QlFpS9GBys0
         4ZrJ6KZzyO2vtgSLtW9bqKidmr4sEuZLyWO/4375liabjlfftZU3PmqAL5RJLGocAefB
         0cEKAm3KHtf2HZy4SsXDBKvONCRW45AkH7mWzCMUKpUefDjYmAGMU/M8XswGPMkoRqJA
         9HWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=OLlhHVUzzhl/e/Uoj+6AVXD8QxJnJlUHQHiSgSprbbs=;
        fh=2VorLSnS7kWXPLjtCP4Ii/PoG2tjko6KUh2VMxpo5VQ=;
        b=dtrUZHj793kUEvUfnizC4Fb4kCctEhz94h/Smi70PWPzI8GGDoXUsGJMuCiFLBkbwz
         yJ3v5/JWoG4wvmG7IoUR7FKPxm1PQVSLqHBlDuyPN6gSlM495xSsILD596qFUcmUuotf
         8A0FWlzwxqMWpXApMFrEmB1tpYZMJeM7iuKxuVk4CWDgXbqVCcz16flnBc/BiBRlbiRd
         HyLcdIAGS3zsxPzdlDapT74WVvtA5HvnizfJnIgKKAp3M0BHr5aOWxryIVrRyEyBn7Ak
         92CXck0QfUfOgjZMvwEJHqRn8Y7RMmSmPI8xZQZVTKnmYZSUk5rrpiqIUVq+kgPhAZq6
         7RNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675217; x=1796280017; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLlhHVUzzhl/e/Uoj+6AVXD8QxJnJlUHQHiSgSprbbs=;
        b=bn6VIDmFclLaHVmyoTcCKsdk376RBGJfQSlfrVnXcOMK0uT2C1geTxawRNtLS2LFeX
         TVj8Vex3qbuWnDJNaX3ddgDpapK56K4dzGr3wQ5tKwCPGw0+zVdFjflahZ73e5ecetTR
         EdZM1Puwg3FnFTlXQ/l/YdBT1YaaJ4KjRkEEN0NkCYD5KfirbUb82TtZorVCofNgS+aM
         tYtKpU5u4YahIEQIRT7fPmZ9q8SUlvt6LhM418g17EYtV2m0KAdR9QPiAEYgZ6fumIvu
         bFYV+kA/EA/3Zo0aIsldyIul8LcC1N2hZVwAdL8GXUE06K7ZyoNzbsrNvcS7qQr+L9/9
         AJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675217; x=1796280017;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLlhHVUzzhl/e/Uoj+6AVXD8QxJnJlUHQHiSgSprbbs=;
        b=YJY1wdan0xBoiy2gKOXPSk+8aKXje/WUj5kB6a+Kt3oxHCaKKAS4HDBubtRBbNKixS
         5aiHyhh2Wy/5FUzx+KeyQn6cxMAejcrES6uXc127um4IM2jlgoG6NZJOdjtLqhK/jdA3
         nlix8xu88NPtWXNI/JHqm1ZIdpYHILdMCcMrHxmfcZqIAVCG7L2UPEjs7d3vGcRc0Bzy
         jzoZjR6yuKV/cZEWWhnh0j2N9MOI5oEtWJJHA1Mi0IHbd0fh30gKj/RXWlyJvwV3FuGE
         cpd9ZQgUk/IN6tIdxSDiR8m17uDhvqBLS0nxniaSgm63L4+U69ghEkTnmJ1iJ635LfLT
         PZEA==
X-Forwarded-Encrypted: i=1; AL+hErFRov8+H9PsgjZ7VeQ8JPx85BMVNYzVegNkMctjEG1hh98WQPc6kYuzcuzCakaU4r9Iov0NjTkppDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3fUAFFa0UH70k0qsezZmjv1qfdm5+JtL0lhIvVoyzizvgfdrJ
	WL7TJklCDrqzCCnlDNZ2zynUNY/YE5y4X2fTTD/F0nil5ceAeAptbprxRI3HbKWRT+tf83KB78c
	A8GBBtS0cqXuzd1iEF4yNrfgTl3EPXug=
X-Gm-Gg: AZFdTZfdgIBPKFw1aO9yhWKM2lD+ZZBK+y/V7GbLpFhLUlzLQBh7UQ536OtI9kWRE0l
	VHCTJ8/JKBVb/VYHOaH+USbPDfj1r8B3TA5sEgRhalK61U4PLMDV599lv0lpzQpzxGHZZyB+XJv
	SMQUAboZu87F4gPi7hPqrpyYxLtMQc5g8OLg+xtEnZ0gRFngef/zrBos39R+SQTMesy5KacQjL2
	f/YvshRbQaxpCXyz3sPyH+JILymtgSKanu/H+1Wu9zGk0HqAd1QmVhLlrZi6UuDBnG0gN8czPrH
	n3G2m7Nedib/Nzgo02bDKq1rlTK96eRNzVrdzuaP0juelQB2TCV33og4TbH+SvNlbl2fpuQRGov
	6CWeGp9M71V86O3afOTLvHJWG6+0502lO9JKAIIuhd6jAY859psVj3JRY
X-Received: by 2002:aa7:d402:0:b0:6b8:6f88:b642 with SMTP id
 4fb4d7f45d1cf-6ba37ee4b37mr10917094a12.44.1795675216518; Wed, 25 Nov 2026
 22:40:16 -0800 (PST)
Received: from 138594053405 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Nov 2026 01:40:15 -0500
From: kayano050408@gmail.com
In-Reply-To: <c304b43a-0a75-4408-8cce-9f4e6a1c5a59@rowland.harvard.edu>
References: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>
 <20261110-gadgetfs-ep0-v8-v8-2-8f90434574fe@gmail.com> <c304b43a-0a75-4408-8cce-9f4e6a1c5a59@rowland.harvard.edu>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 01:40:15 -0500
X-Gm-Features: Aa3M54p_hGWypFvnKMoE7_rRJeDe_ul9O64EUmW6OiF7e0KppVgARtJ-29DtBIE
Message-ID: <CAE2LCh5zMjVTGC3QH6QrMCbG0MhknHLyRK3BB-czrqPXU-C9MQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] usb: gadget: gadgetfs: fix ep0 setup abort and
 unbind state races
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Neill Kapron <nkapron@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alan

Thank you for reviewing the whole series

Regarding how an event could be read after gadgetfs_unbind() has
finished, closing the ep0 file descriptor is indeed the normal path,
though gadgetfs_unbind() can also run while userspace still holds the
open ep0 descriptor if the UDC itself is unregistered via
usb_del_gadget_udc() or unbound through sysfs at
/sys/bus/gadget/drivers/gadgetfs/unbind

In v9 I dropped the STATE_DEV_UNBOUND changes to keep the series
focused on the main fixes, and if you think that external unbind path
is worth handling too I can send a separate small follow-up patch that
clears dev->ev_next, wakes dev->wait in gadgetfs_unbind(), and checks
STATE_DEV_UNBOUND before delivering events in ep0_read()

Thanks,
Jing Lin

On Wed, 25 Nov 2026 22:27:31 -0500, Alan Stern
<stern@rowland.harvard.edu> wrote:
> On Tue, Nov 10, 2026 at 12:13:23PM +0800, Jing Lin via B4 Relay wrote:
> > From: Jing Lin <kayano050408@gmail.com>
> >
> > Several ep0 state transitions lose setup abort notifications or leave
> > the file descriptor in an inconsistent state when control requests,
> > disconnects, or unbinds race with userspace I/O:
> >
> > 1. ep0_write() drops dev->lock while copying an IN payload from
> >    userspace.  If a new SETUP packet arrives in that window, the stale
> >    response must not be queued for the new transfer.
>
> The window can be reduced but not eliminated.  After all, once dev->lock
> has been dropped there is no way to know if a new setup packet has just
> arrived.
>
> > 2. ep0_read() waiting for a delegated control OUT data stage only checks
> >    dev->setup_out_ready, so it does not wake when a new SETUP packet,
> >    disconnect, or unbind aborts the transfer, and can consume a newer
> >    transfer's payload if dev->state re-enters STATE_DEV_SETUP.  In
> >    addition, gadgetfs_disconnect() overwrites STATE_DEV_UNCONNECTED
> >    before next_event() checks for STATE_DEV_SETUP, skipping setup_abort.
>
> The problem will not exist once new setup packets are prevented from
> aborting older control-OUT tranfers.
>
> > 3. Early returns in gadgetfs_setup() on oversized OUT requests or a busy
> >    ep0 request skip setting setup_abort when aborting STATE_DEV_SETUP,
> >    while ep0_poll() clears setup_abort before ep0_read() or ep0_write()
> >    can report -EIDRM.
>
> These should be relatively easy to fix.
>
> > 4. gadgetfs_unbind() leaves queued events readable in STATE_DEV_UNBOUND.
> >    Delivering a queued GADGETFS_SETUP event after unbind puts dev->state
> >    back into STATE_DEV_SETUP after dev->req and ep0->driver_data have
> >    been cleared, causing a NULL pointer dereference on the next ep0 I/O.
>
> How can an event be delivered after gadgetfs_unbind() has finished?  The
> unbind occurs when usb_gadget_unregister_driver() is called, which
> happens when the user program is closing its file descriptor for ep0,
> leaving no way for it to read any events.
>
> And as before, these issues are all totally separate so they belong in
> separate patches.
>
> Alan Stern
