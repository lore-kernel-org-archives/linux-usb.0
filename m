Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184954;
	b=dpdocADeby+I5QGzkicqeFa57XGqJdlzRJtdeDmrIkHAnA8BPGQpsUWf/8qkVJ7tEDhG
	 UEqn/88i5dCsjdw4CvLLksP7Otu/Ho8Y2kPyRiLSFTr8U0uMhdqggoMav8rjV9A+3ZlZP
	 YIwQHzZUkpQX2EfQl6HAjDdQ6o8vo2xmhsLyPl0h6VwsQ76hVwdPxKR2BhE/39JRn7DsR
	 hzTgcvs8GUHL/zhuUSvMbsEJgPzU6wQt2IEB5ZpvKrE2hGyXhkgOeOSiiSN5HxUjIa3SD
	 2ZUX8tNoCC5Cc3YzWbn3nqOxnlY/LLbYyKXGJpMu8imrL3w/brALUfxEMlpVTnIgQtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184954;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ukEKfaq7bW/90Vpef7ct+mR++7fBuAJmv/86Bb1BJ/0=;
	b=lApwAWgML9/IQKTXTXWtSsI7r8eIaYh9W0xgjnnZEHV/JJagDUyn+X6YWV5R/yjs9Ixb
	 vt+bV67/pwyHuQXgDKv7nE8Kdk2IQxsQg3nEagZLgOPtGHgQ7TRPyrOSi0Ahr/18PMOdm
	 VVBNm9ao78BKR4cNdAH9nCvG2Hrq1BOUhdyng4Iy7bybbWied4Et3Wwzue0GQyvropOyF
	 LH48VjNaAkxVk40Kuq+TXwaHko1I+6L+Sm9Otcg2M+/Nyc0xC0lWlvK1bgYmBQqefg/5A
	 1Nw3ekpSTZKwpGicStQoaiPAblMh96qwNi8DsjUCVaohV69WpVb7Xh1N/sAutIF4faA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4fn2mXX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347C0606A31C;
	Mon,  9 Nov 2026 00:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4fn2mXX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C569E1F008A5;
	Mon,  9 Nov 2026 00:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794184954;
	bh=ukEKfaq7bW/90Vpef7ct+mR++7fBuAJmv/86Bb1BJ/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g4fn2mXX7hOa9w9Zd6LQugjDtaqC2lh1gXGtvHytFZATT6i3tXOgnlOLsv0lWjBhJ
	 gkTbF861TRD+q8nXHZcJQDDEewHmnSTvS6RMZ8Y52Tiz2zXKzj4vx2FPhDYVflrzKN
	 WmM3qKB9ZsrPXJEbOBXYnw82blCRXFDbrazmGcYSoS5n/73njGT8uCCca21Rk/4vL8
	 hukVfRZfzZqvAVb3vqFZ+1w1WcdboYrJyvx4KWfV1gy6hlzvKU5lWo0+bqtFceQo8L
	 8RL0PM9eQHtOpACrN2NrGW0OkuLBXVcg9p+PJuddJ+0pHtQaEah+mCjr/3RS2inxFR
	 yiJqFKqPgIMCA==
Message-ID: <sashiko-outbox-204245@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/17] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 Halliday HS PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-halliday-dts-v1-8-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-8-289114ab8197@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:42:33 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the Synopsys femto USB high-speed PHY on the Qualcomm Halliday
> SoC.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-d=
ts-v1-0-289114ab8197@gmail.com?part=3D8

