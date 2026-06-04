Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CF72749DC;
	Thu,  4 Jun 2026 03:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780544931; cv=none; b=TpQuSSNZ5oM3vi2UEAc6quZCjcIjBPUVAlbU6V9Yc4p50CIgHRneevIoI4tSiMnwBoA0B3gSB7WFusrxse6PCxxFcegfHhoCvT0ZsuQytJ60v+0aRcgbyIT3q+GsnDppc5Iq7HGgbgkcuxOhclHWvWCbmX1EXbBHzK90N7QFICA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780544931; c=relaxed/simple;
	bh=yNq0PaWGtoFwGiKDvPOVOuRH7x8oqWjnqxVKK8DTj6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GvEM3YBj/+mqN5lsdhH1CpYoXhhDwP7t/Pyd7ZanxRbpmgxC5DWIjg/Gu5lttkvbO2DX9a+femhz5k/EBVflKxpxdiKbfwwzLOz5u0Kt36z3+/fKhnPBpUe9o76ZNP0PSDVJBICnJrU13zjqk+7K7Kgd8J0dN7Bm5itD3L7jOtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=aB7pqUOo; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="aB7pqUOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780544906;
	bh=a9Ejd70EV9g9atNw+CS/AY0J4X8r3lcMC5oWtAu5nZY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=aB7pqUOoDpHXEPTabdYVQ7QfsjpGN4+ShnBukBoqVM59YT22qgv9WgMIWmNRZXxRD
	 OrmDNtrqy3ZNMI1hw4j1dMkzFR0zkR1zklvlaMcwLzJUqRlhusZxj4/AOLMfxyw7ZY
	 7d+KTfF6mhRAiZ1JY6bLGU+vZ+/DCptQTGDIn91Q=
X-QQ-mid: zesmtpgz4t1780544902t95181a87
X-QQ-Originating-IP: mNfA+u44ICVnVNaG6OiZD5QT3+dMFlVSq3r26mCkZbs=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Jun 2026 11:48:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1028461922281110479
EX-QQ-RecipientCnt: 5
From: raoxu <raoxu@uniontech.com>
To: mathias.nyman@intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH] usb: xhci: limit ports on the correct root hub
Date: Thu,  4 Jun 2026 11:48:18 +0800
Message-ID: <185F99CE35DA6675+20260604034818.2734932-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OFWsfmE1GYcuY1bGfR+v+LCd4BX/G88AJosJSgRs0cJBOVeLoJBbEZYg
	/AiYbZOKKmTNyKUYMV2j5+tYH9Dc44DbTCjwVO4+F4W3ZekTslGRkC7YDNoMBNiubjQ4xKD
	mWP4OkE5PC3bC7f1TWY76uTB6e9XWpcRIzcAG97KWNPwsgMb5wbfCYypgCax3Nl1HuUqzv8
	0nKi+bT6sGv//CB5m3EAMTh6Rc1YiFLIBOIb5FxlEEgq/Bb72uld1BI7sp5TKfZPdlCuM5x
	fsLuL1VtplkqpuiwYbKX/Bi8jJXC7yajdoGp1FjvVZ131eM5ZKJZTTo6uKDV5pU7UKnkNT/
	FRMdidSS/5n33Vnr4d5d+4jtIa/hdwb42LGJ/vcslHdLmNzWtDWuM8bUOfaSfPqkQIPgUJA
	Pme2+/VOGDysMGESetexIulRWJtlOdkpoEU/G0ZmXwBvDsFH01Y5/2CGC3bCWE49SuMBudH
	s5aqZZ3MxTAsgSNaP4xbn8ySPpkDLQ1cwrncl/glr/y5tJaoeIQ3B1GvrrsCiIsJWQfMuUQ
	0MmfviO/pdBIYIhkOIDeVBwuBReliktejtkBqLp07v+h24oanPQKh59GsXTbFAfbRD2C4FV
	864tm4MJr7q81erj7dom6FJ2n4MIt7RvOxjzuSSONIP1MQUoHrMJAzlZPKWFXkDHMFINGDM
	E3tKCxlJXkkN9A0MhS2mIuXMZNxt7QgcyyTOJtr2PHZ46ACitRUW0pNBpaMNCN74mnDUJze
	Nnkm+/B/y33GMK64Y+PckxNlww3eDsMEPoHnp9zEibHX1dr1pGOi4solOXMOmJmoVbzm/nY
	v1GkoMpupVIU3NIljZG9AK91h3z8ghe0FUc/uT/H1wQWQetmx+TGDhj8H75oEyrieRGaFa+
	4Ayp2jpGbt6tLBFhEFItcSlLloMmqsCYMX7zJSgZNJvKXrjMb2RY3KHrgA5KPHfcdcHNnrK
	aSR2aCO1RJ8mKDJwbo0XvNRCTVlmomUTVhDFaKc5Ib0QCYQuMaxnJfLJko4zkmRXx04A0mG
	tkh1Vf5u5rpNhUoDP9DppSvr/UVF56c+6l93LuBcqg2+nqByy0
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

xhci_create_rhub_port_array() is used for both USB2 and USB3
root hubs. The limit path always writes usb3_rhub.num_ports.

When the helper limits the USB2 root hub, this leaves the passed
root hub unchanged and modifies the wrong root hub instead.

Limit the root hub passed to the helper so the cap is applied to
the root hub currently being initialized.

Fixes: 9a7ad750a8fb ("usb: xhci: move roothub port limit validation")
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/host/xhci-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 997fe90f54e5..2545f96fd1ee 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2182,7 +2182,7 @@ static void xhci_create_rhub_port_array(struct xhci_hcd *xhci, struct xhci_hub *
 	 * descriptors aren't longer than the USB core will allocate.
 	 */
 	if (rhub->num_ports > max_ports) {
-		xhci->usb3_rhub.num_ports = max_ports;
+		rhub->num_ports = max_ports;
 		xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Limiting USB%u root hub ports to %u",
 			       rhub->maj_rev, max_ports);
 	}
--
2.50.1

