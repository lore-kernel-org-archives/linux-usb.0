Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7A5489882;
	Tue,  4 Aug 2026 15:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857546; cv=none; b=gM6F4oM5QjHFbT/B2x8kv9/5BTrZYc3dgU1XzEeCq64gxS+PKkJQiugNRlHLX3hP1P/UaDrxaCqmb9ug4AiYblQ8uFkBVM5bkPBb6n5ryLdbYQqSZ8DyArg3f0KI8hvEEWPo1CCkVZDqV4m1nOfTNoug+fi4noovbZ9uIbdb33U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857546; c=relaxed/simple;
	bh=uD8On8upy+JKUxcP87wLmazE/jkeplubLzolBbphKIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8rHSX7V8GuOHGkPJiVqAXifWuoE+4ix7mz/99R5W1/rCbRmcOX2lvWMMzNkyFyWc5AlgcATT1ND9ayFoe8JRS42fCpJCJ7t6gUQ+VyPrNVImIgZ0MI9nrk6bgrv+DHr1iur6enwWODL2CwD2uEMPhbomvQ+EuO8kK+4xD+ApjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gJsbdeht; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gJsbdeht"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE69F1F000E9;
	Tue,  4 Aug 2026 15:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785857544;
	bh=WvDDf6J7dCM0BUoSYxUzj1LJOmPw9de1njg1GkihQKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gJsbdehtWmtmuFxK04tHxJ4a3INSZuXip4b5n8NqCkRYYJrHw+vCAFtH3+ZhvSJUd
	 eGfJleomZ+UESvajrBMow9ji7F3uD18bX50c2B0nRkJBy1q0nAX++VawKp7yXQMZsF
	 UClWsJOl7UgxzGKzoJhQnGYfOyOu20udF9GFnaGc=
Date: Tue, 4 Aug 2026 17:32:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: bolewara@gmail.com
Cc: Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9aacea11bc70c3ddaff2@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] usb: raw_gadget: fix use-after-free when UDC is
 removed
Message-ID: <2026080421-amaretto-bronco-898c@gregkh>
References: <20260804-raw-gadget-ep0-uaf-v3-1-bb7cf1d892af@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-raw-gadget-ep0-uaf-v3-1-bb7cf1d892af@gmail.com>

On Tue, Aug 04, 2026 at 08:32:50PM +0530, Anuj Bolewar via B4 Relay wrote:
> From: Anuj Bolewar <bolewara@gmail.com>
> 
> When the UDC is removed (e.g. dummy_hcd unbind via sysfs) while the raw
> gadget fd is still open, usb_del_gadget() destroys the gadget device
> and its name. raw_gadget keeps a dangling pointer in dev->gadget, and
> ioctls dereference it after releasing dev->lock, leading to a
> use-after-free in dev_err() when usb_ep_queue() fails.
> 
> Take a gadget reference in gadget_bind() and drop it in dev_free() so
> the gadget device and its name stay alive for as long as the fd is open
> and an ioctl may still dereference dev->gadget.

But bind/unbind have nothing to do with open/close.  bind/unbind track
the lifetime of a driver being bound to a device.  After unbind happens,
the driver CAN NOT touch the device at all.  That's not what you are
fixing here, you are attempting to keep a reference alive that you are
NOT allowed to keep alive, as it is gone.

> gadget_unbind() only
> marks the device as failed under dev->lock; the reference is dropped in
> dev_free(), which runs only after the fd is closed and no ioctl can be
> in flight.

Again, bind/unbind have nothing to do with open/close/ioctl.  This is
the "traditional" issue with char devices having their "backing device"
go away.  There are many different ways to solve this, none of which is
this patch at all.

So please, go back and rethink the lifetime rules here and do NOT rely
on a LLM to attempt to work it out as obviously it is totally getting it
incorrect.

thanks,

greg k-h
