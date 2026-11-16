Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864664;
	b=XUlyOeFn5efa3DIslFCrTB4TFE7tflplfarlWGs/Q059BjbARjyZ75IMnJtxSPEtbT0A
	 R1f2UqQu+445RBkRH3/aONjd8uTI/KJYkzdcFb9i29u5rB3LY4f92neuEihHoTHTMNvWp
	 HGC4k+zwDpMjC5qrb+hT/oeUN7YLA3Gm4Zr5MSNc5Z7KBd1qMMhKzQ9/QdZflLHQ/gud9
	 0vviFNozyd3pDz+izE/rMyMVPZEicc3d+LlNCYFwtNC0AQZAQ8kpecl/tcKnt1v4AZzEn
	 EECo70bsNlfy0b2ZKG87ji2veMM0Jwxgzfz7VBRdrdzAmX+t11bELWh0KRgIydU171Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864664;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=I9vk5X1SlBb9rJtinyirNUUuqnDTMMj4FsXZRlN7dV4=;
	b=ZpDZAqv0I9E6WqipaLtwocXTphrDeL4OF0IW818mnHvwtSXge27MiqsIeyl3VKCwMT4L
	 D9Zjir6xQAx067TG/ZI567ec4AHCv0hpUWySVjOqamECKgJG4gldvaadtsa/w08IeOEd6
	 CHD+ZdL1Zty0091EEu5gJMrjCkvI+l3w8oUVNjDF6V5lSL5SXER9zgACTApFNtS/7EypT
	 8o5HjsDE6u3y6aYrljsvCK5Sk6IT/RcWYFL/S/H+30r9xfM8eUBk7B0fPMj2RfADil76e
	 qPkMlo2ux73SPdNHtoIm2pQOduBjSj+o9isTNNlfEXwyMnLMP7oUwic+S0M3OBEV5ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BGJ4og4o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9A8606A322;
	Mon, 16 Nov 2026 21:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BGJ4og4o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D85D1F000C5;
	Mon, 16 Nov 2026 21:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864664;
	bh=I9vk5X1SlBb9rJtinyirNUUuqnDTMMj4FsXZRlN7dV4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BGJ4og4oHrd+Otp+nXbbyJiP6NCWuxEjwCWDn4i9h/61Gf6oN+3Pk2e8ByR3N229V
	 tZk69F9b/eqXe4JSA19LIhJ3qGOt81chKmJ0GDqACJUOUAbzTPcCUHoROgWJqL7j+e
	 nIaC1VHVr5DhYdOiSAOsWq7yVE1pxTICil204tGjyernGLOwd3mAOmKnWR41U5PYjN
	 NgeNdzjQhoUSzBymaNa4SguG7c2y0189rAkOFmcEQvREYgDuEDUf1zSyrxAPMKTfYk
	 IhdVV3AK43+VSa+PaZtcu2Er8BOx4UNMl9pUE5aJlvLZZDtje/q5uUDNBuzky8Zy/J
	 J9K5XkIzdkurA==
Message-ID: <sashiko-outbox-217725@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/16] dt-bindings: arm: qcom: Add Samsung Galaxy XR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261116-halliday-dts-v2-12-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
 <20261116-halliday-dts-v2-12-2c92438c6c46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:31:03 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the Samsung Galaxy XR headset, which is based on the Qualcomm
> Halliday SoC (SXR2250P), and register the "halliday" codename in the
> SoC naming convention schema.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-halliday-d=
ts-v2-0-2c92438c6c46@gmail.com?part=3D12

