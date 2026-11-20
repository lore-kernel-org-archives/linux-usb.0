Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169992;
	b=o9H4lIsQ0oXwV8piLqzak2jODi0kpsMFg9w94SokKZpJofL217nL4HQCledeo0uqDxUk
	 EoLdamjZw5zRlOfhjzLRkLSyVGe02LQTP6syYsVVjFB8op4xLDWnBgIBlRzjBs5BPMKZ1
	 3Nxp7aqLC5BsPj3Dk0foaCp5OcOLW8ej2EgKvu7FlW6dk5vwQ4K/W4DYd/IOqdz8qtGFx
	 xoWhU96rk9FI4Q2q8vtvIO9srD22ou09/cDr4GSqO0hzad/opQeKOUosc1eSELnSAAl6f
	 +nGs68Rfwi7k3Ibk/2FQrdVbsm7puy4iFBimhzgjFkP05Y19HUYGYgiVCPUWB2OlWaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169992;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cIfPdmYpkTWQZgDn6LZUeY16dCH/RR9L/fuOLGqMjTE=;
	b=s/MzpLqoEbdoojQ2u7hzKmkUEr21qvvNkWsVGwPh45T+Vu0zJCcDwPucOgXx0+s40vA5
	 5+a84/n12RTYm1tHi6v03NTJGJR97fRK1wTaRpcD7T0aXPW6rKyQT+Psifk1oYFw7X8KA
	 jO+LtX03Moob3nz6dRejWiVuJ5em1DicUdFCuO65flFOvy2QtXCu5criInFw+XCyvfRwt
	 h0xSfVXj/OEwljoAZpcaJhx64hb/JmWFX5Ftl0lSyvxTcLdeCmHv7OkAjfQszKtn8Lx7f
	 E8k0eF5mv5PM9VBnTXwl4xk57Xnbc2yZxrSSOKOa/jzdOaxRMnqRJ95V2KfhRnmMs9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tX8+uCPd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EEF606A320;
	Fri, 20 Nov 2026 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tX8+uCPd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6689A1F000C0;
	Fri, 20 Nov 2026 10:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795169991;
	bh=cIfPdmYpkTWQZgDn6LZUeY16dCH/RR9L/fuOLGqMjTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tX8+uCPd+4ftC68h/Q/HnBpVOSWydyNjwEYhBULXjHxo2YYqQwiGL541sJ3QcH4Y3
	 0zvMMdYfPApWlIGLCB3RbHvHgk0eHmAOY7g0raOdTiNr0bVVhZxtHcxpitaVOHhuNx
	 8sxmNK7El2NmX+H1hXTtdgGFG3b/CnfSrCZlRkBc=
Date: Fri, 20 Nov 2026 11:19:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cole Munz <Munzzyy1@proton.me>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: only dequeue ep0req when it is queued
Message-ID: <2026112034-buccaneer-corrode-5da3@gregkh>
References: <fe62c0a656fe8870248e6a17641f6841bc66d65e.1788885869.git.Munzzyy1@proton.me>
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
In-Reply-To: <fe62c0a656fe8870248e6a17641f6841bc66d65e.1788885869.git.Munzzyy1@proton.me>

On Tue, Sep 08, 2026 at 04:56:38PM +0000, Cole Munz wrote:
> Commit ce405d561b02 ("usb: gadget: f_fs: Ensure ep0req is dequeued
> before free_request") made functionfs_unbind() call usb_ep_dequeue()
> on ep0req unconditionally before freeing it. That closed a real
> use-after-free: a reader or writer parked in __ffs_ep0_queue_wait()
> holds ffs->mutex and waits on ep0req_completion while the request is
> in flight, and unbind has to force it to complete so that thread wakes
> up, returns, and drops the mutex before the request is freed.
> 
> Problem is, unbind now dequeues every single time it runs, and the
> parked-reader case is rare. Far more often ep0req already completed
> on its own, or it was never queued in the first place because bind
> failed before any control transfer reached us. dwc3 is not quiet
> about the second case. dwc3_gadget_ep_dequeue() logs "request %p was
> not queued to %s" whenever the request isn't sitting on one of the
> endpoint's lists, so ordinary gadget teardown, and any boot where the
> host never finished enumeration before the driver unbound, prints
> that error right before the "failed to start ...: -19" that follows.
> 
> The fix is to track whether ep0req is actually queued on ep0, and
> only call usb_ep_dequeue() in functionfs_unbind() when it is.
> ep0req_queued gets set right before usb_ep_queue() in
> __ffs_ep0_queue_wait(), cleared again if that call fails, and cleared
> in ffs_ep0_complete() once the request comes back. The parked-reader
> case still works the same way it always did: the flag stays true for
> as long as the thread sits blocked in
> wait_for_completion_interruptible(), so unbind still finds it queued
> and still dequeues. In the other two cases the flag reads false and
> unbind skips a call that was doing nothing anyway.
> 
> Fixes: ce405d561b02 ("usb: gadget: f_fs: Ensure ep0req is dequeued before free_request")
> Assisted-by: LLM sparse
> Signed-off-by: Cole Munz <Munzzyy1@proton.me>
> ---
> This is the f_fs-side fix Thinh suggested on the dwc3 thread rather than
> changing dwc3_gadget_ep_dequeue()'s return, and it also quiets the boot
> case that the dwc3 change did not:
> https://lore.kernel.org/linux-usb/aptrIbp-p6RNGd9X@vbox/
> 
> Built for arm64, f_fs.o compiles with no new warnings, sparse clean,
> checkpatch --strict reports nothing. I can't flash a gadget here, so the
> runtime side is reasoned from source, not tested on hardware.

Please test it on real hardware before submitting it again.

thanks,

greg k-h
