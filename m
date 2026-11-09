Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185083;
	b=corY2CTkFJ1gnvepMt83R1uPqpPYC2Pe0yBHitkvG8azuzs7IOICZE3StaO9D/8rn4/9
	 FRenN2UpD+FBuKKoh8ivdelGUQUnSoV1cok8oDlH0MYjbLNq746qtpTt+JYp1VwMKFfkG
	 GDOo33pEkU/YNCkOoThfKO0U/h8RzuKbZugQVe6UgfmpY3m9QJrB0qbAAYOfzAl6IYwdj
	 eUr2rvjQx8uHjUyEoLRlXTCCEFnXPYIk6HJgfBl27b9ZJEqpu3ABsW4ZigBdhz6jnrf2w
	 fxs3rYwYePb3VtYLMATMXxvGSWXhQ5lTrCOpNbMSPxpMBvnciK4Ws+sSHzU+gIig2qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185083;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0uuqIX2Fc71qZxVO+jsDz/MNh70bchNa1zS23gdA8qE=;
	b=oaRZMA7CSpsm7CNWZDVB+MFBbwYlz8gEUkzpgd9hfdzW4Rawa3r6sidPaoOOyH5SWJKE
	 vnE37oT8fuXfTKUeY9uMfX+S+HJzdGdWB/ERlHIh03JZqfowDteP1bFJEwmYsXISMWm+0
	 DZGvwOCKE4K0Z32PIztmhW1Htc3DIzJ33DpuagbRqTdB9sH+DHghJcr90rZ75JVSfhgdd
	 DwfiT2L7w/V7s1c9+0FXtOFFEuR1zBdzAqAIzuY1fRi6toEYWspw3vm/FVbNODtAektv8
	 k2P35VSj1WQ0d6aUd1voutCBeylGU0ZYQ3qzco6hJfqbt26n9n1yhCZe/if0bZ17/VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iRZxDfH9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CF9606A31C;
	Mon,  9 Nov 2026 00:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iRZxDfH9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECDB1F0089F;
	Mon,  9 Nov 2026 00:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794185083;
	bh=0uuqIX2Fc71qZxVO+jsDz/MNh70bchNa1zS23gdA8qE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iRZxDfH939VWDZ426yDwBDez6dLhRAzoU2Fl+IchTK8TQkOai9zpcrQlPCKZX0SUM
	 aSkzuXzYTxfgfr0ZunmDE4uBHk3L6YnrI/uCyoiikLBWkfK83SK34Fj7MvTd/BZrS+
	 9/mwJiHp0aNoC4Cy6HpawWZ1B/mkdEsbbPw+nbMjpWqNdjitglMGVlD2k2mhpYbopU
	 mCAVKYM/zkh/4HW6EQUmO4OcW/QI3Zbcd7x37Ek33EGQ8Ki9dZY6g09b5DZeJe1T1J
	 F0kI4rqRiD8k9z4hiVSjRKx8zMzNFjfjWCJ9+BFW30zzNSiC4GuTQ2o6kt4DhGXDu5
	 YfAEIU9fZLJiQ==
Message-ID: <sashiko-outbox-204250@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/17] dt-bindings: thermal: qcom-tsens: Document the
 Halliday Temperature Sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-halliday-dts-v1-13-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-13-289114ab8197@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:44:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the Temperature Sensor (TSENS) on the Qualcomm Halliday SoC.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-d=
ts-v1-0-289114ab8197@gmail.com?part=3D13

