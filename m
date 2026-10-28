Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793212348;
	b=JaLGIDKC+fAQN/MMnal65iJwXw0Sz/wRh/RCaPcj/Fyw5c/PfnyUiRAZP8Pb5YO6qYTJ
	 JcaMFnFoQKVgv+jBzqdaerERx8JxsT4WV818cUFm0Y5P4u6z1kRbSK70dkZt/prFHRvLq
	 P+Cp+Ldk4vSguvrVKrrAM/hQue5WW/RW0gv2vJ8av5sMTp+gEgEw+lGcYNNK/H2hApHP+
	 Q8xHrp4CrIHkq1WddXetci4KZFOdACD42OAhsP45yppHxF334ggHA09qIn7D63i8hmNLw
	 TH4BQOR3TkYwgqQJ2TbfsKRLFLB+HTJk4o9kQr66sadEkKSsZ23b9uaBw0XY8ywbQRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212348;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=70fhoLTpDmaDpCqiGwUGq+/kHHhf6wMNtc+Nf5utKPk=;
	b=oIEV7RSs5Ss1cOqoVgPZwwrFk6viaP8zETpCUcKDLQ2k18MlYpOslH2kZPrh4JEKySvn
	 q9NN0McYK5a5loCCF8LaVRciSaOESTPdFCu1QBmS/7EM4U6j3ZmtWnxsFDwpJFO/8Q4rg
	 1mH2Ry3g5ifOJVQT4xzXf5NDfr0AdqNaS5+a7NivT7BDM2jqUa2x10qcFJXq5wU+t3bBG
	 3vx+YRcmNG9SEmhu29touAcWa3XJjHceha7rwDe6ebNNeusQKc5E8VlnvTOptXWI/Ab3M
	 W3jwHot7nFcAPTuQeO7R+pXBekX5/pJ3sOjz6TJou4QZq6KPyUXA4NJIOkV3Go7aOmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pc7ES8Mj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A99606A31D
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 18:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pc7ES8Mj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8031F031E1;
	Wed, 28 Oct 2026 18:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793212348;
	bh=70fhoLTpDmaDpCqiGwUGq+/kHHhf6wMNtc+Nf5utKPk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pc7ES8Mjq6vNAuOljPIMMbjw7/NVxpOC5GGNGl8XoEGv1w9C2mB0rYk18tGshH9KU
	 Pc/lGddtRWoVb9rH53BHMBekjIT9nDvJs5jz/RM3N55I7sR+vLbdpgXHJ4BfFdf6GL
	 EAY57NRi2lNoHIr3HFIf+Ib6st7jX46oXf/KvqNK+K5U3wsM13pB8O97pCybQ64LQ4
	 PQYcf0/YOKCPIfcfS+umN7vJ9wYs19w7fQvi9S4piK5npL8fxoCUKRD+JxyoF0EZYh
	 QYWcHjG6Kib8bVIoZooTv9wkze9zck74q/ZDZof6M4ci+WypgN+cD9j19N+JTp14pJ
	 S2tK8ccs0qDAg==
Message-ID: <sashiko-outbox-188294@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: legousbtower: use stream_open for stream semantics
Reply-To: sashiko-reviews@lists.linux.dev
To: mdshahid03@gmail.com
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261028182802.25212-1-mdshahid03@gmail.com>
References: <20261028182802.25212-1-mdshahid03@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 18:32:27 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Mohammad Shahid <mdshahid03@gmail.com>
>=20
> The LEGO USB Tower driver uses nonseekable_open() in tower_open()
> However, its read and write have stream semantics.
>=20
> Use stream_open instead to mark the file as a stream and disable
> unnecessary file position handling.
>=20
> The issue is reported by stream_open.cocci script as potential
> deadlock between read and write operation.
>=20
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028182802.2521=
2-1-mdshahid03@gmail.com?part=3D1

