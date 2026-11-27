Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795813171;
	b=niJrzVLSMGxTtdOAXxnIBLhc5nA4M8wFEhq9V6ATvCaxx5xeWiDgn6T+Oc+7NHDA65lf
	 LJKLpVIFXUonKiYMaMC/5c6d4uBcf3ar85pYo031XSfpmh9R+ER66wzunWWItW+pcf6zZ
	 23LKQPYBoY1ar5fQctPyC9U2fO4xq5rX2GOqDTcDxauM9t/SRgGgSn3VMJQ7ikFYhEaQR
	 b3s4ywH2qXseZ0J7YiTLQuCxvaBbJciC122DhqFM0G0VjvsDxCFcQjAFuoTKNkcgCf6H9
	 DUOvxxWWiD6xwGHVnrZpeyJv5yxGHQQm++v5/Cps/AssMaoWorA+v3d8doSRYEmbcKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795813171;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6DavqVe0jENz7S76Pl+PhKcjY2zgwsSPeo3PyE/v49E=;
	b=ZLuXPtMYrupkUlZzuOoQ+Z0IFcdSDajuiB6/XCyRo68fKZNmsQgN/P+W1nPLpR/Ek+Pe
	 o60ZF3dgUPX0q4091knTfJT41DKwBoopSKY/YDVHoZnmryFLgMp/sA1LL3JOFBw2i2WfX
	 m+Srh0u08ixW0NWN/7bHQGHRHyQ9tcUCa95EOlS34ZkZayFEXpCLAqwHgXr+PxqVF/omQ
	 IirkWuLVABqcxkebzBd8DTpI8DtTnhDPFACrN1eN8bOK0CKkzU/Mbt6QrAbQcXAB7CB2t
	 TiJXfOKyCmKOhxx6kwSboBuGtAysy+SzhU5pH1fLpXW706VC0s45d8YzKcq+3+47B/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bdk1wuNT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D578F606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 20:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bdk1wuNT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3FA1F0089B;
	Fri, 27 Nov 2026 20:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795813171;
	bh=6DavqVe0jENz7S76Pl+PhKcjY2zgwsSPeo3PyE/v49E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bdk1wuNTqWMiYSomnL0cwPgcC1Dyi+HVVn4s8qPq4rPI1yDADODgiTQp+NiKjXiou
	 836X6FBDPBGnlxiGWOlA5jNyLZ0NFQVQmSaNjZNZsQhjcLcVVZuiPlR7eI+V3ASwOG
	 XO0X82TW4vwiJalrMtIKBcPuqyuV0LT1Ld61mDLfidWbxYfDAIviPvtwU/Hglcplj0
	 7A6mQfLlcU7G9ybeCrFcB3sGwm3RBxywOIM8EWYU1CpPJJYYBpcDsulkWWqhCeJtGQ
	 HHq3Co2+Mp9scOBqwu8jU2TOOeHAv2PfZl79iZhaeuhfegcZZJYvlDGOr7kUFLmvPl
	 Z6Fyp6eS3o43g==
Message-ID: <sashiko-outbox-238278@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6.6.y 0/3] usb: typec: qcom-pmic-typec: fix late probe
 and debounce teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dickson Wu" <dickson.wu@certik.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127-typec-66b-v1-0-6fe3a0983e5e@certik.com>
References: <2026090807-unbalance-starlet-1c55@gregkh>
 <20261127-typec-66b-v1-0-6fe3a0983e5e@certik.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 20:59:29 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-typec-66b-=
v1-0-6fe3a0983e5e@certik.com
