Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419434ADD92;
	Tue,  5 May 2026 18:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778007393; cv=none; b=f8d3Go2uADNo31qKM7TLXtVB+fReJikeLBA+p8xZl0PQtTXioQaq50qZhRweIg4HgcJ6T0CiNznbDr08REceqmxBJecyRDTdlSuZeNfljqwMr6TK1S2K6IqJPy8oBH/KPF2rbNRKHNwu6T40XJ7CwrAyNxxvRNNV4Z59rgWF89Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778007393; c=relaxed/simple;
	bh=tQpr5YJH/8dW9AfLchBUaJe6H/n7+Fla054uOgy1VlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PNMe7iyFL47bAsf1nFJkdDQVdlq8M4R3ACl2fpTM7cnbl/+aoiA92Zn5I+wQBq01/7yo9NaDEdamG/aqGPfyzVqiQ0mlMzc5t2H3WBXGkh9z34+LrDh56EX+LGg1tsPpqf817VP5GONPQGMczK0Wp9VBV6TxaxfrQ/ljUg6bDGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=mAe0BKUD; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="mAe0BKUD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YhMw+Zb2e46kjJnNejAWljKs756zJ1xMEkCq/mL93iw=; b=mAe0BKUDQbBOin0+dEGMzspelf
	KWzP5jf7vmy+jdTctTcfaVKfXe99W1dtey0qcAJP+jEyVdX39dmv/lc/SUOcFcFDAmlVTiC1AUY/H
	mvT94Ear+5civiCEDH7hf9b5cYDvbpUVo5tGMsu63JpmASABbb8BmWpGrMxQQXQkScV1+4rkTQ993
	dLG2G8QQa/bsyc25ZDq4xIVPK4TIoTwHJ1sEYYcvnrxEXGMr2aLlv3M/VjrF+ZafVTkgLlUt4wNGi
	y+URJKHfIHsG5xmpOtRnEr2ORd7d9j8YZ9HP/XqI85AcztgQK9aP0jJTjmloAd2EvS7mOFiIdGnke
	wBl/WRyg==;
Received: from 177-136-88-215.vmaxnet.com.br ([177.136.88.215] helo=[192.168.1.54])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wKKwY-006ZjB-Q4; Tue, 05 May 2026 20:56:30 +0200
From: Heitor Alves de Siqueira <halves@igalia.com>
Date: Tue, 05 May 2026 15:56:04 -0300
Subject: [PATCH v3 2/2] usb: usbtmc: reject interrupt endpoints with small
 wMaxPacketSize
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-usbtmc-iin-size-v3-2-a36113f62db7@igalia.com>
References: <20260505-usbtmc-iin-size-v3-0-a36113f62db7@igalia.com>
In-Reply-To: <20260505-usbtmc-iin-size-v3-0-a36113f62db7@igalia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Michal Pecio <michal.pecio@gmail.com>, Dave Penkler <dpenkler@gmail.com>, 
 Johan Hovold <johan@kernel.org>
Cc: kernel-dev@igalia.com, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The USB488 subclass specification requires interrupt wMaxPacketSize to
be 0x02, unless the device sends vendor-specific notifications.
Endpoints that advertise less than 2 bytes for wMaxPacketSize are
unlikely to work with the current driver, as URBs will not have enough
space for interrupt headers. Considering that any notification URBs will
be ignored by the driver, reject these endpoints early during probe.

Fixes: 041370cce889 ("USB: usbtmc: refactor endpoint retrieval")
Suggested-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Heitor Alves de Siqueira <halves@igalia.com>
---
 drivers/usb/class/usbtmc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index e15efd0c5ca7..af9ae55dae14 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -2440,6 +2440,12 @@ static int usbtmc_probe(struct usb_interface *intf,
 		data->iin_ep = int_in->bEndpointAddress;
 		data->iin_wMaxPacketSize = usb_endpoint_maxp(int_in);
 		data->iin_interval = int_in->bInterval;
+		/* wMaxPacketSize should be 0x02 or more as per USB488 Table 22 */
+		if (iface_desc->desc.bInterfaceProtocol == 1 &&
+		    data->iin_wMaxPacketSize < 2) {
+			retcode = -EINVAL;
+			goto err_put;
+		}
 		dev_dbg(&intf->dev, "Found Int in endpoint at %u\n",
 				data->iin_ep);
 	}

-- 
2.54.0

