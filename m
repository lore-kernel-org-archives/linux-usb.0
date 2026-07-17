Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7776C382F0A;
	Fri, 17 Jul 2026 08:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277267; cv=none; b=aT5kTYGbK9ms9WZ1j1G8Q0hihNIgq7PXe86C333G9LyLZUtG2JFAQNw5KvvG2YcL5Mk9EtBPYtHSMprKo+UlzSHIM6DPWVj+QBCy4Uphuno+lJH9XepauZW21DHyFT5Dh78sMUw0MH0W54blFyT6N58lhNP1BZBhnhqM1BwBa0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277267; c=relaxed/simple;
	bh=+pWsxeoxhoPbWcY42u7dCH6rkkWQnTAdY8BdayH10gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=da7dWgj1AHlQvtlfN8bpdBq6gAhlHvGWqpD2Ljk3fi34LsFF9xgdvFVjfVJN/GCtwoXj2aiDrPMfUjl1rDDumE7LZ2jfi3n61cTqN0bK5oJJm72Ph0YHmHjSf2EqveyqOx6fitpgx1hI2QGEA9yFYHETw9Xm1sQyckYE4IeYuZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=flBgOdPP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jYJR5bSN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="flBgOdPP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jYJR5bSN"
Date: Fri, 17 Jul 2026 10:34:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784277264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x/4cJmb+CqTgnlyUoEH6yLWy+62hNw8/3jy7Vcwgv+E=;
	b=flBgOdPPLSTs0F19eC3sEWm6QOg/TwE0Gl0Y7t9g5t+DDdd3A75mR/WDXGzQRJyA2jfl3F
	12Cl/2nWknXlIZgqGWRtrmfaSUJHtIUL4ty8vOK8VHPSENfOw3XIKEAl+7OeA5tMHSnilR
	GTGPywZGn0/vjgqPccu8Dx5otdy7QdDaZIrqOxvYFHWSq4FcFw53vDfGuEy+bC7BA/Z2WF
	8uvmDqVGxP3QXgAq21K5ugtoMFcUGUxyvT/H6tiKCsnxmML7dAGtw/rrDN4wJ43ZcyWbII
	cZ5RvjKnMOjnNl+O6t0JKyCsBHih4cdbqAB/z9v2TiVBYp57Ai7sSbIyxxuc9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784277264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x/4cJmb+CqTgnlyUoEH6yLWy+62hNw8/3jy7Vcwgv+E=;
	b=jYJR5bSNK+v0Bht7qAbxKIwVnL9+XLdRSCfy8kToEmuxIQOiyMf1zKDVhiW3IUD4Q0hZZK
	IA+0dpQk7nxcJDCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: "Jiangong.Han" <jiangong.han@windriver.com>, gregkh@linuxfoundation.org,
	surban@surban.net, eeodqql09@gmail.com, kees@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: dummy_hcd: fix IRQs-disabled violation in
 dummy_timer()
Message-ID: <20260717083423.NViVto15@linutronix.de>
References: <20260716020713.1698421-1-jiangong.han@windriver.com>
 <17c672c6-bac3-456a-895f-d5406624a3fd@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <17c672c6-bac3-456a-895f-d5406624a3fd@rowland.harvard.edu>

On 2026-07-15 22:15:52 [-0400], Alan Stern wrote:
> This is not the right way to solve the problem observed in carl9170.  It 
> is documented that usb_hcd_giveback_urb() runs in atomic context, and 
> drivers' completion handlers should not expect to be called with 
> interrupts enabled.  The problem lies in carl9170_get_queued_skb(); 
> that's where it needs to be fixed.

I guess we don't see this that often because the widely used HCDs have
HCD_BH set.
I sort of think that we already did have this conversation about
having unlock+lock with irq and not skipping it. But yes, while this
would solve the problem _here_ we would still have the same warning on
OHCI.

Take a look at other drivers in drivers/net/usb/, they delay their doing
to napi/ workqueue/ tasklet.

> Alan Stern

Sebastian
