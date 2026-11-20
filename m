Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185443;
	b=BJKi/QG7MvsexEN0ZxMgXP3qIwhWNQGPcxp1ItlpMprpzgFmUHC1cUjiBlLou0NT3y0B
	 BZi5Czno6MTiBH6vXyGUkOeLGGDDWlENFke2xltOsazUZ5CzbKCkS4HtKeYrUnfsc0RfZ
	 CTQKk/bdv/+AURExwAENyRym2kytirb+W7TkO3aXmbLj/orCTN2fyeu2zQwk8p84VyeXT
	 U+39D8eysI8euzcqrzZbXijov8yxLYP9/MWu3PbNoxXP0CggeKIpnmOS7ufFThLurVvnK
	 FWpCTKfDRaZ3VzdNq81FSz8OSunJFusK/tgYEnM9TIjLFzLEICWiqPz3pTsBVE/C1fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185443;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HITGkj9RJfvhwp+RQWq9EmbzbmLO1ySwEOXN9aUNSBA=;
	b=s5wbnlN7KlSD8dK7xYnXHxyQsawQKXQeRiaWoW6v+o78CtCtn05R6b25kd8HiJlqzu/j
	 asX3+CeIUbxdTdXAgxUGvWnowFnC0aZyQ1nNGYts1RnAOCq4wM02MpZFsKPqEdzfVa7dt
	 t4GDgcRQWsxgOdlR7NYrAUK8YA0Y7kkSlFbfO2mG7NQ/GPvxDqyel7tMuEjJZPPOzykyB
	 HwXOrD+cwfoigMg3kl2gcJK8UFHn9m4hCYQIStGLbiB2vy4aMIwqRQsk8uE+3mcpC5bgr
	 RLpghIitXVAUUmIckNcZBejZ6wECZ1aBwivoVtJEshuGmifdNbtoKmknCX5pfTmdNvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ha3RuxNX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6EF606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 14:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ha3RuxNX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B081F000C0;
	Fri, 20 Nov 2026 14:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795185443;
	bh=HITGkj9RJfvhwp+RQWq9EmbzbmLO1ySwEOXN9aUNSBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ha3RuxNXIhqRZ9hirE9ccJ+5oD3tka9W8JYbSqkdEq12esvxb7L+kaeuqKwpXJWxI
	 bfefe8VwxnWmI8eLRcFiUS3/xxXgzGy/SaPF2a3wPFcubgDcu/NnnKZs40/vIGw5uh
	 Y6Oh+TsSZrgWk0QlKVUfjDucL9gl+O5Cx3GlMtNRVhswpUMbMSyxxc7lrOTYYlrxUS
	 OQvFBInTB3aZNIF6GR86eRHrGdccu57oc2qnTsKVG5rsplwPXpkfkoucza+mcvp98T
	 qRABTwr7UrsfI7CtTi0h/OBnieFODb8owNzoUkzlPt2v5G5lE4q9X0rKLGAYe+ywra
	 NAk2DRVcdnxYw==
Message-ID: <sashiko-outbox-225394@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: musb: fix use-after-free in musb_remove()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <crofts@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120-usb-uaf-fix-v2-1-cc3cb2a38ad5@kernel.org>
References: <20261120-usb-uaf-fix-v2-1-cc3cb2a38ad5@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 14:37:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Currently in musb_remove(), musb_platform_exit() drops the PHY refcount
> before usb_phy_shutdown() is called, causing a use-after-free bug.
>=20
> Reorder the function so that usb_phy_shutdown() is called before
> musb_platform_exit(), the same way as musb_init_controller() does in the
> error path.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-d180c2b9-0006-4638-a22b-13df8c201=
235
> Fixes: 39cee200c23e ("usb: musb: core: call init and shutdown for the usb=
 phy")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joshua Crofts <crofts@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-usb-uaf-fi=
x-v2-1-cc3cb2a38ad5@kernel.org?part=3D1

