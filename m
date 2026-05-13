Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322913A3E68;
	Wed, 13 May 2026 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660425; cv=none; b=C6dlV2wdisdZF+mhWSA9oe7nzqJC5sohejT1r3soXdZBZ6n2CO3Xva+teJcYlN5DuzQ8fXN63KHmfpwU7VR2Ahe1YStOM/fU7AZuWRPBpn3gCFAalTb8BAUdGnW7vhaEus57xIPpR57oYaOKkXrkK2zsSqKIMhAYycekzj3yRU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660425; c=relaxed/simple;
	bh=cmWn83FvGFJ2LtTRIYJCIfSQQtY7T3IYpa+Zi0qlJo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eD4Xg/ROBST5wRVskRaE8I8mQCyfLMabDLcRPLjNfdh7lImTW8K904KhyQ7JNOraCF5uJJU+oyj8FDQTnCP6WU9G+gH2b3M0gYzipWcTuJwtrCT83xEYHoF5e5Zszi5n2Vx0+HmjGR/28s0LOXcIpI3ruNpOaHdA/umRy1sOQaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ei6GcqY0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ei6GcqY0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34609C2BCB7;
	Wed, 13 May 2026 08:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778660423;
	bh=cmWn83FvGFJ2LtTRIYJCIfSQQtY7T3IYpa+Zi0qlJo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ei6GcqY0Hpdlx+dpJci69HthqNFoAI/UK6WCIaRJxPDS3YNgyiFJgA4Uzg9ezt4Em
	 kBrm2tCiOu695oKf6oELPp7eoa3g0PhdDL+q0E9Y/beqod0caXUa1M+xv0nOHsc8YK
	 78eKNdvBDjw4nDpHlzpYsk7YBxp73HljELnqZ8eHJgaJQT7iGf4/Y1kiEM96KkCmNd
	 WaS5akkQk5rqtEI53I94CXXsIVKM+Lk+8D+thDdD6s9YnyiFsfWEYq8QQ3eouL8vFO
	 weN3tIe+b6bkjSliSNDJxW4KQA92KwHJ8kEntZP2CgaYe2/LWCYfeo+iuS4LXRKszl
	 eY6uHowN0OU1A==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wN4pJ-00000004JdR-04r6;
	Wed, 13 May 2026 10:20:21 +0200
Date: Wed, 13 May 2026 10:20:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] usb: serial: mxuport: add sysfs control for UART
 FIFO
Message-ID: <agQ0RRpE27ComUnV@hovoldconsulting.com>
References: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
 <20260324035041.352190-5-crescentcy.hsieh@moxa.com>
 <afy2yeDTHiVFkPmy@hovoldconsulting.com>
 <agMO03V9xppAtWjf@moxa-ThinkCentre-M90t>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agMO03V9xppAtWjf@moxa-ThinkCentre-M90t>

On Tue, May 12, 2026 at 07:28:19PM +0800, Crescent Hsieh wrote:
> On Thu, May 07, 2026 at 05:59:05PM +0200, Johan Hovold wrote:
> > On Tue, Mar 24, 2026 at 11:50:41AM +0800, Crescent Hsieh wrote:
> > > Add a per-port sysfs attribute, uart_fifo, to allow userspace to enable
> > > or disable the UART FIFO at runtime.
> > 
> > Why would you want to do that?
> > 
> > We should try to avoid driver specific sysfs knobs.
> 
> The motivation is to allow userspace to choose between lower latency and
> higher throughput at runtime. Some latency-sensitive request/response
> deployments become unreliable if the UART FIFO is enabled due to the
> added buffering delay.

Please mention this in the commit message.

> I understand the concern about driver-specific sysfs knobs. UART FIFO
> enable/disable seems more like a common UART capability than a
> device-unique behaviour.
> 
> If a driver-specific sysfs attribute is not the right approach here, do
> you have a suggestion for a better interface?

We have one USB serial driver and one serial driver using the legacy
ASYNC_LOW_LATENCY flag (which can be set using setserial) to set the
lowest rx fifo trigger level.

I'm not sure we want to promote further use of it though.

We also have a couple of non-documented driver-specific sysfs attributes
(and a module parameter) and one documented interface for 8250, which may
be considered the standard way to set the rx fifo trigger level:

	/sys/class/tty/ttyS<x>/rx_trig_bytes

I guess something like that could be generalised to mxuport as disabling
the FIFOs is effectively setting a trigger level of one character.

What exactly does RQ_VENDOR_SET_FIFO_DISABLE do? Does it really disable
the TX fifo? That doesn't seem to make much sense, especially since you
already have the endpoint buffers.

What happens if you flip this switch while the port is in use?

Johan
