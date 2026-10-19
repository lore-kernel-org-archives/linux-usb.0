Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578224F55A1
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 12:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413418; cv=none; b=mvLkSPNHXuE18FB7kPoxPWMc9dk0tMmVkMfloxiySYFJvpGRzOgV5Age7JELFi2t9idw9uGNlrsge09kF5mKc9epG9QStAZofn1glJt+JSiJn0YVrJcg/qTW7XsUjionPydF3T4OdUahDckkLnWSVfqcnERrH3iHQOKnKF3CYY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413418; c=relaxed/simple;
	bh=MsSztkfzJH75+b1uAyyietpALWtCYgVJkjFrVAGw03g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=K4GMSn09iRuwEAt/V/b38M43NHS/DbIXQYm6oJJ7oDr5/wl9aQCIC8rhctJx/Mm7cqBC3+Rhq31Z6exAURDO5NsAC4xhagUtc9TfVIbXdhOGV0eTrVKy7VWIWKNzQ8/TxTjJZxVHbDA2xfAWdg+zoOwSkZxmTLXbyzfRwvFC8G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnIifj/C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnIifj/C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9222D1F000C4;
	Mon, 19 Oct 2026 12:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792413403;
	bh=sRcDIpBp5F5Mo0neq7UhRP5pd86JoKbXVUtmKcbBRps=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fnIifj/CGtQsWdQb+/76DfiRRnVqKhSPIB9wAziiOct8BjvieN4+kBnVOYJ6PcRPo
	 oTtGoVT+6ST/J+MdTBhEcQSAjxGRpOTlVMiOch/iSjAWNfF1s5ba0Cnlzj14yMyv5g
	 2/t64WHjpj9Evk6ydyGNO3QO7nI2kancZ2uX+I3c2j5S7XfhKP3xiM4hWkxapNjeXJ
	 pd0cvbboCUUgP9sgo88cfApKmhIMrvvvz67YY3Jm0mBzAtcsC40B+BQ3lKR1jtTlT5
	 ZzGoTxlx+ndq7dYsSY0aJflVWO6wVV45jy5XUu++pUOWBptdZU74yvjph6zCKETtnQ
	 +8goipkQ3tWGQ==
Message-ID: <sashiko-outbox-177075@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: upd78f0730: fix NULL-deref on hangup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019123412.2007715-1-johan@kernel.org>
References: <20261019123412.2007715-1-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 12:36:43 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The port tty pointer is cleared on hangup before deasserting the modem
> control signals and should not be used in the dtr_rts() callback.
>=20
> Factor out a new upd78f0730_port_tiocmset() helper that can be used in
> upd78f0730_dtr_rts() to avoid dereferencing a NULL-pointer on hangup
> (e.g. on disconnect).
>=20
> This issue was flagged by an LLM.
>=20
> Fixes: ea534e0b4047 ("USB: serial: add uPD78F0730 USB to Serial Adaptor D=
river")
> Cc: stable@vger.kernel.org	# 4.11
> Cc: Maksim Salau <maksim.salau@gmail.com>
> Assisted-by: LLM
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019123412.2007=
715-1-johan@kernel.org?part=3D1

