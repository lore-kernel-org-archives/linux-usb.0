Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD421481AA1
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 21:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014098; cv=none; b=OanlGhnXprfY/ufDRIcJTc1yhSKKwuqIsJZqcnr4SSpDR8J2NOdVXh7R/gPhFLZdS0pQQB8MmDqalcx9zj1nlF3hBCIWKXwaiERSI9X+XNxTBFOCI2mnRNE5Sb0JLT7gRxV71b3QRkrAbYYJkZcosf28kUd0Ws+pY2/uxjZCpgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014098; c=relaxed/simple;
	bh=j8oPn4Y2+xXW0Qyozggv09rvPkEp/09JjictS5yMFrk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OIHn2/LdMHytWBvC83RN/F1cEEWxkiLSEnLzt4Hd17V+Kk7C5t4kfPqxHGGq3QTAQ1hzW3WaKmW1x6GHyKQnEFitSFwmVofrG3C4G0Ux7AgnOZPckSmgJbjMCr4asvbUSmYgmpNanTyn22+aUNDPUsuEq4IanrR8AjqF8hP4AVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnNxmj9t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnNxmj9t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6041F000C4;
	Wed, 14 Oct 2026 21:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792014097;
	bh=2l3ysF/srdlF/eRTNNrulinzoTlNdvPNS9UYqR6uX0w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jnNxmj9tvV9rzvW2NHVaaiT7KVsZ26pFRH129+IS5GrLZrUIcstdlHgi4aMVw685q
	 umP0HrGPrAzBa96zcPd4jrMevFi3hdYtJgUGj464jCvHMMpDBMPr3Kk5zaGfJuJEmk
	 l9bYf7Ji+eQbWpjkkTjL0JSSCQmQgrp8/U/X7sqPBjP91qhIyr35gTv9B2j0YuTFQm
	 nDVgHENWLrSAOVNjcdtNQv6qU9t/+8hGnM3tT9vRNScPZdNug/KB4C4NCMIivN3F9m
	 oCX7QJXJ43Qed3T7qKHr63Y5PJQQJnFJBTfUBdCkt8uNlze5daptO994Ro25ItPkaC
	 s9ivAbxUFP+VA==
Message-ID: <sashiko-outbox-171933@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: connector: Add DP AltMode VDO
 definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sre@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-1-b657c9b6e4c3@collabora.com>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-1-b657c9b6e4c3@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 21:41:36 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> The typical USB-C DisplayPort AltMode capabilities for a down facing
> port (i.e. sending out video data) looks like this:
>=20
> altmodes {
> 	displayport {
> 		svid =3D /bits/ 16 <0xff01>;
> 		vdo =3D <0x00001c46>;
> 	};
> };
>=20
> Improve the readability by adding defines for the numbers, so that
> the above instead looks like this:
>=20
> altmodes {
> 	displayport {
> 		svid =3D /bits/ 16 <USB_SVID_DP_ALTMODE>;
> 		vdo =3D <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
> 			      DP_CAP_UHBR_13_5_UNSUPPORTED,
> 			      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> 			      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> 			      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
> 	};
> };
>=20
> The generated DT binary will stay unchanged.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-dp-altmode=
-dt-defines-v1-0-b657c9b6e4c3@collabora.com?part=3D1

