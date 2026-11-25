Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604376;
	b=ji6o9d1O9i08yN0MiUzayGjiCiAT2dzMPkaOuLCs3cQDcYHzZ/cCXRm22WnDBunNHRbC
	 579yTnxk/Jy9DmgXKHm2m3vrs/3Scaw2itLrh4/GGXT9Qa2vf+ixST9Z5mwcMW/cP1bK4
	 slhGHzk5fFF3Omzw+KwEsobbpeZDSLkNM6k8gcXU87e14t5VfS7U0IW6+K9941RkXwSTh
	 PJscg/F5XFQyPJPuzonXZXF3Hk3+kLdPF5gHs7dS1edQiifzTEVcaAs9koeNe1z79bNKm
	 1HTVfoYD4/2HF+L9ktgUDC14B8YmYmPd1HVI00sEQZoittvv6KtMA03fG7hFN/0l/8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604376;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9bn6YOY0CIgKronSOJ6ULJ6QS7qSCzpT64qCK8Id7OA=;
	b=ZdVv4L1yHTQ+kfU1V90M+8fj2JKMavLOkbsw2aPyYL8jFEwy7u1ZHKHKA+45Lr0Cn1YW
	 CSAe8qIsyg6vMF5ehvyb27xPEezxKD2aDJRGKFNR8DZNd/4UU5VsvFAm5w5iygOwhKYd+
	 ueg4y4Aq2OTP00lBERwoSgWJ3FMcx3q+E/+sblTc4+hQnBgvq//tgxvT+nPMX32G/931T
	 Q0/b5mCsxpTHA4+YEjg5fEhmIJUtUt6ZsTLFHdL0ANfoBb6wTXPiAk2M5R4ZO+DrONkyp
	 Uqp+z9zlvGeypufph8XOFLBcQTNfP3/WvchZlFmcik7N6RvPH11REdecHFsZ4phnN3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AWRe2lgQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68560606A329
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 10:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AWRe2lgQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA44A1F000C4;
	Wed, 25 Nov 2026 10:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795604376;
	bh=9bn6YOY0CIgKronSOJ6ULJ6QS7qSCzpT64qCK8Id7OA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AWRe2lgQB6Te/L7VyhCwSaaxIhH63903uQqlp2m1MNKC8pItO75wPXm6nPIJwbn4R
	 FGUK7P55LOwpgRzqLSMZDBp+Zc6ov/YN7Dw2C3FlCkRhaj2fO+zmP6w/+9Rk7i9HAE
	 ViLkhceiQlyEwPDa4hOsbNFGviDEGCdURn/w2dkGOF8SMgwwIn+8pSw3EVZub0MuQ1
	 RotLB6nQ4quFE6fjWxglH1iVKyrvoAC9t89H4+ySUPtNaKgV531HBLeAGvevPA0Ll7
	 DG5CKy5uGSjsWvZoWrWQU44CYUzY5ETGiSoV96O0BveoyjxJesIKG4Rd0ZxCLGzgvZ
	 O+DcFNceenYSg==
Message-ID: <sashiko-outbox-233182@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/3] usb: tcpm: partner sink capabilities and
 altmodes leak fixes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125-topic-tcpm-core-fixes-v2-0-aede2a3471f4@linaro.org>
References: <20261125-topic-tcpm-core-fixes-v2-0-aede2a3471f4@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 10:59:35 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 3-patch series:

- Patch 2: no issues found.
- Patch 1 ("usb: typec: tcpm: unregister partner altmodes before..."): 1
  potential issue (1 High)
- Patch 3 ("usb: typec: tcpm: destroy worker after reset_port()..."): 2
  potential issues (2 High)

Detailed reviews have been sent as separate replies to patches 1 and 3.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-topic-tcpm=
-core-fixes-v2-0-aede2a3471f4@linaro.org
