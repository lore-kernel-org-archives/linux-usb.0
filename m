Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267868;
	b=L4AJ52+GaqQh6ycnQKEGLSryW6WKTAAZT20a6lwXF1TYTwETv/YVEPyvyf7OXkUZ/BvT
	 VqhQJ03s2IKai0eAGBFni+mnrpGobY2KJCW4i0bDsS4b/5wD0CAM3ZM2TFbvGMDkhxEbN
	 +QuCGNlSaQoXTPezrgckrKeIH1Bs0r6Kpg2vImiDMBKdNn2P7UAS/awSwALVPICex1RYC
	 iSRQICb7qFQoF5SgP/yQvES41sJIcF39P5v7KarXb423UwRxl682K70UplWDn+q/3NEGv
	 UomRc+/NGSAPf1KMn7aXz7ijlrMDkQjgN4wn8IJ0MFj10OlFodhYeGzBNg53wPtwyZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267868;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tmvfjkxe2DxJd1yNYUJC/HI2s3LJzagwjB4eFHAZ1LE=;
	b=zYJxZzg7fE7Yi7CDW9oMkcnxQ0s6JBQ8voiywqdBRSq5sk5tqo0phoFvyRqhL1qIzjJy
	 PMExaXjlUxURxlyA8gGT9Hj6qrTqI7ySd5mG/WRO6dQYDznHs+krhMGnd5mYmMzPY8Jw5
	 Qg4u6JHPPWObUGWmH/tBY9r1euhg2wWMEcDGQysa+e7XoIju1hK1V7OXcqMeRpC7w5JHU
	 mBVG2wuR61/bC14JLNFNoUAqVKPveUn3CFFJRPLSGh5bMZ/SARTNdH57gY5qrs3TxtvKq
	 jMSfJdZq5fY18KoQhnDsJnTYIQYs5vurHPwL8YoLE6jBolPBVRxd9wNm1YzQJvC+64A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jGnf9tvN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F56606A335;
	Sat, 21 Nov 2026 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jGnf9tvN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4231C1F000C4;
	Sat, 21 Nov 2026 13:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795267868;
	bh=tmvfjkxe2DxJd1yNYUJC/HI2s3LJzagwjB4eFHAZ1LE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jGnf9tvN2M9HqUI5g87dGrB7RWB8hMk8imCC1ZApQQlUUJ9tXGcid6bNEhH7WyOAX
	 MajO4glwRKoUlQXz49q8OE4QrknXRZwV8Cm53PstiSiYZ8g18dt1PI7B0hNvmc6Gdt
	 8SEfp8ZTrQ/4FLKRHYCLM6Q2rYE2MKYNsqC2JGGy4eJC2SsvlARNxzylhBv8PXlhnS
	 C7wSNYAx2YHMS7C5tMcnTM2xR0NANyJUQtDuzhapP9y9+88uOMBxQrxX8Pt8gHzNPE
	 gALU0Nm1h4/NnuGJMEsUK+P9a6epectebX/Mix+mZcK9hpougvp/b04cB1S/5Mi3vT
	 EYvOfl2Ao4VKA==
Message-ID: <sashiko-outbox-227074@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/3] dt-bindings: usb: snps,dwc3: describe two
 connectors on one HS data bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261121132029.2379449-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261121022104.1507987-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261121132029.2379449-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261121132029.2379449-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 13:31:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: usb: snps,dwc3: transient AI disclosure left in
  commit message
--

commit bb8a3ceb0d946838f8ba0413ca77dbe0a85c2db3
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: usb: snps,dwc3: describe two connectors on one HS data bus

This commit extends the snps,dwc3-common binding to describe two USB
connectors multiplexed onto a single High Speed data bus via mux-controls
and two endpoints under port@0.

> *** AI-assistance disclosure ***
> This patch was prepared with the help of an LLM coding assistant.  The
> author reviewed every line and ran the gates quoted in the series notes.

[Severity: Low]
As reported by Krzysztof Kozlowski on v10 [1], should this AI-assistance
disclosure paragraph be moved below the "---" separator line into the
patch changelog rather than kept in the permanent commit message,
especially as it refers to series notes that are not recorded in git
history?

[1] https://lore.kernel.org/r/20261121-icy-bright-partridge-afe8de@quoll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121132029.2379=
449-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1
