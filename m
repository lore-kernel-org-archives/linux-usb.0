Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509288;
	b=Te8knGpuhygpb1qu8MYda10qFm0r9d3ZvW37yUrGrc+9Wskc8gq/t+UsFSfW01TP677G
	 r26KraWimnHM6sf7WYZQHIxccmjjYHwgvPVmrb9HEcO1h2QzMH5FV0rQm7Rtjj7yFUzA0
	 RrQpmxXeSTa0WWwtN6iGObLCL8EahU9Fubt3dKEgqRx2aDPJWNRdEZ9TNiOEqx4c6XFlZ
	 ZwKvJRRFTvAz1fiwY6nCjqCMOIJw4pzm53tGUbeICKYGitM/+u5dOk+sc1n+gqbZWPkdZ
	 A649CiPsX5+1bK20Iv6AreD2Y0U2pMp97Ydyyl2EgMMwSDjOVO0s1eQQds/t2LJxSQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509288;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QyC6LkQapmslJgHurUg3kBCXcEQzD0RjA9nV8FQO+d8=;
	b=w01JoI/ABssY/lv+3QWPZCJ65g8gALqXPyi9ucxqKO6VHi6bMDz6KrDrGeHV1JRykCr+
	 5KNMaoh3oD7dEteEDkFnq+6wDMQoNyUSWq6qsNGWXY8SumvmMi6LLX8ZzuVczvkCWbMIu
	 kMknzoImN4C6lAZO9VccQsaBvaRC63uGhdIQbfncPeIk5j05mjw2Sr0eUzTvwRTkAVowV
	 SCmxPMqeep5MuoT+bqBmtp6HNabXyXyxAkBt1fRy6jFJVxdtK9SnUX5nAD7Ukg+495+kJ
	 cply2gLTxAk896n2zGiqG2v4ruEz3fTUzouBPqvG0PHbKic+OBGA63rbfFFKZMzdG2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lwyi9Yfk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3A3606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 08:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lwyi9Yfk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4F21F000CA;
	Tue, 24 Nov 2026 08:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795509288;
	bh=QyC6LkQapmslJgHurUg3kBCXcEQzD0RjA9nV8FQO+d8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lwyi9Yfk5rFB+jYF3LzHxKYbAOFr7Zu9erFfVSU0Qqg4Sg8cEbq1H+YWMu5CkuRAI
	 FO6r2vUuagY5V+vm6iDe18K2JCobTtzPxFPIYjqzsfSmulnIF7j545xwC/ECfe28KQ
	 e0Cy0GL63rdDikBo7Y6DENCctO5+oR7LcI7ojdU84ABbVpDoFFItKYiRDUAH6GwWIm
	 FQLJOVTend6TnvNIimG/aaxLWHfEu9I71scJCfTsj5IEGlagFKEf+C5iqmYw3zJ+GY
	 2sbShkDsnhGhH47DZ5yJ1TVeZIGkQVOA0RheYQZ3iRrREpANDwDclmk3fk7vm2SX8H
	 L/o/qSF7+/o3Q==
Message-ID: <sashiko-outbox-230728@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/3] dt-bindings: usb: vialab,vl817: reparent to
 usb-hub.yaml
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261124-vl817-uneval-prop-v1-0-137c093fb300@iscas.ac.cn>
References: <20261124-vl817-uneval-prop-v1-0-137c093fb300@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 08:34:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 3-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-vl817-unev=
al-prop-v1-0-137c093fb300@iscas.ac.cn
