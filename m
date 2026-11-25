Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605525;
	b=1LDKtrq9ufwHVcCOwpBWle4LIoRQ3caG5t1DX1yDkHEPkIrWCtuiJUOnaqqgTAB2LC6s
	 Oj+bYB1bAPZiAGI6vBXeaQoGadpG4EKP7aAMJ50GNp+TckILBV+YJTB0wwZgcgMB3IHBD
	 cBeeN7nutIWJJ5lkwBlI3NWRky4MlQCB+43E91IwZ0guCYncmzcQJF2ucBCiAAgLST53D
	 fCQymQBvRf7D9DCjkrplT6H9MjzUkJaW6LCEn+bj3AR8Q2YC65ktNCL56YF9ZxSKc1q4u
	 4Ww0L/Imo+oDPGINIFx49evK4+6FuDC/Wyv/N5DwA1SmzHlKI+a6Qipv/Ji8S37r4+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605525;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fjqIoE9g+rAz7ge0fthqeRXUgi3Mn+uSmMInUaF4LFg=;
	b=wHXlU1VJ9WHq5aqTg7k/AL0owRTmQyRE4uj6QFf9zhgQn23c+e00nwVkK5aa1KuzvYIh
	 HGSrSJLmGl7K4ecoK1jXaSUk158rOOdHuHRsNRRWyswP8ZEJSWM7WVsKfUISeiqJ0oODq
	 zMQBWEF9Q7f3aOnLuk4VN55IwOgJCTD66J1K56jESyGjal9f4VkZYQJrX83j9TR9IDowG
	 9Tq/jDeDKqirUKzPulQBWLe9Mul9PneiU+8/6wPa7u32cu0Hi/ZFcAB99WZjeD3jihboc
	 ejUb00nBeTOZ409BxeANdg8PS8WQ2yMRyQIkq3KfqRXt0wj/3Mxxi7wscobK5YvKaGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jiFz+kgD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5832E606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jiFz+kgD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55411F000CA;
	Wed, 25 Nov 2026 11:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605524;
	bh=fjqIoE9g+rAz7ge0fthqeRXUgi3Mn+uSmMInUaF4LFg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jiFz+kgDc/McT6XbNYMwICF3ZfT8EJ8L6Tbe25Y9dn8TKtQBhuPP8LIClKml/gLwh
	 5lMaZ/Jf+VhfgW8ZGzjvbbjGrzTheGHwnagRFyf4xcLWOsrtVuMk/dgFwe6fHgBlLr
	 uLpFuSB4lD/sZVbBlP7eTPHM2tDipqD5fa/Ewne5E1WOwTcV9chsppWEX1Mdbzjdqk
	 Bvn036aRC13gW/CBLWkuMQqQuvQtKoZ268ih4wYN/Mzqs/mxxrbcwxMc7N4Qn3MTFT
	 PXthDmj4hDSAnCNslFe0+Yj853fSJRlrQxSwrTOkk2bnSBP8Z6Aaacft8dQVCQgJDC
	 tPZqaHXDLyhEA==
Message-ID: <sashiko-outbox-233216@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/4] usb: typec: qcom-pmic-typec: properly tear down
 port on remove and shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125-topic-tcpm-qcom-fixes-v2-0-6fede9a69f6f@linaro.org>
References: <20261125-topic-tcpm-qcom-fixes-v2-0-6fede9a69f6f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 11:18:43 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 4-patch series:

- Patches 1 and 3: no issues found.
- Patch 2 ("usb: typec: qcom-pmic-typec: detach the port on shut..."): 2
  potential issues (1 High, 1 Medium)
- Patch 4 ("usb: typec: qcom-pmic-typec: detach the port on probe"): 1
  potential issue (1 Medium)

Detailed reviews have been sent as separate replies to patches 2 and 4.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-topic-tcpm=
-qcom-fixes-v2-0-6fede9a69f6f@linaro.org
