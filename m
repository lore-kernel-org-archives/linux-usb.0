Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173753;
	b=GiUJwRskFdjBBgw6UPQiQVhloc4HJNjOP+sQQ28yJq61rMSc1nq29G0ZPvXm4+cO7eXp
	 jmlBccLdGGj6xjcFqDkHwvuZxBfXVGeqzi25EvqQt2kPfTIjXYiUkAHTUIo8xyX6Z36yU
	 hpIZfPkf8d4gSznsQVZdBDoa0GQlGww1sugT6T0wwlEoqpkYJKRI7UZUlW8Z48X4tGj8w
	 YIXjSQccagg3gX64SAcZyMXMhDPpAnqLbh8LtX7aHjSbpe9EH/aysOR/r0iaghPvzhoXd
	 K4I15f6DnzLxFs9MqN9JkkBtvEPei1kc6bQ2GEQ8W4eDxZD3MJg6c/kBFiuN4VhX8Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173753;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=q3He2vJPveDeIxMp17n6X/8o/A2BXGmt1vzCaWLZczM=;
	b=3XTdY//vhJhsnSyU0FWGd2IQtE9ZScUd5PW5A0I1DbkBcn8R6GchOZgQjVPVH3QgyW7i
	 p1TpTooQtSm6hn1TzYISjeEFY2eNgfq+pC3W9Dbf0gpxyerg0tqnLvymOPkuLv0yexHtU
	 IkP5A/YBybY1D010NpOc5IAbLMXKV56aqy8W6AgCgdj0fpf5C/t87z1VyP+P+7HQvfrrV
	 hfzuhgsCtEalCIhEe2YQY+oPR+PqdIqU3faa9nVV/nWjv69qXGPXyFaojnwM9KnOihdjG
	 vPS6MO8n2UKLuPobM24S6yRx7GJQc7qaVMuIAqcXYbWI7HSlOZZ4QPN/PGbftfwB52g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YP1y+zVC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEB2606A320;
	Fri, 20 Nov 2026 11:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YP1y+zVC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9CE1F000C0;
	Fri, 20 Nov 2026 11:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795173753;
	bh=q3He2vJPveDeIxMp17n6X/8o/A2BXGmt1vzCaWLZczM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YP1y+zVCAzVoGVCMznmfOqd/xKvtb51Tc6mlSl9SbryXJsZwvM4GnPUGjqCDxTOVh
	 Fqi5LVT13SOipxbLixrvmKkoKO8tvSr7JLPUC/0J61vDdslnn3z+KHtFAlVCFo2ZMG
	 /E9bkMWhC0KFz580jx6hUtW8M5eqQJHx+KqyXuVYAa4oNTX/Mepd+D+0MJm+CFQpLa
	 ekOCky9PjXiCmaHm+N7LOv6XIhFqbRXLcsghgga1lej1D64/JWA14TBzq6K30zDSAu
	 OKy0ZODEyg5eArw7cfibkWRwkPyHn2goSF9ODonI24xXFdps7C5tgZpN7v3y8KkOpe
	 VW5IasdamyRSg==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xUMhK-00000005g9J-3otq;
	Fri, 20 Nov 2026 12:22:30 +0100
Date: Fri, 20 Nov 2026 12:22:30 +0100
From: Johan Hovold <johan@kernel.org>
To: "William A. Kennington III" <william@wkennington.com>
Cc: Oliver Neukum <oneukum@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Havard Skinnemoen <hskinnemoen@google.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: cdc-acm: refuse writes after disconnect
Message-ID: <awAtdlEpSLc1ges1@hovoldconsulting.com>
References: <20261118145636.3534234-1-william@wkennington.com>
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
In-Reply-To: <20261118145636.3534234-1-william@wkennington.com>

On Wed, Nov 18, 2026 at 02:56:36PM +0000, William A. Kennington III wrote:
> Commit 7fb57a019f94 ("USB: cdc-acm: Fix potential deadlock (lockdep
> warning)") stopped clearing acm->dev in acm_disconnect() and replaced
> ACM_READY() with acm->disconnected, but left the write path checking
> !acm->dev and dropped the disconnect check from acm_tty_write_room().
> Because acm_disconnect() frees the write buffers with
> usb_free_coherent() and acm_probe() only pins acm->control, a late
> acm_tty_write() call dereferences freed memory.
> 
> This can happen when a CDC-ACM device disconnects while a file
> descriptor remains open with a line discipline such as mctp-serial
> attached. Hangup closes the line discipline, but a subsequent reopen of
> the hung-up TTY calls tty_reopen() -> tty_ldisc_reinit() from the saved
> c_line before acm_tty_open() fails with -ENODEV. Because the original
> descriptor keeps tty->count non-zero, the reinitialized mctp-serial
> instance stays attached and faults in memcpy() inside acm_tty_write() on
> the freed wb->buf when transmitting.

Thanks for reporting this. I assume this is not something you actually
hit yourself but rather something flagged by an LLM?

> Pin acm->data alongside acm->control until acm_port_destruct() so the
> unlocked dev_vdbg() in acm_tty_write() stays valid across disconnect,
> check acm->disconnected at the start of the write_lock critical section,
> report zero room in acm_tty_write_room() once disconnected, and set
> acm->disconnected under write_lock in acm_disconnect() so any concurrent
> writer finishes before the URBs are poisoned and the buffers are freed.

This isn't the right fix though as the line disciplines should not be
calling back into the driver after a hangup (and this isn't cdc-acm
specific).

I've prepared a fix that restores the ldisc to N_TTY when a tty is
reopened after a hangup instead.

Johan
