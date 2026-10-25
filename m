Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792965779;
	b=Sf8mlILws939GlYxjmKg63oGhic2KZjtPD+NIE/YfzKgKjUZni6It0RAAPoWyOZlGrOY
	 KjD3KKOIzTNnDYRcRZBz4WRCEvSAxRHq+w5BfbGxf7j+KpjEm+bbJMq/GIc6pju7GMf3C
	 q16jtCrD6u7dE8PhjAPFpBeLLF/lF/HHJHnD/8TLKssg/55YahjxTeCsssnsk3VGl3bSB
	 Em4A8QuN8rAKu//LIcfuS5MvTpR0GSROFEf3rKWNeot94asVsqab9xwg91eb/+hig5nNL
	 KldfBOcA4AENEdyXYX6FxN2UX3x/48uv537r1B0cxwE7zq9KEBkkgmcci8mwzEHogLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792965779;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1F+eJz5i/6k8qK8u7oWIjH2IuK/K03PitRPDaIEqU58=;
	b=n5CZrBizKKEH3PoY7mvlm0yjNzCrdj0Ls9rIEzrArhC9wIgG4gtxUI+P9EVDvkT7qCB7
	 T8bgkgFS9yLw2kX2OrBNWaYR58vZMEFoskUdYh03KGnPR9fQlPVe96B3JGWleNpLGAia0
	 c9AC9MDeIYZH/k7z5snS69pMHWuB/RmjeWlhifKw3uaF0PB3HQnxqkkD7QidRqHWIvNwV
	 nixwHsTj7Tx/AzOae+RdX8grRJrAdr2t4b0l6yFn9B+IIAbmHMGosPsLZPlttjuyPWkru
	 9gMKVs89sTvytFFgZg5RqOYsnLYvle8VVU2eUUlunekkUeNjdPEm4FbQ40xAmWOhIHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LUvNdq/s";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0280B606A31A
	for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 22:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LUvNdq/s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691CD1F01825;
	Sun, 25 Oct 2026 22:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792965778;
	bh=1F+eJz5i/6k8qK8u7oWIjH2IuK/K03PitRPDaIEqU58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LUvNdq/sydIzPMhA+n686XpCxDSZNjV4zD9cykeqILbiuLq5Y6bhBZzBc5FEPqHKN
	 nAgsGDuUE8Umn8mMLOMrfAb3iAILNMCop1Ef6dEx5gckqF2Yax7SQSj4ndSCdDSTSO
	 Rf4TwNbzS8Gz9TKvrwZx03TrywT0JxuGqUgYrDNEDu6DEJyIQpwyaXyABdTpgZ+bS/
	 E201S/n08QXz3+sC4wBsniF8o5zB3urgEmrNCvJzuC2xK1+sL2Hm7Q/GM3xt5FlTNp
	 Du3c5UoELk/GF48geeusV6DF1pHrfu9h4e/DgZwCHoSySqN6DCHOC/RxlseBhCwcaE
	 Ind4zfpNe3FtQ==
Message-ID: <sashiko-outbox-184459@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: qcom: Release the connector fwnode
 reference
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261025-typec-of-fix-v1-1-06bfc16a7846@ixit.cz>
References: <20261025-typec-of-fix-v1-1-06bfc16a7846@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 22:02:57 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: David Heidelberg <david@ixit.cz>
>=20
> device_get_named_child_node() returns the connector node with its
> reference count incremented, but the port probe never drops it. The node
> is only needed for the VBUS regulator lookup, so release it right after.
>=20
> Fixes: 506927b6bf29 ("usb: typec: tcpm: qcom: prefer VBUS supply from the=
 connector node")
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025-typec-of-f=
ix-v1-1-06bfc16a7846@ixit.cz?part=3D1

