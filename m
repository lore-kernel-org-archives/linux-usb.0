Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795663293;
	b=Yyaid/dNH09xJiElG99ktEIwm8hy9PAvZHH0kd1rpWQudhyixpi6QRp1oKK8b8NIUabz
	 NOJHJnGhqnou9x5BD9hylMD5hcz+TlIWsPrf16sZQLvcPpJDCd68mElMtSw5EOnNqfwX5
	 nSsBZG8ITqDZTbCS977KnAO2z06D+7pfQFfnPR3Jd2+SKzZVtpf6VqYlbaanKlqJYve4p
	 P6klW3xM95jWOGdl3FnvuzVOuE+SaY6fRwW2wqg4zVqzhBnkuCRnXIQr5DqEmEvEv1W/U
	 g3WiDXoj5z8UeCLVsj9eKBhyvm0uppjTJwHlrTWi0PaERLT7w1jQ4qAGfme2hXXourg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=c8Z6DV8gdGWeEQmibR6f0uelgWz6UwbDwMuOqZtOlGc=;
	b=E5sxsUThYwt1zV+4tym6pcYBKEoM5osvk1+LStiPPW36DMOfyphxxzEwLRQPlQlpIxgA
	 aUy/WfpUJAqYODh23/esiyi9dwAF/i7+yD7kGL5M14ND5Z815IGneRJKd+1aDvK1c4SAh
	 0bwjTEHP4hC4ZGPngg64GR059ONwW+6XHZ5BjIXWz3jrUR2G5SfCENAwUGvg4o4RfS/JO
	 XG6n1DhS6/LdJmoJLpgdtYpCkY1K93BcHkDYJ/RtmnvpP5Bx7f5xOUlnmbu3/GV6ftGIB
	 ypS2erhkWb2zSpkpuzApQWdu3c8UEIVxn7lYY54VJEk0VuUis+Ny1St8C4Qb0Rjzd+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gsc03Yx1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B6C606A323
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 03:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B6C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gsc03Yx1
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50933bdf4bso1239595366b.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 19:21:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795663291; cv=none;
        d=google.com; s=arc-20260327;
        b=ojr8S5T0YbTIuWgwdDP8xZtACOJV5+vsaufwnb9juuJtB7u8iymicFXiTdSxuZrsj4
         zYMlfxl68SIhMrpH3RJyLHYEhC1bdAzFpNdMId4qF4FUrHtMhFZeVWnT2BeUOM+psYeE
         vSERGR0/dWhY1RoWbni4wH3rVsEkXArcQGwClWrJ70yJJE470kQzMrnhC/LcNisMlxc1
         pK/hFPSwFFvDcDESR9tjS+7g9d9M9mCObmXWbap2xJpfQvpUwcJZpQI3yrwlE9Zlaicl
         cGRWRtEsWaqHfrLhYygEzMWpSeHDC7+qkkf97+ZumDwmkaYsFhxswPhDI9baqu3DtR18
         y+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=c8Z6DV8gdGWeEQmibR6f0uelgWz6UwbDwMuOqZtOlGc=;
        fh=HkuNS8kBAzJZskknuG6IomgZ2ZJbyXSxi6g+5uGqet4=;
        b=rzYVWiFh0l6oWEEN1GPqnxSk1mvBh5i/W1rRIR9LE3/HZFQOjRwV8rmagoyiD0X3Bk
         gW0YIAz0mv1z2FbqVv8Ms2nRg6Cso9BisK3ngjTtBm3gIrS1iAYbiS0m8IcpFFd00loI
         jFGhVsQYSl7BKTNqV0LvhbxNqYTsbo1Jk09xk7a5GJU4GCUdldQVsURj8rPj0BRJFzaU
         uFW5i70ROzJ2luMq5FE1reBTKvTzAGee5ThEX5yUOZ38nHzXtY4KB57Z0irhC//ivshK
         wbpYwDrUJU7Ig92c9AuTI6C76ZOHsIa2fYDQeSHez2BtQbBTC3ZukKwgYYDiNn3mJf0k
         EKVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795663291; x=1796268091; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c8Z6DV8gdGWeEQmibR6f0uelgWz6UwbDwMuOqZtOlGc=;
        b=Gsc03Yx15dzhHpjYTTT2Inubjt3C5ks/2wkmp0ycXJ371FUNAVlo82xZYb3++gLGZz
         Y0O4M40FHj36/yWp+t3Zpa+iAAHk4zOoZW6lkuMimS98XQXWjTR9fN8AM6Qc9mXr7IIa
         1tV72ZRHzaZZoh5tRi1cPFmmP4zmvkCg9AzZRykk/+tIkcJhN3ET2DyjUZWz+Xifzl4W
         h/c62sHVsBG+FRC5XBnrwhewQejhe0WpBEwYjg/DlPxcLtP2fTm37b+2Xg6ibgDCf3C9
         eCHQLeVWIitXYod/uGRwXdK6OkZEZ8gNb1OvK4KHOXWhuOGGZ76W8nH1J/YSJBehhgJu
         TZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795663291; x=1796268091;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c8Z6DV8gdGWeEQmibR6f0uelgWz6UwbDwMuOqZtOlGc=;
        b=GZFo04UCwaII+PDGi94D6aQnCumVLvp/ZlzMNQNhB4xwjL57V6F3xwsmk0buQ+afh/
         svyw7vCu7CWE9Oo+N7kcpHFaGejRwk6EIVeLPG8nLK8SSw7aA6eWOIzmucDkLrYRZgVv
         o/T5plAXGBZ9/qPC9jn/zTqlCSM3pkvmNVTeYZ65S2W9LSJ0z2fwdK3tXSkCJbrsA92G
         YfYa0z0owTw+BwM6czQORccWjvOfJP61xBbDRkaWeoRcbqFdlSBZQXtGbwsJlWWeaWL9
         OjISEG4+91p1x83kmtHTo7nMPI7gj8Q9BEmdsE4iRRtXQ2VBeqChW115yWRJTHNdynD4
         JIdw==
X-Forwarded-Encrypted: i=1; AL+hErG4JWmozISYuNv3Vdot2YOodNEXUQaZ0TunTujRnKGSe76eIqh/9iprhOCtFl7WudTP0Oo0rjv19cA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bzlZGzBAUiFSkegSnx4O6s8smAEekNasqjqLckUUCkgHKyNtK
	2iAeFm5D4d5AcQJTqedc+3Ks2JwwkWtrjCgRuekaLhyvYooGSzT/5/ou4mbtqfGllJ/2vl7XKkS
	hSGDGURNAzYqDd4x+Y8hr1rq4aOpXgYA=
X-Gm-Gg: AZFdTZeEbkDR6b8p7MlD9r393CBvyvUTuvvAzT/hkrm4ErwJZf7k+/LU/hvOK1sYXWY
	LdwV/1QqeMRpX6P3dE4pjO9qLip5UdgWbl+5l4pSomsPDk5t7yThgFfWxRTbDQEHV/Vyp4rqnP9
	Nl7EFrDuCKCODM4Hc588lQ/5xrZJs/gerB7RvESLrCfZsKRnIQxUj9bwBMzSowDSoJJRRDbqmmR
	toBHcHcLRfUsqO1qMqjEMXlvGpOKH4i+QSEDyd9atQhBniK6CNJU1+F7H4PdjYJ/S5UbSQdWMNp
	l9inyEKlq+0dJ5nMrmNai4RRJ8ZEH/oQr1xlHi8JAkzirJ6jdefDVfzPYXkQrWLCuVPKp0xhwQz
	AqpsGOQtYU1tIqILbEeFsI2rvey9tBSXw1E9+Mo9TUrHhn3Gi
X-Received: by 2002:a17:907:3f18:b0:c46:9711:e30e with SMTP id
 a640c23a62f3a-c5131a1601amr1679769266b.29.1795663290899; Wed, 25 Nov 2026
 19:21:30 -0800 (PST)
Received: from 138594053405 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Nov 2026 22:21:30 -0500
From: kayano050408@gmail.com
In-Reply-To: <b71d58f5-ca09-4f11-bac1-ab9720cac5dc@rowland.harvard.edu>
References: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>
 <20261110-gadgetfs-ep0-v8-v8-1-8f90434574fe@gmail.com> <b71d58f5-ca09-4f11-bac1-ab9720cac5dc@rowland.harvard.edu>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 25 Nov 2026 22:21:30 -0500
X-Gm-Features: Aa3M54rPL2FamNAEIXP9ZhIRzp-Iokuf5xZugLV3IRMpHTKq6sQUPeDjJX4LFko
Message-ID: <CAE2LCh57-f27Xk6NX+q-agg=h+G7vzg7ydGdP7s7tdRTYpyStw@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] usb: gadget: gadgetfs: fix ep0 request lifetime
 and buffer races
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Neill Kapron <nkapron@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alan,

Thank you for the detailed review. I have received your comments on 1/4.

I will wait until you have gone through 2/4 to 4/4 and shared the
remaining comments, and then start reworking the series based on all
of your feedback.

Thanks,
Jing Lin

On Wed, 25 Nov 2026 22:15:43 -0500, Alan Stern
<stern@rowland.harvard.edu> wrote:
> At last, I finally got some time to go over this material.
>
> On Tue, Nov 10, 2026 at 12:13:22PM +0800, Jing Lin via B4 Relay wrote:
> > From: Jing Lin <kayano050408@gmail.com>
> >
> > gadgetfs_unbind() frees the preallocated ep0 request after disconnecting
> > the gadget, assuming that no I/O remains active.
> >
> > With controllers such as dummy_hcd, disconnecting does not necessarily
> > drain ep0, so a delayed userspace response can leave dev->req queued
> > when it is freed.  This triggers the warning in dummy_free_request() and
> > a use-after-free when dummy_udc_stop() subsequently drains the endpoint
> > queue.
>
> This is a genuine problem.
>
> > gadgetfs_setup() and the userspace copy helpers also race on dev->req
> > and req->buf:
> >
> > 1. ep0_read() versus gadgetfs_setup().  A delegated control OUT request
> >    is queued by gadgetfs_setup() and completed by ep0_complete(), which
> >    leaves the payload in dev->req->buf and sets setup_out_ready.
> >    ep0_read() copies that payload with copy_to_user() after dropping
> >    dev->lock, so the copy can fault and sleep.  If a new control
> >    transfer arrives during that window, gadgetfs_setup() reuses dev->req
> >    for it; for example, GET_DESCRIPTOR(config) points req->buf at
> >    dev->config.  When ep0_read() resumes, clean_req() frees whatever
> >    req->buf points to, which is now dev->config.
>
> But this isn't.  Or at least, your analysis is incomplete.
>
> The real problem here is that gadgetfs does not handle "aborted"
> control-OUT transfers correctly.  The request for the OUT data stage is
> submitted when the setup packet arrives, and the host is told that the
> transfer was successful when the request completes correctly, but the
> user program doesn't receive the data until some time later.  And if
> another control transfer arrives in the meantime, "aborting" the earlier
> transfer, the user program doesn't ever receive the data.  It's not good
> for the host and the peripheral to disagree over whether a transfer was
> successful!
>
> The start of a new transfer should not be allowed to erase all knowledge
> of a properly completed control-OUT transfer until the data has been
> read.  Instead, the gadget should NAK the new transfer until then (i.e.,
> not submit any request in response to the new setup).
>
> Fixing that will be a fairly substantial change.  Furthermore, this
> whole issue is so entirely different from the race involving
> gadgetfs_unbind() above that it belongs in its own patch.
>
> > 2. ep0_write() versus gadgetfs_setup().  For a delegated control IN
> >    request, ep0_write() prepares dev->req and copies the response from
> >    userspace with copy_from_user() after dropping dev->lock.  A control
> >    request that arrives during that copy can point req->buf at dev->dev
> >    or dev->config, so the userspace copy overwrites a descriptor buffer,
> >    or reset req->buf to dev->rbuf so completion calls clean_req() on the
> >    wrong object.
>
> It should be possible to handle this problem without copying the buffer.
> For instance, the user data could be put in its own kmalloc-ed buffer
> instead of in dev->rbuf.
>
> > Copy completed control OUT payloads into a private setup_buf in
> > ep0_complete(), copy control IN payloads into a stack buffer before
> > preparing dev->req and leaving STATE_DEV_SETUP in ep0_write(), and track
> > buffers allocated by setup_req() separately in dev->ep0_req_buf so
> > clean_req() never frees descriptor storage.  Ignore zero-length reads
> > while a non-zero control OUT data stage is pending so they cannot queue
> > a status request early and clobber setup_out_len.
> >
> > Submit ep0 requests through a shared queue_ep0_req() helper that tracks
> > dev->ep0_req_queued and wakes dev->wait whenever the flag clears.  In
> > gadgetfs_unbind(), tear down non-ep0 endpoints first, then dequeue any
> > active ep0 request and wait under dev->lock with wait_event_lock_irq()
> > for completion to finish.  If the controller rejects ep0 dequeue, keep a
> > reference on dev and let the completion handler free the request when
> > udc_stop() drains ep0.
>
> These descriptions are a little confusing to read, because they mix
> together your solutions to three separate problems.  Each solution
> really should be in its own patch.
>
> Also, don't worry about a rejected dequeue call.  In practice, the only
> reason such a call can fail is because the request to be dequeued has
> already completed (or was never successfully submitted in the first
> place).
>
> Alan Stern
