Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353521;
	b=WgUrXNJUjQQ/p/2RLvYcnMACM/wei3jjiCpr1o127glEUlquBchnaHeQXg+/bv5I+xgY
	 7YrVRVUNVmao3m1uES0W5I3s7gxsVLIwjF2XnqsOaJehUyUniz1vtUETwERSFYga9DJbl
	 HCZzmrGvLzlkigbiob0v0F1i6aaLBOJR29L4wQd5Ogsb+hOAOHW50HHsrpVr6q3w6V0dv
	 x2tf9D5BLdMx0A4gp7D9KVTbeZcLDbhOW4gbLkJoqUZPfe4QaWqlCLNI0D9byObRoSo8h
	 1gOhQnRyps8MDn6s1Hd1VjWxZRgo9EUxfL91hHqdwGV2qzr1GOZMz/RAPNLhxrwtw7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353521;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=t20asftrfRk7z5XEXGSmpj68oEQ3qjLe+U7bRm32em8=;
	b=NVO9duGppkxXEWZHpuDLaLgLus9mHEK5JpzzUQNnpF9R67vvxtpTwyTOoewpC3O+bNyA
	 Uh41L25LeqledgIP8Z0iuy2T8Ps0UWhKqfcbcNX3dATZztyftvUCIKQC2ckXf5t9uMkaI
	 NGAhc0WCf+JM4/3E1pru7tV1fnjv8t/wW+UrubqhD8QE+H69Aq3xgbjylrQU7A7GzmDNk
	 COinvAKHs0wy7aHsJ5+CmbFPbzpCkUmkGZlZ6M7uZF+ZeqolAwhu4I59k2T7+DBO9mRJX
	 ckn1BGaIN+lewvNKoamkKEx8clreF+cS6S7FX+MQYqXT2WGsz/sJlrC2gp44W7bbPRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I/GR7WYK";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0ED606A320
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I/GR7WYK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F91C1F0093C;
	Tue, 10 Nov 2026 23:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353521;
	bh=t20asftrfRk7z5XEXGSmpj68oEQ3qjLe+U7bRm32em8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I/GR7WYKuE9+GxT0SU118WWD7+1W2UCzW1cd6uSMd1fmscc79B2nVLAwib7xDPhoB
	 s3qV2TVpKc5IwZK4dEVnjFIr9FAIhglrz8MNxLky5NyAr29ThP34WFato6CvbOhrcS
	 bn3sBOmjkZnswChn5GVJ2DPc9O7ZWNQFM4CpV2tnpDCoRMCpO0aW8fs5cRp1p457fp
	 6cNH6171RaYc/SR0/pJjIJemK4JJKlzwsO7hmVn7oTA4+dDS677Aw9qPyT0d3gC4mV
	 ubJODO2QaGFZgayOnTu7T+DJnWyp5AnGVqLAJt3uq9Q+0GAXm8HffZbujdxNXzdGwz
	 02urVXXEhtvIg==
Message-ID: <sashiko-outbox-207923@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/22] usb: image: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-13-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-13-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:32:00 +0000
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
6-1-shishunbo@cmss.chinamobile.com?part=3D12

