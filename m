Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293034;
	b=EemhyJ0UrHEKz9TtL4pDiXVtMjml8J1GTMpO025pRJvRZc1eRejeUdOq1rpd+KJoPoIc
	 zMt5mqGPxBHHRAPh6ko9e1dN81PzK+9xut9by1kRmn49HxpdVzlzbqLsp7+zR+ZKyr/3H
	 2no/Tj9/NkrFCvgHBuhaXxDBV4MEsyZnEgSoQLu7Blvf8wRrG93YOXN2RgLgMbW2dPFJG
	 LLcedNuiFiLH1Jpp4EUu1JoZxy12HU4Lgck95/uOVSIPZvS/LJN2dMULEcHmENS1lW5eU
	 hoO/on0CzzofwkDkCjOl5pDvPqHuGskp5MOFJZY3RSO16s7Y2APZ9MVUzeFcK+P9uNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293034;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+ySLQbjTet97dmW4E8hWlAPMC5fVbgbUXNgnFHHrWyU=;
	b=VHX/NQO1O1SwhKUZEBo/2V4A02LT4M4oungvlqp9Nq6psJ4UcZp1hXBjnUx3TUunHgeS
	 53n1bSYjQuba8134BMDdsOVMsHXVhT8IP0x70o7YPWoSAvLhJmlKWLKkE8abPRlY7D2vq
	 GJdyIY0IvUCkvm1YFFCn6SdDzXxvN+aaQpdgw4z52HUhZx/4P05nM6dkPjJBdTeZlRd+G
	 J30eqtL4BiK0dgAYZgK3ZBSaC1TwWdjZPpCPEAB9pvm9A2AAYOU1zg4PjhB7UXFaq8Dmc
	 ZbUvRZ2D6LwXhCY/vIMz3pyamcjIlsHEBVgZC0MFOcvXAW56U4lzIJQ5jS4vXSLD8gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=limJ5i2G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7CB606A667
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=limJ5i2G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7A31F008A1;
	Tue, 10 Nov 2026 06:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293034;
	bh=+ySLQbjTet97dmW4E8hWlAPMC5fVbgbUXNgnFHHrWyU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=limJ5i2Gt/8uzqMje/G1uh2leve6VWP7IX3v5pJaAhy1eBg1GF0YwORDFQo92FKY1
	 Vo8zYYu8Yjs4GkG/MyvPWRR22DVUjhGd2oeiNxeMdkBYpov4h11sV4tkszU53C0JgL
	 3hWJ1FZmtcLh69MJJmvdNsdgIUjDYtVUElSmhMgB3jBZp4wVOsUYw/VOaaM8V26nOQ
	 L0U0DqyyuN1RR6W5SVPuYB4XzOW57W1dNwhmO5I6IDbaURNwxjl3yqooakpUOUoVh8
	 fvKpHI1+cWnyAl269yF/+4OiNoGcvAusjtCd6VkuNNAE4iz9/rZ4SnCNxbveatOxoq
	 ky7EEbPNAf9dQ==
Message-ID: <sashiko-outbox-206430@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/22] usb: chipidea: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-4-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-4-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:43:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110064105.2033=
5-1-shishunbo@cmss.chinamobile.com?part=3D3

