Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185139;
	b=q8yNTKsXc1qPUpuRqUC9xXifGYhb1KtEwAGSnA2C3Wv3sflxZz8kHAa447Gw9YjJanC9
	 vK984B57fRRWsNjKowZdC4SV+EE8TVvWFdGZOyG2p/kUhgfEvU/aYmpkkZnIgHpZHqOle
	 KVPs1JsuxI7Q3N1Q8ryFN9FoL76ox194H4xxxreFNzxzwYdALCzV82U6mBZjaYo2jH58S
	 9tNcBVki3HCQ0KREi2lOLU0oH+0y+GXob4aSlgdr0Ti1O6OBqL3nu9jlX2vrTyd2/qvIo
	 6zT9NgYgjwPb16Ef1SjWbacIXwn5QfZmZOCo4QJqm2AmzUovEIJTpX510vnpqVwUR7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185139;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wrarnr1A6XXxbkpA/0XF99uSMx7m+bS1RzyAyHKfhsA=;
	b=g/ipsFfg22kMQa/JPHkFZrzcC9e1+42Q2UqyCHBlKiMIPFSXx53Q9DUdBOpKLLtmUQdH
	 ilRX7mrH1DJAmcTZybbVQlJA//UutTMxRi6lSfIc5ThFiYUg6Y4vveT2C2TL4/E3rpi5F
	 SyAJecxg/dfhnisC0Gv3J2ZpCNhUcl0falL2FZigLoaIFumWPmbm25EKCueFUTgI7qskN
	 HlM+lVVWkVAu+eli16p6LPtJpxW0oRyHIrxGKfK4eY6lCdrfEuWdvzdnJ4AYtqEsZsPp0
	 JPDjXuDSbwjF2MNZ6TFBFSsje6KKWwYy4DJjiclF00hHMfCDdR1neaoaJfReFL+7iBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MID2yPIh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789A2606A320;
	Mon,  9 Nov 2026 00:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MID2yPIh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176131F0089F;
	Mon,  9 Nov 2026 00:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794185139;
	bh=wrarnr1A6XXxbkpA/0XF99uSMx7m+bS1RzyAyHKfhsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MID2yPIhKQVPlcEUr5piuh1Mp3hXFXCbVkvBqDZdlD3aVNZEiv2ToirV/SqW2hovh
	 OdhAx+KqpHlXux7NIBA1XpkBvRFpQIpS8bgvErgKq4XCeY36tE0Pgv9kX94Yc+PAO9
	 znmeQ8+nvAsGump18rDUHRbBmt+Rx/KOgZ/fKoGkGkBgqFuztM6bN2kqeqedzUYN4y
	 u0/DtWc+XBCxYa3V+BWfIjrl8AYDlxNe5bhBaSS5jDeDEcsLd2xTjEgyUAk8Vo6sGx
	 jnwV/3ALtB+Uj1RJtp1OacRrVbg+vdNLDHwGd8hhsPo2ZcQujHMaPVlw0TPSXA7heG
	 mj3fSrtuFY0bw==
Message-ID: <sashiko-outbox-204252@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/17] dt-bindings: cpufreq: qcom-hw: Document Halliday
 CPUFREQ hardware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-halliday-dts-v1-12-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-12-289114ab8197@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:45:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the CPUFREQ hardware (EPSS) on the Qualcomm Halliday SoC.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-d=
ts-v1-0-289114ab8197@gmail.com?part=3D12

