Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011895;
	b=1JqRzu2hCIY86rVp1+hBhoh2RB+0O6y6LiiQuS19tMoZXXMZEbi/fmyCtgNF50e5KGrh
	 O12+Ec5b538gX/GIiCR5X7ue5DaZQQ4l386eDNkGNyOzm98MQM5UMgLCRLlJ3j9poCiVB
	 CIB9krJKkIi9KvVDjKTU0WZoAGPJiGyO2+pzh48XV9WTSqANfgaqjrHtKYSHvaJG0AzTK
	 oSpHsOICa93moi1nOsdr/hGAfedIZe2hbDAoEEcUTqlEAfNJUhSw32vE8MYih8xRCqdEx
	 7fjrgzITaXpTkX0KyDvI/cTeH/feqHdNPl8mExnRNHECozqlIAlEJf1n8rgVAzOhmvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011895;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HXuL5WyfIfg1ZlpxX/9pMzZQLKyU/Lq/1cp0TPW8WXw=;
	b=GAYptFQlAwPfurtv6VOmiisZKaInyRHfw5WRqBSyVEiT27vRaZSYf0L5fJbxKAbv/Fcu
	 jl/pZpGTxbVwqSLX2XC9ufeuq3e7ROxCUfgbZa153GC5hYMOWg1vOKf7Lod3UaGokyJH8
	 DR1EuXMn1iDas5qZzwTI/pcPLQ2X0Lyuz2m0Csf3NFJjrrOpzqQcnT6XJ6OfHVIQlXR7I
	 WWd9tHkhMJX3xh3Lqh3tTh6rWjfsOJp2dg5ZlYTZye6/yD3aARxc+074bTuTxjFw2tVJM
	 sSycbZQJpKAklafsKDsR9aAh2HVUnysq2FQqF/a9HoKFcCsUmvpLs4aCg2fl1qIt1xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqbtAYbO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1158F606F9EE
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 00:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqbtAYbO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE191F008A1;
	Sat,  7 Nov 2026 00:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794011894;
	bh=HXuL5WyfIfg1ZlpxX/9pMzZQLKyU/Lq/1cp0TPW8WXw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kqbtAYbOg/GPeRbhIEj0J4C4RG9FR71aRBAJc2/hu9c7+WgAM7ths0lQUpHMaIy5N
	 E7CcPO3O+objEncahKXx4EQJNTMSur87efBuO37taZnWVuvWdQcdHXEoSkRegC2LiE
	 kjw9lBD+kNaB15TdpppLLMkAuNAkishuZRaorfJKDx22DTS408HqC9Fx0n2zr9j0ot
	 UNuVj+1VOGg2OSvwNfZgly85HH9t6CGDyVdzvA+NvQG2iY0Y6JXKGucZx9iitY8i65
	 AivRc3vFP2GFXADB5PR/gm7FAC+arxUsB2LnwdvdMcdjJLJiV5udqJAsS7pre11IGy
	 vmXWTkro9bWuw==
Message-ID: <sashiko-outbox-202435@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] usb: phy: twl6030: convert to
 subsys_platform_driver()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Brian Masney" <bmasney@redhat.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-usb-subsys-v1-3-3a86369c3f86@redhat.com>
References: <20261106-usb-subsys-v1-0-3a86369c3f86@redhat.com>
 <20261106-usb-subsys-v1-3-3a86369c3f86@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 00:38:14 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Reduce boilerplate code in this driver and convert it over to use
> the macro subsys_platform_driver().
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-usb-subsys=
-v1-0-3a86369c3f86@redhat.com?part=3D3

