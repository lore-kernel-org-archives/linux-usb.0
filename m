Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B448A334374
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 07:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782803213; cv=none; b=Eqh+EQG7OeunXCm03qLwdy7/hj1oW14elvsUcgfFTKb2/zL9qMqg5/wac+ea7m66IXvBPyXVY+l8eZRQbF4WI9b8h+a13E4b4cs1DhMUFyXRas4ZBZRrmwNwvmdiZi473EbkCZmfzVm13vEccNaR/QSNSpvCSa+wFbZNtkfUXck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782803213; c=relaxed/simple;
	bh=XLZzRVAjXyxARPOdPXae9Y/xg0YZ4OlIb/6u9HBltwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PjOLOaWZDoHeBqjFqt4BqsHbhqRkZ/7VTT66Vu3omVXvm3Pj4JOaM5EbZq+kjsKwLzBY6N+9A8++CVzm0LUHzfbdYnwru+ZCiOGjoir/T0eWaSHnxMsnZ49Vnfbjz75opD3Ut0Prpdux/eAZtRieTeiw6kxvkq70rrHCS8+YrUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=nzY7UbER; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="nzY7UbER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782803189;
	bh=M48dHIyNFDMkET8Hrcji5q3FwjZBK01EWFjhGM7SQ7g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=nzY7UbERxsisKfH8TNxYTvHG58ERoHYi2LZAXvooUu6MQaqepitNjFvCqgNuuXNhf
	 A35EXPhxdq70i2D/SkNE/5Qim9JiYkNDlc2+m3ELnYVZte5JG3bLwxaPpCMHPVyMI0
	 U29UG5eKsxv47zNPXqPqmfh9PqbdqtN6MKW2obnI=
X-QQ-mid: esmtpsz11t1782803174t0575ca11
X-QQ-Originating-IP: QcrFXS6JZZMz1dO0i2IGC1jxNM2v3iPzeEyadHr8Hug=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 Jun 2026 15:06:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10937977656666626115
EX-QQ-RecipientCnt: 4
From: Xu Rao <raoxu@uniontech.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	raoxu@uniontech.com
Subject: Re: [RFT PATCH 0/3] xhci: avoid futile stop endpoint command and host teardown
Date: Tue, 30 Jun 2026 15:06:11 +0800
Message-ID: <31BE5DC88420567E+20260630070611.3186010-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260629123031.142133-1-mathias.nyman@linux.intel.com>
References: <20260629123031.142133-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NPwdxSKNG61XduBudldu2zJ63lgmGzqjCobBaaFb/HB9s5yXRYClHObv
	S1vhAxIYAOxEDx0L3idKUDsZJLPnYz0YvxDzMFp59DUJPkhKfntcJpheIZWSfjTGK/upJ0N
	3Hl6Hp05XrtCjK7j8GEILVZ59UUlep0CCPn+tW83P+AJvlR5pQWuLQM16WJwGM5pBvzSUwE
	8Z87Ddm+2fthSL6SUG9G+Xnoz3K2+foci4BhpNeluRoiMA+T49MhiIBPW8mdtIU2uZ4m8gJ
	pkXON22Id++F29htOPGHKf1psO11VRxDqOFUpQxglSZbQ2P8uB8xg+4wLjK6Hl5DUdyBf//
	EtjTpLU0U4IuzpFbZISSsl84VeoUGXgxVr5MxIo3ko7D7aLPdM6f8N3msBEWkaaTYNclmeP
	g9KXWqi9O6zThdCDD1ovWGONBc7/AciMb5GaSqtRpBHO2AGndAE8nCD/6C14MzsiMIePCz1
	m7yrkhfwWAo4dIUvprEjZiiVGomICH2u+ZU/QUn3T6UP1xXw2/fVRHjD95WsQdaYB29ATba
	CadIjSjGsoM44IGZqsu3yy4Cfo2Ou8JOsK9D91TwJ5sIBQnP7JZcnnl4SHxK1/awE8x3/tx
	P5CFstxxktAT0wQlEODsZwsB/15JMtMeAXqfo+k8K9d+wTs5aaIJo7hmW/IeqCdJZ050s2t
	sgWwwTuiF76fhT/HLceqFsXqWpgNOXqyRXVryF2Srs7s5sJg5uXAWts0CNZa8S13yc7q5hh
	Ylz0OKkwgCeGdHnT/ZaeKevgZpfIbDI1EizRnTpuNrrxXtIrN6Sjuh8AN5/FSCSFaR0gYtq
	0/MaPAQ0xGF6jBk0PvdL238VuxzPSyag/pVNSNiC/mXf48cEslu0EeAB4znSKO4qvEMx2zP
	TFWwCZkmoe+N7LgdH1Ge88/FnHFpgTHoJBcaZ6OwT2I+MAj1V89o237rSHdC78QwwJep8nl
	5GidDwQ7fVpvJggciUUrKrfhMP4lj7CTEa5Qh0hWwsNXJNo38MyyzbpQA
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

Hi Mathias,

I tested this series on the Renesas uPD720201 xHCI controller with the
GenesysLogic hub and RTL8153 device behind it.

The original failure is no longer reproduced. After unplugging the hub,
the xHCI driver no longer tears down the host, and I no longer see:

  xHCI host not responding to stop endpoint command
  xHCI host controller not responding, assume dead

The log also shows the new EP_DROP_PENDING path is used during disconnect,
for example cancelled TDs are invalidated directly instead of queuing a
futile Stop Endpoint command.

The full test log is included below for reference.

----- test log begin -----
2026-06-30T14:43:01.489660+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Port change event, 1-3, id 7, portsc: 0x202e1
2026-06-30T14:43:01.489675+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: handle_port_status: starting usb1 port polling.
2026-06-30T14:43:01.489682+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 1-3 read: 0x202e1, return 0x10101
2026-06-30T14:43:01.489685+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: clear port3 connect change, portsc: 0x2e1
2026-06-30T14:43:01.489687+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 1-3 read: 0x2e1, return 0x101
2026-06-30T14:43:01.528610+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 1-3 read: 0x2e1, return 0x101
2026-06-30T14:43:01.564609+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 1-3 read: 0x2e1, return 0x101
2026-06-30T14:43:01.568611+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Port change event, 2-3, id 3, portsc: 0xa021203
2026-06-30T14:43:01.568615+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: resume root hub
2026-06-30T14:43:01.568616+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: handle_port_status: starting usb2 port polling.
2026-06-30T14:43:01.596610+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 2-1 read: 0x2a0, return 0x2a0
2026-06-30T14:43:01.596613+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 2-2 read: 0x1263, return 0x263
2026-06-30T14:43:01.596614+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 2-3 read: 0x21203, return 0x10203
2026-06-30T14:43:01.596615+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: clear port3 connect change, portsc: 0x1203
2026-06-30T14:43:01.596615+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 2-4 read: 0x2a0, return 0x2a0
2026-06-30T14:43:01.596619+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 1-3 read: 0x2e1, return 0x101
2026-06-30T14:43:01.636613+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 1-3 read: 0x2e1, return 0x101
2026-06-30T14:43:01.636617+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:01.636618+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Slot 6 output ctx = 0x0x0000002002ac7000 (dma)
2026-06-30T14:43:01.636619+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Slot 6 input ctx = 0x0x000000201334b000 (dma)
2026-06-30T14:43:01.636620+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Set slot id 6 dcbaa entry 00000000e305d9d2 to 0x2002ac7000
2026-06-30T14:43:01.636621+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: set port reset, actual port 1-3 status  = 0x331
2026-06-30T14:43:01.683298+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Port change event, 1-3, id 7, portsc: 0x200e03
2026-06-30T14:43:01.683302+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: handle_port_status: starting usb1 port polling.
2026-06-30T14:43:01.700622+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_hub_status_data: stopping usb2 port polling
2026-06-30T14:43:01.700628+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 1-3 read: 0x200e03, return 0x100503
2026-06-30T14:43:01.704613+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: clear port3 reset change, portsc: 0xe03
2026-06-30T14:43:01.704618+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 2-3 read: 0x1203, return 0x203
2026-06-30T14:43:01.704621+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_hub_status_data: stopping usb2 port polling
2026-06-30T14:43:01.768615+08:00 uos-PC kernel: usb 1-3: new high-speed USB device number 6 using xhci_hcd
2026-06-30T14:43:01.768620+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Set root hub portnum to 7
2026-06-30T14:43:01.768621+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Set fake root hub portnum to 3
2026-06-30T14:43:01.768622+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: udev->tt = 0000000000000000
2026-06-30T14:43:01.768623+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: udev->ttport = 0x0
2026-06-30T14:43:01.768625+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:01.768626+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful setup context command
2026-06-30T14:43:01.768627+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Op regs DCBAA ptr = 0x0000201d47a000
2026-06-30T14:43:01.768628+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Slot ID 6 dcbaa entry @00000000e305d9d2 = 0x00002002ac7000
2026-06-30T14:43:01.768629+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Output Context DMA address = 0x2002ac7000
2026-06-30T14:43:01.768629+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Internal device address = 0
2026-06-30T14:43:01.768631+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Waiting for status stage event
2026-06-30T14:43:01.768632+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: set port reset, actual port 1-3 status  = 0x331
2026-06-30T14:43:01.820611+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Port change event, 1-3, id 7, portsc: 0x200e03
2026-06-30T14:43:01.820616+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: handle_port_status: starting usb1 port polling.
2026-06-30T14:43:01.840610+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 1-3 read: 0x200e03, return 0x100503
2026-06-30T14:43:01.840615+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: clear port3 reset change, portsc: 0xe03
2026-06-30T14:43:01.900613+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Resetting device with slot ID 6
2026-06-30T14:43:01.900618+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:01.900619+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Completed reset device command.
2026-06-30T14:43:01.900620+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Can't reset device (slot ID 6) in default state
2026-06-30T14:43:01.900627+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Not freeing device rings.
2026-06-30T14:43:01.900628+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:01.900629+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful setup address command
2026-06-30T14:43:01.900629+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Op regs DCBAA ptr = 0x0000201d47a000
2026-06-30T14:43:01.900630+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Slot ID 6 dcbaa entry @00000000e305d9d2 = 0x00002002ac7000
2026-06-30T14:43:01.900631+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Output Context DMA address = 0x2002ac7000
2026-06-30T14:43:01.900632+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Internal device address = 6
2026-06-30T14:43:01.920618+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:01.920625+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Slot 7 output ctx = 0x0x0000002010586000 (dma)
2026-06-30T14:43:01.920626+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Slot 7 input ctx = 0x0x00000020011f6000 (dma)
2026-06-30T14:43:01.920627+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Set slot id 7 dcbaa entry 0000000044029de2 to 0x2010586000
2026-06-30T14:43:01.920628+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 2-3 read: 0x1203, return 0x203
2026-06-30T14:43:01.920634+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: set port reset, actual port 2-3 status  = 0x1311
2026-06-30T14:43:01.920635+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Port change event, 2-3, id 3, portsc: 0x201203
2026-06-30T14:43:01.920636+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: handle_port_status: starting usb2 port polling.
2026-06-30T14:43:01.920637+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Waiting for status stage event
2026-06-30T14:43:01.929990+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Waiting for status stage event
2026-06-30T14:43:01.929994+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Waiting for status stage event
2026-06-30T14:43:01.929995+08:00 uos-PC kernel: usb 1-3: New USB device found, idVendor=05e3, idProduct=0610, bcdDevice= 6.55
2026-06-30T14:43:01.937132+08:00 uos-PC kernel: usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
2026-06-30T14:43:01.937137+08:00 uos-PC kernel: usb 1-3: Product: USB2.1 Hub
2026-06-30T14:43:01.945584+08:00 uos-PC kernel: usb 1-3: Manufacturer: GenesysLogic
2026-06-30T14:43:01.948615+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: add ep 0x81, slot id 6, new drop flags = 0x0, new add flags = 0x8
2026-06-30T14:43:01.948620+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_check_bandwidth called for udev 00000000549dc7fd
2026-06-30T14:43:01.948621+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:01.948622+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful Endpoint Configure command
2026-06-30T14:43:01.948623+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:01.948623+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Stopped on No-op or Link TRB for slot 6 ep 2
2026-06-30T14:43:01.948624+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:01.948627+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_hub_status_data: stopping usb1 port polling
2026-06-30T14:43:01.952620+08:00 uos-PC kernel: hub 1-3:1.0: USB hub found
2026-06-30T14:43:01.957200+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Waiting for status stage event
2026-06-30T14:43:01.957205+08:00 uos-PC kernel: hub 1-3:1.0: 4 ports detected
2026-06-30T14:43:01.960614+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xHCI version 100 needs hub TT think time and number of ports
2026-06-30T14:43:01.960619+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Set up configure endpoint for hub device.
2026-06-30T14:43:01.960620+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:01.960622+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful Endpoint Configure command
2026-06-30T14:43:01.992627+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 2-3 read: 0x201203, return 0x100203
2026-06-30T14:43:01.992639+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: clear port3 reset change, portsc: 0x1203
2026-06-30T14:43:01.992640+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: clear port3 warm(BH) reset change, portsc: 0x1203
2026-06-30T14:43:01.992641+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: clear port3 link state change, portsc: 0x1203
2026-06-30T14:43:01.992642+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: clear port3 connect change, portsc: 0x1203
2026-06-30T14:43:01.992643+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 2-3 read: 0x1203, return 0x203
2026-06-30T14:43:02.055885+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Set root hub portnum to 3
2026-06-30T14:43:02.055892+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Set fake root hub portnum to 3
2026-06-30T14:43:02.055894+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: udev->tt = 0000000000000000
2026-06-30T14:43:02.055895+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: udev->ttport = 0x0
2026-06-30T14:43:02.055896+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:02.055898+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful setup address command
2026-06-30T14:43:02.055899+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Op regs DCBAA ptr = 0x0000201d47a000
2026-06-30T14:43:02.055900+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Slot ID 7 dcbaa entry @0000000044029de2 = 0x00002010586000
2026-06-30T14:43:02.055901+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Output Context DMA address = 0x2010586000
2026-06-30T14:43:02.055902+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Internal device address = 7
2026-06-30T14:43:02.055903+08:00 uos-PC kernel: usb 2-3: new SuperSpeed USB device number 3 using xhci_hcd
2026-06-30T14:43:02.076954+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Waiting for status stage event
2026-06-30T14:43:02.086365+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Waiting for status stage event
2026-06-30T14:43:02.086371+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Waiting for status stage event
2026-06-30T14:43:02.086372+08:00 uos-PC kernel: usb 2-3: New USB device found, idVendor=05e3, idProduct=0626, bcdDevice= 6.55
2026-06-30T14:43:02.086376+08:00 uos-PC kernel: usb 2-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
2026-06-30T14:43:02.097402+08:00 uos-PC kernel: usb 2-3: Product: USB3.1 Hub
2026-06-30T14:43:02.097407+08:00 uos-PC kernel: usb 2-3: Manufacturer: GenesysLogic
2026-06-30T14:43:02.104615+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: add ep 0x81, slot id 7, new drop flags = 0x0, new add flags = 0x8
2026-06-30T14:43:02.104621+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_check_bandwidth called for udev 00000000a337f2a6
2026-06-30T14:43:02.104623+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:02.104624+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful Endpoint Configure command
2026-06-30T14:43:02.104626+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:02.104627+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Stopped on No-op or Link TRB for slot 7 ep 2
2026-06-30T14:43:02.104628+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:02.109576+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Waiting for status stage event
2026-06-30T14:43:02.109581+08:00 uos-PC kernel: hub 2-3:1.0: USB hub found
2026-06-30T14:43:02.114196+08:00 uos-PC kernel: hub 2-3:1.0: 4 ports detected
2026-06-30T14:43:02.116611+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xHCI version 100 needs hub TT think time and number of ports
2026-06-30T14:43:02.116616+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Set up configure endpoint for hub device.
2026-06-30T14:43:02.116618+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:02.116620+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful Endpoint Configure command
2026-06-30T14:43:02.172621+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:02.172633+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Slot 8 output ctx = 0x0x000000201ef4a000 (dma)
2026-06-30T14:43:02.172634+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Slot 8 input ctx = 0x0x000000201c0a8000 (dma)
2026-06-30T14:43:02.172635+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Set slot id 8 dcbaa entry 00000000a0b955d3 to 0x201ef4a000
2026-06-30T14:43:02.200613+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_hub_status_data: stopping usb2 port polling
2026-06-30T14:43:02.896624+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:02.896639+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Bad real port.
2026-06-30T14:43:02.896640+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:02.896641+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Slot 8 output ctx = 0x0x000000201ef4a000 (dma)
2026-06-30T14:43:02.896642+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Slot 8 input ctx = 0x0x000000201c0a8000 (dma)
2026-06-30T14:43:02.896643+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Set slot id 8 dcbaa entry 00000000a0b955d3 to 0x201ef4a000
2026-06-30T14:43:02.912612+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
2026-06-30T14:43:02.980114+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Set root hub portnum to 3
2026-06-30T14:43:02.980120+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Set fake root hub portnum to 3
2026-06-30T14:43:02.980121+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: udev->tt = 0000000000000000
2026-06-30T14:43:02.980122+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: udev->ttport = 0x0
2026-06-30T14:43:02.980123+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:02.980124+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful setup address command
2026-06-30T14:43:02.980125+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Op regs DCBAA ptr = 0x0000201d47a000
2026-06-30T14:43:02.980126+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Slot ID 8 dcbaa entry @00000000a0b955d3 = 0x0000201ef4a000
2026-06-30T14:43:02.980127+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Output Context DMA address = 0x201ef4a000
2026-06-30T14:43:02.980128+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Internal device address = 8
2026-06-30T14:43:02.980129+08:00 uos-PC kernel: usb 2-3.1: new SuperSpeed USB device number 4 using xhci_hcd
2026-06-30T14:43:03.011180+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Waiting for status stage event
2026-06-30T14:43:03.011183+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Waiting for status stage event
2026-06-30T14:43:03.011184+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Waiting for status stage event
2026-06-30T14:43:03.011185+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Waiting for status stage event
2026-06-30T14:43:03.011187+08:00 uos-PC kernel: usb 2-3.1: New USB device found, idVendor=0bda, idProduct=8153, bcdDevice=31.00
2026-06-30T14:43:03.011189+08:00 uos-PC kernel: usb 2-3.1: New USB device strings: Mfr=1, Product=2, SerialNumber=6
2026-06-30T14:43:03.023351+08:00 uos-PC kernel: usb 2-3.1: Product: USB 10/100/1000 LAN
2026-06-30T14:43:03.023355+08:00 uos-PC kernel: usb 2-3.1: Manufacturer: Realtek
2026-06-30T14:43:03.032041+08:00 uos-PC kernel: usb 2-3.1: SerialNumber: 001000001
2026-06-30T14:43:03.032615+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: add ep 0x83, slot id 8, new drop flags = 0x0, new add flags = 0x80
2026-06-30T14:43:03.032621+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_check_bandwidth called for udev 00000000cdc8c433
2026-06-30T14:43:03.032623+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.036616+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful Endpoint Configure command
2026-06-30T14:43:03.036623+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.036624+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Stopped on No-op or Link TRB for slot 8 ep 6
2026-06-30T14:43:03.036625+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.036626+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Waiting for status stage event
2026-06-30T14:43:03.052620+08:00 uos-PC kernel: usbcore: registered new device driver r8152-cfgselector
2026-06-30T14:43:03.052631+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_drop_endpoint called for udev 00000000cdc8c433
2026-06-30T14:43:03.052633+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: drop ep 0x83, slot id 8, new drop flags = 0x80, new add flags = 0x0
2026-06-30T14:43:03.052634+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_check_bandwidth called for udev 00000000cdc8c433
2026-06-30T14:43:03.052635+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.052636+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful Endpoint Configure command
2026-06-30T14:43:03.052644+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_check_bandwidth called for udev 00000000cdc8c433
2026-06-30T14:43:03.056616+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: add ep 0x83, slot id 8, new drop flags = 0x0, new add flags = 0x81
2026-06-30T14:43:03.056622+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_check_bandwidth called for udev 00000000cdc8c433
2026-06-30T14:43:03.056623+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.056624+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful Endpoint Configure command
2026-06-30T14:43:03.056626+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.056627+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Stopped on No-op or Link TRB for slot 8 ep 6
2026-06-30T14:43:03.056628+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.060626+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_drop_endpoint called for udev 00000000cdc8c433
2026-06-30T14:43:03.060632+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: drop ep 0x83, slot id 8, new drop flags = 0x80, new add flags = 0x0
2026-06-30T14:43:03.060633+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_check_bandwidth called for udev 00000000cdc8c433
2026-06-30T14:43:03.060634+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.060636+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful Endpoint Configure command
2026-06-30T14:43:03.060637+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: add ep 0x81, slot id 8, new drop flags = 0x0, new add flags = 0x8
2026-06-30T14:43:03.060638+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: add ep 0x2, slot id 8, new drop flags = 0x0, new add flags = 0x18
2026-06-30T14:43:03.060639+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: add ep 0x83, slot id 8, new drop flags = 0x0, new add flags = 0x98
2026-06-30T14:43:03.060640+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_check_bandwidth called for udev 00000000cdc8c433
2026-06-30T14:43:03.060641+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.060642+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful Endpoint Configure command
2026-06-30T14:43:03.060643+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.060643+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Stopped on No-op or Link TRB for slot 8 ep 2
2026-06-30T14:43:03.060644+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.064613+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.064617+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Stopped on No-op or Link TRB for slot 8 ep 3
2026-06-30T14:43:03.064618+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.064620+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.064621+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Stopped on No-op or Link TRB for slot 8 ep 6
2026-06-30T14:43:03.064622+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.072611+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
2026-06-30T14:43:03.088620+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: ep 0x81 - asked for 2 bytes, 1 bytes untransferred
2026-06-30T14:43:03.150213+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Resetting device with slot ID 8
2026-06-30T14:43:03.150219+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.150220+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Completed reset device command.
2026-06-30T14:43:03.150221+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful reset device command.
2026-06-30T14:43:03.158967+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.158973+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful setup address command
2026-06-30T14:43:03.158974+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Op regs DCBAA ptr = 0x0000201d47a000
2026-06-30T14:43:03.158975+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Slot ID 8 dcbaa entry @00000000a0b955d3 = 0x0000201ef4a000
2026-06-30T14:43:03.158977+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Output Context DMA address = 0x201ef4a000
2026-06-30T14:43:03.158978+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Internal device address = 8
2026-06-30T14:43:03.158979+08:00 uos-PC kernel: r8152-cfgselector 2-3.1: reset SuperSpeed USB device number 4 using xhci_hcd
2026-06-30T14:43:03.180095+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Waiting for status stage event
2026-06-30T14:43:03.180609+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: add ep 0x81, slot id 8, new drop flags = 0x0, new add flags = 0x8
2026-06-30T14:43:03.180612+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: add ep 0x2, slot id 8, new drop flags = 0x0, new add flags = 0x18
2026-06-30T14:43:03.180613+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: add ep 0x83, slot id 8, new drop flags = 0x0, new add flags = 0x98
2026-06-30T14:43:03.180615+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_check_bandwidth called for udev 00000000cdc8c433
2026-06-30T14:43:03.180617+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.184616+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful Endpoint Configure command
2026-06-30T14:43:03.184621+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.184622+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Stopped on No-op or Link TRB for slot 8 ep 2
2026-06-30T14:43:03.184623+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.184625+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.184626+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Stopped on No-op or Link TRB for slot 8 ep 3
2026-06-30T14:43:03.188613+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.188618+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.188619+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Stopped on No-op or Link TRB for slot 8 ep 6
2026-06-30T14:43:03.188620+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.256613+08:00 uos-PC kernel: r8152 2-3.1:1.0: load rtl8153b-2 v2 04/27/23 successfully
2026-06-30T14:43:03.324911+08:00 uos-PC kernel: r8152 2-3.1:1.0 eth0: v1.12.13
2026-06-30T14:43:03.324920+08:00 uos-PC kernel: usbcore: registered new interface driver r8152
2026-06-30T14:43:03.342181+08:00 uos-PC kernel: usbcore: registered new interface driver cdc_ether
2026-06-30T14:43:03.342195+08:00 uos-PC kernel: usbcore: registered new interface driver r8153_ecm
2026-06-30T14:43:03.352647+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Stalled endpoint for slot 8 ep 0
2026-06-30T14:43:03.352664+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Hard-reset ep 0, slot 8
2026-06-30T14:43:03.352666+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.352667+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Ignoring reset ep completion code of 1
2026-06-30T14:43:03.352669+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Removing canceled TD starting at 0x20109093b0 (dma) in stream 0 URB 000000002767c1a4
2026-06-30T14:43:03.352671+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Set TR Deq ptr 0x20109093e0, cycle 0
2026-06-30T14:43:03.352672+08:00 uos-PC kernel:
2026-06-30T14:43:03.352673+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.352674+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_giveback_invalidated_tds: Keep cancelled URB 000000002767c1a4 TD as cancel_status is 2
2026-06-30T14:43:03.352675+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful Set TR Deq Ptr cmd, deq = @20109093e0
2026-06-30T14:43:03.352677+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_handle_cmd_set_deq: Giveback cancelled URB 000000002767c1a4 TD
2026-06-30T14:43:03.352678+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Giveback URB 000000002767c1a4, len = 0, expected = 1024, status = -32
2026-06-30T14:43:03.352679+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
2026-06-30T14:43:03.368686+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Stalled endpoint for slot 8 ep 0
2026-06-30T14:43:03.368695+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Hard-reset ep 0, slot 8
2026-06-30T14:43:03.368696+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.368697+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Ignoring reset ep completion code of 1
2026-06-30T14:43:03.368698+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Removing canceled TD starting at 0x20109093e0 (dma) in stream 0 URB 00000000d290122d
2026-06-30T14:43:03.368700+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Set TR Deq ptr 0x2010909410, cycle 0
2026-06-30T14:43:03.368701+08:00 uos-PC kernel:
2026-06-30T14:43:03.368702+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.368702+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_giveback_invalidated_tds: Keep cancelled URB 00000000d290122d TD as cancel_status is 2
2026-06-30T14:43:03.368789+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful Set TR Deq Ptr cmd, deq = @2010909410
2026-06-30T14:43:03.368801+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_handle_cmd_set_deq: Giveback cancelled URB 00000000d290122d TD
2026-06-30T14:43:03.368802+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Giveback URB 00000000d290122d, len = 0, expected = 1024, status = -32
2026-06-30T14:43:03.368803+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
2026-06-30T14:43:03.380623+08:00 uos-PC kernel: r8152 2-3.1:1.0 enx2c16dba85d18: renamed from eth0
2026-06-30T14:43:03.444727+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Cancel URB 00000000f6111d3d, dev 3, ep 0x81, starting at offset 0x201a8a5230
2026-06-30T14:43:03.444741+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.444742+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Stopped on Transfer TRB for slot 6 ep 2
2026-06-30T14:43:03.444743+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Removing canceled TD starting at 0x201a8a5230 (dma) in stream 0 URB 00000000f6111d3d
2026-06-30T14:43:03.444745+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Set TR Deq ptr 0x201a8a5240, cycle 1
2026-06-30T14:43:03.444746+08:00 uos-PC kernel:
2026-06-30T14:43:03.444748+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.444761+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_giveback_invalidated_tds: Keep cancelled URB 00000000f6111d3d TD as cancel_status is 2
2026-06-30T14:43:03.444762+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful Set TR Deq Ptr cmd, deq = @201a8a5240
2026-06-30T14:43:03.444763+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_handle_cmd_set_deq: Giveback cancelled URB 00000000f6111d3d TD
2026-06-30T14:43:03.444765+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Giveback URB 00000000f6111d3d, len = 0, expected = 1, status = -115
2026-06-30T14:43:03.444765+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell
2026-06-30T14:43:03.444766+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:03.448630+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Stopped on No-op or Link TRB for slot 6 ep 0
2026-06-30T14:43:03.448637+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Set port 1-3 link state, portsc: 0xe03, write 0x10e61
2026-06-30T14:43:10.046898+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Transfer error for slot 8 ep 6 on endpoint
2026-06-30T14:43:10.046913+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Soft-reset ep 6, slot 8
2026-06-30T14:43:10.046914+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:10.048614+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Ignoring reset ep completion code of 1
2026-06-30T14:43:10.054899+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Port change event, 2-3, id 3, portsc: 0x202c0
2026-06-30T14:43:10.054906+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: handle_port_status: starting usb2 port polling.
2026-06-30T14:43:10.054908+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 2-3 read: 0x202c0, return 0x102c0
2026-06-30T14:43:10.054909+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: clear port3 connect change, portsc: 0x2c0
2026-06-30T14:43:10.060700+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Port change event, 1-3, id 7, portsc: 0x202a0
2026-06-30T14:43:10.060704+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: handle_port_status: starting usb1 port polling.
2026-06-30T14:43:10.060704+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 1-3 read: 0x202a0, return 0x10100
2026-06-30T14:43:10.060705+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: clear port3 connect change, portsc: 0x2a0
2026-06-30T14:43:10.060707+08:00 uos-PC kernel: usb 1-3: USB disconnect, device number 6
2026-06-30T14:43:10.064693+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_drop_endpoint called for udev 00000000549dc7fd
2026-06-30T14:43:10.064706+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: drop ep 0x81, slot id 6, new drop flags = 0x8, new add flags = 0x0
2026-06-30T14:43:10.064707+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_check_bandwidth called for udev 00000000549dc7fd
2026-06-30T14:43:10.064708+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:10.064709+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful Endpoint Configure command
2026-06-30T14:43:10.064710+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:10.064711+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Transfer error for slot 8 ep 6 on endpoint
2026-06-30T14:43:10.064712+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 1-3 read: 0x2a0, return 0x100
2026-06-30T14:43:10.085597+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 2-3 read: 0x2a0, return 0x2a0
2026-06-30T14:43:10.085608+08:00 uos-PC kernel: usb 2-3: USB disconnect, device number 3
2026-06-30T14:43:10.091979+08:00 uos-PC kernel: r8152-cfgselector 2-3.1: USB disconnect, device number 4
2026-06-30T14:43:10.092614+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Cancel URB 0000000031fec43b, dev 3.1, ep 0x83, starting at offset 0x2023d4ece0
2026-06-30T14:43:10.092619+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Invalidating TDs instantly on slot 8 ep 6 in state 0x400
2026-06-30T14:43:10.092620+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Removing canceled TD starting at 0x2023d4ece0 (dma) in stream 0 URB 0000000031fec43b
2026-06-30T14:43:10.092622+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_giveback_invalidated_tds: Giveback cancelled URB 0000000031fec43b TD
2026-06-30T14:43:10.104623+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 1-3 read: 0x2a0, return 0x100
2026-06-30T14:43:10.136612+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_hub_status_data: stopping usb1 port polling
2026-06-30T14:43:10.136617+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_hub_status_data: stopping usb2 port polling
2026-06-30T14:43:10.136621+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 1-3 read: 0x2a0, return 0x100
2026-06-30T14:43:10.156629+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_drop_endpoint called for udev 00000000cdc8c433
2026-06-30T14:43:10.156641+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: drop ep 0x81, slot id 8, new drop flags = 0x8, new add flags = 0x0
2026-06-30T14:43:10.156642+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_drop_endpoint called for udev 00000000cdc8c433
2026-06-30T14:43:10.156644+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: drop ep 0x2, slot id 8, new drop flags = 0x18, new add flags = 0x0
2026-06-30T14:43:10.156645+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_drop_endpoint called for udev 00000000cdc8c433
2026-06-30T14:43:10.156646+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: drop ep 0x83, slot id 8, new drop flags = 0x98, new add flags = 0x0
2026-06-30T14:43:10.156663+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_check_bandwidth called for udev 00000000cdc8c433
2026-06-30T14:43:10.156665+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:10.156666+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful Endpoint Configure command
2026-06-30T14:43:10.156667+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: endpoint disable with ep_state 0x400
2026-06-30T14:43:10.156668+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:10.156669+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Cancel URB 00000000480e2473, dev 3, ep 0x81, starting at offset 0x2006cb4030
2026-06-30T14:43:10.156670+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:10.156671+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Stopped on Transfer TRB for slot 7 ep 2
2026-06-30T14:43:10.156672+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Removing canceled TD starting at 0x2006cb4030 (dma) in stream 0 URB 00000000480e2473
2026-06-30T14:43:10.156673+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_giveback_invalidated_tds: Giveback cancelled URB 00000000480e2473 TD
2026-06-30T14:43:10.156674+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Giveback URB 00000000480e2473, len = 0, expected = 2, status = -115
2026-06-30T14:43:10.160626+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_drop_endpoint called for udev 00000000a337f2a6
2026-06-30T14:43:10.160637+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: drop ep 0x81, slot id 7, new drop flags = 0x8, new add flags = 0x0
2026-06-30T14:43:10.160638+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_check_bandwidth called for udev 00000000a337f2a6
2026-06-30T14:43:10.160639+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:10.160640+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Successful Endpoint Configure command
2026-06-30T14:43:10.160641+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: endpoint disable with ep_state 0x400
2026-06-30T14:43:10.160642+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: // Ding dong!
2026-06-30T14:43:10.160650+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 2-3 read: 0x2a0, return 0x2a0
2026-06-30T14:43:10.176614+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 1-3 read: 0x2a0, return 0x100
2026-06-30T14:43:10.200616+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 2-3 read: 0x2a0, return 0x2a0
2026-06-30T14:43:10.212610+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 1-3 read: 0x2a0, return 0x100
2026-06-30T14:43:10.236614+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 2-3 read: 0x2a0, return 0x2a0
2026-06-30T14:43:10.276618+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 2-3 read: 0x2a0, return 0x2a0
2026-06-30T14:43:10.316618+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: Get port status 2-3 read: 0x2a0, return 0x2a0
2026-06-30T14:43:10.316626+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: set port remote wake mask, actual port 2-1 status  = 0xe0002a0
2026-06-30T14:43:10.316627+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: set port remote wake mask, actual port 2-2 status  = 0xe001263
2026-06-30T14:43:10.316628+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: set port remote wake mask, actual port 2-3 status  = 0xe0002a0
2026-06-30T14:43:10.316629+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: set port remote wake mask, actual port 2-4 status  = 0xe0002a0
2026-06-30T14:43:10.316631+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: xhci_hub_status_data: stopping usb2 port polling

----- test log end -----


Tested-by: Xu Rao <raoxu@uniontech.com>

Thanks,
Xu Rao
