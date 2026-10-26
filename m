Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793056515;
	b=UtqMO6i9TsaVY46+Fi+2nCI7+5XvGTOwaG6LQpowyOUeTmP18Ai2oZ6DVooPdYrF5SQW
	 24Ufvdev4sMC6U25Zs6z7jb0QCy5tJQmlkXe31VehhV4L2VDVwwpZwi7c4o1X//IeCFdR
	 0dK2kW6PYfy8G5EEycj0BHa2IPzgI8PloNrcbsK4MPOqsE+g0mCaqIZwq1FpFlfA3YmUs
	 o3UYWpQKVQ08CECbFS+szTDoZpmLlmZtP1Hfafbx2unFxqIA5BYlb+lmP6V1BRusJT1aU
	 JaoRGiemGP3Ijr8/wlSHusbYdDcQdiSWHlA3ChIBg4Bq68chh3d/rm9fQyBS+/gZ9rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793056515;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VlkVuN5xxSXFSbA3gaSLgx5ymzlO1vzhGXKlaRxOHZU=;
	b=vOBmVDBYJGZWQvrCw8hxLWegnem1s6uYwStv4qffUQLprZJsjGTP4zZc0MIreTQRyXMm
	 /7vMY+UP1ldyFBvHPKnUoZexTNHVVxoaj9lYNPh63lrbjeAMrdLzAmPjkgwVQH/x+h0C0
	 D94IMPHjIKRZ4CS92Cp2qmTZeR158nFy49skgV5ebMw/eoNy8YdGkjgvzNYJys1DfPkIc
	 4JJxZQCkV697MJv3yfcf9SEX1SRXXEXtUHbWbALzGyO2HxM1zWL+MRHKKuxsebszLrJTk
	 lqWQ7ImnalB+dWg/paqXUAeJRpYElEF/Xv892aVugpH877TLKeXjsRZUG9HIYq9jYsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJW3pEeo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9855606A322
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 23:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJW3pEeo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B8D1F01825;
	Mon, 26 Oct 2026 23:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793056514;
	bh=VlkVuN5xxSXFSbA3gaSLgx5ymzlO1vzhGXKlaRxOHZU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FJW3pEeoybftVit52j2+SOO6qVNgrp39E51N0kpgMoIzAGesKPZa+WijZCE1FON6O
	 Hh5J2+umKOtlzlsGiHvZOtBdZpL5lnOGS5DVJD+B1II+JPu04wyHdI01q19pQUlzzK
	 JwhdHEXMr+rMwSPLRzdRvquGqwbYmS4YkplAtXdX9sBblGcj+0fdSSl0BzMIDF/HHq
	 +/DCtLMz5RF1MXMEd5Pp3stJ+exQVoZ5vBx4yH8Z1HA1CG3MEQC6klTqlE8WAf/DVB
	 PhgCpuIe9itBJOCweFw0NTPytJRiBQAcWRJOlC5FF6j1lOHT+9FPHwp8rKykbyefeU
	 5BO4AtbDuUWcg==
Message-ID: <sashiko-outbox-185829@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: u_audio: don't exceed maxpacket when
 adding a residue frame
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Farrell" <kaf@nwlink.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261026231026.721536-1-kaf@nwlink.com>
References: <20261026231026.721536-1-kaf@nwlink.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 23:15:13 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> u_audio_iso_complete() clamps the base packet size to ep->maxpacket
> and accumulates fractional-frame residue in p_residue_mil. Once a
> whole frame has accumulated, it is appended to the packet without
> checking whether it fits within ep->maxpacket.
>=20
> Only append the extra frame if it fits. Consume the accumulated
> residue whether or not the frame is sent, preventing it from growing
> when the additional frame cannot fit. When the frame fits, behavior
> is unchanged. Otherwise, the stream cannot sustain the requested
> sample rate.
>=20
> For example, with 27 channels of 32-bit samples at 19200 Hz on a
> high-speed link with p_hs_bint=3D3, the required packet size of 1080
> bytes is capped at 1024. The base packet is 972 bytes, but appending
> a residue frame increases it to 1080 bytes, exceeding the allocated
> request buffer by 56 bytes.
>=20
> Fixes: 9bb87f168931 ("usb: gadget: f_uac2: send reasonably sized packets")
> Link: https://lore.kernel.org/linux-usb/sashiko-outbox-174688@kernel.org/
> Signed-off-by: Kyle Farrell <kaf@nwlink.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026231026.7215=
36-1-kaf@nwlink.com?part=3D1

