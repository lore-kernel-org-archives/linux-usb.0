Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005581;
	b=heu4TNIcMlKv134YD4tr54PL0e7V/ssL6frJFXp0DblJPsao73zvji+m/+Bd12dpuRXp
	 SbeefHGjXsJ9W1/dHeoOMg3L6SMotjYHZdDfi7CrodVXRZDIprsGSheWyaRXKnobSiNlt
	 iniymhHfQzJdI6tCg3q23dR4255JbIYiIc2T45kD8dzhX+B89cY8vuR3yILzYRd0sWR2+
	 Ewieh+HtAQVDX36T8CUnIPd1rMa0sI9HMxREoXlIW1LrqfgDtg8at9BzVySQu5DAGEVS5
	 Yl/3W6JWvLFaoZ7l6sJPMPcHxlTiunTATSzewaKZ1sOp3i2eZ5W+GvtIbFgvsVZafvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005581;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LpXlHVVlfqN7ZsSpQ1C0eh0rx4TwvRmT4Na2it4nMvI=;
	b=l6eNABPozGM2GyVQ07OWejylxZ1XS/luD6jtBmF9/LLOuFeOxuWidH5sy1T2ZDDlRFXH
	 m4k41apbx7Kvbp6zRFFNntnjYDCV0YpxeDb5L1ia3iA9YlRgNMAwqAa4pVV3wv1q75NLe
	 b3p8t328F3h9FrAczr5cUehCBW/xIUE/6NrwMzUFUSkAFK49GkbDWEbVzs1ijIUM5Jo8A
	 uOhnXRDssP2O4fX1ztt2NDt6F7s0wa+5T8ROjk6P+pxK3bZUq25QsriIELmT2vFgxPzvl
	 txA9lks+HNGWX4tQ/MA+y8th5XLadP4I8iBLyZTKjEMMJ2XQrBqWATKuJnxwnF6ZfQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLOK3p34;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1594606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 09:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLOK3p34
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D50F1F01828;
	Mon, 26 Oct 2026 09:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793005580;
	bh=LpXlHVVlfqN7ZsSpQ1C0eh0rx4TwvRmT4Na2it4nMvI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MLOK3p34DHG8wePXDgJ+mSkcidJn6NYfJ7rIzTVz5HWCqR4Ntisp5kPx/n2oMNnns
	 qL+Oo3nrDm+/SXJsfHrCihHYwHWZkfRDKv8H9TCRprk8/X9yUJAGFVZN/okrzm8xrj
	 VxjYDrYQ0RMIShGpXPuhnx3CQmO0ppIC69Zv9kVdZrV08DCQXS5XhwzGpYjkjPCrBO
	 0ek4T2oKPKqtwMxMdd+fo8yIUbchlIA9cGaVE/PEkaP+JYfmavsoNaG7qXqZ8PtdC7
	 SPOoA/9MehA3aBYXxpfq3qhofbE8yBttCGd3GnapMGfDEHObGmfgKQy/aIo5URcCT9
	 fzYdcXj6af7TQ==
Message-ID: <sashiko-outbox-184731@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_ecm: serialize notification state with a
 spinlock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu Zhang" <yuz08559@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261026060031.60582-1-yuz08559@gmail.com>
References: <20261026060031.60582-1-yuz08559@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 09:06:19 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> ecm_do_notify() guards re-entry only with an atomic_read() of
> notify_count, then fills ecm->notify_req, does atomic_inc() and
> usb_ep_queue().  This check-fill-inc-queue sequence is not atomic and
> runs from three contexts that share no lock: ecm_notify_complete(),
> ecm_open()/ecm_close() (netdev up/down via u_ether) and ecm_set_alt().
>=20
> When the completion handler decrements notify_count to 0 and re-enters
> ecm_do_notify(), a concurrent ecm_close()/ecm_set_alt() can observe
> notify_count =3D=3D 0 in the window between the atomic_dec() and the next
> atomic_inc(), and queue the same ecm->notify_req a second time.  The
> request is then added to the endpoint queue twice (list_add corruption),
> and notify_state is updated concurrently.
>=20
> struct f_ecm has carried a FIXME about this missing locking.  The sibling
> f_ncm already serializes the identical state machine with a per-instance
> spinlock.  Do the same in f_ecm: take ecm->lock across the is_open update
> and ecm_notify() in open/close/set_alt and across the state update in
> ecm_notify_complete(), dropping it only around usb_ep_queue().
>=20
> Signed-off-by: Yu Zhang <yuz08559@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026060031.6058=
2-1-yuz08559@gmail.com?part=3D1

