Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B513CF68E
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 12:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153696; cv=none; b=SD2OiI3yx/AY5/8qlxdryn6D2z1yJFxCu8xM3Eu4kwFLEfPsvE7soIondgVl0bUaSk/ZPwCCbhwwWGi3A3jwdWxM0bHx1hMpZzpVCuLQQECufAXmo4wH0xLDd/nwdDnknXDftRgp52UG4krIBdXMlGVez93tUtp97VnbO87CoF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153696; c=relaxed/simple;
	bh=xjfp39qX7weEegrMRyyw1AZ2vOfYJfIvYAeMg/SCMTo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nwca/hW+pK9tisNL8Qcj+1CWNT1CvsHWIkkx9NHXmdoMlKIqx0X7JvRVfNiDmSWayfM1hmhmU2fjebKihBssXrdOKYKmpMfqFVyqt6zrKruBq3ZV7pmK3zh65uIxQzPKpl97J/GOhzn8rbtloVg9V8N+mHXbYGmxAb10lJhJInA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EB6m+8T2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EB6m+8T2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268E21F000C4;
	Fri, 16 Oct 2026 12:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792153695;
	bh=xjfp39qX7weEegrMRyyw1AZ2vOfYJfIvYAeMg/SCMTo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EB6m+8T27ItSkoexeAsvLnuqLerGV5IBDBq0ALUGFeVzYn2O2HiedKjZxz9PYh0sm
	 uZJqUlibnRD29JzXNQ7wHdEcOlRR5ckidy0owtV/lcHD1G1P9Qzls2+UqdGT+S4DoA
	 y7NQA2QNn2DnOekqRfoUHi/HMLNAkRe2+sMDX775uT6tWTe83rC35kzpDTEUI1zY3p
	 qiJ9LFBApcELwJ54tG1yq+xCkUMit4D7+os2BdZ3LyHAEgv48r2lMHAMTRLEquD2sW
	 9NZCJS4IzHbj3r93/9Q0th3BPKrFNoNafPZlzFjeZUpJn3q/LQg73+yfwdQ3u+vmoX
	 RPzksMylVSeVA==
Message-ID: <sashiko-outbox-174293@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: typec: nb7vpq904m: Set client data in probe to
 avoid crash on remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chaz Bailey" <charles.s.bailey@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016122045.187862-1-charles.s.bailey@gmail.com>
References: <20261016122045.187862-1-charles.s.bailey@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 12:28:14 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> nb7vpq904m_probe() allocates struct nb7vpq904m, but client data is not
> set during probe.
>=20
> In nb7vpq904m_remove(), i2c_get_clientdata(client) returns NULL, leading
> to a NULL pointer dereference when accessing nb7->retimer or nb7->sw.
>=20
> Set client data upon successful allocation in probe.
>=20
> Fixes: 88d8f3ac9c67 ("usb: typec: add support for the nb7vpq904m Type-C L=
inear Redriver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chaz Bailey <charles.s.bailey@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016122045.1878=
62-1-charles.s.bailey@gmail.com?part=3D1

