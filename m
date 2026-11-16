Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864664;
	b=NBnTylg+QuATqSM8LUflDm3pW/nfqgOPzxkMg300v5W1NalAHs5B42r4PMBvenD3l7qj
	 9GPugHcquY4So4QIKAQ8slqi84Zsx9eKRDPOHC/v/aj/izDopYZYD3a82YBPCsGqh4VI1
	 Y9Y7GfbZ0R3rersXJJD0WuCZDI6zFWwKOFp9cUSXTQCcF3LbVGX8pdiZrq7hatu0KFCEI
	 7U1gTuO2uD0YtkAE0fi75Nu03pBmChx6KwIt9ei6I5buuJVw7xJxc/bNIxFv7PJ44/rYA
	 YrJJKlZZ2cGshm+S48h2v0GTS0S8//4uJyYasr6T9rYfHAzRVop86k91mwzvtCO0iPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864664;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rLO+0qbGhkaf3lDqC2po7UNQ5a3XqbR47HWLAvfAmPk=;
	b=NbSSHPFSQPNv1zk1cVub5MM03HUdN9eshStclMSi9HYMWyK6bMzm2P9Gc3RFOOyJ2nDY
	 VzthIydL/hyWnM333azFEmDyRxDKUbJD61VtqF2Zl72Qjrf0SaMgn4yJ2vEj+mJz7F+KE
	 w5zlPei4p1YAjMYEzpgErYMd2DeVwRpGv2bBcJQaP0HZwRBKash1N0qNgsjf1iNpSGI9w
	 JseOnB8yw4oVrQbi7qjTpMTMyk8hlqVg67j7Fcd25LGgdE/ERGiXPrEV9vxZtmK2YQ1eo
	 GgD4NOG4s1hKKDEOfixFvQ/5xhePrW0pSR8XZHK9tVp2ofkUfGBSE1/CjZUpaQgJ/wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QP/yApfn";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50E2606A329;
	Mon, 16 Nov 2026 21:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QP/yApfn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9601F000C4;
	Mon, 16 Nov 2026 21:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864663;
	bh=rLO+0qbGhkaf3lDqC2po7UNQ5a3XqbR47HWLAvfAmPk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QP/yApfnzGUuWn5fUAwjr3zYvexZ1piXytwSTLbs+PszhX76Zek8U67SoXDwi6U0/
	 OOnDA3u6jYbrDbwXqX3Bvt3kej8Zse/hjuw6Ixr1ikL6/cOKAOvl8/6gp4AZ2l1JNR
	 HbI+Z1qWKl7priZEPE351CuzFbVKD5yYktoy5D6YBeFYentKgQgiX+4AlBeKNPtUSD
	 ditnVp0+9rbtj0C7wUrE2+guCG5W5IlzhbDgh2DgpTNuO8yXLen8rFUOeGvruS8N2h
	 XOTZsBP9WFoX+JSaUpxsmwxeTlNiImryi2NYAS9NOHTaIuIZy7uLoa2sIOJm8aSP2r
	 m1GC2SrhgWqUg==
Message-ID: <sashiko-outbox-217724@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/16] dt-bindings: crypto:
 qcom,inline-crypto-engine: Add Halliday
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261116-halliday-dts-v2-9-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
 <20261116-halliday-dts-v2-9-2c92438c6c46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:31:02 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the Inline Crypto Engine on the Qualcomm Halliday SoC.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-halliday-d=
ts-v2-0-2c92438c6c46@gmail.com?part=3D9

