Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609294;
	b=eJvh2xqMtT2uqoEkqg3gIIJJ9xQY+GnbwbUHf/zDXip68s6IuuvEeTGTjUx2Km4mx9Oi
	 aCRlwWbYZv+Py4uiOiNFwVzkPJDBG/x6XHa/anlU3VBTlUSVeboA9kNkrz6GTZL57LZav
	 enVkBR/j//T8O0PHF8+zgk0BQTPgqls01sbVe5FqxsU5VmYwpuHUBtfAxW/qipS2uqFvQ
	 ZvhoL4YmGlsEd1Y9i5qee7oT15IPYZQiwIHxsu1QFntZc6LH0AR8MDQij6bf0ZvpioZTf
	 BdeKrmFGJmFNwX7yvbVJFTiUHll4vYEP8P3NA0D97ScvF6/AzGc1bg9lc42enhsoxWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609294;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ldnmRKLW1OdvDvef7M9aXAK2l8WQIH/ResIFYPIf/D0=;
	b=r1ORH+io8EPxPZJNH2LVKHmVwp0ec+DtbjlCL0z7LRHdgKVVpZOzr8ZtsdTGDqSWgsMu
	 0Shd4u600ZxzLG79OuWKHbspyNaz09nvg88m7seU2sSr1JquTF+0rWDwLXzTpxOPshG1D
	 N661ICUTk/aec4H2Mw9dZvI0hrd6JL4h/PNsys08bf+kOE04CeFjX11nhRiD+azYMiJx2
	 GFZHP4kvKYaIA9FhLGT+bGCHeIiwscMgax9pGextmW5WPa+azez0iL3A38mAMEy9/PgU8
	 QJLMPpjrFNlP/9kR1x9HVPmPbnjOkiRYlwrCLIZYZ77VbD8b0Yx4YfwEE8HGk7cdGtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="n1RbZ/5E";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F153606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 12:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1RbZ/5E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD3E1F000D0;
	Wed, 25 Nov 2026 12:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795609293;
	bh=ldnmRKLW1OdvDvef7M9aXAK2l8WQIH/ResIFYPIf/D0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n1RbZ/5EZgZVrQijER3jkvsds/ugExW0ybcxW0o0qIiFYZHxfNpM9ib5ntPQhPHAC
	 klv7Pbm6+QXBCQwEcVlpX0jGqXPlM4pMiC9usy4HFLH2o0IH7z1BzhUjcNXNZj7opO
	 ZAHVxFfIi+ZYDsWsqipAcss6VcfcfSe2Ezmq+LSeysoYFw63CdpLN56i+0WuRdd4W/
	 2sk67sWrzqoaA0UnqXpAA0VH8kG25AYALayxO+cBvJe/Eiy4rctp40WfqN6MLwvbzU
	 pznugrMnFg4zjJCCNBKS/1/Ob8B4YeeCd0LOaV71ZPnj1hOaorhV/G+qYbEvY2A/OL
	 MZeEsnxWvXkIQ==
Message-ID: <sashiko-outbox-233358@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/4] usb: typec: tcpm/tcpci_maxim: lockdep, wakeup
 and vbus regulator fixes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125-max77759-wait-v2-0-9914b985c00b@linaro.org>
References: <20261125-max77759-wait-v2-0-9914b985c00b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 12:21:33 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 4-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-max77759-w=
ait-v2-0-9914b985c00b@linaro.org
