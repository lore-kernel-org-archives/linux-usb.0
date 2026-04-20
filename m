Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250AD13B584;
	Mon, 20 Apr 2026 03:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776657450; cv=none; b=kRsiCeG2zOSLuqiqu7xcmeJAQXuooj5nDoNyfDSW0qxwxj0ZLXDd9woQdk07S5712mWmZT+fk8fNTnpVFUtGXXPQY1EyHWjYnCJsImeYBJx0K5PzF8CWCq5eQ5GwCpsltEZj41K/CoJL0gs7oTVWwILQEQofA+Tu8xjnvaW7t1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776657450; c=relaxed/simple;
	bh=ad/XCDKck9NcZuKa5HD8OwSrQnDV5sTvnOYcfa7qE2A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Do59fEVQ/vy53nBNx8E1Thb1dDtDLlI90iJd/OYOLqN7ZOnnZaX81tfSU8LkDnxljwnSrtqhNLPqDYpZTT+o9R+hGOQxnyGAhS8s0GVTg+/0wXeDFPscEazVzeiJI4Y6oivMBNazeazr9AcB5Kp2oTCxa2tS4c12CixIZG6p7Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b=LoUSSQDE; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b="LoUSSQDE"
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=I5UOueYp9feQylzzRuyazaVAQaA+VKjOi0/D7gOw3yc=;
	b=LoUSSQDELG/FryO/dAORo6HWp81sCO5/pquw1sqJl4GsglWBh4OUOUUaQwZoPy5PGFwBrAUmA
	6aDe0Dvtt6JG2HXEdMDuJmQAXmIrRaKtvj/awPQMM1nqyVa7QfbOYxsbSWrQHSIuvIXeRU3CfTb
	49wILPVVPO1+qV2owuCsYx0=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fzWjx08tXzKm5G;
	Mon, 20 Apr 2026 11:51:01 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 2CE384055B;
	Mon, 20 Apr 2026 11:57:24 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 20 Apr 2026 11:57:23 +0800
Received: from localhost.localdomain (10.50.163.32) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 20 Apr 2026 11:57:23 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <gregkh@linuxfoundation.org>, <khtsai@google.com>, <hhhuuu@google.com>,
	<kees@kernel.org>, <kexinsun@smail.nju.edu.cn>
CC: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linuxarm@huawei.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>
Subject: [PATCH v1 0/2] usb: gadget: udc: simplify lock holding using guards 
Date: Mon, 20 Apr 2026 11:57:20 +0800
Message-ID: <20260420035722.1133418-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemn100009.china.huawei.com (7.202.194.112)

Simplify udc_lock and connect_lock holding using guards in
gadget_bind_driver() and gadget_unbind_driver().

Huisong Li (2):
  usb: gadget: udc: simplify udc_lock holding using guards
  usb: gadget: udc: simplify connect_lock holding using guards

 drivers/usb/gadget/udc/core.c | 77 ++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 42 deletions(-)

-- 
2.33.0

