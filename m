Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35212527FCA
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 14:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418574; cv=none; b=dwUHPk+QChJ92OgvpMW9+1AQVdnOAyaS4rdjozsb0O3S4GPYS/tuA/6HvfejJM6vmSBlb1xN1JW1lD3tNqgZm1BTqFjDetdygmCypAJeWFL20OM/kmS2yznrX239xvsHBGgYVyD5mahfcYuOZBSZFJeER1ywcAPUskYeKQuPHb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418574; c=relaxed/simple;
	bh=Q0/QTryyr8/hNNqLAUMP+oa/h0cX/3m4bjKwOUIBpUM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=d3UYhT1s5WVvJYtkep/1WcQX24p+dLejKHx3WLifIm1dqRbwBRq9pgsRQz3yGsogi4OBs45b0s56StwcGF+IX2dddBsslU5c8W9eT5Pf4cFSTHd5gKz2q7m8vCzONgfyWUNJxX/afBp8ujE9KWi6oHQ/sdAajaM0TZZHmz16QVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AVg+ZkzW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AVg+ZkzW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3921F000C8;
	Mon, 19 Oct 2026 14:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792418573;
	bh=Q0/QTryyr8/hNNqLAUMP+oa/h0cX/3m4bjKwOUIBpUM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AVg+ZkzWNQU7NUeyM5Z3G7PuvpgdLpLIy9Ju9+bzBqaNjpGVoiPPZJjDJXM8X1NFJ
	 +bx3PrUwuysg7kMnd6jZwojLI/+7sz+Wn3SVlrGUirwOZqLhNiPO/sXb0o1kAIvUSB
	 qoGq4ImytVX90lO3OcW6UcU7qVFv+6l1u3VmBWuIUdS4lxz0GvHoHg12yjuTUSKAAQ
	 qlrOtOEtCKXnMVj0naY0JlbC66Hb2NGQRXQ1z9fsXvtbtNdM5eWE51q3VdHNP3Ovr6
	 prY/7Qpk1nGT06CPa+Inve95iU+h3YD6LC3VqwYG6G4HPt9n2szbgXEW557ey8/Xk+
	 FAojUuNK1+eXg==
Message-ID: <sashiko-outbox-177267@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.10] usb_string_copy: Use kzalloc() to
 avoid leaking old data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019135441.1420968-25-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-25-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 14:02:52 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: David Laight <david.laight.linux@gmail.com>
>=20
> [ Upstream commit 057df423bf4747091cf942af57307627e941e1fb ]
>=20
> If the string is read while being updated (which is why the copy is done
> in place) and the new string is longer than the old one, then the reader
> can read memory that isnt part of either string.
>=20
> Use memcpy() to copy the known length string instead of strcpy.
>=20
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> Link: https://patch.msgid.link/20260608095523.2606-37-david.laight.linux@=
gmail.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-25-sashal@kernel.org?part=3D1

