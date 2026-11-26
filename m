Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697510;
	b=1wZrs8w/QuLKASbOP+ZHvCVRxqFzqSN8it7ZtG4d4uaNFSwve0V/O3+ff73nw+k+0ygl
	 Kks/3pgUo2/c5oW6K8vq/TqA69YUDEwXVA/wQ1e5XZDjKlo21Q2PZeDSsFQdflGUfc4Bw
	 ct8jJheH1rN72YFn0P/JmRgerKDHgYfAQv+QeG02FF11bHdcQEsN7AlmZETZpgzp16qrX
	 POWdMqT0FQ/qBLMXpXVLclUn83yAHGK0Fykr0ZSiE4dKT/IKGbf6xvOVBGcXAqEfy+HUA
	 hlNPSPexagv0kSqiKNvmOTuNmv2klRbiU6xXKrdke/6sc+r5lXTSyf1bg3Ng2e45PGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697510;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Lc8ymzhm+AuwNr1xMnmrC1YzSYcQ4MewX7IwfP5HLLg=;
	b=EavRST9J4Djkfi8N9y12GJp1388LoOVZhpPvETIRmJpCZ3netawoWRFPunOHkGWpVgd8
	 XK3ztTEyP6Od39/jWQHlihapmXcEvITDXB9P6dbqAvMDGPnOF0lwaxr4pDbpmEgJKIeLe
	 cyFpcTg5ahTAXPlRok3YZVZ3wB+kTQwlqpzShIf0ByjTVXz5u9aYOsoQoA1IxLq9fAM+n
	 FY947DulZDqddEH7H3b1qC2VFjuVmudhykJtVWtk1dGtL/9hh/6tnXhA7zDeKeI+r6+uX
	 2dU0ovv78vRdmh17M42zaIj2g9Ktv0Kh61MmFOxxu1kFQe7xxe/DAs1Kt+1P4B0hVJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Yk+5uCV6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C836A606A31C;
	Thu, 26 Nov 2026 12:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Yk+5uCV6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B521F000C0;
	Thu, 26 Nov 2026 12:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795697510;
	bh=Lc8ymzhm+AuwNr1xMnmrC1YzSYcQ4MewX7IwfP5HLLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yk+5uCV6GA5EA1LlaDwGEyx3HDlQOhlrQVVeujag/zIAje3ARtop0w9e7dr6ibrfn
	 fC3tMh0bJK7iHmiUtSNPxEG1tdry6oEZBN2GLxhtLHbhQ7CWqPY5DRGyeUGD+dDie2
	 y8RXAWk1A9IgQqWdIV8U/ChNoBtjAgH/On7btm18=
Date: Thu, 26 Nov 2026 13:52:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: shitao <shitao@kylinos.cn>
Cc: linux-usb@vger.kernel.org, davidm@egauge.net, eeodqql09@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: host: max3421: fix the SPI thread teardown on remove
Message-ID: <2026112650-crucial-tartly-5c25@gregkh>
References: <20261126121148.1021526-1-shitao@kylinos.cn>
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
In-Reply-To: <20261126121148.1021526-1-shitao@kylinos.cn>

On Thu, Nov 26, 2026 at 08:11:48PM +0800, shitao wrote:
> max3421_remove() stops the SPI thread with the HCD spinlock held:
> 
> 	spin_lock_irqsave(&max3421_hcd->lock, flags);
> 	kthread_stop(max3421_hcd->spi_thread);
> 	spin_unlock_irqrestore(&max3421_hcd->lock, flags);
> 
> kthread_stop() waits for the thread to exit, so it must not be called
> under a spinlock.  Worse, the thread takes the same lock in its main
> loop (in max3421_urb_done() and friends), so it can never finish its
> current iteration while remove() holds the lock, and remove() ends up
> waiting forever.
> 
> The interrupt is freed after the thread is stopped, but its handler
> wakes up that very thread, so an interrupt arriving after the thread
> has exited calls wake_up_process() on a task_struct that may already
> have been freed.
> 
> Free the interrupt first and stop the thread without the spinlock.
> The thread checks kthread_should_stop() at the top of its loop, so it
> exits without re-enabling the freed interrupt.
> 
> Fixes: 2d53139f31626 ("Add support for using a MAX3421E chip as a host driver.")
> Signed-off-by: shitao <shitao@kylinos.cn>

Real / full name please.

And how did you test this?

thanks,

greg k-h
