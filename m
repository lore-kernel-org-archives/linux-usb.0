Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB1825B0BD
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 00:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792110098; cv=none; b=d1JTXxUFIX37dhyiQHhwWoQI31c3gtJ/cFT5PkphFwe9EATn6Y2q8gOGUbfkmDcVLSRyWMr3F2t7ZhruDTx0x6oFyn2xOp6GiceT2BKFcetOAhhTENOoi0y6rliI/2e2F/OwklLBeA3wX3oB3/JjzcYHRH2Ki+jiZGf//8G7IP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792110098; c=relaxed/simple;
	bh=zUfE8JHX4f2f6jDknwhwIBxiK8JDVuLih3Y8pB3V9ss=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JYPbh3CEUgxDtyc2jg7zDZ21YpDs0A00aHJ2ZDUDLETjThAba/HPURI+Pje1rz/wXM0o1NdAntOBE6uRf3ShqFuTcudzt0xNQkgL9+94RmN23CMpTjm96kraYYxudZL+4xXSllV+mvIcBc/3XimkIdIdLF3/Zjg0u14rEc4hD68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9nJwxbl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9nJwxbl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44021F000C4;
	Fri, 16 Oct 2026 00:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792110097;
	bh=zUfE8JHX4f2f6jDknwhwIBxiK8JDVuLih3Y8pB3V9ss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D9nJwxblyB4o8AytoZyuUOkQPFHfIfHw9m3AhYBALWi1BTqeR8iDxO5uLzD4ECmTk
	 cVEP7aTvlaAEL2vBAsT5Z11XEW804ng+JFljEXATi39PTNkXnsE0/ay56gEb71l4m9
	 QfJFJP8z7jAJoWkL7bVZQBbBAEszPm0cty1e6NcVZwjbC7mKX6KjzvhtCwddcVV+Uw
	 WzSipe8biexHQwsyiTN7d7Kb7yojDN6M3OcfvKegY9jeNHgPLFh66LHIY+VxK81SY8
	 FV7JyNak8auIufj+P7oryez1ajY3s8a+Uvh1XiTFemaCLubq2/qiNIJQwHvq/tLUSa
	 wd1SgrkopemEA==
Message-ID: <sashiko-outbox-173511@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] net: usb: lan78xx: fix error handling in
 lan78xx_open()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Munari" <stefanomunari.sm@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016000521.92868-1-stefanomunari.sm@gmail.com>
References: <20261016000521.92868-1-stefanomunari.sm@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 00:21:36 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> A failed interrupt URB submission leaves NAPI enabled and EVENT_DEV_OPEN
> set. A subsequent open enables NAPI again, triggering BUG_ON() in
> napi_enable().
>=20
> Clear EVENT_DEV_OPEN and disable NAPI on the submission error path.
>=20
> Reproduced using failslab on a Raspberry Pi 3 Model B+ (LAN7515).
> With the fix, the injected allocation failure returns -ENOMEM and a
> subsequent open succeeds. Verified connectivity with ping and SSH.
>=20
> Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved =
PHY and MAC management")
> Signed-off-by: Stefano Munari <stefanomunari.sm@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016000521.9286=
8-1-stefanomunari.sm@gmail.com?part=3D1

