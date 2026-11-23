Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444697;
	b=jQFFAnVoh3vbjPWgj/WshRd+GqnlincuC83X9+X9tOOIZy/JxaCWA8iyHR/8lPGp9BJJ
	 +5Zc/5Hj9ohxKvdwzHqacLK+rj5Xp6hP3F9PmI1RHavuspqv97R6k++q3ns2lislqrBMN
	 RS34yAb/fokWKnxGTru9wZZVrmAsdBErmwt/bTp2fwYdKABnDMK6jEcbFLtflD3xYjdT0
	 Vfj93J5xLul4sB+MU4x/IpWzdcAB0XcGQRradfYBDiRkgffVFnLs8y0Bj3RWNFFia+e3n
	 SC5XBj7gO2YVAFiTRLQrF7oLWEvf409wkBobame2gVuxMOC32aTJxdm1/tx9zJXulKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444697;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=w5DI7+DUmmgaCXoci2vBSHqgkklhGhYDcoo7OiDDiAM=;
	b=xZqktr0NDq2dnj6nI0O1YU4JK1RkCz/nOOzQC3opyO0pvGi+9zMopbEJxNZlzAjSKemq
	 wGMLDjDj5oD82UQbkhRXag7j9x67n6LQ/9i9owv5lrtsPb+L0c20wq0XuLmJGgM6GL6ag
	 f7lc5joo+2qzoODyxsWlkd5BNQUVixm89w6afCnlwWAl1BJ4eUGEPJVgPYPukt93Gp59z
	 +OkIVTahB3KuWB4lrue7xYXN6mTuwSBYaU2z9geowORTo+5TfFpmllWlIkSMISMpMGrjC
	 c8+jYanDr4pv0RsJDuzCStse2UAtNW2iNo2s8trcbCZp3bmj7SbqFt6ojKgR9MYQMUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcsSJUaJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5AC606A31E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 14:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TcsSJUaJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5731F000CA;
	Mon, 23 Nov 2026 14:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444697;
	bh=w5DI7+DUmmgaCXoci2vBSHqgkklhGhYDcoo7OiDDiAM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TcsSJUaJxgcHBLSfLFQmOn5Uv+gC6e9diJKxyGVH0jrcwBvqNzpidKGinyE1IZuVg
	 KjdmDsqREpEm49wncWASgdOZRm32np1To0d0av+KMnJY+bcCGJAJndYd4zj1KIMxQI
	 mDtMKwDJscloSamIlS52vG79f9AycKYAS63rZv5xYrgR4nxb0dE84MEv/cA9wQrtaB
	 vplH/ZKd9KTJjgbszO419an5NLrz7CC94+Gvv8iYuizlY9/1z1wWoXHXl00znsuu5W
	 FdqqIZAI2U39ldLSECSKJ3dcm4+F6SMX5MRjVQCYpZvNujQ1J/M+ogL01M/PULG9GL
	 3wtEzumzXcJ2A==
Message-ID: <sashiko-outbox-229430@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/3] usb: gadget: f_tcm: fix TPG lifetime and lock
 ordering
Reply-To: sashiko-reviews@lists.linux.dev
To: "Slawomir Stepien" <sst@poczta.fm>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123142513.204652-1-sst@poczta.fm>
References: <20261123142513.204652-1-sst@poczta.fm>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 14:38:16 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123142513.2046=
52-1-sst@poczta.fm
