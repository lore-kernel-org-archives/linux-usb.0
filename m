Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFD63F1075
	for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 22:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253597; cv=none; b=VzTwEDrfqOOyFguxeJVkFo2C8o6MDjxkpnkYRw5KgV5H9RJCmRzxs6x/AighnT4pkOIzxFpfFB2NUp/mS6HhtQ5ivsgZD2DzTgZm5Z98YwuC826cqVG3NTeCPyBvw5oV51dkO0WJ8tD1M0aFKS5Pyt/VFpNaB4ha333jazgECqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253597; c=relaxed/simple;
	bh=rzM7FDp46PONIU3FuZdRnR6emc1m2RW++R52letOKIE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U86qgrH44FSrwNV7Uq4AvyElsbYUDQEdGhZy8gd9ui6tBepbvYnUKVxqUigL6hrynAzMjt0o6JhZJcn5gmzkK9nCdnqg9Ml6T2y6LKySUyFzWw6GhpMpbKodg2S1d0apHmULFKgxY+UTs/pjDnYvxJ9xYxhfuF/X/1yNAZb62E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a650BmU+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Coc0jq0C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a650BmU+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Coc0jq0C"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CLnWqP3673012
	for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 22:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y9biAXn7ssv
	b5YgyKLJsEP0aTZIozodH3BSXfrvWTnw=; b=a650BmU+K9WLJgRcW2DgzwEKaY+
	RfG1z7xTXtfzL6gya+09Led+VFjt37ZE7fjjlAQofCMIAVuKDP6wXwHiVAwQ6fVg
	1n94cDldCb2SEAA62CO4VP5mXzYTJ2X2Pw8khs55aroKyJNOdT9JpKFbBtVPxbDU
	xjG8Wr3kW+CTiPJ9NUPBNE2nz0+cpr70GIvBwNUCEo0+5LH3vKD/mUQzV1gkfi6L
	WXcTvrMsIDNr+B/LHYlSB1qTBdnEAHmp16Rg3bjzv/Sbm8gpWarN7ofUO1z0YYuh
	JWT3LX+afLEAqIJjEoGVHN6sKZGAeIsyOg5eywUKwgf1qJ+G7Cq7VoFB4tA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd236q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 22:53:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1a439db36so1792840a12.2
        for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 15:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253593; x=1789858393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9biAXn7ssvb5YgyKLJsEP0aTZIozodH3BSXfrvWTnw=;
        b=Coc0jq0CgEQO0HH6zi8XZSex9XuZfB6PQ0GntZLeGlVPfgiEKBWkzaaMurhlkKQTz8
         hleQJmbM45IBb2v3YTIeYY3BnNNKVrUA0MrcQwr1wJec2JKIRBteFN8jtxSkjucVD6Ni
         rtKNBkFnfvvaCtxUC/ebHiD+P8s+nDdxLvlI6XnlDZVRYL/1iKiTIGNkXhCLJr7kEnmo
         vOk2jy21laMZ3cqtja6t1DadKFkM5CqVbKtgX6WexDbuZbvMbtlViV4iX2ALsCG8kAj+
         y5a7SWFbWsbFmEnP7F7uH8QAmsORQBAgWMLBwQERMtWXv129dMb2+zAQ0T4FXxgZoF5V
         SfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253593; x=1789858393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y9biAXn7ssvb5YgyKLJsEP0aTZIozodH3BSXfrvWTnw=;
        b=g3Dlby605e8R9Js2lxu1Fa0zWqGIhi1p3EH0RCK5+cXcIj01i3bvi8vow5gErsBY17
         6uh5LZJdnNt8yvC6ADS0eE6bEL/ZXrqTO6TQTD86bQd4dkGqpnj9iPCUiKx4eH7VQAbu
         vIRAzYIjYJxh+H449eFVH/wfMl1iMWyrzw+w/ZEi9bG61i937HqFpPNSwjd+/n5waYL/
         jNXzPjlTC7pxTYH9kQ/zX5ebUljSHF9OnQoeEwLra49G/SYH3y/hDy9ihXWJFwxm/Lv/
         fQJT/P0SWYxYNgCva4sqfMnT4gJYGvwEl0tqvVFxU92YqVCY1/V1eXWl4vqWlgM4vM7f
         hA9A==
X-Forwarded-Encrypted: i=1; AKwUvBzdaqIvh5RifbOq4xu8rEQ0Z6cJvKJ43v9xWyiPj5jNm8opTnsAfG0eGAnu68oqtcsOjQyiJj7LUJU=@vger.kernel.org
X-Gm-Message-State: AFuF++mh03V5iuEWoVauaQm8cj2RbgHhuxsJ3E22K4b3SJ9TMTfSFByp
	kYzWdLr/Kx0iJCRJN2KFIkwvza0YRg6nfrGpxKoV1PijecJ45yPVliDqT7/CZxNFmZE3GdE2ew0
	caJzCDOHLLEBfYwtSqqdgKHHcYgEg5yte6x9Yq9kO3gyg23RIP/r6RjdOfHFkS2s=
X-Gm-Gg: AYBFou0juoUA8x7f7ydG4p0q2rLSfLsTFKumZ9wCu9OYW1GGQqpgtcZTHwL3B+5iPbr
	pyKcLC+h4kN97qXVlJWAmEaPN+68CZmJc6WW+uZFQbY7VQgbQ95PyvtyZ/ze7vui+ha7RGO2eXf
	qoCPwArcBICeSNwrB0knrVv2KURpy7ZBIrYoXhbc5crxcREa0Vsl3Ur+1ltZnu23q/AjhaUajV7
	3khlPyxi5xj7QgCedoVilVp9g1/DnuW8gwaCCarTUF7Q+W188voncYIEj0UMUWUGfRzuI22h7hU
	7+LvmL+PTP0AvSRMfv3DFIg4aVvuGT5NglI6jFw6Dnexzbg969unmJFKwQJOrqRU/sV+Ld9mzk3
	1pr+ECplc53pWIjTmvqIOfkmb9+38b2bBw/te0UYkUHd86i/GRcgEXg==
X-Received: by 2002:a17:902:d492:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2dd2a1d8c55mr172889555ad.2.1789253593605;
        Sat, 12 Sep 2026 15:53:13 -0700 (PDT)
X-Received: by 2002:a17:902:d492:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2dd2a1d8c55mr172889245ad.2.1789253593104;
        Sat, 12 Sep 2026 15:53:13 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:12 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v8 7/8] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Sat, 12 Sep 2026 15:53:00 -0700
Message-Id: <20260912225301.3396556-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa5d7da cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=dOwNoGVJVf10FbPJOZQA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX+igDflydRs6B
 2fyV1HkgKYab04Q3n+Vbnv3ddtqhdonmnopt+59yQQE/oJY2Gqnb3QSLDT7hZuw2V3dHaVp997A
 EZrLR3KMF2M4MZPAQjeliTrkL+SsxNV6pFAOr4f8HVIDfpfKZnAZxVbLL9WDH3nHYuKObVbJdJ2
 Z0zlzYhO790CVYOUuO4+4yTdqzf+aAZPqCSiP8gRy3M+uNKxsEKVsbVSoVTw1FO4UOFCtyK+Fu8
 KC1vc98AH6J+DPzCM7eZPgq8PuJ4ZPFZlYgidvubDpsy/hVzwnSUiHeIsVpCJVQAcXkeKKyiQ07
 qmXvA6CiHOLLZVeZk062lDkRcod/vmPllQp+gbVqwLHukL3qichHXubr9+39TKi5DEOkCZ0hTbd
 JmAdbm03gd1DrFOmiS2PVvEQPHx7jMQ2yF7Os3DIPUAt9G79fPAuda/poiSPM8PZxnr1RUrZKLR
 RedimwdtHyGgMb7f25g==
X-Proofpoint-ORIG-GUID: CPrgEn4uj18ncocUU77aoV2o-zKXQKqa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfXxKazXfFGupnF
 aviuyECK4sUOH6/8jJVfnVDHFwxpLMAwDI506bSddIHZk/bIjTGE06E5rBet0kreTBkF1piNz5n
 nKTB5Z+rMdpU+ah951Lx6K/MONHmyJk=
X-Proofpoint-GUID: CPrgEn4uj18ncocUU77aoV2o-zKXQKqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120334

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 353c45dfd328..669e2e00dd7b 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -313,10 +313,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	if (!chip->enabled || path->curr_role != USB_ROLE_DEVICE)
 		goto out;
 
+	/*
+	 * EUD virtual attach/detach event handling for low power debugging:
+	 *
+	 * When EUD is enabled in debug mode, the device remains physically
+	 * connected to the PC throughout the debug session, keeping the USB
+	 * controller active. This prevents testing of low power scenarios that
+	 * require USB disconnection.
+	 *
+	 * EUD solves this by providing virtual USB attach/detach events while
+	 * maintaining the physical connection. These events are triggered from
+	 * the Host PC via the enumerated EUD control interface and delivered
+	 * to the EUD driver as interrupts.
+	 *
+	 * These notifications are forwarded to the USB controller through role
+	 * switch framework.
+	 */
 	if (chip->usb_attached)
 		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
-- 
2.34.1

