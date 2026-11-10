Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353699;
	b=ld+YqQc6NlRKo0mRDvavRqYDDMk/itHWaer5H+IpWpskSARw932W/ayHppqL1AX1ZOQn
	 XG4x3GDNwI/UI9wPMrWLFbGNikCpLMPypHGULUglZdaPnz1v22/KSnWpUhLpjPg21Ac+j
	 fD3Azct2QusDylqzXsHZXeASBpFV5oCE/V07MyXemfS4kHm6y8hcjWsmdJnhlO5RCGJ06
	 bpsGAN4u6mNDHHT/lHOgXP/9tYycomUoQumAmdOCxcCNB0oOS8JLpb1c2BOd9gA1gEXFT
	 /c4A1P+/2KYUw6lVrmQgwi1i5z78kmtL3qBVd7ze/UoQzqAgEd7o/DECBDdvcaImp/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353699;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KDjzH2N3NWStWu6iDJ4wUKcYQuuDKtvUiazo51vcFOY=;
	b=4FgrHwiVPl6UrQc0HmjKDtw31euBJzwshUzWnCWdZ0gyZUBvDb3HlMBrMjTN+vpUvcO3
	 D4rD2Hvs45XTRf6sdpwwSGFMmhJyufMi9wd7JyO9b7eL7j4rRapOkxbK2T4LgmVt1jbb9
	 bTOPuuwJS2iZhz8YKL7slSPcprsSA9GcaOZzQGmBaWk/Ybze1ZoNXSKeu1kbLHc1Zucv7
	 qRmAYiZrwEsqFn8EQgAK/Xn4E6uoue0zPGg3+nkv3nwkxqZNE11XKI2W/Gyjld2MxL3fF
	 fOIrUDEa4Fz0vwdil90OFWo79fSpernBDv5Q0wVngSotOxibPPgPgXfYyQjQLpaC5ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AEhnNHol;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5DD606A320
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AEhnNHol
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15831F0093C;
	Tue, 10 Nov 2026 23:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353698;
	bh=KDjzH2N3NWStWu6iDJ4wUKcYQuuDKtvUiazo51vcFOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AEhnNHolO2x3xtBUvGNgxnTTAJjyb+vNvww79tpf7GmFVc09IBUdw9M6FxWsMBuaa
	 iPfG0U9KyGtCygGt7t4s0TFJxJgw2qHH8qaj78bGdddyvwjhlYu6BLK72lRo1c20Kh
	 owPCUdOn9o1GeV6sMUl/HiAouY9bge8yOJCCDpz5pzarlbh5oxI/MVZhz1T/bZVj5E
	 tjip1xszd+32HoP+9NOt4eX/GaDV+0L9rphlQqT3kUV7vpBqWC4GaVz5Cr1LWYU3bB
	 3HIQvAxWu3GUdWf0T2yjKIgfU5428fuqRl6n1s8qu4pcwQMKPT10Sgu2YJGvGroF5g
	 m9xfdQ3w6Kvpw==
Message-ID: <sashiko-outbox-207940@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 22/22] usb: usbip: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-23-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-23-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:34:58 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110075825.2494=
6-1-shishunbo@cmss.chinamobile.com?part=3D22

