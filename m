Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795662948;
	b=WtJQa3wQ6EVVrTfd8U+9rocTt/1d5BBCpkcKSS9RCvdmY6EMK6TjaYXV4ihnyXZyo6S1
	 DUgX8nF5XKSqxKoBdm5/fPAn9uL9lKlP7DGQ2iseObaN+8b0Gn0zWC5c5MEJvcqZvdRuU
	 qAjdRW8SZzS6sULamuU6/8Ji20so+ixBFHAPg2jxk0hIVg2Zp+FZEOc90F6hGCJjI6rrs
	 /BD8KC57c5W9du4av+ZINmL70aKWCdCDs89HmbP4iEAsYoHX1ZyCP3Hp7ciuNqr3tKajt
	 4FRSaH6EfZDgAXLC2zM3mr5nSoGiRjo7ffhViBL8toYeY5GWn8L0EKRXenc/jcGdRCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Uz5Xnl2AfSCtii2DAKq2bHJm7Z1k2Z78VEojlr0dwow=;
	b=vIqXDE7kzm7pONKMJgYzRdGOVkC06Vc5iCG1hQocPz32Xs5a4vUSmV7PFzOv3Vt0wpOk
	 bNKiBRqsMgVXfwNtfLfBktJE6xZfG2FAM7pwi8tdXPEM6JAS8MHBsjzQFgVfhmi6Y7ohH
	 L5MiDxYnhfdZ8osa5CXWOFQHzkB8acPhWX2W+MdYCC9w1BfIxPXAQv7bMD/47OhYbiyOL
	 Er5MDKI9JbSO6sdzC/Wxx0gdlgPA2QVRH5jwTA/fTn3hBRf2FEB3Ij3RhXyKclNsBox8F
	 lUDKt8jjRB0WjEi1P5LGoMTimUASSt4Mss/c31Sv4Gkg2pj5/Mp20A7RYG0hOdB4I4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="lXX3H1/A";
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37817606A682
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 03:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37817606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=lXX3H1/A
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9495e8ae239so723167885a.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 19:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795662947; x=1796267747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uz5Xnl2AfSCtii2DAKq2bHJm7Z1k2Z78VEojlr0dwow=;
        b=lXX3H1/ADsjXeAjpJPsORX6gkMO1WFd7JCpJ6lgGjADil6c1A057LJ3NCN3g7Hik/o
         2qjv9+FyuyBMeCQJldxkVXJiqcDbmc3NmNVpPxfOr3g3DUguVJIPADkT24y9Xo15ZfNc
         qb84dA34F/Ffp4ihgEOLh7ug+KTL8zKkv4qy+DQdWlRG1Q2iFWlHOuxS2p6CtJEX8jzv
         BurKCmvMNAYVrD4CEduefmdA7eEAX8CmPGmBhJDmpJqOmsckacy/Jg/2wjG3XEij3StU
         cOSU4Uh6jJvq+2MXX//EDy/Gg9jH0DkV+Ch6Jc/Nz/Ws20CAju1ljwH2qAk6GrYyfhM8
         rDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662947; x=1796267747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uz5Xnl2AfSCtii2DAKq2bHJm7Z1k2Z78VEojlr0dwow=;
        b=ZPp3bJA6So29Oqf/ZZA9ACUj0T0y6a5lRLBZ6UaaUSlNzMOH4fsuxNVjcztVE8de5b
         kLQGIHK9ixnI9PK9+12zDDDEh7YxdhhA3CRRg4wWd6cxYceSB5SmCV2Dn6xpY4JDaE7W
         DqNJIFUAKuMcqDGWtTGP+jzpRSDo9fY0Jyna0Ve619DW6JT/daRP4EVEloWP11buaqqE
         9nc7f8e2VZCDaQ3wIEfcMG2wWZylc3vZR+btStCn1+kgB1+ShDysqZOtIhngnLADPHyU
         nqC3icweIpCh6sN9Oac0EspY9w21l5wYhcMlNmDCwy/ujZNNUhS8pD4b8oCsMSxhj42l
         aq1Q==
X-Forwarded-Encrypted: i=1; AL+hErG9o4i4H/TWVqUXo9wCZq+5uKw4N8KDWUBtAMXUbnegxPteLUxlGpBB983a6sBnQfvTOlwbgLi7GgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hanv/uXOzJhRvei/1rM7ctV3ZELnjn6sxDr+TD2BiCxfBpLIs
	16oZljp2/s6fPWITvn7o3bjsaUKGb7EHRErKKJNk+zwwaR+c6mvRGwBtJahOhIRWlA==
X-Gm-Gg: AZFdTZetNN2xNyU2p3WkMJi5IhAxCCMWXkekvLPaTqnIdFPSmknXE6OY7y2maljHOZA
	SqgsEkoy3HXVRQs3VKpU1eqithjuqhBWQtxuMNDIz26/RfLAg0dC7lG7VweQsViPIHKpK0NT3aG
	GZxlHYMZzhQh2jp1rEhPJbdx0oz7xoi8N/gBbhk8QnbBEsAOz8rrAOWrjnVQL7GPJRUk2a46c2/
	tHa0NJ7DFvRek4qmglMmUwVe7svQCs4iumq8JtXexkHAX2YgevCR/TNdAIQMTvGww8Yi0S1SxYp
	X5Hhl5PBH0C0uKm1khiQaenExHR2rdauAY6Rq3grq3/FLY+XjlrBOtM8xizCSt9XSQNWwbcPcsK
	oEGBg5A7cB0orH74xnHahfeU7df67gyXIwgvXZsO51uvQBK6scbc/tn+G/9wqhCwwkpomccOgBx
	h/3o2A/qsGA19C6xrZTfoPgWuYnJqWfoxy6fKdV+EJvqUGq5lkpIeUNFAsBOo05TtLuhNeLKBZ/
	ZRraeMCoIaXzj2Gk/lG2SLxgADJkSGADsOO5SPIAdAgf6bRb6o2a3NJfOnSo14HmakAUZUW/hII
	Ly4P8uxFaAGj19s4iuU6SUjqbA08UA==
X-Received: by 2002:a05:620a:2605:b0:949:9f1e:d8b with SMTP id af79cd13be357-949ba99cb12mr3436849885a.16.1795662947036;
        Wed, 25 Nov 2026 19:15:47 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::9a34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca846322sm1290787985a.34.2026.11.25.19.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:15:46 -0800 (PST)
Date: Wed, 25 Nov 2026 22:15:43 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: kayano050408@gmail.com
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v8 1/4] usb: gadget: gadgetfs: fix ep0 request lifetime
 and buffer races
Message-ID: <b71d58f5-ca09-4f11-bac1-ab9720cac5dc@rowland.harvard.edu>
References: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>
 <20261110-gadgetfs-ep0-v8-v8-1-8f90434574fe@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-gadgetfs-ep0-v8-v8-1-8f90434574fe@gmail.com>

At last, I finally got some time to go over this material.

On Tue, Nov 10, 2026 at 12:13:22PM +0800, Jing Lin via B4 Relay wrote:
> From: Jing Lin <kayano050408@gmail.com>
> 
> gadgetfs_unbind() frees the preallocated ep0 request after disconnecting
> the gadget, assuming that no I/O remains active.
> 
> With controllers such as dummy_hcd, disconnecting does not necessarily
> drain ep0, so a delayed userspace response can leave dev->req queued
> when it is freed.  This triggers the warning in dummy_free_request() and
> a use-after-free when dummy_udc_stop() subsequently drains the endpoint
> queue.

This is a genuine problem.

> gadgetfs_setup() and the userspace copy helpers also race on dev->req
> and req->buf:
> 
> 1. ep0_read() versus gadgetfs_setup().  A delegated control OUT request
>    is queued by gadgetfs_setup() and completed by ep0_complete(), which
>    leaves the payload in dev->req->buf and sets setup_out_ready.
>    ep0_read() copies that payload with copy_to_user() after dropping
>    dev->lock, so the copy can fault and sleep.  If a new control
>    transfer arrives during that window, gadgetfs_setup() reuses dev->req
>    for it; for example, GET_DESCRIPTOR(config) points req->buf at
>    dev->config.  When ep0_read() resumes, clean_req() frees whatever
>    req->buf points to, which is now dev->config.

But this isn't.  Or at least, your analysis is incomplete.

The real problem here is that gadgetfs does not handle "aborted" 
control-OUT transfers correctly.  The request for the OUT data stage is 
submitted when the setup packet arrives, and the host is told that the 
transfer was successful when the request completes correctly, but the 
user program doesn't receive the data until some time later.  And if 
another control transfer arrives in the meantime, "aborting" the earlier 
transfer, the user program doesn't ever receive the data.  It's not good 
for the host and the peripheral to disagree over whether a transfer was 
successful!

The start of a new transfer should not be allowed to erase all knowledge 
of a properly completed control-OUT transfer until the data has been 
read.  Instead, the gadget should NAK the new transfer until then (i.e., 
not submit any request in response to the new setup).

Fixing that will be a fairly substantial change.  Furthermore, this 
whole issue is so entirely different from the race involving 
gadgetfs_unbind() above that it belongs in its own patch.

> 2. ep0_write() versus gadgetfs_setup().  For a delegated control IN
>    request, ep0_write() prepares dev->req and copies the response from
>    userspace with copy_from_user() after dropping dev->lock.  A control
>    request that arrives during that copy can point req->buf at dev->dev
>    or dev->config, so the userspace copy overwrites a descriptor buffer,
>    or reset req->buf to dev->rbuf so completion calls clean_req() on the
>    wrong object.

It should be possible to handle this problem without copying the buffer.  
For instance, the user data could be put in its own kmalloc-ed buffer 
instead of in dev->rbuf.

> Copy completed control OUT payloads into a private setup_buf in
> ep0_complete(), copy control IN payloads into a stack buffer before
> preparing dev->req and leaving STATE_DEV_SETUP in ep0_write(), and track
> buffers allocated by setup_req() separately in dev->ep0_req_buf so
> clean_req() never frees descriptor storage.  Ignore zero-length reads
> while a non-zero control OUT data stage is pending so they cannot queue
> a status request early and clobber setup_out_len.
> 
> Submit ep0 requests through a shared queue_ep0_req() helper that tracks
> dev->ep0_req_queued and wakes dev->wait whenever the flag clears.  In
> gadgetfs_unbind(), tear down non-ep0 endpoints first, then dequeue any
> active ep0 request and wait under dev->lock with wait_event_lock_irq()
> for completion to finish.  If the controller rejects ep0 dequeue, keep a
> reference on dev and let the completion handler free the request when
> udc_stop() drains ep0.

These descriptions are a little confusing to read, because they mix 
together your solutions to three separate problems.  Each solution 
really should be in its own patch.

Also, don't worry about a rejected dequeue call.  In practice, the only 
reason such a call can fail is because the request to be dequeued has 
already completed (or was never successfully submitted in the first 
place).

Alan Stern
