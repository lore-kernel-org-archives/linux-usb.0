Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285379;
	b=VHojjbTi2d0uZMiciQ7/y4s+unnErFIU06XKrqSaXqMYzsbOD4xioP7V8LyMyqG6I23D
	 D+sKmmgBxLGL8VOg0KjpEzhFayE9t2JQQYaYx0lI1VTeICMXWv+yOR4RzyDj28nNx4vIZ
	 JytxdE9/+ZcdsD+ym9xft0rQwvUJvI52D2Zac8TlhFlcysOnbbcbZaefGIooG8vLwBdqf
	 +3FcbORq7DMyaLN74b/Jba2X2CtuH8uAjUpXzcRpxAmQ4gJkGSPum8C+Pt0DVuR+L3ojn
	 SLACUoYZmxrlRooxzptfBCHjPyGk0l+M8VQDSpiLL2gthEMXxlIy0G7gFTJv8FOeJEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285379;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JGqiYocY0+lPeV6i1Z1GnhHbITsSMEfVud+dr82VthU=;
	b=1CegyxqNLNSnoPu4bTISWlZovT591blFzkYnl7/S2b2xqnA9w4OgQrAVHlbcBVEvsqzr
	 VsE7FrJLg93J5QqrPAlIgtPAlGA0I7ydh8R6BjpwRC1+4KYzxJPvCsVcEKfYtubUalnIv
	 vfuRPD8Pu+WSdzUh4mLuxSbMVyFnnwJp5ikLr6P/zzgDZuEK8eu0aAJVOKYNCn+0oZBQq
	 QkeK8Lk3TOAheQu7uaTEYb9pVG8uINAZb8c7OH9WCp32iv/CKlObOs1WpzdVL7KQCogED
	 65FLLHO+wsvfkj6q4emXyHYNDuI4KlKphgf0p4V1QAnGsL5WlVEFOqGK5UjajjLSy3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZdP+5SKi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1EF606A325
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 04:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZdP+5SKi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377981F0089F;
	Tue, 10 Nov 2026 04:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285379;
	bh=JGqiYocY0+lPeV6i1Z1GnhHbITsSMEfVud+dr82VthU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZdP+5SKijg+FM/+ahRxvCP30RN/pE1XRnpXSoMjxkYfLXaJo+AXwVkFxnHjWUBw/7
	 e6ZylfTmY0Fd5tvQTiEn2jDT9hEXfEsQQpgqb+p6clhkYWYBDchtCLsHcaffQ/77c8
	 Tr5PCsuD7s/M46gbLdVWxULLVl3bnDh3rWxbfI1eCzJaUg3JK0IPEe5Ffdh+aklNZU
	 wioeXdnPZIPmRL4nh7svl9RkoQ08ddl8LimR0niNXFNO2xFa627kNiQbs6z9pg9Mb1
	 PvXqBypuSXoXMqL4C0KRuBc0UEuOeSQOzXgwKLsjanALKG7kyd9l/VT2A9CTXYbfTe
	 TOibTR4yMsYsg==
Message-ID: <sashiko-outbox-206217@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/4] usb: gadget: gadgetfs: fix ep0 setup abort and
 unbind state races
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110-gadgetfs-ep0-v8-v8-2-8f90434574fe@gmail.com>
References: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>
 <20261110-gadgetfs-ep0-v8-v8-2-8f90434574fe@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 04:36:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Jing Lin <kayano050408@gmail.com>
>=20
> Several ep0 state transitions lose setup abort notifications or leave
> the file descriptor in an inconsistent state when control requests,
> disconnects, or unbinds race with userspace I/O:
>=20
> 1. ep0_write() drops dev->lock while copying an IN payload from
>    userspace.  If a new SETUP packet arrives in that window, the stale
>    response must not be queued for the new transfer.
>=20
> 2. ep0_read() waiting for a delegated control OUT data stage only checks
>    dev->setup_out_ready, so it does not wake when a new SETUP packet,
>    disconnect, or unbind aborts the transfer, and can consume a newer
>    transfer's payload if dev->state re-enters STATE_DEV_SETUP.  In
>    addition, gadgetfs_disconnect() overwrites STATE_DEV_UNCONNECTED
> [ ... ]
> re-enter STATE_DEV_SETUP for a request the host has already abandoned.
>=20
> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jing Lin <kayano050408@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-gadgetfs-e=
p0-v8-v8-0-8f90434574fe@gmail.com?part=3D2

