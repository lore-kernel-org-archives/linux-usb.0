Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185250;
	b=YUnCiS/NEotqdQzVV3EY/zuCoQ+4J3pFjh/niGTK5ovRnD/jP4PqGgt0TnbdtMJPuXQU
	 s5ZcS4B0S9qUWrI8YHfUelfC+pdm3TYa+agcfAG+ngGdQif1M+8wOLI/g3q425P4O0Rf6
	 B5F60Z3o2HAfmK98BcoOJm10hDxnm0YvAPjuEwYINc7gjs/0KHisLV7ZxxywmqCeJZ4H5
	 86OAEWlwRchZyGOigTzeorfZiUdEIrinVKcAzQobkCjQ3+vU8WzPkNUdUcsjrC0tvycaj
	 HmeKWQLKmWo/CqnrIPAx1BQb0ig00x1Fe5mh7A10QpPgsbUO8pB/Gv+BpcPB+Indzlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185250;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OS4GyetYAXXTE05jmCWwf/v8UQMlob3C4TBt/SQGdJ0=;
	b=vBuIBGwd8XvottzqZ8hJa3/hxzsrsmDX26hFcmsGx2pKuNKi5rdIvfrHJtre/hin3JCC
	 Hu/zwc8wbvbfLh0njkWZScBsb/IVT54sdutHpEdYG7AE8D+5Yccx1B3WQZZB6hvVRHoWO
	 9buDlgLjfhK1q2xQpaoxI8xt1RPo+lwKZ6HBRtm9hH04phkuIjotecahpfIl25ysqi6Q2
	 zlXH+2cA/cATmxqQmrlsoKy/Qdb67vLjN4CaWex7723qU8a5QH45akxsVWVzQKZsXp31B
	 6gkad5lN8sEk5H53LPU47kU7iCSisai2vLj8anxIzTNl+ccwiJ+VidoScczlU6jC/pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NPXSUYse;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003D9606A31C;
	Mon,  9 Nov 2026 00:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NPXSUYse
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF6E1F008A1;
	Mon,  9 Nov 2026 00:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794185249;
	bh=OS4GyetYAXXTE05jmCWwf/v8UQMlob3C4TBt/SQGdJ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NPXSUYseNH93TS472I4BbR1D6eOM2nUW+lqAR3YBqkHW3yFEari6wqAm9cz8DBdAQ
	 7xeuTVYPCq/F9Qi+sbm8jvLBmqA78YeCQDAJrLr34EDl6sdD3rXKaOKGP7pUwOuSL3
	 lUZJfh5yCMorY5prT2C58q86+pH0hcjdIZZLnVABR+b+sE6FF2ZihqADAtYw/vmUuN
	 JcL4dkaOF1Tklx0k102sdW1oKHe9Zzk20P1V4TSuADpeuRt9HXOfwmXUWzv3cxWuKc
	 iH0/473W03hNkgbIDPd1EV5TZIxEPkPokzo0oB0y5dlhOBjRdt/VzjzrQe27djXSxW
	 nW19dNQxGR+wg==
Message-ID: <sashiko-outbox-204258@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/17] dt-bindings: arm: qcom: Add Samsung Galaxy XR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-halliday-dts-v1-15-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-15-289114ab8197@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:47:29 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the Samsung Galaxy XR headset, which is based on the Qualcomm
> Halliday SoC (SXR2250P).
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-d=
ts-v1-0-289114ab8197@gmail.com?part=3D15

