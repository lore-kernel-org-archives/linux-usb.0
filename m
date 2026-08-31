Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2313AFB18
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 03:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145317; cv=none; b=MQ2zyhGbjiIhW7JeHGZLw8d4msRw9AU4IIN6hjiu85Am6WsrspaIQQCZzDIBPN9HG9ky4DUWgxsH7X9+HWpqRMxACrA2CE4I7Ouhs65W3bKG2nCJIuumPCXJiIP3ODdrzqA5ChsuFd0g8NCnsygyhhU4EYfHqlQTRLUe+IjB/8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145317; c=relaxed/simple;
	bh=nAVPYtVkkmUPMPzolZ4GiQCytUZdX/k5v26r2I/PRq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CFxZ5mk+Pmp9AD/lj82qdHgFYV2pNWjdPi1spgVPylXwP3EOTHJiGMKF2eBztHvW4aOb8bh4dHPbL8zHY4Tk4HKeCAyXm6aeB7tPKeZWSoHOTBrgSUbajBEObWhIBQZHOHzt05n8N0W8wHKYrQ/vIvqnQ9cLPPloCSuWfDddFbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cX6iZ+rG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cM9fi3aK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cX6iZ+rG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cM9fi3aK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bM1U1496266
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 03:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8XJcp3X4Tby
	0WLraLkWLYA7pOP6v/I2LJsWbNkpbmuQ=; b=cX6iZ+rGEUcVwB++UydCp7M+0Zs
	UMHVIDWsgObvKAZ/r2jm7t2Vv5cR0SiFx3V5wHatefqeQR5PVKdwKDrsy3pTq+FS
	fqbtyQFnydbjGDl0h7kG1DesWuFvdrZqAfWeO4PJuqxRhKoJMAV2Djez5ujD0/+b
	JoaZw6dygO1ilT8jhOh6cs26NgdJpSH/0DWmZSafDV2YtcXBAltabDe+lCSwO0M6
	oqO65qXSbW4CJeEWOlqKZCUzbXNWJnCYMUBHGKRqxphoyPY92oHMj/tOcn9P9DBa
	GL7RHn4ORlJ4g2sT+/5BlcKvjNgoQfCFgkm4+9IfjhPUo6DUschzLwFW1BA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq844me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 03:01:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396901263b6so4702282a91.2
        for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 20:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788145314; x=1788750114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XJcp3X4Tby0WLraLkWLYA7pOP6v/I2LJsWbNkpbmuQ=;
        b=cM9fi3aK1jH95ldNgz2ySPb/ei2yY8cV/tl1cqQLsHUotqd8MZYy454Bp1+fSh0oqw
         YmjiysR784oVMNB+f/+e6yEYWB23243vuPvtmjXY4O1Eh2mBtSiLa6/UxgJ9Uo+iFKGQ
         aFaqi16nrbnz8JLrnbh1zYtuiqkB0Oel55Hr36XH8TxXgB5NrBukaQvVuQy5f6wViLi+
         6F7whlKZaDosGAhO250Tuo2gSQhX987ad+KNiuV88tHEYnHUgVXYE/zq1VQvC2gM+oZl
         LwG03UwM9O+WxXJjvAmQbKSVDOww1eXjfXVazTnrMo9ydkh7y8By1gUTMKti2gm+yd64
         1Fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788145314; x=1788750114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XJcp3X4Tby0WLraLkWLYA7pOP6v/I2LJsWbNkpbmuQ=;
        b=O36ZJ7M+NNYwVXkWDnEZ+vqKOOTleCT5hLQjXhenfqe2yfSIjhOX5jHnCSF1CDiIu7
         KULvPsWoAi4lnXgnmE3wb8T9MyhU/bDqhuqzTeDdby9fPfVQPCHS7YRGVQtMP3wkEK84
         T5D+Zbd0MzjNNUKDi9qy109/Kthn927wyMAsYdWBpRICC+w1FmsLdJzpCxht6BTupAMb
         5F2WCFD1M6fHm7fIhunIluwtmA5D4prXOSNeMq5px12YHyKOx/MjANvyg5y/rKo9J8ED
         wr1mLEKYDsNyvoCDTZw0e4qf2q5ZKdhK3UAkhSR5jua6TE+wq4Z8Nh8wwaFW+8yzMoNj
         1gzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNP8wiGyAw5aKW82VK48D2eTWj8aCyRvd5eZ8n03RL8oEHFI8oMCYA64msSXvwVV/K24eTpafaQCE=@vger.kernel.org
X-Gm-Message-State: AFuF++n5Lkjf/kSuOBZitbZVu5+dYp8hv053ptmy4uHgYa0zpWlOFmla
	babrsGVgC2HmEWUNS62vx40kQlCRBkNGFCit4LaZOHM+ClVtdiS/4aNlHD0jtZMSXOguYFmQBRx
	4tmoKLYqvHWC3OxHZfMThAr5T0odVXwaX0egYFzrtFevX/597nVtbRC6rucETnxI=
X-Gm-Gg: AYBFou0cGgNOsE0yE5dpLmmpcBF1OdkAXGPDO1Mr+hyjcTIRHiwYuNlsxswwq8DhPF2
	u0BftD/LhUEkQL1edFbnZ6mhpOHUkYjrXpq032nMgw7YMS8LQCosqYnN8vT3B3iP0n8ChzQXltU
	JnOilwX+B13jXRU+M47c+9pFeFQ5OnIeytT4R0Z4Stzd7j3AcbE3MJvCO/rKKJsd0xIQ8e7UWZy
	tL1sJlQeWAIxpKwqHQug7CyxKk4S77kD0pdqRbxEKfOi4847NnEWJzFMqDurqlJZMQTvFcmTC3b
	1njuPlwGsVNqnc8i1goPjJlT9oxHDajkCzNhXiagTzMVelJSlgZawx6z9qxkJfTMuEmtOEmDGgm
	VKcqxfpNkjhe+Itrc6MPMltZ4FduZhg5CglduvraarbrNN3ldBixNRA==
X-Received: by 2002:a17:90b:2f10:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-398f845feb8mr607837a91.13.1788145314302;
        Sun, 30 Aug 2026 20:01:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2f10:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-398f845feb8mr607780a91.13.1788145313824;
        Sun, 30 Aug 2026 20:01:53 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm30011973eec.9.2026.08.30.20.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:01:53 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v7 5/8] usb: misc: qcom_eud: improve enable_store API
Date: Sun, 30 Aug 2026 20:01:44 -0700
Message-Id: <20260831030147.1500616-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: t4nDppiudx2Tum7BBWXS5u-tWrx16N4S
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX0dqy9IbEvaFS
 Ig6hcXpYV4AdsLLmzEG6rD4L7QuLDlZV0HeUUA2wtgawbATldYTrVj/jYM5DhoW/Jx2tXUIfKMW
 IknicPsYTMOz+g4obK+S674VGJ3usso=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfXwQc4ISYOfCsv
 NgX58Ja6uHDj6uiM4poOkZ+DH/sBobueemwHd02zvRPiKWqZa1dCXmMQF5V57YDsoBQAs+QbLmn
 VqxKIp5Ce/RPkNn5XGZVSkUuHKzuy3KC9yntH7b3suxltlxvV3o8jY+1t9hSk1hu4JmtjcwSvPN
 SvSUUnJY01f7jYLkk8//IQJMBxg3bC6s4p3wrvYPpLi0ihvLHwjVGg214vM2pcwYF2QedxM2qCq
 90CZDwErIdJ4lkWe42LzjQpQnrsC5m23W+41iz+glQ1mdJbmNM+3C4FL7/y7C+xlScgA7fMwgvG
 XswZ9jdsmFIYat3QkrPs7xGnXi6IPhWgQWSUmQz4uzKcKkEJGLbMR5vvD8Z363ggA84iAtR70Yz
 zuFvllvM8ECsmhBDBNNMOWtenoa9vOwy3+nmtXRu+Z1QdO8OPrPs1rRQr7aN3eBbsqU6gpC6BqC
 B9dzf6WLEQnZf1bZzvg==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a94eea2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: t4nDppiudx2Tum7BBWXS5u-tWrx16N4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310024

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 45c90d9f3b1f..07522225a8f8 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -162,18 +162,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1

