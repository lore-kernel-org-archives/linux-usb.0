Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795735418;
	b=TiK6NnCQ5Dbul5jrKAueNplnQFBmwmOfp/qMONvftjC2xv6Oa3hC9UIZrhcBMLhwHN6w
	 wmNz5zVGQ0Q27vz0fATzZH8kEuUdLW6F/SNjxRH0m7OcC5gZwm9jIsW0r4CUqugG4zkI4
	 bILO0NbUcLOIjpG1F5xCYYD/6tVJchOkM519/r6hizFSGZ79RzofhitYIxGeoRlwH2h7D
	 P8MU9q3FJ0gTy6pcYhtInHwEqr6bui19CvjUaqCm+blWZ+z77FDS3OHgTyMQ7BHaaQRWb
	 5i25DId+jAoiQImEz9PiHeNHXozRthyNp3+rMkmcNvQN0jLrGnjGMUCOzZ95p2a1U2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795735418;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=I66czNqYkLsfgL4UKfGjd8b1baJiPzMyOkmgwSMquxk=;
	b=uT0mtTZHoMEtkCP6pYFQK3wKllYHXqugHfUOz0aAkWH3NWZwEce06pmaNnFZq4r7nJYr
	 E0UTD7Tp71nFwuiQM7N808dp2d45CAnbhIjEDU0EkEcfY5oB5ZkGbrEOAR/1ev9DNN52q
	 ZCoJlLwWFh+v5UaTn0/b2z+7ChvV61hS/E4h1F3EgylEbwVKUihyEIzFK88M5UsSk3B7X
	 Z809C9Y2Wxh4h4jYf5aX4cw4T/EA/kFw+lPdpkRlLVYbHmqj5x5PM4VAYZ1uRjV/V9FiY
	 UF9c5BP2c3q0dILSZy61jXlXFfIZIg8JqJUYc/x52P1Mzh/M3SODDaetSXuVQy+1qDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lyre7fpI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D45F606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 23:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lyre7fpI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203AE1F00893;
	Thu, 26 Nov 2026 23:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795735418;
	bh=I66czNqYkLsfgL4UKfGjd8b1baJiPzMyOkmgwSMquxk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lyre7fpI6kKH7fPaGIQxM4mwkFCtNWWJkMlws2bfV6fvtYGpte/oYu20sb0FZQ1Tw
	 2sc4/o6VcgkJoeGCkBEuNgNj9QAeORofVBMl3l3Tg2z6ScS5RsxlaFhaDzq1RNo0Gc
	 Vsg6MEMzJZ2fFIAgzZJwV/MpJevyL4XCrKnjhSRHKiYrOX1OmtiQS/a1ii2RuM0vex
	 m0Yx62ZsNMKadNBMOfVtkXhhE7zYGs4Cq6cV5ei4HGjZfyZ+/aKiq6dP05P7RdPbqs
	 qs+PA9Okf1abSXn3YpUy8x9lMyIULve8gJheWSuNJ1DfHJ25cEViKySHCoiH2Sj2Lb
	 0OG8vd+CLxKSQ==
Message-ID: <sashiko-outbox-236322@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: cypress_m8: remove trailing whitespace
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Novak" <artem122novak@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126232159.68334-1-artem122novak@gmail.com>
References: <20261126232159.68334-1-artem122novak@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 23:23:37 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Remove the trailing whitespace from the else statement in
> cypress_dtr_rts().
>=20
> Signed-off-by: Artem Novak <artem122novak@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126232159.6833=
4-1-artem122novak@gmail.com?part=3D1
