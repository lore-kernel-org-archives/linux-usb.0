Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F40381EA3;
	Wed, 29 Jul 2026 10:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321182; cv=none; b=ffVmBe9utHxSJYN+2po6edWK7AEIJHQRhkega0YPL0/Yu/kDUdi9EFNbGhaAjrsi2DXUbtpUD9ehOKe7Ckc2QP/UU5jZM/5xzuiRn4xMsaFSlhtm5V3GQtxJ9Fbc8fVrKEXtNCAGgWIgq3+zaDXX6IkkhKlmjyOzrAX6EpgSFHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321182; c=relaxed/simple;
	bh=gSR+YRyUEccdjCLYz4d4psDyGPINF2Llxh6QiMZUgN4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SEEd3OVMf+Y9brHmJdbv44e/vD2zYBHPz66kjwDV0UDeB2BLP3UFEvDSZY58AxZhX9aho75W7HG5ezQ0P6kj81XAZsSq7rx/J3ltltQ8R9p2rg05EyjKeboFL2Dw/GJDTGEcMNrqOSQmqBZ00o9SX37WfAB8R48TA/St52E2BF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=fail smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=nh8Ea176; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="nh8Ea176"
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7d3FS1014337;
	Wed, 29 Jul 2026 03:32:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=qsaU6sXPB
	UWFe64iHHZYPW9RtvPu9kj5iJYxwc2ZgXc=; b=nh8Ea176EkpG6T+uSdQ5Z4Lan
	iQi3tmQkL+wZQRI9LEEW9vgNDtR7YN4LattjQ0GjqKS6BtoSXIk8d1hJctjSS+Yx
	xHDqLGAmxLhkewR/b5GpLXYRMJMYloZHA5X/ofY2ov1DIXdp6RZiN7gXd9Odj86H
	DgGbYVmCV/dIuGpv6FWMKGC1amjttVqba7t9Jm6D7yqjRv/TbTpDdlocSSFyWu+n
	A73q95Ae3txNIHcldX8iA3CseZvqaVVnZP8AHOvpvL4GfRRaUSsl5EnZYf3FcPWp
	JVynBWZDrCKR8TcdQjK+iZ2j6cus6t2fTImVZJqoDBPdAYbFBZP/y+c3pF6Dw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fq8840hqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 29 Jul 2026 03:32:49 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 29 Jul 2026 03:32:48 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 29 Jul 2026 03:32:46 -0700
From: Xue Lei <Xue.Lei@windriver.com>
To: <gregkh@linuxfoundation.org>, <kyungmin.park@samsung.com>,
        <andrzej.p@samsung.com>, <balbi@ti.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <Xue.Lei@windriver.com>
Subject: [PATCH] usb: gadget: f_mass_storage: reject relative paths to fix sb_writers deadlock
Date: Wed, 29 Jul 2026 18:32:45 +0800
Message-ID: <20260729103245.3744500-1-Xue.Lei@windriver.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QZ1WeMbv c=1 sm=1 tr=0 ts=6a69d6d1 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8
 a=aYVbFLsPbZdTT_ihAckA:9 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: lmSc9WD9KTNPOqZakFdCM6_0L-vn804v
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4NyBTYWx0ZWRfX39o1Ysu7KDeW
 tdmuELCvuli5Muj1dudDQ7RKFb2P2GYuvVySFA8lXIqt/tjqzcIAbKew8aTRuwPmVoK/v3713Ml
 0iT9mLdWu72UeIMnB1/iDDQyt8vu3S1Nu1NJL09GPaylkrZW1Jey
X-Proofpoint-GUID: lmSc9WD9KTNPOqZakFdCM6_0L-vn804v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4NyBTYWx0ZWRfXyBmsQlqzFd84
 NafkmI2t/H5v7K35RXwWu/XhtlOXrfWwAsAxlGmk48DaE86PHFdlkbUcvxgihZ77kBnWa6QqJh2
 c12DljvEpSrVLw6pFNtE95y4y/CrE7LpaoPIOxDAIKzaryyOdSsqfJXurP2/YpT/BgmhPmK9iRe
 JhYF23/Wqe9Eu7NzMwojqk/sAoIx1IoeF6tR5+BqiLsr+cC6U2hnIJAN+hGVo5tEySvj0EU13Vc
 IB4HIh1FXL+1Qlf5v3h++8yD76oU1MmWMtFi7tTaxyj+ZQPr/L0Kex7R3HuND4OlOOma4EzmCDc
 N05gt9QQc2QXdgB0G5EAIbJtn06OPPgiDtEe6p+Qk1EbRRzW87sjteXnfGdFCjiLiFhH8TjFhww
 49EefCCz0Skctn3IKt0Jhp+087UUYRtTxLDfJlGM01v7RlnPveG70fKBKrHTpgcYvbJ6LGZ88/O
 +4LONVDU2Hb+I3VZ9cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290087

A deadlock can occur when writing a relative path to the mass_storage
lun file attribute while the process's CWD is on the same configfs
mount:

  write(configfs_fd, "relative_path", ...)
    -> vfs_write()
      -> file_start_write()          -- acquires sb_writers (configfs sb)
        -> configfs_write_iter()
          -> fsg_store_file()
            -> fsg_lun_open()
              -> filp_open("relative_path", O_RDWR, ...)
                -> path_openat()
                  -> open_last_lookups()
                    -> mnt_want_write() -- tries to acquire same sb_writers
                       *** DEADLOCK ***

This happens because filp_open() resolves relative paths against the
task's CWD. If the CWD is on the same configfs superblock, path_openat()
calls mnt_want_write() which calls sb_start_write() on the same
superblock, causing a recursive lock acquisition that can deadlock
during filesystem freeze.

Backing file paths for mass_storage LUNs should always be absolute
paths pointing to block devices or regular files. Reject relative
paths early in fsg_store_file() to prevent this deadlock.

Reported-by: syzbot+4c9318af45f0bf2af153@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=4c9318af45f0bf2af153
Fixes: ef0aa4b92cf1 ("usb: gadget: f_mass_storage: add configfs support")
Signed-off-by: Xue Lei <Xue.Lei@windriver.com>
---
 drivers/usb/gadget/function/storage_common.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/function/storage_common.c b/drivers/usb/gadget/function/storage_common.c
index 75831f2c7abe..d45c7a34df99 100644
--- a/drivers/usb/gadget/function/storage_common.c
+++ b/drivers/usb/gadget/function/storage_common.c
@@ -448,6 +448,12 @@ ssize_t fsg_store_file(struct fsg_lun *curlun, struct rw_semaphore *filesem,
 	if (count > 0 && buf[count-1] == '\n')
 		((char *) buf)[count-1] = 0;		/* Ugh! */
 
+	/* Reject relative paths to prevent sb_writers deadlock when
+	 * CWD is on the same filesystem (e.g., configfs).
+	 */
+	if (count > 0 && buf[0] && buf[0] != '/')
+		return -EINVAL;
+
 	/* Load new medium */
 	down_write(filesem);
 	if (count > 0 && buf[0]) {
-- 
2.49.1

