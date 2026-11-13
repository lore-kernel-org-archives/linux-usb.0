Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547909;
	b=dJB90LYk7MAoZIzymd1JgYN9fftn8pNS48iBvQlrousO3OHc/MtJ6pzh7aVSEhNJmql3
	 3CNxZ/qBFYMbCnYaTyXGK5O5SYH8n+fVm7ThA5o7OtuMJ5NDz4nLyC0emez0csdl88sPS
	 8oVoy6LmSEZ4Jv14Hii5L3uEs5DpTRUko+/9Infg2hAgcXeO7HV/V8BcZE6jVSlTkvjIV
	 EQ6aYrdSad08KpKoSiCC05mLjk8r6JVDfAZpbBzN5DuVlm4tA6C3D/jKntqKpQIEyh5zS
	 8YGL32Le6rOsWlM2iJJ7I/7EUDyABjKocBy6s2OO+gFNNmJPptWKcMqCI6yW8cpgubg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547909;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QrdYuxT1battICthhbp+7mSWj94jqtsicTV3Viw3LKk=;
	b=yI2iXpOYbLdfT51CAo6rCHLumB7DJGE2q96QRYZxa0vf1Zz1YqnqNA06asJosk3e1TXx
	 Ru1JaxDDMV9P7ZT9DuRC48+3VZYV0Mkjix6Tdz0ryYyggjOFNaGtGLYtnyneJd3G61rDg
	 Yl7VVsgegSq2c/E09H2EPaUOKWfCjNDI7KVYpueO6hm1O2jJ+9Z+r5W7+KmB59+/gAwdM
	 eiHCnRI+swjx8pHFnBoVUmHbKXWeIxM8un+pXibdwurwJRCoC1AIaxcC1YNWzDL/9yvvc
	 OutKGNXdGms74ka4W+mgS6ihGWa7JyCQNgcwviknIQOE8JEKSQG8gwQbJl2jl8jPqjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RZpt3u8g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C28606A335
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 05:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RZpt3u8g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EB51F000C4;
	Fri, 13 Nov 2026 05:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794547908;
	bh=QrdYuxT1battICthhbp+7mSWj94jqtsicTV3Viw3LKk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RZpt3u8g6oQL10WPY1eVrJOX3K+I51cDYdWKvzSIT3jrZQgiyAG0xAkqo0gBEUUnV
	 ur7qzxkriDEq6yUuKw7cjtA69oo/r2BUTJKxE/K+Fx6KVp9Fh5j0nglycMv8NuhrKS
	 mVAkjOoYCTcT2Vc5qmRaABuRb6/enjKBJ/WpCoiaLqXbN34rmjuMCDAQVcwDts3lmy
	 cWrBIZYVzykppACNN3K26QtENkqdrl74zSv2ohFMRtci2q5BjFfAQu/jzHqYTsMMmT
	 bwBTMss7jE6eFQ8tngfu8MGohZoi8BNq1LoHyvlypXz2d2JWDznu9JvoHTGNO+6gYq
	 Dx3TQMimZYqOw==
Message-ID: <sashiko-outbox-212232@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: oti6858: restart polling after TX
 allocation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haowen Tu" <tuhaowen@uniontech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <2274A9F7B5D45D06+20261113052738.1479779-1-tuhaowen@uniontech.com>
References: <2274A9F7B5D45D06+20261113052738.1479779-1-tuhaowen@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 05:31:45 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The status interrupt callback stops polling when it schedules send_data().
> The work function then sets write_urb_in_use before allocating a one-byte
> buffer for the transmit-buffer query. If that allocation fails, it returns
> without clearing the flag or resubmitting the status interrupt URB. With
> no write URB submitted either, nothing restarts polling and queued data
> can no longer make progress.
>=20
> Use usb_control_msg_recv() to manage the DMA-safe query buffer. Allocation
> failures then follow the existing control-transfer error path, which
> leaves the FIFO untouched, clears write_urb_in_use and restarts polling.
> Adjust the return-value check for the helper's zero-on-success convention.
>=20
> Fixes: d2126326bd71 ("USB: oti6858: fix DMA buffer on stack")
> Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2274A9F7B5D45D06+20=
261113052738.1479779-1-tuhaowen@uniontech.com?part=3D1

