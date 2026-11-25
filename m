Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595485;
	b=hsNScGBPL5DIY3x1YyEkNuR/0kA94y9M30XVi1EGAfhWWRKeN5+XxPWhC5yFdrnGAMQ9
	 eaoU8dV77jZcDjgBaN+UJt/MaSkuBrKhipHgJHGtBxu+BuG2R6khQGyhy5reY4GKF9aWn
	 0ncGelAIudDzLGud5RwSXbYQbb4R0vfnk4jlpwRATOniP8BWgojp4Xo5V5dYyHWXFi8vp
	 80DFrrchNF/+3aI3TOUfz8+Dw6KNHuKtjP+oxHXNpQLmbiGxPH0tzh6Yyu+iZIvuBqCiC
	 MuuTWSOAsCiTctty7eDE6/q/6vZzSySbDU0u6RhVnoZQINJK7rZ+nbXIQBwAHBMXuhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595485;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GFqDWx8WCCzOvdofpfP0Cc6OcL36La0VfVvXiEkt07A=;
	b=rYeAKYPIQ+oTU6xF4gerTfQ0D5Jx/UYP4nf7H16i+k1g6l77DJqw29BWjT9EGx9VJgq+
	 OngditkkvwEtz1Ryv3tE2jBVLTZ65u52y3cDWVqP97H9eIrJOjL1vI25AaNH1BUCcxGcd
	 R4wdiWrLdnH6xPwTpc+QsLHnZzqqIE1MRCc0Jtu2+Lo1UHwIHbzwoggeefKpyMgOA2Qbq
	 Qibz6qaAuavR/ywmNNmFw0aHU87AIoI66ciobCXPwCAtVKIhVEDdQ30LkRzByqiD6zRtO
	 ClK81qX98+tGcHu4rCumecU5PW983NuZ6gGGfxz+MhtOefOpCTsHZguotM6+Dvmji/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hdiN+YAE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E192C606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 08:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hdiN+YAE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723B41F000C0;
	Wed, 25 Nov 2026 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795595484;
	bh=GFqDWx8WCCzOvdofpfP0Cc6OcL36La0VfVvXiEkt07A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hdiN+YAErOL3KmJ9rjuj/PUyc7RxpZ/awX895NxfTaNzkkcCn9jf4pP9uSSYcFamD
	 vNVWIGkxYyTcwnot04s+1teiyQz0pFmdcmSOcEes36WI/Jeq9g/M4A9mmYFZ3JR3k2
	 y+bIjRMT28TEfg4Qbia0zzn9qmwjZiJyl39c21kvO79U8g6+ZJwFHc+R5H38Kfp5nM
	 gqV48guyxzgWO+mK0c35XqeHz9SY9akvKfEzc6Tkov3T23AfP6BV2v/SL3aIdtmXL/
	 1rvLWFoJKE4YrHr11S2CpIzIz5uybdTrSBzyOsHaf4HGDdh6I0D2j7ZsxChv77SNaH
	 Hu5zUp1ReHthw==
Message-ID: <sashiko-outbox-232906@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 0/3] usb: dwc3: support two connectors sharing one
 HS data bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125081219.3661014-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261125081219.3661014-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 08:31:23 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 3-patch series:

- Patches 2 and 3: no issues found.
- Patch 1 ("dt-bindings: usb: snps,dwc3: describe two connectors..."): 2
  potential issues (2 Low)

A detailed review has been sent as a separate reply to patch 1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125081219.3661=
014-1-xiaqinghuan@mail.ustc.edu.cn
