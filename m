Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3612442B34;
	Tue, 11 Aug 2026 13:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786453567; cv=none; b=ZUA6RntU6l+CNh+klnt5ydOi+F3CaQ2GqveS10pzia4vlnG+AxWBgWcDK85UpuNz1mIWAlxCeqHloWEZrdQypmhYMB4Fy7KdxnHeHxej9LRlYhN7001MpXYclb4XxOE5Pl3h1tjB03svLm7ybtX43r/q4XudH9w5oHjF+KtHOEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786453567; c=relaxed/simple;
	bh=YnzCq21lZI4pNY4UyOfoJQi4ADIszLmrmJS3c+wSYWQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MjR5X4n/l4rch+s2ysqnvv1b2dEdQLoMWu/fDmEvUM1KSzO9j5H+n7G0PuaHPMUdDVfrbb550d7E0nOFmjngxzUvV50LMna4du0EUZfsHlSOjTnpQYCk8pfYP+0NrECqLim/pjzqfGZ8MXO4MTXP78xJ+NS+ElROh1OMjC4Iogw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 61601d04958511f1aa26b74ffac11d73-20260811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:a21ffc1a-98d5-4165-873a-0e9e0b8ec7dc,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:3f38bd8ae9b84da239937bec4861cfb7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|850|865|898,TC:nil,Content:
	0|15|50,EDM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 61601d04958511f1aa26b74ffac11d73-20260811
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1657602786; Tue, 11 Aug 2026 21:05:52 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	leStoppe <lestoppe@gmail.com>,
	Huang Wei <huangwei@kylinos.cn>
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid breaking VDS1022
Date: Tue, 11 Aug 2026 21:05:47 +0800
Message-Id: <20260811210537.reply-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2026081002-helium-geologic-bb5a@gregkh>
References: <20260810091322.2201740-1-huangwei@kylinos.cn> <2026081002-helium-geologic-bb5a@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Aug 10, 2026 at 07:43:33PM +0200, Greg Kroah-Hartman wrote:
> Where is the "owon driver" located at? Is it just a userspace program
> or a real kernel driver?

Sorry for the unclear wording. The "owon driver" refers to the
owon_device usb_serial_driver registered in
drivers/usb/serial/usb-serial-simple.c. It is a real kernel driver,
added by the same commit 4cc01410e1c1 that introduced the regression.
I'll reword the commit message to avoid the ambiguity if a v2 is
needed.

> thanks,
> greg k-h

To address Michal's point: the VDS1022 community indeed has a libusb
based userspace tool [1], which needs direct USB access. Before commit
4cc01410e1c1, the owon driver did not exist and the device was not
claimed by any specific kernel driver. After that commit, the broad
USB_DEVICE() match caused the owon driver to claim the VDS1022 as
well, preventing the userspace tool from accessing it.

This patch restores the pre-regression behavior by narrowing the
match to the HDS200's interface class (0x05). The reporter has
confirmed that the VDS1022 now falls back to the generic usbserial
driver and works again [2].

[1] https://github.com/florentbr/OWON-VDS1022
[2] https://lore.kernel.org/linux-usb/20260810091322.2201740-1-huangwei@kylinos.cn/

As for the broader kernel-vs-libusb conflict Michal raised, it is
valid but predates this regression and is outside the scope of this
fix. The generic usbserial driver can be prevented from claiming the
device at the user's discretion (e.g. via unbinding or a udev rule)
if direct libusb access is needed.

Best regards,
Huang Wei
