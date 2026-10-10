Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C71139CCF9
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 18:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791658250; cv=none; b=UASCRwPT9GscFBeq6xANejkojEGVgmwYa4z1pI0jzo2feJCaq1+YQWooB5+0Fl091sQ8xpYv6iCG7sqrTE5tmYSuaIozwchy3F74kzpVCMaS61jnRnZcGJw3qC5beCworMwcnnrNcSXdE5jhPdKk9/rTjfEMjG25f82q8wYn4D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791658250; c=relaxed/simple;
	bh=JXuIOyr5aUJmgNFW++1JuuVljA+VtlAbDRDhdBHiY+M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=bbjAD4x8YHCsHG07DVX8+XZvuUXeQIKFc70EUuMPJc+Ml0+txqjTr8Vrwd++JSbRD4/khsyiU4A5WOO/GGYAWtZFZrjch4/sQpuQ9380Q7xb5Zy9t7oOY7qPU5Zp6pTAWiSXe7lCYLg2azSw5OZMdsQdEcQ+P7rJ9dWxcKs6HAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJ0Y71UK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJ0Y71UK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0901F000FF;
	Sat, 10 Oct 2026 18:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791658249;
	bh=ASnXAfUbfjC3lrtHovjCRstPdQrbiG/G93DO8y7U0jY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QJ0Y71UK7rSJYc+go9lUudtp3VM6sosVRcJGDE3QTvJrED0vroP2QrMR2bm4gowBW
	 qrS+BH+1H4eb4jvnYuqq8zREcuJ8QfXW0aNs2/p1bIosXpiGfHaujR+jZFxCBC98i4
	 1j9XkWPjCaHEfJFZvXTEYq7mL9Mjeo5DWrjNx5FrHpoUhcQ3Ltx1aI2qcHBFbvgORb
	 QI3E7eOR66+PbTic68q+dRdcYBDYk8Icqh7O5GefUHhb25B75jhFnofjYyiQ8wZwyF
	 gPtQecGOFXL7Qxw2i7iu4HVGFtnW8sWhH5uO2B2/KezpTTdbpUp/FkbjPJYVHui+X6
	 0CIbG05GkcF+g==
Message-ID: <sashiko-outbox-166841@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: Stop a power level change
 notification storm
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Vornholt" <dv@etik.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010183917.146821-1-dv@etik.com>
References: <20261010183917.146821-1-dv@etik.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 18:50:48 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: David Vornholt <david@vornholt.online>
>=20
> On a Lenovo ThinkPad X1 Carbon Gen 13 (BIOS N4BET78W 1.48, EC N4BHT61W
> 1.41, UCSI 1.0) with an HP E273m monitor connected, the PPM keeps
> signaling a Negotiated Power Level Change although the power contract
> stays the same, and signals it again right after it has been
> acknowledged:
>=20
>   ucsi_connector_change: port1 status: change=3D0040, opmode=3D3,
>     connected=3D1, sourcing=3D0, partner_flags=3D2, partner_type=3D4,
>     request_data_obj=3D1304b12c, BC status=3D2
>=20
> This repeats about seven times a second for as long as the monitor stays
> connected. Since commit a0d4618788f2 ("usb: typec: ucsi: Workaround for
> missed op_mode change"), every Negotiated Power Level Change is handled
> [ ... ]
> The ports, the partner and its 5 V/3 A power supply stay registered.
>=20
> Fixes: c1b0bc2dabfa ("usb: typec: Add support for UCSI interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Vornholt <david@vornholt.online>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010183917.1468=
21-1-dv@etik.com?part=3D1

