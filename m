Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036112;
	b=NHATJnsBFrGW0uKO5GEiXJP8Auu63hgxk/20gyhFoUdy+ILWj0eyk93C6j+Jw0TMtgwW
	 lnWPgyD+CxM7yeUz2e89Q4DYe0KPRkJycZQkv4OwlWJUegh9oZMlSQKgAuavzbFPAni4B
	 WeSS6578yS54hLYdnA8mapAvzETSSE2tXTexVgePYW7wAWBWOPa09KCHw7OlTt6cyGBXS
	 J8o3292sqymchP2RXdij5f35CkHHIilMeYgixbNYuGXlvEOm/WBQ281QquJpGSbYN8EXC
	 axzre6V8DW5d1xZDVHUgx/q2SyZec2+jKwiDtAc1tMIuK/Iz+IzhRjxNVXfJnu2/FhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036112;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zRT51LIsoh5YmCQ8T+veeFeZxI/PQ3kv5UlPcu9mGUw=;
	b=FrzqW/9+dMeqrfkpkgZiND9Sk13G5nKztd8oHjz92K8sIr1cR4Sc48XDRrO2AO9ejMjG
	 /lCYTLV4Ta6MZNap1lWldJV38iLOiOgO3u2lcHRgHzQ8Nof4tflRS3UrjrICzhH2eHpyf
	 PZF/Cb1xT5t5whfWiwzvsz9K3Z1WBLV2RJJhX3glMBDkTkDjeTW3TcQrz0m8yL5LKKVx7
	 xSQBPyNWtGyeGb1n/AR8CqpMDbuimNJDm2AJd8wgXeZuCVo3VjOLWUldORFVz0pAi2QWu
	 CJTSxSDeQ6Ni6E0ZzLmXo2u8DN0P3xoR1Jfqo1svEK8csOPM/A8tEQ+byCRnKRRwLLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XEYgfpyf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210F3606A32F
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 07:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XEYgfpyf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1071F0089F;
	Sat,  7 Nov 2026 07:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036111;
	bh=zRT51LIsoh5YmCQ8T+veeFeZxI/PQ3kv5UlPcu9mGUw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XEYgfpyfq1SER7PzcDLze+32TGgE3TC20huCNn5SoBfeMLsf82NvpBdeqlgWyEFaI
	 pvzVsu1jzcudzxJhqclsP/nCmzXci18rizUcaOkShkzybGQXNw8M098k4nyvDG81bD
	 1gQtjvcQ3gK0qolUgYU+U50iEqXld8GFyTDEwq9I9STRjBaeobL2QfNf29Ql5zBwY1
	 8YbVicpZhlakoo5ajQvSDRGvyCcOXhBJJYPdB05D7HgI8YIGoEnPKoy0AGS+YOCu9k
	 raeJ9BByN3+E7/nZPj0PCz4w1tNi6rWCmsOl+Cd4lmH+gDjdFaDjComMrEnICZ5wP+
	 ufXbIVoubZIIg==
Message-ID: <sashiko-outbox-202695@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 05/13] ax88179_178a: Add EEE configuration
 support for AX88179A MACs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-ax88179a-v20-5-37b5a1189983@birger-koblitz.de>
References: <20261106-ax88179a-v20-0-37b5a1189983@birger-koblitz.de>
 <20261106-ax88179a-v20-5-37b5a1189983@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 07:21:51 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-ax88179a-v=
20-0-37b5a1189983@birger-koblitz.de?part=3D5

