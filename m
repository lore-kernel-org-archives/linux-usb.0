Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184704;
	b=K9MyvLzjxlMcbgo5btA4jYU9O5oXnjDdWx040uN5vr2uaNZrlYaHqznN4FDP3lxBiVja
	 Ogt0jbSDAD30ZpB+n0BYWyiMMlwHMf2A1C3Erk+TmAh/tQhjiaOwSldM2dMteCvxZYL05
	 cuT3iGJMW0FEDRka9MPN3lNOs4zqz+XhdesiM3uHAv2sNTAiv/Kmc6v18SDGl/SQ8XTI8
	 WH2b8MKbi/7YmjQrg7vuv3AbcVv5WsaGd/xJr/mbGGhu5BGnoDS/spR+ewG6iox5SwZHF
	 K2cGtpC/55JK6PWaVYkiF6J/k8Sxk4jrErt8mPETrZWIO7cjDQ3Gi5mXdZNbmd7Po2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184704;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hKX4HM430e5m4cg2H98DPzclW9ehk3MKYWoAMy7WsvM=;
	b=d4o3ulVWleYecHc789ChXEJZJcuTMiH2ZWWmFU1SBXht6Z6PFBi5I1H0laJpsL2c+tYF
	 krVOwqVV4PuWj1fBGkqFh1jVhVzXj4Vo35mw1DD6bv6hPqf9dP3OxMGPAiMO5jnw1m2TJ
	 UvOobVWqDCgo9bsj5ucN17NOevy5AWnhKn1JkZXH5hjBvikdEq/emnKJye5fKGqI5xQLL
	 1ITmRmI5voxjEy/B1fFI4rr5yuyO3Ia90Tm7MfoelfdXzbziOQxD20z5wcJuaM4niESgK
	 6Xj/T91BbqMC3cQAn8QzNcBpnFYS9dZVIgvtr5oxWLEI+HKmseeyd142MkNUly1m9Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jUh/fzDy";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF38B606A320;
	Mon,  9 Nov 2026 00:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jUh/fzDy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1657F1F0089F;
	Mon,  9 Nov 2026 00:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794184703;
	bh=hKX4HM430e5m4cg2H98DPzclW9ehk3MKYWoAMy7WsvM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jUh/fzDyUkjrKX8xN/pApHYtCFfGyTzIr0Y9KR5EcU437Z79eZcMQex/VK5Kp9Yw6
	 xqnONwQUApEJxvaSOIQKMLPfXFyJNqiGS+wVAt1HE22yj/FR9piKfpWb+s/vZB8QOP
	 4MCgPCxw1dNRiU3/GtEk70R25uik3+rzFF3QAhZYrLzKml3r92RXqIU5QJKEVCU7IC
	 hpP4sV/+BPf5sHffY7cwg50m7ndGaW2jS1TXW71elvdNGMWoqvzPf6/ZsveFg1Rn7N
	 hZgat1FaxIUiuLYChYVJ3sVb9x0JAlSuvp56ar2up2v7d3v0W4HfMRcFLq3BYcxIWJ
	 kd+tib4Jktm8A==
Message-ID: <sashiko-outbox-204227@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/17] dt-bindings: mfd: qcom,tcsr: Add Halliday TCSR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-halliday-dts-v1-5-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-5-289114ab8197@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:38:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the TCSR block on the Qualcomm Halliday SoC.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-d=
ts-v1-0-289114ab8197@gmail.com?part=3D5

