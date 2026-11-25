Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617374;
	b=JpxbWcgWJ01pqFeiO9hCnA4gXbR8w05UcDHbko9bCxAlNk+0AlzsIoaUhBDa8dXf+dwj
	 TFBr9T5K4UCMu5vNH2/gvc+oN8TBppjNyxyFG5RljoFKNW2JM2C5Wfvan4rROeMFlUy3M
	 UPvsoLvKXUbQZP7gSYivAwK/EKUW1iwVr19aZE9rmY6bnyLcJF78A9T8Ma9RvQwN7JekH
	 ikzL/G/bUpPFDNjevDgTMtfOZ6kuoYXFHZfCYE/X1pNPyrSLslC1/WYI+XBg/nf6OpdDs
	 fRXE9I3w9RRbjRO4srHyeYFmTXNOblRrIK33WFO1K4Mv3Qt5GxEdrHaLVt+pCMaE10w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617374;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8bt1VhY4Z6lrwcSRVRYFggq11srpFNpG+PWeUasOy9Q=;
	b=INktVxXH0QONIuTKVTiDzHUaRnbZjB6eQmomTAcJ81LGJXGXc6KqWiuf6jdtp9jPzJrh
	 tG2caTLdRE8XLPXzgx9807n+bGsZ8bXSvP9uCIrgl3OZ2tZVwJJF2bItJJYF/mhVXCJji
	 tNA/6On+2LM9LzhIP++cAQs8Z+sGUF3L1tNRBdSl0BCOt6geya7Pwf0Do7JZAix+ZQ5nM
	 M9b/E60swgXcBRK/ZZBah/Ape/o//pYFpB0foh9Xr9NUpXdnN56OsI4fqEaR+eGaL9sbD
	 gkKq8Zeq3TzjKK6rxiK+80viojI5xmPonuIYyduH40JtWCkNR/iyAkBy/yQN+krMqFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eXY2/BkE";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986ED606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eXY2/BkE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3741F000EF;
	Wed, 25 Nov 2026 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795617374;
	bh=8bt1VhY4Z6lrwcSRVRYFggq11srpFNpG+PWeUasOy9Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eXY2/BkE4Az13LO6XYuG4OAnWoIqcCDhMpH7UTsY0fTSbqZygU2c2s9iL9SoHfaRF
	 iffDPiD+96/citUZ1ReA39VrA9nFHo2bfpnXhXAjdJvk7/iopRkPdbxQBAnz/r7Oa2
	 Pg8s9EEqAZc/Qqlx1R1VnmF0JNdwjv47MzMbP8VbDfLNokWIEADQz+IW4skigKBTrT
	 /mhuHyLkbc8jImBdpfEu4X4+KyktVJ71UH3oLzB7XpvQ+2Js08v0OTyJGwlbY0WyR2
	 p2VphZ+BmhR2v1MKSkD80cUyox60j+a2sYMOCmYjlGD28s1edhKc1iOgFBGv2Zfdiw
	 0J3h+QzEb81RQ==
Message-ID: <sashiko-outbox-233571@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 0/3] usb: dwc3: support two connectors sharing one
 HS data bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125142309.3265777-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261125142309.3265777-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 14:36:13 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125142309.3265=
777-1-xiaqinghuan@mail.ustc.edu.cn
