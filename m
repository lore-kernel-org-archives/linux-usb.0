Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2684643F085;
	Thu, 16 Jul 2026 02:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784167674; cv=none; b=MPSrul0e+0BntYCBeuuRWDn9sP80j+qjJwIwmzwZuH+qDAVwzg0i5puckxUE7WtVefm/jdPKAuuk8AQXp4uPcgKZNYnR3HUHiF3GfWBOtKVD4jkINCeMbwP1fEEe98CEa8mcGATC1w1/1ymLsRBo0Kz4WFNs+l7Oj3kel+d3XcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784167674; c=relaxed/simple;
	bh=eLwGLVGqoWoplVYf+CYro9PVHtEs1eGo3Xx1UHQKrjI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g3d0E4pVR2MILXyaJWWQF0WSJbEq9pUu3IILpUyhb8oBlTQa2hy2Eiz9c9xn0ByeNWq2FDzP3qzLIV5lH/MszfY71Jxi6nGvI5s3bHhv3+X9rPBqz+sysElGNg2VD0GBt0zAfsdkarPH3EN3VYkdL7dKT0f4m9BaYgD2lT6Ks24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=Ov+qPc4T; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="Ov+qPc4T"
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G1bFqm1574923;
	Wed, 15 Jul 2026 19:07:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=B+t8sB9s9
	WIPmudK5bZeBiwQ9cd0arfb8eAh1CVihbs=; b=Ov+qPc4TZiEzGmUqTILdZWe+g
	51cN0GTQXT4rVlyQ5DJEWvy/nEHu5tNXccySiLUSYMgHP1vm9eKkDTn756j2G9Zn
	eoIotZuleTPmBbXf0zs425AfrszPdoI9b/fiaVx7qHwjhc+WdTXqy1TvMXgtOaGR
	44zNSGWufDIJq7AOtauOSP2sXxbeEASDXN2qux1WTtBLJ1oQmqWyNLzCfhyZu/8e
	5OIkglLs12bfFtci5+amouxOt72ERhNSjXSwseTwFEhg9HHXOtrmIAknbgeVH4mc
	Tma6hvm1QDjTBimfDjg4ImXEAUQtr0komyhArpeQaYABefVqWjAPMSvvjeapA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbnbdq5h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Jul 2026 19:07:17 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 15 Jul 2026 19:07:16 -0700
Received: from pek-lpd-ccm4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 15 Jul 2026 19:07:14 -0700
From: Jiangong.Han <jiangong.han@windriver.com>
To: <gregkh@linuxfoundation.org>, <surban@surban.net>
CC: <stern@rowland.harvard.edu>, <bigeasy@linutronix.de>,
        <eeodqql09@gmail.com>, <kees@kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <jiangong.han@windriver.com>
Subject: [PATCH] usb: gadget: dummy_hcd: fix IRQs-disabled violation in dummy_timer()
Date: Thu, 16 Jul 2026 10:07:13 +0800
Message-ID: <20260716020713.1698421-1-jiangong.han@windriver.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAxOCBTYWx0ZWRfX0LksNLpt5nI9
 MBwGpdJGvWmFpz71lCX2opVOOzOMZYneAqcsj6u2Ja8KqoTj/Nf//RNiy/0r/6KBhHZfe1+f/d0
 k4+9KBDhtUcpziRpTK38vinWeeOJAr2eoedXOzyvoTw50dj3jpnBk2hfAMbf4JX+SDmVqfY27QE
 8gf1tZwIMZ4gSVtO2t3hRUTNhQQGidP3KxOfKPZ4K4jzTzFJz79SfL7MSOuEks4s21eKlKdXQMM
 kkwFhMARitpoQpD6chNlvGdOKr5xUREGIH8C3nJYaBi6wO1nfgRSIbf63AMlIEBHBwCKll0fhof
 kyHTzYy/OOxc7P1PIrGOUl9+Fqoy8LV0XFSSF0faJ4jE/idVUduerZEVNT0SkpOMupXnqsCE2rP
 IWEOWeHBuKlXNi2Y2MoDjjo2oLhVl05ZxgON3xjPScR3qLrwXsj/yBEzLBZw5gyh++x7aNnMdMf
 7PS0WutK5nMDqpTOv6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAxOCBTYWx0ZWRfXy290dGuSSvMR
 HIQQaMQeUGnhp7Ebaa8rX4Nya2FNPUT9giNwZjPm76/4x8i/5DYg4riUuPxQOT9fIbuXlyc37oE
 CgJgiyUuPC9Bpir+MmV38LpcL9gaFCnfhdAulIjg5tAzb9tvxRjS
X-Authority-Analysis: v=2.4 cv=VI/tWdPX c=1 sm=1 tr=0 ts=6a583cd5 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8
 a=GZhKTXKOvnMYTLYgV84A:9 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: oHPkmYuAKXafE8xep4GqpMknX8amOqEQ
X-Proofpoint-GUID: oHPkmYuAKXafE8xep4GqpMknX8amOqEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1011 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160018

dummy_timer() acquires dum->lock using spin_lock_irqsave(), which disables
local IRQs. Before invoking URB/request completion callbacks it drops the
lock with plain spin_unlock(), which releases the spinlock but leaves IRQs
disabled. The completion handlers (and any code they call) then execute
with IRQs disabled.

This is illegal for any completion handler that uses spin_unlock_bh() or
any other operation that requires IRQs to be enabled.  In this case the
call chain is:

  dummy_timer      [spin_lock_irqsave]
    spin_unlock           <- IRQs still disabled
    usb_hcd_giveback_urb
      carl9170_usb_rx_irq_complete
        carl9170_tx_process_status
          carl9170_get_queued_skb
            spin_unlock_bh
              __local_bh_enable_ip
                lockdep_assert_irqs_enabled  <- WARN

Fix this by replacing spin_unlock() with spin_unlock_irqrestore()
before usb_hcd_giveback_urb(), so that IRQs are properly re-enabled
before invoking callbacks and re-disabled after they return.

Function usb_gadget_giveback_request() calls fifo_complete() which
does nothing, so just focus on this issue.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+381102a7292a374fe8a7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=381102a7292a374fe8a7
Signed-off-by: Jiangong.Han <jiangong.han@windriver.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index f47903461ed5..d11306202a5a 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -2001,9 +2001,9 @@ static enum hrtimer_restart dummy_timer(struct hrtimer *t)
 			ep->already_seen = ep->setup_stage = 0;
 
 		usb_hcd_unlink_urb_from_ep(dummy_hcd_to_hcd(dum_hcd), urb);
-		spin_unlock(&dum->lock);
+		spin_unlock_irqrestore(&dum->lock, flags);
 		usb_hcd_giveback_urb(dummy_hcd_to_hcd(dum_hcd), urb, status);
-		spin_lock(&dum->lock);
+		spin_lock_irqsave(&dum->lock, flags);
 
 		goto restart;
 	}
-- 
2.37.3

