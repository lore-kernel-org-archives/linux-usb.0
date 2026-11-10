Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353608;
	b=YIafp7EvT9l2ECcTZvuZHnXXhXou25574bY/efLQc1lJORZXVL7G8gplHVLAwagppkJD
	 7fALzFrE9qq2smyv+YZ2ld8CCYzFhvxfCcYdV+RHz86IePkryyVOjDzBRHy4OKb6dt0Rf
	 mz5xQmGJaA2R7oyGwlJebSMVAwK0kIbKnk1zwOT8kVsVc1WUitF4vzQfqgVOQ7MF8hRAP
	 NE7aRZTXGkf/IWX+uEfcp+IXcHQVVr+hngj5ZxKVnfXljldtY24C6OC8hh5k7uayPsUr7
	 sWBAGog2mviBtvQaS0DtRnKaBeny6I+WrHYuWcIcXTsAWmU+7E7eYMXLL28DcifyHbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353608;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iaNWnQmkB03mgN4heGRC1Y+aCky5/Zwg7l7TWLsCSHQ=;
	b=aAsmxaQECpCI23zawxOzO7RTcX3rVdgrCWxUOFgOoR5zH7rre6pqNEtVt0K/kdbY3r21
	 PpaNMjmrr/sEdEu+3VHHvVVtA/m5PJ9fd59nnODqhtNqbHnh7khRlREh21Ji6BcUdkWju
	 cwvzHIzj9qLQXePq0Lk2ACs6/7/XNYKeoOI9DnFZxHPKzHvGpJilUQ27Hg9jHF3eJfR7N
	 aaKyREAl+Wd4QkoJ4li15jwMiEGj3ZbFhRxSgzclakynRnDdInzViMZ1gAsTiAaYmZEBf
	 7xBz2Uu7ijbgzx1Ce+a1UL+Xf/K1ijrMXsS+FZrSAHPPnaHHIDb5dbqdzq2fgvieDPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2yOifXB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29513606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2yOifXB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27491F0093C;
	Tue, 10 Nov 2026 23:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353608;
	bh=iaNWnQmkB03mgN4heGRC1Y+aCky5/Zwg7l7TWLsCSHQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z2yOifXBIWictRJuU20CozApuCrgW4XLyFyuJ+9EEeArwihABwbWmyBVIiROXQbGd
	 IQj3wBVS6ORiLgOza/DrB2+4XLL63PhYp/+oNUmGV/f3oOgi7GZgLrAUj5ri7owDj1
	 2YBsE6fusf2m75MC5/YoiBCuZafxPjIKZOK8OcOOKl2BQOg5geazubNK8AyGdV5SMb
	 ZceejY5xv7CwWcpIFok/+bey+u2RKv3ggnKoAdkf84UDSLfDdHQiHJ4b8YbKACOAce
	 fJKo4vo1GD9x7n2URTlBn2ndCc1jxZqgJWjGwlzEL52iL8T6BTM073Sn1hLOy2aVYP
	 LZL1iOiLQHZvQ==
Message-ID: <sashiko-outbox-207932@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 17/22] usb: renesas_usbhs: fix a few spelling
 mistakes in comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-18-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-18-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:33:27 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110075825.2494=
6-1-shishunbo@cmss.chinamobile.com?part=3D17

