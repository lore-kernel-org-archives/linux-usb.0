Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023233;
	b=tN4stcPMzkBhEqxO4+rYgLn9OKuiQM+g39yNySTwJZ1eLCdxUwIwKvAYXMQN81mG/eN1
	 JnVMYhKy+t51LV0Xxpu5A8JfTZ++bBghMZJ5lebUGWX5A/Ll2pmEgI7VcE+aSqIwJRF00
	 5EtjV+Eis7CzqKusAZVSmy6UdKOtOdc09LjZBMHbFNLrxDWTthvOXubfD9Ix5E3dWh3uR
	 esZM/Sar6yzKX+ZrDIoI8y2Gvr/UVqyBXHMbm3VKTCYNwG+cG7ejOo1bcl+qEsxhhmOk9
	 rQvyh7PYiI8Gd6T/+Svd7wbO6smcz/gaK0oXH3DJ4vABdlh9xlj608zx/tzic/uXGjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023233;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SIQSA7ejVakSc6n3jrqnVwo0XS9jJwfUFIpehigT6P8=;
	b=cTivI91bZXG2zmKdeklotuVoGJk/5Tj26LQEs6T9zIL74QsC8WO7v6nHVHOaDfWjgxXK
	 Z6ksNvZrbJakGEYQvOipw+v75SJSm27VYBgPXgt1/oU5AGr0Vsb4pKPvM+e2NpGtN+tQp
	 KQjqcytNzm4gIDypWaEOuYQHaZJhJWgkRHdVS6Bth2isSlvTRN4rsI1UAMoRs5AvRr+y1
	 2eh5tuuqeEjHTQcFwQ7B1iVeckhhfHu3jkbMq5jl3rdQoD8Jlf8xTwaOMhN6AeyYycfPu
	 DgUfImc1d2IVIiichFzK38FT4vSiXnk4XGa75hPXMYs6a71NA8jWpEN23NKl/k7/JUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jgpNp/Ae";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5E1606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 14:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jgpNp/Ae
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D54A1F031E6;
	Mon, 26 Oct 2026 14:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793023232;
	bh=SIQSA7ejVakSc6n3jrqnVwo0XS9jJwfUFIpehigT6P8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=jgpNp/AeRDhe7lI99dmCmQTnw1zcmMnVPKLRv9osHQY7VzSHDr2NLaT72KfqneAXp
	 lzhcUVHmnTXToFm7mcGPkKr6cxHu8otPyCZYx2MfjyVBUT8KThbaNyL4a0RoiKfVj3
	 8MZc5uJLI9bV9AFavGu60yZcYDWeE8zwQ/LaLGqiKadSUTWsTNrGnV4//DvcDx/gJj
	 +iPf7QQJEL+jxN8VHBcPM1Dra8F0ARfHKwuHl7940S7+/ThciuAaikMtK7mPA1JSir
	 Kt160F1lT1pjmeDrRgIqmaRXHAPTLMgv+EU7fkACAZfzP+WlGRtwLI211XVRjdklvr
	 T9Wfal46BuODA==
Message-ID: <sashiko-outbox-185363@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] usb: dwc3: Add Exynos8855 to the generic
 platform driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvarasu Ganesan" <selvarasu.g@samsung.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261026135715.33071-3-selvarasu.g@samsung.com>
References: <20261026135715.33071-1-selvarasu.g@samsung.com>
 <CGME20261026135755epcas5p4efa15a5e7540d91b4411a7b324aeaa5d@epcas5p4.samsung.com>
 <20261026135715.33071-3-selvarasu.g@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 14:00:32 +0000
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
> platform glue. While at it, alphabetically reorder the existing entries.
>=20
> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026135715.3307=
1-1-selvarasu.g@samsung.com?part=3D2

