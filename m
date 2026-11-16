Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864686;
	b=ultTiWjWRl4IThHjbM7wXmdnIXVSzH6hB7ZGs/Dqd5vHxH8aXM7JGkCIoNY0Uu2u7FI+
	 Waig2oP2hWmnXBHlChDmNYgVN/DnqMHFR0bG/ZgYFE+FmkEjQX2ysZj7bqR+jRiZZG8km
	 v5KU4zNQaGdg2QMRbjLM9aoOK5qnOrG+60t6RoKs2goXXcZdfMEy6tL6mDqdVuZK00JCW
	 MWHL6T/paNVh4TxpdXwUCzBQiUaKhKJp4dOOHa/Lz3BELr/gzq+j0jIKUSYkhCBUSf5h8
	 nes/bbwcTLDOq7dT6k3mWVJt923I5fdML9a6BhqhDLGUyKs9i0XqIjJB3tcQ9QZGMqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864686;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YS+zels3FjYVvoTGFjXMHZEz1Usz5TSiF0KPzWpXyBY=;
	b=eblS1F0WuZ4bm860g6DJXLd/HBRSKBVL0EKHPFnIDXvQz/reEvzcPYpwiEo+G7jMe+pV
	 lkH5JjJCVGgikyybPkf4bNPbF/8fC0ryDaLhzRFR0icxzfqJ5BgeT7WOqHO/nH5G+Nfqk
	 nOw2q2fcyJ5+qecfKfLD/aLNBGgZrWh7wNdup3l1nB/LJMRmsIv+SByO7o/myUzs4HkUq
	 qTlpCLoJnDl17GWvD8SqKSdmKNBepwdlCOS/RKhqiKeFl66dj4KvGVg322jv3RYNjHNz5
	 +4qfhPiDYGNysWW6V8akN88lq8gEWq4cZITFbl7dHzYi0bnXFwU2Q1FSIKvRra54d4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ScgcCcWi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F263C606A31C;
	Mon, 16 Nov 2026 21:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ScgcCcWi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912851F000C4;
	Mon, 16 Nov 2026 21:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864685;
	bh=YS+zels3FjYVvoTGFjXMHZEz1Usz5TSiF0KPzWpXyBY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ScgcCcWiDEnrpu+gGOR7hLR/SUXdrdGixCyl/+3YxkPKB/llAb4pTOVwIQ/6hLd4S
	 qMWahwmPaw+kAkaf84RjHZz5+jYcpExsVBcwRpd9vFfGHktncOKXmtCvdQ86p255lO
	 eN61a6KbmeOdWFRaq/JPNrGRRUPmHzgEIOLY5NH3BKvs2cNBRLXC3Pck8BZxIslH/d
	 C6UBPwJh5K9ZYtaP9o4KQmzWCjcHKEAFAXbxJH2SEt/cRvEUqB9UEI4D6L77XQs1Xx
	 KrtIn8ilRIYD8avnsBayzjSuG1QoApjTOr/XB/7Ogwuk8Q7aGVucLguOs3wfGduVsj
	 yslZp7Zz04Nmw==
Message-ID: <sashiko-outbox-217727@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/16] dt-bindings: arm: qcom,ids: Add SoC ID for
 SXR2250P
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261116-halliday-dts-v2-13-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
 <20261116-halliday-dts-v2-13-2c92438c6c46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:31:25 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add the ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2) SoC.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-halliday-d=
ts-v2-0-2c92438c6c46@gmail.com?part=3D13

