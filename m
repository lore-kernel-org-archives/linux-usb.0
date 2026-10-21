Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592715;
	b=EzIlfEZYlkx/NA7PyGW4GYwH14KDLhSx8n3IWSpzcnecRiLv/TgEbMKggrbNaLFNS6o0
	 pisQ0GPtlnrDNHMtJEiLipRnZUbOVr85zNJa0BB4/qlbX7Uf10BbP1Cm1jB7yCKc3Tj2O
	 B5JOJJmbGMu63QJofZh17UDKPprQQVRfPOMcJfvkM8CmmFn7mw2Vc/ZTJ5Whw6IzcGqVE
	 vlg0L+4AqNNdZUZjbDVTqxQ7z5twZkqXiIKbdX7LRwzNuMsAktJuNVu1Bsvzkyp/TOKW5
	 NkuYDRGBmkQvWO3W17cZ1Fkcc/Nrj/GxDi1SF7ZVnCErZyozWnXAI5xKavjmid+j+4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592715;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zk8du/96qKZdcau7MCze3UpX3Y+Qd8LoHtluM68Rh6I=;
	b=DM9y+LO+rSArjR/+FU+lQfr/ZbVRnpHTE6rPRaWVO6CWYrcnDqDxKMQTCOzLBxGxnzqk
	 F3Lw6VCctG/DkPpsjjJmm1s8lRyS9MlbVgCGSf3waWR6lG9uEkepITZiy0TVAR62bKmHX
	 i2aFnCF91O6aYbWxiaFhr8/zVhQkiJPCfjnciWBvxrUPZ6fIpGRPt9KOGBT4K+v11HO1z
	 Swg/KnDnQXwbLCzW2pZuS1LAMe46RxgD0jtYjFWFS2lOl586Uq/25U1YbrQCWc7wRpObV
	 jRb/FndvHCc725VyFQUZ6RM0Cbj0weWFPLVu5rN0Tq2kG+vnKM2JJ4Qol8xo18DId2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jeqQUglQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F85606A31D
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 14:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jeqQUglQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4566D1F000C4;
	Wed, 21 Oct 2026 14:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792592714;
	bh=zk8du/96qKZdcau7MCze3UpX3Y+Qd8LoHtluM68Rh6I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jeqQUglQxQjGGj1kcs5s5g1idFV+7gO7OAKHPLHd9EKsn1QTtbkiKjCMZKiNH7XJY
	 JuW18GauN0omZcW1J5QePW2w4l86I529L/PfI4yJrra96xwCDxLRDcs2oUWXip6rlO
	 0qM/Sr7QfuUKSidgFnVx2iBJBf2VQ7Mf/7XBwVvUv/IDbphYbF6jY6HoQ0S8tNAwAJ
	 zgMZlLKCri584PXtzsW19aCQGzOp5xzFg3SuWCijWfsenibZ2EmGJgUERIF0bJGdqB
	 gN81MViUtuv6ONJWYQL9dphsEPcro/kAKgZNGu8N5rPIflo6c5S/Er68L8+z/jAMcK
	 dH3yhrp7zv0Bw==
Message-ID: <sashiko-outbox-180365@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/11] USB: serial: io_edgeport: move initial termios
 update to open()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021141154.2324793-9-johan@kernel.org>
References: <20261021141154.2324793-1-johan@kernel.org>
 <20261021141154.2324793-9-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:25:13 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Explicitly update the terminal settings on open() instead of doing so
> from the interrupt completion handler when receiving an open command
> response, which in theory can be received after a failed open attempt.
>=20
> Note that this will also allow for switching to synchronous commands.
>=20
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021141154.2324=
793-1-johan@kernel.org?part=3D8

