Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12C41A681C;
	Mon, 12 Oct 2026 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796905; cv=none; b=cun4hmXHEh6mnedl2qKqbiueCeVCyQKyHeq4VYzPjLgyAinOnaD8RaBNcCPf7d1uDIebU5XnH3pK9Js0MrcEJwEtb5GTCoJh8VtRxR+IN5+eLt55H5GD2jLI6L/pkDx6qTj43Th/v3qYM5VVcztbasZihWKhWZMxWlFJbJwCq/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796905; c=relaxed/simple;
	bh=FnEE//MjZOL4dAA/yc+IzlXKi3nwnmhyye1UaexqYmc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=koQgpv4Yf8zGLIdcPjT2Pa+ZnoTRTnfRH6cPou4KVCe4JtgLoXUQnsrOXRfMaGJt7ie5id7SXQdjfOhukWI0LUSSragtsAkqSKIvJHUORKGibsyTlM2rBT/fjij7XQsMopERLzyGMuWeVHRDZ7N4wL4YpaO5TQfVNsJvdNbra+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mu8KsrAB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mu8KsrAB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6ADC1F0089C;
	Mon, 12 Oct 2026 09:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791796904;
	bh=FnEE//MjZOL4dAA/yc+IzlXKi3nwnmhyye1UaexqYmc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mu8KsrABOhyTqVGaGIZEiWgQKUo58s6h/44yfVRqDLe1VxZuBBLbs0UyWikhcpwvh
	 E8NCXr83s9zVCewsCVhL/zphMgyAtN03XyKhMSLMaAyRi7mKK7oBsFNJ+xzZThGQqS
	 Izw17vOgAnVhbvRP25I0YNcRfm+ZyO3caOv69IQLkl5BSRvRglKBEYSEIICKFNaUcU
	 O4NH6x12GSKuBNeXlHCwe3VL93baVK+ffOZJ4t4p7ZKeNJkp6/TswSxhHYmK99Eb0S
	 rLlx0+343Mo8N9aJNj6I9AAN/HQYFlU2IEV66na5rLI6JrVrw6ufACzldatNqigt5i
	 ChjBlOOZ0NA8Q==
Message-ID: <sashiko-outbox-167893@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: cypress,cypd4226: Add
 cypd6129/cypd6229 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261012091658.635441-2-akash.kumar@oss.qualcomm.com>
References: <20261012091658.635441-1-akash.kumar@oss.qualcomm.com>
 <20261012091658.635441-2-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 09:21:43 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Akash Kumar <akakum@qti.qualcomm.com>
>=20
> Extend the binding to cover the Cypress cypd6129 and cypd6229 dual
> Type-C PD controllers, which share the same I2C-controlled interface
> as the cypd4226. Also add pinctrl and wakeup-source properties, and
> relax reg/interrupts constraints that only applied to cypd4226.
>=20
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012091658.6354=
41-1-akash.kumar@oss.qualcomm.com?part=3D1

