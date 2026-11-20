Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182339;
	b=w5V3KUBCp8HvkWGTeWWK1sYTBfD8Htt/jwnZwig7yqm4ArOm93bSNLWNpodA9XOuAioX
	 AIupmBj1iuzHWyy3x/TsouO7grAHi55yWPIahyPPxf7zsil0u0VUN8oYTOnYPaCNxX6wR
	 0+d+jKQvMfsdPFQT9dQJ1bY1d/su/PAfs+w+1bOaOMz+mL5s5z11v6tjJr7dk/5s4OJsc
	 a/SUqv0cPacwMrtCSnLirzF58L2JovyghlY5pGIj2R6t91c8qzsEDHlObGteTLZvNzySK
	 wdXUfZYwt7jsI2y18YptTwGkR7d89pB0SfspcEJKKojVbrO9YPMxXO7RQRL2t2Nw6uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182339;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cLa9cP64KiUk2ye+gTRaf4WacPffV5b14QEY4JlY16M=;
	b=w4yMgJjB2eOyXwHtkIxf/GLknsnxpsj58jq7uX521pnGbfdzEg0HpzVCxoI/mG19lpBM
	 Pi294Aq0pDi8iK1+0Et2aRLyViDwCVJ3Ak8qcFqfVLrUir1N5l73MxfWfXos5QFxJFeBV
	 gXnOmIMnqJ2ulRRieShKE/wymg2ecwTSLpc2CqEr6neoR9+wUtPHhBnSG7xt56e1AEsFY
	 3mbx6gU//peV7eIdPd5i+oObK7tEZVr3tC4RAg3IFcFKlL+/CuKenRC3OAFmnLbzpArey
	 BUR7Cn+fDEjBGEmRHumc2W4QkV/8o8QBaMXEG21mytVg60Kzmm25hAQ95pj0f5EvSKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=H6WezO1N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51896606A32C;
	Fri, 20 Nov 2026 13:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=H6WezO1N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464FF1F000D2;
	Fri, 20 Nov 2026 13:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795182338;
	bh=cLa9cP64KiUk2ye+gTRaf4WacPffV5b14QEY4JlY16M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H6WezO1NxxldUOrq4RnqaV0DMU4LH7dKcdIQZUhxwAEmTEblA2CLyC7RpifSrUPbr
	 HIsL9njMcTGLcWCRe7g9Zkd4FpBOz5GV8YWcguzqggaaUB9VK7FhpJ9FJfYlHzald0
	 Kk23tZL+AJyKmb8k1Nn/ddoYYmDEkIEOUjOnjQiM=
Date: Fri, 20 Nov 2026 14:45:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: "William A. Kennington III" <william@wkennington.com>,
	Oliver Neukum <oneukum@suse.com>,
	Havard Skinnemoen <hskinnemoen@google.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: cdc-acm: refuse writes after disconnect
Message-ID: <2026112026-dangling-smudge-fd78@gregkh>
References: <20261118145636.3534234-1-william@wkennington.com>
 <awAtdlEpSLc1ges1@hovoldconsulting.com>
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
In-Reply-To: <awAtdlEpSLc1ges1@hovoldconsulting.com>

On Fri, Nov 20, 2026 at 12:22:30PM +0100, Johan Hovold wrote:
> On Wed, Nov 18, 2026 at 02:56:36PM +0000, William A. Kennington III wrote:
> > Commit 7fb57a019f94 ("USB: cdc-acm: Fix potential deadlock (lockdep
> > warning)") stopped clearing acm->dev in acm_disconnect() and replaced
> > ACM_READY() with acm->disconnected, but left the write path checking
> > !acm->dev and dropped the disconnect check from acm_tty_write_room().
> > Because acm_disconnect() frees the write buffers with
> > usb_free_coherent() and acm_probe() only pins acm->control, a late
> > acm_tty_write() call dereferences freed memory.
> > 
> > This can happen when a CDC-ACM device disconnects while a file
> > descriptor remains open with a line discipline such as mctp-serial
> > attached. Hangup closes the line discipline, but a subsequent reopen of
> > the hung-up TTY calls tty_reopen() -> tty_ldisc_reinit() from the saved
> > c_line before acm_tty_open() fails with -ENODEV. Because the original
> > descriptor keeps tty->count non-zero, the reinitialized mctp-serial
> > instance stays attached and faults in memcpy() inside acm_tty_write() on
> > the freed wb->buf when transmitting.
> 
> Thanks for reporting this. I assume this is not something you actually
> hit yourself but rather something flagged by an LLM?
> 
> > Pin acm->data alongside acm->control until acm_port_destruct() so the
> > unlocked dev_vdbg() in acm_tty_write() stays valid across disconnect,
> > check acm->disconnected at the start of the write_lock critical section,
> > report zero room in acm_tty_write_room() once disconnected, and set
> > acm->disconnected under write_lock in acm_disconnect() so any concurrent
> > writer finishes before the URBs are poisoned and the buffers are freed.
> 
> This isn't the right fix though as the line disciplines should not be
> calling back into the driver after a hangup (and this isn't cdc-acm
> specific).
> 
> I've prepared a fix that restores the ldisc to N_TTY when a tty is
> reopened after a hangup instead.

Argh, I grabbed this too soon, I'll go revert it...
