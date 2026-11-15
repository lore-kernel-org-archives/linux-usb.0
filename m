Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739914;
	b=Lbx5YPUDp8CHKb2iLK5EIkzCsUE7VKackWyzRMtI1VfiUoJV94fkL0lIwml8aVDmftPa
	 GAwL30l3XRAYnoYFixctsqvzYGqvt+y+R4JHPctUCVgbIJho8GGWUVbNU4WyLRTEaA3/z
	 5qI50fApP6gjzH0nXeIee2vV56u72FLu6WDHWnUNeG+iFBVoHgUD25+mmkB1404fmllDY
	 nsYoSV36qMjQYPaZaQr96ZT1vx6MU7J8SxeNnJN/x2xxKK+FO2XFv7AGINhos3kuBTTl7
	 b3mHmz7U3DBWcAVJgwT+T0DjwwKC7lHzZiJR2CRDvpbw38/zsQlcP8/sYSowmqqZ/mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739914;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UBtbJXirjIJ/LGxifBJaZ8UpaDDGbh65s0QsaJEHQwQ=;
	b=eX5GYai9l+MMgFnII6RSPtVXa9SFgGkcDJO/CpdzHVvdRVoVBFp2Zceaki+jGdVll2jU
	 IbP0Zz3b2hf8G4TEQTqQSSQ8mXno2qW5be69haMXQbe9Q/9yt7LjVofqaOfbtYxNKqUIy
	 hc1h1DZpWT5C3aJ37SmnloPuQDWSb68aOORcvuPa+RsNtPz4imZJUnVP6xg2NLEgDuX+W
	 sWKaOYQs5whTh4T54J9GRecqc7BlUc3EP/mrTAaf2p8pVoxANH+wpSTmcMnYR0WGSgl+L
	 GjzXYOm4s5t02FvpyBag/f4q56agoIG9BC0QnGNypEeMxZ6GaGjkes8/qJ0ZxzC1XGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jEhNrq6k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CF7606A332
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jEhNrq6k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5CD1F000C4;
	Sun, 15 Nov 2026 10:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739914;
	bh=UBtbJXirjIJ/LGxifBJaZ8UpaDDGbh65s0QsaJEHQwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jEhNrq6kmRqPlWi4sc3OuJOqSW3w7lwcK6/cJvql3fHrWzHNBOF7DLIcMN5fsnzmz
	 tfek6I/+UynlafEPTfNPalgeyn5XorfQ+8gtLOAgR+y2Ld2qHhN2OburXtH9WJS1np
	 6q9AY6INJtAzGRVHItlwpe4hgbUX/3HeogNWi5Ez4fWDmt30Pm/Ro0Vl8Lqa0dDkVa
	 BrOYcD52F7I2DoLOhZw6v6t7vA9VJZz2tKuuMNS90qzxNSkAn5oS6IYO/zbe1DQyn3
	 /0napPOsiw7D0upViqGOFzkdvVBNJXfiP+/dnNCJ66Jj4opIBBFvrGg/k1p9OoecpE
	 vzSvXCbd160rQ==
Message-ID: <sashiko-outbox-215418@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 05/13] ax88179_178a: Add EEE configuration
 support for AX88179A MACs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-ax88179a-v21-5-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
 <20261114-ax88179a-v21-5-c2d34410bcbe@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:51:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The AX88179A uses a simple HW configuration for EEE
> via a single EEE configuration register without LPI timer support
> Add support for setting this EEE enable/disable register in implementatio=
ns
> of mac_enable_tx_lpi/mac_disable_tx_lpi.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-ax88179a-v=
21-0-c2d34410bcbe@birger-koblitz.de?part=3D5

