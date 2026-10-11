Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0F23CAA47
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 04:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694502; cv=none; b=fctbnrhbu2eU/FKlQc9Q2/GYdZhVRkwIdh0eun+n4ECjMeNDNvY+AO4gTrx0x7Fkb0NB7cBiRPPYF0HOPk7RhEMRoaDjR1cQR3ADWChF8kTcn5I2dpUBDQ3hAbMTnelZRZdC6nOEyd825DEohuNsv846ZZUwbqPFgkEB2c/4rlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694502; c=relaxed/simple;
	bh=S56QlGt5HeY9b/Bz41kaIwmp7Rrt4Fb1pqtHo4ai32c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ZKu3aOxm7ePfKHbrXJSyyzqFPUO//ugnXI6+jqiSLvecLJYxymrfDI/WXIGQqZtnVnI1eTdS1f/IcCGfpB7CIaDQCy4s/i4HZA4aCONUiFsvAYpvMctxV6yTFTNZ3WGU4qCV57mXVREsiuL3vGPtIua8PputDkT25gtXckY8rAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRVFb+vd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRVFb+vd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE6F1F0089B;
	Sun, 11 Oct 2026 04:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791694500;
	bh=S56QlGt5HeY9b/Bz41kaIwmp7Rrt4Fb1pqtHo4ai32c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kRVFb+vdluIFGgSo/abKrDl0vS8zvVil1GVAJo6aa5blGMMP4+l90SFs12NNI4I3u
	 FF6tIJ1mh1/6F9n0LsZwX8MXTndE8n1w46c5dlJB/EK2GsclBgMmD1wJtQ/x9yFnUE
	 141dyCYpZONqKKpfPXkuWEMeRfKm76JbRIJhg5Y48CM+mzo8ooNkchc/vJ9hXdz7Ma
	 NNZ2xbqmBa9BJYfo7pEbV2UubPirZ9koz6QvBJjZNJlZ7REFWMe0ogKWkE1nDzkr1R
	 CDEClnYF3utc+I1tYoy05CxmYbhYtBhYf/qFuS+z0tWHMby5VC8BzK+h9+TMKH989A
	 be7150/VpdgtQ==
Message-ID: <sashiko-outbox-167019@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 12/13] ax88179_178a: Add support for
 AX88179A/772D/279 EEPROM access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010-ax88179a-v19-12-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
 <20261010-ax88179a-v19-12-7475173cfb56@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 04:55:00 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The AX88179A/772D devices have 32 efuses with 20 bytes each,
> which can be randomly programmed. The AX88279 has 16K FLASH.
>=20
> Provide ethtool read capability for these devices. However,
> no write access is provided.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ax88179a-v=
19-0-7475173cfb56@birger-koblitz.de?part=3D12

