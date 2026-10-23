Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739393;
	b=TdP5MdqpiP4R1C3KbnRlAqK25oMW2vcQzS+eufyWJNpkc+DqGP+oT5o7jgOM9mT+BRnU
	 hy5mVd/6JbC/bHma2QiGx2Ga+wdSGaBIh/y5ydaalC+QFr6cCH1UhmhLxb8uX3kevcP6h
	 lHRQ9s6q3FhxGXDhrmZ9hfwg/CiRA+JXGEHRLdnMXrjjmjmdpFU87c1h3dmXxzVvLMBWR
	 pQmufALlMeSLdvpSfjNiiqNac9S7OdQqxlYWJ5COwJITpIHXNqb5zt/WKbRvfmLaloeF6
	 AIauLofemIeGb4KPbWsRjbpqZ7eo8tZkyiUb6lKT6u/o3A/vyZea1WniZj5o3/hwvbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739393;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=J1nJnfof4LrtVG6mTk6LkE5dGG8B3+7y9n7KZOp5SoE=;
	b=DJzYjt2tRa79tbd0eJfAakCB5dsZBCAJBar2zzpNLjSnO109LvpIxSvVD+dTjKWB2R9x
	 BVSihv38vH48P0AotTbCt/ubzJPGK4GLKcWVt/vd/9E2eZY44UU7gthfXGBqPvW3rQOkf
	 SNix8bsg9eICJ6gBOgH9Kh+ZsLpGzZibznDj/H2hjAI6pKoXDXsHy1F9pAfR2QQYIcQjV
	 RIXu+Yck9S02YRe71ILtcM/4muLGLg0EzAEcTdupISuD6DSiTAQbnJ7MdxOz4/tSgO98u
	 PI6Sv/hcvaH9j9W0BGGY8miH8YgBYHVRfJ0yFieap5AyqXNdvPRW8l+KiFtyN5+Ts2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KuPnTeIm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37889606A31E
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 07:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KuPnTeIm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A9F1F01825;
	Fri, 23 Oct 2026 07:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792739392;
	bh=J1nJnfof4LrtVG6mTk6LkE5dGG8B3+7y9n7KZOp5SoE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KuPnTeImkdNmSJZfiejcTk5m6Xp2lr+4iHKZcS+N9Ji8UAGQHHmqt4rmQ99Cctv8k
	 9uOnpM9JuE3EHUE/kqnroe5j2fYJgKweoGoetBNORdNkIl66TUHehI6X7A7ojklPe2
	 4Rb10WSmZ9RecFGzZQSNNd28D+d575weV/uYk2EWECNVw7d4Y4iLBbTi7PpYCpqj/4
	 nmqkM9vNpNK6N3SAwby0WNNfrksBlv9Yzx0vZqzAHeFF/T+s7ObSXJa9PPvkujucwa
	 ahrfKsCEatATTHEfYtF+bgGJ5p/6g+ax+WkUUkV1JElwYboE8sBUUAuGBITKKN5hXe
	 9JZEMFZ+UIaHw==
Message-ID: <sashiko-outbox-182384@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next] net: usb: cdc_ncm: add Apple Silicon MacBook
 Air (05ac:1903) device ID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Divyanshu Jha" <divyanshuj2006@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023070419.235361-1-divyanshuj2006@gmail.com>
References: <20261023070419.235361-1-divyanshuj2006@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 07:09:52 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Apple Silicon MacBook Air exposes a CDC-NCM interface (05ac:1903)
> when connected host-to-host over USB-C.
>=20
> Like other Apple CDC-NCM peripherals (0x1902 and 0x1905), Apple's
> firmware omits the CDC status interrupt endpoint. This causes the
> standard cdc_ncm probe to fail with a missing endpoint error.
>=20
> Add device ID 05ac:1903 to cdc_ncm_devs binding to
> apple_private_interface_info so the driver bypasses the interrupt
> check and initializes host-to-host networking successfully.
>=20
> Signed-off-by: Divyanshu Jha <divyanshuj2006@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023070419.2353=
61-1-divyanshuj2006@gmail.com?part=3D1

