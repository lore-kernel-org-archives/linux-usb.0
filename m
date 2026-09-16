Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490503AC0E9
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 04:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532907; cv=none; b=B+GECCnjEoQntbng62jeCYVJUZlFGr3PY3FEp8DCiazaZwege/9rGmUKh/SFDpHKpRMWs7Vorsz+T+8voeIS7fWfOnnbIc6NStJ5kWV6T8Tm5nL71VZRufFA+xIjIFLG8dfBYgiHgQ84W8gGVYuWokP/QjhPvkkYX4tEeeh3Wy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532907; c=relaxed/simple;
	bh=b44yWDJIlMnSJSDZNa3DSc0Dk2gY4xhqvuHMJA5XfEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OvD01KrBIxeTJtTaiggUlc1Otv6scPm8SxPZKTcPxbToluxfgOgJfRG6Z6K8TjdIZq4s6A145C1mY155iU0eQGJnMvrFuC1eOiK7eXx4ArFHnBXip0jwc89YVyBkk2+Fkb77WnlK3ePGwTNNCz9ro9G5gxH8hk+M2R9gzy5mxhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cn/82xWJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Acd1x8mc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cn/82xWJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Acd1x8mc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FM39Y51932211
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 04:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=w13e55CcmdNW+giKZHMFFVQwwPPrIweJDmR
	EGBgqOIA=; b=Cn/82xWJC9ZY5SPWHp73+m4uFgZclVvkfAceo6MNWOy7Hkz1nKW
	VJH4g4NPJ74qqS/h3jWacH74Kk6aheGeu5yX+Ud1OqYffPGSpbmGqfXsEGSjry/h
	P5mdg0fKTh/erlCIaBwkaseW8DwrzeVapV378HVnIqtF0pLHtmKu14GcUlzc0S1O
	eh1MqngK2I51x/luYIvsIPMiFqLp8ncA6nYjwG0ymCDkz3aeUvHnv/STvX+Bvckf
	sUXfFV+blTQwEIOhW6jN7c1s7PhYuq1cAhMLIGMWTdK4PzHgQ6NZxdwPON3sRzSp
	29QX76PLrZ478lLMTyvac0OWl8ImzYwWCnA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefp95rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 04:28:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc489e7a701so7457920a12.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 21:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789532905; x=1790137705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w13e55CcmdNW+giKZHMFFVQwwPPrIweJDmREGBgqOIA=;
        b=Acd1x8mcPj4TDPbD0J0+70/duJilOAq6/afkFKUfdCTWPJed7Xa/UhJlsejtZXdIhZ
         YUZ+C6dfM4wmM0liDff1AUvFW07G5NMZC3WsXmf5/0nUrz5sZpmxQbr6k/6jw+wUkrn0
         MMDzXFbLL3cAodq8zmX3zXtNBfj5ZxdfeQ7EOO8zn6QjraHSzJumYWo1Yp6DrfT0Icx7
         Dl/coYSzzEAMkyxBW1x36JIZ0RtG6Uzr7O/xeRe81IXCqJEJRLcM3X8LNW0B2aGuoGTq
         D24y1q3tSF5oKQ8eObeZM/phQsez+kQ8xCCLh+LLearSAtiMUFvpHPf8BIUKRot0SPAz
         hJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532905; x=1790137705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w13e55CcmdNW+giKZHMFFVQwwPPrIweJDmREGBgqOIA=;
        b=IUby9fPCW+EwT3fFkkJRTOv6dMk9bLAY3q7p/poqjoI8IYNrzBBZEqxo8HgbkQmnko
         +vVeOb7q34+UeoOr7KfKraXwxkTu8rerQItXJoZrl4m01zxdkszM9vUtx6KjRdnE/Kd7
         767xwZTqoSdsLeyHB9SpkkwaTHVYYclXgsRRAXe+K5WzUgZV+nvivBAN2k2wUo5tsOgd
         SfxZF4LsCfb9eD8G/zxN2QldGXJT0NeiEB8KTAwYuMPhRRlItltfOH9K0WvM/LVHq7Ad
         d5ik3JY7p5TW/oT9jq5Z52TzTdLKw2NxDmnMVjlmv3m/BM9Lc72fdjzG0SsU5goBev03
         m0sA==
X-Gm-Message-State: AFuF++n/sZAMEdgwVqfbvWhU8gpCxsf+2REZ3/wEDlkytQVtDU/9lT+y
	54hfSDXuuuvmJvcOMwaF/eBO38DIOHy0eV9f1nML12ayF+QcGOACBjR3Gwrkz4C/egGqcGbuHS3
	ou6VnoD+YmtQ+X062jBhes9XUVCNWw7oo3HiBudSSm9RpwEDq/JE4yOmNuj0K6KM=
X-Gm-Gg: AYBFou2RXKB2u1/XxfggK7n3m/qQ6GAqepS1u9FwH0fxTOFzggM5O700LCRsMdoC0HX
	W6MQAnuhMztr194qpHvG9FEsh9gytkwuLjY+wSngzgWLeKJldOV+Ek1z5kZWi7mpKDHwSswFMI/
	Pw4NBvRuqAc+FAdpQgVNcFhfYBbDYIm2xmUav6D6LuFX8XAwT/8Rhx5hC5VKaq4MvcgJcS4uqkz
	P6hF24mXLpVqz9TNwJQFzjTONXZj9tCddMy8oOw/Dv9gUP8L8wsQVC3XhXAFTrKA//RpFr9fumf
	KMqePFBPzuAfjxpu172KYjK8DayCAf59ThwC+h79OmK16KZtufSqGfY2WeHAYZAOrvKAQH5uXqC
	uKH/hQhWK4BYGoYZiyZSVn0nuI0Ak
X-Received: by 2002:a05:6a20:d10f:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3dd5f72b353mr2962494637.21.1789532904724;
        Tue, 15 Sep 2026 21:28:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:d10f:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3dd5f72b353mr2962457637.21.1789532904296;
        Tue, 15 Sep 2026 21:28:24 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad6b9dsm3643105eec.21.2026.09.15.21.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:28:23 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Get the connector fwnode based on reg value
Date: Wed, 16 Sep 2026 09:58:08 +0530
Message-Id: <20260916042808.2879079-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA1NCBTYWx0ZWRfXwHwdper4ifdX
 HmUa+EfIC/58pwUiBjoQrSkqAjYgGGdgkWgjP4sm/7B9QdjEx4XcxKuBgUnyUr0CYOtHmcawKv/
 fWIJaBr6qwyVVnlz26/2AATECsoN/9s=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa1ae9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=KtO3Uq3HwnMQzyJ4:21 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B9IpDpKWNnwCR4r9QlsA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 1YQWo-r_qWbqNDKZgeLPXPqinqu37ojD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA1NCBTYWx0ZWRfX8COO5LE0Wo2Q
 3GbKqJi7/UB7s74SmKS5XX7m1A+Vcqe3BtStEHck3UD0I/9eQPHPVqv6iJJx/Jt4J37T+itnjsf
 va6UIGCvqqx+hzUXaJJr1ZfvzFKbHiJqJvvHJuo12lfCay+68dVwMFG9usg50MH4yN5i+IkGHjT
 dxAZicm7HITssWbTpGdH5uMvjMyCOHFYgx9AIXepk9J16KOW+rI/6p7Dv6LNe9pP86xt+2Gno8d
 k0AsmzlEzaWZ/zoVEKPwQe6HgoGibpCb3jY05eXY4RTEoTsOZ1+nwyeI/voHpFVsa0KggA9/RHm
 kBYfulltMyRTF8WyvwhDrrMtw5Qe9CDG78gJ/BVGoCEomT5NImFDIAbQIBT4unAXraEPeL5RB0v
 ycbi/w4T1BpQeY8BuOSvgsVKYwlpI463vo3tpSalVB5k/3CcVOFV9rH4TjheIFdXcMz6BM9vM43
 3rlugIC8aeM5cuASGPg==
X-Proofpoint-GUID: 1YQWo-r_qWbqNDKZgeLPXPqinqu37ojD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160054

ucsi_find_fwnode() currently maps UCSI connectors to Device tree
connector nodes based on the order in which connector child nodes
are described in DT.

This can fail because the ordering of child nodes isn't guaranteed
in Device-tree. For example, DTB may contain connector@1 before
connector@0, causing connector numbers to be associated with the wrong
fwnode. As a result, role switch and Type-C notifications can be
delivered to the wrong remote endpoints.

Fix this by using the "reg" property of each connector to match
its corresponding fwnode. While at it, if the reg property isn't
present, then fall back to the old method.

Fixes: c1b0bc2dabfa ("usb: typec: Add support for UCSI interface")
Cc: stable@vger.kernel.org
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bef3f9b71d71..c1450639c795 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1801,10 +1801,21 @@ static struct fwnode_handle *ucsi_find_fwnode(struct ucsi_connector *con)
 {
 	struct fwnode_handle *fwnode;
 	int i = 1;
+	int ret;
+	u32 port;
 
-	device_for_each_child_node(con->ucsi->dev, fwnode)
-		if (i++ == con->num)
-			return fwnode;
+	device_for_each_child_node(con->ucsi->dev, fwnode) {
+		ret = fwnode_property_read_u32(fwnode, "reg", &port);
+		if (ret < 0) {
+			if (i == con->num)
+				return fwnode;
+		} else {
+			if (port == con->num - 1)
+				return fwnode;
+		}
+
+		i++;
+	}
 	return NULL;
 }
 
-- 
2.34.1

