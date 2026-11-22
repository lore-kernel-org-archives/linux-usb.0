Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343806;
	b=lSEDY55/hK2WLRLl/j+JMrXj6xMp8qu7+sNZ65iM0kxLosEQw7UG2W/bOLNzrwAqJYjy
	 6YX1COebMRVeGiRBJ9lWMiQU2984I35YeKe3loBdGiQxdrRdcL/bhnenjnPwKkv3010rw
	 HXsDrEgm8ullx0TPSfBsJ1el2Os2PKHzUywXhjvbhDoaF0fZlGY1e4gfX6+einXN1Ha7z
	 r2UFo+u4VEMeEeVXHJjV6YmsAiRfphldiDq2rXnB7DxZkt9RM/08smfcE/Ra3Fm8IPfQJ
	 6FGHQN8oqHgPvGswiYxvZviU8U3qgweZTVEDCcKsb94uvHoW5Tz8+o72IayXHDi+1kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343806;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=f5DumYQNpkSABswUrVloRDbcDP0vt1e5D2QmiEC2pAE=;
	b=yDWxC/HAQGr7jk84S/xDG18jsd4HU6ChtyxMOezs4zwWAe8uoB8ccQaqeksXrLDekPht
	 CEN49bFvRasosxBwffy7o5qrZFsif0hLSpobrtxR8KT0tXcL3HlTUVHY+kqMz2vBSbNGi
	 Z1gTyG29wXh7uvo7PkvpAx+NgYz45O0axw4JblT9eaEGZMSWJSLBclK+K21G3XaON5Jwl
	 sf6A0FKVfDhjJNFmwnc6NMPm9HDWhLTCTC/7agVmeXZ9YgMethjivY07SXNigXS98+vxU
	 nhDYJRhTGiiv3oIg3T74Kx5Wnq6thYMoJZOwMMdRYbOhMu0Cwup3hr3vUbiLCz7l2qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dgw081ki;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A35606A32A
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 10:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dgw081ki
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FDB1F000C0;
	Sun, 22 Nov 2026 10:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795343805;
	bh=f5DumYQNpkSABswUrVloRDbcDP0vt1e5D2QmiEC2pAE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dgw081ki0zpBl9EymkXJ1Zkz0+eR7n/ASy8H31/y2XARsEvEHyLAlharrDRge3Lmq
	 2aZ41rKosD1jxYbQO+xKmYWUjCmINJ5AXTn8q3kSkoLyNr4aS/Ne0T/+1jCO+GFKKQ
	 djWJ4krgBXDj3jov2jRTLewIpW/FQi/hvKMN6JIt5IklTj9owvTKY3czRoKr9cCzuP
	 Iz1CIPE/d0oszLTI7V2WRAlIkOh+xQgp3kOGHs6KKcxtY/mJGnoNU4bYEKQX/96keB
	 /mt6EGNGk2XifYFTV0+xIu0rP0WJIZr7vtvPhbAgqDgBufJb9wg0xFGC+le6HAdCwB
	 KkrON7ZVMa/qQ==
Message-ID: <sashiko-outbox-227895@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: fix missed frs_sourcing_vbus() call
 during FRS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Max Andreev" <drunkbatya.js@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261122102839.2902079-1-drunkbatya.js@gmail.com>
References: <20261122102839.2902079-1-drunkbatya.js@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 10:36:45 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] usb: typec: tcpm: Signed-off-by and Fixes trailers placed below
  --- tearline
--

commit 2b51cba8ef01ebefb9093ae6c74c438910efa79e
Author: Max Andreev <drunkbatya.js@gmail.com>

> usb: typec: tcpm: fix missed frs_sourcing_vbus() call during FRS
>
> Since commit 0908c5aca31e ("usb: typec: tcpm: AMS and Collision
> Avoidance") the TCPC reports sourcing vbus while the port is still in
> AMS_START with FR_SWAP_SEND as the upcoming state. Because of
> _tcpm_pd_vbus_on() ignores this state, frs_sourcing_vbus() is never called
> during FRS.
>
> On Pixel 11 Pro XL after an FRS from sink to source the phone keeps
> showing the charging indicator, and about 20 seconds later VBUS drops
> and the attached device reboots.
>
> Call frs_sourcing_vbus() from AMS_START when the upcoming state is
> FR_SWAP_SEND.

[Severity: High]
The Fixes:, Cc:, and Signed-off-by: trailers were placed below the first
"---" separator line in the patch, causing git am to strip them along with
the patch commentary and leaving the applied commit without a
Signed-off-by: or Fixes: trailer.  Those trailers need to sit above the
first "---" line so they are kept in the commit message.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122102839.2902=
079-1-drunkbatya.js@gmail.com?part=3D1
