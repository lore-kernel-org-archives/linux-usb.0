Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881029;
	b=IkU8rGVP+4MSCltxLnFPp0h0y20834Qc4dG0tB+F4Jnx2FVtTHrioZFmekAiXD+snky9
	 LKyJDNluPf6wHpfyrefJfkPqoyapYcW2VqgiCeoq78qsPf/1dRoSSN7rgqj/r/XaZenqT
	 prh4rf0ObgH0xWpSp8u3ArsuW4YOVn8giWfbgKqVXT8T/theelJ/X9ZMTh/dypSNRfzMr
	 AUftWTXQtrg+XqhqTqwFDJyuP9bzoPz5XBEtWGz+JMU5oHhTYhKaYp8hf2XHB6lUbno8e
	 aU6PyV4q0QQuOZSDdTToJR35uwMON4X8eaLgMHNgv3s963Oei5/Ew8MvoTkC1u/ZcJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881029;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a7SJcR/nZM4uzqLkj0zhBFn0mDZzUggkE+ESdgO91wI=;
	b=Bz5FBTCo3Itr5PkYT8b+6dFzMBWerjUN410P8DZj1XncqufV3BUUCL1/KaLqPtiPSfZR
	 lkIkYhXOYvTNe/aMkUq/l0S8IeanUmeX31uwV0fi3pkAeVzmk4dl/jH5KTEBIFKKWFbUV
	 Tda9LqbmR06CWtsIUYx05Cp2sBd5KrFISQdGYUnvzxcIUdh5XuCz4PMx10qet04rsbDcG
	 CZhnlm1kdCN3iz8fAU5jZZpnPzKCrBjYX9wK003c53eZxZCJMFinD/9Txe/+Z+/vxtR2I
	 6j/hT+tbB7Af7QIvnvhcsNNDHQAY9n96adHlTmw9gaqmnkh6GTPE3rzHkTAhgYDs7ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FYB2XHNy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC7C606EEB4
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 12:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FYB2XHNy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BC91F01802;
	Thu,  5 Nov 2026 12:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881028;
	bh=a7SJcR/nZM4uzqLkj0zhBFn0mDZzUggkE+ESdgO91wI=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=FYB2XHNyeGlACVnuPLIwHKP7x6t7IZ+lEGkpN+E+u2hNnSoLDtP8Du8U7n/DQu38z
	 VrZWsJKxre1W7mXgxbwG+XkTtIhOb7KUQBXDZBrEBW2fTcUSslk4DvYbjyp99lkuyS
	 gXGG/iS7sUwre8qGV0LBfJFeV1NHSZ9E9ujJ4h5uCV3rER5zHRQD39aT994tzrIhx/
	 o0mfevkWJQh2m/r3I5ME7q5LAp78xRQDVf3UKkzB/S7BDT62BlnZjC5fbslgUCtk6f
	 LTITL8VYml+E6GgbM/TiCJ6cHFYAbvO2rQYVMfzLHjMRifBlIPx9Wv7M0T9FEjHrK3
	 ZPEPFRssR4/2Q==
Message-ID: <sashiko-outbox-199008@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] usb: dwc3: Add Exynos8855 to the generic
 platform driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvarasu Ganesan" <selvarasu.g@samsung.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261105121401.1661711-3-selvarasu.g@samsung.com>
References: <20261105121401.1661711-1-selvarasu.g@samsung.com>
 <CGME20261105121432epcas5p30c05ba935557ad6dd59514ef4d834e96@epcas5p3.samsung.com>
 <20261105121401.1661711-3-selvarasu.g@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 12:17:08 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add the "samsung,exynos8855-dwc3" compatible string to dwc3-generic-plat
> so the Exynos8855 DWC3 controller can probe through the generic DWC3
> platform glue.
>=20
> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105121401.1661=
711-1-selvarasu.g@samsung.com?part=3D2

