Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421953;
	b=sLLBCMM2hSld5OyS3WrwbsYjnYVSBkld18EXn58byNJzqeAkZqdErPGkHtauMDU4xMUA
	 fNFNzCII5i/6MBqQ9nJhecqKSdUozybdmxGFQJSWNCxYK9q4YHlMi6wj9Y/p/0HXtm7/p
	 Rh0yHrVHfjIYX538Jb9EKTrjjw6yIMqcS1xyIBjJiwXAdrElzemvZwMhYt0ndux3OAUdw
	 snZ1OZFM/dp2rrZicNVxN54jsB0/oxLW2YCMQLKQjfE+1wjrpJNZg/t78jITpFFoKZgNb
	 V6Bb4Bqq14yEcVn+Q5L04qDTAT5p0rIFRUwR9giGUsUeqlqOHfKRzK//r4+fik6JxmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421953;
	h=Received:Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 Date;
	bh=+R0B8S2hABvdNBkR24pQrxD7SFfBRqToCiDPwYF36WQ=;
	b=3xNKk5Hq93q+EOkLeTrIfo0QQU+Ln3aMYF5rTEBG382sIjCIk/F7cSipYkVrnyfhaXgD
	 Buq0qQUNCtvhQZEgDisa6IR82m2WSD2Qhty4sKTviJgyFgOSVHq17xQIhVL/09ZBhM3Aq
	 BBWpRnsJfr9GWJFyd4wR7U4ivpGKoosTYOWNvWP9JRb18lwgox3c+dnwhhXOpdXJzGz/N
	 0BX90NlL4i3YrFnoP1pSeP3oUFab1MJIqf4YV1cDB931RNVAx6fZrMdW+SVZlVkLyFcuG
	 P3CmoIYRd83GytH8VuwjwzglrkTprWVSNm02macGc/b8MAQA4vugcY0K6BWL8NQEF0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YI20Oo1Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F72B60774E5
	for <linux-usb.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YI20Oo1Y
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8057A6513C1
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 14:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421953; cv=none; b=s+svxGQ40mcoRgkiqI0Y4DEJ4ma5+qCEc9z/xY8hfVSSwKLf/NKqJ8JmEIoogxpcU1NcClqnVsZ2eQmd7exA+cB1FvPaN1t8MIZN2K6itbao5nbzpXKT+JVUzhK0m+rOs8xgbYojzvKRkqBsUZZJ5IBsd6OhMSBXI43DWtwkYIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421953; c=relaxed/simple;
	bh=+R0B8S2hABvdNBkR24pQrxD7SFfBRqToCiDPwYF36WQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OVJ9KNkPSH13i8XIBRwJkv6jqEFOvnLvOIY3mNb0PPNI5Ekf5DMStLlHxNPt/dceYePBNNVbpU9s7+Jp5TATJSAWZ4QvwCTQtFDUqikBBjaJLkJrofh+nvMmApCKR+kNXrUIiNEqiEQaCZl6RYoUAdF+doJZmcufTkPEnx/4Ot0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YI20Oo1Y; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF2A1F000C4;
	Mon, 19 Oct 2026 14:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792421952;
	bh=+R0B8S2hABvdNBkR24pQrxD7SFfBRqToCiDPwYF36WQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YI20Oo1YkqaTZybdNzEw+fpFywmSSl4AD+wMsMnd6t3G5UqdTxDZVQWUvLagyuv2L
	 fWaP1O2CIYQa5YrPNVb+g/H1C6yVQlFpXl16NKGDijQY1GfnuhheXHDAYbLPfXFjPy
	 ZMSggKO37zH+4mmV7rJ70fzp2Rs26z7vDl1oyS4afRPYeskImcsr3KBx++1iA6ldge
	 U5OlRad8XhDL0dlXMSzAb+DyUQ0PeHnznt8lQUIF/XVw2EHeFwM7grFDXFk5ddjUJf
	 URXIEfGl1HdYqGZ7S40EffV6vZC753Has2YJfO8cuUAe2zUjpb1kiOUrbjqly8h1Xh
	 g39h5vNZ+dWNA==
Message-ID: <sashiko-outbox-177581@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.10] usb: misc: cypress_cy7c63: check
 result of IO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019135441.1420968-353-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-353-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 14:59:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Oliver Neukum <oneukum@suse.com>
>=20
> [ Upstream commit 0673b919e0933541ae56bb3f0253853f696d3773 ]
>=20
> If the device returns a bogus short read, treat it as EIO.
> Actually check for IO errors.
>=20
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Link: https://patch.msgid.link/20260710095523.1646308-1-oneukum@suse.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-353-sashal@kernel.org?part=3D1

