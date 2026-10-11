Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C8A34F24E
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 08:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791706361; cv=none; b=EIcspNPEhtEmbIIeknx4iCgErN69SeaHEA2H7hDXcBu/8NyASR4aDJFO26P76pPsjVyUcqIQ17AU5wD+BzpcHp66PieBXdKc0hYRZMTG2ByOHNP6wyE1N+3KqTzBGhtUQt0XHkbm2wuAZkjoyHWJD5P7rl0WLSqMVE6m2SCEZv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791706361; c=relaxed/simple;
	bh=8qcKNeazhIt0fD/E2r1NNv8eNkKn+mERMBjnqgVS8mg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=N7RTwJZnJHQgGjjq3bod4WsQXjU+N508zNmW4DdPrH4ukvA29iitwryADY5QjdaBu7HqA8fXecWHFgVx4zoI361R9qCEov9pHAlUr32cp6gmqPDyPsAh3LoLNdlp5e3h6taec9zHBwvxF05CO+3w8YW6CBpwfk7KGQyPE9/iLd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rdjodnjw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rdjodnjw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E56C1F0089B;
	Sun, 11 Oct 2026 08:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791706360;
	bh=UW/PqSRtndB5YlCUXOhDl15B/7vUx8KF56tHk2UqbzI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rdjodnjwr5pzAnyui3j++kXKeJKo+VKUMR5ZfQg8br6Q7vQSqEpdPsRDI4HCsbwTs
	 0PvhYAvhhOb7H4RtnNLkeco3EwrZq3DSGHUE8wS0AAlJnGSb8AchvGpsAzrma2n+RR
	 X8nQ397teFmdp5wjxxLOf+72NO4tk5TzvT35ojU9P98BgTqTFXC/nn9xOYvPmhXTGJ
	 /k3MJtkfW3Y54RDs2GmC7MwKDquCwnU0hM6XU6mNPjcZaB4aWItS665rGTKcTtzM2U
	 JpOGhrej1zMHBvIDRWpIySgu7IUwbcU+0b3r+ob20rngm06Q/x8DW2O0Nv+Y3oWjTi
	 pA8DZM8SI0zYA==
Message-ID: <sashiko-outbox-167120@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: octeon-hcd: keep SOF interrupts while a pipe
 needs them
Reply-To: sashiko-reviews@lists.linux.dev
To: "Orgad Shaneh" <orgads@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261011080506.2394708-1-orgads@gmail.com>
References: <20261011072236.2381546-1-orgads@gmail.com>
 <20261011080506.2394708-1-orgads@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 08:12:39 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> cvmx_usb_schedule() now sleeps on an hrtimer until the nearest future
> periodic deadline instead of counting frames down on every SOF. The scan
> that finds that deadline only looks at pipes with
>=20
> 	next_tx_frame > usb->frame_number
>=20
> which is right for picking the deadline, but two kinds of pipe that
> need a SOF to make progress are invisible to the decision:
>=20
> - A periodic pipe that is due and was *not* started: no idle hardware
>   channel this round, its split window is closed
>   (cvmx_usb_find_ready_pipe() rejects both), or another pipe owns
>   usb->active_split. cvmx_usb_next_pipe() looks at the isochronous and
>   interrupt lists only when is_sof is true.
>=20
> [ ... ]
> "due" and would keep SOF enabled permanently.
>=20
> Fixes: aebbc7d63407 ("usb: octeon-hcd: sleep on an hrtimer for far-off pe=
riodic transfers")
> Assisted-by: LLM
> Signed-off-by: Orgad Shaneh <orgads@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011080506.2394=
708-1-orgads@gmail.com?part=3D1

