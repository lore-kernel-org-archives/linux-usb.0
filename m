Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA2635CB81;
	Sat, 10 Oct 2026 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791626076; cv=none; b=e5FKmOGjMZDpBRJTTSrJiMWi9LLJZl0xdUxecnxi607ChUkRbs3PBtf0bJZcmaJIRFgkQ1lTuUfR0/6Z2sM+qdGAblagOnUy0APAFAZDRxnzM1hO/pdl/eKqaq3/Ub1/Cj/RUXZHhC2MZs8TT06LOQ473WiRHWYg7t/aLZUG/OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791626076; c=relaxed/simple;
	bh=Tv0XY/u1K3Ul9MiiOn+jcgK0KqhatHSPWp0Lr8fSqts=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mxAdCnxKfa9t6d7JbYnHY2mBVZQ1SOSVA6a/m6sECJQCcMqDopRTTPKcYhIsteLUX1Xae4OJBuusJUFm5Wvip6bINIQU2hCzeDHoTrwZJT+CiSEOPih9TJvPSK80Y6aMoWhcDW+cUSSIRolTk9U5DTkilaZeh9Oxrofn7Utxt90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6rVzdIm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6rVzdIm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DE21F000FF;
	Sat, 10 Oct 2026 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791626074;
	bh=Tv0XY/u1K3Ul9MiiOn+jcgK0KqhatHSPWp0Lr8fSqts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m6rVzdIm+cKW86oABjqA2liYlh3vWAYgcDo+0AQlML3ClGBflKLTNyW+OC8zw6nol
	 wuYS53Vczu1noLBpNEQwILPR8BZmYU58FGYzHtwOW3GUeTAxfQMenPOu8/FXGQCStP
	 b34ZAYdfZs5o6MAY7ztbswNOnfB3u8J4ypRihv37GOqPlWTIIArMxltObbSESElTh5
	 6BEOn+EANSkfNcsSxQHDWrbVYD5xjyV4VzKh1MfD7+tqQ4uhedp6+wcj8a0ffkG3MV
	 HjH58CRr2Pu2SBeDOWXE6qGMx0roTe3oMfrF1eeedudbkzcrfrHiKLVoZ9YMBXMNxm
	 VVtKYralrAgOw==
Message-ID: <sashiko-outbox-166405@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v7 2/3] usb: typec: tipd: Factor out i2c
 specifics
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261010-tipd-ace3-v7-2-317218a96c01@chaosmail.tech>
References: <20261010-tipd-ace3-v7-0-317218a96c01@chaosmail.tech>
 <20261010-tipd-ace3-v7-2-317218a96c01@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 09:54:33 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Alyssa Milburn <amilburn@zall.org>
>=20
> Make the core driver more bus-agnostic to prepare for SPMI variants of
> the tipd chip
>=20
> Signed-off-by: Alyssa Milburn <amilburn@zall.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-tipd-ace3-=
v7-0-317218a96c01@chaosmail.tech?part=3D2

