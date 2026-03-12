Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EF33A16A2;
	Thu, 12 Mar 2026 12:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773317066; cv=none; b=DDAZuOV3C4AqXjcPOuazq4/VJDMsdgcYJ9lzbhK5D8sfpsdzOcstsiWsXye8/3umtr6rGXFsnPzmq1VxUET8Hof5orVw86AElSUTY6RHOoOB0XvES9YSG4ZnzhtJjLpzU8NoqH0uy73/fHUI42PwjvWW25MTOxgVoEBmchMjZDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773317066; c=relaxed/simple;
	bh=4T0R8wPHP6FeSHnXv/Tz2dDoC+X3Ht2YZSUPLavxi3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxpEszHnEh+1mbuyDhS3vowUf2Wn4bPucFYo3/2XlL1ogkXJhMmHwkzHy2aflXknKTKUWiHfdFlmaUrzDZwsseMJQgSf77rvuCLzZvgoqHsA1tlUzsjwDUNF+xWaxu2+i3BDX/CM8AmOEX3KTGKYEeDTe9BJm+yR0/L5xcuaxIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ksOCmuZ2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CxXm2ivm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ksOCmuZ2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CxXm2ivm"
Date: Thu, 12 Mar 2026 13:04:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1773317060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DfPMmF7lS8HLyEiYZywd8U0TpaP5viEQJcLpYvdynUw=;
	b=ksOCmuZ2baAZohf/ILQavLKEagfCjVDHiKnWv0dYSx6F/ZGzT+DQVNwPCAttoYDitgE3Rm
	87BGGDIf047eabwto7zGSHeDDkqK7425NGSfl/LIwfuOAX0qDNGTYvc9FVwCXD/mZ6h0BF
	fyqCHhfjX4pvZK2QjoseRL8UvBjTBQsu9SlSXAh5tq2cIoOXV46VVgR9h1xQ5lVCyxTv9w
	dpQVjQ9OdJy46Q8LtCpskH5wpvol9/evB7JyNw0ruQ+N1RquWcH5tB72OtK1kuTHGUmq8C
	kAr8X2L5pa3Gp20ixOhvmo+cRWscCSSQ1KO06w1puJ2YS7kDcy9DKJObJObQ2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1773317060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DfPMmF7lS8HLyEiYZywd8U0TpaP5viEQJcLpYvdynUw=;
	b=CxXm2ivmdgp7/mrFblGsv77aHc12B9ASsoQDl3bHYarTuLfQZ/C/fmvQghlD0q7P8m/qxu
	3/78SnCTTSt52tCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Hans de Goede <hansg@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Alexey Charkov <alchark@flipper.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Yongbo Zhang <giraffesnn123@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: Switch to threaded IRQ handler
Message-ID: <20260312120418.99U0NPWL@linutronix.de>
References: <20260311-fusb302-irq-v1-1-7e7105706629@flipper.net>
 <abKDG8wHJ-19c3AD@kuha>
 <63dfd90a-d54d-4d87-8c62-61a3c24d76fd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <63dfd90a-d54d-4d87-8c62-61a3c24d76fd@kernel.org>

On 2026-03-12 11:49:30 [+0100], Hans de Goede wrote:
> Using a threaded interrupt handler should be ok, yes. This should
> also fix the issue this patch tries to fix:
> 
> https://lore.kernel.org/linux-usb/20260103083232.9510-4-linux.amoon@gmail.com

This issue went away with commit a7fb84ea70aae ("usb: typec: fusb302:
Remove IRQF_ONESHOT").

> Normally an i2c device like this would use a threaded interrupt handler to
> do all the work since I2C transfers can sleep combined with disabling the IRQ
> on suspend to avoid the interrupt handler running while the parent i2c-adapter
> may be suspended.
> 
> The problem with the fusb302 is that it can be a wakeup source so we cannot
> disable the IRQ. I worked around this in commit 207338ec5a2 ("usb: typec: fusb302:
> Improve suspend/resume handling") by moving the actual work to a workqueue
> and have a hard (non threaded) interrupt handler which disables the IRQ and
> queues the work, with the work re-enabling the IRQ when done + special
> handling for the suspended case. Basically our own manual oneshot.
> 
> If we move the IRQ disabling to a threaded handler, which appears to be
> necessary for some IRQ controllers (arguably a IRQ controller driver issue,
> but this seems to be a re-occuring issue), then I wonder if we need
> the ONESHOT flag again to avoid a level type IRQ re-triggering before
> the threaded handler gets a chance to disable it (with the workqueue
> item eventually re-enabling it).
> 
> I think we need to re-add the ONESHOT flag, but maybe that is the default
> with a primary NULL handler ?
> 
> Sebastian Siewior I think you now the IRQ subsystem better then me,
> any advice / remarks ?

You could do
	request_threaded_irq(chip->gpio_int_n_irq, NULL, fusb302_irq_intn,
			     IRQF_ONESHOT | IRQF_TRIGGER_LOW, "fsc_interrupt_int_n", chip);

which would ensure that the handler runs as a thread and the interrupt
line is disable while it is active.
Then you could let fusb302_irq_intn() do what fusb302_irq_work() does.
Since it is a thread, mutex_lock() works here.
Last step would be to replace fusb302_chip::irq_suspended with
disable_irq() in fusb302_pm_suspend() and enable_irq() in
fusb302_pm_resume().

That could do the trick.
 
> Regards,
> 
> Hans

Sebastian
