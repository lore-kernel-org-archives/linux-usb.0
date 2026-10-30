Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348089;
	b=D7ZgSgWUtrEx+784iYHWjs4ktABGiY1YY4d45p3DNMnoDam/blfe9GvhXYO92+ne7t16
	 Ic88NyTcmD9TzeYjJwO7/5dPsXD2vRxOfOZ6gLe3f9nLELeIWqTPeZSblk4YwWZoCfOFU
	 bO+IoAWPz72TVMYnNQgvr30gyEn1/tb/XhHloIUsJfrFnnjITQ9oKNMcuY4F0SAhHMSZf
	 XsTfQ1m2aEbJeZVvBq9+Lz+VANpGw9EFKpgaL668xY5Rg1ttQKepdiTRpjZ7pMyH7hxKQ
	 cxkHQLLTNtqTt8rD8JqQ46UEqkXR8CpcYurM2ZQIQWR548dylZRko+x/BoJr6M8BTsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348089;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PiXCm504vr4Z616d4LYSvkyZ7NeZqKWouyeTfv5A2ks=;
	b=CKJVre0rXuYfN9XQ6D0Ri9FhlORKtb2iP26UHDMZqg5ITFZ3nMXGomQlwimdYeUtS8Yd
	 rHrPhhRfva6wQt5MoS7wyZd9d7/ba3MBEFRcqAnEVh7nHHlmSQgECBdHnTY/gAKNCZWye
	 s1p7ZMdKjgwpfMbw0tccX96tA2mnOSjBHUR75gENaRSB/lSBHeDAFOUtg2KFzyKXsTweJ
	 /ADIpylafQIPWWhVOI+anKRDYNX6puoLR2HS7IbsiU0PWhLFjDuTfllG7kzjLD7Svw5uE
	 XLZDtiv1ov2bKwQXQ3QnNqBL7qDdMJ+iA+ZEzDAyNvra/QfCwyutvoZEhfPS6wbuKlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fiF/BzUR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF4E606A31D
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 08:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fiF/BzUR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B131F000C1;
	Fri, 30 Oct 2026 08:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793348088;
	bh=PiXCm504vr4Z616d4LYSvkyZ7NeZqKWouyeTfv5A2ks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fiF/BzUR+B2LP2bHc7OhSvoTtwqEEWS7nlOKGh2IF1iD5nWZ0FSztYCf2ooM7/4P9
	 IoeoQqPMF9Su56YLCTodED3+JkByROhuHVe3gfU94F76cq6ga9ub+pBQ3KbrfnzWuU
	 v020JblDmZ3fcw+ortGAtnLJ+v9BqBoBLdq9WrPz4LGHRLFTA3zMrB3lulJ7DlVrgF
	 rSBu8DcMrljetUPsfpBrff1noUXkpig9nIVzXXxRZoZPzVFCi2sa/GvaXsO1AcvEIE
	 mEQneuj3ANOuevDrGxIznlVSFcZ9X78l3slC0mw5GkirUCpLhQ1cEiZk8raAU1mMGC
	 JbB/C0u2Jmv9w==
Message-ID: <sashiko-outbox-190678@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: usb: gadget: udc: add Axiado AX3000
 and AX3005 UDC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261030-axiado-ax3000-usb-device-controller-v4-1-c5267b36a777@axiado.com>
References: <20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com>
 <20261030-axiado-ax3000-usb-device-controller-v4-1-c5267b36a777@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 08:14:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add a Devicetree binding for the USB device controller integrated into
> the Axiado AX3000 and AX3005 SoCs.
>=20
> The controller is based on a Corigine USB 3.1 IP core that is
> dual-role capable (device and host), used here in device role. It
> provides SuperSpeed (5 Gb/s) or High-Speed (480 Mb/s) operation, and
> supports control, bulk, interrupt, and isochronous transfer types
> across multiple configurable endpoints.
>=20
> Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Co-developed-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-axiado-ax3=
000-usb-device-controller-v4-0-c5267b36a777@axiado.com?part=3D1

