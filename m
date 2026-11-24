Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519620;
	b=2MxQOuz5yhC3hPDGkkCXoWbmPbN3DFk9CHNcAyxMpUdvDbyhmbT8JCdRygx++LazmBTp
	 egPS1jUlibvyItQRKL665sp/3tLRzX66kQ9yEvbAnVT+ixIeZuxxiv0/SfTGavSu2q2p6
	 qcBN+Q6BEwg+imjIaBqxymy6TUjTSt9isCml/nY6MG/mjaDC41Kmg12ctiYHiKuW61i25
	 eFnai3FIvtoUAzBBhvRYYHjKRHoG7Hzihk3tGISfc3Y6YyoL8WDnVC9leQ0MVF1LZbB0T
	 TeH0jr6R1Z71wrQ9lru0ZlbM2GdRkfSW+OTp15ID3zqco3P9Y/MOxMp4WBbwLseMrZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519620;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=L7Z4UsApFuFKKuWC8Va1WVN8oHI/iw9+If7XT2mY294=;
	b=XIw6RjgJMnnnR5fmjEor8gSRXmqiBEvZohHV4kYEtUyU8zYCpHk5VBi2+aOiV8Hn8YFW
	 S2CGlsxwfUUx9sEnAzMWklVsdrA6gCSQn4QpT0ipwn/rmQSMEP1ICBznNDJyuK4aszEIH
	 YhfS9eHRXfgQEk/dMdik8zjVJqXFLIAUcte+deWbMyGLvE+zsjMxCP7CZn3j+NFU3Rg84
	 JDb9EquWR5V7jQDwkV7tuwKTcV+eopoU9KWBYiM3QkR5/Lu0cWpK4EcA6K1qD3PQGMFtP
	 cV8DAVfhE2AaRDk4GefkEXmrfQ036nHSp0MvEdVLNj4sN4Ag4/wj8hbNGDaciexKBJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MGQVSBlS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338EC606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 11:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MGQVSBlS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4081F000D1;
	Tue, 24 Nov 2026 11:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795519619;
	bh=L7Z4UsApFuFKKuWC8Va1WVN8oHI/iw9+If7XT2mY294=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MGQVSBlSmKm3wt4SGB2qMN60EW7JKcgZfs8LLgto6b6+vxbhdOIKxoOyjuqfhYURU
	 5nBv61Qs+uEljop1/DjYJuw+svnOHbkjrsShYnae97kvMdBSfK7idT7bRZmD3gsuxl
	 HncyNcULSU+mPfzVmzcYcOayqPDbOu0WS0dBa9PvMXl9Bg6tpEPhp5sHJaJskvwF4w
	 St6K28z305rWpIkvA9Xogwtp0GfaEjgg6PIG63SKe7KX0nso4hLv/zrzbDJdzCOvfi
	 tXqnMOBiZFhcIvxujCbGQUKbZfgHbgF8T9/nJD5wlyR6juJDUZ4c4ym7d3SvUo1lYA
	 kP0EJ1a1BZR3w==
Message-ID: <sashiko-outbox-231051@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 0/2] usb: dwc3: gadget: fix request unmap and
 linearize SG requests that exceed the TRB cache
Reply-To: sashiko-reviews@lists.linux.dev
To: "Faisal Hassan" <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261124111321.2731905-1-faisal.hassan@oss.qualcomm.com>
References: <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
 <20261124111321.2731905-1-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 11:26:59 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 2-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124111321.2731=
905-1-faisal.hassan@oss.qualcomm.com
