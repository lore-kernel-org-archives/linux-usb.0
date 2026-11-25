Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598719;
	b=5RtNa5dIDebycfsC2u88OgT6+qO+n4s4xuS/B0EXF4G2/6/bBCCl2rD/25dtYrBL6aDt
	 1CNnAjm0dMaASqNJ/bolDgXZqvaUcR+NC903oW45asZecBCnIVWYNYvMi145FMXXsIBb5
	 lstikjmZR2/YiGWggMnhMCGDZ3u4uE2WL15skx1TxCbrrm67TUgi0L/vziPkRpmieO/v/
	 qQWvESp1Y/Ys5bWrt/H826uz67kjPgw9AtWJPM4f5Re0w0cYojCtWepe/b0asEE85pAzb
	 ykvmLAvKHs3TUIoJjYtUBmLB7hde+g7EpNrAvp/gPvBcbHRw+yzOr7E/UTMfooWmKsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598719;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=x11ulnHPAodXA6I79z3RXlmR4/eEHVb/MCj/OEF1dFw=;
	b=FKRHrtmJ26pLJ3uUlyvU7mEeURd6QJalhisRrUm/gXK8g5d4Hi84jnTlKcb6qa7ailqT
	 eFMgleX+gGXzMCcCz9U83+6GRX8Dw1eJ9qVHBzZGjAkZwi0+uha+e53NWqIZtGduA+pF5
	 5iApHiPc4XzzditLCYURnnUWTB+M5l9Jw8YZRViq5/XrKc/88n5dYwm6ApiU6mJp3fz/O
	 E1jXD+VH72eYtkTScakG6RQNtwsFEBbHlwgN+6pLu/WoOB+w3zUHHpnloYiPfcEn92ePI
	 xqncei+EQinPsNe+5tD4UEzrt2IPGSQchnJVzBHZ76svkHvraRc4V0WtLjk73562Zpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JQeclJaE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961A7606A327
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 09:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JQeclJaE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B991F000C6;
	Wed, 25 Nov 2026 09:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795598719;
	bh=x11ulnHPAodXA6I79z3RXlmR4/eEHVb/MCj/OEF1dFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JQeclJaEBo1A632fP0QJ3GqyxqEppEilLmYE7VxIn7BrrH0y9bBPKh8a9cSJPzYxZ
	 3eJVOVULiWCbdDPDNkBiVIF4zCjsGiLw2RTCWOKG/sdHlX9+AmrRUToOX27S/AF+rA
	 R/k+ONa+iGNDKPjq404SigGsHZ7hLkjcdhaQrbg4DlA6EKw4n1M1SQRckOgOZ7wwJv
	 z+MGdsrqbdkRCuameqxzAoGJVZyeMXm+zRbTT3nQes994H/Yktpw184yXcTUzAf0T+
	 iOV/ImVX34GTwVi77eRU53qi/3t0dFA+o6xh51UL6aFelr3k4dFF4H87GbjAaxq6KY
	 f4FSaXSzfe+uQ==
Message-ID: <sashiko-outbox-233005@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/2] usb: gadget: fix max3420_udc endpoint index and
 bind without pullup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aristo Chen" <aristo.chen@canonical.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125092004.15562-1-aristo.chen@canonical.com>
References: <20261125092004.15562-1-aristo.chen@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 09:25:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 2-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125092004.1556=
2-1-aristo.chen@canonical.com
