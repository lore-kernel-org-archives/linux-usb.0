Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795276670;
	b=rSeF1W5oweuE4OXack9i9DnLvMRmEFu8YbfNJWI1LD5CQRRkAyhjZvOjmJDKRRHA1ntb
	 Ll21Essh8hzK3WRt3xNC3IJCzQMg3zc8XyafYdD1b72UQBpIGydDRzuMFEO5PS0VknlhJ
	 RT1pNm2JB+32eaC2BqXNtYZOWR2gCAsFWWIiUCznbrPTCnvvmiO89Bh8u8W7PPdTqgaZH
	 gHoV0eUUyOeX98jEIVycOg/azYXRsJvtzeYyfc94Kn3zrcqDQIjLX1guilbAek/puP5CE
	 xh5yuzyu8vjgVIatEaKI9Cnfw5yeOOhObCPmNvlg/IZz/A/ov52czbooPVf+Jc9tU+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795276670;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5zXDIt+YR/cC2n8uaWidmuU03YkrK2DXfn0Yz77lWxg=;
	b=u+BW4hhM6hs6zQ3mMtHxgdn9NVCodRgZ/EcQ/LjJSlPUDjvOAanm8+WPOYvb9K0a5/nD
	 RAjMoC78/4dMcw15mTVvqNieR57kK2ZGYx7dvSyuMmCa29XMumSZ/qVxYHQu+FO6dc+tR
	 f2y+DgguODvlo0pnpVxHTggs4jOMr6c9rRbZeANmAdpJzuJdn/JmEtJ1kh0bMZl5R0lMW
	 Qyq492qf64afhF98CNFWWUzPwaqw5REHHfDAmRjRwqeIqzycI/pgDWFhVkGzAlUYy4Tqh
	 LVCsVfhPdrkBcjV4X2OtRcA+f+foEYV5jHAHjlb/auM6jCvEe3n3BUA9KEWGhiTApqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLF3t6Qc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4F4606A320
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLF3t6Qc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0A61F000C0;
	Sat, 21 Nov 2026 15:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795276670;
	bh=5zXDIt+YR/cC2n8uaWidmuU03YkrK2DXfn0Yz77lWxg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iLF3t6Qc19upftbqgb8TGukSQu4hxnUaZH4F8ihwO6qkkDUeNvz/wrEcqdpvI4z9V
	 rNuKJy1Eg1/D3u7pT8+1u10+Q8U4nzptZc4e2PKLwlFgRGgLgrUKgdoSTrXMl5e2VB
	 8tx3NBaqPSitFX3Of2glfBGV/AiBfXgMB1MN0tmcSyD8oXnd8cBDwfqhkH4eVWqOQ1
	 zo07QQqS08t2ub4psmYAy/yXeE27QwVtUxZ/xnGfgHmi60NmBCub0idQTaFbiN2eRN
	 gItCMV5Vh0gtE9hyxtq12xy8xlVY+QtqpVXx+4DeJqq5G/7hrHV5ilCzGHC8ZBjsrQ
	 5sNFJnnZH6jrw==
Message-ID: <sashiko-outbox-227141@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] usb: uas: expose US_FL_NO_ATA_1X in sysfs as
 ata_passthrough_disabled
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWF0ZXVzeiBKb8WEY3p5aw==?= <mat.jonczyk@o2.pl>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261121155253.4980-1-mat.jonczyk@o2.pl>
References: <20261121155253.4980-1-mat.jonczyk@o2.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 15:57:49 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121155253.4980=
-1-mat.jonczyk@o2.pl
