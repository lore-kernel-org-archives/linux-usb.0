Received: from mr6.vodafonemail.de (mr6.vodafonemail.de [145.253.228.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C1A497B60
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 13:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.253.228.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341514; cv=none; b=UOi+iokgdilMTnaZKf8to9wxGrbHwY7CUHRGIyH3cteFHa1fSgvM0puhpDgJW2KOqrgBSjcDURrDptFO9/fta4vXA/244aXRzLsArHQnFQZZyUet/XKGG1Gy+NbhBwfDyfx6qa6fqMoDvezk70nDCFo1BAaum+N3RFBFfUr64GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341514; c=relaxed/simple;
	bh=9d8cmcpjqNwQvPyemlsTmHG6zcNp+0HqZBBQgvlnp9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fxsutvp0LjSm5SiTtqajveLFCsyMoK1xApJq/BJnfxgLWyPIKBRu2wDGUwhaBPK1lQUXf0ABcdNdeSIF64TwBvr9P833DfjcWBY5zk2j5U3JMegAgsXq4dfELAw+TkZFvCmavB9dNvpWZm3OWxhQhJMpDEni1dEM1dL9+BfKgio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arcor.de; spf=pass smtp.mailfrom=arcor.de; dkim=pass (1024-bit key) header.d=arcor.de header.i=@arcor.de header.b=CmwgdXdo; arc=none smtp.client-ip=145.253.228.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arcor.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arcor.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arcor.de header.i=@arcor.de header.b="CmwgdXdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
	s=vfde-mb-mr2-23sep; t=1790341029;
	bh=IRodS0Cnbs3mEsRwBBztGKFjR9dO2kjPlGhwsmcc/6I=;
	h=Date:From:To:Subject:Message-ID:Content-Type:From;
	b=CmwgdXdobf66dgGTeDCbYB82QhLLQyVoM+oOBIlqGM18rbaHthf84Ix8ZO4bhV85Q
	 NTDmcJapMwngB6VAtxsfK5BNauCynE6qKtdZa2BMgRou2r8IZ1kzUFQusqcPeWrESg
	 xoUzaznF8LaFvIKn66KLwQEZmWGdWZMA08soOJ9g=
Received: from smtp.vodafone.de (unknown [10.5.0.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mr6.vodafonemail.de (Postfix) with ESMTPS id 4hrrM93RZYz3sTjW;
	Fri, 25 Sep 2026 12:57:09 +0000 (UTC)
Received: from arcor.de (p5b281a72.dip0.t-ipconnect.de [91.40.26.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.vodafone.de (Postfix) with ESMTPSA id 4hrrM16GQpz9054;
	Fri, 25 Sep 2026 12:56:58 +0000 (UTC)
Date: Fri, 25 Sep 2026 14:56:52 +0200
From: Reinhard Speyerer <rspmn@arcor.de>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] USB: serial: option: add Rolling Wireless RN947R
Message-ID: <arZvlM3mT-pQPHaJ@arcor.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-purgate-server: smtpa03
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 3049
X-purgate-ID: 155817::1790341025-9FE37FAA-116482B0/0/0

Add Rolling Wireless RN947R 0x9300 compositions:

Standard mode: DIAG + ADB + NMEA + MODEM + RMNET + QDSS + ADPL

T:  Bus=01 Lev=01 Prnt=01 Port=02 Cnt=02 Dev#=  6 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=33f8 ProdID=9300 Rev= 0.00
S:  Manufacturer=Rolling Wireless
S:  Product=RN947R
S:  SerialNumber=xxxxxxxxxxx
C:* #Ifs= 7 Cfg#= 1 Atr=a0 MxPwr=500mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 8 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan
E:  Ad=88(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#=21 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=70 Driver=(none)
E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#=22 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=80 Driver=(none)
E:  Ad=8a(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

QDL mode:

T:  Bus=01 Lev=01 Prnt=01 Port=02 Cnt=02 Dev#= 12 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=33f8 ProdID=9300 Rev= 0.00
S:  Manufacturer=Rolling Wireless
S:  Product=RN947R
S:  SerialNumber=xxxxxxxxxxx
C:* #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=  2mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=10 Driver=option
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Signed-off-by: Reinhard Speyerer <rspmn@arcor.de>
---
diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index e4ad14375d6a..e22f95546cfc 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2496,6 +2496,10 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(5) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x1003, 0xff),			/* Rolling RW135R-GL (laptop MBIM) */
 	  .driver_info = RSVD(5) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x33f8, 0x9300, 0xff, 0xff, 0x30) },	/* Rolling RN947R */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x33f8, 0x9300, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x33f8, 0x9300, 0xff, 0xff, 0x10),
+	  .driver_info = ZLP },
 	{ USB_DEVICE_INTERFACE_CLASS(0x3466, 0x3301, 0xff) },			/* TDTECH MT5710-CN */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54-WWD for Global */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0x00, 0x40) },
