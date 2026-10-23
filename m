Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780116;
	b=EoMtErVHI+VV0+SLken7R3OgpdmE7Vqtrm2K60HI8SIFJzddaJeB/3c8yepUZXpideYe
	 g/HwgikvJBwiVyN8XA09tzbgKZ0hQ2GIlSYhLNt080wSIDFteg+rPRClg9OY5iaBhjmCU
	 JmJJBwSy76XqnyGKjnnB6cct4KQbEu/g/1ufIglijj/r1G+gd8nOvyuVPCHhDHN8gaEUm
	 E42hsrOdyL4DTkraX6x58BQ4xkucmDJmQFTm1nImLDyG5jZkipr8iNmStLI73k6ZXmboT
	 7QZ60VEDkrJj5+rxY6Q0QH0/JH1Q+uaHC0GV93PwQJdwBmeAjtlIY3+HvKW6JRTBQdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780116;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UPd5dLJeGlzv4c33huit64nPV0+yxMcWPhHkhlliZ50=;
	b=lBbZ2wwkINZ1hmUhD8epQSinQj9L/cOkjA4OJtUGWrUUQtmA7AMLf4jpaeDoJmU3qwgn
	 Ct7Neu8rocsxz2A8Ft/IiCHWScTZNR86uiF4EE7r6IlhtWuUy0OIlVD6CmKJ+nHJyfFWP
	 iYHe61eUt5FdrGn4BUS4/1e6uezSKekEuASsw7QrIZ/ot40F/yw4cLPyMpVIq7a1jlCem
	 FggRD0EM2NBeJ2+WCtDmIfj7cvMzZWNhIUA0avklKCAbcBR/pJTU/WKXGlBycro2evsES
	 PQMUcEFmXoAf+2iHq0n2DstKVU3E4nKIKrF1iJNcjkg/ZUfVvWYwjQH0clE7D7NLaSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ic3Jzyjj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0247606A31A
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 18:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ic3Jzyjj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACE81F01825;
	Fri, 23 Oct 2026 18:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792780115;
	bh=UPd5dLJeGlzv4c33huit64nPV0+yxMcWPhHkhlliZ50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ic3JzyjjM3T5HFhp0hmNkXoNJsZJrVobhkHZvdPBQU58Xsrwra6n1A4EPMBXJuazP
	 ycnTYwkZE0a8j6M3oBklmAtKZmNeqee+GPvsvWAVD/qw/RtjIxuQlpZZonoLty+fmd
	 F6yinqFcGo4B4m9ImWtu1r1ggQ/2qt+HAklVZ7j24Y0zqthLX7Wrb4V4rHjMYZYkR7
	 3CIdvoAu/u53RR26aN4JGT17lChcbo8W+3MTnG7wrqoyMFOzkCxEk3PaexLKw/dNl1
	 RmTjc9cqocdUFcY7NENI2MvjPLckUgVjC0rHT6u6c/C3CmtWt5R0zd7mKcb3k3Ed+F
	 DE6aSsHMI6WFA==
Message-ID: <sashiko-outbox-183063@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: isp1760: fix use-after-free when kmem cache setup
 fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shuangpeng Bai" <shuangpeng.kernel@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023181857.114054-1-shuangpeng.kernel@gmail.com>
References: <20261023181857.114054-1-shuangpeng.kernel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 18:28:34 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> isp1760_init() ignores the return value of isp1760_init_kmem_once().
> If creating the isp1760_qtd or isp1760_qh cache fails, the error path
> in isp1760_init_kmem_once() destroys the caches that were already
> created, but the global pointers keep pointing to the freed kmem_cache
> structures: urb_listitem_cachep when the qtd cache creation fails, and
> both urb_listitem_cachep and qtd_cachep when the qh cache creation
> fails. Module init still succeeds as long as one of the driver
> registrations succeeds, so the driver stays loaded with dangling cache
> pointers.
>=20
> When the module is unloaded later, isp1760_exit() calls
> isp1760_deinit_kmem_cache(), which destroys the already freed caches a
> second time. A controller probed in the meantime would also allocate
> qTDs and QHs from freed or NULL caches.
>=20
> Propagate the error from isp1760_init_kmem_once() so that module load
> fails cleanly instead.
>=20
> Fixes: db11e47dd7b0 ("USB: ISP1760 HCD driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023181857.1140=
54-1-shuangpeng.kernel@gmail.com?part=3D1

