Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109201;
	b=ILNf53ENGGAiVkwagrdeJAzL58b1DSwYM3ZJbnTgA3y4/EnVcm29aNjcakjWaXnB3BIY
	 QQWClgeXy89vGtGUzCkZRBzjVcWX5CfS5N7QdemXcuxiiuutPtr2etZPBiVTczinPDmtO
	 bxD4fAmSgBvNwRzitWjq214fcjzePcBMUY2TIp+/0dG4dADoeWu2fQukljbEpWcfYBIsr
	 JfvADTqKZgIqEVk73Z5uFiLHpGPHHgJ74YKdyzIK2sZUtdCPqYHqo+0VqJMFzVa76ipS0
	 8hTQc9HHABy0bu5glKQntok7NIoekhVNxhjK1qYQUjbnUyZOcIsJnH7jUPz4dgt7lGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109201;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=v+DP1SrWvEDdKKAzfZg7hbRHowLTS9DSAs4hS6Lzsgc=;
	b=tTvhKFvMORYW7p4dHS74OuEF8/aEKGeKs+H0uHuDaKFanc8zmPS9kNiKgYTvqpWdbI/p
	 qz3iKZVqi83dq1Pf6OHNw5PYvT+wwwZUK1ZZBfjlVDmQ3A7dzeCHRPwZLb+WPdiQpFt2X
	 jIw+nCx1pbYV+rOH0CSNlWmty1XlZ8tTC94S1ZGcABHGieZmz9QZ/P4RIq/9sgOCUP8a/
	 qAHvGvlWdJrjUnqMynott1U800W2DtYE0lilbdLmAetYFGfcSgJ199SElc3zTxugSxp3X
	 x5+s1NUddYtLKcwD5/noe9ZXJGmNHIlF83i+v+711cnhl0bJSfEzEzhWuEg+pWRUWLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iwk1n6vV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844E2606A33A
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iwk1n6vV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373331F000C7;
	Thu, 19 Nov 2026 17:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109201;
	bh=v+DP1SrWvEDdKKAzfZg7hbRHowLTS9DSAs4hS6Lzsgc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=iwk1n6vVQccM4RUwa8cZssS4UJtwMQMnca+l36cEEOHpOasCtDLex9aYuwKu1qhv3
	 ZiY+NDVrh4zkhPWiRL/VC7mjY+8FzOIpK2CFgF9rn0tljYsc9+GTdB4xyOvw7dkakg
	 DX/gsh/HbkuEgvbZiSvodLXplaQAYaafF+OLG3IPjwNTzhPET/PigUfRw6Pb4VD+mx
	 GproMMCuxi/d3Exf9qmqv+TC2k5tA8rkycFg9D4lzjzA0uSxgEbT3UiBLz8AsV1+Ym
	 S2hweYcsVlvgH5NSghiy6uJTfgjEKKw2shrAO4dWgIdA9kdNFNsPm2Qk8mxtMXCOuw
	 0WfOsPkdEAM0A==
Message-ID: <sashiko-outbox-223693@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/18] thunderbolt: Assign domain to the routers in
 KUnit tests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-15-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-15-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:26:40 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: "Mika Westerberg (Intel)" <westeri@kernel.org>
>=20
> The tests allocate routers without a domain (struct tb) but some of the
> tunneling parameters, such as the buffer allocation, need to be read
> from the host router which is reached through the domain. For this
> reason allocate a dummy domain structure, and fill in the host router
> pointer accordingly.
>=20
> Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D14

