Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794671214;
	b=vxxmOz8k/Hb57zWZ/f2kekKcHKajRjwLFH0Txj9aDwOqisocXhI+4W9Y89mH3JfqCB2J
	 UFWMunqZjfClEale46D73mi/D4zbRplSikj3myLPbO+zyAW292pfwCXzf3Ms3Oel7oQ7T
	 lkecHHXrZWYoVSTkGArWOGkqh11RrbMqce/1ELCyFR4n8JzsgsfGlPFXqLjoM3WvgdHD0
	 paDi28cBzdQwPtfted4QFYpgueA+uwuQANeZuxjSXCclw9nZx1ebmYqiY5r7qfR9fxPm/
	 pziSXPhocwcu0Q9XxXZaO3/6hDGLCvL1J90PHyfKr7iQ/o3LQ2gywZc5W2XOIOw6Rzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794671214;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oJfLCbEWSSl6rkO8P00nsoYTeNKVoqVL6lt7QPADnXE=;
	b=sBLxs2eK8gUSGof1Q79+ffcA5ZHIHPII3gROdC/5wqDNDrAXvAAwu2Z23u5ViEEg0Jxq
	 AfB0hXTAf6qSEQ58C9wC+blBOEQ2bLCmf8VRUCLUQ3+TvTfPFlN8N8qyNIuHopJvDlCec
	 bCglzArKaalCvGmUjB/0Bk+We0laeUpM0e/SL/Q0RD9OrktQfIUCsAK1uWP/xaQOrX/WA
	 FI7sUeD5VGvaOwVtconQ9xBjZMZgHS6OQQcRJRoATkHb41o2XQs/5LVtjL80BIpSk/vTs
	 KaVyqMrHpHD9kYY6763Td7QDA+xCLheZmmuh/ELeM0H+ztPyMj7K+nHkKQq65+bS0Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXf6yq8n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2C0606A32E
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXf6yq8n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BBA51F000C4;
	Sat, 14 Nov 2026 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794671214;
	bh=oJfLCbEWSSl6rkO8P00nsoYTeNKVoqVL6lt7QPADnXE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oXf6yq8n/J8kf4S+Z01Yp1rvxB522kdk6Q/SiRkqyHezOu0cajco0nvtWi2SEkaqf
	 F+MWJbrDUggcvcm9JNfiQ+agih9JDpeqBEQQ7g22OLJ2fUaboTuFg0JOLLeBpirKKD
	 kl12QmWoVe0nIdvm6j3V9DHWCP/UReZyF8eaENO3/3qduYPm0GEfv7HZVRaMHvsP06
	 wzNiYuKWF0mGDqRt7Br6XbkFeCcs3Rf/cA8T4M8kaCboxN2Dg6rELlKCQ9GAUcymLe
	 g/PCeLy5UvgSy/CgKPzJrkcmLx0C5sr1iVU8E8t8//JivJUF0VWBiFoKpReqGOj21U
	 W/CtvFKceJqlw==
Message-ID: <sashiko-outbox-214728@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qrb2210-arduino-imola: enable the
 EUD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Opaniuk" <igor.opaniuk@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-qcm2290-eud-v1-4-b6157b817377@oss.qualcomm.com>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
 <20261114-qcm2290-eud-v1-4-b6157b817377@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 15:46:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The UNO Q exposes the EUD on its USB-C port: with it enabled, a host
> sees the EUD hub and its SWD/trace functions, which OpenOCD's EUD
> adapter uses to debug the SoC.
>=20
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-qcm2290-eu=
d-v1-0-b6157b817377@oss.qualcomm.com?part=3D4

