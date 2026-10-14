Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3A439023D
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 03:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948699; cv=none; b=ua53qrv2RgoMrMNPOI+2/BgLK4X+xk4RXfhk9YeQPE/JfOMr9yuBzoKDjr+oJqUKXIBqx+smDe39lfN36mnbNDM2tz1FvV0AT/Zi5xMCCaERQDXzF0efKhWW2tjYE2eb/DkgU/gsgVgh7lvcaNKkpbLvvaMslq8ujpoNhHpxvZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948699; c=relaxed/simple;
	bh=mtraD594mOhQvXmZuH1M7aA0ro4EUeqbINbKOOF0CpA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OzyLCnMxKVmDkWf4eSctpuNnlIQBb2njvxD4lC5w6o1tyLXz2+L1XjHq8WRkzefRc/ZQ1MJnJWEmUwQ6Zy8gGMPHEJwyi1xwD4R0bhuBdGU57gZEtbJ1Z0rx2miMqcUPDsYuUoMh24gnkyZqeaiZJ4HMqf7YXFsCDnqwZczSKec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2hS2Q9e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2hS2Q9e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6C71F000FF;
	Wed, 14 Oct 2026 03:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791948697;
	bh=mtraD594mOhQvXmZuH1M7aA0ro4EUeqbINbKOOF0CpA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R2hS2Q9ePwwgERJOzJGlksElTVYgIWZPjKRuBGT4MsrbQcTPQGpR1BFFgPdRRy/fg
	 l4jZsPgb4R1MPQz5L41zZCeO1DZWSlRMou2NALv9DhaQR2jWIVfxI1SNixQJrescoz
	 ntsqNkhbIWl2s5nQ11HJouC36wFTQA9BacswWd7fkRLxcZ7fReYFUgkuT77zYEDUTl
	 MXeA6fd4I5EhLi/xVsF+5eg4OtXTVQlYnLEb8gl0Nme0CeHz5fin/gYSvPRimYq7vW
	 Y2ea7bMnBW7RrUDpw4HnwD+Dj4yZuX4cpO6qihiE806JPEqe7QrcJhEWMun3e6RrOZ
	 q/BL670yFU5cQ==
Message-ID: <sashiko-outbox-170780@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: dwc3: st: balance reset ownership on deassert
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <hppiscas@163.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014031920.8390-1-hppiscas@163.com>
References: <20261014031920.8390-1-hppiscas@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 03:31:37 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The ST DWC3 glue ignores reset deassert failures in probe and resume.
> It may publish the child device or access the glue registers without both
> reset operations having succeeded.
>=20
> Check both results and unwind DRD setup failures as well. A shared
> softreset provider failure must go through undo_softreset: the reset core
> has already incremented its deassert count before calling the provider.
>=20
> Track whether this driver owns the deassert pair so suspend and remove do
> not release it again after failed resume has unwound it. This is reference
> ownership, not a guarantee about the physical reset-line state. Resume
> itself needs no early-return guard: the paired suspend callback clears
> the ownership state before resume is entered.
>=20
> The issue was found by our static-analysis tool and manually reviewed.
>=20
> Fixes: f83fca0707c6 ("usb: dwc3: add ST dwc3 glue layer to manage dwc3 HC=
")
> Assisted-by: gpt 5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014031920.8390=
-1-hppiscas@163.com?part=3D1

