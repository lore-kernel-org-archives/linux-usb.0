Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793688894;
	b=Jr11KMYEX0NrZkdsCKSyocNi6m43jV4RnCeHowIHRpduw+Wjs1FJKUS03FdoFk4qLbkL
	 h3XRVjN2fPzwBPfiGcgK7svVNEMZEnerBp4UfbC3+tXz6y6/RCfh7CidHcNHqLwA86aLp
	 VVm6TIWolURPEp/9oyfKjvrqGVj7vj+O6V0dElMhO0rMoo+QZZQ7B9rbXhP+RBlTaM8gT
	 W+pyKSpQTItUOkwAl9e30G3ccsDOf1skdaY+jJd7Doq8iGRmNAdBk8zBduWG7FecyCMHY
	 au2w+NF2O3h8dGm/keSP93JK6VnYqpaMleCiB+kTpXp+8Rj6K3eNaa4jh67/m+2jBTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793688894;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n5JVzz4jABomGbTdhl5e31YfCj2Kep/9bSFoasFfLKw=;
	b=5YNHXPGLXo6ZUmXpLpwXCXIkU/GyO1hNo/Fu0KJQkuMiZGI7yt4MLUqp+vHuLqZAEYMh
	 xpsZhVg+zoLU1f8VKx5EV3oOfKPy8qy0WZslwT2CRgwdKz31TDYI0qmTExKAqwuoJnSjQ
	 4YQUp3dS6GSZ4sejD+Tm5W/846b2GlZCd5qFMMGLN1ZGHMurik1tXXbWB+2nLrl7sgrwM
	 g0d/XZvRAQ+SJpDjzuH6JQ3P3/+XlbIcHclAjlTGSanMpwm5LOpUMlVw8GWz80Pei6y50
	 AOiWDczHhBwAEvWhVNxA8qu5C6PlVWJOQAJfVTT4jqCnU295ZOA1d5S20KG5rlB/3Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XtvHDtwS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FFD606A337
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 06:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XtvHDtwS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D273C1F000C1;
	Tue,  3 Nov 2026 06:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793688894;
	bh=n5JVzz4jABomGbTdhl5e31YfCj2Kep/9bSFoasFfLKw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=XtvHDtwSEOPSdBXO3nP3Hsr3ZawgM2XrPFiBx0h2NMpl+eNulMWJtcvq93t5c3/HL
	 PTMwDDqf9zkFlI3UguESEx2hdtQl7AesbjG0+XXIkBGDxQtuJd2u5WgQWdRtaM+zMA
	 2j4m+N/AmBHzE/1T+RMwBjl8YnqrztIWOwQDNe0ymQ6Ze49mlPfz5xEMbPxik3YOqq
	 DEHFUFAVKwN6eXK0Xo7xVw4NAxlPlqD7yow71N61bni6dTBdU1OqWPGbZqUNxHKyga
	 wmoi8pmAd8W0kZZhX1wQIDgSaFYP8XD3kn0xiEq1GxTuaOjekHiuep5CiOSCqxO31A
	 ZODRnXz4YRmaw==
Message-ID: <sashiko-outbox-194678@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] usb: dwc3: starfive: Add JHB100 USB device
 adapter port enable quirk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Minda Chen" <minda.chen@starfivetech.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261103064836.71059-4-minda.chen@starfivetech.com>
References: <20261103064836.71059-1-minda.chen@starfivetech.com>
 <20261103064836.71059-4-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:54:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add an extra iomem field to struct dwc3_gerneric, so as JHB100
> can add PHY adapter setting. Other soc also can use it.
>=20
> Also Add Starfive JHB100 USB 2.0 device controller generic init
> function to remap PHY adapter io memory region and add adapter
> pre-run/stop function.
>=20
> On the JHB100 BMC SoC, each DWC3 device controller is connected to a
> port of the xHCI controller that is exported to the server host over
> PCIe, through a PHY adapter. Setting the adapter USB 2.0 port enable
> bit asserts the connect status in the xHCI PORTSC register, so it must
> only be set once the gadget is ready to be enumerated, otherwise the
> host fails to enumerate the device. And clear the ppt enable bit
> while gadget device stop.
>=20
> Add an optional "adapter" register region and toggle the port enable
> bit from the pre_run_stop glue callback.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103064836.7105=
9-1-minda.chen@starfivetech.com?part=3D3

