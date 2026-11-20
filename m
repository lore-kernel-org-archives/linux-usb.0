Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156026;
	b=XlZDooaIx7EaELnSCzlxQPkoocsLr8JXfL0K9Llb8pkMRjPZIo5faWJx4+hMib4nUcCe
	 tnYP6wey/V6Gi9BU8fg08e/5KphPvmN59V689UW/mOFAyNCIRkf2BacNH3D0jO0Ncf3Qh
	 VJI2N8IXDNDeP32D3wlu0jGRTSZEFZdzb54nBgP5LY7sm9f3cYQJCJRPmOueJwzGY3oYd
	 1Gx7BDMv4bNNUoLzX40c8hAY1XI4nsCVBKfNMKHtN70h91Jpz2rndYC45xZB8yFf+NKeS
	 sVMfLEm/IsymBbnEBOVJd3n2+/Cn39pdq0kzwWdLU5Hy1GmuqrEEcqxZMIRf1Khr/jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156026;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fnuoYbrLTcSFecnKEHLgp1B1gWqmUhkkTUFOhvrIia4=;
	b=xlDbuDiBFhq8WyQV4P2TE+MTSE+jweWBwCAh2pFV5FfuRLpkqM5BcybLioxCgwgGJ8o2
	 8pIrP4GzzKmgHmUrY122Zj/1DmnKJavexveRmCovqhZIbyozaSH52HkZTLl8wEWczXZY+
	 eGRMcBK2bEbzgAuFw47/ZGbV/dlsZeIaLxIwqjPzlUNUr5EbkZq6iiOCwwlV7Ao0is8Vw
	 N+RjqRGZeQKn2j9ammxaDS3loxfNrnyGAQCDe7QkgBxUfHZnKMyTsCIlWYbVPQ2bmfNqD
	 BfgoOdJYclG1MmtQQgeyrndjVncHYAioAXDiEQT1Y2pMzgbFLTIYhMPg3fA7Yhzjc8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fGSiiMrv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7FB606A331
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 06:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fGSiiMrv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 001BE1F000C6;
	Fri, 20 Nov 2026 06:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795156026;
	bh=fnuoYbrLTcSFecnKEHLgp1B1gWqmUhkkTUFOhvrIia4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fGSiiMrvLEHB1roEZTNl2+wAbVe4focFljBI8Sgo80sahR0y67toDbF362Ksuz54X
	 UUnhdqqM4xgTk/o016m8pj9KEAdQ1bG5OkrmQBwbYzQhRb3VcMISELU9UWXCOkugpE
	 1gBjhNlZUV2RRKERZ4kLYClPd4i7NNd48QJ/GOSxYlNKoBQL5MLQsW7ZZjrN+uZJHc
	 3BhodatEn3xsHwNkjkErxpTlhudMoXhRlt71DH9VSq1Tv/72uA7xdCEMZckgwxraam
	 53V86+INv9i02sX8qpGnHQcGkP0h+P6m484ka8GlGrPqHQeNT43ZkHfeZCaeI4mDf9
	 3MHKnSAg9bqzw==
Message-ID: <sashiko-outbox-224570@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usbip: tools: Release udev references when refreshing
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120062114.98435-1-zhujun2@cmss.chinamobile.com>
References: <20261120062114.98435-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 06:27:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Device discovery creates a udev enumeration and a device reference for
> each entry, but releases neither. Successfully exported devices also
> retain a separate udev reference that is lost when their list entries
> are destroyed. Repeated refreshes therefore accumulate references.
>=20
> Release temporary device references on both the normal path and the
> exported-device creation failure path, release the enumeration after
> scanning, and drop retained device references when destroying the list.
>=20
> Fixes: 021aed845303 ("staging: usbip: userspace: migrate usbip_host_drive=
r to libudev")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120062114.9843=
5-1-zhujun2@cmss.chinamobile.com?part=3D1

