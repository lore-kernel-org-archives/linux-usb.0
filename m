Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CFA369D5E
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 07:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791703671; cv=none; b=M40bQkVCtRflquGzwTB3/eIy0WHLrlDiVhqRO/m34nOG+jANsxb2afmpPYxsccnIvVXqloXiXGOkcMc3umI1gF/slw5gZ6WEo/cINEoaFYlrQU5u7nDfA5J9ltfBcxEiVVwMBunQe4qdLvPqGHPpIhZ2ZoEGBvR8wBqBlNctDKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791703671; c=relaxed/simple;
	bh=XU4F5JdUyXU/OHxofTCDM3sUc4q0gQ6tEMC1hg3M/5U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=pksnOdNGm+Vp745cjDwx6KCSpFa+Y5FyHD2BXFaiBBYHfZGt0VihZH81gymUgna6/qXa5YhqYufjGN2TmVicIUPrag35t9OMpyUaqvIrjuMGTJWG+RekdI9ZgZTPZUB86seDg1obyyPis7ww/hg6Vww9jMEuUUwGe2h6ht6UyFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZED1wJV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZED1wJV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE971F0089B;
	Sun, 11 Oct 2026 07:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791703669;
	bh=XU4F5JdUyXU/OHxofTCDM3sUc4q0gQ6tEMC1hg3M/5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SZED1wJVPl8hdLUTbGyTOmV8HtTo5u3O6OA6EbNrC1OkkQYtcZi5Aa8vcXxwRBw+o
	 s0fqyB4IVDSqjOVcXbEizS1rHqJSrXS3bXUG4/qa5iQej/Y1nnEU1SAYljucaXEH3u
	 Ym0Ulm/Dtq91Ok9PAucGL641SgTN8BTPv4faYaVs9WhWKcxHiy4uTHs8Piv3OpG8/u
	 zWvMJpvfXfGvIbUBVeqY9EEAx/hIZfUzWJzjRHtAniTPzGueZd4dZaEDfB1MzB2F9F
	 8X2FCpk5MG1tu7nT4C6XbNOd13SdBz1czNJXBuBN9G6sk45BZFgtiD2/aPKZqNQk7p
	 Dkau1NiStoEYw==
Message-ID: <sashiko-outbox-167104@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND] usb: octeon-hcd: release the USB block when
 initialization fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Orgad Shaneh" <orgads@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261011072238.2381564-1-orgads@gmail.com>
References: <20261011072238.2381564-1-orgads@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 07:27:49 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> cvmx_usb_initialize() gets as far as selecting the reference clock,
> enabling USBN_CLK_CTL and taking the PHY out of reset (steps 2b-2e)
> before anything can go wrong, and its only caller frees the HCD and
> returns without touching the hardware. Both of its error returns
> therefore leave the USB block clocked and out of reset on a failed
> probe.
>=20
> Release it on the way out with cvmx_usb_shutdown(), which is the undo
> the retry path a few lines above already uses. It cannot refuse with
> -EBUSY here: the pipe lists it checks are initialised by
> octeon_usb_probe() before cvmx_usb_initialize() is called, and no pipe
> can have been opened yet.
>=20
> Fixes: 22bce6d2b3fd ("usb: octeon-hcd: fail the probe when the USB core d=
oes not respond")
> Assisted-by: LLM
> Signed-off-by: Orgad Shaneh <orgads@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011072238.2381=
564-1-orgads@gmail.com?part=3D1

