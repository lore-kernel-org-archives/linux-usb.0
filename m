Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452534;
	b=Jar+e3WfHIhtqCLNHxMpN2fnh3B6CyNXC8B57BYHTID9fNkJ308p42hoj6+y4SeNqlpz
	 4Q9guSK9GBG4h9PkzJtYVw0h28gVdPP2byk/IM7LjBCXmCn7etODLP00e+nUOLVTuj+FL
	 CgxpPwejEGtHX17HRBQHf8y0WsjnK/HXTmZa28ffFaTzlBwOwRiL043uhN/H5UzJBWkuc
	 QjLiL+g7ELwHebFTAJ/5bs610nLTg4VLMLjaIiPfe3+4RYqPJk8AMD16aVwfFThTOo4vB
	 MGfbpMzdXA68KYms6erPlZZ6Cs6mW8HuSB6bu78/kDpam++J1xKBPn93gsXhoAORqAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452534;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YayACtrx1vG13pZgjhBIYd3SwXAjm9Q4lo7QKl5Uqro=;
	b=mR4BiLpWeiuktwwMkQios7gdUAMCDuZv7RscGyIg9cWXrYEJf+afLtKrCRxaAnG4Yi6V
	 WJz2hivNeeV3U2SjORC1L3AXWSPJ3KZskS/QZuS9uygmxz5xVMM4+7o6sdpxRBypIAY0Y
	 /ePWJXWnptsAQICH2gLNCNhw5DPmpUP2dP6ydS8EyoTbgMDhu4sLxTZ8fm/5h/QjyKzTC
	 Q5wTZeMNN0GcUJtHj7tzPrrcvO9JnNTTBAsdiSOWKdtCOwTkKfEg5e/pXBqZdHDQmGLWn
	 SUiOqi3/gFTkUU8n+RROi+r/YKcAzZWRgVRWrVCWXGPeJE/rszWhadpIGGcNAWUVUyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iiTiYkub;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2246606A333
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iiTiYkub
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB551F0093C;
	Mon, 23 Nov 2026 16:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795452533;
	bh=YayACtrx1vG13pZgjhBIYd3SwXAjm9Q4lo7QKl5Uqro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iiTiYkubcdR8T/okk+Wt8xAuBzFlLLrR6d6Bym50AQ6l6o8u/qX7l4lVrP93g3yYD
	 +45vLKho9EO6lMU1rww4BhTg721yB2X4qoekSRT7KvMwjQTuo6x6mFwdg1Y08r82WZ
	 VXcQPdWPTtuijjkHO9FV2TGt3fh3ZDuaaA7aRtFSAWPw4Js2bNrgLPKb+MfkFu6ybL
	 /gE5uAtR9I9fPiRiM3JlNNcw8DUvbWfSjvsoSGt5E4GPA+/Ip27Ksl0iMwaBgDjJRf
	 VaFdEP8Zoxn9Hi8ycxCbLb3aeCXFFEYcjnoYFxD4zfJrIjcI4S56yxKVpYBnH38KlH
	 G2t0v3x881BJw==
Message-ID: <sashiko-outbox-229671@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/5] arm64: qcom: QCM2290: add the Embedded USB
 Debugger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Opaniuk" <igor.opaniuk@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 16:48:52 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 5-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-qcm2290-eu=
d-v2-0-9bfc432dee07@oss.qualcomm.com
