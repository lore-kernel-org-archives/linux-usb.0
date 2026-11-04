Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793817084;
	b=BWopw1Y2771W+4MHbyAsIEYGFtUIOLKLV23nz7trw1Yjif+yg4CHVOxf66wsHCkIT0+A
	 gLb5i7xYi0o+5t8GV19QkdAFQQbykp7MmsjLrK+Qup2Qp9trITrPAqUcrKPkcQkksj+pI
	 +JoPyEGu5lME2UTLf1YPQav5NNyO208RAEl72hdz1BsWhTjUJoA0VH3kwAHGlfC0CvMsy
	 NnDasTmgL+0mFAZA9DXFv2nTr4StWq5L+lT/jv348o+ozM7d29uMqUWTbbJUZLuGh7kvc
	 70v+A46gqe6sg2n564Mj7r547+H8KbYhx9SMCJB5fwJtExSwvCNHpDDQkppXatkEbBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817084;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TlyXHGDm3he50ilGumHao62WwBTtbCtZko8LI8EpugA=;
	b=fnpfqPvMI3Zx6rrJz8Q61dkjUtuqBNhcuv2Kuifhkhu4rnWAZYVjUEtis+8hk8RZaFTl
	 c7oU0rh6gmpcaZ8Tyuruw+E9iq47HDewv9XaDjTWHGJEy5U4rC+BlYw3y4m3dtUF5gwz0
	 NopxRv7VdKxK0gV+6j/8FqpyVVFrEiEuGlBJNo/ZhhaGMeb1rWPhgNaXx9Ewfo3xCsJlH
	 A8begZYBLl5jjjZLXp17R8ldHU8kfoAX2WO6cm1fug3DXbUJlTrXTDPmujRkFl3eo/dpE
	 WffWD78g15XKpisTMD/VtDsa7CP09upvPwRf/wpm/RyBmllrkht/OVVsPCuTERilz9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQlpK04T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3015C606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 18:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQlpK04T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9201F000C1;
	Wed,  4 Nov 2026 18:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793817083;
	bh=TlyXHGDm3he50ilGumHao62WwBTtbCtZko8LI8EpugA=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=UQlpK04TgarG8mPHlA5GADBC+19igkNiViJl0LzVmJFG1q/zoyYuOqRFnhHdWjUhc
	 XpJLXJyKP1R3taYe8GwO5rCCgfQ8+FTJ7cZqXDxRRAdJWprVTqsEf1LpY0+pwHVlwA
	 SNIyKNpjlEbZ5S9GjwzlsOU/BIqHR6rXc9mPpt5o+sCNGBnY8kDZxZx5gU4LQQxL5G
	 1M40n6fNfIE1sgHWCFR3YoAC4t1BJS8E3HHhf8vo3Ki3C+ZVU6WtQloDi0MdTIggXa
	 QURfhaDD+FGpiUY0BMMd3wCRLFt7W74EGwL9XSmEpc1cUnK7kI8/leollymhQEkwEo
	 0FtrTqD9MnHGA==
Message-ID: <sashiko-outbox-197851@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: musb: tusb6010: retain and unregister the generic
 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yige Jiang" <yigejiang86@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <rc-review-20261103-35-b81ec08fb02e@gmail.com>
References: <rc-review-20261103-35-b81ec08fb02e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 18:31:23 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usb_phy_generic_register() returns the newly registered PHY platform
> device, but tusb_probe() discards that pointer. The zero-initialized
> glue->phy is later passed to usb_phy_generic_unregister(), leaving the
> actual registered device behind.
>=20
> Store the returned device in glue->phy and stop probe if registration
> fails. If registering the MUSB child subsequently fails, unregister
> the PHY before returning the error. Normal removal already unregisters
> the MUSB child first and can now pass the saved PHY to its cleanup.
>=20
> Fixes: 2f36ff6915c6 ("usb: phy: generic: allow multiples calls to usb_phy=
_generic_register()")
> Assisted-by: LLM
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/rc-review-20261103-=
35-b81ec08fb02e@gmail.com?part=3D1

