Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750405;
	b=bX6v2sz1kY3Xx2xKbZS5taFA9FCa7RRivyKeIr1I8HuTST6pPdywKfBmxHOZF2T1fypB
	 ekLTM3nhCjoONnp/00EuND+iivGrDwHQUfHhAOkMyj2ilrrMwwXTH6iRf1Xv33PhBm5C+
	 2nMKRrwQQTzSLzw9IGXWa50LfCjf8328xV0D7tqWjPVGhGiNcka0upBUeWRvLXBKggNPp
	 ZVwtDFo80FQun6O6Ihuw93RQKrPuB521Hl/Q6/jbgo5RXDDncKvLjXIpc/ERYA5XQWryi
	 jWsiC/zFWBZso4m9VQZuZfjAyKswzfADQVM5auO4LSuVW6ZQaLtle08pwmbnP76anNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750405;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LQePyYCYlCSpgF1I42MCcBIqpnLxlA2iAr9BlUUP9aw=;
	b=pzY0RhIHa5icdZXhOPigkaGMIQhhN5hbn7syGK3Irkenx02Mvr9yN6208YIKZVtXlVC5
	 zeYTTJ24rQI0mhoiljM7FiXPkK2N+ypnCPxevPltJx/ONCXQsSoweC7CNrcI/RQ4bIGnu
	 OkfXARysuc41Sx6A05IL+LcRPV3pc2eXi0/GNdVB4NhodVAGusTkr8vpB6YHqCTrsyoGZ
	 G4RH8dX47PqFbMFKBZPsXgDXfc3XKG37AG9dlDz+GBvyZkpvP3PJ6TxoHiOvVRdvdQyq6
	 5dYVOFc3dihdZ75Y8aONgVUd8KdCG1oCS1yYUzLoSOxbBokrFSClBG+ROnTo4JiDN/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lyy4nMM3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375E9606A337
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 03:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lyy4nMM3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4041F00897;
	Fri, 27 Nov 2026 03:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795750404;
	bh=LQePyYCYlCSpgF1I42MCcBIqpnLxlA2iAr9BlUUP9aw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lyy4nMM3hIpwkZYFHJv00EeudR6a160KXqXBSBpi1EeWr8maAnfp/5UpxHRKnEw5a
	 M3HqJPJDabYdYI4dvTvhYV6KwYsaPPhYiwAzlIVXBpZXFE53A+J4xKVo6+By1mW/Pt
	 RpSt5umBUwzAPmlcyV3witOM+O14k30Jh4mBH4IXBi+ir3XdMHQK7aqS14xd7sOn3E
	 51HzmMf0NhCpTHtUJ96mjI5VyPdmq+LqYx4BYQbfdDPj8ippVuBrabYNmqlhcy5tWJ
	 CnOc9LrIotL5UiAzF4u12s4XRfv1jiNdybRML1nccpUA79i2054JjFzFRzZ8S2le+0
	 ESN13L2qfPCvQ==
Message-ID: <sashiko-outbox-236551@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 00/12] r8152: refactor and extend
 RTL8157/8159 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126033211.51850-1-nic_swsd@realtek.com>
References: <20261126033211.51850-1-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 03:33:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 12-patch series:

- Patches 1-4 and 6-11: no issues found.
- Patch 5 ("r8152: split r8156_init by generation and factor out..."): 1
  potential issue (1 Medium)
- Patch 12 ("r8152: enable UPS for RTL8157 and RTL8159 QFN68"): 2
  potential issues (2 Medium)

Detailed reviews have been sent as separate replies to patches 5 and 12.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126033211.5185=
0-1-nic_swsd@realtek.com
