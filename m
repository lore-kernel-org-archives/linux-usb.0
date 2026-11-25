Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594326;
	b=sAYTMA/YmMDqcaNZQ4g9zOV6bufWY7ijCrVQsbwy9jENf6Ckf9xiTVk+MPVvvNtlcn36
	 7Yy3xSDw6dJqjIwc974hoAWG4mPzz1nj36NWqgQpBE/WQ8XRCwtRin8jsWMlIkWUocWFG
	 eiTpKGThqFxB7wcIBpR0YAREOYke9WM9pNADQfC2BqPv8XAY6BCJG2iby1sk+ATtQOYof
	 /4XKsgTM5SADrjgUeY37exlgrxd7KIJHK5823tnbI/cBiEkCnv59HUYjBe0QQY+3hribh
	 qa/+moBtmwnIeJszJKrxIBF8DC8jUjHE9GdMHtvMpbU8A9OqG8LIigAN7mTBp17uJHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594326;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zf6LOe1dXn9R6lNwrcLXyQZzFKbnuEA15lSx7if3+aU=;
	b=v/XotyZNU3ons7RaWKZ6aDy2KOoyP9R89hD78tanUptWbL0DIMw6n+2Awr6jeJJhkok4
	 tL6jxumeRgW3QYxlimVX6vhUtEsNZkvS4zmH6G1ys1d5wGYucr5xu9uTBSNhIZZWX7ym3
	 /MrF3Zh9ymTQ26z21aZjnuPYH883IXmHw7dsxJxQ+o+L7EUT/k5nXHWQbEcA4ZDjrGxXp
	 91XrP9RKCzy6WHvZxT3luw8+V23/5zjwu5sak3H4Wf4DNmDYAWdovB2Op8mXwAhbNby0S
	 fJth7TkyMKUOsBH8SKktqjCogns/AP9isVbgmqmPpPB/E+KrBFfLq0xtPhFcxAUSVWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LqfV24mD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9074606A32E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 08:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LqfV24mD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0BD21F008B2;
	Wed, 25 Nov 2026 08:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594325;
	bh=zf6LOe1dXn9R6lNwrcLXyQZzFKbnuEA15lSx7if3+aU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LqfV24mD4zZO0Asy4fGrWB7RthZu2kkaBcVXyiFxGzqK5wo52GKJJYNYU8vl+Eq/O
	 yHae8zKmYuYBkAJdcve40j3Tk5d89Pr6HsBgYcBapRZKioebuzoMd5oDQbO4hYFeNm
	 X+s6ggDfwC67dn+2vQlf10PYtnNl4iqmyOKm0xy4mmeok112hmal89gftJDY9EK+FS
	 soR84jBo/wRmQ6LyhYh/eUUpUuRE9VNddOplCEzSwuIj/eIvMl30XlKKcxsT3n7mEe
	 QCC77dBtBkqNo0M08RiShfhunqx4Ljyg6yTPGHet5HQ6n7Caj/Qs7rKKfqTNOuuEw/
	 jrUH4195PEqkQ==
Message-ID: <sashiko-outbox-232870@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: cdnsp: fix NULL pointer dereference during system
 resume
Reply-To: sashiko-reviews@lists.linux.dev
To: raoxu <raoxu@uniontech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <7B818A718E70C344+20261125080021.3907332-1-raoxu@uniontech.com>
References: <7B818A718E70C344+20261125080021.3907332-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 08:12:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Xu Rao <raoxu@uniontech.com>
>=20
> cdnsp_gadget_suspend() now always disconnects the gadget and stops
> the controller, even when the link is already in U3. cdnsp_stop()
> disables the slot and clears active_port, but leaves the cached
> link_state unchanged.
>=20
> If the controller retains its context across system suspend,
> cdnsp_gadget_resume() may call __cdnsp_gadget_wakeup() based on
> the stale U3 state. This dereferences active_port, which is NULL.
> Port-status event handling cannot restore active_port at this
> point because resume holds pdev->lock.
>=20
> Remove the obsolete wakeup call from the resume path. The previous
> connection has already been torn down during suspend, and
> cdnsp_run() puts the enabled ports into RXDETECT. Let normal
> port-status event handling establish the new connection.
>=20
> Fixes: eae6460f6173 ("usb: cdnsp: fix wakeup from S3 after controller con=
text loss")
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/7B818A718E70C344+20=
261125080021.3907332-1-raoxu@uniontech.com?part=3D1
