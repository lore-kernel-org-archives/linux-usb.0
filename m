Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730140;
	b=5Zb3zfkiJmxqtMWaQaVF3bPOk7UzoJ80dv5ln0RMYSFxU2KHGCbf19aFqyl8KBkBsYiu
	 xyRfPDQFQlhd1qyg3G6gZGDf0ztJbqFwoxzZIgEky6dGuojXMObCUBdo43rPeShW6VXzf
	 LFJ1b/+5xR9cehVLstEXlE440WlFAkE6x5HnUxF8ocfJVUFLz6yCBRXaA3pFtv09ES9jK
	 CkGKUzW6ibXAkcY3PVjosmDuUKkfQzjRz3qcAjXhZriI0LyF824gZeIza1hOPVSt6iIuK
	 HsZDhutXigvIRDRCDuD8gCn2XHcf7hnp3Ux4xtK4rEImQOvnckGd1mSaS8lrM3KZTEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730140;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Kg1DMgZc3J3EzrbalSUpPhr8BrA4ij7UndhAE518Io8=;
	b=UUx0jys1F/avdk1rE4tb5NXsiuMZ2KLgBTwrJtM729UEkn69InvHIo3I5the77I/9qHb
	 iXzd3Nd0WOhpmQN7phBT0vYrvksQtSq2Llfpgec3mQMYzpC3RZpk7KlRZMfKRqHgKzT/k
	 ZMpUUafo7uuu5HMGOXpLbIShs51QQ7r6dIvxdWsF1OMhxa8VKNdr4i+TvX+u1CbVe60DM
	 CKY5m+XcGlymLphavmcls+axTgx1c2ML5+bylsvQjBaxgJyo8HFQv4dd3bZdINhCmCLdo
	 vVJ7RLGNH81KYNfnoEooNdJQXxokXZs7fTmuqxEWEVmOZDUTnGNnX22BddLGkl7v6/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LCzFMJJ9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF80606A324
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 18:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LCzFMJJ9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5A51F000C1;
	Tue,  3 Nov 2026 18:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793730139;
	bh=Kg1DMgZc3J3EzrbalSUpPhr8BrA4ij7UndhAE518Io8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LCzFMJJ9jWm7/oLhOKYxxK5GVTvTHNC3NT7WS+oiOrlkSaXs0EiTEXRaOiIhm0wur
	 MqOA81IpHv5XjdJjSGP28UMhTXLN9U6M9n5/qtbo1kdf+edSLT1sbTxX7Jq39GE5gl
	 vIku9IGk+82F8/5ssrYw0D7u7EJ9XLn/yY0eMSWt+Wxbqwg8sVj3HG8a76yi3MjWBO
	 1MyODPltozBmIH76hGu0Feuvgwb/Wv62sp1PNNLI284IA6HtdJV15dP0hWPBwlNr7G
	 omVZnOSsNqof0lnmxxCz0zDNm5v4GN54uRgr9aFnALn1VA6lhyjckO0dyq/UDiyc2c
	 FbBuUHA4TRgbA==
Message-ID: <sashiko-outbox-195822@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] USB: ohci: ohci_pdriver.h: fix missing kernel-doc
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Randy Dunlap" <rdunlap@infradead.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103181926.2838476-1-rdunlap@infradead.org>
References: <20261103181926.2838476-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 18:22:19 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Convert comments to kernel-doc format to avoid kernel-doc warnings:
>=20
> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_on'
>  not described in 'usb_ohci_pdata'
> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_off'
>  not described in 'usb_ohci_pdata'
> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_suspend'
>  not described in 'usb_ohci_pdata'
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103181926.2838=
476-1-rdunlap@infradead.org?part=3D1

