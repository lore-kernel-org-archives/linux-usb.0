Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353401;
	b=du4H646mm/P66n3hPyAJwXtk7w1r1/RL4J0a8emuEW7g7fzWBKYI+MDTZKzMPs8YJLzz
	 H/1DgdXZyq6pkwm7eEgTuDwgnbjf+Ig0BGvkMGj+yGoa+SGFf+FRfh50sJucjbC/xTU9k
	 e80eGuayyUVdU2IGCs2e7jkyZ5BHIduucViO08MFJYuHJ0p2MiNZjmzJj4gzWPxpmznuF
	 oJ1on0EyX4Lo5LOXdJTRE1rMiUb7LzWoy5p5KYg/J8jwOm16usUV58Gtj37F8YDca7uaJ
	 u7PFDP5g8MwtPkwo0MOp0e6yXPsDO0FoXna4MEfiots1nCTXcF+00W5kCP2FA+CdZMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353401;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DrUWOsaKIN2xUF566zooCTIPm6pRMfqXE/njMZ60gCg=;
	b=JGAhPEIF7yrbP0ZRi0MRCcJGj7LzaY7gKFBx1ywvvppd08/te3qRiW8i5PQLnP27y1FO
	 fQhbG5kNtKN2QFQt3ZrsVyejA1C9vtAxEKlaovI6PAelkGSk3YTdRDqm0o7nC8ayy43x6
	 L6+rHayYelqLLBOEpM4mkSO+DTLzFv6lKltcJ6uZV9XPcngBthlF7DQp14EBBxSh/m7Ih
	 8iGIfhlSo1ZIqp7KPTx0/qyu/tQyg9YNeqCJOdSC4nOPLYOc8Zt79HbLQ6reRsprdOCjP
	 YeIVO8OzFDD93nf6aL8zuG5pgWS9KvHMDhmG48LzzhyWcwhn1zBskxW+Gr9fvOKOQUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HYOxdgvH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EE9606A320
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HYOxdgvH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883221F0093C;
	Tue, 10 Nov 2026 23:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353400;
	bh=DrUWOsaKIN2xUF566zooCTIPm6pRMfqXE/njMZ60gCg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HYOxdgvHX2nheB9xK3e6weGmw7gj3ibHO6Zb6Sua5QF5YOV4g4P63j0ZZHNKIsStp
	 MsuyJt1zxFqm1F/vhB4twvTaIbWxY/DGms1pTBL0HRU3j48Q8A5/7dTJjpeJDho6V1
	 ZHeqGvGKV84j5pMQjOMX4dWHF3ShvvnBI749Nng4l4iZmIrlEL5c9vG8AgQDsFAPaF
	 iVg3dG8JebhCA9+cgOAiKSpThS+wq6Vp5v5rBQCL51EvEmdTuW9pfgLwQJ4OW9Xrxa
	 uDciyaK/2i4GmwRay0fTB7wQ19Cxj1nuFeOkh5Kw399m2iEGL7rJMgDvWhHIdc2oJt
	 4NaroRr1j6B1g==
Message-ID: <sashiko-outbox-207915@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/22] usb: cdns3: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-3-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-3-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:29:59 +0000
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
6-1-shishunbo@cmss.chinamobile.com?part=3D2

