Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB844AF14F
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 16:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822590; cv=none; b=sbQSQMtO7Oq++w257/we8Gx9WOjUOfmQq0NBMNLMJ8qlNCnh0hadNf8B/0cf3gqJ4jRmDmHyhbI+hNSsQwrCCZmPs4LTtgU+aiVV9Fc+tg3N87HwjFC1u+IcBHslB91cdsYMRXzX15zc0T6GYD3T/oBYAOvtDTJYsFCGT9h+3nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822590; c=relaxed/simple;
	bh=uuRp26Gv1Fn7Cfa5F6pAWCxnUIHvmYGSbX1lyMcvNZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmULPwD2BZSsWmw/TeY2xc38FvgXSnIKvHk9yHTffGLbJM/hppbTL4fxlKsSrvTagcobovMpqYew7XkMiDsY62pUm3UT7ITjCgFq3F5HUAaWtuBhM/oakruRt1baqY5CzdCy54UouKx+4Bnv7kIhY6kgr8kRMzsOHORMo4Iz7VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Qvn28Rna; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sXge7i4W; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Qvn28Rna";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sXge7i4W"
Date: Mon, 12 Oct 2026 18:29:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791822587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kyjK4IjxFgU9Rs/+xC+6BzCK7vC05k2iGwInhqoQTVc=;
	b=Qvn28Rnag6peN9ThxPKekSakJOFu3Qd7mtM1mnpWL3ADdLQbzYfK/9mNwP0Czr3loR+5Vu
	XZhHLjqCFP4xkIufcULcbfbLSB0Nlc5bNGoe463+el8+OkmL0pgB9iSZkntCd5182uiAkg
	VdjjwileZ+MEGo92+M16PUstlZqkUn0lj/ErS2Y1TScswAc4Scf17tsb2S7qFkTGGIMOaj
	OZt4TSyWxyeZ4r1k0HgDAgCpceUzHtsuZch3xxrbhXR/y8mFE/UX6oV5JhVxkNd1Z4PQFc
	Taif/qWrrv361Z7SOH/6ryp3PkXxaJQAooPIYFbEGHhhURxpN+64wz+h4MmBWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791822587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kyjK4IjxFgU9Rs/+xC+6BzCK7vC05k2iGwInhqoQTVc=;
	b=sXge7i4WZnHQKvA5inGD/wKDdsCE/gar3oXvxW07BBIZuBOzHO6CapRTxZ2abuPF5qnLuK
	R4xQUDs05dZlDvAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	syzbot <syzbot+de553c19cb054f174a35@syzkaller.appspotmail.com>,
	Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH REPOST] usb: udc: Make tracing aware that
 usb_ep_alloc_request() can return NULL
Message-ID: <20261012162946.xydo0fxw@linutronix.de>
References: <20261012094911.wHPc_9lJ@linutronix.de>
 <2026101222-retention-pecan-0061@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2026101222-retention-pecan-0061@gregkh>

- Felipe (bounce)

On 2026-10-12 13:26:18 [+0200], Greg KH wrote:
> On Mon, Oct 12, 2026 at 11:49:11AM +0200, Sebastian Andrzej Siewior wrote:
> > The alloc_request callback of the EP can return NULL if it was not able
> > to allocate a request. This NULL pointer will then be dereferenced by
> > tracing in order to show details about it.
>=20
> When does that happen?

In usb_ep_alloc_request() when ep->ops->alloc_request() return NULL.

> > Let tracing check the req pointer and if NULL just write 0.
>=20
> Why not fix up the calling point and if req is NULL, not call the
> tracepoint as odds are something went really wrong at that point in
> time, right?

usb_ep_alloc_request() uses it as:
	trace_usb_ep_alloc_request(ep, req, req ? 0 : -ENOMEM);

so if the allocations fails the entry in the trace buffer will be=20
"EPNAME: req NULL =E2=80=A6 --> -12" aka ENOMEM.
If that trace point is skipped then we have nothing.

Now sashiko pointed out that in usb_ep_queue() that request can be
completed immediately (instead queueing it) and then
usb_gadget_giveback_request() could release it before the tracepoint is
using `req'.

"Immediate" completion could happen for ep0 handling/
composite_setup_complete() but this does not do it.=20
loopback_complete() does free `req' for error case (such as
-ECONNABORTED) but this should not happen on enqueue. And if it does,
that memory is still mapped but maybe with bogus content.

This makes me think that it would be better to have copy of `req' on
stack for the tracing case.

> thanks,
>=20
> greg k-h

Sebastian
