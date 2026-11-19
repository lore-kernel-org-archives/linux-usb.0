Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053282;
	b=JpfRGxA+S0GBJawXO+GRvuVnC9vSQ5weibqYZCR8YKgfrl6dIUZC5cas3Zs/cDtpfu6Z
	 SFXkCIP0USGfyD2WUBIx7vMgWcAfDwD8hq7fIqXgULLSJpaIiYCyZQ2hvbzWkCikyDNNa
	 XMTHO5AARL82WFXtw1dynowkxScmUGQrlB0BAdbbNnUb9LfmHRm+KCjSuxHjAQ1OHXN9w
	 PsqX09Au5NarnIMuICBo46AOEM/AlB2MvQj6Qraxk/lTh91xMusPxGcjsKhinYvxajadX
	 abaC6Qt9QSW1wE5kSV7SXtIXHMXSh5kdAL+R/PXOKkcLoEqO84eYC5F2T1bIOvh+e4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053282;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a5/rk03RFKE+HDbiZ43ZeQKiG+gnvN+79ml1sXhVRqI=;
	b=wXfKlA2l0Q9OQ5b6f4Qi9yB63zWHr1bB6tvlyo98kMpvYUB/Iq9Wi8jGG5MQCtFdXZc8
	 j5qLQiwDc2BiU3nHnJs7whuCQtqdT1B1gTW0N6bF/ed+M2oIGf4MKzcjHU6pbnV4wlcIz
	 KvYIOEHmuMRe+ef1LkjIUQnmQ016odWQYhSzIOahEqVfX8n1YhdCOfRyXkN5GlMFy4pAk
	 YqA4Me4zZVTvsn+ngXJmdwtWnnayf3Slg+9Nfw75iNtbRDJLGSuU5wO3EPNY1Rg0Pk2xJ
	 HwHZ94rQXg6SHZdZfGecyy0NlByQfRQTTslpyZjdWzdAxHr4rklT4GgI3fQ7J00E5yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1CF606A32C;
	Thu, 19 Nov 2026 01:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B1CF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2aa7e726e3bc11f19a56ed5b684f684d-20261119
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:28d22212-2088-41b8-a839-778105087eab,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:74081fe178b2652eaa633b6ab2e63628,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50|99
	,EDM:5,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2aa7e726e3bc11f19a56ed5b684f684d-20261119
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 626924971; Thu, 19 Nov 2026 09:54:33 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	leStoppe <lestoppe@gmail.com>,
	Craig Hesling <craig@hesling.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huangwei@kylinos.cn
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid breaking VDS1022
Date: Thu, 19 Nov 2026 09:54:28 +0800
Message-Id: <20261119015428.147425-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <avxfFRBXbdhs66cC@hovoldconsulting.com>
References: <20260810091322.2201740-1-huangwei@kylinos.cn> <9970fa09ce5e1b468e473bc1e4bbe7d7802808e8.camel@hesling.com> <20261103022311.1011677-1-huangwei@kylinos.cn> <avxfFRBXbdhs66cC@hovoldconsulting.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 17, 2026 at 03:05:09PM +0100, Johan Hovold wrote:
> As there apparently are now users of the in-kernel driver and libusb
> has a mechanism for unbinding kernel drivers when userspace wants to
> handle a device itself, my preference is option 1.

Understood - thanks for the direction. I'll withdraw the v2 (Greg:
please drop it) and leave the owon match as is.

> I've tried to skim these threads and IIUC the only issue here is that
> some java-wrapper around libusb doesn't provide the unbind mechanism?

That matches the reporter's setup. He uses the software packaged at
https://github.com/florentbr/Owon-VDS1022, which installs the
official Java application (with a Python API as well), and its udev
rule only sets device permissions:

    SUBSYSTEMS=="usb", ATTRS{idVendor}=="5345", ATTRS{idProduct}=="1234", MODE="0666"

There is no unbind on either the Java or the Python side, and the
reporter confirmed the application could access the device only
after blacklisting the usb-serial module.

> And there should be nothing preventing a userspace application from
> using the tty interface even if a device does not speak SCPI, right?

At the byte level I agree - the generic usbserial tty is a
transparent channel. In practice the VDS1022 tooling is written
against libusb only (the SCPI subset is served through the
application's socket, not through a serial port), so existing users
still depend on an udev unbind rule or module blacklisting.

I'll update bug 220193 with the outcome and the workaround so the
reporter can close it.

Thanks,
Huang Wei
