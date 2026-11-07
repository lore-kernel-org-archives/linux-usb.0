Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794063640;
	b=IB4/zho1GnESl5KJPDkLZ6JjWSuxm6tZXCZFkPW7QmLvPqB6Osj4bX/YCOY8B/btJgxy
	 7DFaPcOYGP7ZuubkcpXxrnucOQIeOwdRUGza8FUrrs6HwFQ5ZtU8KJT8lz0TJjSDEbZIp
	 zlYorVVQBP+fDA069Bi2XiWpcWwNeTkLlltHVKYn6xM0rHFRt5XudZbuHJaotjYQPhTNo
	 +vkAq/tLtXGCu+tHdmd9AI0u320lE+qa8r3J6op/+HdX2RbVOzms2cHiXI+2IjHdIpZOm
	 uP+aNi6hhb8vnjzzIYO5S+aHZOca6dQ52dXhK2mOJw3tR4NkVh6p3WI6909j4Yhdotw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063640;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Oug5lQ3k1bHSBb7LfyQ1y37YyufUPg+zgyGUTRksKOk=;
	b=a+ChzHtcvta1xI988IH3OJUji7a895OGUnRnLoJazn+hnzQ7ahHwvNSEqOGzmqxs2Ibf
	 6syhfU0saPEwbFssU8z4Dep6m9gbH/GAV53UQ2HkZi/s/Opb9xqDnRYX6Vm0uwphrZZdw
	 0qK994ymHaU9nQW6qwpOwWYUwIT9gDGNsxTdRqGZiNrwDUuN6TlGVVKHihdjMpMkHv5g5
	 7iy//aRTBKWuBBK+m6KR6CrybVtkWevhJYDR1WTINzIA5m8YMX1MdB3fBhAN711bMUrv2
	 0ronf4ZGZphmf9YEcY/TOvwLvj3gDgiySE7NK+HqqeJPFcOSI6xy13LsN3YddQtRkcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="j59/0P8/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C54606A333
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j59/0P8/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05F31F008A1;
	Sat,  7 Nov 2026 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794063639;
	bh=Oug5lQ3k1bHSBb7LfyQ1y37YyufUPg+zgyGUTRksKOk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j59/0P8/Rc76/yeeD/7fCC9Sd47zPYIRAwGK1mhPfTmXuNc72ep0DsmXyqBqkvtvA
	 A5gq76CMMUXJ5xBC52YY0CROsWHU3t1jNdDKk1BQUjzh9+nSBpOXJvRKZO3JnMxVQS
	 u6pFaMA/fuzFFp2Xf96KixK+o0dhP5pVR5JTqGn4WwdKjAc4rrvECzItWHFEZBcp/n
	 5tWP+Fcfx3t/m5oCp/DSyu4lexjS7bVmLbyawaQF+ijmZDHHR38gEgH3zd16Or559F
	 X3NGW5lRb87OQsDnncs69YP1BvuesLLjwxNwE2Q/RZ/A8qIchTfALamNV1p9snl6bQ
	 2S6v7TLEqyMfw==
Message-ID: <sashiko-outbox-202976@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: mtu3: add mt6595
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107-6595-mtu3-v3-1-f36bc569cb47@protonmail.com>
References: <20261107-6595-mtu3-v3-0-f36bc569cb47@protonmail.com>
 <20261107-6595-mtu3-v3-1-f36bc569cb47@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 15:00:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Roman Vivchar <rva333@protonmail.com>
>=20
> Add a compatible string for the MTU3 IP found on the MediaTek mt6595 SoC.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-6595-mtu3-=
v3-0-f36bc569cb47@protonmail.com?part=3D1

