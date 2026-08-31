Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCF936E46C
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 03:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145319; cv=none; b=n5AumOlVTwf6cVivH4w/RlqN0DriFHD4BhkE4ObcQJ5w8VmrgnmO0MrrVXfRhZgGF32VV4mkVWbAnhMbQTOHelKzQSwVUxvmiWyAw1WvJDCFXirqgiLuvdXKnp7QHhBljf2bH/8i5socBLN0gmZOlKM1JhmdfA4Eko1U3VXQC3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145319; c=relaxed/simple;
	bh=Msj1DOVWipO41oW51gTwfsyr27KLZriNHjyoIbm6njM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dSCHO2uwULSTt2w+bPHfryNvrfWLwIxl8dr6WwMJHe8l7ko5YK78I13MXQslSeGuiMiaen8Srg4dPl4xG/eHOJpeRIqPJ/kqSR7TBMIY5E80aeUdBdOc47z13jvmXQTCqLTbJKUZR1UdUYU4fhzx/MsYcBzucy/XozvLBxiw+Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Imt6HGc0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwzn0Jb8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Imt6HGc0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwzn0Jb8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bWHq1621754
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 03:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oEsuGii2+Ra
	6CMzyXnbZHPQh8RNg3JuatHxegyg2aPI=; b=Imt6HGc0AG/UqhSQQCuDFCb+NGD
	HBD0cwRhzfBgGiXJxy3XorwadI/1p7vQgC/Re4ZIF/Om3++JVL11Ss2D5A2XurE4
	pGjyZaX1cB2vVZL3GCCQfs+E16dP1wkJO3IjVu6JRfK4fNwl5p/vggKuVpwqgCbr
	FqInYKZG1juGu8kd1qLu/KUwb504ApKNaheWivhX4zcrH6ixWfx6lQoOMJwjdBK7
	8nJlUxWQr0Fm/yaAQQBPplmG3Af4PsTgsIeZmJwK/qMOSfOyWZiX9P1AlckSgyC/
	WnlrdjJbdxEvNkIszYulVUMcQz3VRJTnbTV28B9SV+K8x1pgDnuk76JB41Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dv6nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 03:01:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3950b1371a7so4709877a91.2
        for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 20:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788145316; x=1788750116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEsuGii2+Ra6CMzyXnbZHPQh8RNg3JuatHxegyg2aPI=;
        b=iwzn0Jb8Px2K9rqul8CJHlGHfrS5zZ77FTUfLhfUEJBo1Gqw5tfnUj1Ygw7KEO1md3
         Unx3VpCGLOFp1UVdiXvC8n5ty1uRCd+vcxxxtqNYkt8K4dGwzVv1dNf11bXnZKo4eJ2l
         0xkY3rXs1XzPi+OUU9UV37jpk2WrXrxfhtR4txK4gKhFiz4evqGs2nK3+eAmlnluXouR
         ZZ0HcYZAUF207WVpfEwTc7nHQfoZGxG2s/Wd/cQh43NoYahPqfdW9L0wWge+N1tUcfPC
         PtucdCLzc1Hm4sbZTO3Wpy8Ay+Gp5WSM4gBGWu31TqVvcEwLJdu6gHGO6n9PSj02lg8P
         VGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788145316; x=1788750116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oEsuGii2+Ra6CMzyXnbZHPQh8RNg3JuatHxegyg2aPI=;
        b=DHJ9ngSIZO5Ek7sqX9KLzcBoh8X9Ue+yvCUNARNsUyJQ5pdh2BTGi0ZcBBaN4bdIgD
         HZ/mR47Nd51roshjy4ttfDAXF6UqagB/zXCTz3FuFSJN09PChAs33YICnQRrawLoxprg
         thbzUJqxCvkRnZPltCT/YybxevCAO0m6qWcIpb1a5P7vaga6xFxXMvI7kzL3PH/UQkzH
         zvAWjbSXmHK/wlpbA6EqLUhoWe3TYx4RUnT+PE4s9G/81O9hqmlIUPiIOmwQfTP1TFQ3
         Q1LIsNUB1MhZrzq6s2fdBV9TeEgW3+80Hq7UTfWeWAxZdyZ7QFnRguroJ3h1dAvNWnro
         Gpsg==
X-Forwarded-Encrypted: i=1; AKwUvBzoSfKzRgBCLsyeXXdVb1lxA6rV+omBEwk+7l99Wu7Me5KGF/4c6bsYiFKVDuL9x9ZC15OheRyxKic=@vger.kernel.org
X-Gm-Message-State: AFuF++ndBDBQsBabRBNzzAtWtU7xGe9hT51AnYRVUNOwDkqY7lafQbGl
	p5IkWlsvYM7vF/pMj5RyvJd8Y6IUUD3LLQitKNV1D1JR95Vu2JNGaJfgB3W7Eol8DErMOZ+S82H
	bX1pMc7W8j3jo82PCTjsGGuvXqEDVV4Qq80vQZiUtwIOqZM6XNpXrHPNPyx1CY+E=
X-Gm-Gg: AYBFou0jcc9Bg96e4wY7bUGB9SeYhZ4cVwtZMGXYUpnog7hUOYqGgGno9huahgOtxK4
	mYKoTQeae0M3T+Piag22dU/Askq5bgzgKtdqntqPoHeyHp0reyz2zQHKtWo81bOnXPwjpJO+/33
	BzbKVBpoeC51d0FI2wEHE0v+9OVfAnvVmCQS7KOCsZv3xgxkk/NsDpvL395hgueYU6hJ4e9eraF
	JIsAAN7Li+kZncya190h/Q8flyyZ4Z/lbhumckoEdkefFRxVxITszDqIwgOeLCViBfT38ToJg0R
	ZEEkgLoON5UQg9L9gVpL7ruhH2uveVvyGrCq7jPjryoP/DOJmDx51C9z82lq7cBUvddcYEBE9N4
	lTi1SKmdpZB6wb4tZwJrB4qesm+1PWuEY7R3r2d21cSER6ikah/mY5Q==
X-Received: by 2002:a17:90b:4c4c:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-396d0ebfb0amr33823025a91.11.1788145316466;
        Sun, 30 Aug 2026 20:01:56 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4c:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-396d0ebfb0amr33822975a91.11.1788145315996;
        Sun, 30 Aug 2026 20:01:55 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm30011973eec.9.2026.08.30.20.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:01:55 -0700 (PDT)
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
Subject: [PATCH v7 7/8] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Sun, 30 Aug 2026 20:01:46 -0700
Message-Id: <20260831030147.1500616-8-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX5rTYcrs6ozEz
 xI1yVbUyT7xLWpeRQZPEUfv5Tgew4CutkH5X3ZVrnhwdd/ivtMR0sniOgQ+1c9FdRUWVMrrszVj
 MQhKmJ22/PJqdaNsVmhl+2n6qdkGcUTquyyX7IS35M8WjgegQ639p31ZbbBtGMFYtoWHr8TQN+L
 2OdPJWfoizEPQRO8JX5hc4UvDoD+NLyTA6V3btmvFf8foWaFX7+w2pMvw6qRRdz4S1ynCPyWI6P
 cfIr9wH/8ZqZelBzmqoGS0LELyIxHWQf/DRrwk3/ON6YIl2tc7G2B2FxqTZcpujB83XKFG5R+5W
 JHcWfNO7bBpKqxK2sFBTbnc2VOnStSuiA9cGUB4PJT+tza1O3fFlSq+efIOGIHO3KLaCb1KNH4h
 d9VO2DfzvwdEAajOZRlrfohg7qVHwZ30pNLAdyNL46L8w2pKirLUatFZiuqpcwRjGTmfV+q6ACs
 6HYVv3Ow5grM7MqtLKA==
X-Proofpoint-GUID: Uuh8Wlb5lHXCuUTFy6LbKsEX3khRIvKy
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a94eea5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=oDIJ3hVRoRHbvujwG_AA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX3/QiJPuYaQvq
 tAOUqu5YSs0rBhXOVg/4BjHwzky8wWYv/gZHc0hgWqqGpkRCdfblgrfcI6LSGc5IX3B4UdgZ9Vq
 11WgKRTV5dgabxR43yF5iF9C8ecC8IY=
X-Proofpoint-ORIG-GUID: Uuh8Wlb5lHXCuUTFy6LbKsEX3khRIvKy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310024

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
index 549c0d852bbb..605f675ec7dd 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -306,10 +306,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 
 	path = chip->paths[chip->port_idx];
 
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

