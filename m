Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538612;
	b=LDzLGi8gkqwS51jgBdH0j6ygKM66SZsebQu/NvwkTzGBW/IHIMlL0a2/QStwkoTb82+4
	 tCHSYu3Gzjr8LFRyfpqcSybASVNq3R5RkdAHABlIqsMol2xsKcDUktki3/u1zi5EYNY+r
	 9rhROsdBmXHwRxjUPWfpqXhJ8VuGNQ7nqZyipCpW7CvxStzW5wLnHAypReoheyBgpbJmX
	 gkZGE8NGcwQI2VaoYVE2yF1vJxu2rXO+iPFqVj+YTpCTXs2tigyUWTZmGj87MVjerXlFH
	 YHcDKEH+bEa+jDCL3sR3Ml33Kb7LoB8S4EGy927K3oE2zrvkjg0PXw/Sgh4pR5VSdlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538612;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NYFPhIu23LWmuQ2CRY+qddP0bCMiLG0gWILIOID1Ehk=;
	b=x+BG9s2l7Ysn/iBnxohScOdCyr4gFqn+QodW8fzTZttRwtfGWiFFynZU5JeJRSiXytcR
	 UwnNCi8CwXjNB13OltjGDEUTjIrrTOWp807afHw5K5p4vPsYcQsqk2x6EI+cgxfm7nSmK
	 rAD5MSMFs5yLtoDlKHHJGgIUhDPXMbciuIn9Ouz0KJ7BRnXmZERga1kLHltofX/qYUZFr
	 IxarLQPsesih0eXmGPlT3VG61Qfsi2aBXyXUDPuSMgTIh7tuBkpi8LaK6Bs6H0pkej2Lw
	 sYNqXE5VOp/3mbZhjoXcQTQwH60wXlPGAY2oowOKpSpuFTt4cxjBEfETEXwojslnw+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nGXjV9pT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40951606A321
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nGXjV9pT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A619B1F000C4;
	Fri, 13 Nov 2026 02:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794538611;
	bh=NYFPhIu23LWmuQ2CRY+qddP0bCMiLG0gWILIOID1Ehk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nGXjV9pTweMj3KjA8M5ka1cuarFTL8S2GSgM8EJdwz/tujevVIevGUOpqAUQEOEhe
	 bUA5X+iXdgZJ/MUgNHKtW1LmX+ZvijcJ0LwgovBJRcrKbMLw9kB4GL/vZrvfUIRfcL
	 aDBsXOLyCWX5XOdy0v0+9Y6zGkrLBmpDFuMteFc7igfnYZucAoDf2XV6NOUa42Kqxk
	 GbTo47cUj385rkDnc8zIgFd+42CN+Rfpptt0iHJ6W1PAm73wuiaGtR23/sVrFcQoNY
	 pYD/9sxlCqqnaz2DbgNwB3/PWlQT3YIAadnEVKN4LHnU1TKUJJnxYG9FmlBk4A5/6q
	 o4SiACbc5tOLg==
Message-ID: <sashiko-outbox-212107@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] scsi: core: do not retry passthrough requests on
 disconnected targets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sarthak Kukreti" <sarthakkukreti@google.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113024922.27977-4-sarthakkukreti@google.com>
References: <20261113024922.27977-1-sarthakkukreti@google.com>
 <20261113024922.27977-4-sarthakkukreti@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 02:56:51 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Unlike scsi_decide_disposition(), scsi_check_passthrough() matches
> SCMD_FAILURE_RESULT_ANY before checking the host byte and returns
> -EAGAIN on DID_NO_CONNECT, DID_BAD_TARGET, and DID_TRANSPORT_FAILFAST.
> Callers using SCMD_FAILURE_RESULT_ANY (such as sd_sync_cache())
> therefore retry passthrough commands against disconnected targets.
>=20
> Return 0 from scsi_check_passthrough() when the host byte is
> DID_NO_CONNECT, DID_BAD_TARGET, or DID_TRANSPORT_FAILFAST, and update
> scsi_lib_test_any_failure().
>=20
> Fixes: 994724e6b3f0 ("scsi: core: Allow passthrough to request midlayer r=
etries")
> Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113024922.2797=
7-1-sarthakkukreti@google.com?part=3D3

