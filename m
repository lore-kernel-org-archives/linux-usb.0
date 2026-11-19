Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108934;
	b=3BQIUEUWRM2SmLWudFqtIBeF4iE92VQZSvw5oGif9V6KubR4BryvIuTtITCJ24piw5f+
	 o2bhQ9nFdgVGympouQsSD9vFRZzMEaLANUWSSFFb48/mOpD5A4p3PQLjA2YV3Kmtm9ez8
	 wmPDiM9PELonSVkDhV1Y+4QcDtpy6V7fMss7TJNbGy4WlJNtTtX2bFNEhzh5xhNV0mIUM
	 lUqCe4UeZzTL7636yoJQPtzxosY2K5Fcw4Ra+KbOdA97LJB2Co+ZD0eqwDfQGRWLUrOIL
	 wCFfWY3Ynw4O3i8glCQU0yZmiVEZi0h5OZL+ny7sC3D1F2JNUM0zPMcQt3cVdK25cDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108934;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FYQJLJVerVXxcKj8fuGVNsXQ91/lvbMzIvadKM4+4uM=;
	b=0JoDdwc9LrxYT4PLuzdE6JbP+M5GFG4VvfMXLi6Ch1m55lDKHxh8a61oB+qRj+FOszQ9
	 nppVhKnKt+6PyS+TtnOsiMTuoh63hgY33Da4vb7iWM7zwzoRkJjHSzVG/TaKx0rKA5JKu
	 6ulLCK3FXW9+xVEA63/nR/feWPmVqtewmrufRFyED3Uub6WSAChZsXv3vS6Mto8PMIKV9
	 dq7MSMyA/hyzBWzM9VjB5UHpe1OivPaVDAKvGHIlkQAEUdLyixA3wG8GU+QNdNVORthlQ
	 A/SSSWDn7Z2Vfz7lY0G8QyJFya7WpBf+ccfXQo+g/yxXp/sq/V+qgeDUIM5FRDJyaOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FoLneS/r";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096C2606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FoLneS/r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A8F1F000C4;
	Thu, 19 Nov 2026 17:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795108933;
	bh=FYQJLJVerVXxcKj8fuGVNsXQ91/lvbMzIvadKM4+4uM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=FoLneS/rClunyN0Q11wgvhK7eXEAOsIQdOCHQg6y4jXum762Zn58Vl2Ma/TSpx3Zm
	 cMnOGpmLvJdMACY4ClRHGC5qgEBUUljD+3iIChO9tXVnvfrVnjFFKrK7Q5tRTVxmto
	 EhKdCUV6D6Slk8COvxZkztKv/L6CHUn+eR6f8Yo7nbIsaxJPI3Yj7uYHWah6V67iw6
	 9Dko3hlv9h8XIvNL76m2S6OUDGKjq4JZbm/0qip7jUUz+s3mzRHm9bAuDpCvHSiq+C
	 BcBxfqTXsk0p6rROFtKRn2otSxknnLgavz3n3X4pwZV0ECibmrTU/1yHt0gdbl/fVh
	 BQmIeMe1vht9g==
Message-ID: <sashiko-outbox-223685@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/18] thunderbolt: Add usb4_port_hotplug_disable()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-8-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-8-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:22:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: "Mika Westerberg (Intel)" <westeri@kernel.org>
>=20
> This is the opposite of usb4_port_hotplug_enable() and allows the
> connection manager to mask hot plug events of a USB4 port. This is
> needed in subsequent patches.
>=20
> Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D7

