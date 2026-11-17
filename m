Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919609;
	b=VDzGeARnk26IvAR2fYzlyQHv+8mIER3SK3BDpNJPQG9xoSpYXOAAENA75JLER/7Orwko
	 8fwAgq4yy8XcdWDTe1dejjUrcAOIFXDp/NhypDJcHKcIAE3vEjik7TAeSz7qzhEoxwZ5a
	 QM/yqQCAK7t11uzPjkRENqbId6Q93dNHZ0G5KjHtwnpRgWwxkQa/AbJqH70D33o0Y0jTu
	 n0ebcXZxD7dRxoTvASWB+akS+uuMXHf6zVeeKsT6x9bzL6X8VsgHCYQ/pToZp0nT59jb6
	 YppExc7zQT/SgCWdQy+rypGHjJufuX4Mt/VRtKQAa39yGUZ/6nPT9EJzio467chXFlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919609;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GteLI0gRGrMm1NP9A7kQIlWaVDDBm19VYMMhZy0icYQ=;
	b=X7T9yAs9YdRTeBO0b7ysziFGw21f2twV+yj+oXXrXcyaVbtUh1qZgGUY/01w3gQfuzkQ
	 5cXW5mPwt6QdEU/JtFH41lJ5Z+l988a25cYEJljUks/bojNBINWaybRrxv/nYgdKxqaIT
	 QMGlcc0mFZO+cc2F+WiqQ72QDjvIqJlqgTKfKV5LFj4ZHc7Nkq1YQF9wSRkpUxyKr7+dc
	 Yi8b6BcQ00WKyUeqwALMm/q+12dBO+7zJ4EdUhKgH0jSxSy6d62AMUmPxvNMmAa16sJVI
	 tPrG9urxGW64ioZNGVLjL4WrXlrGcK3/ge6JxXtns3LkeF7mLyJkiJDWhaq1JCIWBww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MP8n1IAS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDC0606A334
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MP8n1IAS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60731F000C6;
	Tue, 17 Nov 2026 12:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794919609;
	bh=GteLI0gRGrMm1NP9A7kQIlWaVDDBm19VYMMhZy0icYQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MP8n1IASsOCGTNV7My03oDwYqA8Njv+a+OYoqSfWXPDkJhm7xDja2AqC8Bnj89Ude
	 L5HzDWo7UW2KO42Dk4DrCJ9XxzyHFMQKOgTO4eCVKRPTJSXyC/IEMgTkO8pCw5isTE
	 kHrPzn3QqzINgrmN8ckWN0bDM3/Qn3TP5ZyAUh29NcTN0z663tBFDic2/tN1NsyRA+
	 9sFGAjErLGIfaPLMCJywFF5ijPh6hEyXBkbI2Wr+CLwS3INbV0uaSe9GzoxEvg2/aC
	 +6YA+86jPYZu2wpT+fituVMiX4Xaz3zSG2IOGjtWydQjUQ8aI/MVIoGd1ptkI4m68a
	 h6RTXgbCfr+GA==
Message-ID: <sashiko-outbox-218788@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 8/9] riscv: dts: spacemit: enable USB2.0 controllers
 on OrangePi RV2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-8-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
 <20261117-b4-spacemit-k1-usb2-v5-8-52c3829cca69@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 12:46:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On OrangePi RV2, usb2_0 is connected to a Type-A connector at host
> mode, its vbus output is controlled by gpio 126. And the usb2_1 is
> connected to the USB2.0 connector pins onboard.
>=20
> Tested-by: Ze Huang <huang.ze@linux.dev>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-b4-spacemi=
t-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com?part=3D8

