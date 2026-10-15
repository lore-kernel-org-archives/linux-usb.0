Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40CA560AB5
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 16:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080193; cv=none; b=DSXdQHDiCLT5e2UdyJv5m1ugCxMExeNqs1QR9/nKeAdpBS7SkW1Q0Snvh5rrlXRbrQRjauCn4cWlz9KkgGJGE3oUN8l2vCq8RaXbBmNPGR7q/gwMi8Ok9RvKz6zVwoXT7G+DExZf+3c28Q+MMAh46XHNTqVq1dVEyl3TFQicXTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080193; c=relaxed/simple;
	bh=YRJTstLzjt74wPQaFLUI6FHy4u5o7N+5gIsDqmUePGE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SZA1jAX8OGk91Y1SEZql7yNCdIla9UEjFIgDHyuUP61J81hFjXIuHGnUk/z0XYjivYZejZzYe5UR5yCzCz6Hk/VvXvH+exUf+QBMFXoYOe4RAB7fQSp6Dbs8zRgsAsaNdH/nEgyiDuS0TorKfGKmdqCckFZ5kl2ByNdS9uyvUFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIcP5PNK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIcP5PNK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB39C1F000C6;
	Thu, 15 Oct 2026 16:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792080177;
	bh=zhJuNyc0V/rjXcN3KbGywU1hpBkZfmG1ca67R3m/Ka8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NIcP5PNKglBPSZK87qqiFI/5lLcC+jSAXMI9h6fc4k4oXSgL0q8vGrJZDdpelr8v5
	 n/K3sSbvJKWNam79SRjDxlkTbRWI1K5XjPzj0uv7HIv6cByiVBGmr5Lt/Xi5S2EX7S
	 bY96yGHy3Mz4Y+fAbcCzB7CGGxOg1w4VqbBATsZichiQocO2/eUiosyQVGKK5pDTB/
	 EmrQ7hj9W33Ijl9gr15mWIP39hnQjf7CWwUhN+8B+f2a+JAVZIQXoA4+N+LM4pewhR
	 0MRG0HPOgK0bsvG0fgyutBgwGCg54AgXb+X0ZaQBLlM52gB5t7aJWHhx17i2lpem/I
	 3WKB/oIbg+Eiw==
Message-ID: <sashiko-outbox-173125@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: Documentation: Update description of completion
 callback context
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alan Stern" <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <de582feb-a0aa-4fc8-9818-890014de32a9@rowland.harvard.edu>
References: <20261008094338.301a75fa@kernel.org>
 <06a81ea1-b17d-40bd-82d9-922de946b86f@rowland.harvard.edu>
 <2026100910-petition-embattled-94cb@gregkh>
 <20261012194902.aEq58Q6b@linutronix.de>
 <8545800a-a37f-482a-9b06-cbdd70312b7a@rowland.harvard.edu>
 <20261012212527.5sFqlGYu@linutronix.de>
 <41af30de-4725-4913-9ad8-54d1dea2d4b8@rowland.harvard.edu>
 <20261014191141.GxlJhR1e@linutronix.de>
 <89da3b1f-60e5-4f18-9592-3d6d7175c437@rowland.harvard.edu>
 <20261014220403.R38Gf0pW@linutronix.de>
 <de582feb-a0aa-4fc8-9818-890014de32a9@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 16:02:56 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The existing kerneldoc documentation for URB completion callbacks is
> incorrect about the context in which the callbacks occur; it is not
> always in_interrupt.  State explicitly that a callback may occur in
> any context with no guarantees, and likewise for the status of
> CPU-local interrupts.
>=20
> Documentation update only; no code changes.
>=20
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/de582feb-a0aa-4fc8-=
9818-890014de32a9@rowland.harvard.edu?part=3D1

