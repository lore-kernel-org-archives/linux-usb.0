Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4624C3C1D75
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340613; cv=none; b=Iy8s2c7JvD68okcmhKznY+2Qa784AoRKIwpsT41URjXd2NrfB3R1rDo6PIeis62uMpxxCu054pss8bBwOPIYHGLuenzq1QDv13yexAOCddDNI8IN/Yh60beIVL0Wmsl3tcNwcXdQ6p5UwMP+iIKKHZlg4N/LHGUCXGb4RkfBwlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340613; c=relaxed/simple;
	bh=XPiHzgaXxAnyUIRIHjYGmAY2Ced7CR0KAgupaKtx+8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G4ywTKQQDL4CCQrx7n7756Xcl+ycGZki0+C+9t+jbsT7Mz0eEIcYJYh5ZuSw4jxgjnpGS4jJ2gKJwjIQmYqBeVimNMzR2Yxo0hzMumNWwwtAacFHnPcdvP4SVfgXuHx1yphnA8CZya0mf8YZkD3K2ZK2DY8+ttoL5Bae4SQ5B+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q33vLtqg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C/2j/xbV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q33vLtqg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C/2j/xbV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2wEr1962580
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 15:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9d9AqXXZx92sskE8A2y6Kf2T/twB3A5A+kR
	XspgQuiA=; b=Q33vLtqgW62ye58kCFqHgchOpUOydmYOk9Y8asMMQOSzMYblMx2
	v1ENwO/kBr8YCHIU2WA3qFIYpzJCDCp1NE3nr/k2UX0CH5j6G0uLiZ+jX//IgHxG
	sJqcAx+6G60Wt0qepkvUuFcObydVrJVZ9Foi6oMMBJE4zdCEq5OYfqtNAblFxFgP
	XdiYJbAeOz8X1/vCIAr51M/mxNuRBniDto69BY8HW002sTsGeIQPlL3HF3G3KlX0
	1anqVVQ4wIaMDkv9OxRyJQGnTCJ80iLgupFhfPuQzBAbNXQ+cIOieI8CrIVZUwJs
	CweAhKUOz8FR67jfQ96BXL1Pt5lIFWSItDA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgy919a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 15:56:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso1375333a12.0
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 08:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340611; x=1785945411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9d9AqXXZx92sskE8A2y6Kf2T/twB3A5A+kRXspgQuiA=;
        b=C/2j/xbVhlb2kfdK0xfqQuLY8OU/WEH04ACPB0BopsOZ3iZoMATJKVW6TtZL7NvJXi
         y8WsCs3dACZumDFy+dTBT3MPFcNx+VqaUnFYI39/AdrGKSS+VucKusoiorosQRIcyWFN
         i4d+TdUmRij5J9q2OcDGwIEFHy5So+3ceQxL+uHD+lkQknhJvYRwO3Kb1xyP95Rhwg9e
         kSa4EVCXXEpVnR45mVXe03DgzD2uT++4IJfvdjWSkvh0pRCUPuLbb1rlKz4KQurLFv7d
         E04bI7vzEOvgdFdejYbqFvZbiuqR43pWZaF6fKTSqOhPhqxXEzjQ8SYJ3YQCzTT4CtyO
         OpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340611; x=1785945411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9d9AqXXZx92sskE8A2y6Kf2T/twB3A5A+kRXspgQuiA=;
        b=CPEfqJe5oHiSvGwT11A7PSFPw5JTybm2+3jBhoB0cq4bACNHxTdwNsE40p4FJUrgl3
         BaTwTIFMjsHaofeFunFfNZQFnU7IZJx6J+r3C2IUbba/8FTXoPGUj6WQZ2KCg3FNV/7d
         uTfgBG+FD7oHJdIXgSDYnVi0ar2GXKWYRyKWBpCNsNIpa95zqxe92yhJhFHDUYLtcmjq
         m/XIe4set/3afLn9WtO+6hTFtjIh/VLtCcY5RMzzOC9E1N3bc8d+BUcRkcOGUOc1Hgpz
         TFPiEmyRP6qdfMj2Crugqn3iCl5dDmBzeTlkH2vKI+vm2+zSRqhfI12gORP27BzB1TuL
         E+yA==
X-Forwarded-Encrypted: i=1; AHgh+RpU+1gQerNlcjZ2/30Tf01lENwfjYZownxmVNjAc59KAuZGQZqmgkBmyOSE8Oi9IN2jZyaFFeiiWoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN+/CVmq7Y2k+N3zwBkj831N6ntPcxSaF/ip3LShUChhjONyyg
	4f2HXOaL4d/uJoz283QEtZBqWp7HDtlcOA371Nnbh8duAYgqQp2Oztr1/jYuEDbnaqvH7dUQ+Ia
	CAH53LNeUSApFSWf0fDXJfE2xh0cvGxQOTHoKUHOHjm64UIu9f39u4jP7EwUX03I=
X-Gm-Gg: AR+sD11+WHRrvBb9B3ag0XD7rOcbvkJ2S7zVTZ9hMTElfJmZI4J1auNLNWDRMTvtApM
	YB8TST7y4dlsvajpVC/aBL1QatXutSHK5kfjJtjSuSnjduRMXrzLMlTNvh9sA/7VDNg4+KD3Gnj
	yamaCIk50xQbt1GU+L/tz6EgCK/UekEWPw4AMg+dnlSe1G7Lyt1hun/9i8XS7fadUGZjJLWLSS0
	uyR2LsnDAwtGqwnVuzPEj6c4vCTGpg4zt0wtwL6EyDbjgqGm1j1dOc0g+40y0MlRtOS+TQycb4N
	jgP55FVFUkgnRpRdi3tplBceAmEeuzZw6vlxXxqCLhMq32Q5ft2GVTt88XCJpEZvQ/OYRVqqkBj
	N45zpaOUTZetsptg1wSE2q29J85N5yy2EVH76g/EbXg0MZW8=
X-Received: by 2002:a05:6a21:339f:b0:3c3:6b6e:8ba0 with SMTP id adf61e73a8af0-3c8aaf815b1mr8876578637.11.1785340610959;
        Wed, 29 Jul 2026 08:56:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:339f:b0:3c3:6b6e:8ba0 with SMTP id adf61e73a8af0-3c8aaf815b1mr8876539637.11.1785340610566;
        Wed, 29 Jul 2026 08:56:50 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba35196esm1174015a12.17.2026.07.29.08.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:56:50 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hsin-Te Yuan <yuanhsinte@chromium.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linux-usb@vger.kernel.org (open list:USB TYPEC CLASS),
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Pooja Katiyar <pooja.katiyar@intel.com>, Sean Paul <sean@poorly.run>,
        Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v7 00/17] drm/msm: A couple lazy-vm fixes
Date: Wed, 29 Jul 2026 08:55:37 -0700
Message-ID: <20260729155609.20190-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfXz5yYvNofTpnx
 j3X+xUvsQ3Mq8kjzXr3i5plkB3LLBtn+/R+H5pgtqz0L+nbFhkSP957ERr4P+kFiRlRTHmkMH/r
 fzpIQ+MDkqDVxYhDcQ7dQzCO+fJKjnw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX9rnFKc2SrG3N
 adh5bmnq7fJdQzvLKnJRrwr0IOt0GTmw6mnEszRHN7pAfdZmUqJSxGF4CT/r3+L5DvGlfDEI4zr
 tfd6FrkIYdYhRRWn+YVrzSQeB7MdDQtDz5af9g9DuEMppAFmODjtXwqV8GyVrf7R30hO3MRvH14
 Magwk33iQIB7Wq3AgaRS5FPgD91jYXGR5pn4zUx1xC8WGbMpqed8jxvd8yfzFmdGf4VY8OwsZ2C
 C3gzd0bxNqV5hIodbNl281F+5pzSRqRE76qjOVeW5F3C++8foPLPl0g6xzRaiMV4ZFUoRq0uHCM
 VfcoTtko5b6vipQ5EBKyn+gPzLyDSQuKxRZfY5Q5Dt1xNjcS3/jOmE0Vc3rs7+nGg59iXLEBi+G
 7cH0QxjEOj7vPrGY7ANOwIcHcrcsJYR89xZlPxBzNiu6EycvcBY9WRnu3jsc3mxA7fcaHsjJTqZ
 PjU5hg/ms9JAu8vYtrA==
X-Authority-Analysis: v=2.4 cv=LtKiDHdc c=1 sm=1 tr=0 ts=6a6a22c3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bzYy7Z1X7KArDtV8Qg8A:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: n8pTKDmlO5P5jxpDI6uD6xtAM20v-AnP
X-Proofpoint-ORIG-GUID: n8pTKDmlO5P5jxpDI6uD6xtAM20v-AnP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290127

The VM is created lazily to give userspace a chance to opt-in to
VM_BIND.  But Sashiko noticed a couple paths that were not handling
this properly.  Or at least that is how this series started out.

Rob Clark (17):
  drm/msm: Fix barriers accessing ctx vm
  drm/msm: Rework queuelock
  drm/msm: Synchronize VM creation on ctxlock
  drm/msm: Synchronize set_sysprof on ctxlock
  drm/msm: Move nr_cmds initialization
  drm/msm: Remove redundant SIZE_MAX check
  drm/msm/a6xx: Access VM directly in submit path
  drm/msm: Add helper to check for per-process pgtables VM
  drm/msm/gem: Fix dma_buf import error paths
  drm/msm/gem: Remove useless locking in GEM import
  drm/msm/gem: Extract bookkeeping init helper
  drm/msm/gem: Set resv before exposing obj
  drm/msm/gem: Validate lazy VM in GEM_NEW
  drm/msm: Allow lazy VM creation to fail
  drm/msm: Don't fallback to shared VM for VM_BIND
  drm/msm: Fix per-process-pgtables check
  drm/msm: Fixup invalid overflow check

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 17 ++++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 26 ++++---
 drivers/gpu/drm/msm/msm_fb.c             |  4 +-
 drivers/gpu/drm/msm/msm_gem.c            | 94 ++++++++++++++----------
 drivers/gpu/drm/msm/msm_gem.h            |  5 +-
 drivers/gpu/drm/msm/msm_gem_prime.c      |  2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c     | 31 ++++----
 drivers/gpu/drm/msm/msm_gem_vma.c        | 12 ++-
 drivers/gpu/drm/msm/msm_gpu.c            |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h            |  4 +-
 drivers/gpu/drm/msm/msm_submitqueue.c    | 24 +++---
 14 files changed, 131 insertions(+), 96 deletions(-)

-- 
2.55.0

