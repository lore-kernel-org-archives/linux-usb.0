Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864680;
	b=Py79TSXZD09YAjI1w1vGbd5K3Ubn70pXbGRFAep3UgCeW/PoKIeIUJq7G2WG7qmCI9ct
	 XIOksE9tDie+flZ3mZeckhwx7jEUsVhef6woDWSDYBB6PH2UeATiakoEbTjYSt76u///D
	 5TwUMIy4H/y6aoLfnYYKKW6rJWHla8kodjuLxbNnny//hE4vYizwd/fcBOUkl7eQ7pyca
	 bW0Wm4SMSdsB9AKRWVapelgn5KbrhdMGaBNVejVDnmMn1r4OinFac+ljZBvw2x02kofSq
	 CWDz+UrOVUh20qOyp3kxBrMIYkcRDE3+zkDRka16/IFjBMUD/wu7+QIc+jYWso5iaIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864680;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lc1pLcYP80ckZfbDSOJZE/udnrLiLhqR6Asp+E769+A=;
	b=qk4aPNOSYcuLLj0wopUNcgkO8FUdKSQM+zgHE+5pIZNJ0n+toq90HOAKDMmjbehsmFyb
	 M+CVQpqUOGv2/xsnA9XvX5uohWm10TwzbMqUjo2tt9kNHYi61Sc3H3AJB0qYknCQPeuW9
	 x5dJB68+0qnWn694dXh4jA7ktE4wTf/dBaKcO6k7DjpgfJJ3j9aF3NfkSfExwfruRqi5t
	 +IXWnN/9hXcBBMbvn1TBXJANSceZjT7SHJ9HFwO3bpl9gnrdhsX4F7SyiWZqvdoq0SVUD
	 AhaBLYHjkRPaVtSyGvuguZ6SJOX3cSTZCeyVoXtbR+3LUaP/BExSVajCFsXpxOBtuGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E1WchKl0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E12606A31C;
	Mon, 16 Nov 2026 21:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E1WchKl0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAEBF1F000C4;
	Mon, 16 Nov 2026 21:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864680;
	bh=lc1pLcYP80ckZfbDSOJZE/udnrLiLhqR6Asp+E769+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E1WchKl0x6ICltk4w+fVK9k5LaaBWxy8AZG5+FiME+EuIOVrCW5lIZ4csfyT1+3bI
	 8Smbn9R5DKhkerPhw6HxvVj4NmKuZk/dOISe9qOk171CVvcHdnXkgNKh2Y58os2DO5
	 0rT/UREEFxNoWfwFRkfbKCypQikBS4fTh8+bQe76/w0woY1ByCOZPGsMoSerYdcjcF
	 Pb/RrK/opc4suhcGLDHmzDcXBnzG7MD177cEPj/S80rmmjGBW+rYbbHZSqOMIq87OX
	 aQqYkRkMTT42yulX5/bJpoiNb4sfGqL3IF493F5ZyAECtLSSV1tjibXDWnU1jgftfZ
	 4wCfmMeDajoAw==
Message-ID: <sashiko-outbox-217726@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 14/16] soc: qcom: socinfo: Add SXR2250P SoC ID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261116-halliday-dts-v2-14-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
 <20261116-halliday-dts-v2-14-2c92438c6c46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:31:19 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add the SoC ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2).
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-halliday-d=
ts-v2-0-2c92438c6c46@gmail.com?part=3D14

