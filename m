Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254411;
	b=dMKHSJw1fjmCZSWS2xxQosXY+hxQocRhkDeMTb7ObDdd4Voa5UPcd9w0GnEWYs9tEVF0
	 i3MlI+Yh9SPnJ5pLMrs52X51tMHVJGF0j5zz5veTGlWjcQvXMhLjpjf2wdKyQsc2JwH4w
	 cN8h5GIMjM0/EW3bFPbh/PIqPwSsB+Zdvjt2494lL8KhE4j43R0pqRJUbmCecrPQ4aj1k
	 n/D46lO8ae7r259I33qix/JlyjZvkBsl5gaUnBbRMccK5hVOMxl+NBjGbwnW5yfLbm+/L
	 MXlyL04LJ43eAT6QeJ++sAmKQ4YpZ6yNeagle48AlOvwdkwhXoNUcz6GL4F9xtQY13A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254411;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vZnonB8C09EGOT2aDjh1sSJvVi1c5ewBWZPAvDfEi5E=;
	b=fW2CKkFhKAUAeR2gu2/WcOpcQOjAwxeIG36Z5gwl7vW2evolhuv04zcxu8aSQXrltC+U
	 LMzXEkgYphq+bPiD1L+p16iIH9HsYdAxci6tGhIfYiVsH8rHv8yioCk4Xt5lrc3q8Uh9V
	 2Hs1b9cBoXwHokbVNSsza4fbE/7qhlntcQuSPrvKoB1e66DNhAp0OVIsiy4MccGjAwSxh
	 wH8XdnLLpafOtVSgzyL5rskeOZsTO6YkXqJpDPeovvd9dw7/XvlQLXMTOWeVEWwiteU0T
	 BTXlRjBc43ELflnstvyGTdjIt/4Gld/RIj5K0LKvmnahiL0uMCpUo257rXrnvZ1ZrxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PHJK1Q1z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46DA606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 20:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PHJK1Q1z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318221F008AB;
	Mon,  9 Nov 2026 20:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254410;
	bh=vZnonB8C09EGOT2aDjh1sSJvVi1c5ewBWZPAvDfEi5E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PHJK1Q1zhoD9xu/2KX5n5KgSBL7J/PFesU+Bqjw3hGqPtEyCp/nhpXGU8S3M3BdPP
	 AdgfB4OtfHmUAYAXAlm562loHgiSZuxr43KHHdAem9fCv0/SJbYmG+XDReh+5166qt
	 URcjRipfMigQox9LZKvMlkMYgYr9tFMHFJ13NCozhXj0D64+S2Ke8YWVa9onL9zF6G
	 SCdSvZOpjQdGMnrm1e9mX7HQgnc6ZQoyFoG9FDbcwCDkuD4K75NvQRrfnkRnBYdddG
	 n/Jutyl+9ksj458rDYY4cTKKbbFlAz5kDTpoGBf54QhkClW8H0c+wkZkJ5bW1aBMSD
	 5v+DJkgUnDs4A==
Message-ID: <sashiko-outbox-205520@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: add Realtek RTS5453H Type-C
 port controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109092400.202219-2-gary.yang@cixtech.com>
References: <20261109092400.202219-1-gary.yang@cixtech.com>
 <20261109092400.202219-2-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 20:00:09 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the Realtek RTS5453H stand-alone USB Type-C port controller.
> The controller is connected over I2C and manages a single USB Type-C
> connector, described with the generic USB connector binding.
>=20
> The connector's OF graph links to the Type-C orientation switch and
> mode mux provided by the platform PHY.
>=20
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109092400.2022=
19-1-gary.yang@cixtech.com?part=3D1

