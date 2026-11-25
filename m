Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618979;
	b=2XUrBngYu9HKtih9F1RziEDIl2l2ZtYBMFHUzDJn8Ghuu9Ceg5/yYhz4Vs1nn8b/iUQN
	 QEHE/5z4wg/7/GHllCVaNZ5Tmq7P3wdLsfpaW5WtQ+9iAieYvmQSm4XdvoMnwy1ck/xTi
	 /f/xj6DhPmbrDCRKhz5cuUb4mASceGa2h9PrQvY83Hh2LO6i707/fUnqUmg3CQYCvPQ3N
	 IJo2b2JbaDCPuU0rxzGBTJtyuk1Mc5OZ/rh5iswKsrEBkHx2MmAIj/N4TcNsc0k3zNyPi
	 oSxoIdPkggZ6cE4zWf6Qn6Qpf4nM73ssUCQPLpH/1jKO+N4J0ETte2USfYbGF343gHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618979;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GHhvq/QfU6J/NG0jw4dOdjdJz+gTQtD/DW5XRnrkluw=;
	b=Ogte5C1iEsaXW4DG3wsF0v/fG/IXaYGxylwS5aS5UxF4/y6UgHn8bhvP+eKlfET3N1h/
	 g3FQk+UgFtMCNvb2MzvSDslg0KDUeBGHYYuM9vXKzCyZneHXN9XOnJ25hjBrYyV0pQMny
	 WDQ1RDQXGz1KNJnCllfz0OtavXqtjQE5lHySM/2nLENqBklo+43FYxcA3qVhDIJN3pj6x
	 e6VFYJ/k/faOTEi3YwhP7jmRNm7XiY+2Bi29JNmPIFq5iRYGmiiE4QithrPcx6a9gmlXs
	 aYtAf1tZP8cCDGWPopHkdBUa6XqSLylWJ3vhgleP06mCn7IVeOAmXNwUCCJ9Lh/YS6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHwLi66d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B18D606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 15:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHwLi66d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1DA1F000CA;
	Wed, 25 Nov 2026 15:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795618978;
	bh=GHhvq/QfU6J/NG0jw4dOdjdJz+gTQtD/DW5XRnrkluw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mHwLi66dRIo24l2QTMUdpvXazAw9+HNWUpwovwgSOpi8hAlMJ+BRK955HFCnjGqn2
	 E/us4GeOG4bqjDIwmql6YPh5+Xr7Cu4HclVxOH9FmPCln2MZ45AvkkfxE4S0Ntxdqj
	 jWMLdEXBKM3oJ2/6dPISAA48v6+eRug+5h60SIATtmokEmbKVF2Ut/laabjRYLlu/r
	 2JOCp+B6n5pRCpQaqh4gNbhWBta33W0T9PjQzvUH0svw+rM1Rx+vZx4Ilqa+0x5HrO
	 kCwloPqiqySWH9hcK8hInirzqXuJQpsuIHPybn139HlV1MLhl9RJ9hZFEeo0UEWu7x
	 kDOuCXk3mutWA==
Message-ID: <sashiko-outbox-233619@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 0/5] Add USB support to Exynos7885
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Virag" <virag.david003@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 15:02:58 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 5-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125145458.2594=
179-1-virag.david003@gmail.com
