Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506705;
	b=tHemufrPPwqFZ2HCQ3eCTdgaxZBbxbxMRmYhG10ZHZtIVvhwi1hrW7BQ/GTn5tm6mMjh
	 +XtoWFYxBr/MmPvW9tLCL7nttMeHCcvd+u6PK2cIlYlMegsRtPyC8cwi1TyMBr+Y8sffF
	 UDFRKtXkeP1YrIiDy3LoxVx+dD8z1YlQd8cVzhqIQbV1UmNitdNG/ca5k2SUuEwp8fhWX
	 NPKzuZUdmNy3GsQQS+xbt98URw/nZu43lixcUo/YR8HP3Om3AKhL11sf9cwXiran3cfo6
	 nQRCLgdz9IiMOgL7N67GuZgE54iCN7rjtAhjALLs82Pw0lKcQWkURO4NMa4WZ6pOzcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506705;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PAJdC3WRD1j7i3YkLeo0/w6OYzannZ/OllFeWBae9Ak=;
	b=kr6R0Uz293ZdtYwkaqSENQizNfiNzWw7rsozyTSQFcNNztMMuOnY7NBSksLFFBGvoS0u
	 jpfJbj6QeFUPLo/I74mzN+DEg8r9eHvcVPWvaPUOwmF+cSiTbPeBEHAZ7mKovKlvETW/T
	 aXbrXDSHinSXliaM/Q8kEmmc29ZI6wb8P0xKQaF1P9EnA83Anuhxk3Yo+UZz5cVqhPbjE
	 Adi7kDOvHNzTzWV0EZsgcsAfacb4et7D2S9By6tRLkNYQGVJ/IoJOC6hDgWH1Qheqdl0P
	 e8zRy2f37lTP6WgnV59x7bweFPRuAVVItdeFDWmFm3daforLj67I97UVgz9zRs6NThw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N4MAozix;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851C8606A31C
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 14:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N4MAozix
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFBD1F000C4;
	Tue, 20 Oct 2026 14:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792506705;
	bh=PAJdC3WRD1j7i3YkLeo0/w6OYzannZ/OllFeWBae9Ak=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N4MAozixHeDCRk2DMHFma86l9hWKVhrpfri+Bws27LjU7W0ays6Vyx9UK+rbjmCwW
	 piQsm5ae9SOfpFR+GARRayOa3lgABNWOR8gsnG+pcLC86awDy+B5+zL1POV9RdJ8Xd
	 Y03Bph+gkDbUNDGTNI4YXK6jLIz695Hmlxxme0KPw5jAqbQR7rGaS5wSEtaOvv5MXQ
	 iRO0XEJZav9rgd5tdkCqMP7FeGJ7oeasQEQ8106/hsnln31ZFhD76yieV4LAC6jbYR
	 QX2KzlCAFCPYJMUejrVBTfscf82x4PfxW7oje0c5zk3gyIt2+OwuAgRBYig/ulcNyK
	 /TePUMpETflVg==
Message-ID: <sashiko-outbox-179144@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: musb: fix double put of gadget device on setup
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anfernee Cao" <anferneemelokc5@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179250629747.20696.17364135141613638741@gmail.com>
References: <179250629747.20696.17364135141613638741@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 14:31:44 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> musb_gadget_setup() calls usb_add_gadget_udc() and, when that fails,
> calls device_unregister(&musb->g.dev).  But usb_add_gadget_udc() already
> releases the gadget on failure: usb_add_gadget_udc_release() calls
> usb_put_gadget(), i.e. put_device(&gadget->dev), in its error path.
>=20
> The device model documents the same rule in the kerneldoc of
> device_register() (drivers/base/core.c):
>=20
>     NOTE: _Never_ directly free @dev after calling this function, even
>     if it returned an error! Always use put_device() to give up the
>     reference initialized in this function instead.
>=20
> The extra device_unregister() therefore runs device_del() on a device
> that was never added (or was already deleted) and drops the reference a
> second time, causing a refcount underflow.
>=20
> Drop the redundant cleanup and just return the error; the UDC core has
> already released the gadget.
>=20
> This issue was found by manual code inspection.
>=20
> Fixes: 3301c215a2bb ("USB: UDC: Expand device model API interface")
> Cc: stable@vger.kernel.org # v5.10+
> Signed-off-by: Anfernee Cao <anferneemelokc5@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179250629747.20696.=
17364135141613638741@gmail.com?part=3D1

