Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795561441;
	b=KKLcYxOyeVyc/fIOCuVFybrtvn9gEy+vukWsY6pZC9fB3fmH/rhKG3ALfmSFqjcOCH5W
	 bJ2AtYV2gmMrRcoV50GkaYutFgE0VlD4pV3fmWx827U26SaV6peHPK8kPGi/aHlEQq/Zz
	 8TZJBnyH98nX12FDhtx2VYcZUaSYtfMnwx6l2ozoaPF6R21cTu4X8rdnbhAIQ+cWddnI7
	 Dy1lC7PImaqOnjtz7VBn5t7izF5i3/sUQGHQtzqQiPZFkrb88/761xffrQWysIt/fjkl8
	 Te2aT0Godx0+yZ14LAA+0jsie6WRK602n7iWy1a691MxbBUXo95X6WAPOBRBYoDr2+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561441;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eOackRdHj20TaorE0rkf7b+zljuyvLLbeb54tjVD4bM=;
	b=0dNJPrQFBTXu25aw3BhtpHLpckylkY0uwGJ7uybUsjS0DzxUoFG63sTaLBuqU41uKk2Q
	 PBVtYbiqF0uYjBHX2NnKpSrBqScSbFH0QUe68gOW0GVstx4HmXl479yJryZBbtNyGAmi5
	 JFu7kygRnmRCw2+9TtF3ZlSFe+mFKkdDW4xS7Q0w3TAr6D1uvsCat576lKW2LoAV4LT/0
	 wvKu4tDVQd8/7MBhNLh3sR6fwipEuRz0AdwZybL7l3kyy91sos8z5b+pWbL/5QSrfWEf3
	 niYtTPUTD/MsoRT44uzDd8vaTnJccCEQBK9bbf7Afl0ODRRkeMrYNl/jRvBsPsz4DaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zap4Lcoj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7133C606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 23:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zap4Lcoj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2C21F000CA;
	Tue, 24 Nov 2026 23:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795561440;
	bh=eOackRdHj20TaorE0rkf7b+zljuyvLLbeb54tjVD4bM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zap4LcojSiPFr+xShPj8Zc1kEuIlV8o4JlhS+UOz8/j+QHCvieiBS08ocqx26JFXd
	 mJodjXZ4KcRbWwn2YSj6g+68A35E21Yt6MhLxBciAXhXuMMmDFzj8gCSb9PBWFDsOF
	 +y0kh300g/sNeEf6XasSOfPLjuPNdLDGEEp3kOkAxcoK0uNTQofP6jNSC/BXb5iica
	 GuXZnaNskuhKJkJinY0whLWeWaP03j7iy8Vc0KHZ0r9eBurOuePBtcWjBoXaOGvqMG
	 6tH5joBFlTWmuOpZm6J0fghyoYPmyhm8plDdjLR3oNovFeRx0K9tnwyTJ2Vd+gv3JI
	 FHPtc7fV+LvaA==
Message-ID: <sashiko-outbox-232189@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/3] usb: dwc3: Let glue drivers override all dwc3
 properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thinh Nguyen" <Thinh.Nguyen@synopsys.com>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
References: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 23:04:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 3-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795559405.gi=
t.Thinh.Nguyen@synopsys.com
