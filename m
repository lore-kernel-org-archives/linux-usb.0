Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460198;
	b=vvlTbyaUhvAUR86s1GnN94v/nZbRpvLighpnYtCEpDieFW1MJ/p0U19DY99s5P9KN/Hb
	 imSMe09lFElf06eE3fAzmkC/Bzd8RAFAjvjhrX5k6RlAuX8OkSwp9RtM/facKHnitBZ6I
	 lUt/4vBQESMMrc8naaIaEHSgu5bwXIxBZzQcbYzKu18mEg1BibhjLZJq5z3xpTGef07y2
	 jgHxETZlHfBsm9VEYMCJwRR1At0KqksFQMLY650LOE1y/0pA+vV0IUEnpQv/cWxrGNkB6
	 lQfpmPT8daS7fOGGCXQvkATNyxOqobNJYAj6abnyuz5C6KG9LKEikuPhSOzw4E9mYOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460198;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SU0vemQ68daa4d5C2gC5k4wf7TBjxIWO8PwHAKvjSiw=;
	b=XgzXmHiOLaBABgvwCmD//H3vMP9bMqPDS/4SngaxwCc4bOHMiPiUrpgAwyu2wU2Ke7V9
	 e2pxjQKqROqEsg4ImYwyaWrGEcU/ECC/YCjb0A8CcyY6QjHUOJOoIBTRiu5Eya9HdXVym
	 k015S0b3WTCiTH+Uc1MzO8DLDfnihYt6BG+QLVTpiFFVj+zaocYw0qwz7SqqOyCztntph
	 9Bat6Zwd4Xu1/ivH3j/BMOr+RMiFgifRIt3WU8p+11NZKBOb3lpWE5eTDhwen2wHjdtRG
	 TSVKHxNEuQnE2H5MTpX+TnbFDlkFIDD5hLkoViaSOQ8ENlakdTk/lE9L0TxtGG88irQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h46SI7hV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686D1606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h46SI7hV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28161F000EC;
	Mon, 23 Nov 2026 18:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795460198;
	bh=SU0vemQ68daa4d5C2gC5k4wf7TBjxIWO8PwHAKvjSiw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h46SI7hVFozXFrMb7N1FVf0/ilTfm3djOP+a35BKoiG9am7ctIoTYkjqF6y0lu41K
	 Edxt/Xwg0cg+9Bx2hv03bkd36F4NBg7WU6CLGKWpwIbXMLzYIgKnpdd5te5Cw4ypXq
	 Mthk50Aovm9u6/nKs2z9h+ghSyBU8FAYW900BlewOWzuHOcut3t/ehBitiqAzp5x3z
	 BSXsP48vKJNk79ArejIjAv1NxjpPOH6K4l42W9JlSn8fSy2rWww8eJZVPhP7huUQTK
	 QKaAs93tyHlNVurhjCzu0JD1gl1FS/2ny6i9c+y9BsTkaSLcVmQoV9qB8rt/FjE3rM
	 QtiQeG2o6qalw==
Message-ID: <sashiko-outbox-229888@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 0/7] Improve Qualcomm EUD driver and platform
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 18:56:37 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 7-patch series:

- Patches 1, 2, and 5-7: no issues found.
- Patch 3 ("usb: misc: qcom_eud: add per-path High-Speed PHY con..."): 1
  potential issue (1 Medium)
- Patch 4 ("usb: misc: qcom_eud: add per-path role switch support"): 1
  potential issue (1 High)

Detailed reviews have been sent as separate replies to patches 3 and 4.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123182847.1438=
92-1-elson.serrao@oss.qualcomm.com
