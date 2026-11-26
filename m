Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699369;
	b=aqlcLQ6x8k2mPHiRjS7yEV28k9ENo0OcKXZWApJk5BAzkhGInMHnYI1/QbmaFsVeqAo2
	 Q4M7qaPt/hmYFfdhSZpxGU0pL+5gLdtYe5GhUHiobF54gy+QACm+mb3hm67uQOlvVAf7g
	 XEALSqhyKq173HIDJC9VNlwGKojIEX+D9EgvUlwkFqmftlzGehzhluEj983UEpzvYCM68
	 bJTZJMpzaDLK0EIS/VbdDk46/ubWGzGFRDm73rINNPP/3toS9YwTtlC2mLtlhOYfVoS5P
	 ss8aS4KsuWqqwazTrgHCf3LkXNfTpuAtDPAvsyABLFnIhLnwML/X6KQ65En0YMbhkRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699369;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/TmfyAB7vJnd65hvPIbfJE1rhcPVHA4ZQR+wrAChTwQ=;
	b=CCOTTlV0QDSbnBz80oalFu+f+h837r3T6kW6lOhPL1cL6+eQxpzW75//VNEgpqlirEOO
	 OkkcWtscSVepChhCFzWZ9gWMESyGOx+RyGyJgBShJKgnqR3aH9bSKeH7GF2XWXCntTppg
	 eCiUEYHQJKsb7J+a75orLOe2/e8qvDAp6PCJVhxk0rktFeyj1JEVZR7tV4PHhs6GKTOk+
	 flDcxDJ4IkGcqGiIWC5dxNIvWvQ7RZyCcT/iaV2dXwwdbrSrP4yJyV2UEraWgO0DSmrDL
	 O/+af/YTviswVoKffHtlrFGoacAa/5RJsq1HJkRmNC+Cw6E1lJmEH7cSMddGvWymRFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aljwF7Jg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3140606A321
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 13:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aljwF7Jg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABAD51F000CA;
	Thu, 26 Nov 2026 13:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795699368;
	bh=/TmfyAB7vJnd65hvPIbfJE1rhcPVHA4ZQR+wrAChTwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aljwF7JgEMKgSmqozCIjYl86A03fxF8IV3qq+B6ixOHsv3Ig04TwMPfmjW+em0/Nv
	 ydwb0s/M/vaSwrtvhxdFbK6SxWXdjNcKX40FLO2zD8oVBCmcW5YbrFAUhoXoP4gyie
	 srpTO5p08FMCWhYj7Qt1HPcD4OQfu2Q02nFBFcEqd3aT6czrWw8OyN1rLcKfo8ewPf
	 e0vnZwLFTtsNTumbvHyd0kB+Z4DFXJ2OByUd+FMlyHTn38u4aCtiNq2nZORhn4BnaG
	 9kJTlthDqkD9Yb+RMuBeve4674bhTYHZDVi9OwYCqiz+9F+9s5T9MDayVCoGO/cSo0
	 tmhfd47nVCkzw==
Message-ID: <sashiko-outbox-235593@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/4] DWC3 concurrency fixes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126-topic-usb_dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com>
References: <20261126-topic-usb_dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 13:22:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 4-patch series:

- Patch 1: no issues found.
- Patch 2 ("usb: dwc3: gadget: clear softconnect on stop and fai..."): 1
  potential issue (1 Medium)
- Patch 3 ("usb: dwc3: gadget: serialize resume against error re..."): 1
  potential issue (1 Low)
- Patch 4 ("usb: dwc3: gadget: cancel err_recovery_work after us..."): 1
  potential issue (1 Medium)

Detailed reviews have been sent as separate replies to patches 2-4.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-topic-usb_=
dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com
