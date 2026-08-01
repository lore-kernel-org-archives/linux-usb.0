Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FEF433E81;
	Sat,  1 Aug 2026 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785578991; cv=none; b=sF+pNJW4y4u05sELjRmcWtiwH/S+ZOv0X9NH11Q1kMGxFA6sQHjzerOXkFet8t2Jy7RQXnFCWkpCCLQ6pZoC/A6+kYTesXc20v/mJ7lPQslEKfSB3BqdSdS7c4jff+PkJdmNDPAS4KlKko/a1rMZDfDPuYAI/RqW2rnKDpjdRUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785578991; c=relaxed/simple;
	bh=bbOgKiha4GotQFEp6gkVSisdQW9VlF/rhFfK28f8MJE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h6w6FlN5G6j5wkzod16xH9uJWKexS/GOKBWHUel99Zs4irMuR5TdVshpvZuKJUhOW7Lh/t7A39LX3LHgi56MM4fdwMQRcxoTlvUKvaminq05dR/tZrgolS5luVi16K5zymnyJq0nj5IPLVL1nCFPANiKAOK22fWyxihYcDNsRFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=fail smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=YgfSTqca; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="YgfSTqca"
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6719pVkE324598;
	Sat, 1 Aug 2026 02:51:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=q/MtFn2D7
	/SDWhNuj5nJXsisX0i/gMoxKVS1PzpgxI8=; b=YgfSTqcaBxjlBBPffnR/u8J6Y
	gzC95r6G13lW7JhiRvSncksgo/TLQGcKtUPDOB1fFdj8FmKBraXx8IWUOXTN/ool
	bD4/f6NGZALMPqe5Zibv1j2OgJKtLRAksm9WvacEDP+5tX4iDvvv44WxfxUugxb3
	fQLwNuYBa2/GctB+K7fHjWiv/TxzhsvyTz/eVGXmId3u8mJeXkvmX8jismAMQycs
	YkPKnL0dyz00nIvlPFVNvsLSbocphEPTPLehdniGoSVilkNl5DWz/+IQyfOEDB6f
	9Bq8SmsgyyER2VapSmZRW6qZukIssdATrMARw3BzgJUyNvIbgLvJofvhLrLWA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4frtx7hcvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 01 Aug 2026 02:51:30 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sat, 1 Aug 2026 02:51:30 -0700
Received: from pek-lpd-ccm4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sat, 1 Aug 2026 02:51:29 -0700
From: Jiangong.Han <jiangong.han@windriver.com>
To: <gregkh@linuxfoundation.org>
CC: <kees@kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <jiangong.han@windriver.com>
Subject: [PATCH] USB: usbmon: fix null-ptr-deref in mon_bus_remove() when mon_bus_init() fails
Date: Sat, 1 Aug 2026 17:51:28 +0800
Message-ID: <20260801095128.46322-1-jiangong.han@windriver.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA3MyBTYWx0ZWRfX8hjesvYJXrOl
 UHZ8/8/SDQUo5h5lgw/xMyRiGVjdsKwyRQFROoQ0lpSjfcsE3/YjkfjlAjxBqfSis0C0FQa7Lvh
 qksIr5QW5nTPXyH/FFCr8tcb1uj6VHIjul9MAOx59TFOxXraM5EOUYHJFFgL1nLeKcDiS0dNCOi
 0PmmEwr+lZmMYNIuZTaq/rSg5h7jzNYDgl4MKgFFK8v4mgKDpU+xCemctrEdzFlhHjPofmiX3je
 9wEPEl2HdMXbKbFRdkwgVQwDWTHIKGdjb78AfN9N+XjdZWbMEZWpkblSY9JOT5ypjBkpYhHxpTA
 oSfFDLTr63SoZJ3YOZ1RqFCA/LMCeoF0+RUi3iEdNPJSChEG12eEC9QZvQFksdreZj22OP9wMan
 9afvx/02d0a/CHKXdLi/CqwRR77xAu8zPTPwNFGjvamLXltUoCjJCe2ljkHmP4wRy6DY6hCcwoQ
 OJ3+QlElkm+JcJ1ervA==
X-Authority-Analysis: v=2.4 cv=KIhqylFo c=1 sm=1 tr=0 ts=6a6dc1a3 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8
 a=Ns-D_JD0lY-C9p9CwasA:9 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ATWFWyZtJVk6exBjwyXsXZqZksn-tgje
X-Proofpoint-GUID: ATWFWyZtJVk6exBjwyXsXZqZksn-tgje
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA3MyBTYWx0ZWRfX00FCe2SLN+Zn
 GuC7uEl9SCNhmRACphOLGWHmYWobCCMxorCS3yiQJS/2/ee57zgd8dwuMdd2FJjFUUiDzeKPcmB
 TG/uN68qp+Z2GAbIylNy0lAgOmLhjeE2fBBo10dJ1+POXLCw6leI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010073

When mon_bus_init() fails to allocate the mon_bus struct, it returns
without setting ubus->mon_bus, so mbus->mon_bus remains NULL.
mon_bus_add() intentionally ignores this failure because the USB core
does not require monitoring to be established for normal operation.
However, when the HCD is later removed, usb_remove_hcd() fires the
USB_BUS_REMOVE notifier which calls mon_bus_remove(), it dereferences
ubus->mon_bus without checking for NULL, causing a null-ptr deference.

Fix this by adding a NULL check for mbus at the top of mon_bus_remove().
If mon_bus_init() failed, ubus->mon_bus is NULL, meaning the bus was
never tracked by the monitor, so there is nothing to clean up and
returning early is correct.

Reported-by: syzbot+5f4b29d9fe710a964482@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5f4b29d9fe710a964482
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Jiangong.Han <jiangong.han@windriver.com>
---
 drivers/usb/mon/mon_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/mon/mon_main.c b/drivers/usb/mon/mon_main.c
index e4fff194fea0..600c9de84c7e 100644
--- a/drivers/usb/mon/mon_main.c
+++ b/drivers/usb/mon/mon_main.c
@@ -199,6 +199,9 @@ static void mon_bus_remove(struct usb_bus *ubus)
 {
 	struct mon_bus *mbus = ubus->mon_bus;
 
+	if (mbus == NULL)
+		return;
+
 	mutex_lock(&mon_lock);
 	list_del(&mbus->bus_link);
 	if (mbus->text_inited)
-- 
2.37.3

