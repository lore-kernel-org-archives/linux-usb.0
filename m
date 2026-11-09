Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184646;
	b=LhhtlzuwiPdCenVlBeh0C7W6ABYiTPuC+CrCIZdgwHNvuf29WTWr+z7BPp8I3XiSZNSD
	 /H03y9W5ujk0JtLR5Y2g3gJIDhxe/0B+KuT470t1+4tqwJOan9JeFYx9Eb4IwsTXHn2bO
	 tRFam52JGHdMlksXFfIdxqjBg7zawWgFN9QpcaLOiehMmGc9XkhOq9Ke3aTImNvF53KcS
	 WDDOn2gTspc3ltPY3Vwt9ld6u87S1RQHM/hN39fMRxQPEGdRaDzB9ByoDzklmnMCTohCy
	 9cckxbf3krGhaPyhkmeBLqFxEV+tq00PGY20s3NKR4IfflctbJuw8EvvnsvoI2wkT4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184646;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AW30Te2NwYUoTIRAep9N4BNVIbLDHc7cdqYxdZAgoUU=;
	b=flVCGLF5NYPPrpWuV2HIIyvktHDf1Ql0FUCkAbl0qBaY5JqFJYwOlBg6KYC6d/c4oP4q
	 ctauSKOJvIA3gc/RhQzHnEbFVwqdHRvo+wzBgpZeyWWfiJkluLHLsTWwPg7ygOOZmzIe7
	 az+egaTAOffHUOjnaroFYG4AXcV38/RagDu/3R/as+5V4IZRwJ2/cc3dVEy4mBE2etmr4
	 5zJHcv5Owc2MA3FaAQKzP12z8204uIM4b7Z5bIpgJXQ2Rejib39+9me9s2YwNQbjLo51U
	 OndHzquNsPUWbSkVL3dA5/HRoreWRLkajzsiwbuy8GcP1pQWt3yFxsdtlBL3VrzwGog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jF2nHkGs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0F9606A31C;
	Mon,  9 Nov 2026 00:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jF2nHkGs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C831F0089F;
	Mon,  9 Nov 2026 00:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794184646;
	bh=AW30Te2NwYUoTIRAep9N4BNVIbLDHc7cdqYxdZAgoUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jF2nHkGsJgxzuPpGvwkO5Jx8NtOnewF0tutTkPwMfi/+FVbBA5Ek+prCQL3ISku2W
	 ac8fnj3b1m0L3FZ92/57ds3M9zYfQ7Fyak+eiwIdSAuxA7fKH5F35Scdv7HRo/nysi
	 xreDGnV4eZkwniUAWSjLs9HTZ1X+J5NXFkRWhdg5SQ93t2bXp00Mo25EemdzCmDtwl
	 yp6Kq2ZJUqSbfWqNpk6e4J42QLv8Nf6NmL1hmEX6mH7T354bclD2ihlh0zL3C+ml8J
	 fepn4XZVWeKXs71d6Al6OmZodoj8YJH0zd1V357P3vYpiaspLt3WJPo3zZVUcGbJsX
	 kmkjK3uS/eyzA==
Message-ID: <sashiko-outbox-204225@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/17] dt-bindings: arm: qcom-soc: Add Halliday
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-halliday-dts-v1-1-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-1-289114ab8197@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:37:25 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add Halliday to the SoC codenames allowed in Qualcomm compatibles.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-d=
ts-v1-0-289114ab8197@gmail.com?part=3D1

