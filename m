Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA92352C3C
	for <linux-usb@vger.kernel.org>; Tue,  9 Jun 2026 19:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781033799; cv=none; b=MPzUBR51CcnfUMhSDS8AMQKfsHR13lwyY+rO3k0ykADt//PmKaoiSXZlNtye3+kt4wr4M7Rd7RvUnFtTiMZgximS+AsFChFxrA0az6OkKbc/OWomOafvSm0mSHfMxDPy2jSgq8y6OoHizdi5iik3rcNOFHzGKopaQfXfTbesaOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781033799; c=relaxed/simple;
	bh=T+aPMEJT5NnNy8BkW+/rylqOBIskIu++WlFWEjTOe3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mJzhwPeo+G3i/qkrul4ujhWJMeqLgPtylsGUfIrzs5z3UEkBvtSYyFvDAtO4FmQ2c7CEojcomHBL1MQO6KHPBAkGvW6nA50Sd3c6AZcK5BjRy2DAuxLaMnHs4UBMpW7r6J4cek0GwiIoDWZhB/bLBBZhJLwt6vgz/2QmsWbS0N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PEFeRh3F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ciH76kAI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PEFeRh3F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ciH76kAI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOeLE3197410
	for <linux-usb@vger.kernel.org>; Tue, 9 Jun 2026 19:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=b3/gTmE9+0HaJh4TOwTte717fwVuFSpspy0
	hY56wF8I=; b=PEFeRh3FNCi25W3NPltGE7NaJs3dED1nbF64y/bI/XFOWje1EOk
	hNGzEsoWYS0cNV2h3FlsgZRlC+yRurSuREf6a7YrNjAikk3tE+vgJMzrFHFSeEp/
	H4lKSsge+e48dlSk13XpMf0iYdKPzNGZ+1BLGB8Y6GtoVC0kdTzlC4VNFYdOVCE9
	kICsJLRUe97MnoYkGw0xkZ9zdMKsCrqGLszmzIgeswhk6kf6Mz5ID2ZzmfIvGLRo
	InqzzpgXQGHguGUoXafwPt6AffeK0T/851pPB3GSKBPzAY/PnbQmWzhVbDwEMTCH
	SlBoJ3hNdp3d2szxl643wthmv6VtZsZkqaw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeaudww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 09 Jun 2026 19:36:37 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6605694a059so10540054d50.0
        for <linux-usb@vger.kernel.org>; Tue, 09 Jun 2026 12:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781033797; x=1781638597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b3/gTmE9+0HaJh4TOwTte717fwVuFSpspy0hY56wF8I=;
        b=ciH76kAIBnjUNLJq6zXu+6uQOaSODpL/gqygmxcV03wMfIqv8xMTvFSIb56RtIXjld
         D6nbuw3ioh+yOlQRSJmW/El18xiCdXU5kNqMp/Uq+dMVI+N9c2aeDrw+M1i6Atl0webs
         JpVdP+iZQwqPDcZE6GXpc+nzB//0SE/wX6uD4o1sanLVnz9ooqxoEcZ85Zh9EFXHjFKK
         UZghiYYyDMx8+D8YMpeArA9Bir3tKYnhhkJM9aumuM+G7zG9bMUr6zP55Ax58EvfHoeo
         05EmJ3mfWAHAXRNdDKvHuwNDo+s66zrpenFuQSbt+CdQ72+TjT3YbniA6wljJ6aFqsSp
         mUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781033797; x=1781638597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3/gTmE9+0HaJh4TOwTte717fwVuFSpspy0hY56wF8I=;
        b=bmsHVf/IT8ObcI2fw/lVdq/gyPFQSoPMbfpSa3hGhVtshQk+2gpa1g6ihQaEPSyWey
         jmYMm1JqGWYnnAbu6xaHL4NZ45zfB4F3tJYIHwCRKaTBHRvv8aCZ55xo+6MbTzsLeeNO
         JfP9i+J7t/TfXodGDoivpojoFH63GpJ3kyxp3qB3sRKqAX7aieDe2Ux7gji8QN62SE+8
         tQsmOem7JbHCYt1tZvExT1nOgeTAGyet2A0s+F0ZRK566bmf25WX91ca+yejbesdqfHu
         ZHhN33lCVHQOu2c622as4lhzogR1R1nTG+XisX4jXflOTMbOhexSfTEaQEuZ7eFeZun/
         5imQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YmkZJ4qLGy3GZztpaG4lcUkP3PXlvvLBpkZEmPhg0k4nGtHaO/IaxhQK2TvlpKOGGI3OBmyAQnms=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz00X0XUGfAmhqW/Zza7W5nvnna3N1Uwk0yBZwxSgctRA/JbBfs
	iHgqPZ3/y4CCVG9m9B0ZXg/vhTfYmg8Mwr05Aqesuby6Ttv+cuE/R2zHbDY0kvxVPMePVXBnjtC
	/CvU20iBaLEQk8BfLIoahs+2HHd5A0YDSgdGuHlvdXksFfpTRHY70p8jl3d8sIHo=
X-Gm-Gg: Acq92OHTjUgD4OuNeaqMLj/0rV35nJRtg+dFUCbI27Gr8A7K5654pEIbKF8LAO6Ye87
	W5/ef2Cpmn9ZkjR7rttaEtuXqAQXKy/ATsroNvrO9XHrOd9F/pGtmCab/ZiI80mQI61tWk6HOPm
	vpbAMPTbr91YsTf3xRM3Mfz3TDNPGN16u/zYqhygef3rD1pEwSXs8UJaKNw4AvCVRd6WevUAbC0
	BmVL1yhH1GzhslFSpOiIJS3mRLkeUnhfTCgsgqnkq+dvmYSxK0+kWNU9UAdwgaujyidnT2WiO+y
	ImjuWZIFggdMcfLOx8s8b0SR/KFEaefdLb9nQ7yfJGs/7fI2UKb4PwdzC3r3qfEJEGDE1ZNcuzO
	7KxIxMiCeDi4E4LO8zuFdCCImPwKk2LXveMUO6vg2E4cdG1ySEBBPBIHZvkkAO4kzirTZH/l0gW
	yQeWXlk3RBSyV1uXSMoA==
X-Received: by 2002:a05:690e:1c07:b0:65e:5aa3:9640 with SMTP id 956f58d0204a3-66106e51bc9mr18614809d50.25.1781033796880;
        Tue, 09 Jun 2026 12:36:36 -0700 (PDT)
X-Received: by 2002:a05:690e:1c07:b0:65e:5aa3:9640 with SMTP id 956f58d0204a3-66106e51bc9mr18614776d50.25.1781033796505;
        Tue, 09 Jun 2026 12:36:36 -0700 (PDT)
Received: from x1e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-660d5f89271sm11272768d50.8.2026.06.09.12.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:36:36 -0700 (PDT)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robert Baldyga <r.baldyga@samsung.com>,
        Michal Nazarewicz <mina86@mina86.com>, Felipe Balbi <balbi@kernel.org>
Cc: Tyler Baker <tyler.baker@oss.qualcomm.com>, stable@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: f_fs: initialize reset_work at allocation time
Date: Tue,  9 Jun 2026 15:36:34 -0400
Message-ID: <20260609193635.2284430-1-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9LfEf5IKkGglbSBtvDblHUIgpuGee8dl
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a286b45 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lHVxNFqqooF5E1-8HV4A:9 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE4MyBTYWx0ZWRfX6sRSICde7ZyD
 Wb/K8l3B+pISaHCDSg6x5guGUPA/yYNoNVN+RgnrMzfdaVQIysIR0pZFbl+QqIeG/QXnV1w3SCS
 ytMBgI6Vh97C5yczCIV+8+YEhquThJIKljylOmQ875GK976MluaNDtkL3FrX1Ba16wy87lnqoRV
 +O27D8ValoenSfxwwgFA1AdVrvUvs1lEJzCFTZ1cHN0iAQd7VC2gDEPKkqmASEQNUKbsPRqxCDv
 SQqaenonExe0nsI5Jm5WtzdmtISuLrDt7PFV+KHkqj7BJTmSviNAFYCXBDHutpQOtnXI6rRTd/J
 1GCgHuRfCK41p4TPEW7vxW52thPsdRpUAJlzbN6xOu3A3simfEgHUprxD1ZOHCreQyvzO0EwnDM
 Tb+pWvZQxuXktLEXaeHrRqs2y4YG2NLcMj8/ZDODZbTcPJ39JGnNfbYMz9NdD0hiMC7v/oIIByh
 6anlustCpFwSDv+5evw==
X-Proofpoint-GUID: 9LfEf5IKkGglbSBtvDblHUIgpuGee8dl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090183

ffs_fs_kill_sb() unconditionally calls cancel_work_sync() on
ffs->reset_work when a functionfs instance is unmounted:

	ffs_data_reset(ffs);
	cancel_work_sync(&ffs->reset_work);

However ffs->reset_work is only ever initialized via INIT_WORK() in
ffs_func_set_alt() and ffs_func_disable(), and only on the
FFS_DEACTIVATED path. That state is reached solely by ffs_data_closed()
when the instance is mounted with the "no_disconnect" option, so for the
common case (no "no_disconnect", or mounted and unmounted without ever
being deactivated) reset_work is never initialized.

ffs_data_new() allocates the ffs_data with kzalloc_obj() and does not
initialize reset_work, and ffs_data_reset()/ffs_data_clear() do not touch
it either, so reset_work.func is left NULL. cancel_work_sync() on such a
work then trips the WARN_ON(!work->func) guard in __flush_work():

  WARNING: kernel/workqueue.c:4301 at __flush_work+0x330/0x360, CPU#3: umount
  Call trace:
   __flush_work
   cancel_work_sync
   ffs_fs_kill_sb [usb_f_fs]
   deactivate_locked_super
   deactivate_super
   cleanup_mnt
   __cleanup_mnt
   task_work_run
   exit_to_user_mode_loop
   el0_svc

On older kernels cancel_work_sync() on a zero-initialized work struct was
a silent no-op, which hid the missing initialization.

Initialize reset_work once in ffs_data_new() so it is always valid for
the lifetime of the ffs_data, and drop the now-redundant INIT_WORK()
calls from the two deactivation paths.

Fixes: 18d6b32fca38 ("usb: gadget: f_fs: add "no_disconnect" mode")
Cc: stable@vger.kernel.org
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/usb/gadget/function/f_fs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 75912ce6ab55..1ee21e29ef73 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -288,6 +288,7 @@ static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_data);
 static void ffs_release_dev(struct ffs_dev *ffs_dev);
 static int ffs_ready(struct ffs_data *ffs);
 static void ffs_closed(struct ffs_data *ffs);
+static void ffs_reset_work(struct work_struct *work);
 
 /* Misc helper functions ****************************************************/
 
@@ -2221,6 +2222,7 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
 	init_waitqueue_head(&ffs->ev.waitq);
 	init_waitqueue_head(&ffs->wait);
 	init_completion(&ffs->ep0req_completion);
+	INIT_WORK(&ffs->reset_work, ffs_reset_work);
 
 	/* XXX REVISIT need to update it in some places, or do we? */
 	ffs->ev.can_stall = 1;
@@ -3775,7 +3777,6 @@ static int ffs_func_set_alt(struct usb_function *f,
 	if (ffs->state == FFS_DEACTIVATED) {
 		ffs->state = FFS_CLOSING;
 		spin_unlock_irqrestore(&ffs->eps_lock, flags);
-		INIT_WORK(&ffs->reset_work, ffs_reset_work);
 		schedule_work(&ffs->reset_work);
 		return -ENODEV;
 	}
@@ -3806,7 +3807,6 @@ static void ffs_func_disable(struct usb_function *f)
 	if (ffs->state == FFS_DEACTIVATED) {
 		ffs->state = FFS_CLOSING;
 		spin_unlock_irqrestore(&ffs->eps_lock, flags);
-		INIT_WORK(&ffs->reset_work, ffs_reset_work);
 		schedule_work(&ffs->reset_work);
 		return;
 	}
-- 
2.43.0

