Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353468;
	b=UsVZTD3CXnn/Hwf0npitMYnChWSuDmTUmTj+33zQg1j8wdOmCmGHoX/MPuyjBNnYrm1C
	 oa5nXxP6Q+qtQyhEt1fq2HSla4hOxtu1Rq/3gx6t/sFEwf91DGvdEC3Q7EtoYUEFCZ6hr
	 Q/9LhUylcLs1r1oxdNfANSzrJ7dsfqM0+o0E0mhwzO0lGRJiWwX15JDSW2f+Vmc5TTQEJ
	 ko1Qf6nNoM6JjNsATB083+mMOLW3UwkA5JSXo91Akz7KvuF3pzOC2n/dTGNtUL+YGqDMs
	 xdZutY0wyk0+jUe/26hht8VEgWmSdKgl/l5A2VRTxvPJl+kVE4MNHUp3m/CkzW1soqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353468;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wnz0tWAiSqngU1zLmJYUNXk2grsPCl8P/mcMM/8iSPc=;
	b=a6vVQaGpEu25KeO5OJ9ITSJRu8/UB84sYqS03r6VQ5ZGZwEGzFhVgW4qGHeeQjrmkr1B
	 mRLFaXLdFZGwfYhOEBTkUDF0XLMzpPrvpvH/5vDSLDha57OaWiJXYAb7bUpwzbnl5mncp
	 mNeeBpae3xuk/EwM6Fkxxvsnq7WfsdBMppJMYdL7cmepwSjzz+cxqnlZ2zR7Y+3bIIpQ4
	 /KshkWfqwHnMPDxatDKBBNvuSKQSNB5uvuv+DYaDS6290/KlXRovUhqbKIpc1kPR6gC11
	 eVwamiiV2FG0rhg6QiHpGmBXc7GHQW1pG6qW9J0/ZS6va47Csd6lmgGNtiFUX0l6qpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EkWz0cBZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32685606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EkWz0cBZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FC51F0093C;
	Tue, 10 Nov 2026 23:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353468;
	bh=wnz0tWAiSqngU1zLmJYUNXk2grsPCl8P/mcMM/8iSPc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EkWz0cBZq6mQCideLBkcg6VlhAhsqY7dLOyKeHM115QGeVTdfNeu9gpoowZLLeCXO
	 exW8E/1SjdDIcXi3/qRBP3rksW9JfJf8hHS4zibLJDlMIUpCLYQRL+LFAn4e5+sWWc
	 IQBvhR7UdwSixC+sEz9+Qd6m16BwITJmZ46XUFgp4MTIMzuYtFXhUmdFRZ5OM5fJZ2
	 l25l+TnfFwNzdYwdRv6A8P5gMxVZco+6hUoQShfSlBkdl5WJZr2dvYSmXr0WJ/qBG8
	 qQ0aP4mrGxZoSX84I5Im306LMKCJRYX/BpuIS616yAkCa+yP4W88eQiCPyD/u87uMS
	 tfyl1tmcvG/rA==
Message-ID: <sashiko-outbox-207919@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: add Realtek RTS5453H Type-C
 port controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110051723.434009-2-gary.yang@cixtech.com>
References: <20261110051723.434009-1-gary.yang@cixtech.com>
 <20261110051723.434009-2-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:31:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the Realtek RTS5453H stand-alone USB Type-C port controller.
> The controller is connected over I2C and manages a single USB Type-C
> connector, described with the generic USB connector binding.
>=20
> The connector's OF graph links to the Type-C orientation switch and
> mode mux provided by the platform PHY.
>=20
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110051723.4340=
09-1-gary.yang@cixtech.com?part=3D1

