Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294853;
	b=sfs8MREUpgyS+kFZt413+0eGNUHKGmuqDp6UpArqaCN+jeQRjVdbyYKBdt/NlpXurFSR
	 ZstcN5ktb/AUwoSY1aSeAcrOlRv+6XqMIfgtC6UdbQVgZMzJcPKD13fu2sq0GCgF5PgA3
	 Ct/KeHXjvuGB3CGgF6EYO4kWCAQ/TpOs6gp267Z8nuBiHk+ylbmIX8No1HS3JervlrHY2
	 gQUWmS4zLFMmd6Q4sKh5W4rZmDnPv7BOR81xj7C7lo/89IiwKODT6DJMLB7IFHejg/qhs
	 ajTir4LmlelpxZQet9njc6Cf1wvruX96ZqgD9WsNaQr2jYI3DD8vPP1I5HqOFb7Ed4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294853;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nesluqmkFYidL8sgDZPcUoHU7u2hkB8XKzoY5WTsP0M=;
	b=Yc5UnSuYEIl0/YomkicDJVccrWufpEt+FYZepAozgORBqfJ10/OvCtDzOL3k2zQI1B+H
	 Zr6FntGToJGJX7eb45a580lj/1AeKDceiI8fu2eqJVgElC2dgbynJ6IaJvzaiBU0qa9UU
	 qUnp7sI1aEfchV+vWSFp8jvT4IyyUC2AA8kVdI1fC+yZl8GQ3jCv7XV/J6jYNSR3qXeP4
	 PH+4t5TU0gKurWRmwpm/piP2uKgohTN+o5xFuSpecilEsAZC2jeSksdHQ5NN9CKwWD/vh
	 Bo8NIoe+Ytpe9/TmpzGB1Gq8ZcHFDj6lZASRV8DatLt2yY3M48npfjRT+McUjWDxQ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O8VFndSd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0573D606A326
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 07:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O8VFndSd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6CA1F008A1;
	Tue, 10 Nov 2026 07:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794294852;
	bh=nesluqmkFYidL8sgDZPcUoHU7u2hkB8XKzoY5WTsP0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O8VFndSddeVuf0g3/REplCkzsXXdTogyjjWDGTLY60qZI89sNs6ZobPgHOGK0DPZS
	 65t21HVupuCxe5uyfPjDDlNCoIzWox0vrM+hvmj3Xlo0PXn2hKgrHvLDlivJxqk1/p
	 R887OvYb9TY/FVPuOh5FNHzGc6uoVIvbGFihcfIrWlCf5iy+NTjkts0e+LEWsnyeDP
	 qQP86V7giJrwFOMyu8cg4/mE9ejauGsgIN7N23kLGZttzl0So95FfGmZ8oLl9TgvSs
	 s+1TNeN/wlfC2NkjMvns7abUu1JDHfyrjTgm8lwQAFCbZh2Hw1WPV3WzqoCwOJnbkb
	 hvloKw8m6j0Qg==
Message-ID: <sashiko-outbox-206466@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] riscv: dts: sophgo: Enable USB role switch on
 Huashan PI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Inochi Amaoto" <inochiama@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110070627.217946-5-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
 <20261110070627.217946-5-inochiama@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:14:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> As current the DWC2 support role switch on CV18XX SoCs. Enable it
> on Huashan PI.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110070627.2179=
46-1-inochiama@gmail.com?part=3D4

