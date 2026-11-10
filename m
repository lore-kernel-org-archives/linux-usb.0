Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293052;
	b=gHspRX2KNErSeU/wrfd4OOT2BJmRJsY6B34TToJHmGgiDO+q3N0ctjj1XnQC9i4z+384
	 Us5hxjcLsLbbg2we8//MSfN0oaSPVtvC2zVFdblYLo2Bkxjo8cSIt1ECj/gox6Q5dQ4ew
	 pAfd/5gtTTVF19drvQEONxXOTwSVNnCmqqfblfUIBn86O8/WpAAQ3dLOnp3JrsVOk3j5V
	 QHI6Bo3bl7j+cWEes8/WpxH+mo55ic/FzCyMPZ3olGSUK8oK7BbKlGPD3mjl29PSkRJKB
	 JHo+uLoFQCbVSpTKW9/2iOzkE2TeCDr9n8Wa2oHOfL66hEh/ykNu/kysDJMXLSjTrww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293052;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GbQZcoSJ2w56kT4z79vL0SykCQhdRdQDxuXqwuGDrNM=;
	b=yNWkCzC1Xky9Yz03MMU9PEiar0goSrcL9vrKX2UEE+ds166MEX7aTyGsjV9l0FsA0Rbl
	 aOvpRpwvuWc3evAZ2vJPfPak/flST0Ed6saRXwElQNt6YK033Ey56iFhpSjKgYXKGYbzp
	 9WRFl/R6fjKW7MG3NHvu32ZUzomr0HOcb8A2dBlo+776NTZRXlO7DNEVqVk4CkV2K3uee
	 lb+88wFeRTYc2V/W2LLdAQhaDIr6NHMUxa8w3rItvrhaYLNOrjPjfEnjeMeyDo/3hJVBn
	 Nkj1PXEzqjk+UPzV0dYI4KNpfcHcwk8CILbfPfh7h9G6gWkCG+bUiM7ooGKSvH7lIIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f10s2fLK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FCA606B1C9
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f10s2fLK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9761F0089F;
	Tue, 10 Nov 2026 06:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293051;
	bh=GbQZcoSJ2w56kT4z79vL0SykCQhdRdQDxuXqwuGDrNM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f10s2fLKfe1DTMMYf98pzGOM0O8Pgq+Cd2F36L5R1h0RUZWSGtqcEqCS9EQN510xr
	 7q0QVdbKuEV0hrg2iqamJrQhIqw4xFfZiravtRa6fRbm3Co31q3qRgezZyf98YrFRS
	 a4NNuVqYL1ZwtTcZPmj2qyOeKatpRIn5kqOlwKToPu8ac11UQh9s4MsRpK+IzPyNKJ
	 CyH8IJplmNEUsCLYEZCYRnlEbwE3yTcRDvesFQy+O/2FQdIo0ZCRpUSlc6p1B6+hAu
	 3J6FybLSNVlq6L0zJTDMV4+zyK1hUaa1wFcqtY8Hilha+UPXUmAxtJbHxZkyrMaoHC
	 SAw7hfcybA7WA==
Message-ID: <sashiko-outbox-206433@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/22] usb: dwc2: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-8-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-8-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:44:10 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110064105.2033=
5-1-shishunbo@cmss.chinamobile.com?part=3D7

