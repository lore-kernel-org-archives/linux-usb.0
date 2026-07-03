Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCD73CEB8D;
	Fri,  3 Jul 2026 12:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080133; cv=none; b=c/HiYXlUss9qF6OozypHtS27OHh8xBQGXUKT6nCOfN7wzRXt3noHivlD83w+ZH3B/Sezn03GcLG2XD7JE6t8M5j0F7OEb3ZzHMdDjpS9dEx4tCPyi06NNkziSybb+OH4xEdcr8zJ41ph2bGS2sbJsoulo6sdc4BhiAZZj1l7IEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080133; c=relaxed/simple;
	bh=QBXmSR8CbCv0iJTrF7jkCvXfukfcP20q4e/48osmbbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZirjMW2Fq0OK3kghTCt9/1ci5F06hte8cC4D4teU7dPrJjRtJYKfL8bq0n9JCO/A8PfIeJlyXVUvr6QVo/w5DiH0nh4Ei7LatjZ4KzHs/AcCmgE8yxuMKU27OEbtbjevEVhG9WNK7S7Bm27DA0sRIlyAeDaWXTEcwHMQlr4NWKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foobox.net; spf=pass smtp.mailfrom=foobox.net; dkim=pass (2048-bit key) header.d=foobox.net header.i=@foobox.net header.b=Ky0z36in; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gEPSGz/O; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foobox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foobox.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foobox.net header.i=@foobox.net header.b="Ky0z36in";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gEPSGz/O"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DA4C07A0070;
	Fri,  3 Jul 2026 08:02:09 -0400 (EDT)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-03.internal (MEProxy); Fri, 03 Jul 2026 08:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foobox.net; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1783080129; x=1783166529; bh=xDv+XiFyxT+QQ6gO6SDKh
	yosjGdK9Jxsfr4Th7O2vO0=; b=Ky0z36inf7DiRvEW8Zynqh+TpvdF0xYv/8HfA
	hANYE1wsdOsPvaylqI1eToQXxVpGU+3OarhugcWlllIqx9qEhO1KGIZg5XhWUWfQ
	kfNtJjhaEMXAod8Yy5CRU0l0G3AyrvWnvYflxCu3mpTmizqh3s7bEHSFUlOKYE85
	Nr7/byemGZzMbF/EH08dvZwEx6xnlnkL8TA36iY14Q2Uxp6gmO2XAm8RqAcVybQC
	i8lD5lKj7knT6tgqHulOpUOrFZJpGH7ElTmnvd4xiENOG1L/S8iRuC7mewS4pkN7
	r6gFhwfct9pTh0vCkpraqm1pmCiNLIcX8RHaLK1bweawC2S0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783080129; x=1783166529; bh=xDv+XiFyxT+QQ6gO6SDKhyosjGdK9Jxsfr4
	Th7O2vO0=; b=gEPSGz/OEmMnIwBaHKd4fY9SN7DgMvxE0oIiK3SmqqezxHl3pPz
	D6jfTmXkAC9rV6fz7kdP104VfhXCb3QEep8harrrBl3maiYjJyb0IHlk79j0RglT
	aE0Y57KvPc7pshg/tCmG0933j+UJRtVI/8D2g50aQEEbUswhDz6DvqkXXkaiShVo
	JwR8CHe4FPPKpDsK4uPZSsFmK2cdl1CwX+L9dr6N/N7lzmGGfpP7Cd9piZPSK9n2
	X2NcBEdKdiBxvuRYROXjAxLPpzaBz1nWBp6ymomiVRTxxP9uxqMyq2M4Q3hVWIKG
	9qPHyWCimIQN9wbP780DCU9SkcZoO4yiyNw==
X-ME-Sender: <xms:waRHavCJL7jXPnnJDzb1TswTZoFF_q-CsvQ5S1z5vACCxVLWOkR6Xw>
    <xme:waRHamPJGvpvvUmhb4Lwqvn_sSiQ5xUr4SyaTA8KwlSUKKkE5awYgoZWY994JrgO6
    sdhJ7ssZ7a_E3Gpd4pxNWadxAgs8OOmshg7sW4J6_EWdDCW3mNfdQ>
X-ME-Received: <xmr:waRHaoyFT1eUWs_X4mburBIxqQkIUMK3c6zt7TYkbNWA-brkA9oprkj_WU53pYL2qhQF9OH0bYf_x-oB5aURl4tsrgYT0QeHOtpujinP4Ig>
X-ME-Proxy-Cause: dmFkZTGzpG+XoiW/tvA/e4kfbsnqtVJJ0ypEeYOA3PNTdJOwWh1qJE7A9/q4MLUfz+B4h4
    yS3+QL2eCy7Lq/11P0B+yfJk0Cv0Kjwr0mfSg/hE0qQKTD6zB3xqsACKSBDwskLMxsOgQI
    09+9+aFJuVZNx4a/AYd/f0Xm2bzvrxs1O/wjPaSZjCZ6S+U7e2qkfKFhv/cJ586bFOByQR
    JPWZEIcJlOt362ssLjFv2Fv85sAhbZdJreBsm44QUwkxRHdCiDjz5RhIQ5cV47G19Zq98h
    oE+f9s1KPzAaTe4eB1b9dDEoDCvXtlaJ2aOdPIZ5YtoQHYaSrN4ULEQJIeA6Qn5ipaNZaA
    toEj2EmOTajz9EfrbJAk6l3J8oRVlbapMTQ9svCD8e9CTD0iEUHGMhIKSgvHjpUhPznJ3Q
    8jHiQ1bAVaQlvwUbChrhiqegWuAuww+qafZEaaqVUQhrZOusX1pEACz7kstHQeo2xCXIe1
    du7HvB//TdP9S2Ueo5k4zqRJKs0FOPUfPMmMAVYm+mPhNbadgGeSy8Hxlf/KsulCBhRqDQ
    cSKWZXYlIPmfdgFZsOXXzx0y9DRWApIYAAEX+2//YH2zjKm1PufJ5pX9WJS76hsDMzHT7S
    0yif9QoTA+Amx/uifMpSj/NYigCRWunnvQf8txazN/8A9yALuRbP6liE27Gw
X-ME-Proxy: <xmx:waRHamUENXYAazrDUN7q-R8netZtpbjfM5nL_Ey6B5kyz6JRqDpPTg>
    <xmx:waRHaqP4ew1rWxOZYZ-aWWOaqp0tgO4wsJlbBmMbMq4EuOJRxrTYnQ>
    <xmx:waRHaoBK2D2H6Fv6bkkSNgOgvbb-vnnzf8THpkJ5-LstPTPJ8-GeLA>
    <xmx:waRHand2k-mPjEkqX7PjwuTyZJkV-PqXhnlkK2cKuhx3QefgSLuzUA>
    <xmx:waRHaj9vS9rMmjKSqmklVatuvJ3wEzHW2-Yf_7s-EReUYNC56FPHXBW8>
Feedback-ID: i7f494978:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jul 2026 08:02:06 -0400 (EDT)
From: Ihor Matushchak <ihor.matushchak@foobox.net>
To: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>
Subject: [PATCH] usb: cdns3: plat: fix a typo in cdns3_plat_probe()
Date: Fri,  3 Jul 2026 14:01:36 +0200
Message-ID: <20260703120136.19852-1-ihor.matushchak@foobox.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes typos in dev_err_probe(): 'cdn3,usb*-phy' -> 'cdns3,usb*-phy'.

Signed-off-by: Ihor Matushchak <ihor.matushchak@foobox.net>
---
 drivers/usb/cdns3/cdns3-plat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index bb5405460035..e3f32c3e9535 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -147,12 +147,12 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 	cdns->usb2_phy = devm_phy_optional_get(dev, "cdns3,usb2-phy");
 	if (IS_ERR(cdns->usb2_phy))
 		return dev_err_probe(dev, PTR_ERR(cdns->usb2_phy),
-				     "Failed to get cdn3,usb2-phy\n");
+				     "Failed to get cdns3,usb2-phy\n");
 
 	cdns->usb3_phy = devm_phy_optional_get(dev, "cdns3,usb3-phy");
 	if (IS_ERR(cdns->usb3_phy))
 		return dev_err_probe(dev, PTR_ERR(cdns->usb3_phy),
-				     "Failed to get cdn3,usb3-phy\n");
+				     "Failed to get cdns3,usb3-phy\n");
 
 	ret = phy_init(cdns->usb2_phy);
 	if (ret)
-- 
2.53.0

