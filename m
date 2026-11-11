Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794373541;
	b=cWhNxelA3Hvtn3GTwY63fLFCRQxEtO1Ss194WBspGlH3Y7rNUFKbWA5i9GTW43H4OO3W
	 RGXxsszmMuI8LlwRaVPE7xdEmi1NsWFOlxIlCoBED9MUTRgdBR+zoNeFxeyV9mYY46AId
	 uWsuPEzWOkUDMcPo/6VlZdIfQMPYp10iZxcR5P5PS7Ypr5cVEnKzFp96HfpI6TUlclbM8
	 msO3gNOoPT1n35sxdrglfxFtH07qO/2Is3gcnuH9QWnVhwDZVZd89R4lnCYnI/0EbdXEM
	 rSKsbEknzuSNKp8lnzufxL/XP+FQe/Aps0XJ3pY2sipuWRQFIHYhwyTV8jpuyR/F15w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794373541;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Cz+XG45qZrC9EnGGGZY8XxWsj9YcRv31iZYlSoiPMvM=;
	b=IobE6ELof7OWDBuqmPHUVZT3Bwk/K6azqVHz4D5HFBxtILz0Sg7rTwcCsteFNovdiwzN
	 E3f3b2rLWVGMwrEJ6q79ntRVGAoC51SdHPByiniVvCiTWNqk6gCYsJ77/VPPX/B1J7ojk
	 DTA8OdZ3bCkqnyfcWrt6lz59kT0bYk6i1Xy+QqFdoCUcISwiBpVfhmqx9/Fbg9n1oPV0I
	 TB1HoXQhxcUZo1Dq+ycpTX05Dm6FLANiZeq+D5867f7A3pTsKHYHksZokHBYhNcmJOywG
	 YvxA/TrUavrr0yAhkgYfXz5aBykswlD34wJuHeKMwwq4UNFGbKqcGysrVRD38v1nUVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PeyP15UR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972F5606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 05:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PeyP15UR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BCD1F0089F;
	Wed, 11 Nov 2026 05:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794373541;
	bh=Cz+XG45qZrC9EnGGGZY8XxWsj9YcRv31iZYlSoiPMvM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PeyP15URuE3aEXlf61Z2qk0jJaAyTsKu5qqEjTiX/6Av6l+fcu+rMw5xQsyynV7aT
	 ObXL4O2bGfHTa8ASPQw5LTsalJmIgT/QlV5MEFFOiC0T6xBllTQf8xXBi9EIxRaEVV
	 UXwjUvrI0QOOroHFx+JAix6vDbxKFN9WNPi7gmrxDii+OP9pYnufIqxweIzDHuQ21U
	 XN23wGjrTLhjiti2rTa1MTBxZIzNRMvVE6TFE9dpvOvqt6QfUFSDbBOo+1rNjcRF3O
	 eMLmRKl/gVDq9I2fGeqF+KlYlimTj5lKKO6Zqo9B1ZxsSUXsiDc/zuRyw1zHvZyUH1
	 T30G1WvXBtP9A==
Message-ID: <sashiko-outbox-208322@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: udc: handle NULL request in tracepoint
Reply-To: sashiko-reviews@lists.linux.dev
To: LiuJunyuan <2058432396@qq.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <tencent_924108DBAEA30F3DD09C66FEC41A965A970A@qq.com>
References: <tencent_924108DBAEA30F3DD09C66FEC41A965A970A@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 05:05:40 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] usb: gadget: udc: single-word name in Signed-off-by trailer
--

commit 6804b1034e0597891cfe25f25e74344c3996cdb7
Author: LiuJunyuan <2058432396@qq.com>

> usb: gadget: udc: handle NULL request in tracepoint
>
> usb_ep_alloc_request() passes a NULL request to
> trace_usb_ep_alloc_request() when ep->ops->alloc_request() fails.
> The udc_log_req tracepoint assumes req is non-NULL and dereferences
> req->length, causing a NULL pointer dereference.
>
> Make the tracepoint handle req =3D=3D NULL so allocation failures can sti=
ll
> be recorded safely.
>
> Reported-by: syzbot+2a7ce560c30c4ca3bc22@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D2a7ce560c30c4ca3bc22
> Fixes: 5e42d710a108 ("usb: gadget: add tracepoints to the gadget API")
> Signed-off-by: LiuJunyuan <2058432396@qq.com>

[Severity: High]
The Author and Signed-off-by lines use a single-word name ("LiuJunyuan")
without a space between the family name and given name.  Per
Documentation/process/submitting-patches.rst, DCO sign-off requires a
space-separated full real name (e.g., "Liu Junyuan" or "Junyuan Liu").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_924108DBAEA=
30F3DD09C66FEC41A965A970A@qq.com?part=3D1
