Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353602;
	b=kebTHRF9+SIry3aEI2TTz7XzusxyNbciOOxtLpx514SCIhP0d6rIcokP683k13CMezyt
	 CrLwBhA1/rqRTkHKdZFvZShFPTsbDdiDHwNfsrR16Gkz39HdZNpTReYWbUOH+A7CU6hgy
	 VhPXvlsJLBvc5wvLI1Yr4ajjAIw8QlZZt0oirpMHypXaFxdmNI7hLkB703M+oLETZ358c
	 3RiopN2IbLdzxpEl94r87ZF72kIEeEGBlutJyIdsp/18ek0FfR5jGme9ERfUWLofsxntb
	 ODNgcEeoUhm7xDV/QyYj0h39MUwRh1Dn9ZcqyCVl3u/KDidvrh6RpDBBXkjjtSO0yuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353602;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eKCKBiKW9HfMGKmYPJJ9smcZE5UFa7C2sFPFaNxRBNY=;
	b=2YRuYuDD+CxaRvcW7ddvHaj+A6UCIzl+ylpKTRdy/838ShSq55pnnL+4GuYK/iaKXUJG
	 EROS9AqeG+YrlJL8mmOf4AfaRGA5d2SZXCqrPBhNeyfrtZF5yjQrne1gBEv2DN9rElpaE
	 LNriz17I51mEQahU19gZFE52OG0X61gxIMje23pX9RJOdx1czDDpDgdt3vzY1F5al0HvE
	 5XAtPcMLW0hLK7WuhpySPSSjMqoCfsLOnfUfKbKrNjq/lYJYX0/ukOb0jPalnBb3zmshY
	 Qw14I0/obP7UTijdNh2nxg1sIWTkNHFaSBrQ5JvEXRoNiB+L0qTwottErlwbj0hcNcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sx2UsUf4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1AB606A320
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sx2UsUf4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307681F0093C;
	Tue, 10 Nov 2026 23:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353602;
	bh=eKCKBiKW9HfMGKmYPJJ9smcZE5UFa7C2sFPFaNxRBNY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sx2UsUf4ph68Pzylu9NN1PnAtgnrUSOps+Tea534wuxg09NQ5TUYzy/LXWebb6r5d
	 lKLWqtuxhhr792VIq9RbjaC3HB4hnRuRP1WPQMedeUAxse5j2HnZtqsSMzmxuLi3Xy
	 sH31BToJZQV540DcT8X9s0BDdNgOnP4F8h5q2j89E2qAjdsERBqWyFhHmo6NR54hP5
	 FFSJr/mmDW6YTtntwgAUxLPsWD/lgxTbvrw0hNr7oqHU9yl3NUyCAbWworvkk5ARp1
	 eurivgGiev65TMnTcvHs7LLhTsKwR6CuIXAN3ahp9halfdSLcELOefcelZO4Htz0rF
	 zuwOXl7Xw24BQ==
Message-ID: <sashiko-outbox-207931@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 16/22] usb: phy: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-17-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-17-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:33:21 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110075825.2494=
6-1-shishunbo@cmss.chinamobile.com?part=3D16

