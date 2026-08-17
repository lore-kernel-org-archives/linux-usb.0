Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A183E022C;
	Mon, 17 Aug 2026 09:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786959364; cv=none; b=Ae2BCtw6ag+YaGz2oik6Ehw0XtwJlj7i8cYtXaUXEReoaFKME6Z39x8J3mo9x3DhMoicl+QDVw2UdtKKmLyMJ6Wk8HAg8Wc5zBkD/h/2KYGNYGUvlkyIkB1S2jyhO87o4WfXPwsWTdfLoPXf4NOEFv8Vd2FhL/xH94m6DoQTCo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786959364; c=relaxed/simple;
	bh=dMuJJdV3AxAYtcWe+dbl22mUmCd8t14P+au1fWQUB/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B+oDyYaj47+Y8tPV94eIijz+CXDwiFW895F3sHIqzBaJL96dNVc3ngAEbCcCN5zILt5w+awr3ojA/1jVHezHzD0HgtsoNztXC0Ds09T5ijDD8PUnE6LIjj1sAcm6CC63E4fJ+OEqpzKES7gM/S8t62+zaiOQsWX5oBqa95+emXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 09d4b6fa9a1f11f19a56ed5b684f684d-20260817
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:2f2dad2c-6390-4dd3-aa55-310cf1b34d93,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:62f4f0c0eaa02832bee5e4450bef1af2,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50,ED
	M:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 09d4b6fa9a1f11f19a56ed5b684f684d-20260817
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 159824157; Mon, 17 Aug 2026 17:35:52 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Johan Hovold <johan@kernel.org>
Cc: Huang Wei <huangwei@kylinos.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Craig Hesling <craig@hesling.com>,
	leStoppe <lestoppe@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid breaking VDS1022
Date: Mon, 17 Aug 2026 17:35:49 +0800
Message-Id: <20260817093549.245503-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aoLKsDMGD3NXT19-@hovoldconsulting.com>
References: <20260810091322.2201740-1-huangwei@kylinos.cn> <aoLKsDMGD3NXT19-@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Johan,

Thanks for the review.

You're right that the owon 'simple' driver is effectively an alias for
the generic usbserial driver, so a VDS1022 used through a kernel tty
would not have been broken by the new match. The reporter's breakage is
therefore most likely due to a libusb-based userspace tool, which can
no longer claim the interface once the kernel driver binds to it -
before commit 4cc01410e1c1 nothing claimed these interfaces in-kernel,
so such tools worked out of the box.

leStoppe, to figure out the right fix, could you share:

 1. which userspace software you use with the VDS1022 (is it a
    libusb-based tool?);
 2. the output of "lsusb -v" (or "usb-devices") for the VDS1022;
 3. whether the VDS1022 supports the same SCPI command set as the
    HDS200 series.

Craig, was the intent of 4cc01410e1c1 to cover only the HDS200 series,
or the whole range of OWON scopes sharing this VID:PID?

I'll follow up with a v2 that switches to USB_DEVICE_INTERFACE_CLASS(),
fixes the comment style, and drops the wording about falling back to a
generic driver.

Best regards,
Huang Wei
