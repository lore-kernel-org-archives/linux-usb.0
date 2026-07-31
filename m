Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751813BCD1E;
	Fri, 31 Jul 2026 08:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485524; cv=none; b=I9+wOxhYnCbGu+eWkLQ+fQ9XNl4Vbf8a+89fq70HY8+7Bz9UYS+opvQfpmGnpWzs73oP2WK+RTnrxdH2SPiS7pEb8ZYSyOBqmnoNUU06MkqIWofRlHa1EYG51+uV1kaAt90D6IE/EnJBy3wJgQG/AKL/o/q7GG2MvxUcpIYliUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485524; c=relaxed/simple;
	bh=Qluwm0umj8iaSr2xYYvHfomoXlAzR7KSMhRYul7Z2xk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N1Wc0rKqOLm9vFPJ8x74UZWxcItZWWsLQpJ9OFVja3abr3hnPjT/O4m/PA5qS7b2KIbLwZ5wnXeHkd11H9VoWoaz4gC7mgEuIdJASw8GWY0mRo/ubyxvzgvP5SJ+eIIiBuGVqq+qMjuNoV2DHeRX7cT2hBFYNfKv/SugppjzIWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=fail smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=l3JnP7f7; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="l3JnP7f7"
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7xjta1640070;
	Fri, 31 Jul 2026 08:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=d1KRxCI7v
	7v0QGm/kBj91xY5IcmAK7vmUrGL8kzcM3c=; b=l3JnP7f7in0inHL3ZNJCe9R3e
	c6s1CY2MZN3biwLJGfOSRlN75Rg3aMJUwCTwDnCuTFt0k5zIn6JcylyB+n96KQe5
	ZgPetMTrpmay0hZ2ORWpgk8gExWkHsWHb2gK73xMEXVpK1ya5y66DXy9FM2YOK/q
	2XreTfgQ9g2TAjaTSxfku5ZM67vX2jyc3hk4YYBa7nlX81gEr16+i6yDHfWQ3kQ7
	RlpXYztQ6ks1yw30ELUIxGki21ov+581T51pI2TmVkqzlzAbSO3VgX3R/IfV5EAB
	3PZ9YOh1NsvKWodwJm0/U/SIU/VyyrOM87cae3log2FMOd89zqqOQIZmY4AYQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4frqbn018f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 31 Jul 2026 08:11:54 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 31 Jul 2026 01:11:53 -0700
Received: from pek-yzhou-d3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 31 Jul 2026 01:11:52 -0700
From: Yun Zhou <yun.zhou@windriver.com>
To: <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yun.zhou@windriver.com>
Subject: [PATCH] usb: gadget: f_tcm: fix deadlock in usbg_make_tpg()
Date: Fri, 31 Jul 2026 16:11:51 +0800
Message-ID: <20260731081151.285599-1-yun.zhou@windriver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1OCBTYWx0ZWRfX+TBkDeyNUMSx
 z4CrVpi70KEC6b5ho01/i+fqGzwQJUHmRLoNlPcVM+IVd0VSYSResHpODSKa7KZyLvrvrt+6yIh
 kXLtinY3ff+T6DKdFpYTrOOSNqoRkTBForeEUzCLEUH6KiHp76jscqE8RmvfRJTPOCOeCZDznB0
 0URDy9q5wyupEnH0ToJNcxbO6soT6jsYfNGU83Kh2EYEMcuViWVh6lnVTPSZMPU8OsFGDyJdSVh
 4yDOnDg5gLXj0YL4WEluKxccmuV36mVVSiQixzpxh92xKwoKrGzXXkAVzlOfsKSV+kgT6B+917y
 L8Z7CpTTTAeZborPD8JHWxG/V8aXK4B5vI6ruVJHiq2vKHOlaE4/uvYw00lMG4PzAW3YkPikkV1
 aP3zfj0rk6Xo444Z5sCoHdwzyZfcIb/TrJl8VOVgM1/4mSiUl/yNNnF78YEn8fq9GEcilXIZB/d
 6oGUH2S/fwhg62ZHB9g==
X-Proofpoint-GUID: v7ak1osDF2yFhIh_ZiIbEiU98Vs-G00p
X-Proofpoint-ORIG-GUID: v7ak1osDF2yFhIh_ZiIbEiU98Vs-G00p
X-Authority-Analysis: v=2.4 cv=W7sIkxWk c=1 sm=1 tr=0 ts=6a6c58ca cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=jo3DrBat5IEn3YIh5xUA:9 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1OCBTYWx0ZWRfXwT18AIyaoSS6
 02//rV++uPN8nA5x6swMH3ZKmUbPyzj3ojR5opibpuKyDUA9Bf2XcLez9Pc+CG5aHEaW4woS5sW
 LUeNRQ0Y1el2dfK2u1r6EDfRQTVidlV9rVVhybaHFlh8bIDrC6JJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 adultscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310058

usbg_make_tpg() held dep_lock while calling
configfs_depend_item_unlocked(), which acquires the configfs root
inode lock when operating across subsystems. This creates a circular
lock dependency with configfs_rmdir():

  dep_lock -> configfs root inode lock -> su_mutex -> dep_lock

In usbg_make_tpg(), dep_lock only serialized the read of opts->ready,
which is a monotonic flag that transitions from false to true exactly
once (in tcm_set_name()) and never reverts. Remove dep_lock from
usbg_make_tpg() entirely and use READ_ONCE/WRITE_ONCE to access
opts->ready locklessly instead.

Reported-by: syzbot+c9f9d646b08f3b6032fe@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c9f9d646b08f3b6032fe
Fixes: 4bb8548df632 ("usb: gadget: f_tcm: add configfs support")
Cc: stable@vger.kernel.org
Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
---
 drivers/usb/gadget/function/f_tcm.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index b3fa5a17fd2d..c727c19db25d 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1675,19 +1675,25 @@ static struct se_portal_group *usbg_make_tpg(struct se_wwn *wwn,
 
 	opts = container_of(tpg_instances[i].func_inst, struct f_tcm_opts,
 		func_inst);
-	mutex_lock(&opts->dep_lock);
-	if (!opts->ready)
-		goto unlock_dep;
+	if (!READ_ONCE(opts->ready))
+		goto unlock_inst;
 
 	if (opts->has_dep) {
 		if (!try_module_get(opts->dependent))
-			goto unlock_dep;
+			goto unlock_inst;
 	} else {
+		/*
+		 * configfs_depend_item_unlocked() may acquire the configfs
+		 * root inode lock when the target belongs to a different
+		 * subsystem. Calling it under dep_lock would create a
+		 * circular dependency:
+		 *   dep_lock -> configfs inode lock -> su_mutex -> dep_lock
+		 */
 		ret = configfs_depend_item_unlocked(
 			wwn->wwn_group.cg_subsys,
 			&opts->func_inst.group.cg_item);
 		if (ret)
-			goto unlock_dep;
+			goto unlock_inst;
 	}
 
 	tpg = kzalloc_obj(struct usbg_tpg);
@@ -1714,7 +1720,6 @@ static struct se_portal_group *usbg_make_tpg(struct se_wwn *wwn,
 
 	tpg_instances[i].tpg = tpg;
 	tpg->fi = tpg_instances[i].func_inst;
-	mutex_unlock(&opts->dep_lock);
 	mutex_unlock(&tpg_instances_lock);
 	return &tpg->se_tpg;
 
@@ -1727,8 +1732,6 @@ static struct se_portal_group *usbg_make_tpg(struct se_wwn *wwn,
 		module_put(opts->dependent);
 	else
 		configfs_undepend_item_unlocked(&opts->func_inst.group.cg_item);
-unlock_dep:
-	mutex_unlock(&opts->dep_lock);
 unlock_inst:
 	mutex_unlock(&tpg_instances_lock);
 
@@ -2666,9 +2669,7 @@ static int tcm_set_name(struct usb_function_instance *f, const char *name)
 
 	pr_debug("tcm: Activating %s\n", name);
 
-	mutex_lock(&opts->dep_lock);
-	opts->ready = true;
-	mutex_unlock(&opts->dep_lock);
+	WRITE_ONCE(opts->ready, true);
 
 	return 0;
 }
-- 
2.43.0

