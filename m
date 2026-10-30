Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793342382;
	b=N//rcH54Ttkuua7OEsDxwKAVgIlANAtDKnomSPZJTxiE/b5WBVtEvpWZBk4ajEKksIUD
	 GIMRYZYMPhFLzE5xs/hFhPF1IZ7ztmHFpI80z5N57C0of23Y2lPUdoAxdtWe3xueuXHOR
	 f0CLBwljBNM6Tr8HpIwFTPKYp1jUqzg2EyzJfkYrjYbe0q2KhiY8p2g0HX7zawZcz7Hi3
	 jcaASmO6TFKwJCI5LjDixaLHMFqa15rFN6VahF7QprkMoP2h5s91u6Yza5nwVYnAVE/Ys
	 BuhbSzeZX26E0Z4q+6xkUTJKFQoTrNEzcU3NAQa5kOZOZ6K8kQUaipu0eMrnuNCQPrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793342382;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Llzw4FQ/ndvKwt999gI4AGhjnLDfoO0ZHMgRLyJiJu8=;
	b=zJLm+PsharbcEqPmxSXjxYiAZKJpeEzquNTapEYT4y2NGI7tEWbl6mFG2vsbeWcIMNRa
	 Jl2cEZbi9paSxoPgK/tcbCyqXHFw9IQp4bu2R7EIrnuzrbzNtDH27nyTRvuVQ08jTrzbx
	 k7tumgVh3e3QpAxdmT51IFvqnLHjPz1ujgl8MTFYGwJuftAAbKbuC3JTjM4LCJPg/L6B6
	 Awb+FKntkFHOJIhs8s1mthmwNa1op9CpYbmK/P0HKoUfRKjk55F0B0JB5prJEnNdKdQvZ
	 /FOdllNk2s9FITpT/WWJzYby7ZCkuui5QqnLX5hO1wVU/jqMhmq7q3G/sebJVI40aQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cstCd6Mu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E078B606A31A
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cstCd6Mu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08F71F000C1;
	Fri, 30 Oct 2026 06:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793342381;
	bh=Llzw4FQ/ndvKwt999gI4AGhjnLDfoO0ZHMgRLyJiJu8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cstCd6MujgqMQHzurY5Ct6kxXNGEzpngBSXi/HeCTnOEHORZp48gIUMEKE+hWhA4w
	 UenGfpgxyMF6O2zDLmpvLT1/STXfVEKvjrX5VTSCitaPvAx3QrzQtW0KkySQNJBQeW
	 R3jfVyPcUnT8HzAOwWgXHBFiGIjPLRv/xuaqQYZXrceuESRTyg+1JAti4kmT35J3WR
	 bzkpe/XCSO8bxxHmHdbSGsNx6Q1Bd0i7z5+h2970LxmQm2VQslhvk5615e7CSP8D/u
	 04fmwbnAAT5WaDFA3lft73U3NnVJOKuh4o1sXAXFhhYt24IOuA0HOubbny7Y19ChQb
	 vo57Sgh7S12eA==
Message-ID: <sashiko-outbox-190605@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: hcd: Cancel BH giveback works on removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Pecio" <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261030072129.40d0d89c.michal.pecio@gmail.com>
References: <20261030072129.40d0d89c.michal.pecio@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 06:39:41 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Turns out, we do actually need to flush them, because workers use the
> 'high_prio_bh' and 'low_prio_bh' members of 'usb_hcd' for a brief time
> after all URBs are completed, to track pending completions and possibly
> reschedule themselves - see usb_giveback_urb_bh() implementation.
>=20
> Flushing would suffice if the works don't reschedule themselves, but
> cancel_work_sync() is more robust against stray completions.
>=20
> Syzbot hit this issues twice, but not reproducibly yet. I needed a 3ms
> delay in usb_giveback_urb_bh() to get reliable UAF after unbinding an
> HCD. The works run in soft IRQ, so they can be preempted by hard IRQs,
> on PREEMPT_RT, or in a VM. The latter in particular seems to offer an
> opportunity for "unlimited" delays and may have affected syzbot.
>=20
> HCD unbinding can occur on hot removal of Thunderbolt peripherals like
> docks and monitors which contain xHCI controllers.
>=20
> Reported-by: syzbot+cade843a1e4af0651f5e@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/linux-usb/6a8a5047.dbb3a75c.13dd47.003e.GAE=
@google.com/
> Reported-by: syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/linux-usb/6abb3515.c6a7fab7.e5ea7.0459.GAE@=
google.com/
> Fixes: 8fea0c8fda30129b ("usb: core: hcd: Convert from tasklet to BH work=
queue")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030072129.40d0=
d89c.michal.pecio@gmail.com?part=3D1

