Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF43495500
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 09:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789983271; cv=none; b=LVdTmBPmC6VSvz53LYCIcYMWhRoliX76dkVTC5Te46ankYZAVf1E/BvquMnYmVNuV5uoUY5azfa6UTnoBmeFQQYHRpFAp8pIVngriKZ3MoVdh0ckY7rEjg0prqMrBJh0aA3ZKDRuMP/gLG+Gp7jC29wnob9YKqveEt5lPIWt/b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789983271; c=relaxed/simple;
	bh=VDiVxS02UvU/DeJ8GhMZFJd8KjufYlSoVNBbS5euGuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SBXsS3ytUz4i2OpMtSX90b+rSz5XxuLi8vKIBkurXa5Jmkkzjkkn6yg70iE/sGMvxEP0+AgkNG1P2Ifxr4VK/iBaExsS6swxSkTSUBmSWsvXv6od8qvo8gCb0mp3hkKHxqtY6bMHFoxw89XwbmlAtp0jy75TKpn/K2mLbUA84PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cErvDhFi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cErvDhFi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so14946505e9.3
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 02:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789983268; x=1790588068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KHp+jegDUOX55mRyFE6554e6Msr1rJ/McOVQlrwyHvk=;
        b=cErvDhFigGfdKbiuM902L2yLXhtvophUV6V86cIt370TA85fqwObN4OtTMphrvkkF2
         i2yTyY75Rra4AEggTDKDi28tB56S73ymEY/wb508Bqmff1a8l+Ygjo+HMgCXifnUA1FD
         Gt/Nl+4X3e2BZClF8ruWEPQHL/egOFssbKfJtfP4t+treMaSGSL96IuTQiHSeF+350zU
         YNvB+Vf8juSd3W3mJdg9NDgJ8WHIzqnNbJZ4+jvVv45V93RsaSeVs4JjMuwBtyicRAi0
         gOl7SwJjlWVLGtLRZTVWC6IXGogbpWs1IfGLub/RtdY1PalnivH3JYZ2NTEZbg2HDWaS
         X+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789983268; x=1790588068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KHp+jegDUOX55mRyFE6554e6Msr1rJ/McOVQlrwyHvk=;
        b=D1RMBkn6XGwBE4lowSGaJHMMtONoxUbRr5lUPiI3TAV0oj3V9bepZKtdaPjfEQpX4l
         x0wKNlTsQHKQr7ead6QK3xjjm6lP8ZysdkfeM4ILgjuKl/yptCgYlCB85V+HPc5wH97W
         9wsm+/JS09kg9nprNjH0ftcCzviUnEPgwrv4lfnoRbm4V6oblxy7kZ8SwkeLfRM121Dj
         HB714dXSAoECE9o/2WvHts+TFNjHMNtOT92j24mz07w5DY4gFb7qAp+4XHzzi/Jszu8w
         CO7HH/WYiLi1bkCNfP5Vd3YUEMzN8XU4X0pxfMJ3tnJOGfpNCppavHGUKgaUfD+brW6a
         7ovQ==
X-Forwarded-Encrypted: i=1; AKwUvBymcGpaBBTvKz+iG1hNdtdQiJNLNvm4lmZ7ATm7u7kSF2oS9yWQRQpeC0wBb0gUADH8igTknWtFgOI=@vger.kernel.org
X-Gm-Message-State: AFuF++lLOHBfTvYeeXuOoJhwN3KyY+UMiklFy6FMUdkPyBN4MZd6QQpU
	d5b+Cv70twVxY8GnK2+/Cb6eAPraxrk5eRbotrQL033wx6nQ3w/g+7OF
X-Gm-Gg: AYBFou3tbNKGNJOv8zslPxq48w9MHpH63U4d6kiOAfBs1piByNyRRUWN/A/RSKgn6Vx
	GY+NVNUrLhE3d2RSIcMMI91y1lT9yFcZkpwRvKpntLnT05XhB+sMiJHn5UoJ5TVRhvrwzdIpCq6
	4hgv5//lk2BvioJyn4bxz/LyhgOceXAkgu8fahAPzjHX3Un9vguxQ3trhGiDVLQbXGCaPE6tacj
	08J00nxe3osJkfkd1zQKHKGpWEZYZ0u+IlSOzu9JTgdeNOcM/N7yatDQ2p1c/wzHCHbBQotpOn7
	23l/SXmnqyypz4CuvwEpm+CWzxh6WEsCDNTfeyi1KRwXgkMrAHhTgRs2vcj1kLD0CRZb5q1tuuj
	Bi6plXAA+zwCEyRpoFFljRF3avk5bHc2C/zjd/YOU9eMiNyFApd/VpvSZTc+Ag5CY5j0I1FUJOE
	TGg+LcFZ5w6L+CW+JQLvaoZlSvAYWNofTRAhFgq2ssRNPI08KA22y6pZHYSsZniAvsvdVAK14+4
	4+0+5S9azdwOBm4lTNydCgo6LiPooS2udyrY9/QRSMDypo=
X-Received: by 2002:a05:600c:c16a:b0:49f:ce78:356e with SMTP id 5b1f17b1804b1-49fce7836b0mr85310405e9.31.1789983267863;
        Mon, 21 Sep 2026 02:34:27 -0700 (PDT)
Received: from gil-endeavour.hs.rfd0.com (bl10-2-111.dsl.telepac.pt. [85.243.2.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcce144b1sm351916195e9.0.2026.09.21.02.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:34:27 -0700 (PDT)
From: Gilberto Conde <gilbertorconde@gmail.com>
To: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Subject: [PATCH net-next] net: usb: qmi_wwan: add Quectel EG120K-EA
Date: Mon, 21 Sep 2026 10:34:26 +0100
Message-ID: <20260921093426.2870266-1-gilbertorconde@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Quectel EG120K-EA LTE Cat.12 module (USB ID
2c7c:030b). Its QMI interface (interface 4) uses class/subclass/protocol
ff/ff/ff like the other recent Quectel modules, so match it the same way.

The product ID is shared with the EM060K, which the option driver
already knows and uses to claim the serial interfaces. Without a
qmi_wwan entry the data interface is left unbound.

Tested on a GL.iNet GL-X2000, where the module is soldered down and
enumerates at SuperSpeed: cdc-wdm0 and wwan0 appear and ModemManager
brings up a data session.

T:  Bus=02 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=5000 MxCh= 0
D:  Ver= 3.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
P:  Vendor=2c7c ProdID=030b Rev= 5.04
S:  Manufacturer=Quectel
S:  Product=EG120K-EA
S:  SerialNumber=45546267
C:* #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=896mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=40 Driver=option
E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=84(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=86(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=qmi_wwan
E:  Ad=88(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
E:  Ad=8e(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E:  Ad=0f(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I:* If#=12 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=70 Driver=(none)
E:  Ad=89(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms

Signed-off-by: Gilberto Conde <gilbertorconde@gmail.com>
---
 drivers/net/usb/qmi_wwan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index 13a5e72059..f8b771dcc9 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -1086,6 +1086,7 @@ static const struct usb_device_id products[] = {
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0125)},	/* Quectel EC25, EC20 R2.0  Mini PCIe */
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x013d)},	/* Quectel RG660QB */
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0306)},	/* Quectel EP06/EG06/EM06 */
+	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x030b)},	/* Quectel EM060K/EG120K-EA */
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0512)},	/* Quectel EG12/EM12 */
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0620)},	/* Quectel EM160R-GL */
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0800)},	/* Quectel RM500Q-GL */
-- 
2.55.0

