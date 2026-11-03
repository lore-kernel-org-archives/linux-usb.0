Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793689067;
	b=S8llTwHiKhknNNay2nLiemjlK2orhd1gldNni9GYPrxYZhlbjQm0Sn5xDuECFAa8VYvB
	 zumDH1IsJlzBVTOOQanuqYXuyhhWIAB6f2eKxVKlVhiPNeWEirW/9y3/nBP0NyE43bBSj
	 hnIMDzX267YY2VFUPMzApY9Vt6GKOobX1jfD6PvC/VN/4VJG9e0iU6W83fOCywy6nlkHh
	 Dhc5ZVbKxfFd7TTpM/mpAohmuTeal6QrCHpDauOWb+57RvXLYKeJyPBlDesr1TrQaZoQM
	 +HTPAC66BCmdfRdmc9X+jodSUaFg5eBCTqceOX1YpWfoIWsqUQoKflMeGFowdxq5iWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689067;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=L5zN4vgAWqszHABo7mdpF/3sDWkHqXNoqQuO9FZ0ptM=;
	b=YjDY3N+cs/o9SNwQasZI0IG/+EdtP1BqM7biPwUjKhH5QOlLZ6U4qBGtlF6r5r1EVrDD
	 r4wVJJXH2dNLrZ8/N4scEgR1CjM1Wu5E3oisjLEjvZQq2eGqWeQXvA45Q2/DEQNSY5xM9
	 YPD2prkfnK6a92cs1fo6ds2u1yNKGmFbJKBjomto+OtZd3xbAvntcf8YW3XPcSB4reYYj
	 K35436saAiiJdySfnraLGZk0g9r4Tteo8r/YxO/k6B3iUi7E2RRc1C/EZVbAuY102c8L5
	 wXq6JUR6mQ7XQDFb/OHXW174hEU+fSbUrL5WR/khcaBpMYrYbN93AIdZBciOP4f7HKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e15kp/C8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D898606A324
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 06:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e15kp/C8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5F61F000C1;
	Tue,  3 Nov 2026 06:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793689066;
	bh=L5zN4vgAWqszHABo7mdpF/3sDWkHqXNoqQuO9FZ0ptM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=e15kp/C8AGnfYfgXhNBbYOiILwdyUhnn7px7fKc+HX9qM5pNi0kCzSakckjpOLhUQ
	 LrJivhYWztmY7JImZwTrPk4XfNJOtkMVHHifuX7JE9RpMOAeSvehiYGdt+ryt/WUE8
	 d3UQn3hXDbXxpPXyb1uSqNNJ7JTPbj3Ca7gGGNmQJqVun/pdA7QmOC+wDjfHMDoQ/D
	 FTMKFkjHYp6hSwgYE4oYAVPwCUpvAWOMuYnMVnnNHntDbvse5FZAjpdkyAjI0U9CeL
	 YH7gBhVQCmildxja/nZbMDq6VvPcK4IAKxzPhT+K3A9ZgHgjhLwOnDDyzm7O49N3g4
	 ZiQOqshosTpbw==
Message-ID: <sashiko-outbox-194684@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: starfive,jhb100-dwc3: Add
 adapter register region
Reply-To: sashiko-reviews@lists.linux.dev
To: "Minda Chen" <minda.chen@starfivetech.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261103064836.71059-2-minda.chen@starfivetech.com>
References: <20261103064836.71059-1-minda.chen@starfivetech.com>
 <20261103064836.71059-2-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:57:46 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add dt-binding of JHB100 server host field USB device controller,
> which still using dwc3 usb core and contains an extra PHY adapter
> register IO register region. Require to add IO register descriptions
> and regs-name list.
>=20
> To compat with normal bmc usb, which contains only 1 dwc3 core IO
> register region, add miniItem to 1.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103064836.7105=
9-1-minda.chen@starfivetech.com?part=3D1

