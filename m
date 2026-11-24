Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541048;
	b=xf7X4W6FYAqmoy0yWyfyOIGlEEL9mLjJ9WK++euFHnqHLXheEotIZAYp8PEkwijGtIRG
	 y5nUr33eFmXpek2h1UngqSWV6CfthznKDEF+P+Uckjcmg+9q34kYUF9exrl3Xq/Y45N1/
	 5NRuRY1iA5a3+ue4icLuTjr7YkWyW6t+9vU9lDpiH5pY1FLNdQwf3TZtxFUxNv8BtZZJH
	 d1y/pmJnhRmGFuAyzsdfWNKHfj9uOUXBVOIWx2djTl7mr/EW4uHuuL8ieIVD/Rt/aLvvY
	 GLCxM9u/cu4+kvSRiKVFj4voLgG8PbZyQUZh/PiohSiPsLGOrLXS0tsyUMKSuWfFiGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541048;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mlSTX7RTGfiB12KzuwrOolzphwoMoKeGSiWGNMERMqo=;
	b=cKlIRPCBMW1FlMZtwKqht09jUJl/bTSVdGnaJGUPhS+GH/qdsZC0E6e7FFod2h/piAJ2
	 oIo/zAvjykk6/1LFHRzfpUmb0bICrz0Ea/CbzA5K4tNXhCWKYyNJeGTqdWlYRDCeP6ZQ0
	 MoOfiiR4Dtr9KItRqDxmtIYmxJF45jrvvk2MZSgTVwBUVVPhv+Ik+4TmvQ1w805K3oSB8
	 gmwaVjJsU9Jk8HqebLU1zH+/ex++6CAb4lj9lmkYuT6hIf3HaFfkBxXsDr8zJzzWB3+fd
	 JhqoAzBRrF1rC24ExWz5WP91a28Ma+Xoj9SeguNVLdBA9czpxPR1SdWgQMp6Zu2aUOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cvuBwVCT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17476606A321
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 17:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cvuBwVCT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E16D1F000D2;
	Tue, 24 Nov 2026 17:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795541047;
	bh=mlSTX7RTGfiB12KzuwrOolzphwoMoKeGSiWGNMERMqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cvuBwVCT/K6iWwv+JRf/wT1LI5PKphw/lmCjNbDr7zPMUryLgV/JqF29EWJEMZ/Ek
	 4Dmti7Fq19ReVr14eNnDuKGfOcf0BGYg7GbEghQazfwdzIhxQFXed+/nnAh+NOtihC
	 aIEDiKdxwbhTFfT1q8QP86MU6jZa8TKSY0X1GSN6h7DCkO2nglw445saKD/id3v+UF
	 AGEcCrsvgEgpQnNbm5hgyKJLzM9fB8GGX3Q1rYneoZhO3pm0j8jwPpWhlUsOrWsQqv
	 B6sqinBuh50NNoowlwJSLVZu4oH2ZlifLQz8o4UzMaPYjyIP+KuL6J2CWknkVl87ex
	 J8+lhPVobDt/w==
Message-ID: <sashiko-outbox-231700@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3] net: usb: aqc111: Fix rx/tx_fixup issues
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261124-aqc111-v3-1-10f2c124d808@birger-koblitz.de>
References: <20261124-aqc111-v3-1-10f2c124d808@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:24:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The MAC supported by the aqc111 driver is very similar
> to the AX88179A. During the development of the driver for
> the AX88179A, the following issues in endianness, respectively
> alignment-handling were found, which are also present in the aqc111 drive=
r:
>  CHECK   drivers/net/usb/aqc111.c
> drivers/net/usb/aqc111.c:1094:34: warning: incorrect type in argument 1 (=
different base types)
> drivers/net/usb/aqc111.c:1094:34:    expected restricted __le64 const [us=
ertype] *p
> drivers/net/usb/aqc111.c:1094:34:    got unsigned long long [usertype] *
> drivers/net/usb/aqc111.c:1122:45: warning: incorrect type in argument 1 (=
different base types)
> drivers/net/usb/aqc111.c:1122:45:    expected restricted __le64 const [us=
ertype] *p
> drivers/net/usb/aqc111.c:1122:45:    got unsigned long long [usertype] *[=
assigned] pkt_desc_ptr
> drivers/net/usb/aqc111.c:1235:22: warning: incorrect type in assignment (=
different base types)
> drivers/net/usb/aqc111.c:1235:22:    expected unsigned long long [usertyp=
e]
> drivers/net/usb/aqc111.c:1235:22:    got restricted __le64 [usertype]
>=20
> While sparse complains about lack of the use of __le64, these spots also
> incorrectly handle alignment. Fix these problems by introducing __le64
> where necessary and additionally make use of get_unaligned_le64/
> put_unalignged_le64().
>=20
> The current code also incorrectly modifies the skb buffer without checking
> it was cloned, possibly corrupting a shared buffer. This issue is also
> fixed.
>=20
> Finally, also introduce a minimum lengthe check for packets as the packet
> length is received via a USB transfer and may be incorrect.
>=20
> Fixes: 361459cd9642 ("net: usb: aqc111: Implement RX data path")
> Fixes: 4a3576d2bcc7 ("net: usb: aqc111: Implement TX data path")
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-aqc111-v3-=
1-10f2c124d808@birger-koblitz.de?part=3D1
