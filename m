Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184652;
	b=rSxRsBFmxN1IrubkkbUOCLZe1QQiYizMvsy6BvBifTd5j0/m7gJnndfIv5SeG3V6WRlG
	 9AduovBOYbt0iNksTdTEHGwziq/Qpr5rIP9GQmG+wjsmpL5ROH0h7IlWtGgour/CDytkM
	 TFJ4GaAKyoJ25cikHAh7+/Ds1mqfSiZyQakmSm1RJS3qOLj2ojZLOA40dtwZXthbT+c3q
	 5nS31kAlIJNmu2BZ9YdfumvHMKZRKzJCTtOtb+2nA1yfaIKN+oJN5fLJ3B8Q2b3wQxTX5
	 HdNHkTB+3PdQs181osH/lCyYxUkq4cd610UkAYZrIwm2LjZU6FNAF2gGuM1ACAdqGiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184652;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=z/fSod8kqUsMU86ZfsNHbFVwYQUvOfCCil38riGIhys=;
	b=ctklTK+5JXF514t4U99w4wOfnORBPXOh+W1rd4etpjJuT9hPYbCEI4nUEYRN9ni7MT6S
	 38V5CuLg3huFkhNCXUMOzbM10siL9hvQKzLvHi+V0KIrlF4I4nF4GM9RNpqlpz1+Nftqs
	 RKgHIDWoWYySpWGuqOHDJrVu6CUoJ1gdb61LV2/lyQdNtjCbwSiBIHysFfY5tbz74b+Ev
	 tAbA5byTH6VPEr9DR/bkzrXJs1F2Ewli23e8+RfGZQ1z11ouNXsxrdux9g9ev1BmMktjy
	 2zXEbuTHl14u8rjE69WlXah3gDcGyo9lx14m8SbZOX6exZas7Eps+OQDG8XupjNkMvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ksdQ7E5v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1104B606A31C;
	Mon,  9 Nov 2026 00:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ksdQ7E5v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57071F0089F;
	Mon,  9 Nov 2026 00:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794184651;
	bh=z/fSod8kqUsMU86ZfsNHbFVwYQUvOfCCil38riGIhys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ksdQ7E5vyoL35SGsengHoqh85Sk1hvFHUUDbXVBLSdcNBC2GULdzJ8X0Pfl68P662
	 OYGRRshp0+sKNCHy2f3D35gjj/7HFBcLvc4GkBa5H/nRJ1NHjNmSBrRpxU1SNzyQZl
	 wJeGmYISiYiARBfH24OOE8SJRUVEz8vhUo7vSw/+WUzNKqIgbjBEO8e+QuA/myf/hC
	 5uGsNbiptdicSOokjKDLQE6BYIZv6zG8zx5a2/6owy2BwEGET7+6+Vw6yDayyJ08cE
	 bkdGKY9zFD+O53xbyMAhwSnKby2EL5v14iRY82CgL10OrONFJ580a9Ne7WwX9Eld6W
	 z6mqBUlqU/79Q==
Message-ID: <sashiko-outbox-204226@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/17] dt-bindings: firmware: qcom,scm: Document
 Halliday SCM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-halliday-dts-v1-2-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-2-289114ab8197@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:37:31 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the SCM on the Qualcomm Halliday SoC.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-d=
ts-v1-0-289114ab8197@gmail.com?part=3D2

