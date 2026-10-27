Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101053;
	b=KWt8MQhT+nKGgm6vUfYDaTzrHokteXt1AdSlpVUDbYtZfjxpc+SjDrW3hh3HX7v+zD8U
	 IglyWKpsDGXzjQw57uWs3a/swfWEi9O6ecMSG/K9oSJ7yIdqXGctWnse3iknhUV0Pr+T7
	 ZRXpfGkqEpTiDRaVXYEieO/KHRfQ0r9CNCYIF3VMFtw0TxLRY1iWMsB2sayS3kwDdNJW0
	 SWK1mcTN2Gwc9h8VRB1qCVEK7xUI1qgIu7JjOw7lOEfHgweC4uOoq4nnAtls40KoMtYIG
	 ej72i7SxNCYMp/+3C5+JEUtzHp0AUrhaN8LD1k2MO8Zuon5UvTr5NRHVD5Pom6kRo8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101053;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5zJkQo9DZw/r4JUUHM7XRVE8fjTusHDoU1iilE7vlts=;
	b=KhHh3GB06wJzhB+jORa3wBrXKqeTaHMkVGRfmBnJ64ocqq/BTpZ7L/gweffKrhdPt/fb
	 Pd189C5+iYs6z+pWjF59qSwq4ZLKOKqTmxPh6uxPUMxaPHevP9eQ3a4uvWZ1IM7ZPtr26
	 vm7XmeqZ5XVaHHFo9/g2qszKMfyBH+uO2dVbew/pvwPtgtRMkIgYBk6OAAJN6p2AU/vAd
	 kUpXs5GJjRGQrvBcUWrIgjPCQd0yA64ophW7h83Lc02qihA044ukpmZdtWa+XKCBu4QQq
	 aKmQs/rTjEwU2hcynAFRH/h0q3PDoqRKGB11Wotd0Y7KHg1nVZ1Gc4dX/IYuo5m5Udw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crlwnDkE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F30606A31E
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 11:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crlwnDkE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47681F01829;
	Tue, 27 Oct 2026 11:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101052;
	bh=5zJkQo9DZw/r4JUUHM7XRVE8fjTusHDoU1iilE7vlts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=crlwnDkE449Iak2XltXlEs7hVu5LKpiURvUMni994mlkWMYW29K0izQMH3nBWvy0C
	 je8TDoLyFEK7IEhIXui8mqrnDKVVs8J6AwiL4OZCoMH0MNULfFNe4oF3KBe2IzGI0X
	 mV2krsvsoCA+0Qqh53wmL2AHPT3wb3k8Ll/gcqcCtYzAqMxAjsuNzFAGQQjUeCA6Ei
	 Ce+2ic+WpMWfQklIaUiJNMxEv7MpP8Y2TdnFaXT6iAbU+5mbqfjLTv+sZwcMw3jyi4
	 mc8MvPFWDPdAcot0N4YRqwAcEmjLcacyz37QELW/T0toeNtXK+S2oubbxSP6T4a7Ax
	 Ng1whQGzG1ugg==
Message-ID: <sashiko-outbox-186463@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 8/8] Documentation: sound: add the Babyface Pro
 proprietary-mode design doc
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SXNtYcOvbCBCYWhsb3Vs?= <i.bahloul01@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027113140.134257-9-i.bahloul01@gmail.com>
References: <20261027113140.134257-1-i.bahloul01@gmail.com>
 <20261027113140.134257-9-i.bahloul01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:37:32 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> A big-picture companion to the patch series, for human reviewers:
> why the proprietary mode needs a standalone driver instead of a
> snd-usb-audio quirk, the vendor protocol's write-only/no-readback
> shape and what that forces onto the driver, the stream session
> model, why the mixer state has to be cached and replayed, and why
> the driver has to emulate TotalMix's own role for the front panel.
>=20
> Requested by Takashi Iwai's v4 review: documentation for reviewers,
> not restating what the code comments already say inline.
>=20
> Signed-off-by: Isma=C3=AFl Bahloul <i.bahloul01@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113140.1342=
57-1-i.bahloul01@gmail.com?part=3D8

