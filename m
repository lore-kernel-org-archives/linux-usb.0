Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663656;
	b=Rz0r5Mo4DNx5VvxGVD/YTCyor5o+QdcU1jn81mW64cIboGpzx+6+iy8s+skhYNHduDYf
	 wx3oHz25f6t/gt15MVlnTZ828clkF1fr1fZbG9QpeN6NTNsawxGJnL5LpWfpvV4oWvRHs
	 G4rQi7YmZyVi4XqeOozxLne8q2UWM4sqEWd0fak3/36ye7JE8kBp1NxHn/esAaAYglT6P
	 Zp/TFDeciAzXUUXfPcJNDJzKzsL70OGTqfxP9xfQWfmJBBm9G0+RA7evVloGQVIKtET0S
	 kU4mbKLtLrUsoQxon4m223zwdHVRMV2EiFVz4+OX7LyFeOaLfHt7kliU4L7JI+02bdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rHPmMuoGHNMoQTUIGEVMgOH3fqXjK9wihPYFz2zN4Sc=;
	b=P+y58gOVgMZKhPccSRx6W52pLwl92TGic+HLMNeM45ViVugcPdnUQxG8uNZwAfLJ33pT
	 SMDM7jX1nFfJRzacB5gZOJA5AWtFkv7YaXAMOHtzqyDZjaACQE0KMSYbJQ1meNeBspHmy
	 7gaf8oV36H+amwdrSYsbQjeoYCjEDhHYFg3TweZo4GJBb59m9dX6L0To/lrZo8xh7h7W+
	 sy/qlMqdm/NhowuvpLBEvdUWI/fibJX7b/uyDk8bFG+LDT3CeOGkv+Sb05obY+ymb+wTN
	 An7rxfG3OZmOWY/vDLbCZHo/7nvawkTUQtmsUu+7PpCJgko2qSJA8qEzCYMxRu1aRRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=mOF0oNNZ;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB19606A321
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 03:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AB19606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=mOF0oNNZ
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55c48582654so72654131cf.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 19:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795663655; x=1796268455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rHPmMuoGHNMoQTUIGEVMgOH3fqXjK9wihPYFz2zN4Sc=;
        b=mOF0oNNZ7zs4Aflx2JGqonO8/xWxHuYidUjZ2cXNSL2HJFvmPErd+/XT/bwZ9/u19H
         rXwNWDgMgagZ4652a7bQon6GVV/l3rQPuI1FNb3FGlyxc++Kl80Fgv42QF3dpcdN5POD
         MZUOrP0XoID851f0LINFrM+XtrXg7KmU7VzTDHP9byeGICZuelsX3SCcWaDuVft98DUX
         9CGHs+ShgHJwvlYnTtIGMDBUFB0W5BHv6Jl7isdyWjjVuiODJGCmUcoNt6f7MfqTTFTN
         NSH6LbnlFYs5a8Gfni/3Pd8Py6KWWWFeZWGO/0S//hKen8TCG+OvxS71cyKESt5cItks
         U1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795663655; x=1796268455;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHPmMuoGHNMoQTUIGEVMgOH3fqXjK9wihPYFz2zN4Sc=;
        b=yzNLB/yPILhS72LGDJK4FDLQ8CH+kK1LrorJe6mf63gd768X6VCBE2R5egEJfZzdl5
         oBSzeiWrfjocAVjCJ3ZcQSIgIBCreL9VbrL1rfcEPTU+/dTBuHFqx49yNTaRKbZcPFeD
         a9sYBO4el3m19ihFNpSPhUEJT4cqtu9rXPIHZCl5IHzOf8uzgqLkPv4tDA7jhXUs3+s4
         QmGj6XCGnl1CoV3s26vdi0CzhewwQ27bjPY4epZfHV1EAMQv5PQoXwSCiRI3OIn8nrqB
         5bsjzW8ePiHwmq2PHf7pcj3SVu0G1L6kiiutqkZdeVqB3n3kO5SqtJ+HkgSmVD4UGO1I
         k3vQ==
X-Forwarded-Encrypted: i=1; AL+hErEQgqKEkwztizqQcPnuV/4B0gpQ+P82L0YPWs1ynOjQtzvt4STkYkCXZOCiAC4ndFyVpt//BEMRBLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zytzkz9wZweCxtt3qXCFzrK6tIcPtpRfLiYXwfXrXv+O6laaP
	MrpR8zLt8MpO3pVF0py4rYOLLtlaIPi9GyKkxRlgD8RXonkBo460bkivP8DatvtvOw==
X-Gm-Gg: AZFdTZdKj277vw95+SfHoopm3numkT8gu6gd8k9f51uJG1RJcV9abu2v8QShPaBONp0
	KTRJhBpEKiYSu7Lf8HxtyQpzR/C9POHgw0Dl+ureuV3224V9KiyW3TMZbFHKZqg+leASMR5YZS6
	piwOa++mKexVZ4aKnFjNp9YuxlxZrWnil1K45WGerbaMwiO8UVb7cRhLy0Y59ZiyPbPzIBg7v26
	YAlCd7kub60N6eWApkG9KrP7/EA2nm7NnmKsgTwCNc0KR4cyy3NUJrMbA9mHQy5L5mNOCZaEgaK
	24TBKij3I8NuVXuAraKEA904NLF/pXGsjU8X1928wbRieq+1I2lVwodRKSCrJs7EgH7fgW7tjz5
	Eml5SDqCiMDnn249l4ENSylTGygug6QsVlowQcXsI7Ttj2helZkFuPQA671xUPvP/VfBqTo/b8t
	7INECPoaaU4xIA4+nqXbFrIAU7aFZpdWLy+U4Zp7yA2iPtSNBLh8IC5gejrC0nNWDfrl3ER+ZXs
	H22UI5LN+vgxsbook8uIw9b2V4R0cp4VfbO9xA3PvDB1y1UX5BPQEzqMkjdY/VSxDQTFt2IEcLI
	62aisNpftR3yDU/IMFyZNGRudrDsbw==
X-Received: by 2002:a05:620a:a8d4:10b0:93e:c03c:c2ab with SMTP id af79cd13be357-94a0327418cmr649897185a.20.1795663654963;
        Wed, 25 Nov 2026 19:27:34 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::9a34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38319asm1470186885a.16.2026.11.25.19.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:27:34 -0800 (PST)
Date: Wed, 25 Nov 2026 22:27:31 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: kayano050408@gmail.com
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v8 2/4] usb: gadget: gadgetfs: fix ep0 setup abort and
 unbind state races
Message-ID: <c304b43a-0a75-4408-8cce-9f4e6a1c5a59@rowland.harvard.edu>
References: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>
 <20261110-gadgetfs-ep0-v8-v8-2-8f90434574fe@gmail.com>
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
In-Reply-To: <20261110-gadgetfs-ep0-v8-v8-2-8f90434574fe@gmail.com>

On Tue, Nov 10, 2026 at 12:13:23PM +0800, Jing Lin via B4 Relay wrote:
> From: Jing Lin <kayano050408@gmail.com>
> 
> Several ep0 state transitions lose setup abort notifications or leave
> the file descriptor in an inconsistent state when control requests,
> disconnects, or unbinds race with userspace I/O:
> 
> 1. ep0_write() drops dev->lock while copying an IN payload from
>    userspace.  If a new SETUP packet arrives in that window, the stale
>    response must not be queued for the new transfer.

The window can be reduced but not eliminated.  After all, once dev->lock 
has been dropped there is no way to know if a new setup packet has just 
arrived.

> 2. ep0_read() waiting for a delegated control OUT data stage only checks
>    dev->setup_out_ready, so it does not wake when a new SETUP packet,
>    disconnect, or unbind aborts the transfer, and can consume a newer
>    transfer's payload if dev->state re-enters STATE_DEV_SETUP.  In
>    addition, gadgetfs_disconnect() overwrites STATE_DEV_UNCONNECTED
>    before next_event() checks for STATE_DEV_SETUP, skipping setup_abort.

The problem will not exist once new setup packets are prevented from 
aborting older control-OUT tranfers.

> 3. Early returns in gadgetfs_setup() on oversized OUT requests or a busy
>    ep0 request skip setting setup_abort when aborting STATE_DEV_SETUP,
>    while ep0_poll() clears setup_abort before ep0_read() or ep0_write()
>    can report -EIDRM.

These should be relatively easy to fix.

> 4. gadgetfs_unbind() leaves queued events readable in STATE_DEV_UNBOUND.
>    Delivering a queued GADGETFS_SETUP event after unbind puts dev->state
>    back into STATE_DEV_SETUP after dev->req and ep0->driver_data have
>    been cleared, causing a NULL pointer dereference on the next ep0 I/O.

How can an event be delivered after gadgetfs_unbind() has finished?  The 
unbind occurs when usb_gadget_unregister_driver() is called, which 
happens when the user program is closing its file descriptor for ep0, 
leaving no way for it to read any events.

And as before, these issues are all totally separate so they belong in 
separate patches.

Alan Stern
