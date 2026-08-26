Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F813B774B;
	Wed, 26 Aug 2026 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733982; cv=none; b=CLJAmkYPVnq7tpkyK/KRCP8F3q5HBQ4JIend7hQffCGboFMnuDaWdCB8RyDhAUoX3g5jclB7puSkv54kJLe48zVN00kxDzPOnbh4d/65H87b7OUsNe/X2PPXbXgUFMXF1FjVwx8hpcVAnwLGDs53gWvqsGa5+zvxZ6I5xytjckc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733982; c=relaxed/simple;
	bh=eIP0HkhWAexec9N06c9IDEi+2q1dEs5bMJNydZjpQW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFffzbO+CzYKkQ3mEJoF88v/S6QVJ3+CaJmH5ZxF4XgjY+d2/sJ2IdHr3B1wyjTTg9CcARjLh1c+H7rqQh5VfCkwlayt8ZV9WoxFMaRbClm5aVQOC6L6yOk9BBdhooKIhhxl7A4U2k5dKgA4UnQ/vPLaDNJYBp8Lm9BvVdsID+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2dPG9Y9m; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AE9g/STC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2dPG9Y9m";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AE9g/STC"
Date: Wed, 26 Aug 2026 10:46:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787733977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qkNUwTlcunTbZN49eaJoUvCru6l5C3KsF/2xP4pYHPM=;
	b=2dPG9Y9mFmiSTLAoiWyVqzULOb9b5FhvQpmOWR3QpQZ5jBwPXxyj9nlzdQk+2/idBi3fjY
	2thp2z3gpLAtLAj2nQL6A8B6EpR6lMKmHZU86uLTlb9yH+8M4vaXmyrwhj2aDX3MwBNrQ4
	e8O3W4MxpYC+don9XTOcAPjbR0diNLcd33A5F21/e241WvLf5cE99+Lvg4v3Gtn/xJo+qd
	EKFRbKtVpGRPJ3AZL2i3BGmS2TFyqQp8bUZLAM++Ex7uSJC4Ti5WAivlLdeLX7+yS9J2l5
	hRkEVT3yA8yldXNGnEBv42UBugypjn3icL/OeFKAu62VNF3jdk6q9i7rwGyhnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787733977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qkNUwTlcunTbZN49eaJoUvCru6l5C3KsF/2xP4pYHPM=;
	b=AE9g/STCzgj1xQPtEoA4JeFnD6giKhOZV/EfzMuBsTN/6LRykSLpn3HUNRKustx4GsYQpo
	JPw2X1wsx0SoW9Cg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Greg KH <gregkh@linuxfoundation.org>, Yuho Choi <dbgh9129@gmail.com>
Cc: heikki.krogerus@linux.intel.com, sebastian.reichel@collabora.com,
	tglx@kernel.org, alchark@flipper.net, u.kleine-koenig@baylibre.com,
	ustc.gu@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: fusb302: Free log buffers on exit
Message-ID: <20260826084616.V9emV9vv@linutronix.de>
References: <20260807203403.1011343-1-dbgh9129@gmail.com>
 <2026080802-finicky-exclaim-0def@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2026080802-finicky-exclaim-0def@gregkh>

On 2026-08-08 09:10:28 [+0200], Greg KH wrote:
> > --- a/drivers/usb/typec/tcpm/fusb302.c
> > +++ b/drivers/usb/typec/tcpm/fusb302.c
> > @@ -223,7 +223,16 @@ static void fusb302_debugfs_init(struct fusb302_chip *chip)
> >  
> >  static void fusb302_debugfs_exit(struct fusb302_chip *chip)
> >  {
> > +	int i;
> > +
> >  	debugfs_remove(chip->dentry);
> > +
> > +	mutex_lock(&chip->logbuffer_lock);
> > +	for (i = 0; i < LOG_BUFFER_ENTRIES; i++) {
> > +		kfree(chip->logbuffer[i]);
> > +		chip->logbuffer[i] = NULL;
> > +	}
> > +	mutex_unlock(&chip->logbuffer_lock);
> 
> As you are tearing things down here, and there is no actual user, why is
> the lock needed?  And if so, can you just use a guard() instead?

That is correct. The whole thing is about vanish so locking is not
needed.
Looking at the actual user of that buffer, I'm curious if it wouldn't be
better to use dev_err()/ dev_info() for some of the output and other
which are just pure informative/ debug kind of information, hide behind
a trace event which can be enabled if needed.

> thanks,
> 
> greg k-h

Sebastian
