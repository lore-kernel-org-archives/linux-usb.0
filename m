Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906537;
	b=ngBHFe+9jtR0qjuLbJJ76E7EjkgtuS5LUTjk/dAi5ARLoB0W5+e6V7ScsKanvjk1koZS
	 kKw6rKmvnOQyojPxTNmH42rNosnIYkee8jzot8GJXldKmk7CDK2KhaINSnqblW4SJcHG5
	 lPcd2ZK9VKt5vipIMv0jwCbkBBKydVoJldmdgy609bltFiiRt1WsYhkMlsubHSGShY7rJ
	 +0/T7WDVoq9sBAM6EDWAc4NW3DS9bwEpcG2HJsl3rYiG8DP0OcPn4kHc/PBRUh2CZzWun
	 h+lYcgbCZaaOcn8+5jNvYnJD7m3Cz0Mn9tPwoj44rwySiMDZWzpyJcElsmWwibkAzQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906537;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=asaNn+S2n4L7cmzq0iWC9HiUzlA16mLITC0SUPVoli8=;
	b=bQSG3/nfvhQ3xPMPJqHbLcsOXper6r/v4tx+E/7G+cKsM6uPLJU5GP45+3i5zWy2esE8
	 3yPBPeLci9D9w/KaQDSw/eXKzM84qVYoMLOxHjp0dNzczKu/7JAmbHGXUoxNUaqGHnAZl
	 TmRogSwl0Z572exVmfOmXoVSo7bD1/ueRGl339gkCjzXdXkISFwSvVKVNBmnWfB+4fU89
	 cxmDi9ASBwVj0XgyaFZyIgwZa1JhPcqm6LgKrDQnkL8qrZl96fdPhA9bAfWX/0TSXJ7sL
	 FYzgG4HzgVX06QY3kcPliCCWlpd/H771p7XTinEPQY9Cmh/319wP45r39EBRAmjedwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=InSSDFor;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F93D606A323
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 09:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=InSSDFor
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B627F1F000C4;
	Tue, 17 Nov 2026 09:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906536;
	bh=asaNn+S2n4L7cmzq0iWC9HiUzlA16mLITC0SUPVoli8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=InSSDForeai8+8bvMVSh5G9LbRtlVktwDX2/0nv638yEP/8dbXJ4F4uGRFR5wwUKw
	 nH4rkUbCF3ga2O0VFKIylHThaj86F8BrzzC/02IF+jsN0OelQOSo9qNC9+7VnzAvci
	 5UCmrLq53gDzRw3Oce+l2JxaJErJbRN9pQPVvcDTNWuaHOXHeWnDa/pQVWhK62Bc17
	 6UfHIU89ytitT89oIUX2D3C0xSMgyBxymm3mdQ7Qv/5hYGnUDSK5zTJ/huphZqlpjB
	 achpTXj0jN4bsvUs7oB36/diPDtP51ByhRYWR1ZLrohlT/GOco71GQAVJKpWgfqT2q
	 0BJoF6jH1Ix8g==
Message-ID: <sashiko-outbox-218449@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] lib/net_utils: allow mac_pton() to take a custom
 delimiter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Chao" <liuc63@xiaopeng.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117090110.3263592-2-liuc63@xiaopeng.com>
References: <20261117090110.3263592-1-liuc63@xiaopeng.com>
 <20261117090110.3263592-2-liuc63@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 09:08:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> mac_pton() hardcodes ':' as the only accepted separator, which pushes
> callers that need a different notation to open-code their own parser.
>=20
> Split the body out into parse_mac_pton() taking the set of accepted
> delimiters as a string, and turn mac_pton() into a static inline wrapper
> passing ":" so that every existing caller keeps its current behaviour.
> The strnlen() guard still runs before any delimiter is inspected, so
> strchr() is never handed a NUL character.
>=20
> No functional change intended.
>=20
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117090110.3263=
592-1-liuc63@xiaopeng.com?part=3D1

