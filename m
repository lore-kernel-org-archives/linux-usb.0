Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185208;
	b=tIbNqggGhvuctK/uaMCvjq6ey6WfC7En7Ij9vxOldTVBBf9EOYBjAef+BnEzQ0SCSYFA
	 Lp04oFkGJZxq3kZ+ODtmbkY91S+fawUiQOK0RVlxKROGwzNcebjw/jlP5f7k+fQYaYW15
	 g4CE3MQGLUCxpE7P+zxjd9/LlIe2WPPc5DfzIAPEZ8wF54a3wgrVxBsJGF+irz0YMw2Vl
	 GtZC8SYz/Dkc0R7jaoXu0SCzL6Y+c1vmYD8RNeRoefWmODDaTFjAjvyi2x+1m6veUhU4A
	 ulO4GKPiVVRf0yNkEH46GZQHQ3L+ckjkWFIi0VhcmMAT+zX86BaStPKuSOYsu6ckhJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185208;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dQy5zY6ltFrdET3mucnqHIpBpSn1oLptjDTBsDv0pho=;
	b=l9SrcuNl4B60MXSxO155wgmPohIETqdIm2zTzXQeXc56tgwTLdQC5bCSkjiBoR4hGJjM
	 RtTpqcTzNDBXAdY9EsiDwzUqAen6i3PQf2cvdgBA8EHoPnUA2X7U4CfFKMPernDPOoQgH
	 Xlc0vQDOgl43efW5kAGArDkeVLuiEmWiogKeos+xzfWU+rOfDZqp1qYLJhUZPU6C8HkcV
	 Wb9FAktV24rxQlq2Fj5E9FB5sukyfvA6WTARFvrpHx1aUu1QTCQGKle3GgEfdEoHteE/m
	 /EiMKDwMua+uo4G2qThogL/6vtyzfgffY3/0VJXTgVDq9ktNPviz5FD548o23rnnV/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XuaIsYZs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0577606A31C;
	Mon,  9 Nov 2026 00:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XuaIsYZs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9273A1F0089F;
	Mon,  9 Nov 2026 00:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794185207;
	bh=dQy5zY6ltFrdET3mucnqHIpBpSn1oLptjDTBsDv0pho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XuaIsYZsk41C+N27+jN5ctDWzzc8ZZCYgVWDHFh3dD0QsQCOY4oW5uc6+0O592Cha
	 E/sDvr7a0q3c87/CNY96rWLHi5Qgv9cj3TAe8spRju0Ae3tjz+cFSnlwwaOuKNag+I
	 l5n7eOzWTIOfYwj8MNrzoiQzY2Y18UytU+0bawbsKDj7l7Sn36mrLNncBHDmYTkxQv
	 yAfYFoC6z7zCrNu4EK7nXZpoyuRtvQAp+ktHr4RIamyxAv5esbOYZRGqdbXH/omMEB
	 y0G+iqoe87DeYLNEFqf+eQrKaxXN5cLM31PuRkY0151ESNBr9Jvn+wf23RSge8pnrD
	 EcNQwrttI8uAg==
Message-ID: <sashiko-outbox-204256@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/17] dt-bindings: ufs: qcom,sc7180-ufshc: Add Halliday
 UFS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-halliday-dts-v1-9-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-9-289114ab8197@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:46:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the UFS host controller on the Qualcomm Halliday SoC.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-d=
ts-v1-0-289114ab8197@gmail.com?part=3D9

