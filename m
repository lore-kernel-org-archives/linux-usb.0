Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773323;
	b=nSOYllEykJqUlKini+AMUjYabXcSKNzJXm01WsxQznGrSQcd06koANQAUaGftG3KVlbp
	 qHvMHZOYckWpL26eXjveBUBztJb46qFMZF/KXTQpEe5KLij/JQP2IfVlhkdGHJKE+KX0e
	 TgmvsLYNLAYsD5qLd63C8VGrkzx2GJI2ITeOKpmlfbPhOAq32f1kxeB/UcWsSdRdfTUDM
	 DlMW2GtxNpvWqWBN5YixpM4Nzj0fY7UBWdkWWOHRac+5KoCjyFTeh1txhMYPf/niliSUn
	 Z6LoLyOPYs8S0zhKvJS+eKfI7LkYJRC9twHzJHrWsoJEwzLkDIf5HzBY7XuMKF7VIOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773323;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=p3cYCUgUxSjvIlDe1M+C4qItW5CrUe60ZsN/iRe42BM=;
	b=y4ymeM/8HOWg6vrloKq5l69PTCld/68f0UAXy1/xYOnElsA4JtyQ6BSsyKk8LUmkM1hM
	 4XUCV2oKlKhzqtvqFT7KWDwDJvZ85rknddJhRKEjTEqXga38AInwZ22MRfdmft88iQxB3
	 Xj9qMERqVb4NRIBNt5ZefztVgKckiIixSiXtJCOXtm0LSiZ6G9YCQWNGYWh9UR+uuK4jX
	 XtwkmJCjIvAgZS0qfp892pv4/dgepy40GbflDJl5zfQVrW6rJE6OsUd/eCnNj/pdPYlkX
	 ESdDG37jVOWO22c2OhVgGmMTDB6KwaTC+7bmZDNRjFTM6ync2PkpG/cPs2GJYI6fH/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lJrPqqXQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CC2606A338;
	Fri, 27 Nov 2026 09:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lJrPqqXQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9F11F00934;
	Fri, 27 Nov 2026 09:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795773323;
	bh=p3cYCUgUxSjvIlDe1M+C4qItW5CrUe60ZsN/iRe42BM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lJrPqqXQGxLm9D14wjS+YcqHz3lDbf7HCwVN7lBl8xqGQFd4uCEZW37GvgsrBQt0p
	 za9A9fc//4pDI7CvVgOY6bzPdD1r9AsdneL0WEhqkUb77krNI0ffGkyyF+BYrZosIT
	 URdm1Xj8Vu1IRY+2Ixi8/8N/oEUGpYE8sBd6cDCcWTdqkJ8z2VkenMCTvdSp8ODu7n
	 0X8Dtspc1Jdxv7EU7s6ZRA9xBkCg0yIGhbds7vCrmvsC9R/QBjMjz+TDqcgAYFEiAN
	 mfau8tNeH7o2xJoQPk6cJn6zhm+/qmXKbw/mY2BtTLqCnIxl2NEjhs9yJS1fcDq96F
	 utfERggR2jIaA==
Received: from johan by xi.lan with local (Exim 4.100.2)
	(envelope-from <johan@kernel.org>)
	id 1xWsfo-000000020z7-3GbL;
	Fri, 27 Nov 2026 10:55:20 +0100
Date: Fri, 27 Nov 2026 10:55:20 +0100
From: Johan Hovold <johan@kernel.org>
To: Thorsten Blum <blum@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: console: use isdigit() in
 usb_console_setup()
Message-ID: <awlTiK2cweuFAsfv@hovoldconsulting.com>
References: <20261106090304.2410-2-blum@kernel.org>
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
In-Reply-To: <20261106090304.2410-2-blum@kernel.org>

On Fri, Nov 06, 2026 at 10:03:05AM +0100, Thorsten Blum wrote:
> Use isdigit() to replace the open-coded implementation.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Applied, thanks.

Johan
