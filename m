Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957732;
	b=wsZ2XDP/XimHtlXCzAA0KL6NVAtRm3gweNlpgevbo0hx8s03w+vH2MBYMJOEWMbUbtpv
	 1+TqkKWev+fzqwMEuDWw71xWhseE6nLj4K6Dr5jvyR2a872XwMtHcsQjNWftW61JcNrBX
	 ZNgoHCoz+m9mpa7MKHOdbD0xzU4cgifbKOcM22YdfiqDbELAT4rDLP4HrRPwlj+BVDrk0
	 0Kpa+ipoFc9y7GJE7Q43y76v2WOESWGsBCnG/cLNZuwSfxTlVLNqUvA+3RoVhT6H64aDx
	 HV4+8wwcWpTpEPabS7hCQYJ1+jebpg6JUQnZAAUbb0oWUO4sse9RAq5R+Aao7/2cXqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957732;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a/w3ifN/+3SNTbyK2Q08oha+2CaKkYo3XdPQ38bqmDQ=;
	b=voYD7O683w/h2Rcd6L73orb0VLM9bYOuSfWEHpwDTJb93eGWEF1FLkerph3ZiJ2cIEM4
	 Qf8/uQ/Jhe9AeQSNGtlQyIkOTW+5qQWGUMh/0DkrJGzNc91ZL1mEXLX8xYu+IY0J19n7o
	 gQMp9D53XDuSjD+rovCeHVu0DE772p0WSCw9feq3lI3yT4Z+XHJ04HldRybOVXVv7Y3tH
	 hy7pMjCm6yXoQUiVq+MhU4rGJJ9h+0ew1N7eypMH3Z1vlEqq/pu8fQ3yMsZbRkV7XVW7p
	 xbjg2hBoOY4quJvwqQJHAVc31Qq733LeHVAdbA97LyyrYAPl/v1nnUKUI8agoyLmU/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LbPQluzm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9AB606D829
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LbPQluzm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1685A1F0089F;
	Fri,  6 Nov 2026 09:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957732;
	bh=a/w3ifN/+3SNTbyK2Q08oha+2CaKkYo3XdPQ38bqmDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LbPQluzmxPAg6i/cna5ZTRtHLt0AflbLStZuLizqjU4y8bROz90/CLJMsJwKqnz88
	 gfSNjL/ilAL4xaxsxyQXAMCtn28VgmS8DaoDZE6saqXDkbokhmcu/U8GeoA1tJ7p/6
	 TejKzxgQBihcyqyORdGZ7FZhUAOJL8L+D8A07l2f0tJx+l14rwwElAZDiJHGeGSizc
	 3BtjTq7rtqb+/tAaIKe8HkioXNc/U0EU6lFxeMXqGdit9LHGXAJ//vZw76PAU7j/rM
	 xLPTXUeHe0lB7ULXwomzTNconxNo+H5KiPPrGxCgpcW/82awr+iJtW1k7dPWfkukn7
	 /4ZjwGhCTQhrQ==
Message-ID: <sashiko-outbox-201121@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/25] dt-bindings: riscv: add Metanoia SoC-based boards
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-2-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-2-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:35:31 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the compatible strings of the Metanoia MT2824 SoC and the
> MT5824 evaluation board.
>=20
> Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D2

